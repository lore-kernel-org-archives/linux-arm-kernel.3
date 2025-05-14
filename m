Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF467C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=An4/G8IyR5zczajLSLE48BcXq+SdoujNgPdRSq3otg4=; b=j4fPb0Wjj6L1+rgS90OyhyJzvi
	fexNm0DccGhy/SvltVB4SRLoiZoi7MQ0guoaciS4+81IQmzcl2uWBrF1n77aes9oqh3VvXepM6Hda
	+S/bbT6PGV2/Sq1KkhAxf/JD/YX4szXnUYoxhHmY3Bi0R+lKNCITieqjNfKcHhe4/CNpFIV1ECV9n
	9d9o01ocxtYyxZdD3WXpR5aorepiDNHEujOnzFaKy3s8DFDDoT7XBYruf5YbuUIW0YgPztfRBa4yr
	hZ2IeKbJj2vXHqNtHlWBKsaEuf5f03LcI8Bygu9uCnDJYCpJNN+j4BwmXWpLKvRkwuEGVsL6/wLye
	hH1koFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGCE-0000000Fv1f-1uHQ;
	Wed, 14 May 2025 17:47:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEpt-0000000FjBO-0NOh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:20:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13A5D150C;
	Wed, 14 May 2025 09:19:49 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F07143F63F;
	Wed, 14 May 2025 09:19:58 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 0/3] coresight: prevent deactivate active config while enabling the config
Date: Wed, 14 May 2025 17:19:48 +0100
Message-Id: <20250514161951.3427590-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_092001_442900_9BDC997B 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

While enable active config via cscfg_csdev_enable_active_config(),
active config could be deactivated via configfs' sysfs interface.
This could make UAF issue in below scenario:

CPU0                                          CPU1
(sysfs enable)                                load module
                                              cscfg_load_config_sets()
                                              activate config. // sysfs
                                              (sys_active_cnt == 1)
...
cscfg_csdev_enable_active_config()
lock(csdev->cscfg_csdev_lock)
// here load config activate by CPU1
unlock(csdev->cscfg_csdev_lock)

                                              deactivate config // sysfs
                                              (sys_activec_cnt == 0)
                                              cscfg_unload_config_sets()
                                              unload module

// access to config_desc which freed
// while unloading module.
cfs_csdev_enable_config

To address this,
  Patch #1 fix missing disable config when etm4 device is disabled via sysfs
  Patch #2 holding cscfg_csdev_lock while removing config from cscfg_csdsev_list
  Patch #3 add wrapper to prevent deactivation of config whlie enabling it

Patch History
==============
From v5 to v6:
  - add fixes tag.
  - using guard for locking.
  - https://lore.kernel.org/all/20250513170622.3071637-1-yeoreum.yun@arm.com/

From v4 to v5
  - separate patch set (from Leo Yan)
  - https://lore.kernel.org/all/20250324191740.64964-1-yeoreum.yun@arm.com/


Yeoreum Yun (3):
  coresight/etm4: fix missing disable active config
  coresight: holding cscfg_csdev_lock while removing cscfg from csdev
  coresight: prevent deactivate active config while enabling the config

 .../hwtracing/coresight/coresight-config.h    |  2 +-
 .../coresight/coresight-etm4x-core.c          |  3 ++
 .../hwtracing/coresight/coresight-syscfg.c    | 51 +++++++++++++------
 3 files changed, 40 insertions(+), 16 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}



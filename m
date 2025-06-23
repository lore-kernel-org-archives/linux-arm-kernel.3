Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A39C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=stMJ8knmYHXoJiZLCfyjOHrenPpno4hNCS3kMmM4bMk=; b=PToICvRMPe160thLVlPAyt8owB
	dRniiGo8twJG9V2dyEaH4r+X4Azewl9XwVCA8G6UNbM55ZCrz0EoSvIc423uANrHat9PcUX3kEg+T
	QvIBZhC5q4WPfOCq+A3QqGCc4g33Z5AzC/VxptV4uJK6L5Dggjpl3kTkUoAR1oF3sotq24G/KMt6v
	xrEGKDiiW2XuC051D3LH4HfrxXT4j8FO1Ftye57QxVvS5lcODt+3BA2dvAm8ZpA/rJhgtiWmp5us5
	t1ygm9JLoXjYdBp5Os/xpk3ZG4+/nIqM6rFgdLfHmRn8l4iMJ+AhoSIok4xNDRHELkVUGOhkSGUUf
	hrq6Cm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlev-00000003etT-0K3Z;
	Mon, 23 Jun 2025 18:12:45 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiM4-000000035d4-1J7m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:41:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bQrPr0Tj7z2QTxc;
	Mon, 23 Jun 2025 22:41:52 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 396F2140276;
	Mon, 23 Jun 2025 22:40:57 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemo100006.china.huawei.com (7.202.195.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Jun 2025 22:40:56 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <jonathan.cameron@huawei.com>
Subject: [PATCH v6 0/2] PM / devfreq: Add HiSilicon uncore frequency scaling driver
Date: Mon, 23 Jun 2025 22:33:59 +0800
Message-ID: <20250623143401.4095045-1-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074104_782218_EE65F785 
X-CRM114-Status: GOOD (  14.87  )
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
Cc: zhanjie9@hisilicon.com, yubowen8@huawei.com, zhenglifeng1@huawei.com, linux-pm@vger.kernel.org, liwei728@huawei.com, linuxarm@huawei.com, lihuisong@huawei.com, prime.zeng@hisilicon.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the HiSilicon uncore frequency scaling driver for Kunpeng SoCs based on
the devfreq framework.  The uncore domain contains shared computing
resources, including system interconnects and L3 cache.  The uncore
frequency significantly impacts the system-wide performance as well as
power consumption.  This driver adds support for runtime management of
uncore frequency from kernel and userspace.  The main function includes
setting and getting frequencies, changing frequency scaling policies, and
querying the list of CPUs whose performance is significantly related to
this uncore frequency domain, etc.  The driver communicates with a platform
controller through an ACPI PCC mailbox to take the actual actions of
frequency scaling.

Changelog:

v6:
Consolidate hisi_uncore_init_pcc_chan() related stuff:
- Move devm_mutex_init() to hisi_uncore_init_pcc_chan()
- Move devm_add_action_or_reset() into hisi_uncore_request_pcc_chan()

v5:
https://lore.kernel.org/all/20250619151456.3328624-1-zhanjie9@hisilicon.com/
- Comment more on error code related stuff about
  hisi_uncore_mark_related_cpus(), and return failure early on errors
  except for -EINVAL, which indicates possibly broken firmware.
- Separate error prints apart for two cases in hisi_platform_gov_handler()
- Make the 'related_cpus' sysfs ABI description more generic
- Some coding style cleanups and typo fixes

v4:
https://lore.kernel.org/linux-pm/20250530081722.280776-1-zhanjie9@hisilicon.com/
- Allow devfreq core to accept device-specific sysfs ABIs
- Replace custom sysfs attrs with dev_groups and let the devfreq core
  manage it
- Update 'related_cpus' description in the devfreq ABI doc
- Remove COMPILE_TEST in Kconfig as the mailbox_client.h doesn't support
  this yet
- Replace dev_err() with dev_err_probe() during drv->probe()
- Replace mutex_init() with devm_mutex_init() to warn on UAF
- Replace uncore->dev with dev in some places to make code a bit shorter
- Remove redundant uncore->pchan check in hisi_uncore_free_pcc_chan()
- Use __free() to let compiler release temporary memory
- Clean up the error handling and redundant 'status = 0' in
  hisi_uncore_send_cmd()
- Some coding style cleanup

v3:
https://lore.kernel.org/linux-pm/20250522031701.1912458-1-zhanjie9@hisilicon.com/
- Remove redundant resource freeing processes when drv->probe() fails as
  they're already handled by devm

v2:
https://lore.kernel.org/linux-pm/20250520074120.4187096-1-zhanjie9@hisilicon.com/
- Make devm manage the release sequence, remove drv->remove()
- Warn on !uncore or !uncore->pchan as they're no longer expected
- Remove ioremap of pcc shared memory because it's done by the pcc driver
- Fix compiler warning of discarding 'const'
- Minor trivial coding style changes

v1:
https://lore.kernel.org/linux-pm/20250506021434.944386-1-zhanjie9@hisilicon.com/

Jie Zhan (2):
  PM / devfreq: Allow devfreq driver to add custom sysfs ABIs
  PM / devfreq: Add HiSilicon uncore frequency scaling driver

 Documentation/ABI/testing/sysfs-class-devfreq |   9 +
 drivers/devfreq/Kconfig                       |  11 +
 drivers/devfreq/Makefile                      |   1 +
 drivers/devfreq/devfreq.c                     |   1 +
 drivers/devfreq/hisi_uncore_freq.c            | 658 ++++++++++++++++++
 include/linux/devfreq.h                       |   4 +
 6 files changed, 684 insertions(+)
 create mode 100644 drivers/devfreq/hisi_uncore_freq.c

-- 
2.33.0



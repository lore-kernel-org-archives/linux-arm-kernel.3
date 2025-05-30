Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5762AC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+EM1KEBoFYjGTuiyxHL+/7bfRgDF8EabMtwpprw3R8=; b=MkHyxMDc0jMESzy6QvAoaAV1CH
	409H7SIKtZCtJ7tnqO9wieVRvaybdTwvX0LJFrWnrkYEtgSdNXRwZap75csG6yIG+NoRpq6vA2Cxj
	/vvtsEK8jQBytFsHDone3XDECJc8tLBbgXv1+ii2PTuGbOVCbExqCQ06R8NdXI2NxUmLvO5nw+UGs
	NK40CRAhCg116tgp9Xl9uOoRi0D/laFXWAu3gBCNMDHqlcJMwJ0p3dfPkThT87pgstRHBjATiQrVW
	0uzqbq6Vp/TaWua8Q5HhWyxJFhkIuuGSHUVFgU6AmfWsXdLnJ5nDfjwXXjWMoWzxVyE3F/jv1FjCR
	cLaL5HHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKv9F-000000000eL-1C68;
	Fri, 30 May 2025 08:31:29 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKv2V-0000000Hap1-45z5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 08:24:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4b7x872SpTz2RVsB;
	Fri, 30 May 2025 16:23:19 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 2DDB91A016C;
	Fri, 30 May 2025 16:24:23 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemo100006.china.huawei.com (7.202.195.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 16:24:22 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>
Subject: [PATCH v4 0/2] PM / devfreq: Add HiSilicon uncore frequency scaling driver
Date: Fri, 30 May 2025 16:17:20 +0800
Message-ID: <20250530081722.280776-1-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_012432_316479_F71C6163 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: zhanjie9@hisilicon.com, yubowen8@huawei.com, linux-pm@vger.kernel.org, zhenglifeng1@huawei.com, liwei728@huawei.com, linuxarm@huawei.com, lihuisong@huawei.com, prime.zeng@hisilicon.com, jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org
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

v4:
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
 drivers/devfreq/hisi_uncore_freq.c            | 656 ++++++++++++++++++
 include/linux/devfreq.h                       |   4 +
 6 files changed, 682 insertions(+)
 create mode 100644 drivers/devfreq/hisi_uncore_freq.c

-- 
2.33.0



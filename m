Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7284EC3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9r10H+kN2LupL1eAXPiBLXpYYSitYyyJWUAIbZc/ouQ=; b=I8IU1WZDWZ1KtDPssGBl0z4VqM
	zwAj0IqtdIaCMQLaFefZLesXKYD2WVrIQyE74X121VcvJeDQHtoVliARVt4dFvnYwmli5nPI5+2N5
	CHdl+GlDzKTzosjIgIdm/7eQ4r8oJQw8yvB5rooCWg0XJDlhRnYV5w3+EmhQlxAWwhHczYeNhQt4q
	bFhgGdR7xTAr3yZ4Li/eCwy6wNL7A6gbHp8Qi3OXA2UKEDFzj0t3E2+03zEa6fAQ9m9lC4sC/wFzU
	gs5GKU+ai2O1wLuqN7Rt5pyNZ5ULqGIqZBdwpFhRGGbDyUSrYZWjUJ+M3eV3BFSEfGdxcUOOr1D6I
	lygEq9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETV8-00000009bii-3HXQ;
	Mon, 12 May 2025 13:47:26 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESue-00000009UU7-3T7l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 13:09:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Zx0Fq4YbyzyVMM;
	Mon, 12 May 2025 21:05:19 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 5ADB5140276;
	Mon, 12 May 2025 21:09:37 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 12 May 2025 21:09:37 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 12 May 2025 21:09:36 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<dianders@chromium.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v2 0/2] Update the watchdog period according to real CPU frequency
Date: Mon, 12 May 2025 21:09:17 +0800
Message-ID: <20250512130919.23915-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_060945_019486_C4DD8E96 
X-CRM114-Status: UNSURE (   8.25  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

watchdog perf needs architecture to provide method for converting the watchdog
thresh to counter period. For arm64 we're using the max CPU frequency for
doing the conversion which is from cpufreq driver. But some cpufreq driver
are registered lately, for example cppc_cpufreq will be registered at late
initcall which is after the initialization of watchdog perf (initialized in
armv8_pmuv3 of device initcall). In such case the period of watchdog will not
be accurate enough. Fix this by registering a cpufreq notifier and update the
watchdog period once the cpufreq driver is initialized.

Change since v1:
- Handle the theoretical race condition and other comments from Doug, thanks
Link: https://lore.kernel.org/all/20250307021811.46981-1-yangyicong@huawei.com/

Yicong Yang (2):
  watchdog/perf: Provide function for adjusting the event period
  arm64/watchdog_hld: Add a cpufreq notifier for update watchdog thresh

 arch/arm64/kernel/watchdog_hld.c | 58 ++++++++++++++++++++++++++++++++
 include/linux/nmi.h              |  2 ++
 kernel/watchdog_perf.c           | 23 +++++++++++++
 3 files changed, 83 insertions(+)

-- 
2.24.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88086C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 02:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RwtXUnQwcyYRw9GdUt7n+q2Pr23vZGyPqjLwuPaVZ3s=; b=Wr2FW4q4lH6CqQavytgn9bE21x
	OUK5PTgV/9CvXxardbyr8O0wiiCgrpCqtKgYNYr+vK1LQEG74afpSQFTgSJlneRsO8lXCaXnfPFbD
	vuNwcxikMnf6d7Ydzn9ED0EnBkcqemZcOgecq1fkNTcyDarjS9bIAUW9FT+RyKMA+pPT6iQyHykto
	M68mjb6ZMcSU9n1xs11WqmXA9eVZT9NzmpYIbFKUsywcwGetx5Z1NfnsF1LMueaSdvX810xa94sdx
	enVHKg2wIF0DPLlLFhk6CmCpC2jmymyOcsCRHay0vUxLW8k7+pI1kC3YTo7zTNTvwkEIgso9b/W05
	UuSV9HKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqNJp-0000000CtQu-1KNA;
	Fri, 07 Mar 2025 02:20:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqNIB-0000000Ct5U-2j7g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 02:18:29 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Z88xD0nfJzvWrq;
	Fri,  7 Mar 2025 10:14:24 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B7B8140257;
	Fri,  7 Mar 2025 10:18:12 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 7 Mar 2025 10:18:11 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<dianders@chromium.org>, <sumit.garg@linaro.org>, <kernelfans@gmail.com>,
	<lecopzer.chen@mediatek.com>, <tglx@linutronix.de>, <song@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH 0/2] Update the watchdog period according to real CPU frequency
Date: Fri, 7 Mar 2025 10:18:09 +0800
Message-ID: <20250307021811.46981-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_181827_893835_F92A75C2 
X-CRM114-Status: UNSURE (   8.35  )
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

Yicong Yang (2):
  watchdog/perf: Provide function for adjusting the event period
  arm64/watchdog_hld: Add a cpufreq notifier for update watchdog thresh

 arch/arm64/kernel/watchdog_hld.c | 34 ++++++++++++++++++++++++++++++++
 include/linux/nmi.h              |  2 ++
 kernel/watchdog_perf.c           | 21 ++++++++++++++++++++
 3 files changed, 57 insertions(+)

-- 
2.24.0



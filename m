Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8584FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 03:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AVEOvp4QrbQb1+blys2k1JR6ZMKIFmrzgdGtuIgGcFQ=; b=ckEPz/94vUSjk7x7FLFbuqTQCn
	9TcCvG9z/vvy1HVM2BDUjtD6CH6nGJrsw/N9hqVFUcU8DSENo9v0Cx72Zk1HfoHPnyhlIkdy38DKW
	jyA3exfOHirrv5zP5p5v6ex83Ct6KtFUrkib9qL95x1Dmqk3O5L+5zDXCXvolDt0rcJFOLe5iZ6MI
	mAsjtlhB4QRMvjnubi4LflBFCHeh5gk6o7/YpCKWlw27ZsNstYHyRcDqdi0BeKJvk5mP96n150T3x
	X5wpa1j/gIRnb4j2BAS/mBrzdfdVQOJtay/GxmNo9gOqEV9bmN4dKvQdPUvkEo3TEU0VXvxGb5K9O
	b/CVT40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6vZ-00000004Tee-3eSF;
	Mon, 30 Dec 2024 03:58:49 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6uQ-00000004TYL-1AfN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 03:57:40 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id AFJ00117;
        Mon, 30 Dec 2024 11:57:17 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201619.home.langchao.com (10.100.2.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Dec 2024 11:57:18 +0800
Received: from localhost.localdomain (10.94.16.130) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Dec 2024 11:57:17 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <marcan@marcan.st>, <sven@svenpeter.dev>, <alyssa@rosenzweig.io>,
	<rafael@kernel.org>, <viresh.kumar@linaro.org>, <maz@kernel.org>
CC: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Charles Han
	<hanchunchao@inspur.com>
Subject: [PATCH] cpufreq: apple-soc: Fix possible null-ptr-deref for cpufreq_cpu_get_raw()
Date: Mon, 30 Dec 2024 11:57:14 +0800
Message-ID: <20241230035714.72780-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.16.130]
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 20241230115717440586d573f96243b0e71ad65467fa0e
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_195738_624897_F0F49BE9 
X-CRM114-Status: GOOD (  10.12  )
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

cpufreq_cpu_get_raw() may return NULL if the cpu is not in
policy->cpus cpu mask and it will cause null pointer dereference.
But this returned value in apple_soc_cpufreq_get_rate() is not
checked. Add NULL check in apple_soc_cpufreq_get_rate(), to handle
kernel NULL pointer dereference error.

Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4dcacab9b4bf..1c6d81355b41 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -104,6 +104,9 @@ static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
 static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
 	struct apple_cpu_priv *priv = policy->driver_data;
 	struct cpufreq_frequency_table *p;
 	unsigned int pstate;
-- 
2.31.1



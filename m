Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF52CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 03:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vKQDyIqON71tqGHwtM14GRZInKm8rV7IMf2eudX48bQ=; b=Ujvw5CtJ55jwOrxz1XqqcZgLcY
	msghqcOWIZQeVyXz9gnMlHw2qKGPspQTYiZmZitR5KU82JTcuusaJtrpK+nZMyX8A9naks5ZFiL9W
	wqZT7kEBkoygw9TgG0fVCfHrqOX/sZ8BKupWdUH1D/VP+7qY/y18tcccoQQZDlaAd/0jikZxhXWo1
	NpzcBl+xbKNth6mekMhoA3R8dsUvFLREOQO1bWnMXVU0B6NMb7VweZNphj62kYiMD/GXhZ44ONAhK
	DSEVdkx19jhnO1CZ8Tjagqas4bbGWNk1RUMj6JLRI4IIcR09QnyhT4Tb3zTmTH3NREQJngv+Ackbk
	fvbjNBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcERj-000000075vR-3H4W;
	Wed, 24 Jun 2026 03:38:39 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcERg-000000075ux-0fII
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 03:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vK
	QDyIqON71tqGHwtM14GRZInKm8rV7IMf2eudX48bQ=; b=a+Hzj8U3KaEAZUvVQ7
	w8dQPCYHc0D32wMXUPHBW7ThJhkQ5dHoopkPkfMmUmVHfjV14sWgfa6T5vtHKIPo
	NgGHyBxHuUEdtuJQuvSrbPjGipYR1FguEZNYFLmDt7Sj+76wp7j6N0gYKqsUBh0U
	aXYlQlCUJw+DTvWLeYfHD+igc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXGiYVUTtq3F9PDw--.36777S2;
	Wed, 24 Jun 2026 11:37:59 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH v2] cpufreq: apple-soc: Fix OPP table cleanup
Date: Wed, 24 Jun 2026 11:37:56 +0800
Message-Id: <20260624033756.2702021-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgBXGiYVUTtq3F9PDw--.36777S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFy3tF4DZw43XFyxKryfZwb_yoW8Kw4UpF
	W5WFZ09rn5tF1ktws5JF4j93W7tw1kGrW2gay7GwsavwnFvF1qqa48GFy7uF95Cr95JFy3
	Cryrta47Zay8J3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRNTm3UUUUU=
X-Originating-IP: [240e:604:311:e68d:6832:a84c:abe2:7179]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RfCMWo7URfnnAAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_203836_583606_9221CAF7 
X-CRM114-Status: GOOD (  10.38  )
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

dev_pm_opp_of_add_table() adds the DT OPP table but not all failure
paths remove it. The driver also uses dev_pm_opp_remove_all_dynamic(),
which is not the right cleanup helper for OPPs loaded from firmware.

Remove the DT OPP table with dev_pm_opp_of_remove_table() on init
failure paths and from apple_soc_cpufreq_exit().

Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
 - Remove unnecessary cleanup calls.
 - Remove OPP table from apple_soc_cpufreq_exit(). Thanks, Viresh!
---
 drivers/cpufreq/apple-soc-cpufreq.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 638e5bf72185..977d56fc4fa0 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -258,7 +258,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	ret = apple_soc_cpufreq_find_cluster(policy, &reg_base, &info);
 	if (ret) {
 		dev_err(cpu_dev, "%s: failed to get cluster info: %d\n", __func__, ret);
-		return ret;
+		goto out_remove_opp_table;
 	}
 
 	ret = dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
@@ -271,13 +271,13 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	if (ret <= 0) {
 		dev_dbg(cpu_dev, "OPP table is not ready, deferring probe\n");
 		ret = -EPROBE_DEFER;
-		goto out_free_opp;
+		goto out_iounmap;
 	}
 
 	priv = kzalloc_obj(*priv);
 	if (!priv) {
 		ret = -ENOMEM;
-		goto out_free_opp;
+		goto out_iounmap;
 	}
 
 	ret = dev_pm_opp_init_cpufreq_table(cpu_dev, &freq_table);
@@ -320,10 +320,10 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
 out_free_priv:
 	kfree(priv);
-out_free_opp:
-	dev_pm_opp_remove_all_dynamic(cpu_dev);
 out_iounmap:
 	iounmap(reg_base);
+out_remove_opp_table:
+	dev_pm_opp_of_remove_table(cpu_dev);
 	return ret;
 }
 
@@ -332,7 +332,7 @@ static void apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
 	struct apple_cpu_priv *priv = policy->driver_data;
 
 	dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
-	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
+	dev_pm_opp_of_remove_table(priv->cpu_dev);
 	iounmap(priv->reg_base);
 	kfree(priv);
 }
-- 
2.25.1



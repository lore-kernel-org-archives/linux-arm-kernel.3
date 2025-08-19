Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C5BCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ceXQjJPZTjxdNgGeYxtuRD2GWkq7Nnr+y3XAJ3hERGc=; b=NDJEdonDHwqCbpq9JeSQWcYlO5
	cSZcO6VZ2+2mkXE5Dy5jmR8bQMC65BiESUaRYQF+iyksfisrw/KB/ksSrlcZFZrLeTlI4qTcAUupU
	OH7vAFn3kMdQAidPhOY/xa82xoFfuRWLteqVEad9a2Ktj4fwCQtKMEk/lmoa9tMQ4yuN+/BIWqOC2
	eaRb3ZKeH+A6ni10vcBIAPB1nNXXdkpDIfIE0UTa4XjnwjQDhKpduMzN7/oD1rq3T1BwFkbtwZaM/
	pfV3EKFign12CnFKkEr/KBGFGB896SLrGqMEkO9KRQOqD0Oz0mV16RAwtJNtbllsMkPO0q4Eud535
	pq9p0/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoM7B-0000000AXr3-2lTX;
	Tue, 19 Aug 2025 13:11:01 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKPx-0000000AGCs-0fUG;
	Tue, 19 Aug 2025 11:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755602528; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U6mim+bj1DPuhw+mUqGMsaZIBQpViqTSNcsjW1k6mqrfip4/xz6tmvNEQXvmYGNbJvqjTteqkAzG6YYe7EeJ0oACJlg74QyOpfFR7l4ZfpHi99ajVjtoEFPWctPdogxJozHkLjMFZUmFTbHjSdlhZng8eyXxCFzP3ZtrgUpkrV4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755602528; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ceXQjJPZTjxdNgGeYxtuRD2GWkq7Nnr+y3XAJ3hERGc=; 
	b=HC7BT6cLRtDpd8eAZva6lW6GmtfitIRgWkQeiPJPieDlCfug/rb0qHZhYVtuGo7g+GKJ6BbZTrWimf4EibVubG916ezXPzUCgWNqskaz8grP6OH0ay4/haiMdhkvXMrbcxjI+By9qHdK9KNsJZXJzhg/NG8suwzjS2vMuE9ZDCQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755602528;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=ceXQjJPZTjxdNgGeYxtuRD2GWkq7Nnr+y3XAJ3hERGc=;
	b=gE6XjuLLjtBAdC9wso2XRrgBBJPvPoiTOGKbmiXrft0GnskTx2C7+qwqJBka5JYc
	hmEq7sbQII8WQYi5zhED0HNLNv2U8YPakBzPl8kLLi4PMq1fa3XZMnL7E9r7HUajJ6S
	Ch8QUiN5vNk+KYe3Zgs+fXHTPFFo6cqBVq6pEnPQ=
Received: by mx.zohomail.com with SMTPS id 1755602526685939.769654379773;
	Tue, 19 Aug 2025 04:22:06 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 19 Aug 2025 13:21:42 +0200
Subject: [PATCH] cpufreq: mediatek-hw: don't use error path on NULL fdvfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mt8196-cpufreq-fix-v1-1-adb60a3082dc@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEVepGgC/zWMwQrDIBBEf0X23AUVTNr8SsnB2rXdgyZVUwIh/
 94loZeBN8y8DSoVpgqD2qDQlytPWcBcFIS3zy9CfgqD1dbpq7lhapIdhnmJhT4YeUXdO9eH4C1
 FA3KcC0l9SO/jyTJdxN3OEh6+EoYpJW6DyrQ2/Pth3PcfO849wJUAAAA=
X-Change-ID: 20250819-mt8196-cpufreq-fix-07557cca2ef1
To: Dan Carpenter <dan.carpenter@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, 
 AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_042217_262418_3B532EEA 
X-CRM114-Status: GOOD (  13.18  )
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

The IS_ERR_OR_NULL check for priv->fdvfs is inappropriate, and should be
an IS_ERR check instead, as a NULL value here would propagate it to
PTR_ERR.

In practice, there is no problem here, as devm_of_iomap cannot return
NULL in any circumstance. However, it causes a Smatch static checker
warning.

Fix the warning by changing the check from IS_ERR_OR_NULL to IS_ERR.

Fixes: 32e0d669f3ac ("cpufreq: mediatek-hw: Add support for MT8196")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-pm/aKQubSEXH1TXQpnR@stanley.mountain/
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index e4eadce6f937ceff51b34d22da83c51b4e9aa813..fce5aa5ceea033bb70537ad9280e9ee02e3671cc 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -72,7 +72,7 @@ static const struct mtk_cpufreq_variant cpufreq_mtk_base_variant = {
 static int mtk_cpufreq_hw_mt8196_init(struct mtk_cpufreq_priv *priv)
 {
 	priv->fdvfs = devm_of_iomap(priv->dev, priv->dev->of_node, 0, NULL);
-	if (IS_ERR_OR_NULL(priv->fdvfs))
+	if (IS_ERR(priv->fdvfs))
 		return dev_err_probe(priv->dev, PTR_ERR(priv->fdvfs),
 				     "failed to get fdvfs iomem\n");
 

---
base-commit: 73df59e80dc7cab098b4581b89459d18f8410c7d
change-id: 20250819-mt8196-cpufreq-fix-07557cca2ef1

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>



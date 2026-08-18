Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701F8C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzuMCHMKvuxEPrAWeMjjV6JtCJc5WiZUqLAolKM2wTE=; b=zoq6WP/dGzcN6fgVgGCVvWLk/m
	Ih7t93G6IkN/ZvNvm3LmGuy7ClZ5IypwNbA1smk8XYxG4nYLKgXl4hvbq/NUkqnjwNmKCu4FUrrx3
	1zXHqYNB5QOeJ/yQ+KkmFghitqxK03dSBSFPuIq6XoZZUdNtqAR40qj7ilm7ab9O+Y/gLPbkRvOk6
	42NlWoADNldAtkGDMDLOae7xP2SS1iEqmtDU5zkh7PItcA9TH80NiW4z66jmkQ31leARIgwvprwM3
	6+azIsnQQ93ZP7ia/nk+0X+VKTet4SRVDTBx4Uia5wVRfwIYTfJYZRHXzHGAaqa4XIRXQYbypJk9k
	iGO33Abg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwO9r-00000008TmJ-3UyF;
	Tue, 18 Aug 2026 18:03:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwO9r-00000008Tlz-04yY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 18:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5792243D6A;
	Tue, 18 Aug 2026 18:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3635BC2BCFD;
	Tue, 18 Aug 2026 18:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787076210;
	bh=iVE93AHtrSa/DARsSeiqxqogPT0/RXz7YvzEV5meZKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fS7uw0oOIpHWZXMSwzMVepwMtN04OPaOjd0+JHsRj0BbvxpymmcrJlRqbF0iUOs+a
	 HgFtsbsUp1Km+q1HBmReiYsFd0bjrySNXzmG19L74voGCIDQNY8QxbA5CfdBa+Uqec
	 swSVfuXNHDYJ4EesQrVFzYSmhmrsVUdPQ5PXoUwvQq/ZsMDXt1M9UWrdLLRlq4/Vz9
	 MLouqe4+A5lnkDPiGLs3iMPf9LKmUoWo+msWUSFLpkSiFmny/jCtWJcKg6UAlrcbSM
	 5VIda18UB92nHvPO9faXR/u+mdZjgUsI1/uktm8WcGPdidq11PGlSrn5LK1p/fbT3/
	 LtoseB/2esOZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF45C5DF81;
	Tue, 18 Aug 2026 18:03:30 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Date: Tue, 18 Aug 2026 19:03:18 +0100
Subject: [PATCH v3 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt
 compatible data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-for-next-lucky7-watchdog-v3-2-2912bd122c57@member.fsf.org>
References: <20260818-for-next-lucky7-watchdog-v3-0-2912bd122c57@member.fsf.org>
In-Reply-To: <20260818-for-next-lucky7-watchdog-v3-0-2912bd122c57@member.fsf.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=hF1hTKAa3Af2BP1y4rV71oo3r+CdBS8fUgCThTjSOzY=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhJ5qTJMrIxLzrhlg5Hr5EOOKKjXSpIqZOslww
 WIKL/RnbuGJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoSeagAKCRBJJwGyxHrX
 6zz2D/4sFnKJvYdx9lx9yScTwO5Wsd1quMKX5dzjpm1fXALYRYvzLuTMr++ry8vUrxs4wqiopXX
 sQQRiew5Kaxg5qVKZkhzhcdicJqTwJPp+ev9yC0JMXA0BLMkHyA0XDMYTCSxXKsumAOr1ss7CjW
 fQhJHIxl8iOrpOwov4W7KqXiNEeZLlAI0Xt89A8Zkvdh5kXcCHGtOPMJQMrcP6JiLPMQbRlndIl
 XEcoLvFJ5Tqbv2hq/J9vqkUvIO8jVCeuZHcERaYB/a+frnRBJdtTNjww/QPbvwZ2xWnJh92Ggce
 yF37z5G35pFVmAdMDVtR7BLz4xXT41EN4cKi5BtNUD07Ym90FzFkFo1zc8e1v5ktCSdL0+5bIji
 YxZvHdk+IU/UL8viIpAIuzHEZycIK8Yojlcet7RLHIczBKhKn4u+z3CzSc0TCm68pB2JXbiCO/2
 BIFV9d2WuI0ADcHGs7fpVwNPR+PkUEMBAM+8jOVp6B+IG730GqQSxOuRdDoywfv/lzaDEOIfSiy
 KFtlU9n3i71RuucMBQkDtplTajTYNLq0edD56uG2AzAASwm6zW2k9FRevH+Xbt+fbIwwqXfhGDc
 qIhdD9rWEtXbciDklEaPcF1wE8wG/vkAMjpXg0qvXURZRMtEL1kkLoMh9lnC5mqK4c6qPC6YTHp
 QZmrLvurgP+WaWw==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Aiden Isik <aidenisik@member.fsf.org>

Add driver data for the Exynos5515 SoC's watchdog timer.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
 drivers/watchdog/s3c2410_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index e31f93db0509..5592f25fe6c8 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -232,6 +232,16 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynos5515 = {
+	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 24,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
+};
+
 static const struct s3c2410_wdt_variant drv_data_exynos7 = {
 	.disable_reg = EXYNOS5_WDT_DISABLE_REG_OFFSET,
 	.mask_reset_reg = EXYNOS5_WDT_MASK_RESET_REG_OFFSET,
@@ -379,6 +389,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos5250 },
 	{ .compatible = "samsung,exynos5420-wdt",
 	  .data = &drv_data_exynos5420 },
+	{ .compatible = "samsung,exynos5515-wdt",
+	  .data = &drv_data_exynos5515 },
 	{ .compatible = "samsung,exynos7-wdt",
 	  .data = &drv_data_exynos7 },
 	{ .compatible = "samsung,exynos850-wdt",

-- 
2.54.0




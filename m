Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EC3CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 05:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFNx2M5MfC3U2WIlbJTGy2D7mD6ZH4cGBeGNYwK2Y0w=; b=u0cqZzOjZ9/ZoNbPbSeCFpW7pd
	UW4Ap8CvOnpM7POzHJ00yFOLR3YRSdg2lnniDzQpet2e4NXE5R9l/m0Pi6cKViA2uAodNbGqwTFMg
	edtrRE4eYb3gdlAapEEtmywtxNf+M1Grn4SHXqop5DgsyrQJ5HJgIQlnz5Hfkahl6AhPY9wizjB/R
	XWKdBfeW82kJDB/xuCErBzz/Z6towju/MWj/uQ4IzVUQZNMJBb7m3wmgKGr8OWjaohkr6iDFl5TZi
	yOV3n+x2eYUNWx0ZI5HEvpL5oT56gFhMemf1nfJvbnVqmCXpOkI3D/Iy/q8DEhrvIW6/YeZmYNNDy
	JK7bDgmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4sG-00000000dIk-0gnn;
	Thu, 18 Jun 2026 05:01:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4sE-00000000dII-2y6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 05:01:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7979443AE3;
	Thu, 18 Jun 2026 05:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6996F1F00A3A;
	Thu, 18 Jun 2026 05:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781758866;
	bh=lFNx2M5MfC3U2WIlbJTGy2D7mD6ZH4cGBeGNYwK2Y0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CxvNkNgcucGMUG3aYF0RgobZ664zkLYygWHyoD4wkYRQpRHkjHxK7e2fw4To3H8zT
	 /qB47JcWxhOCTiaZYxoZ+yHPWBHDVr65rzJ1A+48UsEmB5d2iUtHbjb1lYYSIivRU6
	 JwFWi5dFN5/F1DNiDb1V5mtxtSATPWqXNy4FOiIUuG276Cq2MFP1qJyDEkS9DHJgry
	 hx6MWM6m9eD95TsXh+Up7JZoqwSIC2vilWJCv0UtZmHVW7fLW231mc5EQIa5NEyDDh
	 wPlE1kCTiOjqQxUtR6chmvpVbdHAP2UTz3o+rUaf6HXQJVuOrwpuUWswgcKZkZdhni
	 ACJ1SUJSDyi6A==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 07:00:49 +0200
Subject: [PATCH 03/11] pmdomain: st: ux500: Implement more power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-ux500-power-domains-v7-1-v1-3-eb5e50b1a588@kernel.org>
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

This starts to implement the power domains that are just skeleton
implementations right now.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pmdomain/st/ste-ux500-pm-domain.c | 125 +++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/st/ste-ux500-pm-domain.c b/drivers/pmdomain/st/ste-ux500-pm-domain.c
index 6896cb4a7b71..723001004690 100644
--- a/drivers/pmdomain/st/ste-ux500-pm-domain.c
+++ b/drivers/pmdomain/st/ste-ux500-pm-domain.c
@@ -41,14 +41,137 @@ static int pd_power_on(struct generic_pm_domain *domain)
 	return 0;
 }
 
+/*
+ * Apart from these voltage domains there is also VSAFE which is always
+ * on. Vape_esram0_pwr for eSRAM0 is connected to VSAFE.
+ */
 static struct generic_pm_domain ux500_pm_domain_vape = {
-	.name = "VAPE",
+	/* Vape_pwr */
+	.name = "VAPE",  /* 0.95 .. 1.20 V */
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_varm = {
+	.name = "VARM",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_vmodem = {
+	.name = "VMODEM",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_vpll = {
+	.name = "VPLL", /* 1.8 V */
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+/*
+ * CHECKME: as these are used directly by peripherals as regulators,
+ * perhaps they should stay in the regulator subsystem?
+ */
+static struct generic_pm_domain ux500_pm_domain_vsmps1 = {
+	.name = "VSMPS1", /* Also called VIO (1.2V) */
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_vsmps2 = {
+	.name = "VSMPS2", /* Also called VIO (1.8V) */
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_vsmps3 = {
+	.name = "VSMPS3",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_vrf1 = {
+	.name = "VRF1",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+/* The following are technically children of VAPE */
+static struct generic_pm_domain ux500_pm_domain_sva_mmdsp = {
+	/* Vape_SVA_MMDSP_pwr */
+	.name = "SVA_MMDSP",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_sva_pipe = {
+	/* Vape_SVA_pwr */
+	.name = "SVA_PIPE",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_sia_mmdsp = {
+	/* Vape_SIA_MMDSP_pwr */
+	.name = "SIA_MMDSP",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_sia_pipe = {
+	/* Vape_SIA_pwr */
+	.name = "SIA_PIPE",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_sga = {
+	/* Vape_SGA_pwr */
+	.name = "SGA",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_b2r2_mcde = {
+	/* Vape_DSS_pwr DSS (display subsystem) */
+	.name = "B2R2_MCDE",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_esram_12 = {
+	/* Vape_esram0_pwr, Vape_esram1_pwr */
+	.name = "ESRAM_12",
+	.power_off = pd_power_off,
+	.power_on = pd_power_on,
+};
+
+static struct generic_pm_domain ux500_pm_domain_esram_34 = {
+	/* Vape_esram3_pwr, Vape_esram4_pwr */
+	.name = "ESRAM_34",
 	.power_off = pd_power_off,
 	.power_on = pd_power_on,
 };
 
 static struct generic_pm_domain *ux500_pm_domains[NR_DOMAINS] = {
 	[DOMAIN_VAPE] = &ux500_pm_domain_vape,
+	[DOMAIN_VARM] = &ux500_pm_domain_varm,
+	[DOMAIN_VMODEM] = &ux500_pm_domain_vmodem,
+	[DOMAIN_VPLL] = &ux500_pm_domain_vpll,
+	[DOMAIN_VSMPS1] = &ux500_pm_domain_vsmps1,
+	[DOMAIN_VSMPS2] = &ux500_pm_domain_vsmps2,
+	[DOMAIN_VSMPS3] = &ux500_pm_domain_vsmps3,
+	[DOMAIN_VRF1] = &ux500_pm_domain_vrf1,
+	[DOMAIN_SVA_MMDSP] = &ux500_pm_domain_sva_mmdsp,
+	[DOMAIN_SVA_PIPE] = &ux500_pm_domain_sva_pipe,
+	[DOMAIN_SIA_MMDSP] = &ux500_pm_domain_sia_mmdsp,
+	[DOMAIN_SIA_PIPE] = &ux500_pm_domain_sia_pipe,
+	[DOMAIN_SGA] = &ux500_pm_domain_sga,
+	[DOMAIN_B2R2_MCDE] = &ux500_pm_domain_b2r2_mcde,
+	[DOMAIN_ESRAM_12] = &ux500_pm_domain_esram_12,
+	[DOMAIN_ESRAM_34] = &ux500_pm_domain_esram_34,
 };
 
 static const struct of_device_id ux500_pm_domain_matches[] = {

-- 
2.54.0



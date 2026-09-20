Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD15C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2m/eww0NJBC9VjmSRylYPL3dP0broMZbNA/WY8kWFs=; b=fY1vToFWWOcyrBlJJAk/Ro6g/i
	bHvpUpz6lkNMagePUBi0Yto9yAYXtCz+/5HM2y+dQZaMlTfx0KoCx2n861Ti2Cuse3S+H8bZFr55a
	CZe9nGURW/QSXZAwZtyzrkOfljcEkfoe+5HVxzDuRB31NSDNKFKTCDb/NTQe6lCruYmZNeirbgHS9
	FTcAJFSdWwXI11oPF13nbKSvmFl7YK3O73NVcwVQLjhlw57w58eYuI23RrnD8w0OokxoswEJf8Xj7
	uSooARaHpB7mypdg/uzInOcw5E99s3/4Lhu6091rvm4EyHm9YJbDewe55dE8BB8nxp52+xvVvWYzf
	UgVOx6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QKx-00000000XJ1-0WHb;
	Sun, 20 Sep 2026 22:48:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8QKv-00000000XHb-1pzZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 22:48:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3586B42A86;
	Sun, 20 Sep 2026 22:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4791F00893;
	Sun, 20 Sep 2026 22:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789944521;
	bh=m2m/eww0NJBC9VjmSRylYPL3dP0broMZbNA/WY8kWFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=goSrMxbksaJG6FwEJKq4YQ5tFgxG9wYW60U02qLdPE6u3eovkDpKE7wanpaAi9bGn
	 KLJfRHdS241AJQ9JaruMknvVtUkND+lbxBONu03WVm0qrXRPhdPA3NvCMZMU/v8OKs
	 OjGghA69iVzt9+gwKPeCmdKjir31LFEipTFEKYnkoRA0QgdLRrEG7IuCiY5Lx+Hss1
	 0tGVWA7oagXwrPH6h9meb/5GzQsmdg9Z7NfbT3EP5aVKEZfO0cuANwWx4/TcN05Pse
	 QHCYtyl+NP8bj1vswa2FXqC33YNtA08Mk2FOxniENJFQ55pL6WsvVshZBNNFCMaf78
	 qy4k008oIY2ZQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:48:12 +0200
Subject: [PATCH v3 06/18] pmdomain: st: ux500: Implement more power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ux500-power-domains-v7-1-v3-6-9352be6b86b1@kernel.org>
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
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
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
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

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pmdomain/st/ste-ux500-pm-domain.c | 127 +++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/st/ste-ux500-pm-domain.c b/drivers/pmdomain/st/ste-ux500-pm-domain.c
index c9129a3b1805..d90a563cd6f3 100644
--- a/drivers/pmdomain/st/ste-ux500-pm-domain.c
+++ b/drivers/pmdomain/st/ste-ux500-pm-domain.c
@@ -17,7 +17,7 @@
 
 #include <dt-bindings/arm/ux500_pm_domains.h>
 
-#define NR_DOMAINS		(DOMAIN_VAPE + 1)
+#define NR_DOMAINS		(DOMAIN_ESRAM_34 + 1)
 
 static int pd_power_off(struct generic_pm_domain *domain)
 {
@@ -43,14 +43,137 @@ static int pd_power_on(struct generic_pm_domain *domain)
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
+	/* Vape_esram1_pwr, Vape_esram2_pwr */
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
2.55.0



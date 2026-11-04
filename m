Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417EA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rq9MT23a;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bQHaNaxY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IwlZYCdqrh5khLhPJ6AIsMR/TF+06QScNXAw7D6gmgk=; b=Rq9MT23aYJepg9
	Nq3DVhS8jwQhq7dm0pbz5HLtVNL/g4mevQ1Sn9clej1JcZHCFMoL1fLLUzBQfttYY8KUs9qcV0YnT
	lWFnPNxoZ5E4uDHFPlThABx8Q4oK3lRbz/QxXnuKpA1XlAOBibN9MX7ZiJ4VKOP62BxALDOo0NBHB
	PeIpAMn8MJcCMadvle17HTkmV3xeAoWYEJyfiOpT4bGPH5/7FVz5UbnemzBXPfNC5xsgAfC6gP6NR
	MU0j9FytvqO/zed8YBMVpfU5rai4SdLHitrOjZDmnZwFl1o/a4UTxcYQLxXmpm54X+dnWN+I24JTL
	9HpMOVdl7xkI4YDE++BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjpG-00000007BWw-0hgW;
	Wed, 04 Nov 2026 22:51:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjpD-00000007BWL-2PPX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:51:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12E9D40AB9
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 22:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06471F00919;
	Wed,  4 Nov 2026 22:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793832682;
	bh=IwlZYCdqrh5khLhPJ6AIsMR/TF+06QScNXAw7D6gmgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bQHaNaxYGvdZDvanxUaLOPkGun35fz32QRT5jBRYhCRXtWSIR94XAI4+0IqlM5Qve
	 ZHPqYZ9zPqxqkjp/jXDzvTU/7YKvej97sKb59KAOtrGgcRtUCzSaARestrWmtRfLGO
	 vp8n4AJ9eTffzeJSmo1ZDDG2jB9Rx+JMmFKTTOFge3hblx+3tUuLCbjshM0ztYtUFC
	 GXYBwSTW15LmmnzJdkOljwx5rHbkeJcOFXZSs9FQ9CSO2ADzlaBlLrQM9Dm8naLyC1
	 7QMYbeQgtlKaQNCE2XGa48Jt9kUT3qT/Pdn8vHf7XOgMS3aTXBxulyp/0MSbhOK+Vn
	 yrv8175fL4N+A==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 23:51:18 +0100
Subject: [PATCH 1/2] pmdomain: st: ux500: Implement more power domains
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-ux500-pd-genpd-v7-5-v1-1-4b4f256f340d@kernel.org>
References: <20261104-b4-ux500-pd-genpd-v7-5-v1-0-4b4f256f340d@kernel.org>
In-Reply-To: <20261104-b4-ux500-pd-genpd-v7-5-v1-0-4b4f256f340d@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
2.56.0



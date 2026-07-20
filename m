Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4DAC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzhKpOIMbAkYm2aDiA5kV28LIX72GS5SlkgLnTUq9Ck=; b=4Kpa57A7ltTyDxZgv/mZieS9np
	6hl37pf2hnyNESWnoSi9IvCt9y0ovClxwtmR/elbzWPLWPkBVdVl2lGy9nthSu4/RHZPKvHle+EMC
	ej9VjFZwElujnOgH0TRcamJiQHtiUqd7G9vxNXzYHzFmUqEsHgYrhoYa27nSSv02UNz9CjlLHN/bE
	1YRanzQFm29yEXQiD2acXhbTtRqPBb17LESdbcBQlrPY1/9D/nPsdeR4rTEGa4O0drj9Bq3KvLFca
	mmf4W24ZcNvWq8PBEkugWXTNifAIqFadE1GjAqVKAKsEzSfi6sUCxaYL9Y7TfP1Wt3fcSbc4Pi8Bg
	6cBi0hgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlut3-00000007tNZ-0xTY;
	Mon, 20 Jul 2026 20:46:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlut1-00000007tM9-1qca;
	Mon, 20 Jul 2026 20:46:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70BEB43E71;
	Mon, 20 Jul 2026 20:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06960C2BCFA;
	Mon, 20 Jul 2026 20:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784580410;
	bh=Nh/Fdy7HDE4Q2St9NslvRK6v/ceaWYfT/X8hid8P7Ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GWUnkGuBFTePzB2pyPLy0feznS3YM8Lc4qGaANHQFNtbxSXAYjHFQuZPUbjGwhI7T
	 Ks0yiUGvunSaT5+I24dA2mXqeFKFmJe4D9zwpL7oy8/PLAM0Kn3pTQPYIhjpHdFu0m
	 DX0qTRiwbaqNFudCWiWEYhY4WSZ5TofDsduCUsN8coALGR9GCpNd3hb/fjqEBWWd3h
	 I6kIYX2ucdkPOgy2vHhyztdglEfoUYOt5mXvP0qs6tMCBtX5ExmG5QNiXVmm7eXxF0
	 5vK0wiOBuATpaDrF6V95ZVBO5jweyXzW8AWI55ZCRY2P3a4VfJMfney95dlwrMIHP9
	 4jsO0hkovE3XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC37C44515;
	Mon, 20 Jul 2026 20:46:49 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Date: Mon, 20 Jul 2026 23:46:47 +0300
Subject: [PATCH v3 2/3] pmdomain: mediatek: Add support for secure modem
 power domain control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-mt6858-pmdomain-v3-2-8966d8de93c8@jolla.com>
References: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
In-Reply-To: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nikolai Burov <nikolai.burov@jolla.com>, 
 Nikolai Burov <nikolai.burov+review@abscue.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784580408; l=5639;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=5fzedbDsvOEQ+tbIFJcPFkJMjBII9+Zs4ulc0FKFtSM=;
 b=w8SvxSigsQlH1XUxPiYE9WlkOvNrUTghaVUa0Xl4qlFnAUFL6G+Zc7sZAG1KEPA4FVaivBQYM
 A9Jnl/H/q7vD2oUcAORV0KR2NFFlWsdCevne1m/5Jqj05fwEXpzyzd7
X-Developer-Key: i=nikolai.burov@jolla.com; a=ed25519;
 pk=yzpa+PD+ovHUFMIOBA9o2QqGwI110jM6hdGHLc7jtoQ=
X-Endpoint-Received: by B4 Relay for nikolai.burov@jolla.com/20260707 with
 auth_id=859
X-Original-From: Nikolai Burov <nikolai.burov@jolla.com>
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
Reply-To: nikolai.burov@jolla.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nikolai Burov <nikolai.burov@jolla.com>

On recent MediaTek SoCs such as MT6858, the kernel is required to use
a secure monitor call (SMC) to enable or disable the modem power domain.
The power domain control register can be read, but firmware prevents it
from being modified directly. Some other parts of the power sequence,
such as setting the ext_buck_iso register, still need to be performed on
the kernel side.

In preparation for modem support, add a flag to enable this new power
sequence for SoCs that need it. Power domains using this flag are not
expected to configure any bus protection registers, since these are
handled internally by the SMC call.

Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 50 +++++++++++++++++++++++++++---
 drivers/pmdomain/mediatek/mtk-pm-domains.h |  1 +
 include/linux/soc/mediatek/mtk_sip_svc.h   |  3 ++
 3 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 8309a4b46afb..5b4d860318a4 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -57,6 +57,10 @@
 
 #define MTK_SIP_KERNEL_HWCCF_CONTROL	MTK_SIP_SMC_CMD(0x540)
 
+/* Secure MTCMOS commands for modem subsystem */
+#define MTK_MD_MTCMOS_ENABLE		18
+#define MTK_MD_MTCMOS_DISABLE		19
+
 struct scpsys_domain {
 	struct generic_pm_domain genpd;
 	const struct scpsys_domain_data *data;
@@ -668,6 +672,34 @@ static int scpsys_modem_pwrseq_off(struct scpsys_domain *pd)
 	return 0;
 }
 
+static bool scpsys_modem_sec_poll(unsigned long cmd)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 1, 0, 0, 0, 0, 0, &res);
+
+	return res.a0 == 0;
+}
+
+static int scpsys_modem_sec_power_on(bool on)
+{
+	struct arm_smccc_res res;
+	unsigned long cmd = on ? MTK_MD_MTCMOS_ENABLE : MTK_MD_MTCMOS_DISABLE;
+	bool tmp;
+	int ret;
+
+	arm_smccc_smc(MTK_SIP_KERNEL_CCCI_CONTROL, cmd, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0 == 0)
+		return 0;
+
+	ret = readx_poll_timeout(scpsys_modem_sec_poll, cmd, tmp, tmp,
+				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
@@ -686,7 +718,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 		regmap_clear_bits(scpsys->base, pd->data->ext_buck_iso_offs,
 				  pd->data->ext_buck_iso_mask);
 
-	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ))
+		ret = scpsys_modem_sec_power_on(true);
+	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_PWRSEQ))
 		ret = scpsys_modem_pwrseq_on(pd);
 	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
 		ret = scpsys_simple_pwrseq_on(pd);
@@ -717,7 +751,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 			goto err_pwr_ack;
 	}
 
-	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ) &&
+	    !MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ)) {
 		ret = scpsys_sram_enable(pd);
 		if (ret < 0)
 			goto err_disable_subsys_clks;
@@ -739,7 +774,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 err_enable_bus_protect:
 	scpsys_bus_protect_enable(pd, 0);
 err_disable_sram:
-	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
+	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ) &&
+	    !MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ))
 		scpsys_sram_disable(pd);
 err_disable_subsys_clks:
 	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION))
@@ -761,7 +797,11 @@ static int scpsys_power_off_internal(struct scpsys_domain *pd)
 	if (ret < 0)
 		return ret;
 
-	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ)) {
+		ret = scpsys_modem_sec_power_on(false);
+		if (ret)
+			return ret;
+	} else if (!MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ)) {
 		ret = scpsys_sram_disable(pd);
 		if (ret < 0)
 			return ret;
@@ -781,7 +821,7 @@ static int scpsys_power_off_internal(struct scpsys_domain *pd)
 		ret = scpsys_modem_pwrseq_off(pd);
 	else if (MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
 		ret = scpsys_simple_pwrseq_off(pd);
-	else
+	else if (!MTK_SCPD_CAPS(pd, MTK_SCPD_MODEM_SECURE_PWRSEQ))
 		ret = scpsys_ctl_pwrseq_off(pd);
 
 	if (ret < 0) {
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index 092403de66fa..8690690335ad 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -18,6 +18,7 @@
 #define MTK_SCPD_SKIP_RESET_B		BIT(11)
 #define MTK_SCPD_INFRA_PWR_CTL		BIT(12)
 #define MTK_SCPD_SIMPLE_PWRSEQ		BIT(13)
+#define MTK_SCPD_MODEM_SECURE_PWRSEQ	BIT(14)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data ?		\
 					 (_scpd)->data->caps & (_x) :	\
 					 (_scpd)->hwv_data->caps & (_x))
diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
index abe24a73ee19..6c95a29b79fa 100644
--- a/include/linux/soc/mediatek/mtk_sip_svc.h
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -22,6 +22,9 @@
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
 			   ARM_SMCCC_OWNER_SIP, fn_id)
 
+/* Modem related SMC call */
+#define MTK_SIP_KERNEL_CCCI_CONTROL	MTK_SIP_SMC_CMD(0x505)
+
 /* DVFSRC SMC calls */
 #define MTK_SIP_DVFSRC_VCOREFS_CONTROL	MTK_SIP_SMC_CMD(0x506)
 

-- 
2.54.0




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F62C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SnQce1qq2g+SM/DQdrrfbVqTqCjge8E+pfCFPzM/Cg=; b=XzeXMjHgZQyqVjcjoRg/GWTN3T
	sBycVUSU3CZwmqffkIQA6QidEBUk/OunYHcMO0ZCR3lTNczZNJBmjr8SsCQwf4JAsTDMIgjLHyTZy
	u52BoEusgbbTa59Nmj5vQh0C9/6eWhFqG0GP5Qrlqs7qJsbnmuf/4+Yk9CmhqMrx5RIQ+xJ+kH0CK
	34Z5eMMw8LsixKuwXlKSlzHqK2xWCikECiUCOQEolg0qTktkum5LV0t14Ucbe7DnRQxgWRtQfLSAO
	VDJ6QMzXzTIx614kutQ04+sEUGVJpqv1OFEOCD9tD+y8uTe3MfsQzJLq6tbJAUyQRmmknOcQSR2Iz
	hW4moucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk03u-0000000F0Ok-1inl;
	Wed, 15 Jul 2026 13:54:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk03s-0000000F0Mb-3SN1;
	Wed, 15 Jul 2026 13:54:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0923E6138C;
	Wed, 15 Jul 2026 13:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AB78C2BCF4;
	Wed, 15 Jul 2026 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784123647;
	bh=Yu+Tu7ylAiaB6C7afVFhtwHqHDAEHvAp/9c6zR91Sik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TxwjS/QqEjLZXP5ZP+x7jMmTa8fw79onnSCkQB1aXwi1CM7aibWAvPpkxqpL8MYbl
	 IkNBwkFXAhQhnucxlR5XffmOH+S57FHLt+uEjWSykDtRDfEg5VsFLei3Z3EqUH2DSu
	 Ap/oPSNJZD64u/ZZHTW938zIxgjY4GeFs+isnARogfhqvw48O7uoVf/hoH3IKIEobz
	 jEsbM0Yn18wTZdgogQLdPMVloq2Rt8whXKTBwKyhRtPIAZzbW8nkYfs7T2C4+6DVte
	 Dyvy3cIa1nnjLKRQydlOKlodAQlrGBPMag2/XBtHbjTDLWfxhYyIWzt3GpKQmfi7CA
	 oogZTX/e9qc1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E45EC4450A;
	Wed, 15 Jul 2026 13:54:07 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Date: Wed, 15 Jul 2026 16:54:06 +0300
Subject: [PATCH v2 2/3] pmdomain: mediatek: Add support for secure modem
 power domain control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-mt6858-pmdomain-v2-2-6293e87fc093@jolla.com>
References: <20260715-mt6858-pmdomain-v2-0-6293e87fc093@jolla.com>
In-Reply-To: <20260715-mt6858-pmdomain-v2-0-6293e87fc093@jolla.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784123646; l=5199;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=gBoq3HH59F/zPOlCRpIWWkC6yZBPSELdx7eNFsd2Po8=;
 b=z/GkX2dizJxO+o5AY/WpWWi4WOs7WS8zkm9bz9iemZh8zrpRVxTDkvUzjyFbMZUIwCaIQKa16
 /DEfLv8LsweDqsK1QhMZjlT0HZ4LPN/PbbkcdlGQLeaRmbOuox45CsS
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
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 47 +++++++++++++++++++++++++++---
 drivers/pmdomain/mediatek/mtk-pm-domains.h |  1 +
 include/linux/soc/mediatek/mtk_sip_svc.h   |  3 ++
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 8309a4b46afb..ada9ea8b45b7 100644
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
@@ -761,7 +796,11 @@ static int scpsys_power_off_internal(struct scpsys_domain *pd)
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
@@ -781,7 +820,7 @@ static int scpsys_power_off_internal(struct scpsys_domain *pd)
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




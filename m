Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1657BCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfVnfMnUFwyLNqs4rPjMOiNJ9iATrzCn1X86BIPjvdo=; b=Rsw6cCXBAww5426J1UP/HAOEM2
	YUT2apvkkCgzq4XH+1gOdvQ1DOfs4X0CV/dfqOOTSAoZqc/iGiko88yguClW+ujTxZndpS16onEF6
	rE3+c9KbnPPixUqZrUidE7S1Vti7WujKjklDlyvX9El5Lq7x99OQpvEjz1TP1TuIvmylTAT+QYkFj
	8njDEboL6sGNboTxitQH9vBgMNhJIiNxZi+hHaaTNOjgomglMoPDaXFnAdXUehAzX+/SsGgh/0hDw
	R77s8GoN7zg4oSjPspCsoUKxvKlsxlbhaH2T2/CWn6HjolXz31kl1pxODhjEsg8GYCMLabEPJMMzQ
	h9JznneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlk-0000000BkzD-0j0Z;
	Tue, 04 Nov 2025 12:04:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlh-0000000Bkw4-3ykV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:04:11 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b403bb7843eso201028166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257848; x=1762862648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfVnfMnUFwyLNqs4rPjMOiNJ9iATrzCn1X86BIPjvdo=;
        b=Hr+l0xdr+qAYK9b3K2S55a4r+KQODCJXbEQzgyw7ZUDs8eGVjQS6RPxtWIizmTKxGS
         ZdnYCmQg/miLvYaNOLfOshnJ7Xf5v5pQj+XIsvxOLpVyWL/MAXEanlzDW2AElp5BBclZ
         hmuKJR7vtskF2BLhUO5j6ReKRJcpIOe9/CAfi+pV1Jt3D27K3KV/9FbPXq5QnT2KZk7a
         TNEBA4qCkbOTp0xi+nV6cTgB/Bmt/hXq6tCe6k05Isv/YwJQRelUlEjnlXOHJezi5b85
         m33B48e5EQnv2caF92KlsAmrDVQBvlSA8bdLzSVaJ8ueRqMiZkIVte5r/9HWdEI9H0D+
         EB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257848; x=1762862648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfVnfMnUFwyLNqs4rPjMOiNJ9iATrzCn1X86BIPjvdo=;
        b=gT/q2MtW31uyq19vntFxFa4XgTTodiMh7P0Cr85Y05UCL1ky3LwS2UI4/7lWPFdzr/
         d08QbZlS9jT1Q9dJyQaHLL241eQ0E/FgKdtbKhyDlIbQgEFk92GK0jWjy6WofpM6evjL
         wwB0UsOJODsvzXIFCe5KkLLA+/4wzVcBFNM+ere0kRlFO1JLk6bpkuxDUN1MMuImD3cz
         5MBoo4H+/2PdW7D4O8HMROz6KUBejuBrCRszVYUnyAbZ8owtSMMKNjdsIacrybzEcIQF
         iNNSWMxjsRqVRc9agxICWaU6jyzG52TDndb0A0AfL7qXRwsSa9EcV1uh5Wwfwioazu9Z
         h2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWmT61CzlJtFDi1a23v/lyAN3HZI0tzbMmlKBC1BHxgz8znvCBGlKiJGW1eCqhoHy78wKe8cCvzBrwNZ1ZqFWVl@lists.infradead.org
X-Gm-Message-State: AOJu0YwRi3KNXBddJfKYi6pJsFfSTrvCsTsVTNnu0qBsxiC8NAO5Nr37
	785oocecVJUD+FRh5tD6JaAI2unBf/hEOw/m6zALnTCcfahN+UIHuXnJ
X-Gm-Gg: ASbGncvg9wpNE4NUTVTT0KElSu4/SH70O5O8WbImC8P/PHQQ1AEO53XRk44mk7JK2nf
	MkcPGgGlbZ4HAMwEU58467tp16DW8TqVRNx+u21oQnUHf+rDex+KF3bAyD7/hAxB4DS2svp/4J6
	skf3wFnw3rhgWywy1k/uoQukvK8ZSGs2809M5jA+BRh8MnSrzqlNTNbzy3SUzSL5F0CFWYRwhLf
	nuNIiyM/7WxonELRBJvdaaqMnUG6zEjzCnra5vVV4TRGmuRBbOCsFSWIPwpKfRzoZi85ReLBYIa
	TQYgqW7QJOFkWVgLCZS2DwzjSTL35GwE6xRXoQ++Mdau3KvCRYJSmNPYe4IxB1IqCVXIbz35n0R
	VviQwR9Sy7gCpo2k34THMKrbfSlJmYgBaGrxaezcMZtU2qldqqophMskp7RCHjH+G0xvEuercrZ
	qy9xcsVL9ejVMfHyocC9WG3aQ+HA==
X-Google-Smtp-Source: AGHT+IEFmmFqmwF7IJGHYHQFLdfcj+i6AuRD6y5QTSlNabPHEjYgdTalWazPTsjhrKIiVzJb3z4NAQ==
X-Received: by 2002:a17:907:8692:b0:b71:a627:3d8c with SMTP id a640c23a62f3a-b71a6274340mr486414566b.56.1762257848026;
        Tue, 04 Nov 2025 04:04:08 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:07 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 6/8] reset: imx8mp-audiomix: Extend the driver usage
Date: Tue,  4 Nov 2025 04:02:59 -0800
Message-ID: <20251104120301.913-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_040410_013915_BF36CE02 
X-CRM114-Status: GOOD (  15.00  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Switch to per-device reset map to allow reusing the driver for other NXP
block control IPs.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 18a7f68aa59f..745b7e22b954 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -23,7 +23,12 @@ struct imx8mp_reset_map {
 	bool active_low;
 };
 
-static const struct imx8mp_reset_map reset_map[] = {
+struct imx8mp_reset_info {
+	const struct imx8mp_reset_map *map;
+	int num_lines;
+};
+
+static const struct imx8mp_reset_map imx8mp_reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask = BIT(0),
@@ -41,9 +46,15 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,6 +66,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
@@ -141,7 +153,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (void *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -164,6 +177,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47638C5321C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Bu+essrG2ROqqAPzBEqDLFkRuZID1PteLr01IBJ0No=; b=l25IZyCLUvYgnth/HvemaTKMOF
	LiBcEfGK2m4E2u+/J8m5oNY/EyHzL+7NdRMcX6lyOmmhhW6rVwrB015JWTFHsO2jj5xtGYgEp8ABz
	qdM9eme0jKlVUUYRy+/fZDWOjfjVtgplTe9DH7DKF/guLxiM4A+KQxmbmtdYNYTipepzTR3ZgdJ0s
	RkO3nZBhjIQllf4GAmd96V9r+we9xQEgq2NJqZ4w8R1L/fLSU9oH6fzrSpTnMpZ2CZy4pjiCgoOUA
	BvY6EWsHAO3AnQ04xeKttK3upLkDkoVxMdtinH76ux5R7HF1AjNcNaPfnL46YXwrkYwgCbZtO9sf3
	9h3TeJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKxt-00000002m2B-3ceD;
	Mon, 27 Jul 2026 13:01:53 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKxl-00000002lw1-3n1T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:01:48 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Bu+essrG2ROqqAPzBEqDLFkRuZID1PteLr01IBJ0No=;
	b=bGdP+aHWAxFlTKEoJDSBCwbRjUwkIM/9fKRW9YEjX+7ck6OILBPEp0eN/MxLh2kNq/lwEG
	r/GxHKVb1cy6Ml36rp49mRRF83Ht8WmxOagO1tETy3fdAwmwwpZyICR+arGZaavejXwmde
	P6CVi8wLVlBSEla8ruJXyvfLEnrZgABClmzxFWbPJd+yvHGekHeIu2LzQ86m9L7w/2DKNC
	F7STykgtZDNtpgna9x1G59jTBtCK5pCJZQ4IoB/XefIgoR8QKBLLHboUU7wLMHCvkJjcFk
	DAFJ8afQbajwcAvyHDYQ0YpDhOILPRYW4oVCxQfPrqKCJzjwHEOPIZe+LwEhwQ==
Date: Mon, 27 Jul 2026 15:00:48 +0200
Subject: [PATCH v4 05/11] nvmem: imx-ocotp-ele: Remove device-specific
 reg_read()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-5-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=abU63Qg8wVbJYjhdQvSyPAVVf5ob9YRUOYMGHB17x0Y=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bNVWm2tSud9e2q+evOPKtKBVp9kkD+X4G+RbCaas6
 zXlXiPaUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJG32YwM87UsDv/jTeBcsGaP
 TuSfeavNihvLrh89mjRLKO+00YVLrxgZdnxqf2G2wFqtRLRiw1eTCVu2WkR9ffFt/+dDZxMvbWE
 7zAYA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_060146_108905_A622FEFB 
X-CRM114-Status: GOOD (  11.87  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Remove .reg_read() callback in the device data all devices use the
same implementation.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index dadec19ca252..9d3f94e35508 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -33,7 +33,6 @@ struct ocotp_devtype_data {
 	u32 size;
 	u32 num_entry;
 	u32 flag;
-	nvmem_reg_read_t reg_read;
 	const struct nvmem_keepout *keepout;
 	unsigned int nkeepout;
 	struct ocotp_map_entry entry[];
@@ -158,7 +157,7 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.id = NVMEM_DEVID_AUTO;
 	priv->config.owner = THIS_MODULE;
 	priv->config.size = priv->data->size;
-	priv->config.reg_read = priv->data->reg_read;
+	priv->config.reg_read = imx_ocotp_reg_read;
 	priv->config.word_size = 1;
 	priv->config.stride = 1;
 	priv->config.priv = priv;
@@ -190,7 +189,6 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
 
 static const struct ocotp_devtype_data imx93_ocotp_data = {
 	.reg_off = 0x8000,
-	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
 	.num_entry = 6,
 	.entry = {
@@ -207,7 +205,6 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 
 static const struct ocotp_devtype_data imx94_ocotp_data = {
 	.reg_off = 0x8000,
-	.reg_read = imx_ocotp_reg_read,
 	.size = 3296, /* 103 Banks */
 	.num_entry = 10,
 	.entry = {
@@ -226,7 +223,6 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 
 static const struct ocotp_devtype_data imx95_ocotp_data = {
 	.reg_off = 0x8000,
-	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
 	.num_entry = 12,
 	.entry = {

-- 
2.55.0



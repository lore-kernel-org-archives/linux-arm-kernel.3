Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A689C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgkBtP6nNzonijjkoBKV0QVOrecMeEewwoCV4e78j/k=; b=OLnaP4O7QwnUOy9WmH8lAPvn2Y
	5F9VCLySO8qEeNpgKf28dOoRuCu8IMM4rENpPG4H8mMS/3SXMbDrV/eqnU2W4+qHvUy2frqCoCKqW
	8KuRAYvxuMli6kjFt3ibl2s6T8S3it2MUBRSsxtpt1EYay1lLxOXQxaBuQUkHo3b5zeGctF9lWqjF
	PvqB6c8uz3lo5RDIviWUrlKK3FPZTikEA2x3DjmXSqeF7vHQNRwjmaHXeV4K7jNllueYPY6fLSSez
	OE/g7kGKB7L1sNzjN3/pvXZ3xDSgSYZkIM8WkMpVa/GyI54ZOXpkWNhZGjP1Qqglyk2nE0pHQ89OY
	9B/kugSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI4D-00000009fZF-2YmB;
	Mon, 13 Jul 2026 14:55:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI45-00000009fSS-44ZR
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YgkBtP6nNzonijjkoBKV0QVOrecMeEewwoCV4e78j/k=; b=JVtm1/XE2aCFdDT6TBstiaWaLD
	VFv1kmPE7X1cui1RVwlQGaaQc2lARJ9IfPw6DL0hTVT0LfcKYwYwhE2De3/dul6Oh0W8QjkJ015d0
	Lc5tBvriUCPRnH0tdN+az2px+7clVenHFjCe4P5+OZwV3PK0T93N/cfB+FKWOSz+SIuYpGuYwfUbp
	ryI1PMhUw9VxUSYPLZui1r99FWhp/MeoSKWvh++4bw8Bg6JvhOe3QIA+gKAy3UB16ydcBeDIxC9WL
	ngVWpgpdth5098SWdlRGASbFLnouZSGnScFJm2H7kc+DV6yW67cKCcrdR5H78eLxSwUk4fFXgj5go
	TJuMckdw==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI42-0000000Bjus-3xMu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:55:24 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgkBtP6nNzonijjkoBKV0QVOrecMeEewwoCV4e78j/k=;
	b=cy612G6mkIdyCHYsmhkwC5l3iizszjXW3nBfrTL8lKZJiznEZuVc3GN2ODf71dK0upsQCH
	b+Q/Xh+aH2pjmx5uVFRPLxOxTCaYgsPf5HslxFXSAqoDbNn3zp6nFDHpCC7scPV8Gmx4fv
	WMlWQnpOD1n88XRqV6RQD366u9viIP6y+7WACDBYZRanCFOG2r6M0/YkabZeXEejHSLGIt
	lONh4pMm+MsdUvz4GuIXKa7yUru4dYqER18pizFbScCU5/ihLUjOICCIdV5jMHb75GJgn7
	dMESIJs9ICaJwQYbon2nTMXOM28h5dkMqeGTOlGt0pQCXG7zRXCgB3G/IYt8lA==
Date: Mon, 13 Jul 2026 16:53:41 +0200
Subject: [PATCH v2 05/10] nvmem: imx-ocotp-ele: Remove device-specific
 reg_read()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-5-b8266d93514b@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=tzG445aZESnsh+ntaPiN9Hp1gZDznh/2L9SQGlPLcAE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT2D2q6lLN9lMMXtwS4bx5F573sayVX/SlI4GX3p/3
 q1Bmvd/RykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwESEzzIydHBPdqzc4Lgw7ti3
 Msb5Uv3KLdt3nP4dPS+oMOzWhXi9Jwz/639N9FwUwPqjLFb7YYebg69TVvq5vhNa1jpcF27E3Z/
 PCwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155523_113673_92B80758 
X-CRM114-Status: GOOD (  12.31  )
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

We only have a single implementation of the read hook. There is no
need to store it in the device data.

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



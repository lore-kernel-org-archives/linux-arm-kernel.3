Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8943DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnjH8bUvLNMs032Y3RxCllB4beQC3Ai/Gw/n6qJweSY=; b=44fzgMInpzgXXm9QbXe0xsCVG6
	+lkDAW+LCIIAnTZzr5p5bRw7eXVPAdrG9uq7zPUhuVkMPnFGRA8SJohCTHBh5kJ+QZWK5m/m3BlgG
	8pIDThJn+Tr6scN9hnS4xeacVC2vF8UE82kIrNXf6fSXNMPe5ElgqR+Nph6Q2D4RIIcOK8pVtu7/k
	N7L3d90ayoUDB1P3DPeQwTZyuLsZTTuIWMm9hloG4TCFt2Wxtyr67To8a8dGYmka0apOnpFG7eksi
	yMcJaZKLqgm/rMaFOdL4JcK2IgYOw0V/MpLbQjp0Ps06kcw17eL4pTPAIIz5KumtrplmR+4GuS9Yw
	tdco1DJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI4X-00000009fqI-0wbr;
	Mon, 13 Jul 2026 14:55:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI47-00000009fTs-3Mj5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mnjH8bUvLNMs032Y3RxCllB4beQC3Ai/Gw/n6qJweSY=; b=Bd5Kn4O6f8H3o6gONCwqxP1G1u
	GHxQVjj4fdrcRu8Qh03pPAAtvd75pAHvGyI317Eo5ZNCVEzLiOZY+zDAr5Y6Z2XU/kqowQxR5/bqr
	2E6wGYXqnlzAP4oJLMhcSt/ZqlLoctjkX37sfih3Pke3D9stzYU5ugUFu3zA1p1iQOOEWpll401cX
	uwGYasyxHfJgKDynSj4HB40fxI+RLEoX2nIYi5LN57qyDkT6xAs5cJvBtL+QhMLQ1zWTpkOMNaQZh
	pDX+Xj10i4XBrJtMqdLxrWwBKVWko0doR8HRA6Wg+n2o8o+9danWl9Nd575uj1jNNSxKz0jkj3l4H
	nLvJjrCg==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI42-0000000Bjuv-4B2d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:55:26 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnjH8bUvLNMs032Y3RxCllB4beQC3Ai/Gw/n6qJweSY=;
	b=1r+6GHEaUzeW7ARL5A1y4cF89AgFbIyWmXz3gysj4C8Lo1wZ5x1/ZcSeakLGgRT1wtQsVV
	YDiQ6o1s1OY5aAbKQuaYeqgicH2EfUrdZE7x8TQOwYRg5ZVhC4jL0V2Eaydm8C/MJ7E4PO
	PPBaAw006VKx7z1B92ZErkma0gbnjWJ1IlYMgHjfMwlZKtk3DNvXtbsuf8sZg0s53YYgmw
	6X+nK8WAt5RMrWTgz1UVyrXQbXcBhDS59fetYRkkBo9js4hZAushUFtgq3gEj0EVf6ZRfd
	ddgGL7DCdOi1ICx8Tc3YE9qei0OctQYZ8E+9aqGXuUpdX6jOgOcVARdPjSgkaA==
Date: Mon, 13 Jul 2026 16:53:45 +0200
Subject: [PATCH v2 09/10] nvmem: imx-ocotp-ele: Rename FSB access map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-9-b8266d93514b@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=Ui1yqAl2SncRGvJ6Cd8lkM+A+lQmMiIxti+ManRJv8M=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT1C3w/beB9E9Z2xvtbTFXdtnvVh5WsCH8LwKq4xJE
 6eV/37UUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMBF5TUaGXR+frjmv+OWmI+eT
 r1tunniavijj7ZYph850/HBYOkuQ4S7DP631XGy3/7w1Sc47IRs8SaN+7VWno1vbOexnstv37u+
 dygMA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155523_356463_A5039086 
X-CRM114-Status: GOOD (  12.78  )
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

The table is used to declare which fuse registers are accessible
through the FSB block. Name it accordingly to make this clearer for
the reader.

No functional changes intended.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index f07565c0a02d..1a125f9c5b1d 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -33,11 +33,11 @@ struct ocotp_devtype_data {
 	u32 reg_off;
 	char *name;
 	u32 size;
-	u32 num_entry;
+	u32 num_fsb_map;
 	u32 flag;
 	const struct nvmem_keepout *keepout;
 	unsigned int nkeepout;
-	struct ocotp_map_entry entry[];
+	struct ocotp_map_entry fsb_map[];
 };
 
 struct imx_ocotp_priv {
@@ -160,12 +160,12 @@ static enum fuse_type imx_ocotp_fuse_type(void *context, u32 index)
 	u32 start, end;
 	int i;
 
-	for (i = 0; i < data->num_entry; i++) {
-		start = data->entry[i].start;
-		end = data->entry[i].start + data->entry[i].num;
+	for (i = 0; i < data->num_fsb_map; i++) {
+		start = data->fsb_map[i].start;
+		end = data->fsb_map[i].start + data->fsb_map[i].num;
 
 		if (index >= start && index < end)
-			return data->entry[i].type;
+			return data->fsb_map[i].type;
 	}
 
 	return FUSE_INVALID;
@@ -364,8 +364,8 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
 static const struct ocotp_devtype_data imx93_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 2048,
-	.num_entry = 2,
-	.entry = {
+	.num_fsb_map = 2,
+	.fsb_map = {
 		{ 0, 52, FUSE_FSB },
 		{ 312, 200, FUSE_FSB }
 	},
@@ -376,8 +376,8 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 static const struct ocotp_devtype_data imx94_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 3296, /* 103 Banks */
-	.num_entry = 9,
-	.entry = {
+	.num_fsb_map = 9,
+	.fsb_map = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
 		{ 9, 3, FUSE_FSB | FUSE_ECC },
@@ -393,8 +393,8 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 static const struct ocotp_devtype_data imx95_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 2048,
-	.num_entry = 9,
-	.entry = {
+	.num_fsb_map = 9,
+	.fsb_map = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
 		{ 9, 3, FUSE_FSB | FUSE_ECC },

-- 
2.55.0



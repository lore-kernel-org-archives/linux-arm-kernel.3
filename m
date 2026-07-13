Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hg5tW1Rb6Nt7cG6Ff89MFT0HTZsA91xkclD1Vy8H15c=; b=3ODaA5yfZcp61y/0ia2Iw1QH/R
	aCFNrg1Kl76vAqoAir733llQhviURqLnlHVy+stg3ZJ8nVBB9s1TycqlgABbMYxfnEjpTbo3uhjF9
	DoUoESqN5l+bwzu4t4dLakB90D8QNmYlAlr2wYlBGXkZ0/E+ObpMzSvKcyureoXT+4dn0iLngzlyP
	R1QNpvzmapW8pGMYju2fN2d+ej/F6oYVE2czEp6/QoZB017IHXuw7vwroWLU5+NWPNeRrsRTlUMpf
	mrTeV3k2K+OZqMwC1AgZemIoZclgj7RoZ23uzNbrDT2a2c5M2BtApbaKt13DM07vnfeHMe8ThEn3S
	RwrGzpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI4U-00000009fnd-0HPm;
	Mon, 13 Jul 2026 14:55:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI47-00000009fTe-29Ry
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hg5tW1Rb6Nt7cG6Ff89MFT0HTZsA91xkclD1Vy8H15c=; b=PC0+vaSskbxKfKC/Ps89polJXI
	xKTdKMFNPkJYEwJ1392sQZ1OXN23Wd16736Ge46XSoazi7G6UmrbIvi9i5aKXza2PVFsOXO5jUNK5
	EO+9JAisE27SjasjInsPJvbb2XdBx2Un05cAEqJhe5obpOPq2oUJ+4lQXVKR4RjSdJuvJv/SValiE
	vpJl+bGHCzlZo16w2YQbpmJRcw9nrDGxFKZoeoJsg4F7n1Jez6tB4eoN3srsiJQEzp1akbwHB7zMv
	E/m87PnH0LmQ4TIPiQLFS/zCXnZM0/KORiQzxKHWkATxNuEwqxv3tM12klOTKFl1orDzM7749Sfq2
	G7P+90UA==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI43-0000000Bjuw-01ha
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:55:26 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hg5tW1Rb6Nt7cG6Ff89MFT0HTZsA91xkclD1Vy8H15c=;
	b=IAF9RlYRY32TgRdGT9RUVAxp8kZ+ISAA2djU9dBRkpEcG9FaNaKr9whnLDozCgy0seIGa6
	U5yICggsp6HBXPFGYOprdnY6FEQxihmgmE9Ti4KsqJpdc29NKTlePtZtUNfRzKACXWgKQ5
	M5GyPCZ6N2Q1JWDxYf1zcQRyAzSfLczT97j8wdS1RLQTkLZvfa31oD65V5nC0LofckDhHZ
	x2qLdC4AB5s5n6Y2oUzy3v8I4DV0re7fnhIoyBsrZ4toumES5fUP+EFGhg0uAPPPUuFNFo
	QvejdVnIiPIpu8ilBuKBmCvATk7MIubpoeXZGX6jZ2j7ODtkKIs5G3/cLTayGg==
Date: Mon, 13 Jul 2026 16:53:44 +0200
Subject: [PATCH v2 08/10] nvmem: imx-ocotp-ele: Remove the FUSE_ELE type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-8-b8266d93514b@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=CqKbLWJEprAuY0A/3w0FIvWFGg+83f0jb6ih5HsLxAE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkTxCb6Ecx23P9bN8iv/GeaXfd3LRl4au9x4pMfkdJn
 dnI8+51RykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwESYPzEynLpcPIm37Jje82n8
 3BYJGe8vnVrXGmZg/O7I+9MOQRJrjzIy3LvEOKm3duX/KWKmKyd9X+ht4fumNF1noe+/228nuh4
 7zgMA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155523_275770_70D85ADD 
X-CRM114-Status: GOOD (  10.74  )
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

There is no use in tracking the fuses that are only accessible via
ELE API and the current lists are incomplete. If the ELE API is
available it will be used as primary access method anyway, otherwise
the fuses not listed as accessible through the FSB can be considered
invalid.

No functional changes intended.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 6ac7d588c4bd..f07565c0a02d 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -19,8 +19,7 @@
 
 enum fuse_type {
 	FUSE_FSB = BIT(0),
-	FUSE_ELE = BIT(1),
-	FUSE_ECC = BIT(2),
+	FUSE_ECC = BIT(1),
 	FUSE_INVALID = -1
 };
 
@@ -215,7 +214,7 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 		}
 
 		type = imx_ocotp_fuse_type(context, i);
-		if (type == FUSE_INVALID || type == FUSE_ELE) {
+		if (type == FUSE_INVALID) {
 			*buf++ = 0;
 			continue;
 		}
@@ -365,13 +364,9 @@ static const struct nvmem_keepout imx93_ocotp_keepout[] = {
 static const struct ocotp_devtype_data imx93_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 2048,
-	.num_entry = 6,
+	.num_entry = 2,
 	.entry = {
 		{ 0, 52, FUSE_FSB },
-		{ 63, 1, FUSE_ELE},
-		{ 128, 16, FUSE_ELE },
-		{ 182, 1, FUSE_ELE },
-		{ 188, 1, FUSE_ELE },
 		{ 312, 200, FUSE_FSB }
 	},
 	.keepout = imx93_ocotp_keepout,
@@ -381,7 +376,7 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 static const struct ocotp_devtype_data imx94_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 3296, /* 103 Banks */
-	.num_entry = 10,
+	.num_entry = 9,
 	.entry = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
@@ -389,7 +384,6 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 		{ 12, 24, FUSE_FSB },
 		{ 36, 2, FUSE_FSB  | FUSE_ECC },
 		{ 38, 14, FUSE_FSB },
-		{ 59, 1, FUSE_ELE },
 		{ 525, 2, FUSE_FSB | FUSE_ECC },
 		{ 528, 7, FUSE_FSB },
 		{ 536, 280, FUSE_FSB },
@@ -399,7 +393,7 @@ static const struct ocotp_devtype_data imx94_ocotp_data = {
 static const struct ocotp_devtype_data imx95_ocotp_data = {
 	.reg_off = 0x8000,
 	.size = 2048,
-	.num_entry = 12,
+	.num_entry = 9,
 	.entry = {
 		{ 0, 1, FUSE_FSB | FUSE_ECC },
 		{ 7, 1, FUSE_FSB | FUSE_ECC },
@@ -407,9 +401,6 @@ static const struct ocotp_devtype_data imx95_ocotp_data = {
 		{ 12, 24, FUSE_FSB },
 		{ 36, 2, FUSE_FSB  | FUSE_ECC },
 		{ 38, 14, FUSE_FSB },
-		{ 63, 1, FUSE_ELE },
-		{ 128, 16, FUSE_ELE },
-		{ 188, 1, FUSE_ELE },
 		{ 317, 2, FUSE_FSB | FUSE_ECC },
 		{ 320, 7, FUSE_FSB },
 		{ 328, 184, FUSE_FSB }

-- 
2.55.0



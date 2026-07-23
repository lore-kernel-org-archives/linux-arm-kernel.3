Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97646C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnjH8bUvLNMs032Y3RxCllB4beQC3Ai/Gw/n6qJweSY=; b=lbNR+MLDz4siOHYY6MA4/IGDhs
	06AOZ7iYJG6ksAGgWq12mJGgMgwhHwcxjHXeOM3NZN5l9KyRp1pL8ZYs3lXaoeBXiJyCj0i5cPwTN
	9DeNSFaNy+Hwer7Ae0GyHmsUBg5eO4hDTzhuhjH734lOLYaA1lqtECwcSAvlqpuVrsK4Mff+OlomO
	EbNYKMzhb8K0OPR1zLjhd49RMQn2iw1VA/svt9k321iPTHRiTVDXxygjK1kcKg2EeZrZJlet+vyFi
	2rkqPrrutjMqvJs0lNRoUSzXqVZwg3uaUmVhqZlk4t4aL4HEw2yH4yGa0TZmU4ODAPXj/2LUlkIqX
	/cXy2JQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrq-0000000De0U-00eH;
	Thu, 23 Jul 2026 07:29:18 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrd-0000000Ddsi-3nW7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:29:08 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnjH8bUvLNMs032Y3RxCllB4beQC3Ai/Gw/n6qJweSY=;
	b=tLt2lds2o+xcOPDJjekdPbcqbQgBJ/mhXEl8qpM8OXYfre9m1JeYyDUqWjPbCWrGVAunun
	GBHjvigpDqNegs3SRiJET/Y6QDn20w5zFqx+WjbBVEqgZi5+AopdQRItxp8InIcN11sTox
	OcCetf12vtKyZzHHzRO+l0bWCAVhvUYufViBjKnWNV8cVKtn7uGX3FwY9Ll4/5X1uQOT23
	AzxdQjjEOpfHbvxiBS53TocMoYw9iqvipsv8Ipdh1YeQmoykOKt177YnTt9jAYxb9Bke6F
	LTDjfF6QAQOsYPfpo2S0ZG1Ni79RHKJZpNpKu2nVhFf3wEr2ZGaYrEkZ6B1QOw==
Date: Thu, 23 Jul 2026 09:27:31 +0200
Subject: [PATCH v3 09/11] nvmem: imx-ocotp-ele: Rename FSB access map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-9-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=Ui1yqAl2SncRGvJ6Cd8lkM+A+lQmMiIxti+ManRJv8M=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0DYNlxexbPabTNc8fPnIi+HV22hplem7P/HNWs7yd
 Oe+R3PsOkpZGMS4GGTFFFmk+C1e25rF+sgfq46CmcPKBDKEgYtTACYiNZORYfGdNxcm+i07EZd4
 56xv3pPlvhsLLa8/iuQxe/T41RSpb0cZ/ju9fab16sSLF/ZFmnLFrdaeTgeiZXpS959duFPz0bP
 sIDYA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_002906_208857_9CE1F4AC 
X-CRM114-Status: GOOD (  12.87  )
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



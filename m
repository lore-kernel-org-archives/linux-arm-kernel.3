Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D725CC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgkBtP6nNzonijjkoBKV0QVOrecMeEewwoCV4e78j/k=; b=cc3eXTyHsFLRbYwhkPvfafixkl
	Bj/2X8WF5+CLqWEkNMVSwEhBOU8l6ycslOBJIBc3ZsleAQW5cWOnwpxy4gvy0WvGwDmFmpfmd1TQl
	5SJ4qXysw3c3MfDtwYqi2N3JwCXWWlHLgsSKVihCXbjpGHG7KN/uxWhigo0x8ssOzMiknGhvOHUvh
	ziRO/qzVkglfG/stiM9QXIQQV0QU7sFv2VDyjD4v89fA3ZHuXLSW1jJhsa5AhNqOWLTUHlxaxPQUR
	bRtRt7RfG7cDbKEaa1Op44cFkccRXCHmD2WwOY3hOt8lPQjxWGpS3yVf1ZzxpxxpuVG8QoUdwz62U
	zOfNDtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrp-0000000DdzC-1tg2;
	Thu, 23 Jul 2026 07:29:17 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrc-0000000DdsH-3ToO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:29:07 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgkBtP6nNzonijjkoBKV0QVOrecMeEewwoCV4e78j/k=;
	b=lOnt/d6hSJbLA9no6veiCv67FUqnZSXHJDXj+tzm54+7IW3dx9WDAUmVhL31E05IKckNc3
	KK4q0tyijNahzvdIceWZSpVy+sMxGpGSpDQpeK2OAihkYlVd6YOYnt8FCGbNCG5UdWFG+Q
	b4mG6sqryrb9BPfegYVXtzedD2YsArDpQfXzunLmHs4Bg+ByWjLbi2t4yZY4Rt2fdsdonL
	b2nm51DLd3bu9J86dwOVEYYHh4XV4gSmpZR2Up/awVk6eECGJJQmilzC26wzOUBh0/G9td
	r/Zqqf0JSIbvaAPvJIYZUM8h/nAFa15qPe4FHvmUGeTYTmNWtB9SaV7WLRKtXQ==
Date: Thu, 23 Jul 2026 09:27:27 +0200
Subject: [PATCH v3 05/11] nvmem: imx-ocotp-ele: Remove device-specific
 reg_read()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-5-e26930345b4c@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=tzG445aZESnsh+ntaPiN9Hp1gZDznh/2L9SQGlPLcAE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0LaPLefdBJbzmMSELp3maXqZ2WhN1KzQrQnGKdMeZ
 l1YJOzZUcrCIMbFICumyCLFb/Ha1izWR/5YdRTMHFYmkCEMXJwCMJHIwwz/a473LXgeV/J2I0/I
 5G0xTyL1/PKOBfExH5b89cGMY0HxWob/rld5Pv1nrZByPcynEcE976v33cWV7/otrZPbA5boJGz
 iAQA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_002905_040759_74BE2C13 
X-CRM114-Status: GOOD (  12.40  )
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998E1C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jRO/10N/zvQgQ5YhIHQJf/DZBZyqM7tDf/bFYg+EZU=; b=NfmZz21xPUyUWiBRXCeUcUbFVi
	o1zHGKiX/DD/6AnSyjffJt6Ee1fWj60dtzsGuklPXv0wIW0EQpUR1xt32Zc6gKBEvNE5fVNscyN8h
	C331ShksFudDfKLQQTyoK0Dzga9NiVYm8g2NGPdiwuyTnHNJfdknI1YWMGe7EAktfwwAFf6sASfW/
	A0owY4hjztO2G/odAFIYHhkZVDB5wa99Mw/DOZ/eyEbEVIdP5NWssdXgOoAYTfKwDdJ4H5fS1uUmI
	6AtccmGP9rxnqu6fzIZLjipnbvzCtLn8TE/NVILzapkfvcnh+5g4NkZ+7ZUqDb9MMcyt2eTqwCWcK
	0e+sL4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI47-00000009fVA-3wFU;
	Mon, 13 Jul 2026 14:55:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI43-00000009fQG-1Wwc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6jRO/10N/zvQgQ5YhIHQJf/DZBZyqM7tDf/bFYg+EZU=; b=iGU4tZQvWYuLoeH4wtjsmlWFkd
	Os3ULmz9i5f6qiJnYLMrHePX5vjCwF/5zGa/HC3s8plv4iavUxnzx+e5Ir8ZW/aHQcMYLChuEUK3R
	fdU0IIdUcGwxI0qYhQU/iExB5QZeMWWDoZZuQb72hEmZjDndo5JMppc7StY7gNPLt0LSS3cR1V9tg
	LnIB/ZT6ow4EgzHPYtdpAPauPXCVaXeQmDBvBvT2LTA6jAZFGpYPULzbqhKjJvNo1hNZf2/79fIO4
	07xSnWNAGsXU39vHGtIzB8kkID0e8Mu8p7ujPx1yb+7DgaeMJOyCRFDDu1SQfZ5u8x3acq8QLWVzG
	peDQb7wA==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI3z-0000000BjtA-1E8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:55:22 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jRO/10N/zvQgQ5YhIHQJf/DZBZyqM7tDf/bFYg+EZU=;
	b=G7c9ahl/vLqHu4vqSrFbE8izXxayNR1IFQQH1ZqM6dGxNuyiucKn4bpDKL7JqPp2gwZPYk
	iL4drDrblYmSTZrOTEQ/wLIqDZkMFgoa5xDOwKZAbLX/7QybE7SLMtu9J1UXnvnITbCab4
	adKjd++zdegxDI9EXX9mKt6ln7rtq5OYJkF1u6o2KbQ/BKP7lxbM38tYC2S95lS1fH+TMK
	+RUDqVxNmYVBY90633JXQImAsrB+vFyWez47TdyzfAqC3y9tYp0Uffa9UGL0OlCE52eEcO
	WvKl+TYseh8t+W4ImBChYa0YFKrElTR4DrlJ/f8G5kB/FNhYicHVLmAEbE4J0g==
Date: Mon, 13 Jul 2026 16:53:40 +0200
Subject: [PATCH v2 04/10] nvmem: imx-ocotp-ele: Add keepout table for
 i.MX93
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-4-b8266d93514b@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=uWHeQFtm8hXfW7ZA55vuDeShYnRX7s0r6QBPlDcypKQ=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT+CycqEz7e2v7S7N5+beclevY/7JGR//Oau83PdSN
 LulOn5yRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwEQWzWJkOGH1wnRq3p4UlRcW
 Srf6BAPFTJutao+XHqzNmFDhvmPWTYZ/Oi8D1GsmJvI2bTH7HpG7u/PKNsu5XBuXMcslzTVfa3q
 TAwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155519_632034_C781C105 
X-CRM114-Status: GOOD (  11.13  )
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

Add an overall keepout table to describe which fuse registers are
invalid and not accessible. No functional changes intended.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index a0d2985c6d03..dadec19ca252 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -34,6 +34,8 @@ struct ocotp_devtype_data {
 	u32 num_entry;
 	u32 flag;
 	nvmem_reg_read_t reg_read;
+	const struct nvmem_keepout *keepout;
+	unsigned int nkeepout;
 	struct ocotp_map_entry entry[];
 };
 
@@ -163,6 +165,12 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.read_only = true;
 	priv->config.add_legacy_fixed_of_cells = true;
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
+
+	if (priv->data->nkeepout) {
+		priv->config.keepout = priv->data->keepout;
+		priv->config.nkeepout = priv->data->nkeepout;
+	}
+
 	mutex_init(&priv->lock);
 
 	nvmem = devm_nvmem_register(dev, &priv->config);
@@ -172,6 +180,14 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct nvmem_keepout imx93_ocotp_keepout[] = {
+	{.start = 208, .end = 252},
+	{.start = 256, .end = 512},
+	{.start = 576, .end = 728},
+	{.start = 732, .end = 752},
+	{.start = 756, .end = 1248},
+};
+
 static const struct ocotp_devtype_data imx93_ocotp_data = {
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
@@ -185,6 +201,8 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 		{ 188, 1, FUSE_ELE },
 		{ 312, 200, FUSE_FSB }
 	},
+	.keepout = imx93_ocotp_keepout,
+	.nkeepout = ARRAY_SIZE(imx93_ocotp_keepout),
 };
 
 static const struct ocotp_devtype_data imx94_ocotp_data = {

-- 
2.55.0



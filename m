Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87C9CD98E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sn0zkwxkjcRi0kyDysBzGc2+An+WKtTOTF/+Ns6aFqU=; b=z3q5TXRYah9G1pM+mWAzunQrX8
	KjVweoT1FytSKcr/i3waOo0n/XVJb+9RNbT/dQyPUpy9eu5sK/fpUpoVQGelMYgVSToxkqACevhUY
	0aG8rjCiADz61z5z81E8fG7sjYhUi1qhcBErYFIGa0SGKwhYWGVRGeZf+YnXfPXdPLGAzIzt9vH+M
	DlQhiZVrnDv4FoemJnJViPSomPDNBCO/vl2XaeVlv7Tr/bA1Grigl/FfKVc9kVcChrfCrfgGYWX94
	icFMeWYmItZIaVzKGD7SFF/7QXbSL+p2iulNjpr+y0kgH7F9hMyOQJsMXZ8zd84YcNuVN/tAeOHRB
	to0GchuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSN9-0000000FhsJ-1f6z;
	Tue, 16 Jun 2026 11:54:27 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSMn-0000000Fhc5-1xO3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:54:09 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1781610840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sn0zkwxkjcRi0kyDysBzGc2+An+WKtTOTF/+Ns6aFqU=;
	b=MGiC63X2+bZdNcFOfkDCrx75L8mzz69LVegKwsNG+ITRqBcPTn9MO+NaFE10G090+ahEl+
	cFP9swYdyAxmSTfistzPDTGDFYyEcQPnK1C7Fj0K4386AUALDx8dtq0MKI3KcdNFJ+NtzI
	kdt/ixno+Wm8AIGTQx8Q4JyMMib9te6H5hJQtLvCEV3E++Al83vWPX4r2w3syyrXlNPYIa
	lA4CrSd0I8mr+2wrT5rUYwnKfyrqy6xKPnm+Oz9uhCuEdmg4EQE7MG/iSNSf8AdC0o+OCH
	oXeSE/hEIWfn5kxO67BP4DLpuC8c62xJXLQ8lyG5OznfNaYusqQfi/PraS0/Fg==
Date: Tue, 16 Jun 2026 13:52:21 +0200
Subject: [PATCH 6/9] nvmem: imx-ocotp-ele: Support the ELE API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-6-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5166;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=SX9+KRWQlN1Se+mN/BgGpZMbgHYrQ4jT0MVK0wYHiOA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIcvQMvR+Vu/5CRsaZCcKMq6bY7js47tH+XHa8756fP1iI
 TzZvSO0o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJ25YwME9SiWpX/14cyOIhq
 P3+yfn7gx6kXVnMuEFu72dv6nIr0dIb/IclM86PLTl3OXrtpz5+8R+9X7BeaufSmclKV05YFU9h
 luAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_045405_837127_8FE66B67 
X-CRM114-Status: GOOD (  19.66  )
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

The fuses inside the Edgelock Secure Enclave are currently not
accessed via its API but through the FSB block which provides
limited access to some fuses.

The ELE API allows us to access all fuses with read/write
permissions. Therefore use it as primary method and only fall
back to the limited FSB if the ELE API is not available.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 76 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 9d3f94e35508..92cc061b9b34 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -6,10 +6,12 @@
  */
 
 #include <linux/device.h>
+#include <linux/firmware/imx/se_api.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/if_ether.h>	/* ETH_ALEN */
@@ -44,6 +46,8 @@ struct imx_ocotp_priv {
 	struct nvmem_config config;
 	struct mutex lock;
 	const struct ocotp_devtype_data *data;
+	void *se_data;
+	struct platform_device *se_dev;
 };
 
 static enum fuse_type imx_ocotp_fuse_type(void *context, u32 index)
@@ -72,6 +76,7 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	enum fuse_type type;
 	u32 *buf;
 	void *p;
+	int ret;
 	int i;
 	u8 skipbytes;
 
@@ -92,6 +97,19 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	buf = p;
 
 	for (i = index; i < (index + count); i++) {
+		/*
+		 * All fuse registers can be read via ELE. If the SE device is
+		 * available, always prefer it.
+		 */
+		if (priv->se_data) {
+			ret = imx_se_read_fuse(priv->se_data, i, buf++);
+			if (ret) {
+				mutex_unlock(&priv->lock);
+				return ret;
+			}
+			continue;
+		}
+
 		type = imx_ocotp_fuse_type(context, i);
 		if (type == FUSE_INVALID || type == FUSE_ELE) {
 			*buf++ = 0;
@@ -113,6 +131,32 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	return 0;
 };
 
+static int imx_ocotp_reg_write(void *context, unsigned int offset, void *val, size_t bytes)
+{
+	struct imx_ocotp_priv *priv = context;
+	u32 word = offset >> 2;
+	u32 *buf = val;
+	int ret;
+
+	/* allow only writing one complete OTP word at a time */
+	if ((bytes != 4) || (offset % 4 != 0))
+		return -EINVAL;
+
+	/*
+	 * The ELE API returns an error when writing an all-zero value. As
+	 * OTP fuse bits can not be switched from 1 to 0 anyway, skip these
+	 * values.
+	 */
+	if (!*buf)
+		return 0;
+
+	mutex_lock(&priv->lock);
+	ret = imx_se_write_fuse(priv->se_data, word, *buf);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
 static int imx_ocotp_cell_pp(void *context, const char *id, int index,
 			     unsigned int offset, void *data, size_t bytes)
 {
@@ -136,11 +180,18 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static void imx_ocotp_put_se_dev(void *data)
+{
+	platform_device_put(data);
+}
+
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct imx_ocotp_priv *priv;
 	struct nvmem_device *nvmem;
+	struct device_node *np;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -152,16 +203,36 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	np = of_parse_phandle(pdev->dev.of_node, "secure-enclave", 0);
+	if (!np) {
+		dev_info(&pdev->dev, "missing or invalid SE handle, using readonly FSB\n");
+	} else {
+		priv->se_dev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!priv->se_dev)
+			return dev_err_probe(&pdev->dev, -ENODEV, "failed to find SE device\n");
+
+		ret = devm_add_action_or_reset(&pdev->dev, imx_ocotp_put_se_dev,
+					       priv->se_dev);
+		if (ret)
+			return ret;
+
+		priv->se_data = platform_get_drvdata(priv->se_dev);
+		if (!priv->se_data)
+			return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+					     "SE device not ready\n");
+	}
+
 	priv->config.dev = dev;
 	priv->config.name = "ELE-OCOTP";
 	priv->config.id = NVMEM_DEVID_AUTO;
 	priv->config.owner = THIS_MODULE;
 	priv->config.size = priv->data->size;
 	priv->config.reg_read = imx_ocotp_reg_read;
+	priv->config.reg_write = imx_ocotp_reg_write;
 	priv->config.word_size = 1;
 	priv->config.stride = 1;
 	priv->config.priv = priv;
-	priv->config.read_only = true;
 	priv->config.add_legacy_fixed_of_cells = true;
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 
@@ -170,6 +241,9 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 		priv->config.nkeepout = priv->data->nkeepout;
 	}
 
+	if (!priv->se_data)
+		priv->config.read_only = true;
+
 	mutex_init(&priv->lock);
 
 	nvmem = devm_nvmem_register(dev, &priv->config);

-- 
2.54.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDECC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3LyG1mkg7NlCAYeLHiZsZMLil8RCSZiCNMrxGuaTsk=; b=04mGM4baMXHuaMZG/G6EyGiRVK
	LwVVpF1ofI7kOCVE6ukTP+0H9F3Eud1jRTeOO7Ftekzq4YdpAzom4yDWusxYRTg5wDeSImPF+AD/V
	pEf2R1sFk+g2BGs5/JeB9HR9Vn8FoOq/3/K6wYuGC/BxNYWI0N+rmXZr+nIIV2DLozChENTU0puol
	I9Z50QOTrnOfamDOYdohk6K1OSjKPmrLlaeyrixTsa/f7rNI+XNonPjNJzeQ56doWNE3Xzat187Zs
	xXg77gK3QUHJTj3ReKHz+Nru1QJG7qFg5AjdCIAWTgsikk4uYjHBJ8hXGWKH0J7nYpJ8siIc1Ghxb
	gMLNIPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJv8-00000008rBi-3qDl;
	Fri, 07 Feb 2025 08:41:06 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJrB-00000008qHX-27mn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917422; x=1770453422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q3LyG1mkg7NlCAYeLHiZsZMLil8RCSZiCNMrxGuaTsk=;
  b=MRuHFURsE2qxh6iEm0oEdFq4VjWOfK1MjEN0W8C2yAHTAj7hFV1CRXA9
   8+gLsaK6+7jR2c9WR1HwnlI6lWbO7P5RXKVJwwj4fX0mdVGaKd9qy2LOP
   tQ+n+7cidLXvoEJnlFpnCHT+u7rjqcuy/8TYHJcs/vQGwoXK3eJCvgNm3
   FO3Sm2qYt6yjRvoxSvhQqftaTufqw5QVnBxJyqc1KVqzSaPbtGxxc+35g
   ReGZYamUiUIVG5M2LAJKp9P9o5cwKJ6cMVBvsxKYMD7nk8PrtmQnJWL/L
   Hp9NBOFzV/Z7krOTZ+x7foTHBc43Qb6Vyfdigq2NbnG01kQhpHVBSQY54
   Q==;
X-CSE-ConnectionGUID: vpSVzm22RyO5Zr0U+CasfA==
X-CSE-MsgGUID: 3H5g9f8PSaa/MPkbu7lblQ==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636074"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:38 +0100
X-CheckPoint: {67A5C615-0-7A8FD441-CBCD789D}
X-MAIL-CPID: 66C78CBF8FFC8EE94A2495468FCDC6F7_3
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C276168331;
	Fri,  7 Feb 2025 09:36:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3LyG1mkg7NlCAYeLHiZsZMLil8RCSZiCNMrxGuaTsk=;
	b=ML4qHaj/+G+iPMqG7hy85nGYawKwktErwhj0TGxUNBfGJktZS+6BlIGuBLvZOwd1JX5Tfm
	VKS19bWSBMEjY9WBG/CTIvWdVOS09LONWi3fKfe+5Tm96bB30WafxXrFTbt2J0RSUCh4yR
	cPg50xa1p378DJL4DXKIDvhu9wwt7EFEjfMBGa3Q/I6O63xislEILXtXObA89EzmyoBYXU
	JGTX5kUmTzV59i34mlZED/N2HL2uNmev1hQZIWKspdNa0dpvYfqxyIDTl2du4ia58Az9JC
	/cf5FxYX5wHf8CbUTf4gPN+0o01UgAlVb6qBsaQMajpn0e2CIrlJz2A2k++zAA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] nvmem: imx-ocotp: Support accessing controller for i.MX8M
Date: Fri,  7 Feb 2025 09:36:07 +0100
Message-Id: <20250207083616.1442887-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003701_843745_83B16A02 
X-CRM114-Status: GOOD (  19.39  )
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

i.MX8M OCOTP supports a specific peripheral or function being fused
which means disabled, so
 - Introduce disable_fuse for a list of possible fused peripherals.
 - Iterate all nodes to check accessing permission. If not
   allowed to be accessed, detach the node

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/nvmem/Kconfig     |  3 ++
 drivers/nvmem/imx-ocotp.c | 74 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b93..ba5c928cab520 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -84,6 +84,9 @@ config NVMEM_IMX_OCOTP
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-imx-ocotp.
 
+	  If built as modules, any other driver relying on this working
+	  as access controller also needs to be a module as well.
+
 config NVMEM_IMX_OCOTP_ELE
 	tristate "i.MX On-Chip OTP Controller support"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index c5086a16450ac..b15cbdae66a7c 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -589,6 +589,74 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static int imx_ocotp_check_access(struct ocotp_priv *priv, u32 addr, u32 bit)
+{
+	u32 mask, ret, val;
+
+	mask = BIT(bit);
+
+	ret = imx_ocotp_read(priv, addr, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	/* true means disabled */
+	if (val & mask)
+		return -EACCES;
+
+	return 0;
+}
+
+static int imx_ocotp_grant_access(struct ocotp_priv *priv, struct device_node *parent)
+{
+	struct device *dev = priv->dev;
+
+	for_each_available_child_of_node_scoped(parent, child) {
+		struct of_phandle_args args;
+		u32 idx = 0;
+		u32 addr;
+		u32 bit;
+
+		while (!of_parse_phandle_with_args(child, "access-controllers",
+						   "#access-controller-cells",
+						   idx++, &args)) {
+			of_node_put(args.np);
+			if (args.np != dev->of_node)
+				continue;
+
+			/* Only support one cell */
+			if (args.args_count != 2) {
+				dev_err(dev, "wrong args count\n");
+				continue;
+			}
+
+			addr = args.args[0];
+			bit = args.args[1];
+
+			dev_dbg(dev, "Checking node: %pOF disable fuse addr: %u, bit %u\n", child, addr, bit);
+
+			if (imx_ocotp_check_access(priv, addr, bit)) {
+				of_detach_node(child);
+				dev_info(dev, "%pOF: disabled by fuse, device driver will not be probed\n",
+					 child);
+			}
+		}
+
+		imx_ocotp_grant_access(priv, child);
+	}
+
+	return 0;
+}
+
+static int imx_ocotp_access_control(struct ocotp_priv *priv)
+{
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+
+	if (WARN_ON(!root))
+		return -EINVAL;
+
+	return imx_ocotp_grant_access(priv, root);
+}
+
 static int imx_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -622,9 +690,13 @@ static int imx_ocotp_probe(struct platform_device *pdev)
 	imx_ocotp_clr_err_if_set(priv);
 	clk_disable_unprepare(priv->clk);
 
+	platform_set_drvdata(pdev, priv);
+
 	nvmem = devm_nvmem_register(dev, &imx_ocotp_nvmem_config);
+	if (IS_ERR(nvmem))
+		return PTR_ERR(nvmem);
 
-	return PTR_ERR_OR_ZERO(nvmem);
+	return imx_ocotp_access_control(priv);
 }
 
 static struct platform_driver imx_ocotp_driver = {
-- 
2.34.1



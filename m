Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD7CC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VosXjbK9hgCnWe/dUqqI+OCmClOYizovvRAwqgJ17+k=; b=m68NWQdMjQjDz1qdIm9gwm01FI
	Cumtk5UnmA446BsOk4+ivRCXqJByoi6XQtQVLmoD0yluiUhfh1EHjPxwA8EOEMD/FmCVVaDctPzJa
	oz464Qbp06dg9BVcxGP4SNMlrgKv9jXjH+Nb/6UbJQFgHx3hrzJuOX/V4puTkxuSF3/nsrgw4QJPW
	QSZRQhgmwFPqOCJHFXUUf9186zkm7L6Y+WPBvXIYM0xZ0fdq/OOVUXqUI+RXyICMNj9S06ldsck5r
	wBp5tAcMQMV+hC1naCxb6B5dstBTykxyyBe6SycfsCvgpLczyCUEUoM0VrKMlx3Ncjrmfapd6mZ0H
	N6QMNL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0wk-0000000H9IO-1QHL;
	Thu, 20 Feb 2025 07:26:10 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0t4-0000000H8Mw-1zu2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 07:22:24 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250220072219epoutp02a48eb51d15c9046c262349aafd2fa811~l2aZIhACn0656206562epoutp020
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 07:22:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250220072219epoutp02a48eb51d15c9046c262349aafd2fa811~l2aZIhACn0656206562epoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740036139;
	bh=VosXjbK9hgCnWe/dUqqI+OCmClOYizovvRAwqgJ17+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B50vyntqJ4OE0IwRn9/Mmk8Em53hD18OlgKhWRQVz6zIOvF+asJ7CPg1+ITwhNmpz
	 bJZEjY1DZRzeb54qKWChF1CSN1rR8BT2tELoa5sNaOl/ZcEudo+FVIRSo0H7zDoext
	 aWXXDDL9298ylBd8CkaD/rSjIHf9AjzGlibZggxo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20250220072218epcas5p3fc7ee5d0a3010456fb638d960ede238d~l2aYgbmB_1640116401epcas5p3G;
	Thu, 20 Feb 2025 07:22:18 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.176]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Yz4TN3ZDsz4x9Q1; Thu, 20 Feb
	2025 07:22:16 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	76.DA.20052.828D6B76; Thu, 20 Feb 2025 16:22:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250220044132epcas5p305e4ed7ed1c84f9800299c2091ea0790~l0OBJU5K50967409674epcas5p30;
	Thu, 20 Feb 2025 04:41:32 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250220044132epsmtrp1ba3b75104fbe2e8a9edb8b730e14fd19~l0OBIY3pU1731817318epsmtrp1F;
	Thu, 20 Feb 2025 04:41:32 +0000 (GMT)
X-AuditID: b6c32a49-3fffd70000004e54-00-67b6d8289d9b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F5.3E.33707.C72B6B76; Thu, 20 Feb 2025 13:41:32 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250220044129epsmtip1080e8366a6271e78c49953e1cc002298~l0N_ZBEgv1683716837epsmtip1q;
	Thu, 20 Feb 2025 04:41:29 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, swathi.ks@samsung.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
Subject: [PATCH v7 2/2] net: stmmac: dwc-qos: Add FSD EQoS support
Date: Thu, 20 Feb 2025 10:07:12 +0530
Message-Id: <20250220043712.31966-3-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250220043712.31966-1-swathi.ks@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBJsWRmVeSWpSXmKPExsWy7bCmlq7GjW3pBt8OSFr8fDmN0WL5gx2s
	Fmv2nmOymHO+hcVi/pFzrBZPjz1it7h5YCeTxctZ99gsLmzrY7XY9Pgaq8XlXXPYLLquPWG1
	mPd3LavFsQViFt9Ov2G0WLT1C7vFww972C2OnHnBbHGpfyKTxf89O9gtvmy8ye4g6nH52kVm
	jy0rbzJ5PO3fyu6xc9Zddo8Fm0o9Nq3qZPPYvKTeY+eOz0we7/ddZfPo27KK0ePgPkOPz5vk
	Aniism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgH5V
	UihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYFOgVJ+YWl+al6+WlllgZGhgYmQIV
	JmRnPH65m6WgX6ji+MfLTA2MXfxdjJwcEgImEq+uLWbtYuTiEBLYzSjRPOctlPOJUaLxajcT
	nLP67XJmmJaXs+4zQiR2Mko8WfaSGcL5wihx52U3I0gVm4CGxPUV29lBEiICvxglPkw6DVbF
	LLCcSeL0gytgs4QFnCTuH74B1sEioCqx63szC4jNK2Al8fH2ASaIffISqzccAKvnFLCWWLHn
	F9huCYE7HBJ/Pn2CKnKROPxrFRuELSzx6vgWdghbSuJlfxuUHS+xuu8qC4SdIXH310SoenuJ
	A1fmAMU5gK7TlFi/Sx8iLCsx9dQ6sPHMAnwSvb+fQK3ildgxD8ZWlvj7+hrUSEmJbUvfQ63y
	kJi37gkLJFj6GCXuT1jLOIFRbhbCigWMjKsYJVMLinPTU4tNCwzzUsvhEZecn7uJEZyktTx3
	MN598EHvECMTB+MhRgkOZiUR3rb6LelCvCmJlVWpRfnxRaU5qcWHGE2BATiRWUo0OR+YJ/JK
	4g1NLA1MzMzMTCyNzQyVxHmbd7akCwmkJ5akZqemFqQWwfQxcXBKNTAFCBWsWhhceG1r2dlD
	fjcib8vpCrMt5/KQ9xZ174jj138bENh3+KjI0gx/1W9LCtotrq6KMmJunKny2uHV732PqjnX
	G+gsXW208Jcsc/2s6ncTjx04vohvy91t9j/6SqRbph/v5sv4c/2OyDSvGX5N748LaLf/DT7D
	w5NyMvlXYP8ypy79tcuDteImN+7Pi6p/b3NgXs6XXK/Nrot1TvL1sh9nfli28pnelPuHJyvy
	HGg+tnd/1nW+Fr5fQafa59Vs2PPl6bFNW36tPRZ7O3HjypO5Ti7Pdad5hFZ+9BX/rssisS99
	X5+HlIrKQtXS2xUrOP/M33vTJiS1pTJsKsOaVk/buYx3rNhZS0J78tYrsRRnJBpqMRcVJwIA
	6LStElsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsWy7bCSnG7Npm3pBm9uqFv8fDmN0WL5gx2s
	Fmv2nmOymHO+hcVi/pFzrBZPjz1it7h5YCeTxctZ99gsLmzrY7XY9Pgaq8XlXXPYLLquPWG1
	mPd3LavFsQViFt9Ov2G0WLT1C7vFww972C2OnHnBbHGpfyKTxf89O9gtvmy8ye4g6nH52kVm
	jy0rbzJ5PO3fyu6xc9Zddo8Fm0o9Nq3qZPPYvKTeY+eOz0we7/ddZfPo27KK0ePgPkOPz5vk
	AniiuGxSUnMyy1KL9O0SuDIev9zNUtAvVHH842WmBsYu/i5GTg4JAROJl7PuM3YxcnEICWxn
	lPh25hwTREJS4lPzVFYIW1hi5b/n7BBFnxgljt6/wg6SYBPQkLi+YjtYQkSgg0liz9STzCAO
	s8BGJoljlzaDVQkLOEncP3yDEcRmEVCV2PW9mQXE5hWwkvh4+wDUOnmJ1RsOMIPYnALWEiv2
	/AKq5wBaZyUxu8F1AiPfAkaGVYyiqQXFuem5yQWGesWJucWleel6yfm5mxjBsaMVtINx2fq/
	eocYmTgYDzFKcDArifC21W9JF+JNSaysSi3Kjy8qzUktPsQozcGiJM6rnNOZIiSQnliSmp2a
	WpBaBJNl4uCUamCK0N8vfvSN+eUdpycnB/menSBrscNoxxcduft3pRa4XIuaobUmu1WalbNU
	/ZuX6vW4b/PFPVP8tON2vX6ptP9HiPQFkUc/O9cqVb3QP9O8/fiJ/s6AHIUl6lOvVXV9Lz4Q
	Lfn0jtqMf6aHpDa8tZu97PoZOc/Zuzuq1hivck59rj5X9JiSgd/+qplcKo9feYu4L/26ZOYR
	t8If0ml3FDaLhqhI/3z8OML47q31zI15XyNY+Q+WSBose5+RcUqxqebKbLXUjntdFVmBs54Y
	aewS6FK6dJCtqlHoydcNLV/mls5U+vff4mTusZkby38/dYvzC0wQ/lPIdNwhcrOABCu/8Z6p
	H37ZaE7K2+Bh9qRHiaU4I9FQi7moOBEA8feWCwwDAAA=
X-CMS-MailID: 20250220044132epcas5p305e4ed7ed1c84f9800299c2091ea0790
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250220044132epcas5p305e4ed7ed1c84f9800299c2091ea0790
References: <20250220043712.31966-1-swathi.ks@samsung.com>
	<CGME20250220044132epcas5p305e4ed7ed1c84f9800299c2091ea0790@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_232222_823924_C14A9CF8 
X-CRM114-Status: GOOD (  20.06  )
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

The FSD SoC contains two instance of the Synopsys DWC ethernet QOS IP core.
The binding that it uses is slightly different from existing ones because
of the integration (clocks, resets).

Signed-off-by: Swathi K S <swathi.ks@samsung.com>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 1fadb8ba1d2f..22a263664f0a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -307,6 +307,29 @@ static void tegra_eqos_remove(struct platform_device *pdev)
 	gpiod_set_value(eqos->reset, 1);
 }
 
+static int fsd_eqos_probe(struct platform_device *pdev,
+			  struct plat_stmmacenet_data *data,
+			  struct stmmac_resources *res)
+{
+	struct clk *clk_rx1 = NULL;
+	struct clk *clk_rx2 = NULL;
+
+	for (int i = 0; i < data->num_clks; i++) {
+		if (strcmp(data->clks[i].id, "slave_bus") == 0)
+			data->stmmac_clk = data->clks[i].clk;
+		else if (strcmp(data->clks[i].id, "eqos_rxclk_mux") == 0)
+			clk_rx1 = data->clks[i].clk;
+		else if (strcmp(data->clks[i].id, "eqos_phyrxclk") == 0)
+			clk_rx2 = data->clks[i].clk;
+	}
+
+	/* Eth0 RX clock doesn't support MUX */
+	if (clk_rx1)
+		clk_set_parent(clk_rx1, clk_rx2);
+
+	return 0;
+}
+
 struct dwc_eth_dwmac_data {
 	int (*probe)(struct platform_device *pdev,
 		     struct plat_stmmacenet_data *data,
@@ -323,6 +346,10 @@ static const struct dwc_eth_dwmac_data tegra_eqos_data = {
 	.remove = tegra_eqos_remove,
 };
 
+static const struct dwc_eth_dwmac_data fsd_eqos_data = {
+	.probe = fsd_eqos_probe,
+};
+
 static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 {
 	const struct dwc_eth_dwmac_data *data;
@@ -401,6 +428,7 @@ static void dwc_eth_dwmac_remove(struct platform_device *pdev)
 static const struct of_device_id dwc_eth_dwmac_match[] = {
 	{ .compatible = "snps,dwc-qos-ethernet-4.10", .data = &dwc_qos_data },
 	{ .compatible = "nvidia,tegra186-eqos", .data = &tegra_eqos_data },
+	{ .compatible = "tesla,fsd-ethqos", .data = &fsd_eqos_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc_eth_dwmac_match);
-- 
2.17.1



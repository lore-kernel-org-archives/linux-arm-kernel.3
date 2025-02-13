Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE16C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 05:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnR8x/QWGaZyJdHs9NP0syapfl2485/0TtsJYsze2qw=; b=v4CYlFnqV0Upo+9Bn5K2i0H6lh
	4BUJ0lzRiTGouIBRxbCao7FG5rFfZY7wRkyv4Ffq3Zfxwlfd5GbCnTZ1N+TFZhjCrGXnnQOuGUUmI
	03twjZNnS9q5Jk+IqwjUgtSzSbmorpV2WOkuvdjFom32z2C8JFTeCZcVpeWcrj3IJxiXq2XpUXcYz
	T3wjSM8DDLReVvTcHutuyWMVtLYryCbLGMF182ikLxtlOJt403F/ndKDNJjKkhKgKjQ0SowhlNFUf
	inh3NHiIqM/YhfBEOFr/mbQRxyzu1q1UcWi/iAFblVVdocOuzNTOR9URKmOc8X0ZkSuJ+MqkulT7Y
	ZbirhTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRPD-00000009mCa-1kQF;
	Thu, 13 Feb 2025 05:04:55 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRNm-00000009m3L-27Jj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 05:03:28 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250213050323epoutp04947832a8cbb65726cd53418cc18a147e~jrAF6BFmD2830928309epoutp04j
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 05:03:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250213050323epoutp04947832a8cbb65726cd53418cc18a147e~jrAF6BFmD2830928309epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739423003;
	bh=UnR8x/QWGaZyJdHs9NP0syapfl2485/0TtsJYsze2qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cv0VPl9QmjA+BtoAQ+TQLgceunFMLARJsDvwRGJZaxoGUBHQ8O6aCEQIeejbiA+9P
	 JrzbrGnYf3ESqMLASI+lPFCQlfS6O1LhOnZgTq3Xru5ifMDixP4Rp63aVnePwBQrIr
	 Ho6qzdmBfnhKKP3KWbfpOQMVJ2IV7xScGbixrTx4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250213050322epcas5p2efed3bea7e9560cf1c30805f076501a2~jrAFSJzCV2150221502epcas5p2I;
	Thu, 13 Feb 2025 05:03:22 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4YtjkK37cLz4x9Q3; Thu, 13 Feb
	2025 05:03:21 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5C.90.19710.91D7DA76; Thu, 13 Feb 2025 14:03:21 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250213044959epcas5p1b6f6d5554f69b5c24a5b4a15c8bf1fc9~jq0ZmeAK42465824658epcas5p1G;
	Thu, 13 Feb 2025 04:49:59 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250213044959epsmtrp25c6fcdab4c48ef3ad722134f7e40dc7c~jq0ZlgrzH1368713687epsmtrp2j;
	Thu, 13 Feb 2025 04:49:59 +0000 (GMT)
X-AuditID: b6c32a44-363dc70000004cfe-0a-67ad7d19d0ec
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0C.F0.18949.7F97DA76; Thu, 13 Feb 2025 13:49:59 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250213044956epsmtip28a8b2eb288a328ea94a315978a58de69~jq0WyXiQY2273222732epsmtip2o;
	Thu, 13 Feb 2025 04:49:56 +0000 (GMT)
From: Swathi K S <swathi.ks@samsung.com>
To: krzk+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	conor+dt@kernel.org, richardcochran@gmail.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk, swathi.ks@samsung.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] net: stmmac: dwc-qos: Add FSD EQoS support
Date: Thu, 13 Feb 2025 10:16:24 +0530
Message-Id: <20250213044624.37334-3-swathi.ks@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250213044624.37334-1-swathi.ks@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCJsWRmVeSWpSXmKPExsWy7bCmlq5k7dp0g+5PwhY/X05jtFj+YAer
	xZq955gs5pxvYbGYf+Qcq8XTY4/YLW4e2Mlk8XLWPTaLC9v6WC02Pb7GanF51xw2i65rT1gt
	5v1dy2pxbIGYxbfTbxgtFm39wm7x8MMedosjZ14wW1zqn8hk8X/PDnaLLxtvsjuIely+dpHZ
	Y8vKm0weT/u3snvsnHWX3WPBplKPTas62Tw2L6n32LnjM5PH+31X2Tz6tqxi9Di4z9Dj8ya5
	AJ6obJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoF+V
	FMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQUmBXrFibnFpXnpenmpJVaGBgZGpkCF
	CdkZ6+aFFPQLVdx6u4G5gbGLv4uRk0NCwETi9Kz3TCC2kMBuRolVqwq6GLmA7E+MEguenGOE
	cL4xSrxaOZe9i5EDrOP4hWyI+F5GiZ9Te9kgnC+MEnMWt7GCjGIT0JC4vmI7O0hCROAXo8SH
	SaeZQRxmgbuMEpt677KBVAkLOElsfNfECjKWRUBVou83WDOvgJVE49zXzBD3yUus3nAAzOYU
	sJaYNukDK8gcCYE7HBJfl61jgyhykVg+9xgjhC0s8er4FnYIW0ri87u9UDXxEqv7rrJA2BkS
	d39NhIrbSxy4MocF5AZmAU2J9bv0IcKyElNPrQOHC7MAn0Tv7ydMEHFeiR3zYGxlib+vr0GN
	lJTYtvQ91FoPiYUtjdCg62OUOPH3G9sERrlZCCsWMDKuYpRMLSjOTU9NNi0wzEsth0dacn7u
	JkZwctZy2cF4Y/4/vUOMTByMhxglOJiVRHglpq1JF+JNSaysSi3Kjy8qzUktPsRoCgy/icxS
	osn5wPyQVxJvaGJpYGJmZmZiaWxmqCTO27yzJV1IID2xJDU7NbUgtQimj4mDU6qBKeDMpda2
	AGtRr2X53EcUz6xkq089JJG0w+z3AztBk56MW6tE1pkvNWAo1E264TmpwG6BW9Gy2pPdv6UK
	Xr/ljGDqcBXyT2AwtT37M/sPm2tPz/KMyeaX1fMal+u9brp4+XdWz6q/rmYKPjtua59uZixd
	saZZj2m99Q3vkJW8kl4bUh8bHfHTnF+7/RW3VNYuvt3WhyMM/365M0O9qzR7Xd38j61F+QoV
	Gs7TbV3cPXxvel3nPPzpsOz2X/EsHBsvFG8597TFsbvwpaP3j5/Guw4tr/ZQlKqe7XDSa9tn
	fvm8/jkx0u0p4b2WDUFb5/FnTmh1l7jSmfJkisIEhUXHlLZHTLVOY5rTJBnsWa7EUpyRaKjF
	XFScCAB+7qbWVwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsWy7bCSvO73yrXpBkce6lv8fDmN0WL5gx2s
	Fmv2nmOymHO+hcVi/pFzrBZPjz1it7h5YCeTxctZ99gsLmzrY7XY9Pgaq8XlXXPYLLquPWG1
	mPd3LavFsQViFt9Ov2G0WLT1C7vFww972C2OnHnBbHGpfyKTxf89O9gtvmy8ye4g6nH52kVm
	jy0rbzJ5PO3fyu6xc9Zddo8Fm0o9Nq3qZPPYvKTeY+eOz0we7/ddZfPo27KK0ePgPkOPz5vk
	AniiuGxSUnMyy1KL9O0SuDLWzQsp6BequPV2A3MDYxd/FyMHh4SAicTxC9ldjFwcQgK7GSVm
	T1vA0sXICRSXlPjUPJUVwhaWWPnvOTtE0SdGie7bC8ASbAIaEtdXbAdLiAh0MEnsmXqSGcRh
	FnjMKPHg1X82kCphASeJje+aWEHWsQioSvT9BmvmFbCSaJz7mhlig7zE6g0HwGxOAWuJaZM+
	gNUIAdWsermPcQIj3wJGhlWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMHxo6W1g3HP
	qg96hxiZOBgPMUpwMCuJ8EpMW5MuxJuSWFmVWpQfX1Sak1p8iFGag0VJnPfb694UIYH0xJLU
	7NTUgtQimCwTB6dUA9OetINT2j97ylpwT+4zTFDSrldpLonc0T7j4Yn3V6cr7Ti75n9Jz+b3
	vAy/Z8hNmX5D+u+v+KrUml2zk4+GqKdemPes8qgo/6PVDS7LY1oFgo0Pl/tK1x2unDZXtOSY
	DbPK/OIVbW6b/P4w+DqbVSqxy014yxH3//nhDc/DT0nvC1bWOF7h29ke2CX470mK0cpCsVVB
	RyQF/c7Iem2c1Hz/zI4PpmVXvRb8WfA0JsrudtGGGIdrh+O6o4WfGgtNPOkT2l/5cGHd7/0H
	vjxz3LxezvqpZlHLlMnX2PbzX9/5I9ei1YrP4GV9++RH+aG1rrf7ohWTJ296IiCtmJZfa+/u
	EdXelsbotapHOZyhRYmlOCPRUIu5qDgRAJYD578OAwAA
X-CMS-MailID: 20250213044959epcas5p1b6f6d5554f69b5c24a5b4a15c8bf1fc9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250213044959epcas5p1b6f6d5554f69b5c24a5b4a15c8bf1fc9
References: <20250213044624.37334-1-swathi.ks@samsung.com>
	<CGME20250213044959epcas5p1b6f6d5554f69b5c24a5b4a15c8bf1fc9@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_210327_006771_A4140AE7 
X-CRM114-Status: GOOD (  20.21  )
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
index 5d2dd123979b..e3b383d8e7ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -308,6 +308,29 @@ static void tegra_eqos_remove(struct platform_device *pdev)
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
@@ -324,6 +347,10 @@ static const struct dwc_eth_dwmac_data tegra_eqos_data = {
 	.remove = tegra_eqos_remove,
 };
 
+static const struct dwc_eth_dwmac_data fsd_eqos_data = {
+	.probe = fsd_eqos_probe,
+};
+
 static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 {
 	const struct dwc_eth_dwmac_data *data;
@@ -402,6 +429,7 @@ static void dwc_eth_dwmac_remove(struct platform_device *pdev)
 static const struct of_device_id dwc_eth_dwmac_match[] = {
 	{ .compatible = "snps,dwc-qos-ethernet-4.10", .data = &dwc_qos_data },
 	{ .compatible = "nvidia,tegra186-eqos", .data = &tegra_eqos_data },
+	{ .compatible = "tesla,fsd-ethqos", .data = &fsd_eqos_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc_eth_dwmac_match);
-- 
2.17.1



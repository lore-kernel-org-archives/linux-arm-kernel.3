Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5DBC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=sCMKVaP+cy0u4Wt+s96a/0ZTfWOMeEFbK8aMXkMagXQ=; b=BS4VvI1n9tLhjPyDSZeliAatOp
	+KdtaZHWR/3xHdi7YpTq7rUpLthvJeMn8tvb1yTk/IDiLSx1bAbRrhcOxtqu2LqtFupYAwNuujkSh
	nCUknnKm2fQttSUSLXMgAYpnsRMxTVWNdVZf6ax5I+vdVA/m6fu4tkZCjOicUjG2qWSmAXwEAASad
	0YlYVE05NNumItx2I3f+lsfsnxt3RQDPLQbme0kzPwqk19sFE1SJGhq00ptICcu2CjUPXxi/xeDP5
	83QAxi+5PY4jKvUQpDE+2paf968x7LCDbLQK6hDo587Jm/ZDNFoo1npIOOydIQQPwy/fA5lLJxaM0
	Ppg3Bctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UCj-00000009S3I-3X1S;
	Wed, 23 Apr 2025 07:07:34 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ty0-00000009ObX-07iW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:52:22 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250423065212epoutp03aa69c33682760f610b8846cff3f362b0~43-zN_e1o1562415624epoutp03o
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 06:52:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250423065212epoutp03aa69c33682760f610b8846cff3f362b0~43-zN_e1o1562415624epoutp03o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745391132;
	bh=sCMKVaP+cy0u4Wt+s96a/0ZTfWOMeEFbK8aMXkMagXQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=cxS8GEU+7Ab2SOkAiApnW7D7k+yUo7151cykyy7EqqffQgBs9F/mRf3QCOTHx8pDP
	 LmMszPKfRiEp29K/1uvR/sLZIqsJhns/UO5dkzsyrKKee0d6TNhRIo+XoBA4+NLSOB
	 qTvjhBODGlI5P0Z6go66T15RzgBeYCfUsSRH3uZE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250423065212epcas5p2e537f7634a3d93d9f54c4aea48399cca~43-y5S0v71817318173epcas5p2l;
	Wed, 23 Apr 2025 06:52:12 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.178]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zj8t25dc1z6B9mB; Wed, 23 Apr
	2025 06:52:10 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a~43S1K6yxW1700517005epcas5p2o;
	Wed, 23 Apr 2025 06:00:42 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250423060042epsmtrp2ffea677e8c78fe8fe5d99ded8a24997a~43S1JwWvn2017920179epsmtrp2h;
	Wed, 23 Apr 2025 06:00:42 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-4a-6808820af8c7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	17.34.08766.A0288086; Wed, 23 Apr 2025 15:00:42 +0900 (KST)
Received: from INBRO002053.samsungds.net (unknown [107.122.2.234]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250423060040epsmtip2463b8b5e2df2ed814f7deaae604d3280~43Szb_efD1997919979epsmtip2y;
	Wed, 23 Apr 2025 06:00:40 +0000 (GMT)
From: Yashwant Varur <yashwant.v@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cs0617.lee@samsung.com, g.naidu@samsung.com, niyas.ahmed@samsung.com,
	yashwant.v@samsung.com
Subject: [PATCH] arm64: dts: exynos: Added the ethernet pin configuration
Date: Wed, 23 Apr 2025 11:30:34 +0530
Message-Id: <20250423060034.973-1-yashwant.v@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsWy7bCSvC5XE0eGweud7BYP5m1js1iz9xyT
	xap3vBbzj5xjtdgy8zKzxctZ99gsNj2+xmpxedccNosZ5/cxWTyZ8ojV4v+eHewWqyY+YnPg
	8di0qpPNY/OSeo++LasYPT5vkgtgieKySUnNySxLLdK3S+DK+HD4FnvBbf6KzlOHmRsYJ/N2
	MXJySAiYSOxcfZupi5GLQ0hgN6PEjVNNbF2MHEAJKYmGN+EQNcISK/89Z4eo+coo8ezCb0aQ
	BJuArsS+L0cZQRIiAs8YJZa2LmUBSTALpEn8fdsJViQs4Clx7lcLE4jNIqAqMe/ZdzCbV8BS
	YvvbR0wQG+Ql9h88ywwRF5Q4OfMJ1Bx5ieats5knMPLNQpKahSS1gJFpFaNkakFxbnpusWGB
	YV5quV5xYm5xaV66XnJ+7iZGcChrae5g3L7qg94hRiYOxkOMEhzMSiK8v9zYM4R4UxIrq1KL
	8uOLSnNSiw8xSnOwKInzir/oTRESSE8sSc1OTS1ILYLJMnFwSjUwbRRf+kinNHiFor/O2VfJ
	eReDA/cdZ1q5mPvpOt/GTEkTSVGz1sPhs+P/eUhIHfFUvnWjfmPoriqXlvf+S2OnaMXdzeB9
	bbwoUfP26ojVnw60f7zTxpSiH6e3aGn045/cVbcSj56tv1rpFtFSHx/BYr9qjemSmx9M2XXy
	s3RP3kmofeWlOHVx1N6DEbb1IgxPJdRmH7sTM9/23t0i1iNTs6rbDx534Ak5ZdF8zfqGooHC
	g6wXBz8wiu8T+OJmavBpHZPOipXW0t+rHu248EDJzV2HR4XXp6Gk7mq1kpWFUmBysbjRBLOj
	Yt0xyx3/X3n4xH1FwK/Tr1b+iktmzm+7lDAjdsrheculOFsa2kWUWIozEg21mIuKEwHD0cEp
	1AIAAA==
X-CMS-MailID: 20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a
References: <CGME20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_235220_693607_6D17A90C 
X-CRM114-Status: GOOD (  12.45  )
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

This patch adds the ethernet pin configuration.

Signed-off-by: Yashwant Varur <yashwant.v@samsung.com>
Signed-off-by: Changsub Lee <cs0617.lee@samsung.com>
---
 .../dts/exynos/exynosautov920-pinctrl.dtsi    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
index 663e8265cbf5..778584d339d5 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
@@ -166,6 +166,24 @@ gph6: gph6-gpio-bank {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
+
+	eth0_pps_out: eth0_pps_out {
+		samsung,pins = "gph3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	eth0_rgmii: eth0_rgmii {
+		samsung,pins = "gph3-1", "gph3-2", "gph3-3", "gph3-4",
+				"gph3-5", "gph3-6", "gph3-7", "gph4-0",
+				"gph4-1", "gph4-2", "gph4-3", "gph4-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth0_mdc_mdio: eth0_mdc_mdio {
+		samsung,pins = "gph4-5", "gph4-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
 };
 
 &pinctrl_hsi2ufs {
@@ -750,6 +768,29 @@ i3c3_bus: i3c3-bus-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_4>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
+
+	eth_extpll_avb: eth_extpll_avb {
+		samsung,pins = "gpg3-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+	};
+
+	eth0_pps_out0: eth0_pps_out0 {
+		samsung,pins = "gpg0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth0_pps_out1: eth0_pps_out1 {
+		samsung,pins = "gpg0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+	};
+
+	eth_phy_reset: eth_phy_reset {
+		samsung,pins = "gpg3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+	};
+
 };
 
 &pinctrl_peric1 {
-- 
2.34.1



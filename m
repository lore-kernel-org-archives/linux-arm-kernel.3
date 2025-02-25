Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA149C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPSg6DYIbo5is+m87av+3FLHT15AQqV2IPDzqZE96f0=; b=eX6Lynct8oufp5C5ckkgSbsJ0r
	G5FUYcaYeQvHLyArrKFL4WNjP9I9dLQcIIpn32e5uQFmotq6BAtTNGl7f2rfjzCojMTUvtEkpwPx8
	62vH1M+UCBQVRzt0hZFaPkjjB8XXKphkltA8aR4fGN2+yZOJXroUL5IMNUgiNS2DtD2xxo0rszmZG
	UvxyhXR2qVufrxhwMmfA+DubBoXJ6utwZgAr0ILGN1M5RbvMXNZirqEut254kt8ZMnnn5Y0lWmU2T
	1MiPjXsKzRWetGOOBgBV97PMSlstQhcBXDffmfG+VxzHcUjU/iH4UCKlSE0x6maCI0quWvXy/cHg4
	32GF92PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsmV-0000000Gxgm-2Z7t;
	Tue, 25 Feb 2025 11:07:19 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsAG-0000000GpCY-2Kts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740479268; x=1772015268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lPSg6DYIbo5is+m87av+3FLHT15AQqV2IPDzqZE96f0=;
  b=EaJQvy9InBtuvxfJ398GcoWyhC+jMUWS7dyl01ji8cMw1M9Y7jpjZaCP
   Juj1eU3FNL3Lm8qg48tuMssewghrSwEa0BSNtfZ8T7o5rE9m5vYMV9PA0
   6nui+cNJMAI05CUF4leFxSKfSx5vg85tE4CXHAwUvHrbrMYprr4GbDSQg
   SSFgQ4TlVLKHa05S1XtLQt5GaDz5g2Tj54DqSpW1Od+DfEGO52HvUfsrx
   B0eCfV6rYItC1LXyVvxu1cHpHfu6XuLBZACv8BqlXHz8W4IS5g7PyfZzo
   eNfOPl21RIfC6dKPCpt9HhI+fdFMjOzn/1VQykffW4gzXGJe/yz345FLB
   A==;
X-CSE-ConnectionGUID: v326R6KsSHG/7qapPLMt3A==
X-CSE-MsgGUID: rMkZVVgATE67lMEW6J3zYA==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; 
   d="scan'208";a="42067831"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Feb 2025 11:27:47 +0100
X-CheckPoint: {67BD9B23-31-C21CC984-D1047F1F}
X-MAIL-CPID: E8C0C7D14AB069B46AB0984605807505_5
X-Control-Analysis: str=0001.0A00211A.67BD9B22.00E2,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B52BA167DD7;
	Tue, 25 Feb 2025 11:27:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740479263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPSg6DYIbo5is+m87av+3FLHT15AQqV2IPDzqZE96f0=;
	b=WPLx5pm7LwtPQ4R8fJGx/N9MFGaUlBKRVwYNsPk5yYS/x+EejAoMBp3u5jpsGfO4x3xqXb
	8sWY1NivLT/Uru+qtFJlCtHrVyoNARx4GI3Xh0DDBtH26ux69bSUsGoKQ3fsgkMLhD54PF
	DalpEASCCJF6L3bsfSaqZ/+gFeBjzjgBja/QyW0S6+Uje8nyvYcf7kJae7s/dvzGQ2E4r2
	15hr79s4wqxQNW+Xus04+9HNdx2ff7c8Vf2Mnr46PdrizdPtNBnepRKpjfqtGWccEs8svl
	kj/MGdeyhwl5BNziX4ZlZ8MV9j+ExX2xxX0l3JyLZfuZOMMFLwbIkhsuXR7tbw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/3] dt-bindings: PCI: fsl,imx6q-pcie: Add optional DMA interrupt
Date: Tue, 25 Feb 2025 11:27:21 +0100
Message-ID: <20250225102726.654070-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
References: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022748_890837_808C0315 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

i.MX8QM and i.MX8QXP/DXP have an additional interrupt for DMA.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 4c76cd3f98a9c..ca5f2970f217c 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -47,12 +47,16 @@ properties:
     maxItems: 5
 
   interrupts:
+    minItems: 1
     items:
       - description: builtin MSI controller.
+      - description: builtin DMA controller.
 
   interrupt-names:
+    minItems: 1
     items:
       - const: msi
+      - const: dma
 
   reset-gpio:
     description: Should specify the GPIO for controlling the PCI bus device
-- 
2.43.0



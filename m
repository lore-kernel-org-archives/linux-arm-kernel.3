Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9FCCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pvs8350FZrxwBnqnkvx08YGeQyjKhwj9ElyMOBOm5qk=; b=bE4/d3hbeEQpmwtVo1gO3RgI46
	ZGNezhdN+KQQQHCSPDxJHKhDiu1IIxy3sQ0ca1ugJvK5WaU668RfOzRKJHaT8Bm0shmRLTPnqXvze
	LZTfTxFlpXhGEybbJIAz2ljTo7vTC/Nv96y1z1iZeyTnHKkq55bfbKPjsZ1z0Bi3py1Mprmt8exhs
	PD8QdPtD0k65rJww/cD1AYfhk9yOxo8XEX0IEOpazqHCFvSub06fjzBBFeejeyMfhkUlrVYk/iHhR
	KrWlreE0MJdX72n+U4UoddM+7DHFUsP3KviwNY0V2L7fMzQRkh15NxRzj970zKr19gcNxsfU+4PLI
	QPwJ9gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2rW-0000000C50A-0mXg;
	Mon, 01 Sep 2025 11:38:14 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1PE-0000000Bqu7-22CG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756721096; x=1788257096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pvs8350FZrxwBnqnkvx08YGeQyjKhwj9ElyMOBOm5qk=;
  b=B8+8c28DMOozII4axYU36fVBIArVtNn65HKO/+TtpetQdUs/PeAF1XgS
   Dzo+wF0F70Mly6K/qKP3HU7/Fzuoc9bVjSRvmIVBrG7SdobcYXEkkAQX+
   qscobXlpHOC35AlOXWFbY/H/SE3U0N91lbMfFe//IMBB7MOks6W+EuNjj
   HFnlLcfUe+jHoUl8wIMbahMzlCTGQD8fXxlMb4eq1exjX5cV5ZZ+G8I7M
   V00LDxUN9SPQpArNcgNIH53O2g7ZteBXD1+EW4xrkVWLdHFUlcySlGYYu
   b++9Y+HL5XfIEvILXtSCoHMBD0xjpoUSb7n1dZcXtvWrnH49mdgWi+kRN
   w==;
X-CSE-ConnectionGUID: FgzPcpssSvmPFu5NPxH+mg==
X-CSE-MsgGUID: b7IrLCzIR+GoNMJPJVpGAg==
X-IronPort-AV: E=Sophos;i="6.18,225,1751234400"; 
   d="scan'208";a="46004685"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Sep 2025 12:04:54 +0200
X-CheckPoint: {68B56FC6-19-9821D066-F5C64F68}
X-MAIL-CPID: 88A8AB47C7CBFF3E8C2043CFAE755D90_2
X-Control-Analysis: str=0001.0A00210D.68B56F64.0063,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7516165AA3;
	Mon,  1 Sep 2025 12:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756721090; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Pvs8350FZrxwBnqnkvx08YGeQyjKhwj9ElyMOBOm5qk=;
	b=QIlrpxbEeu1QHO2DvCXxe16cISymPAm0umc7j/LIxN84QcfmQl/9dFP7UMMMdC3s96CC4P
	g2xOsNVciHe/25Md4WleOBzDiwVwAtKLqcqmou5HFMdAujdfBFI9yyI4eSAckG4nvIwFxB
	d04HKIFWqrhFwszu+ES4nQIM4/yR1zkFncW5wZnfas2eDz4ElMTVSOl/8wcmMRBaW63jkr
	vivwlnwejqjHc+a3TFrW7gsyKh/87qIUgDz2RdhvapF4FgfyQLEvAGkQFAZDPMJyDLq350
	PWJy2bbS5rQ7IFp3Ph16Qtw/UcH1mqruhPx+cYR6UJNr1+EIe8TB8BmP1j3MoA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add TQMa91xx SOM series
Date: Mon,  1 Sep 2025 12:04:29 +0200
Message-ID: <20250901100432.139163-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901100432.139163-1-alexander.stein@ew.tq-group.com>
References: <20250901100432.139163-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_030456_820833_FBE8BF63 
X-CRM114-Status: GOOD (  11.72  )
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

TQMa91xx series is using NXP i.MX91 CPU on an LGA or socketable type board.
MBa91xxCA is a starterkit base board for TQMa91xx on an adapter board.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* TQMa91xx series includes both CA & LA variant (socket & LGA)
  adjust commit message accordingly

 Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index ebafa6ecbcb64..0843c5e9275be 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1433,6 +1433,24 @@ properties:
               - fsl,imxrt1170-evk         # i.MXRT1170 EVK Board
           - const: fsl,imxrt1170
 
+      - description:
+          TQMa91xxLA and TQMa91xxCA are two series of feature compatible SOM
+          using NXP i.MX91 SOC in 11x11 mm package.
+          TQMa91xxLA is designed to be soldered on different carrier boards.
+          TQMa91xxCA is a compatible variant using board to board connectors.
+          All SOM and CPU variants use the same device tree hence only one
+          compatible is needed. Bootloader disables all features not present
+          in the assembled SOC.
+          MBa91xxCA mainboard can be used as starterkit for the SOM
+          soldered on an adapter board or for the connector variant
+          MBa91xxLA mainboard is a single board computer using the solderable
+          SOM variant
+        items:
+          - enum:
+              - tq,imx91-tqma9131-mba91xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa91xxCA
+          - const: tq,imx91-tqma9131        # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM
+          - const: fsl,imx91
+
       - description:
           TQMa93xxLA and TQMa93xxCA are two series of feature compatible SOM
           using NXP i.MX93 SOC in 11x11 mm package.
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35CBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HxGeV7xXFc6W+ct7dDtCqUAFCsNs4UQAyALJopA12VI=; b=5EOU+6XWIPkgL+LyWRXA3UBlsa
	EIs2lOrittig8jFJB/m1T6V0bGQzz8+1Hi5dhpXSeeEkDDy1JJeojc8tefIgj6eA8X5D2JDgJmCql
	jCXf+Sz//rPPmur1gZyxiwhYOgp0BeYlRpuWW1zOHw15FCU+LCBSxmXTA5iBcxkHEGbkU90/3Tql4
	c9TtX/HvztdfYGgoOy7Lfu4aQy01vuGgynvr8GZ5igW3q07msB0Ik5YYs76IWZWP1BKX/+Sw5TJjz
	LUoU85lCzQcRJL+GCIx0iTW1zCTe7C0gxgtyfdBDKUZCGGaX1Ey9jCMVhyWECclsEpR+PHBWYOr2D
	7WjTlIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCEr-00000009Bqc-3z4W;
	Fri, 25 Jul 2025 06:49:05 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBre-000000099xX-25Zt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:25:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424706; x=1784960706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HxGeV7xXFc6W+ct7dDtCqUAFCsNs4UQAyALJopA12VI=;
  b=pIe6eOusnm14aqoptEsn8kQNb8OjnRnKiS5JjstsvyRbse2cUBbkBaeS
   M5XReM7uyJ5C4F8EoIvZBvdWySHhxHaiGbTiRml4BaTUQ3Q1GY4kYkXoY
   qx+IGEcnpExl2XcpM3LJcqXEKPCWSSkT7KbURm0Ssla/CFG85+FV4XRzw
   VVzu5dniQ3010mLir9ZnfxJob1gfksYEIUlzYLIOaJEUX0TwBl1Mg0UPJ
   Irh1z/hT/3JDOpgzq9sOuE6kbhNc0ySh7ZV5npbLssji58OXVu2/DgTLY
   nEHQCXtTPAxNGvY34HQxoMDLq8xOTOELVArLCys/pfkZVYF8kuqPe8Ckw
   g==;
X-CSE-ConnectionGUID: tSmPr5WFRHCP/nj6HNiRsQ==
X-CSE-MsgGUID: lhp5tWKnTm60LG0pYPBxjg==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413371"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:25:04 +0200
X-CheckPoint: {68832340-2-4FC15ADB-CD71293B}
X-MAIL-CPID: 3FAB2EC1BECB98B599CA3BBB1032025C_0
X-Control-Analysis: str=0001.0A002102.68832340.005F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B6B517358C;
	Fri, 25 Jul 2025 08:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HxGeV7xXFc6W+ct7dDtCqUAFCsNs4UQAyALJopA12VI=;
	b=KBTgTsAUx2sSzETp81sZBYUzxzWBRIBR5IN/cknk9cvgsWSFG1BY4vQffATPggHfXFMPaM
	DeBdBN4ctIELnt2gdxZe1f7eEx+RZEZ7MD8pg5l1VgEo+V33Z42MrQhssq1KE3SJp4Il7u
	pqkImbzYseEzOAwN3OCHVgyvckshU/5RHMktzAgNmFFBYuDcdMcHuyDifFwRJuiYipOeyl
	fDEIfeGhy7Jj3nvh+av/9eona1/umPQDfsatVVafvTE1Cu4izoZ45Ady52g8a3oEb4MA4u
	ZLD3OW2BAZTiGY0AgC1WT2A5Gcg9RQIot0S05ePbtfJA9emxUvGeFIrq/JqwlA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: add TQMLS1012AL
Date: Fri, 25 Jul 2025 08:24:50 +0200
Message-ID: <20250725062454.271191-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_232506_848562_AB570D1B 
X-CRM114-Status: UNSURE (   6.60  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqmls1012al

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Fixed commit message subject

Changes in v3:
* None

Changes in v2:
* Collected Conor's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f494ada0c1966..0beb0040a7d34 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1571,6 +1571,12 @@ properties:
               - fsl,ls1012a-qds
           - const: fsl,ls1012a
 
+      - description: TQ Systems TQMLS12AL SoM on MBLS1012AL board
+        items:
+          - const: tq,ls1012a-tqmls1012al-mbls1012al
+          - const: tq,ls1012a-tqmls1012al
+          - const: fsl,ls1012a
+
       - description: LS1021A based Boards
         items:
           - enum:
-- 
2.43.0



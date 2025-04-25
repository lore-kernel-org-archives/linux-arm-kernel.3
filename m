Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030C8C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LFvB5wzEMrSQ5SEmlL4zPr1Syx49SD71KlRZNLYPV0c=; b=42npGX2pZH9/a+YRBndXH9ch+c
	qFug7JZtcOTW4AxPfDcpp5BZhPuqXaZdQYsiM4I8+azlNQoR21uPFhsV/3Mg/8zFv/TD0U66obdiN
	hLBZPdhJfY1FKEus2bmv6r5PSVRfQL1AcXJtMfCLRFUEFZwO4bCg+uwS5ypkl7yxlr90utKb7LPbD
	4oSkRvhKyWUlUiAe/zpY6DZY2CSSU4BeHLQkIZaSq/kH7c12JNIbY3JbZtk6otclw2i7Dn+ONBxGK
	FM80hvJQmBqQjx8xq+Xb7xiIFvJ6JVktC7dC8P+ajmJDXjSjxO28tZgjZH4pccO0rmXrY4lAAIAFA
	BbBWCQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8CmS-0000000G5ir-2rCg;
	Fri, 25 Apr 2025 06:43:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ckc-0000000G5Vj-3Yoi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 06:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LFvB5wzEMrSQ5SEmlL4zPr1Syx49SD71KlRZNLYPV0c=; b=W8S+Z7s3J9Cy7/6SSrlYq92k95
	nBWkahleFkhPstHDX9axPUblBw8OMMnim3TQE8nW1oasJPFMawt42UqtJECoGmRKD2Q1OXrvglK2O
	wpM9ANDn4oXH1H88fkBUdYoJwNhuev8LGCqBTYlEmVqn6bpaUfdwojEfYB/1XR59wvx6U4AdsiEK3
	55ruv8msAxB21td2Ww3GS9HlYiaLWq0E2DROkV0vz+b2HjX4SLYoYau1iiz1Fa+fqrizrlW6bS322
	+1O1jQHZhjudliy6Gv3y4fDGefGKnH+TDtcCU4sGlJu8pXt9q//TpGFHpg1iC5cFAQk0f1KpyHPxa
	IVWaYw3w==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8CkY-0000000BzgC-2rIV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 06:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LFvB5wzEMrSQ5SEmlL4zPr1Syx49SD71KlRZNLYPV0c=; b=asR+UFJY+1Q9qDM9twRX747NWI
	gAXQSD9SP/IrnVZ4Hs8a7I634qamOEB+bY8YpJzfuywiHdUKar/z68DhmsgAiJM11liRNIT11rCkt
	dpg+gDE3rC9HsX+PCdivBqI4nAhOlYt0VvOplaqMn2jmaUDnLdTRCsgz4rTUmtLRIXNyjoqSr3opE
	AN7olXUFcPRyFXGPu1B5j+aI5oSGQnpV5/ETxqDAsZrEkIffsh8AQp5r6SY2SrpNlHo4zR51nKRaX
	kpAYZGHGhJWUAu/lWQPuLmOrRVX4aRAvNKoOCTHw4xBh+ea9qiRFf0AI551vGVz/DQMVIyor7enos
	2J5LKUnA==;
Received: from [89.212.21.243] (port=50196 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u8CkH-003PCA-1N;
	Fri, 25 Apr 2025 08:41:08 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/2] bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93 board
Date: Fri, 25 Apr 2025 08:41:06 +0200
Message-Id: <20250425064107.174548-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_074127_331606_15DE8D7B 
X-CRM114-Status: UNSURE (   5.91  )
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

Add devicetree bindings for PHYTEC phyBOARD-Nash-i.MX93 board based on
the existing PHYTEC phyCORE-i.MX93 SoM (System-on-Module).

Adjust the compatibles for the existing phyBOARD-Segin-i.MX93 board, to
be able to add additional board based on the phyCORE-i.MX93 SoM.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..6abb58d599a6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1387,8 +1387,10 @@ properties:
 
       - description: PHYTEC phyCORE-i.MX93 SoM based boards
         items:
-          - const: phytec,imx93-phyboard-segin # phyBOARD-Segin with i.MX93
-          - const: phytec,imx93-phycore-som    # phyCORE-i.MX93 SoM
+          - enum:
+              - phytec,imx93-phyboard-nash  # phyBOARD-Nash-i.MX93
+              - phytec,imx93-phyboard-segin # phyBOARD-Segin with i.MX93
+          - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
       - description: Variscite VAR-SOM-MX93 based boards
-- 
2.34.1



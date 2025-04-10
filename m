Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614B9C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MD88gCL7rQbK+pc439u9tVo7TJPofOErBFBWtlbIJ60=; b=EiEsQqQLSfSFKPppQlW8cyFSsl
	oMTRxi8xEeF7J4sT2iHbapwOXkI/LfwNia6INYMKRxyPaTimjsVGygArAJyIBCKgqkayBJFcdoz8I
	qHbCrGHo0AQCj1RvfJxDg32wMW/yyzZ6xeHiupC4S5nI1y+w4gcbdkgFDl1enNnwBQvPBxR0rye35
	dURfcgigxkuZKwCrINaxHS+ufnvqryEbSuX+1xGrO0RnIk40wZjWftRM2qVfUoZ9bGUau2TmSUrTN
	a6n7YeSUvpEf8JkaXpWyUJB46wdztddeI8d/6UMotEc03dd3n7oS3dbTRWXaiK/0sZDUgxk+s4p52
	/Y5VN+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qJS-0000000ALIx-1mO2;
	Thu, 10 Apr 2025 11:43:18 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2q9k-0000000AJVJ-1MVe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 11:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744284796; x=1775820796;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MD88gCL7rQbK+pc439u9tVo7TJPofOErBFBWtlbIJ60=;
  b=c2hcPStgXMAhpS/ksOFDA63SuAtAoW9Qv/SPPUBGK9DewyNTQQ0wVknV
   4knQMBaKbq6TGbCyYZuys4cIzT1IKhq33KnkMfPkXcDHe+U7mI7VXo71P
   gP/RNSj91Oe+J+pPZ0Q7zZCYeXUfePMtL0Y627FdPH2eAFSQIOjyjgRVV
   MghoqacEdg4/JeHgiP7e2/63oXCRxRHoxT/+OSv8pWg8Hrv+SNDIZ0E98
   nY2JmhGkhhpmtM3vQ5mS3XOgQRDXjIcHWX5mwb+wot+8djVZW5rhwnJqb
   rSKZad8BUbB7i3uHwPq2KT2QKz+9Qt7AFs0M8/mW03MftO2EjgDMHaBgP
   g==;
X-CSE-ConnectionGUID: ftrXZWfaQzG4fZ8Xgk4A5Q==
X-CSE-MsgGUID: GfBzyNicRKeXSWTt2uBJoA==
X-IronPort-AV: E=Sophos;i="6.15,202,1739833200"; 
   d="scan'208";a="43454829"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Apr 2025 13:33:11 +0200
X-CheckPoint: {67F7AC77-9-B1D34AC3-DEA5B19F}
X-MAIL-CPID: 657CAC6F24C51A7ADDCC0D077348AF1F_4
X-Control-Analysis: str=0001.0A006370.67F7AC82.0092,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF0641677C0;
	Thu, 10 Apr 2025 13:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744284786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MD88gCL7rQbK+pc439u9tVo7TJPofOErBFBWtlbIJ60=;
	b=S+Mp5tI6t7kJ68kZ/rvlJx8BpAETCS6IW87/LY6TRHbRBv2J0YSWKKXpn3Bnif0ObnP+iF
	9kl5Pi35qEjdIdv2/DABsbTBqSn/IkVNTrygGy35csBEhLPB9VQ+SjJVTeNIj9BzEADMBT
	u+9lLLJEW5ILPS0CBhnoqu9q5quCRW9+M1neL0SzvMrnphplbgNow2zwjv4cH/mURqm9BI
	dopeahZjfiRR81vAhSKzYKLN1S11JMUmSN7w90hfjLx7fVCs61ge5QjQFNrB8tNTs9okJC
	zYI7M0N/wZCp/+mFoFghlrBXPniurliee3paZ614Rz3bjqxltPi/DR9tuPAk9Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Date: Thu, 10 Apr 2025 13:31:02 +0200
Message-ID: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_043316_848062_30686E76 
X-CRM114-Status: UNSURE (   7.28  )
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

TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a22..0ce2653066e91 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1403,6 +1403,16 @@ properties:
           - const: kontron,imx93-osm-s    # Kontron OSM-S i.MX93 SoM
           - const: fsl,imx93
 
+      - description:
+          TQMa95xxSA is a series of SOM featuring NXP i.MX95 SoC variants.
+          It has the SMARC form factor and is designed to be placed on
+          different carrier boards. MB-SMARC-2 is a carrier reference design.
+        items:
+          - enum:
+              - tq,imx95-tqma9596sa-mb-smarc-2 # TQ-Systems GmbH i.MX95 TQMa95xxSA SOM on MB-SMARC-2
+          - const: tq,imx95-tqma9596sa         # TQ-Systems GmbH i.MX95 TQMa95xxSA SOM
+          - const: fsl,imx95
+
       - description:
           Freescale Vybrid Platform Device Tree Bindings
 
-- 
2.43.0



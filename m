Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1486AD637D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 22:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xvTxlL4AVd1adTLjJKCTQxmhveAf7ghrK9pGb+92sCQ=; b=LhRhnlR68JrQaeq05Zw7vMewd0
	B/i1NbFTj3ZxlD3lYhjW583ZKZiP2y1k4Z21it1oiAt5O3YITZmDkYD0GbIGzuSbeuiLgrXXXDqUE
	f3lEBDdSUlvWANj53HZF3YJQWggQtEQ7x3kiNh4ZBNPxgM7GUBITzMYeY7eZ2cF2mDguVD1+RYrF9
	kT6tuxegzhNg8CgbYHoyxv7PBLAZDH6wJf0EojB3LP0RytScr5u0VjILTPHLR+4ByGme/0i6Mt2ic
	a8OJAP+0zcHMeDZa0RZGgkMht644dS6awN4UWmk9xc2qmlldi6t/qz5/dgnm0DLhKL4TwaRj2y8NE
	Aji0s+mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBMJa-00000008DOE-0jZ5;
	Wed, 13 Nov 2024 22:58:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBMHk-00000008D2i-41gO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 22:56:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0319A5C5B02;
	Wed, 13 Nov 2024 22:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD47C4CEC3;
	Wed, 13 Nov 2024 22:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731538588;
	bh=ppARoxV/BKuqM26l7GbAb1n0J5UopQIlgnjP2VYDPIc=;
	h=From:To:Cc:Subject:Date:From;
	b=nyNmEpTj99rigb0YjXknMOHR8svcWnsRjs1FchKtnDLUt6QDByAdr85hMX6/0npKq
	 HdVtlOxC211m6YH3DbKs888Vqt2bd39uSqkG8Kai1NdMMYbDXGSHzcrPOEKM3bs3eE
	 3n7UPexzl3tFD6lJBH2EK9Z7UyqSt0Qc7504Jd3aUWsCJsSILSOVHEeChrUp7WV4pv
	 +jO45a0vJ2q2pDXynL0BaJhaHrMoiDcAvmRhZt7NefwnZi+hqDBBWt+n8en4Yxi2eu
	 TyoCmNo3EdFVy7g7mz1nmZU762ku2DsIF69s3uHm6dJyRYkmYptg4U+NFSRpHoJDKL
	 +3cKBbPlJc2mw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: Unify "fsl,liodn" type definitions
Date: Wed, 13 Nov 2024 16:56:13 -0600
Message-ID: <20241113225614.1782862-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_145629_107654_DF81F233 
X-CRM114-Status: UNSURE (   9.68  )
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

The type definition of "fsl,liodn" is defined as uint32 in
crypto/fsl,sec-v4.0.yaml and uint32-array in soc/fsl/fsl,bman.yaml,
soc/fsl/fsl,qman-portal.yaml, and soc/fsl/fsl,qman.yaml. Unify the type to
be uint32-array and constraint the single entry cases.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/crypto/fsl,sec-v4.0.yaml       | 10 ++++++----
 .../devicetree/bindings/soc/fsl/fsl,qman-portal.yaml   |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
index 9c8c9991f29a..f0c4a7c83568 100644
--- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
+++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml
@@ -114,8 +114,9 @@ patternProperties:
           table that specifies the PPID to LIODN mapping. Needed if the PAMU is
           used.  Value is a 12 bit value where value is a LIODN ID for this JR.
           This property is normally set by boot firmware.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        maximum: 0xfff
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - maximum: 0xfff
 
   '^rtic@[0-9a-f]+$':
     type: object
@@ -186,8 +187,9 @@ patternProperties:
               Needed if the PAMU is used.  Value is a 12 bit value where value
               is a LIODN ID for this JR. This property is normally set by boot
               firmware.
-            $ref: /schemas/types.yaml#/definitions/uint32
-            maximum: 0xfff
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            items:
+              - maximum: 0xfff
 
           fsl,rtic-region:
             description:
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
index 17016184143f..e459fec02ba8 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
@@ -35,6 +35,7 @@ properties:
 
   fsl,liodn:
     $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
     description: See pamu.txt. Two LIODN(s). DQRR LIODN (DLIODN) and Frame LIODN
       (FLIODN)
 
@@ -69,6 +70,7 @@ patternProperties:
     type: object
     properties:
       fsl,liodn:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
         description: See pamu.txt, PAMU property used for static LIODN assignment
 
       fsl,iommu-parent:
-- 
2.45.2



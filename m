Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B46C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pn3Is8UK9CnbfJZosrvZC6Ey92uz6O33jauxiOsjsxA=; b=ytYpbORjE8bXV4o9f9rxHHS/rN
	rbQMUun95GX+AkYTBCxWbUbAalS0yNPsgFUEwkJEAO6d+R5rQtrnwT7iRNqQV98LZ7+7d+TQuk8sD
	4Eewu5xsXDBKw/vL9XafIlj5KoGzOkTZF7OiUllOT+4cH4sXFlq72RobbjV6GJeQ/L1EuQqZaALrV
	ooduRwRRgjYE7t6Fh2o2SqnRRMlRJiWnRIk97q3pjDlRmjehiA0YbHlbUuCcnRR6T93u03nHFfPRa
	xH508PvvbF8k8NrbP0ym7q4e3elTnnzOrn1y7PRDONNnmkB4eVgxzanvtGCE7s2tlBMoakEi2xHTk
	VOqveevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWc-0000000GHyO-03TC;
	Wed, 07 May 2025 17:25:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgv4-0000000G15o-1eLK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:42:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5A7C5C5DA4;
	Wed,  7 May 2025 15:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E47C4CEE9;
	Wed,  7 May 2025 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746632569;
	bh=Wq8+hagNHhDt0qgNoLvZp0IFuNFz4fjEvxG0I7XXFfg=;
	h=From:To:Cc:Subject:Date:From;
	b=JhsprL40DKDoJ/8ssEfDM8YpWELJdbYvICrLM7tteL1vAQ7odnDmbL5c7nH+KIfsY
	 bgxyn8gORtmn/MaH3ZWTaT1CijwyPRqLQhkuhtABDVpXDFCjxa9kkZy2Fjxb6zZt/X
	 FHJlNVQxhXO5Aqq9vX/dz8DvOa9VD/dUJPduhuJP5qdTWq9fMf+wFxswdxKJCeEl+6
	 7AOxeeJHLYNms2Nx8cg65XW6njIxoLFVSwqSd5qMl0TTZ2J//JAuqkDiipeeO7UI6b
	 3PenYl7wri6hT/2L9mNs/+6ZCWwW6g7MQ867i/749OxWMDNCrrZOmw19/6B4iiLv6l
	 7XB331fdsW+KA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml reference
Date: Wed,  7 May 2025 10:42:31 -0500
Message-ID: <20250507154231.1590634-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_084250_471785_95A0F471 
X-CRM114-Status: UNSURE (   9.78  )
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

The reserved-memory.yaml reference needs the full path. No warnings were
generated because the example has the wrong compatible string, so fix
that too.

Fixes: 304a90c4f75d ("dt-bindings: soc: fsl: Convert q(b)man-* to yaml format")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
index de0b4ae740ff..a975bce59975 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
@@ -50,7 +50,7 @@ required:
   - compatible
 
 allOf:
-  - $ref: reserved-memory.yaml
+  - $ref: /schemas/reserved-memory/reserved-memory.yaml
 
 unevaluatedProperties: false
 
@@ -61,7 +61,7 @@ examples:
         #size-cells = <2>;
 
         qman-fqd {
-            compatible = "shared-dma-pool";
+            compatible = "fsl,qman-fqd";
             size = <0 0x400000>;
             alignment = <0 0x400000>;
             no-map;
-- 
2.47.2



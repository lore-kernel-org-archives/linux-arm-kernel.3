Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F1D5B86F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vjYoU4AknhQnLbk0fFAptLSk3Ymve469cvSzLtU5w+4=; b=ec09YN/9BFcYkMMjzFPa78/QIJ
	jOFxoruXGxcEwSVjn08VjF5CMw/tPKy277YGzF2H7Ys3r3JDtbNAn65P+c7aWo4ka/N9P/ZPlH2NG
	EGQOzrtgAJVF0AAiTdXNI5TA3PkztAO1qsG+5sdkqkOEzcYRDHzNRKPFNSGpL2YKFIksaTHRKJTBW
	5MsiI1PxPZwAof470dob/Q55HqWtegRXQYVQNFM1yDAk7jDlOSuDb6i/SxXwjs+NJJWNmoziV/BSI
	vYYX0L7ZTtEIvxiu6Z7/BAfUWZ+2w5drbtghbuJh6UpZ5ZPMkTXrGr5xfHIIr6NetPcbBut+BSVJM
	K373wy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG8U-00000004IKX-0xoO;
	Mon, 15 Dec 2025 21:29:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG8Q-00000004IK3-3c0Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90D324329A;
	Mon, 15 Dec 2025 21:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE40C4CEF5;
	Mon, 15 Dec 2025 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765834178;
	bh=f66aDebDMOyvBBG4UY1pel21ioLx+nJ9RAjyW465PKQ=;
	h=From:To:Cc:Subject:Date:From;
	b=rcjvkXoofAITZ2X5CjahrM642ACtDytwJ/UcGupJaWyw1eFCZrQuJcJbIHq54Y+cd
	 ynrVRLBK0wJ4Z+LcUqrdfTxsGfubIhd0pARtdBgL6uD5hISpf2EMzumLgXl2qcnHln
	 BEyk6k7uC0AKox7Ecs8tlfWZSyWZ1zMX3hLwKe7s15sl3ZVlRL7YnCjEc8y0fxxaUW
	 DmtMA+059xR7GemypXNll6+n78M32q4Q8Ufh0hmd/33tR+jUX49zWXKlmAezbvbgEx
	 xfOp/YjeohlVGsTIBAyQedFr7vufU+Q7Q7ugUayHIUpWKelueMkC1I9oVEbnsYIqos
	 F0eDrbROyQSPA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm,vexpress-juno: Allow interrupt-map properties in bus node
Date: Mon, 15 Dec 2025 15:29:32 -0600
Message-ID: <20251215212932.3324144-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_132938_920727_3BFAFD0B 
X-CRM114-Status: UNSURE (   7.01  )
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

Allow interrupt-map properties which are already used in the bus node.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/arm,vexpress-juno.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
index 4cdca5320544..eae558c2758b 100644
--- a/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
@@ -157,6 +157,12 @@ patternProperties:
               - const: simple-bus
           - const: simple-bus
 
+      "#interrupt-cells":
+        const: 1
+
+      interrupt-map: true
+      interrupt-map-mask: true
+
     patternProperties:
       '^motherboard-bus@':
         type: object
-- 
2.51.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C701D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qF+3C8lWkCptQzvYRwoE6YLl9wZ4IDJow19haO5/YY=; b=ON6Rb5IJcL5VFS3cP52qwHwVQy
	1yuc2ig/LmhxsJA4Hpghrc4UJnABSBjHNjuU6iEKTS288/G9GYjhl8BApmarkuwHTZyqKZ1eargRe
	dDKfJyRZpShlLzfDALagm/ECvyrsg/kRI3Q8PwToDLrjCYI2c3s5Pf/0e50ilssQkexGzwdfLVVO3
	DGuAD590jT2oT222NMr9P8YsXA5vhPK19NpuhweQeyypUEbpwqvvMPT6edbRPVQ3gyf9ML/YifzyB
	u9xMJOOytSMFxeo9RpRExPtAaXC2MsNFC2hFkp4ljAWWtCaGBSHssXzGeNXA6zdCagmn+1OQqiJtt
	oPOAevfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG76-00000004I94-2MQs;
	Mon, 15 Dec 2025 21:28:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVG73-00000004I8R-3FkT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49CC743B34;
	Mon, 15 Dec 2025 21:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03545C4CEF5;
	Mon, 15 Dec 2025 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765834093;
	bh=MwEPe6yOtotUQ0GRK4y2j5mze7HbrjZNWC8je5U2g4A=;
	h=From:To:Cc:Subject:Date:From;
	b=NMNMYp94q3rH02CLHtiICX4yi2SW3CvsA9RB0BVOaoPypPzYeGLxD9YTdO8dLJ/Xz
	 zANEhXvJS3ikKvKMzRJdTlYXKfgTuq98Q4iL43IGeYuChH5/VffYjp+EuwvO/rG0/D
	 ps6+N3X7L+Lqxbpovqf9oBd6OO6Xys+qkgdwD9+KdevYiRSym3goCVBSpxJaC38Cfp
	 7TEg5ew4/RR5IjwrBciHfMUyn/GBbKEEVuxU1wedYwqUQuG1ioTjzbRiFhDf3aV8ih
	 8xBlVxdyCb8kHbZi0Rf6+1ch9RvNJDRK00D8x+GEG9oCQoYV5J/BqNwP+jYSZcGJOO
	 rwBhjzqREnkDw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: Allow 2 reg entries for brcm,iproc-nic-i2c
Date: Mon, 15 Dec 2025 15:28:05 -0600
Message-ID: <20251215212805.3322218-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_132813_833038_7AD66AE0 
X-CRM114-Status: UNSURE (   9.40  )
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

The brcm,iproc-nic-i2c variant has 2 reg entries.

The second one is related to the brcm,ape-hsls-addr-mask property, but it's
not clear what a proper description would be.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/i2c/brcm,iproc-i2c.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml b/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
index 2aa75b7add7b..daa70a8500e9 100644
--- a/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.yaml
@@ -16,7 +16,8 @@ properties:
       - brcm,iproc-nic-i2c
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clock-frequency:
     enum: [ 100000, 400000 ]
@@ -41,8 +42,15 @@ allOf:
           contains:
             const: brcm,iproc-nic-i2c
     then:
+      properties:
+        reg:
+          minItems: 2
       required:
         - brcm,ape-hsls-addr-mask
+    else:
+      properties:
+        reg:
+          maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.51.0



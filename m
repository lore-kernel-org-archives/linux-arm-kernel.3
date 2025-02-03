Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03670C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xn/aKMj8rBpDbKHKjQSOo/DmvgpvWH+n17foM/N7ZZY=; b=QfD1aVWarq2Qrs6VaTEBUzOaPj
	Qlud4N7/8rMHrIhZSiAjp6eZNB0GFcXqWUPuMVKpGU84GvjPdqzFZeovkWMzBgdf0j6xk3wMKl2R9
	CUX8iRi+Rv+z8417SD7qbBgMz5ki9Y8g4h9NYJ/RsvyvgjF9jWBlfjYk9L5c6h85bU3CxRXTWX9jX
	TniCaMLURu0XslgCsN5s+IVceRkeB9FA4tT+kf8ptQ4+1uAoktVeKhwWvR1Nf3mFzRPxOl9ZTzLIz
	4RW06IfCV6KlA4YFOTCjBKMJoD70D8fRSIEMgOR9/r4jaHSIQSWLGmqtZTj67Re+75K+skpo1Rk/S
	Z3a6sv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf49i-0000000Ggmy-308N;
	Mon, 03 Feb 2025 21:38:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf41g-0000000GfOP-0qDp;
	Mon, 03 Feb 2025 21:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB78D5C695A;
	Mon,  3 Feb 2025 21:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6341C4CED2;
	Mon,  3 Feb 2025 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618239;
	bh=etD/h9S0iZWTa4AlbpqPcrZ+lO5bLwSonKt8f2PPvbk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZGLYmgaEk61H37J6fRYCq/PqItJ4hR2Yss3x1uX/AuRdJoXEiErjpOm6yyDBXZx91
	 UY6J5JckwRc8pB2YXuO3VFr5wqHKk1oRPcmM5dMi1tA4eseDFrM/kiakG/NaOB5R1W
	 z2jE8aM6ziFV0jDxxkOfwH1LVi1VnAqC1QRRW7EmulnynuYaVK4/Usb8aG2Tfd62LM
	 Grf+uycAvB7biMVhM2n+tpID4C2uAkNrxePVvRsIt8l32qyJkCt0a8V6Gtxs1I+Wk4
	 bICpAUN8YeVgwte/YOCZk5SR5/Xoz2wVzJcyIKv/ELa2Srjr2xRa6pwW/SJl5rNwAO
	 JV1YiTttOOP7Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: physmap: Ensure all properties are defined
Date: Mon,  3 Feb 2025 15:30:35 -0600
Message-ID: <20250203213036.9816-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_133040_277373_95271C25 
X-CRM114-Status: UNSURE (   8.16  )
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

Device specific schemas should not allow undefined properties which is
what 'additionalProperties: true' allows. Add the missing 'ranges'
property, and fix this constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 18f6733408b4..1b375dee83b0 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -122,6 +122,8 @@ properties:
   '#size-cells':
     const: 1
 
+  ranges: true
+
   big-endian: true
   little-endian: true
 
@@ -143,8 +145,7 @@ then:
   required:
     - syscon
 
-# FIXME: A parent bus may define timing properties
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BA2C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ErdF9zbcnYBBoFr2LO3F6wn1clGA4i7eH2E+6c0H98=; b=x1IUFwj0nZv6GmSurs+FJ0SvRn
	b4DY06rCFUcl45v1qBvtzNHH6oqgqNubnd5jyV6wPy7Ssmul9bNR0BH3OGhlpwOst/858GqzPGQqr
	RnwW7h6zhXM2iVA/Cu2DJnuVxpL08QJIwHJ+JooeB+coT6B/9cb4NOEHY+PO1qHzZbn5eSclQWLnV
	9rqqFGmlqzAb/NVm/nsg/iqRh3OhDTYsHMa4RO3bv70N5y05dOM5Vxiz3eI74pNvY+7Y5Umi8Kia6
	YneR2ie33RWHakyePDhV2tM1mKbTfV/w+UQaIRsKje1TIADLJD5febdpaxXXTBCpo6s1OwUcygkDb
	oneWZR+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Hp-00000003P5U-2tSn;
	Mon, 14 Sep 2026 11:55:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65HT-00000003OvR-2Tg7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:55:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B29A40606;
	Mon, 14 Sep 2026 11:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EF51F00898;
	Mon, 14 Sep 2026 11:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386927;
	bh=2ErdF9zbcnYBBoFr2LO3F6wn1clGA4i7eH2E+6c0H98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JtOyZpq1Hhaq7VNsbGL3TUBK0A+uOjC4l63XYetDbuYHNvP8X7/kNNpJIHPECccb2
	 q80v2JBQKSHyYAdFkRNMic8WHrZyHrei1R+gr/8k/97b5wNyP/wm+YRBjmj4Wm2CsS
	 HOChWONdtXCFI7gI5jY9oGkmD5Enx+sciAbc2qGxkvdLGGWrVeGhEfgwudHVZ1lYXl
	 Gu4gSGyxcZdCnMDAYwm+YqKAjYlG5JvR1LHaVnAtgz/nwkF5cYrlyVXmXQ9o18DDTF
	 vgTyziKrxt3UM2V1eCV5ySxodsqjdYKzI8/9MToUqvXaiwOKNUE7LcPzLi9k3qmZNB
	 WlOu5sG8R1ZgA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:40 +0200
Subject: [PATCH v2 12/20] dt-bindings: watchdog: arm,twd-wdt: Allow power
 domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-12-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Allow TWD watchdog nodes to reference their power domain.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml
index 9646ac72051e..5f6a9d6b9976 100644
--- a/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml
@@ -33,6 +33,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.55.0



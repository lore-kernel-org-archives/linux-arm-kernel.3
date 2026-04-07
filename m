Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B551EDB7D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAbsbAq1PCE00ZnKQRp5igUPNBTUPMo9d2SDAd28FdM=; b=c2EzL/72RUVgB0z4ej+FxJMOUC
	EtzepSd8yMem9VLRFKuhnXmJBRTubhQYNyZ6dUqDRiYBcrdmq47k+vUFy39B+FuMczfD2q7YFff4c
	zIkNDszj29gCwJMmMHc/pz9SJ2H4km8blgjYKeqihV3lWgH4Q8HzSZzT1p5SSShjIwJ7rPSxFiIm9
	2iQXbaZuyvKYWKNila6jjViXeXsTw2D/lpdxT+fRu7HCs1Lh0UJ09GyTdAtOyGhyrKSF2us/pmLdc
	C7/2U1QMczIZivgAC4cvQkEtGWfiR+051xgaLqEOvkm9eGXGjtc3VCmQZmnrVwgJOEgEZukZE2n5N
	bw0cMbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAGHU-000000081X6-3r2F;
	Tue, 07 Apr 2026 23:56:28 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAGHP-000000081Ur-0WMw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 23:56:25 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4BFC8C026444;
	Tue,  7 Apr 2026 16:56:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4BFC8C026444
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1775606180;
	bh=FxZb5iB7wem8tBCkfh2yjwja+J217c+kc8Kc6lBt+94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DKYL0dGs1fToe1L0p3LU9iuewyQV8WtA8RUYyIGCjVtxkjBuOlOtWH9na+8Lu+ZP9
	 28q62mfgwX2JHaycS00pJy5RODqOdJegi/flPe/t4w3W6ia0SBv9PPtfuEdokjLsTn
	 HssldKzt+zpFy2ADS0K6vySuAdI18tLbqJKERzoY=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 3EE98AE81;
	Tue,  7 Apr 2026 19:56:19 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:PIN CONTROLLER - SINGLE),
	linux-omap@vger.kernel.org (open list:PIN CONTROLLER - SINGLE)
Subject: [PATCH 1/2] dt-bindings: pinctrl: pinctrl-single: Add brcm,bcm7038-padconf
Date: Tue,  7 Apr 2026 16:56:10 -0700
Message-Id: <20260407235611.550515-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407235611.550515-1-florian.fainelli@broadcom.com>
References: <20260407235611.550515-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_165623_179272_865EDDF0 
X-CRM114-Status: GOOD (  10.15  )
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

Add the "brcm,bcm7038-padconf" compatible to the pinctrl-single binding.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index 9135788cf62e..afe7329a1df2 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -38,6 +38,10 @@ properties:
           - enum:
               - marvell,pxa1908-padconf
           - const: pinconf-single
+      - items:
+          - enum:
+              - brcm,bcm7038-padconf
+          - const: pinctrl-single
 
   reg:
     maxItems: 1
-- 
2.34.1



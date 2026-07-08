Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D665C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hf32V+63XwuX6n+9vP5ONNThKfHkDDFnh3w93Wj8prE=; b=CovfGYXobd2EkP9C7y9jXZGjeq
	LN8sxEjRZqG+CvKfjeuk9ZYXpF4o8NbVctu/7tCEXD5BgRX+54cI5gVCqTejxPPYNIqWjRI8AU0xI
	YowUxED7b4xJn+Mfm2CouEqJJzsdByso98kuhiOB8eda8WBaX9XWWYW5ylWs1Vefw6H1Oxgim1z3v
	1LGGv0SlT05uznoj4vDQ9SrpONGj6VHGnsF24QchwOzKk+PqBkDP074xr0lEkat/erSJwqXfGraJu
	7a1HxQVkRHN3bmtuJ04sB1eeGvJYez2S8QJ26mbnSPvRoJS63b/5O0PwD+XCHRCQtLyAPHVWmLLYw
	XRw3H+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whODx-0000000GhXq-0kz5;
	Wed, 08 Jul 2026 09:05:45 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whODu-0000000GhVw-0uDP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:05:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so214790f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 02:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501539; x=1784106339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hf32V+63XwuX6n+9vP5ONNThKfHkDDFnh3w93Wj8prE=;
        b=GVMlAsTDVach5HuZrpL47PGMK2a62sE7QQ69M0LmG4rpZCKsLesQAENjvaOwysfjXY
         Uk7ViaOkJhpQaWI6Pdbk06+sLvIm0Q/1mpdAY58rLN71kFCLTInXCTJNyNokps5MWZmf
         GQqNqBKZ9InqzyWoI/LlaaJvIr8vY2t+M9WnO4wQQjqk3Kl2vdVEsMRU1vV9kQE6NL8T
         1WKwn2Yo4sPPM5fPML4bASEhHjNEW8UuaqGw6VoeH8pPERia3zTk0fGYVv+aMMo9EdN7
         sVD1M1PlfY36Li1zSwR7rlCsNQcXsBH/GDoYOv2XVv5lvsLsWXi+Dx7G+4ZgTgSZT+xU
         /dCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501539; x=1784106339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hf32V+63XwuX6n+9vP5ONNThKfHkDDFnh3w93Wj8prE=;
        b=NvdF/5UoiSh31kHe7lPxBIozTYUhjbqM52PgZ4dnBpdLbfWizi+l9zwPl9opbuCWL0
         UD5+yMM5GevKI14FibE7/Axt/KdkgvaQFgj07OD+kSWgTEHzaBqkf8q4MD+47D3EMw5B
         SKy2NuqBffT6PZrt95cEepdD/d1TWvNb+IWG7l1sAoas/sq+C41giuHdBmVi/Ce72MPI
         aV8jGOVuK9KsjlUwnB23/+8sRtU6YwSFnQyw/FRkIDystVvwdhjoiL4zDZ/PUIZpUzwy
         +xURbE9KwvoPiGm96WpeRSoeNY0j4VUoNAz1cao9550t24Eb2QoIavej08orXwnH+sIa
         9klQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/ejVMR1bwhN1OZgmNHWFGPOICq3M2CUm1lUXCTQSm2qb6QNh3IPA2nvdQpOAKbCJq0sEuYL/M5CE9KOuEKLPM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8u6QkdqDJ+tOqXZSdMYFJq6jB54npNukuvL+LOzODEGlkie+o
	j88CLT0DJollGqNIUHRMdB87Wcl0HuFySuqw7h7n44Qzpu9JDv23JZBn
X-Gm-Gg: AfdE7ckGuqhGzEAxtTcvWpfub+r7BbbCzmuhGldjBZV8zreiqeVEWh1+8Bdyuum8DWx
	86cGNGllcgdI+FmL2v6Jr2XfiECeUElNPrUbQAJaPx3LCwf8V6NmpJeFCL/aRlgCNo4WRuBvm5x
	0F+YiEdtHhVfTQZB2E211thXbBZKfhowIUlRmwJPxAVHCF3K8RCU7Jjmp9mVZXgsykbsiTrqgnL
	43LkGMaZC9NZC66dP9c9u+wCvXYYCh1QDrTy3c17+m9luKnIn0pmGBbz2JSXWWcMDOLk96CbNKf
	VZ+pv7YT5B6qwUhHeDuoMaogEiTq0SMBQTQWgzVXgl8Q7/mh63pizi3doJxm31Sh3w1sGSO8zVd
	xUPnitNz+ai4GvkfYLf85bGUy/Yb1CXJNuh5s1VJUsnWAD++K4bIE2XFrBFU7GX+GbuUBZJMswa
	xN4VIctS+YhusJhHiWjTcEVFPY3sZb7Eym0haK0VwHxB4SRRAOiTV5t+gTCRF8FDQ/86NEGS757
	c3d9lIS
X-Received: by 2002:a5d:5f82:0:b0:475:f0f0:9ec6 with SMTP id ffacd0b85a97d-47df080ff21mr1502469f8f.49.1783501538590;
        Wed, 08 Jul 2026 02:05:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9de1e785sm40674208f8f.8.2026.07.08.02.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:05:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: PCI: mediatek: Add support for optional perstout reset
Date: Wed,  8 Jul 2026 11:05:28 +0200
Message-ID: <20260708090533.19734-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_020542_262208_0CB7E13D 
X-CRM114-Status: GOOD (  11.69  )
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

Airoha AN7583 have a dedicated reset for PCIe PERSTOUT. Add optional
support for it in schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/pci/mediatek-pcie.yaml       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index c009a7a52bc6..cc5400c26185 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -43,10 +43,12 @@ properties:
       - enum: [ pipe_ck0, pipe_ck1 ]
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   reset-names:
-    const: pcie-rst1
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
@@ -127,6 +129,12 @@ allOf:
         phy-names:
           const: pcie-phy1
 
+        resets-names:
+          minItems: 1
+          items:
+            - const: pcie-rst1
+            - const: pcie-perstout1
+
         power-domain: false
 
       required:
-- 
2.53.0



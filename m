Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBCAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vK9K/mrLB76x5uzU5c0TcceENMmOeXyS0wuuRlEv6io=; b=eY0cXNKjRmayXIxyMOGDcm83xQ
	iJYbrdzmb6z5wi/KC1PVEDq+0XASF6tsf7Uye+C46+H38HWhLcHfhsBklAAvFUfAHJYYAV59NUjpi
	1jJMl2UhqaEgYd6fecYWiJmrBU2dtLM3d57cEN6OcC27M4pf9WQBU5mR4gvd08xS7decQxwtN8mCX
	PJh4FMhSmH1PMHazOCGH8QPOOZ0pL6uDoC/5usgEqxc4k/iH064XKs8KhuQ+wvr8ihVEqHVySVoeT
	1d2U/O+pObu574d7KDUG7GgV0vKHjDDh6axStJDDeBEna2TKplH7oDS0c+edaCySM3YCjzDBab7yL
	w6nfOk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJw-0000000GqCI-3RTp;
	Wed, 08 Jul 2026 10:16:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPJr-0000000Gq4j-1MRn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:15:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C23964E40CF2;
	Wed,  8 Jul 2026 10:15:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B6B960337;
	Wed,  8 Jul 2026 10:15:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C983B11BC3442;
	Wed,  8 Jul 2026 12:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vK9K/mrLB76x5uzU5c0TcceENMmOeXyS0wuuRlEv6io=;
	b=SVXDAfn7LdRk2SSamjgET8HABd/s1b80AQUUWICbOH38NBWiFzzKEFb2BWVMlzq7xvL+Vo
	UehsT6u0NEaPTvZmj72yc9b4DoR05MoKOi1JLyjoAFRJU9scLwM7Kxhgl/KhWcuXq44sXm
	6I7uirW+qH6aecJwiYX1xrTj63/PwyQGhKV+tzQTDyCiNdRTtuXgSf30fBJYWJzfjZ8BeF
	D5ur0Z7qost66nNRmWwWxwv6PbRM4ywA4XzSK1OhdVVeJSmR4t4Dr8c8cgNMI47awdJJtC
	Xu9lD5bjzAz4ZhbVl8Cr5vEs3F2n4u4OyDSy7+I6CuEk18Gl0x6GA+m7idgp5A==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:15 +0200
Subject: [PATCH v2 02/10] dt-bindings: soc: fsl: qe: Set #interrupt-cells
 to 2 to support interrupt type encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-2-1972044cfbd1@bootlin.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=1330;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=ZEM3vY/Rvni5vUWyO125mYZA67WdP+10qWiVEiSpxQ0=;
 b=oblis8PGfDPelQNzHShpnx1O5nbtJdaQ4wl6aqrmAbUO6DPeEoXYQulxvpdHTKaACO7exVse+
 3PvGSviY4A8BR0Iw1bv6Ad4rRllIJP4ofY/+VB2T2B6QM0aFQuoVbOi
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_031555_610754_F50C352A 
X-CRM114-Status: GOOD (  11.76  )
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

The QUICC Engine port interrupt controller can be configured to generate
an interrupt on either a high-to-low transition or any change in the
signal state on the related GPIOs.

Update the #interrupt-cells property to 2 so consumers can encode
interrupt level information.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 .../devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml
index 2b8e7b9c6d7a..2b7c6b4f0389 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml
@@ -23,7 +23,7 @@ properties:
     const: 0
 
   '#interrupt-cells':
-    const: 1
+    const: 2
 
   interrupts:
     maxItems: 1
@@ -45,7 +45,7 @@ examples:
       reg = <0xc00 0x18>;
       interrupt-controller;
       #address-cells = <0>;
-      #interrupt-cells = <1>;
+      #interrupt-cells = <2>;
       interrupts = <74 0x8>;
       interrupt-parent = <&ipic>;
     };

-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89E2C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agf1avw9RN7BsImsmMDdRs8e+E69gS1Z1OoAxqO8Yeg=; b=a1CV33AMCqYoQJxmxggeasRICH
	MpgH/07x7M6f73xXSHtuitbxFMrVo6g0IzhEgJVt+er59swhCUZMacshCx86FcK+UlELi5Xcn7M2u
	d/93EqVYr2i/76Lg74i6P2Q18WO56k0fRLey4tU8Mhwm10OazHSpVKc73C/5Ic5j89XN6+PF1BKgr
	DLpbSGxfqeU+Lh6pFn83eRh4NWQmnoCcsN2TlkC22pN5s39rs7D4TKxDVpzRPtG5vK0EcaN+Jo5Ri
	ytOKGayLjKNeJKIn2r9aY5lRcZx+uc4YWsHtkfZp+IZlnNvXd+I4y2/CP3B7aMP2mNPiJqu5guMZ8
	sN6MAKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJbMw-00000009IYB-3iNZ;
	Mon, 26 May 2025 17:12:10 +0000
Received: from smtp-42a8.mail.infomaniak.ch ([84.16.66.168])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJbGY-00000009HXX-18yf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 17:05:37 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b5hwV2HZczbDZ;
	Mon, 26 May 2025 19:05:30 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4b5hwT1GVjztYc;
	Mon, 26 May 2025 19:05:29 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 26 May 2025 19:05:15 +0200
Subject: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC reset
 method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-rk8xx-rst-fun-v1-1-ea894d9474e0@cherry.de>
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
In-Reply-To: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_100534_441083_C134A438 
X-CRM114-Status: GOOD (  15.00  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The RK806 PMIC (and RK809, RK817; but those aren't handled here) has a
bitfield for configuring the restart/reset behavior (which I assume
Rockchip calls "function") whenever the PMIC is reset (at least by
software; c.f. DEV_RST in the datasheet).

For RK806, the following values are possible for RST_FUN:

0b00 means "restart PMU"
0b01 means "Reset all the power off reset registers, forcing
            the state to switch to ACTIVE mode"
0b10 means "Reset all the power off reset registers, forcing
            the state to switch to ACTIVE mode, and simultaneously
            pull down the RESETB PIN for 5mS before releasing"
0b11 means the same as for 0b10 just above.

I don't believe this is suitable for a subsystem-generic property hence
let's make it a vendor property called rockchip,rst-fun.

The first few sentences in the description of the property are
voluntarily generic so they could be copied to the DT binding for
RK809/RK817 whenever someone wants to implement that for those PMIC.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index 3c2b06629b75ea94f90712470bf14ed7fc16d68d..0f931a6da93f7596eac89c5f0deb8ee3bd934c31 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,30 @@ properties:
 
   system-power-controller: true
 
+  rockchip,rst-fun:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    description:
+      RST_FUN value to set for the PMIC.
+
+      This is the value in the RST_FUN bitfield according to the
+      datasheet. I.e. if RST_FUN is bits 6 and 7 and the desired value
+      of RST_FUN is 1, this property needs to be set to 1 (and not 64,
+      0x40, or BIT(6)).
+
+      The meaning of this value is specific to the PMIC and is
+      explained in the datasheet.
+
+      For RK806, the following applies
+
+      0b00 means "restart PMU"
+      0b01 means "Reset all the power off reset registers, forcing
+                  the state to switch to ACTIVE mode"
+      0b10 means "Reset all the power off reset registers, forcing
+                  the state to switch to ACTIVE mode, and simultaneously
+                  pull down the RESETB PIN for 5mS before releasing"
+      0b11 means the same as for 0b10 just above.
+
   vcc1-supply:
     description:
       The input supply for dcdc-reg1.

-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E560FC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2l9hURmB1pkMb9PWrVWHcGWccs9x7IzxI7WG3HtlDU=; b=AC1jRcUH0+4AKsGl1c2wyg11r3
	4efOKXqEzHZMoPMmud1UqH/+8WRRzB5rikV3hkJYnuPlbzjYm+6WnLh52Qf9gPnbmub2H5ySdu7L9
	YBcXug3h113sUKFzIYddFAAzgDVYxtwoLE2LX34Az9j9u3ReuODMAq/QwO5kuAi8rjQT0pZUL4Bhm
	KtPn0IyF8jhxqw5rNGYdt7yJMImPUihTIXbLhSHIMKjWdEMDWR7L8o+iiJOW4javKaPuHYPOnaF0E
	g35OdAnglgTmL267aMWTTZ19nakz/qfbm1V+1J1c9kO5psRuOCTp+tIuf0TTLLYNCSaBPwuZtI6VV
	x4MqJRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rig-00000009Bxa-2kNk;
	Wed, 23 Sep 2026 18:29:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ric-00000009BvY-1TXb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 18:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=u2l9hURmB1pkMb9PWrVWHcGWccs9x7IzxI7WG3HtlDU=; b=dZ40P5vjafJOVG7FfEgx1HnxJv
	5DVv6SeunCQRvi9WELuNuaoWSORJ76B3oUmIKNITxoArMJbEQBsg1pwFCscV2CPmj92FVleY9L1Ae
	/lyET1hDePIbsByY25Jadh9sF79Pr5Mc7uE0k4kPSYCtFt6pOT2RY1PhdxSeP6hZP2WizkX35Ggdm
	xxL4rTMpsOlQ8IaLhiS8z/OK3V7qqXU/IHkJZP76NXReqqMoKlnyx4DegHbaFj44qjGTlx61WD+2L
	xSD4dPDPXBa8lwC8wYpPl+DuFwpj0zudfqLtK0D/zwQa3L+X7dEHhXx0fXKFzt5OA4hrttu2bAyMs
	hJu0I0nw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9RiY-0000000F9YA-2qXT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:29:21 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b965f447cso9752105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188157; x=1790792957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2l9hURmB1pkMb9PWrVWHcGWccs9x7IzxI7WG3HtlDU=;
        b=Nua91dtX7VZpGOENjpywLRiH4tJBozDack9YtgnzhfuRakaFRmu1q53FFW0pwepdLy
         S99T/IBpqAEbxkbK9ijL2X6ns68E5AO2gkyA0o0E4QMwWIQVBY2Elc/cQYg/SbUHDfaJ
         j/CDyL2YvFybulvZqnThXmMg4O4/wQUMEQrjJpU1tXlmyx5BATxgQcqN/wECIGAVo2/A
         p71U0kSWqqP7O3RglJRP4dFranaPze0I9ESa+sNaqAqq/Qupu7ZbilV/yNM+RRF7N0V2
         q/Q/xKjdEyf1tVO/jA47CNVXoB5HIDCFpqeDmMp5UQGsLoUqvakoaJFkbyhqpFnN5qZW
         Lm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188157; x=1790792957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2l9hURmB1pkMb9PWrVWHcGWccs9x7IzxI7WG3HtlDU=;
        b=gsPR8BJJRVZQdi1Kdk744Ec/KPrv7wV98sVzMXaCfDS+PmCsaY4rPburF6VVLkCwCA
         5WOQxIeQtrk2DpZ9IcyUvnUiWT0TeszSEZmLR4RxEUdHPWrnkvnpx0nOac50Aq5zNwW2
         CR0o9zgp/JojLCGV1UPyHtKa5AGtkPbXJ9zAK9iweTt18SIzGP8gI9RV7lzowW8lrZEE
         +qQdoB9O64OSfbHWTk+O8avaQzO+xfAr1eRvJE/Mja/YhCoz7b0gs3aVGOSU8IdFBMXd
         arXVsqyV6kq27ATVuTnviIyeopjMyoSBTaorAcvcJPPR2ZYlY3w5WcbmgfqnOcSDEWGD
         h44w==
X-Forwarded-Encrypted: i=1; AKwUvBxROBf/D4SgCFkD25hgWO1vZnY5WQJwOPcbLQvIIaYxZsDPW57Srs3ueE7LuJlwxjD62OmgW8rGN5pEhfl3CxLm@lists.infradead.org
X-Gm-Message-State: AFuF++kXZO4+nMgxFdxKC69ENp1HF1913yNXM+UTZKxWqt6g9hqlNHSo
	oXJ/fLFH+EuC6Z+49YjzzBYTl0dBXbZAOUsdB6HQ2BgnbtZcZkUcs0pHSz3vFhPDemmEMw==
X-Gm-Gg: AYBFou3V0dysDWhlU3T1vokGNjc22MWOZp2vzF705h7X0AzQ8dNSKEdaiVO8gy9Z1dq
	FDiHBvK4RcekqXlOowuLZeNZWu84ScjJ+h2Mrst16kR7WS3gXL6pC47CeIc74B3TZzknk3sVpG5
	EBqWYtORNYPqZMd+ZPZXyW4WXylAE4Fh9bCuCaX15jCYMCreznIO6pJfCTt6elxZ/BOjIpfx43r
	rsXewtGdeJUaNjQkLvtMBWRiPVEJsMgtiMxlp2uhJBvurEFc+GaL4TqB83bW+huCokJE7mkte3o
	uxLUuttjtk1FVTNz4WIzuV1dZpZSC6oO6tFG7Y9kSYcAqq9HgAVTplcA5GgC5S2vhar5ghXmwpC
	9E2AymA/u9IVkn5YJ6ti/P2ZJjYtdUAQdm5ggR2lilu0/WkwnvsxpDPo3njL0FvlPiQGUePtBiA
	25EqAlHjvU23PbJnR5tCR6tKS8+jiVNk+5YU59iepnaKJ24IgjIdhs5RfPUn9HFYomCrbO9EBdD
	5Jf
X-Received: by 2002:a05:600c:6092:b0:49e:645e:2616 with SMTP id 5b1f17b1804b1-49fe66c5275mr1265635e9.5.1790188156855;
        Wed, 23 Sep 2026 11:29:16 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:16 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:47 +0300
Subject: [PATCH v12 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-1-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16292;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=fdcRqBAFZcfoRi9cgcm3iz61drb6ZrGz34PHxhWAGSA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBptBHwBtliH45vV2pBh4PmjkWSdoV8MtIpDt
 nLSiaIkRqGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKkQQ//aWYPqTzLUrvs1gFCppCAkGL3MCLQ4+s
 PwyzB9mF/m/FI0xs6tqyMkaX31fSXC5RBKKbfb3X9DLI3Bh6tODSwrAvu0SG5pxT0cn1ngNu6fA
 ZZNeWG4jq0NzNa9OXeYgnlaa4vPJknBfuTlPYYbQGwne1a2VcWapaMpsZ5ePde5GQyvN34CHSK7
 OCK3TlumHU8M9q/WDFEyX2tgztQ5t9OzMMvfX+pclBqC7XDNGahsp6uiqqIcPNrVb1wKylUu8P0
 ++zIWlyaZCRMD/uCgf7K/YUVzGHa0oZsBdHfOV03UAUBTLy4zw3xZ0kbUujcMUc1bDaofNiKb0L
 q5M5ezi1ovYjmQluKZjjxDCVr4jb9E/4ETwXXFhajX2cNJXswHlH/3Fcyq6uoHSjZddLRdbc5G3
 6NJGJPb/k2E/xJ7MBCkU1y8x0WbqyS0OHokEsgKOui7JX0F7M4gIYFECNqk2NMMu0Bv3bWNQ+em
 YTyeQpnHDf6CPvlbXIipXfMeSGY4H0zmd3JsSuE5yiNTTAuYItu/JJHAzrHZ17MN5k5pc6/uEmo
 iJBjA84hnbdVOPTmv9gNstVIK3PWJrbXIlt1zf4I2xTSBmYToYlIakcv++4y3SDqZB82+vjkWJ/
 FAooka1eue45ScYWUtqHcHySOlh5pxBBhK9K1cyHlxj9k6HStpE0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_192918_863051_4EEDD8A7 
X-CRM114-Status: GOOD (  39.67  )
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

These SoCs have 3 clock and reset controllers: Top, Matrix and LSP.
Clocks go from oscillator -> top -> matrix -> LSP, with a register in
top controlling most clocks that get passed to matrix and a register in
matrix controlling all the clocks that get passed to LSP.

Generally every device has two clocks (one work clock, and one that
connects it to the bus, I call it PCLK), two reset bits (I don't know
what the difference is - sometimes asserting one is enough to reset the
device, sometimes both need to be asserted). PCLK and WCLK are
controlled by individual gates. Some devices have a mux and/or a
divider for their work clock. Some devices, like the GPIO controller,
only have reset bits and no clocks.

The top clock controller is fed by a 26 MHz external oscillator and has 4
PLLs to generate other clock rates. ZTE's kernel mostly relies on the
boot ROM to set up PLLs, but one LTE-related PLL is not configured
on some boards. Therefore my driver contains code to program PLLs. It
produces identical settings as the boot ROM for the pre-programmed
frequencies.

Not all clocks will have an explicit user in the end. I am defining a
lot of them simply to shut them off. The boot loader sets up a few of
the proprietary timers, which will send regular IRQs (although the
kernel of course doesn't need to listen to them). I don't plan to add a
driver for the proprietary timer as I see no use for them - the ARM arch
timer works just fine. I will add a driver for the very similar
proprietary watchdog though.

The clock list in this patch is pretty complete but not exhaustive.
There are other bits that are enabled, but I couldn't deduce what they
are controlling by trial and error. Some of them seem to do nothing.
Others cause an instant hang of the board when disabled. It is quite
likely that a handful more clocks will be added in the future, but not a
large number.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

v12: Add some GSM and LTE related clocks

v11: Unchanged content wise

@Sashiko: The USB and HSIC PHY resets are deliberately not in the
binding. They would be provided by the reset MFD child and consumed by
its PHY sibling, resulting in a self-referencing node. Therefore the
PHY MFD child accesses the bits via the shared regmap. The PHY driver is
the exclusive owner of the bits.

This does not impact the USB and HSIC controller resets. These are part
of the binding and consumed by the (future) USB nodes.

@Sashiko: There is no "simple-mfd" compatible because a MFD driver
will bind to the node and (among other things) take care of the reboot
child node.

v9->v10:
*) Rename ZX297520V3_ZSP_RESET to ZX297520V3_ZSP_CORE_RESET in preparation
for a separate reset register in matrixcrm.

*) Fix order of properties in the example code to satisfy dt-check-style
--mode=strict.

Changes v8->v9:
*) "unevaluatedProperties: false" for the syscon child node (Krzysztof)
*) "additionalProperties: false" for the binding itself (Krzysztof)
*) Remove USB PHY resets, but USB controller resets remain unchanged
(Krzysztof)
*) Rename syscon reboot node to "reboot". While both "reboot" and
"syscon-reboot" are common in actual device trees, syscon-reboot.yaml's
own example uses "reboot". DT's Generic Names Recommendation
contains neither (Sashiko, patch 12)

Changes v7->v8 (all Krzysztof):
*) Fold the PHY into the top-level node
*) Start clock indices at 0
*) Rename the phy include file to zte,zx297520v3-topcrm.h.

And a non-change despite/because of new discoveries: USB has more PHY
and DWC controls in a different controller at 0x140000. ZTE calls this
controller SOC_SYS, and it is a textbook case for syscon: It has a lot
of different controls: A remap flag for boot ROM, a control to bring the
A53 up in arm32 vs aarch64 mode, the entrypoint of the LTE DSP, SDIO,
I2S, ...

USB-wise it has a register with PHY and DWC controls: Endianness for the
DWC2 registers, PHY clock adjustments, PHY and DWC host/device switch.
In spite of this I think topcrm is the better home for #phy-cells: The
USB ready flags in topcrm are essential for bringing up the USB devices
whereas the soc_sys controls are a curiosity. Host mode only works if I
externally inject VBUS. Clock adjustment is too inflexible to be of real
value. Flipping the DWC registers to big endian works, but what for? If
I find a use case for changing the default USB values in soc_sys it can
be handled via syscon.

soc_sys also has power controls for a few devices, including USB. This
will be handled via #power-domain-cells.

The self-referencing reset property causes the following boot messages:
/soc/clock-controller@13b000: Fixed dependency cycle(s) with
    /soc/clock-controller@13b000
/soc/clock-controller@13b000: Fixed dependency cycle(s) with
    /soc/clock-controller@13b000

Do I need to add post-init-providers? As far as I understand it, this
message is informational and not a problem that needs to be addressed.

Changes v6->v7:
*) Moved the bindings back into clock/ (Krzysztof). Use clock-controller@
in example and in the later DTSI patch.

*) With a lucky find in strings in LTE's cpko.ko blob I could make sense
of the register that controls which clocks get passed from PLLs into
the clock distribution inside topcrm. Importantly that also narrows
which clocks can possibly be passed to Matrix, so I could slim down the
bindings considerably.

*) Add a usb phy child node with the phy schema added in the previous
patch. I don't expect the USB status register to ever be in another
place, so the binding expresses the @84 expectation.

Changes v5->v6:
Set value for syscon-reboot example (Sashiko). It was my intention to
set only the lowest bit, and I think Sashiko is right that without
'value' being set, all other bits are actively set to 0. It shouldn't
matter given my understanding of the hardware (afaics all other bits are
ignored), but actively clearing bits was not my intention.

I haven't changed the name match for "syscon-reboot". I see plenty of
examples of hardcoding this string as opposed to having a regex for
syscon-reboot@12345678 in other bindings.

Changes v4->v5:

Rename from zte,zx297520v3-topclk to zte,zx297520v3-topcrm and move to
soc/zte
Fix path in MAINTAINERS
Add syscon-reboot node to the binding
Give the USB and HSIC PHY resets their own reset control
---
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      | 122 +++++++++++++++++++++
 MAINTAINERS                                        |   4 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  72 ++++++++++++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |  12 ++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  30 +++++
 5 files changed, 240 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
new file mode 100644
index 000000000000..8510ffde2924
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC top clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  The zx297520v3 top clock and reset controller generates clocks for core
+  devices on the board like the main bus, USB and timers. In addition to clocks
+  it has reset controls for peripherals, a global board reset, watchdog reset
+  controls and a USB status register.
+
+  The controller has two clock inputs: a 26 MHz and a 32 kHz external
+  oscillator. They need to be provided as input clocks. The controller provides
+  PLL output frequencies to downstream clock controllers.
+
+  The USB PHY is exposed as two PHYs, one for USB and another for HSIC. Note
+  that while the controls for both PHYs are always present, the PHYs themselves
+  may be absent. If this is the case the controller never signals that the
+  missing PHY is ready.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. The resets are
+  defined in the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header. PHY
+  defines are found in "include/dt-bindings/phy/zte,zx297520v3-topcrm.h".
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-topcrm
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 kHz external oscillator
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+
+  interrupts:
+    items:
+      - description: IRQ reporting USB connection
+      - description: IRQ reporting USB disconnection
+      - description: IRQ reporting HSIC connection
+      - description: IRQ reporting HSIC disconnection
+
+  interrupt-names:
+    items:
+      - const: usb-up
+      - const: usb-down
+      - const: hsic-up
+      - const: hsic-down
+
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  reboot:
+    type: object
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+    unevaluatedProperties: false
+    description:
+      Reboot method for the SoC.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - reboot
+  - "#clock-cells"
+  - "#phy-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+    #include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+
+    clock-controller@13b000 {
+        compatible = "zte,zx297520v3-topcrm", "syscon";
+        reg = <0x0013b000 0x400>;
+        #clock-cells = <1>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+        interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+        #phy-cells = <1>;
+        #reset-cells = <1>;
+
+        reboot {
+          compatible = "syscon-reboot";
+          mask = <0x1>;
+          offset = <0x0>;
+          value = <0x1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dccddc99ac9a..43fd556e155b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3922,8 +3922,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
+F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
+F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
new file mode 100644
index 000000000000..1bc9267e4d62
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
+#define __DT_BINDINGS_CLOCK_ZX297520V3_H
+
+#define ZX297520V3_M0_WCLK			0
+#define ZX297520V3_SRAM1_PCLK			1
+#define ZX297520V3_SRAM2_PCLK			2
+#define ZX297520V3_UART0_WCLK			3
+#define ZX297520V3_UART0_PCLK			4
+#define ZX297520V3_I2C0_WCLK			5
+#define ZX297520V3_I2C0_PCLK			6
+#define ZX297520V3_RTC_WCLK			7
+#define ZX297520V3_RTC_PCLK			8
+#define ZX297520V3_LPM_GSM_WCLK			9
+#define ZX297520V3_LPM_GSM_PCLK			10
+#define ZX297520V3_LPM_LTE_WCLK			11
+#define ZX297520V3_LPM_LTE_PCLK			12
+#define ZX297520V3_LPM_TD_WCLK			13
+#define ZX297520V3_LPM_TD_PCLK			14
+#define ZX297520V3_LPM_W_WCLK			15
+#define ZX297520V3_LPM_W_PCLK			16
+#define ZX297520V3_TIMER_T08_WCLK		17
+#define ZX297520V3_TIMER_T08_PCLK		18
+#define ZX297520V3_TIMER_T09_WCLK		19
+#define ZX297520V3_TIMER_T09_PCLK		20
+#define ZX297520V3_MPLL				21
+#define ZX297520V3_MPLL_D5			22
+#define ZX297520V3_DPLL				23
+#define ZX297520V3_GPLL				24
+#define ZX297520V3_GPLL_D2			25
+#define ZX297520V3_GATED_OSC26M			26
+#define ZX297520V3_PMM_WCLK			27
+#define ZX297520V3_PMM_PCLK			28
+#define ZX297520V3_OUT0_WCLK			29
+#define ZX297520V3_OUT1_WCLK			30
+#define ZX297520V3_OUT2_WCLK			31
+#define ZX297520V3_OUT32K_WCLK			32
+#define ZX297520V3_RMIIPHY_WCLK			33
+#define ZX297520V3_TIMER_T12_WCLK		34
+#define ZX297520V3_TIMER_T12_PCLK		35
+#define ZX297520V3_TIMER_T13_WCLK		36
+#define ZX297520V3_TIMER_T13_PCLK		37
+#define ZX297520V3_TIMER_T14_WCLK		38
+#define ZX297520V3_TIMER_T14_PCLK		39
+#define ZX297520V3_TIMER_T15_WCLK		40
+#define ZX297520V3_TIMER_T15_PCLK		41
+#define ZX297520V3_TIMER_T16_WCLK		42
+#define ZX297520V3_TIMER_T16_PCLK		43
+#define ZX297520V3_TIMER_T17_WCLK		44
+#define ZX297520V3_TIMER_T17_PCLK		45
+#define ZX297520V3_WDT_T18_WCLK			46
+#define ZX297520V3_WDT_T18_PCLK			47
+#define ZX297520V3_USIM1_WCLK			48
+#define ZX297520V3_USIM1_PCLK			49
+#define ZX297520V3_AHB_WCLK			50
+#define ZX297520V3_AHB_PCLK			51
+#define ZX297520V3_USB_WCLK			52
+#define ZX297520V3_USB_PCLK			53
+#define ZX297520V3_HSIC_WCLK			54
+#define ZX297520V3_HSIC_PCLK			55
+#define ZX297520V3_GSM_32K			56
+#define ZX297520V3_GSM_26M			57
+#define ZX297520V3_GSM_48M			58
+#define ZX297520V3_GSM_104M			59
+#define ZX297520V3_GSM_156M			60
+#define ZX297520V3_ABB_WCLK			61
+
+#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/phy/zte,zx297520v3-topcrm.h b/include/dt-bindings/phy/zte,zx297520v3-topcrm.h
new file mode 100644
index 000000000000..b36ccf2f54ef
--- /dev/null
+++ b/include/dt-bindings/phy/zte,zx297520v3-topcrm.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_PHY_ZTE_ZX297520V3_TOPCRM_H
+#define __DT_BINDINGS_PHY_ZTE_ZX297520V3_TOPCRM_H
+
+#define ZX297520V3_USB_PHY	0
+#define ZX297520V3_HSIC_PHY	1
+
+#endif /* __DT_BINDINGS_PHY_ZTE_ZX297520V3_TOPCRM_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
new file mode 100644
index 000000000000..4a0eaec0e981
--- /dev/null
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_RESET_ZX297520V3_H
+#define __DT_BINDINGS_RESET_ZX297520V3_H
+
+#define ZX297520V3_ZSP_CORE_RESET		0
+#define ZX297520V3_UART0_RESET			1
+#define ZX297520V3_I2C0_RESET			2
+#define ZX297520V3_RTC_RESET			3
+#define ZX297520V3_TIMER_T08_RESET		4
+#define ZX297520V3_TIMER_T09_RESET		5
+#define ZX297520V3_PMM_RESET			6
+#define ZX297520V3_GPIO_RESET			7
+#define ZX297520V3_GPIO8_RESET			8
+#define ZX297520V3_TIMER_T12_RESET		9
+#define ZX297520V3_TIMER_T13_RESET		10
+#define ZX297520V3_TIMER_T14_RESET		11
+#define ZX297520V3_TIMER_T15_RESET		12
+#define ZX297520V3_TIMER_T16_RESET		13
+#define ZX297520V3_TIMER_T17_RESET		14
+#define ZX297520V3_WDT_T18_RESET		15
+#define ZX297520V3_USIM1_RESET			16
+#define ZX297520V3_AHB_RESET			17
+#define ZX297520V3_USB_RESET			18
+#define ZX297520V3_HSIC_RESET			19
+
+#endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.55.0



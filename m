Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC52CCA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/Tw8zZUSYGRUw5ihGSIUwYOzEBFsG+6HaKAhA2ORMw=; b=LSf44gRSis4uYXJWq5FaL0lrj8
	rJ3XwmDwiRRvFIWjA0AuDKSsgtXIv7CvkefxAjaPm55WR9KIdOh6/pvFjXVXZDDFzni9z2zxg3VPY
	yeGe0DO2XZvxQFm0J+V3U2sMJE02Dx9/5uGrrHTvxKrGv6+NWjQxuYdkupw7uE7Bx1nFiEa2937so
	z542BOY+fjjMbcOCx3ahrTyrW5sDjUz6PYUNyEFoVdoy4s30rvLCwRTEhfuHmzBtTfOU6TmAKP1QK
	qNwMUpZ0oOyXEwcqcISw7dD3tRqkOEgWoLCHeFP2Om0cxr04Z0fj8TnTZgyzr8P1HWC2bRdIn40pM
	b0qOQ/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnD-00000007s0O-0NP0;
	Sat, 10 Oct 2026 10:59:07 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnA-00000007rzC-3Njx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:06 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso463626f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629943; x=1792234743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/Tw8zZUSYGRUw5ihGSIUwYOzEBFsG+6HaKAhA2ORMw=;
        b=RbPlgm28gl4kpwg0tvw4Da7N2olQFaPYN9yo6cVY0bhxtRh6hYwQyKadpCuSsPeoRJ
         XU97XBOv2bPE6CZoSJBoTThM40NJ/zJY6dxjjN6xtoVoYoSsmDWj/w88NFMM+6U7MFEo
         Pr7MygAIxBwpB9QjbEr5n4+0NRKhEQEUbtIAkw8MS6jrYKyJA33jM6gvTAewmD7VACaw
         67j/Lv2fXxPoFXFFSXfAQ9ceIBLioPuJHNJ+xRwbarTgGsJxofDHZrfH841aRnjt3xRK
         NyiY86uaUtjmI1Mgzas0nW3XZaPCh/yKlJRdoyj8FX7gxazhQA3ID9YW+n54Fk0dmRaE
         yGhg==
X-Forwarded-Encrypted: i=1; AKwUvBz1dAmzi4Jspk1EzOBXcr1feTTzzNHPpGiXNx4s38pM2/AwXXnBNt8QMhtNrps1Oz/UE+wqJ2i9vush9Pi8vfTp@lists.infradead.org
X-Gm-Message-State: AFq9FYKDkqkGWRJfitrt2//TafVr2viqoPf9AadFac/TBxykWLwFucJ1
	nvFv0ZtoDi8wuV2l0j2PPWL6cJM9drh8FrOpMqpajLuh1OigcAHe9ymi
X-Gm-Gg: AYBFou09JqVbuEptuBV28S970sP6KUHbAf8yV7m4EHSPllpP1017pRo+O0bzj+BFAWX
	+yxxcTEshzB0dHEvPJPfGKpqvjmfwinjBN4lE79ebI5psQ9XNe6jT6EdbgEWk8Unv/4T76kzL36
	IAJECWdO2dphwAn25Ej6utRRcI1wPL4TD5OomofRvAANKjnZnmoq/yYTm3HKElTTx1VldRzM/0S
	8GigaQLpWq/oi7+LWnJMe9EaCCDisUJjuFNs4/xtsLMdhqnGfNqOJLUOeKiXCPj9A+9+n8Calbf
	wGkHN1oRuQIrZIZZVu6oGxbEKVyYIRFtiS7yn23r+bidZCNasHyJzOUbtd1sDKelAxD5uVUzluf
	5UgVXnYTC+oP0hr8I3m2veKiBwY/jzNCTuJHvsH3ACCpQckDzCFd/jpt6UBzYPQoS5W/NweU6xs
	aEadVx2n1lJZ6xWRxASxayD6uU7j4HG1ADwNjMe8Rix8oS/jA+xT2M1BEdD+J0jLNnkkaAWYczk
	eILVNPu7KFfcHRnUVGPbllY2crkUkXxysU=
X-Received: by 2002:a5d:6547:0:b0:48a:fd58:a7df with SMTP id ffacd0b85a97d-48dbace0061mr6574489f8f.47.1791629942561;
        Sat, 10 Oct 2026 03:59:02 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:01 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] Add ethernet support for the Amlogic T7
Date: Sat, 10 Oct 2026 11:58:52 +0100
Message-ID: <20261010105900.247342-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035904_862489_42DFBDC9 
X-CRM114-Status: GOOD (  18.62  )
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

The T7 pairs a Synopsys gigabit MAC with the same glue registers the
G12A has, but nothing described it. This adds the binding, the driver
support and the device tree nodes, and enables the port on the Khadas
VIM4.

Two clocks set the T7 apart from the G12A. The controller reaches DRAM
through a pipeline stage with a gate of its own, sys_ampipe_eth;
nothing else claims it, so clk_disable_unused switches it off and
transfers stop. The glue registers sit in a block gated by sys_ethphy,
so far owned only by the MDIO multiplexer, which probes after the
controller has programmed them. Every write to PRG_ETH0/1 was lost and
the port ran on the bootloader's values; v2 passed my tests only
because a debug knob rewrote the register later. The T7 node now owns
that clock as "pclk", which the stmmac core enables before any glue
code runs.

The RGMII delays stay as in v2: phy-mode describes the board, so the
VIM4 is rgmii-id, and the controller adds the transmit delay because
the RTL8211F transmit delay does not work on this board. A sweep of the
controller's receive delay against the CRC counter puts the PHY receive
delay where it should be, about 2.2ns, while the transmit side never
gave a clean link. As Andrew asked, this logic now lives in a T7-only
path, so no other board changes behaviour.

Patch 8 is generic: a table in the informative section of
ethernet-controller.yaml showing who adds each delay for every phy-mode
and property combination. It is independent of the rest and can be
taken separately.

Tested on next-20261002 with "clk: meson: t7: keep the memory fabric
clocks running" (clk-meson-next) on top: 933/935Mbit/s with iperf3,
5s each way, no CRC error in 432k frames, nothing written by hand.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7.", which defines amlogic,t7-dwmac with the axg fallback and
three clocks. I will drop or rebase whatever overlaps once we agree.

Changes since v2:
 - the controller-side delays are applied on a T7-only path instead of
   changing every Amlogic board (Andrew); the PHY mode left over comes
   from phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps is checked against the four values the hardware
   has, in the binding and in the driver, instead of being truncated
   (Sashiko)
 - amlogic,tx-delay-ns and amlogic,rx-delay-ns are not valid for the T7
   (Neil, Andrew)
 - the on-chip PHY no longer carries max-speed, phylib reads what the
   chip reports (Andrew); same for the RTL8211F on the VIM4
 - the PHY interrupt line, GPIOH_6, is described on the VIM4 (Sashiko)
 - new: the T7 node owns sys_ethphy as "pclk", see above
 - new patch 8: the delay ownership table in ethernet-controller.yaml
 - no longer RFC
 - Conor's Acked-by dropped from patch 2 and Neil's Reviewed-by from
   patch 6, as both patches changed. Patches 1, 3 and 5 only moved in
   the series, so their tags stay.

Changes since v1:
 - new patch 1: honour tx-internal-delay-ps and rx-internal-delay-ps in
   the rgmii-*id modes, and pass the PHY whatever delay is left over
 - vim4: phy-mode rgmii -> rgmii-id, and amlogic,tx-delay-ns plus
   rx-internal-delay-ps replaced by tx-internal-delay-ps = <2000>.
   Neil's Reviewed-by dropped from this one, the change is not cosmetic

Lucas Tanure (8):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: apply the RGMII delays the T7 way
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
  dt-bindings: net: ethernet-controller: tabulate who adds the RGMII
    delays

 .../bindings/net/amlogic,meson-dwmac.yaml     |  86 ++++++++++---
 .../bindings/net/ethernet-controller.yaml     |  18 +++
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  20 +++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  88 +++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 120 ++++++++++++++----
 5 files changed, 291 insertions(+), 41 deletions(-)

-- 
2.56.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05553C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F5XD7E1guV/vtraPrPS4BySY9EoY0nGlYAqlZQZKu0s=; b=vFLN47XmA8Xctg
	+PEDnfmIZ4P4c9dyRX7rc4MdCbcapQtC9gNzrMthCxRi5EwFGf1O8IVsbGLoHbQvHW8XzATWtLRvE
	R9hM/LNISU0W21kdLl9VMPZbalTI4i75QXLES84GHORTgZXLg9A5Ylvut0ayeBn8m/z4o/Wxb1F5T
	NBocpAXxwdo3jeepm8ZZ/74wUP7egt6PDCKs2Sb55/2At5FIHv7v0RUYW8BB83JP6ueIHJMlWBFBA
	EuYw61ZdlKdYSmT/eNCwMRXp1xC+JFzzgF+2qPm7x3cWOwEKQYFQXGStD2LrN7vksvnRgmLLXFwLF
	JUpatoKJoACIX0Xg10eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NTt-00000000Jns-0fwd;
	Sun, 20 Sep 2026 19:45:45 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NTo-00000000Jms-2aU5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 19:45:43 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466cc9b2f1dso1516027fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933539; x=1790538339; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F5XD7E1guV/vtraPrPS4BySY9EoY0nGlYAqlZQZKu0s=;
        b=EIp7RAQW0EapJISveHQmD/jeJkn7nuHQP192IAkFRY7ap1Uy3lwU5JjZvKuXIekvIm
         v8CQEnZNmLsRbBOR7Q62VzkvGFrd1aHZxQiCHzaGcX2dkO840V2k4fc3CZvxQiL2zxws
         0YIijFdWnELOgnTEM8rIgUv2Klr2yACNKVcXdnSOa/Ya2ozEcjPADO0sbXe9Atnobwin
         EJCIiHaEXdFTKAOq6cfld08BChGuMGPgltkPiqXgDRzKOjZ9FPG+fNpBNj3Yjqi7Omt/
         8FiRHNpAuOjn2H0q9CdRmTl5RAvLqy6k/twGRu57FQtJOggfKtH4DCU2QdSkrNkj1Hvx
         Gl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933539; x=1790538339;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F5XD7E1guV/vtraPrPS4BySY9EoY0nGlYAqlZQZKu0s=;
        b=HmaW1CLTOAt2QZP1XlYPaEb63xE0j/iC+qdD7fJ8KcWF6V3ZGW5uAjk0E5t2au4vQU
         sjXAK2Ci6yLUGCvT3YlZ/yF5wi542PHnWkukpjA556afq9VNsTuPdonxnr9yG6g3j0kH
         lH+6xR9AYRv7cSotLiKZe74Sz09bYjr8piKQuQUCRd8a7ALMxlY289GodkCI1TUCk/7g
         7kZY1/hb2s0JIssNchPY+lnWJJszy2ONSj2FzGbcK1y2bwWccmCblcj4mpFbdERBiQPQ
         vQd3lSDo1CMSOgBCEAiSArOlMuTJifQ3/qx+tcxwf45cjZNiSmZ0d2qpCzUEcP1NALsc
         7YdA==
X-Forwarded-Encrypted: i=1; AKwUvBz498wvNQNSDOg0U5fM5wac2lNVuY1NNCocsgo88AbcEIqHaizi76BxzT4kWo81CVq5eiSv+qw0bxF2o3YdQoMm@lists.infradead.org
X-Gm-Message-State: AFuF++lm/YKuqQFdMRJoBlRYrnHk6cplzSbowD2bVQ9GRQMnPKVIJppY
	QWlcPC/cq8J/5P36zhOA0dcD2N9E2zLLrwsq9lKLl/OYzrOUVd7hgpXL
X-Gm-Gg: AYBFou0dVaYaQAowEXJBVGt/kO4D3lFPU6EHA3mX/A+hhZ7skBrg4I0qoszpf/cjgmo
	MemvFl93uSeSts7Ic0e34jW50YT3lPDoHV0sG+BvBDck6mZAotx8Z7/H/1i5GoFo7GujeV6ynQz
	p2o70S8OP3eDIsBNmVQCCONEUvEhrP6sPc+u0o5ifu7/yK6IkfSh79Xyt3+Nbr7lU+I6sR0U103
	VXkL3Zr1YxM7h23vgpT9bA60wc9sqyQ182fifHsex6LgnfCRSvgsyCj8II0U5ZQ5XGRKI3tdwER
	N+NKQoDVG6l522QiwY8thLviAInQURgjJbCVZ+oSgIX30J6CvePD3+ZXkAOx/UBZsm/0ieKdd88
	GNTzhNWOEtomhrP/HR7GW6M1hR4vLfvgtQkcyFIvy6G1hHMcxXZxopQyKInp2DLXIXuc27wjSih
	A8NxFXR2MMfWiTl1GYF/+6IiFnoUHcPwnE90SLWECgjFXjFBI31OFFdbHZocdZ05AUbQHOEXfbf
	3N9vGww3grGKXwZRQA/agen+B6mosJGxOXTIATKKLDwMBlHLqgdimtze7OElYj1VjsAuLb0o5KO
	MsqAfZGtCMF1RBpMIzrmAPPhKEDzBAJ2Oe7mI/j1rhaSJY25+S8S60gOhFHBw5KtcGiyaGVuEGP
	T0t1X8Uq1PF4NOmK54sJv8w==
X-Received: by 2002:a05:6870:c04:b0:47b:d505:86e8 with SMTP id 586e51a60fabf-486dd636e17mr7766380fac.7.1789933539109;
        Sun, 20 Sep 2026 12:45:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v4 0/6] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Sun, 20 Sep 2026 13:45:26 -0600
Message-Id: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwQrCMAwG4FeRnq00aa2bJ99DPDQ1uorbZK1Dk
 b27dXoQURByCUm+PzcRuQscxXJyEx33IYa2yY2ZToSvXLNnGba5F6jQqhKMjGeqQ5KVBSu5dh5
 kDxKMXihdGHREIp+eOt6Fy8iuRcNJNnxJYvOcZOHAPj3Ux24VYmq76/hBD+PFK2z+PSyXklDOt
 6yIYFe41b524TjzbT1G9PgPghnRiKSRjWIqPxH9jix+IDojFj0VGixDSe/IMAx3ppIpa14BAAA
 =
X-Change-ID: 20260914-submit-h616-emac1-v1-143703842abb
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_124540_668069_89182031 
X-CRM114-Status: GOOD (  17.37  )
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

The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separate
system-control clock register at offset 0x34. Add its binding and a
sun8i stmmac variant using that register. A distinct compatible without
an older fallback prevents the driver from using EMAC0's clock register.

EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and has
no external PHY pins. Leave PHY initialization to the PHY driver instead
of using the H3 internal-PHY controls. The RMII-only variant does not
expose the RGMII clock-delay properties.

First fix failed MTU-change reopening and hardware-resume cleanup in the
stmmac core so the interface is closed without repeating NAPI shutdown
or resource teardown. Allow phylink to stop a suspended instance without
restarting its link. Then move the MAC software reset from probe to the
DMA reset callback, after PHY initialization. This lets the MAC and its
MDIO bus remain registered when the PHY driver or one of its suppliers
is not ready yet. Clear DMA and interrupt state even if the reset times
out. Keep the separate H3 MDIO-mux reset sequence unchanged.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- Add a prerequisite stmmac core fix closing the interface after a failed
  MTU-change reopen without repeating DMA, IRQ or NAPI teardown.
- Close the interface after failed hardware resume, and let phylink
  finish shutdown directly from its suspended state.
- Retain DMA and interrupt-register clearing when the sun8i MAC reset
  times out, and return the original reset error.
- Link to v3: https://patch.msgid.link/20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com

Changes in v3:
- Add a prerequisite fix moving the MAC software reset to the DMA reset
  callback, after PHY initialization, so delayed module loading and
  deferred PHY probes do not tear down the MAC and its MDIO bus.
- Preserve the H3 MDIO-mux reset and propagate hardware-reset failures
  through the normal stmmac hardware-setup error path.
- Add Alastair D'Silva to Cc and rebase onto current net-next.
- Link to v2: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com

Changes in v2:
- Drop EMAC1 TX/RX clock-delay property support and keep the existing
  RGMII-only delay descriptions unchanged, as requested by Maxime Ripard.
- Clarify that EMAC1 connects internally to a co-packaged PHY, not an
  external PHY or the H3-style internal-PHY controls.
- Rebase onto current net-next.
- Link to v1: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com

To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Russell King <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
To: Jose Abreu <joabreu@synopsys.com>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org

---
James Hilliard (6):
      net: phylink: allow stopping a suspended instance
      net: stmmac: close the interface after a failed MTU reopen
      net: stmmac: close the interface after failed hardware resume
      net: stmmac: sun8i: reset the MAC after PHY initialization
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 13 ++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 69 +++++++++++++---------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 30 +++++++---
 drivers/net/phy/phylink.c                          | 16 +++++
 6 files changed, 98 insertions(+), 34 deletions(-)
---
base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>



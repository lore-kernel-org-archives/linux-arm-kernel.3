Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE615C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 18:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lckP7hj0eg5D0nk/YR1XaBxbluMeeizhLnEF9QtDWMM=; b=P8kO2JtTwFqUbu
	dtGsUdNearZeC70sM4aH6TjrSC5qlMCDexyPy+QGikjzjm5LD7wYmy0SJrO4uwiEDialdMKfZQZRZ
	9z6ADEH0GB5OSAkQWRi5EcPWbg0JFBySpfnvu1D16+wZw1ZOUyDh/+JvKVlJiYvUrsIt062k5ju22
	sJTEIvg4ZdyJIwle1HYppJE/Mt0S8un6glNYDH0OJDObyFoGOVdE2seSpfpko/kS9bL4F3DSRthqK
	bvJFmFA4dv5Y/sXj0S4sl+n0HtUwcGfgucQvhEnHPgbNKpYL2JAXKRrltoEfiTfbVqqx/GOthSC3r
	DLD7hDQbdPpWdQ2dMjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtzF-0000000GidE-2mnv;
	Sun, 27 Sep 2026 18:52:33 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAtzC-0000000Gica-2XUo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 18:52:32 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-469fdb78b1cso1351233fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 11:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535148; x=1791139948; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lckP7hj0eg5D0nk/YR1XaBxbluMeeizhLnEF9QtDWMM=;
        b=sjaXnYywwzDbpIzmDqmUrlcCC0uWooNfAeIYkuI1/b5OUWc2BjEoI+B0EiFxoMpnBV
         CrMFDTS9DcwpphEgn7Jh7noKyyyGHipQufZzL8NkLzjZSeNAPgrljBopVz8vi7ZZIONO
         kFcB8YP8AlPbKHuTuN0EB5DslbtVpUxWcT3BmUEmEo0GnMfQFgIQNVoDRjRwnMJtBSf/
         N6kH7wLZNG/XGPOfDjJ1/tsNvnfTLBsSWblgtaRyxP/7YzKqhsPvXKvWPo4V9zO6bVDx
         bbsnOfOpRC7a4M0ZAB8rLmMcUQEhMrTcY7ZwQt6DB2w94Ol7GG3uLFmRgTXRuLNp9Yvv
         cZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535148; x=1791139948;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lckP7hj0eg5D0nk/YR1XaBxbluMeeizhLnEF9QtDWMM=;
        b=WgQ1hJ7wKEFqbFqEhyRltqw+d+nu/5XXqeWXbPwQEU4/MuVd+w0j2bMtUHH9ci1ks3
         jMIQJOlhhUVLL5kyHgNaRtxbLTrznX0Jhw3NTd7hBqwoJGnnCKF49UEEhBbsVGUAeg4r
         oOpTcMaduOLE27lE1jJbcAnDWTjQRO81N4gAhJ6m7jTsAHg1Jd9GwPNqflmOXVxrSUlm
         G99LxilaGqDn9Lqt29gXBMIT7Gsag9N61j8n79gmWW3+ctSvIN3b7Dz2iOalss4e8PSP
         Xe5uupx5Otyqx7Aimkoo0byB4XAxbCGTQ20iSoam+jjj+o4cem5cULafjom9xUcxl8be
         FR6A==
X-Forwarded-Encrypted: i=1; AKwUvByjdPlJluaEzQkvJZPOs9O/iiGLZCQ44J1B8UbPDtojWmC95iXJeLbuDXMW35GqEHlM6PfMTsBg6kIqy5e95liM@lists.infradead.org
X-Gm-Message-State: AFq9FYLKqQ9dKeBc021vNwOvT1sLXcVrrBj2dO+j2aqMG9FFB7cz6bG7
	gNpqqmpgO+7iNGuS3G1XMT6WGhJL0N6KTy7+1+i/RMcViAt6AtjEAH7+
X-Gm-Gg: AYBFou0iynLrvu1Whhtc57uI6xSjIOx+711OeCq9ymbkPBb2JCdbT8WzZPNqA6rpJcO
	nvDyiyqXtA8+p7im5e4uLvXLyW0bOYKTd0LZqoM49sU5F2SUo3fljHNd+L1OekBf6JrTFHT/AdP
	vj0FgPWVzej4Coe/KiYynLXqYi4VwaVvNxfSN44EiSyK2b8VXEamd0WbrgAFMhaGfQaxMSs20hT
	FKGwraW9a7fcVwy1MsnvoUDwcjhnWx2hGUQirgL3RgyvqjcpxYV1nKunKTJi1heBXoYS+z+EDX8
	w5nfpIfI7SVm/uSAZeqCJaPNu4NbdUOHFTP5irrc1hYOWmzF3oDkACWLPzhpYpN1lJo1NTd70Cv
	jH5zGEHjM4cJmvN4E98yB3mbYFg4ZX/uiFAB2IZiKeyJcZMg41EhLAXkLRiqGqs2UhlQVs3wDUi
	hWCbltFAokC1vgcf6GI6bAbjL5pQusWM2wxbJJfpablr+XxqQeQcaoW9x1BKaqAmf2XdX7zH+rn
	rMZCVMhJ7KPTkPgQJZW7ajv17jx8X1ZhxGS1e6uhMpV7vE4evw8IeUpNDWwVi9ettazsdRg08LD
	pEJdCN/KXsDO7f27UEWsNANgnSvTxs6pIUhGiRRJ2SbLdiQaOXgcsNNbBP+F0jZKp4W75qJ2lUB
	xJw1nbNHH0nM/jaKBipGK
X-Received: by 2002:a05:6870:8893:b0:47d:4a10:7303 with SMTP id 586e51a60fabf-491e69a95d6mr11172874fac.31.1790535147641;
        Sun, 27 Sep 2026 11:52:27 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-494877590e5sm4489452fac.13.2026.09.27.11.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:52:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v6 0/3] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Sun, 27 Sep 2026 12:52:18 -0600
Message-Id: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OS07EMAwG4KuMsiYodtK0mRX3QCzycKdBtEVNq
 AaNencyhUWpqITkjWX7+31jiaZIiZ1PNzbRHFMch9LohxPznR0uxGMoPUOBWhhQPH24PmbeadC
 ceuuBz8BByVrIRqF1jpXT94naeF3ZZzZQ5gNdM3v5nhThlXy+q/fdLqY8Tp/rBzOsFz9h1d9hp
 QQHUwUSzkHb2KdLb+Pbox/7NWLG/yBYEInoJJIS5MwekVukPkBkQTR610jQBMbtEbVBUBwgqiC
 NVHVoCcnVYY9UWwQOkKogNlitgYKh358sy/IFvL5sgegBAAA=
X-Change-ID: 20260914-submit-h616-emac1-v1-143703842abb
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_115230_659690_6E9FCEE4 
X-CRM114-Status: GOOD (  18.08  )
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

First move the MAC software reset from probe to the DMA reset callback,
after PHY initialization. This lets the MAC and its MDIO bus remain
registered when the PHY driver or one of its suppliers is not ready yet.
Mask interrupts before requesting reset and clear DMA and interrupt state
even if it times out. Keep the separate H3 MDIO-mux reset sequence
unchanged.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v6:
- Add Maxime Chevallier's review and test tags to the MAC reset patch.
- Drop Alastair D'Silva's cover-letter tags from the binding and add
  the binding reviews from Andre Przywara and Krzysztof Kozlowski.
- Link to v5: https://patch.msgid.link/20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com

Changes in v5:
- Split the three generic phylink/stmmac recovery fixes into a separate
  net series, as requested by Maxime Chevallier. Keep the sun8i MAC-reset
  change, EMAC1 binding and variant in this net-next series.
- Add the originating driver's Fixes tag to the sun8i reset patch.
- Link to v4: https://patch.msgid.link/20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com

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
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: LABBE Corentin <clabbe.montjoie@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
To: Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (3):
      net: stmmac: sun8i: reset the MAC after PHY initialization
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 13 ++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 69 +++++++++++++---------
 3 files changed, 57 insertions(+), 27 deletions(-)
---
base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>



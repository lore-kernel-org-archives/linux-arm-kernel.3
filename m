Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB5EC982F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2/OAn78xm1OSx5ilLefyLSI7VeBwJOO8ghkxmHGyO8o=; b=uDxasbW5YHAhox
	bpd94Pqp44XYUAApCWLUGG0t3U5qzLyhIRvwR/fVcfIHOwQGvc5qXzi2PMQJu3vFX2wE6Izn6B2o+
	Y11Mrzz1AyqjmC0X7/oL/TZCEakDSzdHx35tZ1gDZVb0TzcrL3akQ5Sl3Gb9mGt0D9fz7o9zoZDDt
	M7487dwjN4RCw7LkC32Z4gE8ILnHBtEgci0sQgziXHvQ3/XS5A9PPGjqwUAvQv2kDt+3R8FmsMqpy
	Zvx93cfena8AgIkiV+nA/LarGqYtPvA2FUP5X3z4l2IAKUlAGD7laGNwL3x8jvF51Gmk/B1sVhacG
	iq9EWXsd6wLL4CPBZpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8odW-00000003o3w-2Ooj;
	Tue, 22 Sep 2026 00:45:30 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8odT-00000003o3E-3wMt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:45:29 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4b37a3ed715so2226990b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 17:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790037926; x=1790642726; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2/OAn78xm1OSx5ilLefyLSI7VeBwJOO8ghkxmHGyO8o=;
        b=ol+QLnyP7EN8sViqv4x43xU/ShiJi+rdy6V5asrhijimEyOJdtsRtsCpXiTwA0itm0
         Aa+tKGn1SDOcY7Q3i6KMDWATVXYanMVQh8oczDaIA7Dy+FUVKbw5PAzVtLcMbrmlUs8f
         wgSQY3zG7Z143/I8hpg+PPkevZZi5c30xTh07chAPaaVb/zfISj0fTWjIf8AQL30cXTW
         najiHbvEzTswn1NhzMs9liYfmVZeQ3dRyz1yXkN2cQ3A32ij9rkCeQa/KOPOp/VEmHUx
         //+lGulLBuXihOVeIPTAsrTt4P0pN76mnAB8bbQSppXhlqxNDNsnPfIWq+0/qMnop8Zf
         mK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790037926; x=1790642726;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2/OAn78xm1OSx5ilLefyLSI7VeBwJOO8ghkxmHGyO8o=;
        b=zcT+Ye2PxVjjEOnFoyANfoOWc5IdD97tvY9iYYLx7xPGTv9LahIsnZc+uTwbdyYVXB
         J1K6KJ/vURqm6YBeJk6GbUHJCMo26EuOyEYo0P3S/LWqxb97oRnmewfepYLuaKaVRYUe
         GUy3HpOzvwkYSe1i6u57YzMcJWUwwlwBYsBmyvxD4DfbK8BK16dlO6nDAQX6HAW8XKn3
         rwshdhvf2T+2GoHjr2bnl8jcNMYd0Qk5tqAl3nBLw+SosLgJuBK6HtWP+xg9YVzoRT12
         VY0N67tgeHVt9vFFFMWMwEneyBCpYFHQ0aogLDlU7FougKSpCn2N7B4/m5ldLN5ZakN/
         GNFg==
X-Forwarded-Encrypted: i=1; AKwUvBzarWru2CN9gjRQJ9vLFELnzcGvp7t1cdmSEVOU8XQMJncgKxRzLxNSh+5z+tOBQyWo3iZ/TFPYKjoMdKOykZdB@lists.infradead.org
X-Gm-Message-State: AFuF++lQQRl6wmTTMG8wimGko4u6ftSHDZtzedUC4Zmyn0dKzheSCsTQ
	eezl97vVo3rUo9j/IIg3NCfOl9wacbNTq+i9AOQkOLuhdH2M4o/bwSpq
X-Gm-Gg: AYBFou3+Yd1XxpuKUSCDMpDx86j91bh3GmxROdKPF6m9CH5DM+pOHbROEO61wlW1GTU
	P18+++uUTa5bu/5bWrGibd9XO6hX85YnFtASN5ubaVzusj7JqOy9rITUELfGW+Wo9ate+fCNuLN
	xXPp9FnvZBNu7s9KZyrxLQGxCbNiK8GiFOOyGusT7ynUCeFfuVKY94NaOvF92gSRtF99AZsYrUW
	BbajKt7a/Nd5YbTTyw9OkFSlK1w7p6QUW4517y2reQdZ2MrRFI9nPipGVUDj3sJdFkghbT9KEdm
	mjA26bH0LWkM812EajUzPJ6iNaoi9P7qz9AoXTbJU//fSQJlBCSu78W6pB00Tg0w66fJPycT+C2
	ginSVT5l6tIfOBFM3D5mOys4z8EKRGsAozaQ3pu1Di59IS2q8i6t7h/QdhR0dORUE8490eh3SU+
	biSUct8zmi9yk6U0nQ25a3XO5hQVLACxxvjPnaSSArfabhfdjt6z+CFvpF/TcUJI9bgdl/ahN/9
	N/VL2NB1tezr2ZUixYwj5x2WjVhCXrjVC/ZkaCR+8ILtmnLNpG8Ikpg6Kbwt2G3rVhH0gr7TZgG
	lKkjToGpV1M1cGBIznnUCaE4VZLpPemOeVqAct1C2IcAe//SmzIA/4v9gQZDO6S5kcsgrfPLwSQ
	9OL036jVxjgJoArXdFHOHlQ==
X-Received: by 2002:a05:6808:680a:b0:4b2:8d7b:390b with SMTP id 5614622812f47-4d464080f0dmr1026002b6e.19.1790037926314;
        Mon, 21 Sep 2026 17:45:26 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4bb6be7b3sm60201b6e.0.2026.09.21.17.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:45:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v5 0/3] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Mon, 21 Sep 2026 18:45:23 -0600
Message-Id: <20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwWrDMAwG4FcpPs/Fkh0n2WnvMXqwHKVxWZIRu
 6Gj5N3npjuEskJBFyHp+3UVkafAUbzvrmLiOcQwDrkp3nbCd244sgxN7gUqtKoGI+OZ+pBkZ8F
 K7p0HOYMEo0ulK4OOSOTT74nbcFnZTzFwkgNfkjjcJ1k4sU839bbbhZjG6Wf9YIb14i+s+D8sl
 5JQFw0rImgr93HsXfja+7FfI2Z8BcGMaETSyEYx1Y+I3iLlE0RnxKKnSoNlqOkRMRsE1RPEZKT
 SpmxaRqay2SLLsvwC4mFjqqMBAAA=
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
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_174528_000813_1C7204DF 
X-CRM114-Status: GOOD (  18.00  )
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
base-commit: 1b4efa0399f549d9b9bf82b3e2450e10a06d65b8
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D99C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rtt5XejF/bWF3GOuFvls4LbhkcGw1Hah+9I1v10tav4=; b=ckZoBKtlK09JSF
	9sq/a3/acxrX0HXC0+34h3gpGHahdSpmmC4gAaaM9uc6wrtSCSnBzmK06G71w8fnefRQQohxGU1x6
	xtZLd2YiZs2wCDLse6ZsTiOjZjKef+qUZ+zNyiG7RuDIZUUpJVdP187Y7gosJy6wMDmUcE4ErMpyv
	74LYikFhfImX2t4D1+RYdYiZopMfz9GN2YwxQSvPvLm5Z3vsCmQH2RubDnN1mSuWo/Txuv/lfxpkz
	6Tt3MiYbUR3kgjrakwn4wPeXaW+2wuMsrifK2tsdh/F53ehUo5BmTHwQz4RBqV4N+vAn3SVlgjxww
	EYlZe1co+IT0rVHW0/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GKT-0000000C8xb-1Lf9;
	Thu, 17 Sep 2026 17:55:25 +0000
Received: from mail-oa2-x0f.google.com ([2607:f8b0:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GKQ-0000000C8wM-0Nsk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:55:23 +0000
Received: by mail-oa2-x0f.google.com with SMTP id 586e51a60fabf-4693691fc81so739092fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667721; x=1790272521; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rtt5XejF/bWF3GOuFvls4LbhkcGw1Hah+9I1v10tav4=;
        b=Z+P4XM593ZLkiiW9bww33z3y820VotC9hczQIzNoki4v/HWI24EKgaA/hlp0mEZT1e
         rWQAVxQL2EGMRLXxgWsVTccSl3uRrCtWtK03Ax/oa+EFDh0hycpx4GYQT0uBEy83Ynfh
         UQwQrE1koJYjCYI3A+d9c7bwPesjB89cjbg1MlYGYACDMy32uB47ZkzbbCzAxrdLE6rR
         K5/SuVaiX47knkuWhx1IjGnaPJH4byLRkyVCpVyb+w5SKFgIgk+BWXq8KpUuL3d4aozK
         k3NnL0OT1ZzroBBRRJ/SFjE8WqUITaZ0fWQx35743AjQS2RAKuNDnv0MeJOe6FM9qxnw
         CAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667721; x=1790272521;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rtt5XejF/bWF3GOuFvls4LbhkcGw1Hah+9I1v10tav4=;
        b=WXbjGcyyjFg5zfOFF/S0aVBpkMciWAXLddBoOaVDgdWMCAOcLGXoComl3i5Cj6h2x8
         WXzB3yL7/5LYeuN7Nh4WRa7N0qRbTlMt1ocVRecU/MV1NluzStedjSzaVTsV7R2IvYSp
         5Z0dV+gXaovyVYfLT9z7+tTorUIueKSsUOa84lSz+7pUEueYgfW9VLm74iMHAOqZt7/F
         ZxcRTesTDr70X8CWq0gFZUu+mem8EL4I2Ld3nIqfkR0lWoHzsF+yAP6ILoOK1/+uF44F
         EDqQNBeNAcEYZjluNjOh0hYsW8JAF2LZRUoCXhmilpB4X0nDfEqoEUFqgsMFyFVQcEAC
         oCKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ9MtjNN0qyYGF9o4Q5TIA1jx6civFDBUXVOsokJKuUeAfheYBOykg+12XhalzE/Aeq2lAq/THLuJvn3fIbpPK@lists.infradead.org
X-Gm-Message-State: AFuF++lu6LZiPm5BR6n8VVtR+xLjwpVkTG4KMeP6MOpjDvVKO5ukPCJK
	TXbWhc4dBrZxDMEXuGK5lsb4R8UBf8Jqt0mCyNhfJ1SP2zfEW/sUVg18
X-Gm-Gg: AYBFou2JOUHt1ohpq73Vv52yzBoV2H36M1osNHSg7MxcFVXIZhK3rbRFwMUTN5RbkqL
	swHDj3OLo2boP8A3jbJt7B9FtTFbVVDoc2oI1UoPtN1D/zVdofvoI/xNO0VW4htZQvBnFiNXLbw
	S+4xXl8VWgwVh746En6euU1ZDpQqY7XP9iZWjoqZMl3FUTEX3itPUjcPkA14TfeHWLQf8yE8RwJ
	hdvXOPCIJkbHavOXpPk60TBdwnihbPJNRx28Pn3We+uJcSoYUhsuTdDU6lvtf5D2tLzN6XS8oP4
	3k2MnHdjAS3/TdYth1mz8WJzfGUHep+j8Q6K1EiJWTubOu/dIKvrghZ2ceaL3ql7mWMdQPlabpc
	LRY/VCZv2GJ21lbuNK9dBg1mXQRUqVDiCwwWa9w32LrpKLROvEqiG9ZW8fXO5UwQ+mInjAOccyK
	c/rJ3rJAkEnWgebpZiKT/Nji7ZMCLtGiftdpIeRxG5iVHvPBh/w/+wMFakudszoV9qgHVPCb5rQ
	92zK9AhMkX4nTaDrQMF2XxFizfj8l8FUO4ss1IigV8dTY8+X/Ui+feZkHsjrM6iTS6BzJ7zUCdQ
	ig/6D1jw7BPlwkC2+w7Uluvz3kiaHNB9DzzwAYokOaq7FzJQgu04/YcqjFf8WiYT+JFkQmEih9y
	L4I26oHrzhROh2ZMYKb9L
X-Received: by 2002:a05:6870:41d2:b0:475:a1ec:9613 with SMTP id 586e51a60fabf-48476c61b11mr7860909fac.21.1789667720572;
        Thu, 17 Sep 2026 10:55:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v3 0/3] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Thu, 17 Sep 2026 11:55:11 -0600
Message-Id: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Oyw6CMBBFf4V0bU1fILjyP4yLtgxQI8W0tcEQ/
 t1SXbhwYTKbm5l7zizIgzPg0bFYkINovJlsCnxXID1I2wM2bcqIEVaRhgrsH2o0AQ8VrTCMUlM
 cKaaCHwivBZNKoVS9O+jMnLFnZCFgC3NAl/cmEa6gw0bdbgfjw+Se+YNIc+MjK3/L0hBMm7IFo
 hTtannqR2luez2NWRHZPxCWIJwxxRkIAqr5hqzr+gK92Q3iGQEAAA==
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_105522_141464_7E8E38A6 
X-CRM114-Status: GOOD (  13.75  )
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
Keep the separate H3 MDIO-mux reset sequence unchanged.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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

---
James Hilliard (3):
      net: stmmac: sun8i: reset the MAC after PHY initialization
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 13 +++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 66 +++++++++++++---------
 3 files changed, 55 insertions(+), 26 deletions(-)
---
base-commit: 26ee8cd69d46a14b37ba5e512084fe80d730127a
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>



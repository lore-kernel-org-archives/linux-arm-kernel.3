Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650BBC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 03:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QS2BYMR+x6ZlCVJM56HodZfD/aY2Xxc0QJwlrpiO7pc=; b=CE5ONg4ns0ysL5
	Sk1qO2XoxGeJGWaumJQtGxQbljR+lAAAqchFKfIdS9hgeKNjAWTcQUcK2cUvfbm/WtMDueRskmerw
	N7OzkyGImQ36AgsTQ8X9pzcX2nFUWBPCckXVFykiIKeRhOTZbPX6Q+3Sqildw9J1U5UimdpXcUaIR
	ZLwtbT3nnp28RFXan+i5ga3z0xXMcor8F6W9tw6R/b9XhYaiM6TLjMv8VUDZuCF8utCdXl0v1541+
	VrMjp/JrlMdTBATL4NzqLcD6SmHLqXGjCgDmtoxPpN2huFrUcrUzy+G3UuRmAQv5oDCAffn2o6+oV
	lFJ5+cwoztBASQj76MIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g0Z-00000008DiV-0Trf;
	Wed, 16 Sep 2026 03:08:27 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g0W-00000008Dhf-3Wf2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 03:08:26 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6b1ae6f1635so247470eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 20:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528103; x=1790132903; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QS2BYMR+x6ZlCVJM56HodZfD/aY2Xxc0QJwlrpiO7pc=;
        b=Ivw4EcG8GLimwLOUU+utIoafSU0sp9/kEDyIh/RY0UuMKmBMhuQwzJjeZx9CgeheMO
         mZBSqO3K1ZrSsxLFYaJaGrb6ayS5V0w4M2NF3afNIjWiRtzaO9zbl1uYE7j7macnamTE
         xYN1O1deUdTk8mlZLhzQ/88NPh5cl2zczYLG4g9OF13Ei9uQhWrbzEUrLgwuJLq+QdE0
         qqft2F9KIfW/TwXvu8xZaI21sspd/+4LPWAKYNYIqWIsD2vJrf7vrcdDCCajHylj+TAr
         GTV7l9GQU+WkYgvN8llG5t570PyurfpfA/q+nwBeZxOFj+7ScZoCvam7ilSY6DY1+kdy
         5j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528103; x=1790132903;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QS2BYMR+x6ZlCVJM56HodZfD/aY2Xxc0QJwlrpiO7pc=;
        b=BCZ5mpwRflDBrshXuxLj1CXVvnEnOpJrfiNcccgoezIfptfdm7zcq6x2/z35fQxfO3
         xH05Hg0/6lD9I8+u0xjZtzHnbrc7qPjjymjBOyE5x08RLELKOO9YstlUVH+hRX8FKE1B
         hb0tPOYMly2qKCWtOhob90F7NF3oirdwdH07v6+m2BPd6XbJjaAOk05c/X14oULsUox9
         F5EURb3alm0eVf6Mhyl7Zj0EVyy9trGljrYHUvJUD0RRWaatnZKl5Qg5EDse/dsy6dR5
         QmV4jzt7hM2fMEMBOlmOdYEW48kVDHuZY08YMDQ6vP7aTRf/EGIXA4xSdtLt4yPKqSEJ
         +vAg==
X-Forwarded-Encrypted: i=1; AKwUvBxBL8m5eZEkV/Y7ElvzLmiEQ3LxUaNnlyyYDP1PeLdZKtD62r/3LS6x4Y2HugAnh8+h1DmqVUDeigkyyU1HiAtE@lists.infradead.org
X-Gm-Message-State: AFuF++mVY7/UzI0Jjppgb6QcYZd34Co208ahtpW7S8AHR8QISldHXpLc
	iycCvtI6TapbYjT+tLCzm/Xbf+D69G1ZzbSqt+EkpUK3PFrO78llie17
X-Gm-Gg: AYBFou1+nEzqTH3CH/qvZ/G/8/Rakf7iRvJWvsMrXPRxngGwEKuTpIQ9JYVYQ5yL2d/
	zLqcWFjleg/hofjd7AejlAmDyU7R3kmbvDKE25qcAUJdtg0Pi6n1vJHgRH3KC3BotA5rbaW02+9
	Z28PKMiqByYyy28a3sx9hPNAa+K7/6aCW//KLfRsliDqE2wPoeEArl/VK2rf3qjzI8mwQVURyJx
	JCIlZtlXpRDrdVwWM902A0XTO7WgKqtw/SXEoC7RVQdsqBvzcdFEMgzMdeO8WdKNdoFR5KFSeL4
	73Z8xcui7NxZQx3NqwppDgU79RYr2PSUq5McjB5AEFanAuvatTcs9op92MLA4E55IMwddArqQa0
	3OVrlGjiaCqjYsyALHi9AqglRuvtFAMG9aTMSzxDA7VhwMBeIsJ18w63SuBZBXf41ThhhKGabKG
	D3w+dwe2E5+CD9PuZLBVn81SzLjB3fnXxt1E9Gg760u3Lbneg4loIlqbn7Mrahvclbr0p7SGA0I
	YqyZpw1eC5yGXp4vz62zM3pmpAFGVmBIwpvMpJ9tOy7CoIl+yzTgg9KJIijxPWvs4XlVyZql2r+
	jFmg5ccVD0QqNfmMs/aZ+EcWVYy7wUgRLoaNpKc0cIzG7Mhq4/4hWLcl/G7sG81wRsAeCAWOv98
	s6M6lhs79AgmtyuFspm+zSg==
X-Received: by 2002:a05:6820:624:b0:6bd:ea89:56d5 with SMTP id 006d021491bc7-6c7d1fca49amr1195068eaf.22.1789528103375;
        Tue, 15 Sep 2026 20:08:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1718078eaf.6.2026.09.15.20.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:08:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Tue, 15 Sep 2026 21:07:39 -0600
Message-Id: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBCEX4Xs2Zq2/IiefA/DoS0LrLHFtJVgC
 O9uQY8mc5nMzje7QEBPGOCSLeBxokCjS0YeMjCDcj0yapMHyWXFz6Jg4aUtRTZUomJolRFsEkw
 U+YnndSGV1pCqT48dzTv2Bg4jczhHaL5JItzRxI263Q4U4ujf+weT2Bu/sfL/WBJn4ly2yLUWX
 a2uvVX0OJrRQrOu6wcKN2vx1AAAAA==
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
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_200824_889557_FD6BDFBA 
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

The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separate
system-control clock register at offset 0x34. Add its binding and a
sun8i stmmac variant using that register. A distinct compatible without
an older fallback prevents the driver from using EMAC0's clock register.

EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and has
no external PHY pins. Leave PHY initialization to the PHY driver instead
of using the H3 internal-PHY controls. The RMII-only variant does not
expose the RGMII clock-delay properties.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Drop EMAC1 TX/RX clock-delay property support and keep the existing
  RGMII-only delay descriptions unchanged, as requested by Maxime Ripard.
- Clarify that EMAC1 connects internally to a co-packaged PHY, not an
  external PHY or the H3-style internal-PHY controls.
- Rebase onto current net-next.
- Link to v1: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com

---
James Hilliard (2):
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml          | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml    |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c        | 16 ++++++++++++++++
 3 files changed, 31 insertions(+)
---
base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>



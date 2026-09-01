Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7307C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=; b=D9rrNq9qa3XS0jf6nccx/kxvPe
	AHKPbkCgukSwCizZ0qrHHDbqWaJaMuicgZTCSrussywi/Lb/2axXLPNWIUHilxF8HogZKk/G09Xmd
	YkMTpYOWbWXF908+w8AcEiZ9+G62xuKKka+a8Tk35g9yYqFMzuOvKXXZlDV2gTHZeGgp+LzDMMbjl
	U7UZ1LfWPceNbBP4udfuNYhkrttRm81fG45EAAG8FnPbVUeoD+sqOdDDWj4fjF5Me4/kgw2UU94au
	Af1H3KgDc2urI1lmT9s207YISaMj8v8AsVrGq5qTo6DFhL+12GO7eE54G1WOaRK7DkCovVnzkY/s6
	xCYTzDLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q0t-0000000CPqa-3Tl6;
	Tue, 01 Sep 2026 15:03:03 +0000
Received: from mail-pz2-x02.google.com ([2607:f8b0:4864:3b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q0q-0000000CPnY-3IHR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:03:02 +0000
Received: by mail-pz2-x02.google.com with SMTP id 41be03b00d2f7-cc1c753b1bbso1220989a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788274980; x=1788879780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=;
        b=d2gREqKo0lfb8VyXKMbI2RQxOylcy9fOyBXo93yvSprdqWzAFJw2p2xTHBtA5FcQyR
         PUnk/AOhLz3FoCFxP0poCT35ndljecYU7NfPrk4Ifv8lIsHaNihV5YgT3gh1SGU03g3k
         7l0HeLk6RAufy4ueiZP8il1GMsfhF0T73tAbOPdJXcwQsnnyJV+deppEwVN9vlUFc/AW
         lEQa0XjrY+FaXeptQOOVCYrrbHiU1dM3k7MbXPETLuD+B8NP6K5yzpCqLsIBt9pEYCEh
         OI2OmAXx9Or9eZJfkPnLt+j7ykYgqq9JDSDzPLQFgJ3PFRvwSSE/xtoFUV+cxusSTECo
         dxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274980; x=1788879780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=;
        b=hwmHyD0tdKrVrjpNEA6pqrSE01MOxW8CggqY8Kl5eduntOctVaFvH0dLu6epxYc/Wc
         bYYEkRKM4BaiHQI4fUdEOafcEKIotRIFBng/PGyIEE1KYs/eu/1YXxoY4IxTeXThIgWt
         uVBnPW30crunAsT9n8t0zraIGQMrl/cxZxzm57Yz4fhHL2tVG1yUYKGPPxjNyxu43IDB
         7YYCQt6KYovFCRSc7Roxx2lZEFP6htgFCE5dpdlkOV2C+xFujn0xKZlrcuGBWNMToRv5
         Xszla6VBXOBMFgAX8gMybGaBtXpnl6c9mwoF4t9X7Gr9mSHMIyBgwqt3fCbOIVL0eU+2
         G6CQ==
X-Forwarded-Encrypted: i=1; AHgh+RoChNy11bXUD1175hJD6CH0W4B4kRYbJMYudiEe2mH3LBac1v8oczBEMEOjY8GgwdN27/AzFlomcwT71nUJpZ1C@lists.infradead.org
X-Gm-Message-State: AFuF++m3Rjppqlm3PlzAnEmOISWeUiNCheO+Rq9PAWKZDPyZND8k2sRY
	Um2jiqIW+nwOEiRek4EQyqytZw0NRPsYErFzMn/+ZV+Fx68oXDDN/31A
X-Gm-Gg: AR+sD119iJteneUWr6qXIaxrY3IHkPsWr0fUfu+so6rbhvJgtR/+FLuU8QjT6aC+HWi
	D2AdAs5jvprgzEW+4IkSvXgZQUE23Jq6UgWyOWC2MI5jIoNZauTynweXciS7vBWxHcY9hE4g+FK
	E9B4qyEzUTwuCGtA7fL/YRlV667+8hWCRlZy2fF0eSd1LCjowgPv5doWRK+iROiYDkZDx4oiWpm
	U4UgOLGkmqvHxLb6ElP9N+tr8KZrvtqRa6Isf3dmu9Fsw1p/R1sOffk3ZQIWxwj71P5XII+fm6r
	fUjxoyOaLNew/M6lMzd+jzK7pk3PnKw+ysuUM/kN84mZ085YBxpzdXMDhi0rfKi3ZJP49umBC5R
	ldJ6TDjBowJ7h2lIIkSbJjCN7+/60wjb6HXQqWFOZKeuK9UpknXhWExaD+/PclpG3zgpLS/lEHI
	UmDPs4f6/T5O+hmrMJWqE4wlhE8mwnIW+/USvQT/atHRgNtjmXnLh2T85EpAo=
X-Received: by 2002:a05:6a00:3d0a:b0:848:417a:d1a6 with SMTP id d2e1a72fcca58-85b5b321d25mr11818840b3a.15.1788274979663;
        Tue, 01 Sep 2026 08:02:59 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0716846sm27914b3a.45.2026.09.01.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:02:58 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v3 06/10] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Tue,  1 Sep 2026 23:01:06 +0800
Message-ID: <20260901150111.141037-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901150111.141037-1-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_080300_822008_C55892E3 
X-CRM114-Status: GOOD (  17.81  )
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

On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC side
SGMII), the PCS does not automatically restart auto-negotiation when the
link goes down and comes back up. Without an explicit ANRESTART, the link
stays down forever.

Add BMCR_ANRESTART in two places:
1. In xpcs_config_aneg_c37_sgmii(), when starting AN, set ANRESTART
   alongside ANENABLE to initiate a fresh negotiation.
2. In xpcs_get_state_c37_sgmii(), when link is down and AN completion is
   detected, clear the interrupt and trigger ANRESTART to restart the
   negotiation process.

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0337e2bcc0125..50b9cdf94fdaa 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -816,9 +816,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	if (ret < 0)
 		return ret;
 
+	/* Clear CL37 AN complete status */
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (ret < 0)
+		return ret;
+
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-				 mdio_ctrl | BMCR_ANENABLE);
+				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);
 
 	return ret;
 }
@@ -1093,10 +1098,15 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 		return 0;
 	}
 
-	/* Clear AN complete status or interrupt */
-	if (state->an_complete)
+	if (state->an_complete) {
+		/* Clear AN complete status or interrupt */
 		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
 
+		/* Initiate the next round of AN */
+		xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+			    BMCR_ANRESTART);
+	}
+
 	return 0;
 }
 
-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA94C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=; b=tK2lK+S6j3UkXfBZ8pr4SsemL9
	8Dx8t0w7q0lOW+b3h6DFrZSTm2tRQ7IHIs8Xh9AobszfgUzYRuq0VG+qEOoYN014Y0/m2aYTUZFmE
	WO41xi0+xr+EyWEVstQgCOmJWcRlSfK3xQxCKbTbRwqVZ9DuLrHhSZRV2jV5y3G+RYe6VUMgoine/
	WZo1cl6qTapB8WP2TW7OFlpy964c71/NKgtItWCTooL6tJDCrIBdl0ma5gi+JksJSYon8sV0H8dwM
	p/xxfP+MCoRpE0h1IJeG73mzDhULS/Qj1jClve6k6SWqUwJRR8sugHgrVsRENUJKe6EwevGkTgjru
	44LbC6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bRP-00000007CVs-0ii8;
	Mon, 07 Sep 2026 15:39:27 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bRL-00000007CRs-49nz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:39:26 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so1048757a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795563; x=1789400363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=;
        b=DdlvZrb/FtFx9oUG/Ujjay9rsDS8dnf4Ev7rwG5hvSB0IZU1wMKhvGuDlywHrADiUm
         G6Rrc8jCVFQharIPEtvsNKPnRatotOqhdFDWTyK3ZNMJyoGYUNAWFS3QFm4FWdvLCe8i
         Dt5z4+Z+bdd/7x+7NHY8Cw0kyx1ZSiQNE9mlRsUfz1AxtFcNdSOd5HcvRixjwOlOtpJk
         j3aoeZHlp53zI/VFO8W6l1rnuM1k88fjfXTQ5e7Pc/sCEzF4mzOM3UD1CICjgsqJNDAn
         xQz8NAfp9WPgZctGIVsI8yxsWjAjG3wmtqpYVhXWGfi5XBWlNIrCAnhZihQJPiESUAND
         vmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795563; x=1789400363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=;
        b=UsNxjI2/bXGqbne8Y1I+UFfidU40MdU5oopZl0ppyzTW6vbq6arcFrk9ENIpq0vvBe
         A/frZ3QGlmolhjRdlAWMGMWW1qoZm2nOBfi0wb154gY+fk2EUBIATIl0/Rt8fqulRV0j
         9Ps5d3Om74jMUh3FY32GpjFQF8ywCYvAWemhim+sNFJ7NbwQ/EjHMMiJK3i7EsDCFcjV
         9NsXiuYJU47RlBjFBP2CyQeudj3IXMlmi9kd1p673tvh/BcnBDaNMH1mVKA4nq6DyHAn
         jtceCKcnFBgQl0JvCzI6IpN1bSxA80VVscsD4xGRUB/OCaKPJAryEtuVGQ41IZMew7ET
         pjsg==
X-Forwarded-Encrypted: i=1; AKwUvBzQKEakbgQjODGXlCAgQtRkqC3LxRweeBDJ4EPUrF23rwSGRIr4FH7eIq8SRaGxuveMDakXTaZySTPj6PT/eUB+@lists.infradead.org
X-Gm-Message-State: AFuF++mWNOf5bb7ALV97h8XXSKxZaOIftqj2wVlRvuaceLdkw1RDqt6e
	PeSvvL+DLOKtJMv77nFnDKWEpYvx5Q1oEIm3NzRMgX+gOnvTUpcxfzvb
X-Gm-Gg: AYBFou0yU+hbMBSRfLQ7yKF+bbRkwPc+gsBlH9KnVgzNJcq1eCECQhspAS8VBgNRnE4
	CuNgQ0HaKyHiUgzbyH905m9toCERX/zeWOR8KOWv1Z6nDRTWoGzsiu+TON6u17NUj7Y9kEfxhxW
	EhLi9irbcw2tLdl0HuMiXBJ7IvhJhlW2kXcXzP0tn0T2I5Zd27QkLW+qU99T28LXZZBTi+WUTJv
	CWCEq4B6QVZE54EhAkbmbpMepZlqcJuYiCI+4/HtBSDl2fCLrrzHp+s0TD0jsSIOVy12XJL3iuB
	NLdHKAJkL5zvn/vazT5KJ2gKFE647SNwbVCBECC/sopAm4JpjvruXk6DgVqdSS5Zb/kTrpRjSAc
	dOeiz+nKKJJt8d0TUGX5z/aYnlAq0Eor2SZttpbOv0PsRcnv8Iyo26QIkc2KPUN2ca7iUBcH04T
	eUq8bhe3Dm0RVH4bbZs6JoH1DPKIf4YsvKIWD+oOnw1Aco+5gYceK8YiYMWPM=
X-Received: by 2002:a17:90b:384b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39b261e79f1mr34240199a91.13.1788795562857;
        Mon, 07 Sep 2026 08:39:22 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:39:22 -0700 (PDT)
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
Subject: [PATCH net-next v4 06/10] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Mon,  7 Sep 2026 23:37:09 +0800
Message-ID: <20260907153713.2572547-8-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_083924_023243_2CFA43CA 
X-CRM114-Status: GOOD (  17.08  )
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



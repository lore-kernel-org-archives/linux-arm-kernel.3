Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1291DC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 19:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cfe0VVZFX+0RXygGXnYE+LZWMLMgO2pSV2be59Az8jU=; b=trETeMAoBeDtIDnG9DKFfw5nQw
	EN+iRyjs8oHuRGAOL1QAPz+juB9QXJ6+UPbws/Cbvrfkgl/n/I5cPRREqMwBg5/NrVmm8YfnbCoEp
	5zuiK+Z55Q/N8BK8NyJ00Q+pnMW5jqIViCE0GPZDCoOBgTirvSXXH+Xsn9AwmssLJeKWQo+houhq3
	0Xbjm65EG9ESMxJ2kDH/iRzdLzzl8G1LkxMJ6a/hDIYqPfvPX7gkwxjDYb416g6qh0SHzf7F/KStf
	h9OhGdwUK3KElwIjvmpzO/+pB5ATutsTi12E4fT67Yu/PBtNWaZg/OMCM3A1CnAW0N1ZG58/6DcGh
	oGndW2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Na1-00000000Khy-2JYW;
	Sun, 20 Sep 2026 19:52:05 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8NZz-00000000Kgw-13vY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 19:52:04 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466ccde2b71so1577775fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933922; x=1790538722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cfe0VVZFX+0RXygGXnYE+LZWMLMgO2pSV2be59Az8jU=;
        b=ikXsi2qVZty/MIjfq2Hwbu0xSi4W7/EQFBl9hSSjr+aF3VruvK5ZI243dZKiSImiKZ
         NJQAhpG7kHpJZ4pW1A63XZAzANkkoTorC8Mt2trNuiQQHyEuan5CZvB55O7aWPucpdEe
         EARpS2XR619ET8ZOcjRaGaqkRbxE5F9UGLU8RUGM+41P/4T6K0rVibzDc3Dq1OHVrB+Q
         kClavyH60bHycrlptmqHCcLSA8e6ATXTYj8i7MNpVDm3L9rsMIdwtuqrz7t5iPoc6ay8
         NtV9h3+OijbScDY3MXy2SlPtvUYXI9mOQgb6MxTaS/sWZJb/EdNE5KxuNpejgMFNxX2T
         DDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933922; x=1790538722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cfe0VVZFX+0RXygGXnYE+LZWMLMgO2pSV2be59Az8jU=;
        b=IR9I7bPNQ+yrQdsrCrXGdNiuiu3TlBdHZEpkA77oSSTHCzxvKD6Nzh4MTouiHMNyEf
         +dE0cGIOnwfbvI2LYVKLc1+HixiQkQrbN6HjQeEh/OzASDJIq/FJwBswG2mtRS2MYNm1
         gsXFJg8xO79+Smg8gq61cmy1wfOJotssDHn8j/gOvKaI6BJ5inVUKZREIUe1Fi91GB2W
         o4lFJZcGunAnWTv+SSURdyIICD3OzWw+4StczY4fKGaZF+UfiICCWddb2Tw1CI+redmo
         WM+mZFd+Cjih7FSBWa7C9YBkseV9veih7aG/2WD5W+XPHalsRNYXc82TDHs/CkM1VKtl
         qwoA==
X-Forwarded-Encrypted: i=1; AKwUvBxSvLxQoAV2eMERjA7YWoHSn+b45Yrq8FfW413YgrIcCzk0niEPA0K+o7UShwjuDm0oZjIBnGBKqQSxNmmBPeaD@lists.infradead.org
X-Gm-Message-State: AFuF++nEt7FozbMCosM12OGif4budb78jIZ60VmCuXTIX8wQ5Wzq0XhW
	+L/39PdBXrBpCNDM2ErT3p+uyu5U2wp3jhRE7rXZjQWmDyBFB3JDpfvCNUOj2YUj
X-Gm-Gg: AYBFou0MhrBjBP40GXx7E0F0RJkeRPCPdK40jfFc6zfVL8DlsPFALTxecLDZZR+UUrr
	LwXOcbM9tuglyF0O5yRhibt7TpQ1jANcskUQ12XoYCluGFKx3tgV4Kt1JxpuD3X+LP5YxXAShRL
	PLIqGl3IT45Ky5i/ut/CXSrKjwI6FTae0giLeocMxbilvWvJmbTRNxqQfeEy4s4IgrEQ+jXao5h
	PKj2UiKjiSC+dYv7RrZBiytFEnju/h5j+zIHRUZnKIEIbRqx7Jap1Xjng4cM3btjScczM7rkwFm
	v+DQb2s7XfNAARI+denGrRfZqX4/X+lVXXo5JRyBVEAtL0Y2Xl+vK4mmzqAzBWpOHwGF+kbHPVf
	hAf6Xcprs3+KOjF6HQSQadPSg6GoiG+EZ1Y3RnW8CwQrQ6F1myGgw4Y4rsFP3H1gZM9DZrMk1Ys
	NYGcAjClscKhFpQBwCMVZl34RG7GE0o9gapY1eR66cWlpK3HXTqGBM2kMEuJ1BVDc2VYdLvpwvQ
	nEN5itT2XMBLryjUKjnBZvND5NNa/qM0Sll6dUloPBdXx6t1tiKKeuxmlwT4DBpfJfojP0XbMMs
	qnwMJCY03olYtYL4eEKasgZ90yR6mh2Prp7A1AvBDS3qVupbfkbTc/Tp36CATr+IOE/BM252KiZ
	nKgbOvFn/bOE+KHuisvFz
X-Received: by 2002:a05:6820:4b86:b0:6c3:2a60:63c with SMTP id 006d021491bc7-6ca9aa41ef5mr8971692eaf.22.1789933540913;
        Sun, 20 Sep 2026 12:45:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:27 -0600
Subject: [PATCH net-next v4 1/6] net: phylink: allow stopping a suspended
 instance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-1-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_125203_304660_42E8E826 
X-CRM114-Status: GOOD (  14.53  )
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

A MAC which cannot restore its hardware after system sleep may need to
close the network device instead of calling phylink_resume(). Without MAC
Wake-on-LAN, phylink_suspend() has already stopped the PHY and PCS, so
another phylink_stop() repeats their shutdown. With MAC Wake-on-LAN, the
saved link-up state still needs a matching mac_link_down(), and leaving
PHYLINK_DISABLE_MAC_WOL set prevents a subsequent start from resolving
the link.

Allow phylink_stop() to finish shutdown directly from either suspended
state. Leave an already stopped instance alone. For MAC Wake-on-LAN,
stop resolution, drain pending resolve work, complete the deferred
link-down and clear the WoL disable bit while retaining the stopped bit.
This does not restart the PHY, reconfigure the MAC or bring its link up.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 390d3eb3e6f7..8ecf2dec3a7d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2615,11 +2615,17 @@ EXPORT_SYMBOL_GPL(phylink_start);
  *
  * This will synchronously bring down the link if the link is not already
  * down (in other words, it will trigger a mac_link_down() method call.)
+ * It may also be called after phylink_suspend() if the MAC cannot resume
+ * and the network device must be closed instead.
  */
 void phylink_stop(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	/* phylink_suspend() already stops the link without MAC WoL. */
+	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
+		return;
+
 	if (pl->sfp_bus)
 		sfp_upstream_stop(pl->sfp_bus);
 	if (pl->phydev)
@@ -2632,6 +2638,16 @@ void phylink_stop(struct phylink *pl)
 
 	phylink_run_resolve_and_disable(pl, PHYLINK_DISABLE_STOPPED);
 
+	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
+		/* Finish the link-down deferred by MAC WoL, without restarting. */
+		flush_work(&pl->resolve);
+		mutex_lock(&pl->state_mutex);
+		if (pl->suspend_link_up)
+			phylink_link_down(pl);
+		__clear_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state);
+		mutex_unlock(&pl->state_mutex);
+	}
+
 	pl->pcs_state = PCS_STATE_DOWN;
 
 	phylink_pcs_disable(pl->pcs);

-- 
2.53.0



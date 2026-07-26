Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA577C53200
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkX/QoeZrS0kRupcwaIPCrYydg188P1E6HxAusu+K+4=; b=v3whRTe1dp5LSMbUtGbLDLNGX/
	q1Dz5HES+haJvUtnkgESmKXqHZV+bzboDlR2QAnlt4gplAPMkJwu/Nm2rv4aeUlD6mKbQkAoC5M57
	euJGJ7Yio8yaXizZ0mDfg4UQnN6uxJnAbPkGmx/hMFjO2IU+L0AaOUX4XDVOW/hdK84zUwaN0oO63
	PULw1e2VsEtvilr7BZ3YTfFCHdLnG161f7CV1t1uEQ36u66orJvgPmaZO2nw+2ZyN5kvftP+Ktlx9
	W73IjuZto5NpRGd7lInHy6mXAw6/Btv6k+PtzIPfE16YK5NZOpDEz9OcmTdebXh2tH2ghr9EaM3ON
	sPoBU6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnysP-00000001Cf6-2M5v;
	Sun, 26 Jul 2026 13:26:45 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnysM-00000001CeJ-2vrU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 13:26:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cace91f112so19897595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785072402; x=1785677202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkX/QoeZrS0kRupcwaIPCrYydg188P1E6HxAusu+K+4=;
        b=OFseaRnuP3psKl1vf9HAiWrT9/DS/b5kUFzMSm/4Z8mKcUklf3YtE7i7ZsbNytlTGv
         3/aDdNICw1mSvR4DDdxX4uXIR3Yuu2wvgy2z5hn+39WLeo5IEr2PEss073pzarqySyrG
         NE6eclXKDSxeBUf07g3aNv4Ekl0L1ze+Q8idPbtCFxyboqRzmkXdItfX/P/kYPi6s2Ga
         xJtIzmR47HbGgHCLz7d/yGb0M55V1XHHy8B96uqQwyUD5n0oAkXpFurpiJXnZBMoh8yy
         uGt7f3IEBC9/Zo68J5bKcLPyp1+QS8Ev2OAzLNh9uJ01YSnJg+QjaF+bICjGABeaSD3Q
         ribA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785072402; x=1785677202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkX/QoeZrS0kRupcwaIPCrYydg188P1E6HxAusu+K+4=;
        b=hGGBngO5TxOeeBn1K5C/oqjDiU7pT/fvwibpXo0hxw/dYmdFEvYgN8LI8bX+KUijnt
         cD4KsJ13bCRIjEyTkGBIMC5++kONHLNUgUMv7kWZfmXoXI+/CwjIcPRrkdgu5akbjeX5
         NB2ZsArgASYFUZ+zBshyV2gnAi3O1cl2ThFIQ6MvAxlaYIoy28Lz8TZhBjrVrQYmuryt
         WkoXAFUNG2rKTC/tfSjBUsdD7cV+eQw2Ylwyepx+XLU6SUGP5shw6myR0SFSRvY/xR7W
         STrItFQIs0J2m3DafnRjFOIE9BuKQWv84WDTA24YVv3YWOz5C8BTBMWaPV2f2FVfvv4L
         vMGw==
X-Forwarded-Encrypted: i=1; AHgh+RrHdImQNwkBU8BLoEG4+u/mleB8yGZAG7LN0TlF4YR/3owZ2+PB6/1HJJxJdIn9tWprSRz2lWTORy8fQmTXomiu@lists.infradead.org
X-Gm-Message-State: AOJu0YyLhNqCP3+OF5Roj7WgIBMC5OX3QJJk0uMhVRW11izEFX+bfgRz
	sTOSVVVjuTl+9L2RS0e4LNNO5o1Sqk9lZ9oQcMea40jo081z6OwI9lfd
X-Gm-Gg: AR+sD13+Sp6bfvIJFdfmXdxvST6a0spB28egZKy3gD8stSL2qDSPuDde48qXJjSlh3T
	rdVTz52Fjuf0NTj/I9aDaTkLeUrE2tG0hEFu92xsEYC1IjYlwZN+JmDbG1NvjKh3mdYC4JQBPpk
	P8lzBHm2lPurYUacawueUrs7NWStt3nt15d24tBmZlVps5tEiCE6ZjgoiSsVNNNcQZc8qpkwZq/
	kSYN/JZZD1nTs0RTViePV2KRx9Oow8+LPeoKVXP7kHI3kEEwsgZ2NKEjq9zkpP12MiDE7jvRkgn
	6x6BIEyGjUnvJViKtHZJAyFfYvddP5mpMsXWQaJy2uODG9Uy3wB88Eri54QY8TblwdOSVP4R6tg
	4TqcnAPvrd23dANnpEZ2E0kP4FfVnCzBMIlHn3O+MQiqChCaIlCKEWEYs8R3DId+YR6t+7KQ8lb
	nC
X-Received: by 2002:a17:902:c947:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2cfde7a949amr47216565ad.12.1785072401867;
        Sun, 26 Jul 2026 06:26:41 -0700 (PDT)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdc2sm20677655ad.42.2026.07.26.06.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 06:26:41 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v2 1/2] net: phylink: allow PHYs to be attached in 802.3z inband mode
Date: Sun, 26 Jul 2026 21:26:17 +0800
Message-Id: <20260726132618.3580612-2-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726132618.3580612-1-zxyan0222@gmail.com>
References: <20260726132618.3580612-1-zxyan0222@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_062642_743543_D2728E10 
X-CRM114-Status: GOOD (  15.37  )
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

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Now that we have proper decision making for inband mode support which
makes it a "best efforts" feature based on the capabilities of the PHY
and PCS, we can relax whether we expect and permit a PHY to be
attached. This is especially true for the 2500BASE-X case which some
PHYs use without inband on their host side interface for 2.5G speeds,
but use inband for slower speeds switching to SGMII on their host side
interface.

We already have such a case for some qcom-ethqos setups, although
qcom-ethqos overrides phylink's inband settings by accessing the PCS
directly at the moment. This should allow qcom-ethqos to transition to
defaulting to inband when 2500BASE-X or SGMII is specified in its DTS.

Allow PHYs to be attached when inband mode has been specified, which
will be necessary to allow inband mode to be used on qcom-ethqos.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a7f78c82913a..66dddce05afe 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1983,9 +1983,7 @@ EXPORT_SYMBOL_GPL(phylink_destroy);
  */
 bool phylink_expects_phy(struct phylink *pl)
 {
-	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
-	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
-	     phy_interface_mode_is_8023z(pl->link_interface)))
+	if (pl->cfg_link_an_mode == MLO_AN_FIXED)
 		return false;
 	return true;
 }
@@ -2224,9 +2222,7 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 {
 	u32 flags = 0;
 
-	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
-		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
-		     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
+	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED))
 		return -EINVAL;
 
 	if (pl->phydev)
-- 
2.34.1



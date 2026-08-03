Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC55C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/5/uq1wl03WMsz5ualIqMKCury9OUeuYtebMNsXO2w=; b=cdOrdLZP3GCilc68gTnZxH5u9k
	FPdIbLyIAwPTGsXb7U/d4Mkbu7zUV+aZ1v8m/h+u2h/L9vJOGbUgOe37FuHPqwFcJG11zSA07Sej6
	ASLLcHFTlAyhQo4VofI3cgCuskn8Ptsbwo7f7CgVTWeG2wCNe3E6Lg2it+R3YmBhxvHpo6y/Jmzaq
	tpupty2gO05BDp3zlHwkQFibBtS17tB13HAvEpV0RhJYhaO2oh3SO0i3c6/V9vLVzT3pVWAO7b3c5
	Hx+xoHKkJ1POmqoXTvVln+tXyZc2T/LGVnFECObZANS0hSl30M6BToJk2MvuPufU8nT0VlfjGwQf1
	vyoye3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1l-0000000GLJA-1Mce;
	Mon, 03 Aug 2026 05:15:53 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1c-0000000GKzV-3SHb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:51 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7eb61bbeb25so2152009a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734143; x=1786338943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/5/uq1wl03WMsz5ualIqMKCury9OUeuYtebMNsXO2w=;
        b=Weeou8ajcaetIMafmnNt9kUDYUojgZHQeSHFeRFa4mm3lFABJ0RDqtopJ2798XzM5a
         Ri7y9IZyfWX147OazludzFZTGakBarWi7CZBTlT2PkFf8A7fIYLtYsn9hTfY9/ovTaS2
         01JUElD4ztr+QFqUL6CYkPMt0kl7dFwnPN6uMNrEdi7oigh2om0aYSHqYkyA2o68EXkM
         fg2gaLJIdswJjYSi3Ff+nH648x2eBLMJxHVFbrRDBpUNuWd4Z0TQDO5EF7P8I+mGcQ0N
         uZgVtjDXLDJyJVYGjueb9kMzmMTrzv1gOOhJNx2IAEf+XPS9n5+cIYp0BnvR8nqPXrdW
         yvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734143; x=1786338943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/5/uq1wl03WMsz5ualIqMKCury9OUeuYtebMNsXO2w=;
        b=nVJBHWY8HY1afxTlWlO66AtPS+w2gVVUO8JvaQ2CqNLfbs+RI9p4X02Xa57FSogunI
         yR6A2YrhrUdNZ8DJlzgHCw+kqSAtp76BN85gdrH25VvlL23k5jfGw7wypx0nQr/yDJC+
         gIwlbFKNqGpv5TGca5NynkPiP3EkVrOthu8RZaZXv3ZTreM54KrVrJfsmkcsRzhirVnh
         uB4otoTwhNnO7Q135P9OXcqRTh+Nei8kEGT124LDUKWdCqeBfYclvlmTgnkjcryOmkjz
         3VDLrPHuMrhqr8RmoI6Ncnq4RE1Dxmvw946btzb9q2Z9Q952SES/YbnmtJKNOKRDd6ww
         in6A==
X-Forwarded-Encrypted: i=1; AHgh+RpsO+VYh2rNRSVVVuY1RYDa/gWl7B/Bqw7nEWO702FndELyTzcWytLTDwX8NXrwNmDBI7rW+5BpeuWR8p5XyMvH@lists.infradead.org
X-Gm-Message-State: AOJu0YyRVHfXkQvHgDDXc52am+zHLA9Q34fhmdm776tvYwpw9oqvkEyA
	17OKWmJnhEMlv6A8RQOtlyL80+euK4sZNa+Hw92V5msdQ9BlaEgvmb3AoRnUPtJr
X-Gm-Gg: AR+sD11pG9m3acZ0vFCOF4X1dPshHk3HP5zpN+gAXsusYJ7yuqZHbmEyGDTo1IinLUw
	3SYJGKmcq5ghfIC8x0dVcZa5hJmhotpXHpRMwM58RHy1GNqdmGOymXl3PupX8Z36zQB+mKUsWAD
	nOFwmm4zHv+vQOS0USwhv2GKDf3zdjZcqwpbYfdetHILs3WfJl7Q2mLcsUeFRLVCCtTkjVn3rTY
	1pdErvFgU5WLdJkVhtEHcltCUGo4vtkvPVD1EQVd0bY6bkiU0P09G4AriaJE56ud+Jk1XrungEX
	TArT1v2550sIrp1hoJaJNIfgqQFPvKqKlFaSUmsayxpUHg56rbcq9JlEiToCesTnvFh+pqAubKv
	LujZHbgry3npOCM+WUe2ccVaD8NsYXPGnW9p3qQr9sBWwmdW6WAgvMoiYUqn9cLzpKMt1TwYc7h
	aD23lgBZ/pCQDIdf1+V6FPNDceFU626ndlumDUIroVWujDHm+MtYfirgPNnLOTtEMLqkPOUIfim
	f50ECqTDJCw5nSDpDhbrYDx/11PVk/RZNamOrPMS22KARPCzFImpSOM9Y+mEIsSFz6rEJ6iCPSF
	WKOKt7/V7IyArnzjmKKZoQQrcEJj2TFm5wPZc9yRYEe1SpyIKVW409vqhQZXZJUfAVoNMeccyFG
	epp5fF/nCReeC15vS
X-Received: by 2002:a05:6830:4114:b0:7e9:bd00:c6ad with SMTP id 46e09a7af769-7f196f29291mr14805744a34.16.1785734143562;
        Sun, 02 Aug 2026 22:15:43 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:24 -0600
Subject: [PATCH 14/21] net: phy: support configuring PHY-autonomous Tx LPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-14-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221544_944845_04492A6C 
X-CRM114-Status: GOOD (  24.86  )
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

The ethtool Tx LPI fields currently update phylib software state and
notify an attached MAC, but they do not configure PHYs which generate LPI
autonomously. This can make a successful ethtool request leave the PHY
hardware unchanged.

Add a PHY driver callback for applying the Tx LPI enable state and timer.
Call it before updating EEE advertisement, and attempt to restore the old
hardware state if either the callback itself or the advertisement update
fails. Use the callback to disable autonomous LPI when phy_support_eee()
hands LPI control to the MAC, and reapply that state after PHY reset.

Drivers without the new callback retain the existing behavior in which
the Tx LPI fields configure phylib and the attached MAC. Existing drivers
which only implement disable_autonomous_eee() therefore need no changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phy.c        | 35 +++++++++++++++++++++++++++++++++--
 drivers/net/phy/phy_device.c | 25 ++++++++++++++++++++-----
 include/linux/phy.h          | 18 ++++++++++++++++++
 3 files changed, 71 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be330..c76d5baa1f84 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1996,6 +1996,8 @@ static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
 int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
 {
 	struct eee_config old_cfg;
+	bool tx_lpi_cfg_attempted = false;
+	bool tx_lpi_cfg_changed;
 	int ret;
 
 	if (!phydev->drv)
@@ -2005,16 +2007,45 @@ int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
 
 	old_cfg = phydev->eee_cfg;
 	eee_to_eeecfg(&phydev->eee_cfg, data);
+	tx_lpi_cfg_changed = phydev->eee_cfg.tx_lpi_enabled !=
+			     old_cfg.tx_lpi_enabled ||
+			     phydev->eee_cfg.tx_lpi_timer !=
+			     old_cfg.tx_lpi_timer;
+
+	if (tx_lpi_cfg_changed && !phydev->autonomous_eee_disabled &&
+	    phydev->drv->set_tx_lpi) {
+		ret = phydev->drv->set_tx_lpi(phydev, &phydev->eee_cfg);
+		tx_lpi_cfg_attempted = true;
+		if (ret)
+			goto restore_tx_lpi;
+	}
 
 	ret = genphy_c45_ethtool_set_eee(phydev, data);
 	if (ret == 0)
 		phy_ethtool_set_eee_noneg(phydev, &old_cfg);
 	else if (ret < 0)
-		phydev->eee_cfg = old_cfg;
+		goto restore_tx_lpi;
 
 	mutex_unlock(&phydev->lock);
 
-	return ret < 0 ? ret : 0;
+	return 0;
+
+restore_tx_lpi:
+	if (tx_lpi_cfg_attempted) {
+		int rollback_ret;
+
+		rollback_ret = phydev->drv->set_tx_lpi(phydev, &old_cfg);
+		if (rollback_ret)
+			phydev_warn(phydev,
+				    "Failed to restore autonomous Tx LPI: %pe\n",
+				    ERR_PTR(rollback_ret));
+	}
+
+	phydev->eee_cfg = old_cfg;
+
+	mutex_unlock(&phydev->lock);
+
+	return ret;
 }
 EXPORT_SYMBOL(phy_ethtool_set_eee);
 
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index f7472a743185..30929b0354b6 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1357,6 +1357,21 @@ static int phy_poll_reset(struct phy_device *phydev)
 	return 0;
 }
 
+static int phy_disable_autonomous_tx_lpi(struct phy_device *phydev)
+{
+	struct eee_config config = phydev->eee_cfg;
+
+	if (phydev->drv->set_tx_lpi) {
+		config.tx_lpi_enabled = false;
+		return phydev->drv->set_tx_lpi(phydev, &config);
+	}
+
+	if (phydev->drv->disable_autonomous_eee)
+		return phydev->drv->disable_autonomous_eee(phydev);
+
+	return 0;
+}
+
 int phy_init_hw(struct phy_device *phydev)
 {
 	int ret = 0;
@@ -1395,9 +1410,8 @@ int phy_init_hw(struct phy_device *phydev)
 	}
 
 	/* Re-apply autonomous EEE disable after soft reset */
-	if (phydev->autonomous_eee_disabled &&
-	    phydev->drv->disable_autonomous_eee) {
-		ret = phydev->drv->disable_autonomous_eee(phydev);
+	if (phydev->autonomous_eee_disabled) {
+		ret = phy_disable_autonomous_tx_lpi(phydev);
 		if (ret)
 			return ret;
 	}
@@ -2973,8 +2987,9 @@ void phy_support_eee(struct phy_device *phydev)
 	 * manage LPI signaling instead. The flag is stored so it can be
 	 * re-applied after a PHY soft reset (e.g. suspend/resume).
 	 */
-	if (phydev->drv && phydev->drv->disable_autonomous_eee) {
-		int ret = phydev->drv->disable_autonomous_eee(phydev);
+	if (phydev->drv && (phydev->drv->set_tx_lpi ||
+			    phydev->drv->disable_autonomous_eee)) {
+		int ret = phy_disable_autonomous_tx_lpi(phydev);
 
 		if (ret)
 			phydev_warn(phydev, "Failed to disable autonomous EEE: %pe\n",
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 2eba54e068f6..55053b914144 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1391,6 +1391,24 @@ struct phy_driver {
 	 */
 	int (*disable_autonomous_eee)(struct phy_device *dev);
 
+	/**
+	 * @set_tx_lpi: Configure PHY-autonomous Tx LPI
+	 * @dev: PHY device to configure
+	 * @config: Requested Tx LPI enable state and idle timer
+	 *
+	 * The presence of this callback advertises that the driver supports
+	 * configuring PHY-autonomous LPI through the ethtool EEE Tx LPI fields.
+	 * It is not used for userspace configuration after phylib has handed LPI
+	 * control to the MAC. Drivers without this callback retain the legacy
+	 * behavior in which those fields only configure phylib and the attached
+	 * MAC. A request with Tx LPI disabled must be accepted regardless of the
+	 * timer, since the timer has no meaning while the transmitter is disabled.
+	 *
+	 * Return: 0 on success, negative errno on failure.
+	 */
+	int (*set_tx_lpi)(struct phy_device *dev,
+			  const struct eee_config *config);
+
 	/* Get and Set PHY tunables */
 	/** @get_tunable: Return the value of a tunable */
 	int (*get_tunable)(struct phy_device *dev,

-- 
2.53.0



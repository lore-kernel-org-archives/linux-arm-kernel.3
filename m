Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AD5CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=; b=4BSLx3JxDABYu6dbazJPqR7ObJ
	heHUniMYFSlE7bptAQLaf7OG/jAUDOinKARS1vQrMdUhvYfJ108LcLO1fGfFqyFihO5WIioKD9Zqe
	XP0VyvUBPn7Oir9fIWmmUV8Ci/EUJG/ofm+7MFR7QNlxyd8L7rWFLTDaGt4em5ZwnEzcUS0yaSnXH
	FGoBjTiLRuLqkY+p4hZsokqycHDLZOaQsMU5LdG8ZHE8AjKj6syCgFt/oETt4jx1v/SSxwd21PThr
	1C00ZLOUPORXLYavEsE5HcaclAxiFFLyfLoJxJcH3OMjqSz1zx/6Oz0vScQ4X1CdqHQWXICAtv8CD
	AN4E5CbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLS-00000006xyN-18Iq;
	Fri, 09 Oct 2026 18:29:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLN-00000006xnP-0CEZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48dc202a60eso34482f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570559; x=1792175359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=;
        b=UGBuW9zpT2PBpLX+ivXzsBc4qOpTO75XzDtm/vYnv2DlbbDJgqwY6N8ZHmv7A8gKs9
         D0Q8cS90O6euwRd0uHwpmsXDWSwiv254EmEB1jKUtaXk91+mpAHlKgNKtCqDg+kDaFN/
         YKnvbJrjqfwPjTPJ2/vpGIyOLSfF/qno2K8SYuEqrB9JeQYi4CWxO8IvaoMLtDdHXTe2
         r3ZlMa17SnWRijp64DUVtNMDYnZ76U8IpBI1z37JXX6JIFwAVefzkhOcQ+SbPD2uDClt
         A8AMk6CFOhRK3Ddt9rdcsTOeQG5V2kCHmcK4+FJ2seVKy2sNrzjC70h7QFH+SxeGVr1i
         e45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570559; x=1792175359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=;
        b=1aRFudhb0M2otDNGrp41v4aKWzy3lbmcayVYjTczELl7hW2Tot2Ic0JEy9JrBL6ktw
         66C+uiegpnFf8T03xmlbhAZdIjMNEU2PA7HD3XSJAJ9mlTiaB3llERv2gc4FvbHdDkBH
         44KDs9MhhzfgyqRHUX38giBOPkRZnEtT7LzEZjzMnlpiTuAydK5qWWX0pnR4cQ6dh+6G
         tZ6VOjfMPfn2rCvvzPImlso5w/LjmRWetoxBlVL1C7DVWnqDuVJ5V2fk2GzUS9FsC/cz
         Yz6FFZNRmBLfFqjNjA8AtZigCobHhNqmAHh667LnHl0ka0TPh2wgUiHKA0nIqTLvgz7j
         m7Eg==
X-Forwarded-Encrypted: i=1; AKwUvByS+Bh86V9IXOPUFF6pT8PfBsj87CH8psvcbkqwaLMYBQ29nJqa9l1GOcLV2gOaxPGHqEDwMBZFJmzPbmTqRnBY@lists.infradead.org
X-Gm-Message-State: AFq9FYJGYfKnvS60LMeFRUJhJK1XMP3rCzBtMNUapYlhiFqa2ZVa2jgU
	FeAlQOqhy+Xvr3O7ZEHAxDtEK9DvaEJyXok7EmT7E2i21pE2efGxCScX
X-Gm-Gg: AYBFou0kicRLufnJT3AIunC5rpDshz4gXD2m01R9jKj5ANQZr76ttte1HwCvYAtf3Sk
	ihb0+Gl0VfitqeP3pI38R/3QdvYdGQcgXPP2kfVDViEhVib617417p7bTLHBOjtfYSv8XI+IyUM
	IYh9lOu9QSl7v/2m1QUqaHlLhnrY1HNTV++v/X0FuXZT9IfYv9mD9YGhJM9mR2mQ5HzxkEZcjlH
	wmSSTuff/VCaTF8wnj6Jvu+ADbH3vr1pusg4g+AIpgdFiXZXiy6v4pJdgZWvXBxUcNfhKn5I6Cl
	U0OGpn6KuinYQ9jimkIqN+FE3ml9hNCiOi2ZRYbRLSh7agl7Xw+vD1XsWB8l4nHSVM24DIET3YP
	1Xgkhn5/Th/MhH8kMFfOcB1oCTcGowD1/eslj6xIXldYmC9oAFWaZlINdKXDCgn6P//j//l8ItV
	4/oTE8JopyXPVRzS73mOnWiBfiVpqUCCF5pLvXImCScAwWZSqfUtzsa4tktc0xs/JHLHi0hJEvK
	HfnpNaGIgrjS5HbYjjV8QyhiIziLwKEaMyOTNiN4vcojpkE9My6bjoSOhYkL+aJtYh2shpEEPTC
	yAMWHsua7CGkfVzGj9oi4mLBeN+Y
X-Received: by 2002:a05:6000:4112:b0:48c:7ac7:e59d with SMTP id ffacd0b85a97d-48dbaaefaf5mr4958397f8f.34.1791570559085;
        Fri, 09 Oct 2026 11:29:19 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:17 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri,  9 Oct 2026 20:28:05 +0200
Message-ID: <20261009182836.50631-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112921_136063_900578DD 
X-CRM114-Status: GOOD (  15.53  )
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 59283564f72e..28dad1393b69 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -989,6 +989,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1701,6 +1707,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index f06eb8b6f94a..f03c1dc0a4a1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.55.0



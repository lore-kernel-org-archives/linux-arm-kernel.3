Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50968C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEUQeU6k8z4p+pYvxi9WzB22HwI4F5YGnZw/HBsPBRQ=; b=QmCBsohkOjR17bjQtnf6tYZQgd
	okKWCx7uLfBwk3mFCpRpdixrlIYuUhNxFeuZ/k8KZkupVgkTdeVdMUR15heJK7uNn6hh7Ra/9Qyem
	X0eyjOj5PKo2c6UwIm7TONmxPM/V08HZkA8uP2FQ1tEO6vTfhajDvXJet6D+nVsNsKndpV8jZt+qG
	8PfzxarHwgqCcNn8Go6xioUMVv+kWFOSPPw6qfhybNIrEJ2PF8/qqtwQkPgi2YWDmZ9CsG0gP3GhV
	9m2g3RlzthYJqy14OREXDSLDLUMggv9Yvhmx9P/GBxr7gz7SG22PKoB1X4unAdgdiuH1QKsk7kKST
	alicl1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uXt-0000000GGlh-0PmW;
	Sat, 19 Sep 2026 12:51:57 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uXq-0000000GGjl-0DhS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:51:56 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso2487126b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822313; x=1790427113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEUQeU6k8z4p+pYvxi9WzB22HwI4F5YGnZw/HBsPBRQ=;
        b=mzfeEG1EhT3rg7mXeHpnb95CbnZ9EQ080YMGfxsCjMtQl2lLIEBWAS5lM++h4Z0leX
         JXskAM0vhkdWvnzTCofsqKd33XIJP5K8HgyGz98gzWd19Cctp8A84Uh1jMrgOyKaWqL5
         BRsMlUPmIaKaO/eAFFyV4DD+7SZnAlhoReJbFw0ANE+1GT3usaV4lRwH+2+2ZmHUsPsC
         c0iIWvsw7W+XbULl//q5E7loiR00oayb4e76qYEGgukNfBGHQ5fjYft1tFAtn8moI+F6
         s/ZpxPgxinn4ZxRHEicERcGul2GdqtBdhoFzb2QP+6+hW7FN980L5Hwg3+NgdVUQPvlb
         aZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822313; x=1790427113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEUQeU6k8z4p+pYvxi9WzB22HwI4F5YGnZw/HBsPBRQ=;
        b=mlHN5pGcoQEnbZcxgu7Ocju+1norpbvsVLgAage4uw3HkGLNbRx4W5TgAhusi3iHr1
         SdzJu+hpYniMA2plVJUZSEfgxoUa9ku9ZwAF+LP+oGQVOxU8ZU5OfC7qRDY9+oiQ8LMi
         lp+JavFGJEf6tojBvyofP/Cgs+2QygrwQoxPnYbixCmi9y5djyiG4rMHlp46TNFXFqWC
         MNyt2bpvvb42wK0bNsencwP5pqJZh1tcte4l7D6/BTityXtwIU1jENENkXX/fYn4TIDf
         6yDiOeCiptWB35m/oVQvggRMi48Ub7kFz9yBqoAk9UvORMbxFNnfArMmnB1KYjKcn5Sg
         Fl/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEdyTo4GSek6l3yGJfCmjNM7rMyqly9y29qmN23QZ3y35Bu+SZcnZoXrD7vk4qZWcDySUv3rIiwfFHGVhbL2my@lists.infradead.org
X-Gm-Message-State: AFuF++knmXANRECFnrB8+LRZl1Xo1SzjXfyaEYpc3yQkI2auBMSYcwQD
	/a/9QiWwRP3tb7nwBNcG4VKdeOiMDzF3DEs2pMRQsUH07wb2ZDr79hDn
X-Gm-Gg: AYBFou2ryZ21nJuNY8oABnn5sA1pgQyKlqwFeywpN5d3ss+YkhnxfQthXGptr8UtU3L
	73wBmm4Ajc99RyVSxfA0bx6CDD0ijm7pKMZUO/p7bUnaAqqsj9wv9zAawcp7wjUPPL1uRuTsG9M
	V2vhvAV1sXJFIY7LRilymwx0UnL3SSFFYHQJ4Ju4s+JHswEvVy0Lo1MC/8K6dyS+W4iSD7ZxyGN
	pBGuqlVnXF05VjdrAuHny6zV6doUNYGyIeqbSTv7kNfkT0cojqSe+efYably6oAT1d9A9zVpVPC
	Kho8E0S0RvwD1f0JvpADb+7AzewSkcYtGeANoEbgVZFjG4w3HBK6mR77YdsDmjrvNNrdt2V6hAY
	pmJk292MjSZkJSX9N8Bh6ouXIZyY7IJV09/4blqv8bb4T7Dtd0NQTPG/InRjtrDa0Lg6fuFYv8y
	vh1VF0sZ++aMIUvq8kp0Dr4hJkswOxOTeKoJQ9TFZPhuH6bDSX0WdGA8Inr5ewbBbmBfy9hK4sJ
	UlJSLBA
X-Received: by 2002:a05:6a00:1746:b0:869:45e6:7f3 with SMTP id d2e1a72fcca58-87344e8141emr12792759b3a.29.1789822313068;
        Sat, 19 Sep 2026 05:51:53 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:51:52 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v8 01/11] net: stmmac: move XPCS lifetime management to platform drivers
Date: Sat, 19 Sep 2026 20:51:08 +0800
Message-ID: <20260919125119.2107089-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_055154_102101_B29781AF 
X-CRM114-Status: GOOD (  25.86  )
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

The current XPCS creation logic in stmmac_pcs_setup() is problematic
for several reasons.

First, if a device tree specifies a "pcs-handle" but no select_pcs()
callback is provided by the platform driver, the created XPCS cannot be
used by phylink for PCS operations. The framework requires select_pcs()
to return the PCS to the core, so the pcs-handle property becomes
effectively useless for link management without the matching callback.
The XPCS is still consulted by stmmac_phylink_setup() and
stmmac_init_phy(), which makes the configuration silently half-working
rather than clearly broken.

Second, and more critically, when a platform driver sets pcs_init()
and creates an XPCS inside that callback, the common code afterwards
still runs unconditionally and overwrites priv->hw->xpcs with the
local xpcs variable, which stays NULL. The platform driver has no way
to prevent this override because the common code runs after the
platform-specific initialization.

After commit 93f84152e4ae ("net: stmmac: clean up
stmmac_mac_select_pcs()"), the common code no longer falls back to
priv->hw->phylink_pcs if select_pcs() is not set. This change
reinforces that each platform must manage its own PCS life cycle
explicitly, but the XPCS creation code in stmmac_pcs_setup() was not
updated to match this new expectation, leaving a gap where platform
drivers have no clean way to take control of XPCS creation.

Address all of these issues by simplifying the existing pcs_init() and
pcs_exit() dispatch in stmmac_pcs_setup() and stmmac_pcs_clean(). The
common stmmac_pcs_setup() now calls plat->pcs_init() if present, and
stmmac_pcs_clean() calls plat->pcs_exit() if present, removing the
confusing and error-prone XPCS creation logic from the common code.

Platforms that do not need an XPCS simply leave the callbacks as NULL
and no change in behavior occurs. Platforms that do need an XPCS can
now create it with the exact configuration they require, including
wrapping it with custom phylink_pcs_ops when necessary.

Note that this also removes the generic "pcs-handle" parsing from the
common code. A glue that does not set pcs_init() now leaves
priv->hw->xpcs as NULL, and "pcs-handle" becomes a no-op for it. No
in-tree platform relies on this path: every DTS that pairs a dwmac node
with a PCS goes through a glue that sets pcs_init() (Intel, Renesas,
RZ/N1, SoCFPGA, Rockchip).

The Intel mGbE glue is updated to create its XPCS inside its own
pcs_init() implementation, and the renesas-gbeth, rzn1 and socfpga
pcs_exit() callbacks now explicitly clear priv->hw->phylink_pcs after
destroying the PCS to avoid dangling pointer references.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 44 +++++++++++++++++--
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  7 ++-
 .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  |  7 ++-
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  7 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 39 +++-------------
 5 files changed, 62 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index f5f9fa67ecd77..4308dccbf2570 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -603,13 +603,47 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->mdio_bus_data->needs_reset = true;
 }
 
+static int intel_mgbe_pcs_init(struct stmmac_priv *priv)
+{
+	struct fwnode_handle *devnode, *pcsnode;
+	struct dw_xpcs *xpcs;
+	int addr;
+
+	devnode = dev_fwnode(priv->device);
+
+	if (fwnode_property_present(devnode, "pcs-handle")) {
+		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
+		xpcs = xpcs_create_fwnode(pcsnode);
+		fwnode_handle_put(pcsnode);
+	} else {
+		addr = ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
+		xpcs = xpcs_create_mdiodev(priv->mii, addr);
+	}
+
+	if (IS_ERR(xpcs))
+		return PTR_ERR(xpcs);
+
+	xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
+
+	priv->hw->xpcs = xpcs;
+	return 0;
+}
+
+static void intel_mgbe_pcs_exit(struct stmmac_priv *priv)
+{
+	if (!priv->hw->xpcs)
+		return;
+
+	xpcs_destroy(priv->hw->xpcs);
+	priv->hw->xpcs = NULL;
+}
+
 static struct phylink_pcs *intel_mgbe_select_pcs(struct stmmac_priv *priv,
 						 phy_interface_t interface)
 {
-	/* plat->mdio_bus_data->has_xpcs has been set true, so there
-	 * should always be an XPCS. The original code would always
-	 * return this if present.
-	 */
+	if (!priv->hw->xpcs)
+		return NULL;
+
 	return xpcs_to_phylink_pcs(priv->hw->xpcs);
 }
 
@@ -733,6 +767,8 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
 		plat->mdio_bus_data->pcs_mask = BIT_U32(INTEL_MGBE_XPCS_ADDR);
 		plat->default_an_inband = true;
+		plat->pcs_init = intel_mgbe_pcs_init;
+		plat->pcs_exit = intel_mgbe_pcs_exit;
 		plat->select_pcs = intel_mgbe_select_pcs;
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 19f34e18bfef2..9af32c26f9c14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -81,8 +81,11 @@ static int renesas_gmac_pcs_init(struct stmmac_priv *priv)
 
 static void renesas_gmac_pcs_exit(struct stmmac_priv *priv)
 {
-	if (priv->hw->phylink_pcs)
-		miic_destroy(priv->hw->phylink_pcs);
+	if (!priv->hw->phylink_pcs)
+		return;
+
+	miic_destroy(priv->hw->phylink_pcs);
+	priv->hw->phylink_pcs = NULL;
 }
 
 static struct phylink_pcs *renesas_gmac_select_pcs(struct stmmac_priv *priv,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
index 13634965bc19a..01df4776edb3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
@@ -35,8 +35,11 @@ static int rzn1_dwmac_pcs_init(struct stmmac_priv *priv)
 
 static void rzn1_dwmac_pcs_exit(struct stmmac_priv *priv)
 {
-	if (priv->hw->phylink_pcs)
-		miic_destroy(priv->hw->phylink_pcs);
+	if (!priv->hw->phylink_pcs)
+		return;
+
+	miic_destroy(priv->hw->phylink_pcs);
+	priv->hw->phylink_pcs = NULL;
 }
 
 static struct phylink_pcs *rzn1_dwmac_select_pcs(struct stmmac_priv *priv,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 1d7f0a57d2889..6d4bc1fe8f751 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -539,8 +539,11 @@ static int socfpga_dwmac_pcs_init(struct stmmac_priv *priv)
 
 static void socfpga_dwmac_pcs_exit(struct stmmac_priv *priv)
 {
-	if (priv->hw->phylink_pcs)
-		lynx_pcs_destroy(priv->hw->phylink_pcs);
+	if (!priv->hw->phylink_pcs)
+		return;
+
+	lynx_pcs_destroy(priv->hw->phylink_pcs);
+	priv->hw->phylink_pcs = NULL;
 }
 
 static struct phylink_pcs *socfpga_dwmac_select_pcs(struct stmmac_priv *priv,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index afe98ff5bdcb0..7396b68899c66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -426,35 +426,14 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 int stmmac_pcs_setup(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct fwnode_handle *devnode, *pcsnode;
-	struct dw_xpcs *xpcs = NULL;
-	int addr, ret;
-
-	devnode = dev_fwnode(priv->device);
-
-	if (priv->plat->pcs_init) {
-		ret = priv->plat->pcs_init(priv);
-	} else if (fwnode_property_present(devnode, "pcs-handle")) {
-		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
-		xpcs = xpcs_create_fwnode(pcsnode);
-		fwnode_handle_put(pcsnode);
-		ret = PTR_ERR_OR_ZERO(xpcs);
-	} else if (priv->plat->mdio_bus_data &&
-		   priv->plat->mdio_bus_data->pcs_mask) {
-		addr = ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
-		xpcs = xpcs_create_mdiodev(priv->mii, addr);
-		ret = PTR_ERR_OR_ZERO(xpcs);
-	} else {
+	int ret;
+
+	if (!priv->plat->pcs_init)
 		return 0;
-	}
 
+	ret = priv->plat->pcs_init(priv);
 	if (ret)
-		return dev_err_probe(priv->device, ret, "No xPCS found\n");
-
-	if (xpcs)
-		xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
-
-	priv->hw->xpcs = xpcs;
+		return dev_err_probe(priv->device, ret, "Failed to initialize PCS\n");
 
 	return 0;
 }
@@ -463,14 +442,10 @@ void stmmac_pcs_clean(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
-	if (priv->plat->pcs_exit)
-		priv->plat->pcs_exit(priv);
-
-	if (!priv->hw->xpcs)
+	if (!priv->plat->pcs_exit)
 		return;
 
-	xpcs_destroy(priv->hw->xpcs);
-	priv->hw->xpcs = NULL;
+	priv->plat->pcs_exit(priv);
 }
 
 struct stmmac_clk_rate {
-- 
2.47.3



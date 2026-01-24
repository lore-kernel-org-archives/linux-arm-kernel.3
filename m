Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA3DD778BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 01:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxQBocjBKjEC4mv4CNajitmiXw7FC5x1mC5Q0V2nZ7g=; b=3obsXBj/h1C+hTdlpCJrUFVotj
	V7eoIsvD0RgJUHks4bsjT0r7EyjcxmVE0f1+m8dcitnHvK792rT3GMq3Kx3h2yrnV6rB3UtT+TIbp
	Q5bQrjYHb6iW4uZQaFXVJzFIm694F/k+YsUI/g20OBvX6N5bmda2J8inpWbmneAS7lYCbJW1H36yC
	4/utyAB9DgLW+hvaqMPR4+z75o6nePGUufQpsvOBlDCK0V4u5dxJZ+bFtCxo2h5DatWjYog8o5lor
	E/1LidzWgkuAvtCJavuAGiUQt5OmLFmFT+phAQDLSGaIZzFe1q/tfUv/58hFB7OmvpZZtB8GxUTr8
	Nm99n6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjS0P-00000009fky-2PVE;
	Sat, 24 Jan 2026 01:00:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjS0L-00000009fjh-3ZMS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 01:00:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fbb061a08so446676f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 16:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769216396; x=1769821196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PxQBocjBKjEC4mv4CNajitmiXw7FC5x1mC5Q0V2nZ7g=;
        b=WRQhXksicJfqY6sxiJq+/quXCYM0jN3/OkaoWZKMSYQh0GlMEnGr9FzMUcrwGBpUaN
         6HrDNCYWyIfmckoxU0Qy4WAee2NyiMED5VblDJPSfNg7DSdVTsCt5Z1nseK4rU1pqFdA
         k92IrnPxy45LNd6bijidmqI+R1e2D2EdZ9kFbOz+F9gRnaHeGGU6LivCAdtnyHSS05dN
         3YyT46/zOLak+DtvLSA8ISTOuEBSP/cw4Yfv13rnZ0fZsGt82U5iOgw+RsWA+u8z/208
         7o+a0jqeaXDQb6MFvBhmVOKNeBofvYa52kFqMI2IpdO94Ua1P9ktmEQbwGqu9usy3gl6
         fuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769216396; x=1769821196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxQBocjBKjEC4mv4CNajitmiXw7FC5x1mC5Q0V2nZ7g=;
        b=aGlOsrpVMNBSNfisB/XPN6GaChAAkOq1KGTlY2puTnUkiqn5nLGFnH/VbAchqHj426
         6YOAHOQIe6Ozm67A6016Rwb61d9kF+281B84xK8qgtUtt40BFKRjJ2V8/E6KqntLuhrz
         6rYCI27Zn7o4N531M3MsInOb0Uc7sR8Af3YsnTXXGmg4FGpiCOVqpDXSszyp3yi3lF/w
         t04LANvH8GvNVQ/wLTN2mECBeBBUfel7WZ+g32x3q8YwEOwPNN24LVXPFKXf7LVBxgQx
         OY/jwZ6p8fzL8ek61KRHDnzPgc/kPFNkV2mt88KJzvwfFqaGPPmlay3y9mUJ1eysUIhi
         wX5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVySuUGkkXoI1ERzdEQcQuFCiY8Axv7EIWra9uSvVgSQ1o6dHcWLkly/A6YDeNsVPDLof1EVc1GAMVFPTh18vyl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7E/L5vQMu3pX/nRgQ2rHshIbCDAXzN+f7h1YfpdXqac7bddVH
	eDkgps74GzV1D/OkWwdjsVAZ8j3zgNjpmWlbQa8XJG++8ytlPGK/MGQT
X-Gm-Gg: AZuq6aJ1iIycHJ/nnf5wB53MGWdNJ10wY/WHDc16AKy1ew3ajTXAiWN3IYPdDvrkN/c
	y7P2qrlEcYEN8k/6NI5te5umCHo44nmf5Qqo9ipsZqNFcsswDsLidJ1Gldf+F5g9g9a/UXhWp04
	gzFtvbLzvm62AXEMtCn17EvYnDIsM7OEnIG5Bw1C4GuVLRsha1uHYUwhRJce95tH5paBA+Px4HT
	L1Wg1XjHjK2At0xTYI4U84k43CGVJz5JW0zOGcxSBd1KQoNiSb+UyJ9EU2I+JC6hnXjTyqm4g0j
	YDdd36yRn3oJqjDgJN/bZElrr2hcThTT0a7teFVz8So1KNGv0uY5yZppT/HTaNlsaggjSJq+P7P
	5F3Qi8jWbwvyL4iyivOkHAgxH3e+yeFmpB89N5x2eczAC/lYCwGmZl4wMfEr7+TwQvCWFBe/YeX
	k3jg==
X-Received: by 2002:a05:6000:420c:b0:435:b068:d3d9 with SMTP id ffacd0b85a97d-435bdff681emr1187921f8f.5.1769216395508;
        Fri, 23 Jan 2026 16:59:55 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:1430:8b48:2d45:6c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e716b6sm10616033f8f.27.2026.01.23.16.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 16:59:54 -0800 (PST)
Date: Sat, 24 Jan 2026 02:59:51 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 05/14] net: stmmac: add stmmac core serdes
 support
Message-ID: <20260124005951.fbkvd2girdqtfxe7@skbuf>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <E1vjDrM-00000005fQR-0rmB@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vjDrM-00000005fQR-0rmB@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_165959_524944_656FD22F 
X-CRM114-Status: GOOD (  27.00  )
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

On Fri, Jan 23, 2026 at 09:53:44AM +0000, Russell King (Oracle) wrote:
> Rather than having platform glue implement SerDes PHY support, add it
> to the core driver, specifically to the stmmac integrated PCS driver
> as the SerDes is connected to the integrated PCS.
> 
> Platforms using external PCS can also populate plat->serdes, and the
> core driver will call phy_init() and phy_exit() when the administrative
> state of the interface changes, but the other phy methods will not be
> called.
> 
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> --
> rfc->v1: avoid calling phy_get_mode() with NULL serdes PHY
> v2: add cleanup when dwmac_serdes_set_mode() fails, because AI allegedly
>   knows better than the author and phylink maintainer, even though this
>   will result in dwmac_serdes_power_off() being called multiple times
>   and producing a kernel warning. But if it makes AI happy, then it must
>   be a good thing. It'll also make Vladimir happy.

These gratuitous passive-aggressive comments about what makes me happy,
based on twisted interpretations of conversations, are best kept to yourself.

I remember Jakub's request was only to add a note in the commit message
about the reason behind the lack of cleanup, not to add cleanup which
will be executed twice:
https://lore.kernel.org/netdev/20260120153248.0636f1e9@kernel.org/

I only expressed dissatisfaction with the phylink_pcs calling convention
as it is today, and searched for ways to make the calls balanced. I also
didn't make any suggestion to make the code worse by performing the
SerDes power down twice, just subscribed to Jakub's request to leave a
comment why your v1 is the way that it is:
https://lore.kernel.org/netdev/20260122112913.svzaie4eywk5nc32@skbuf/

Getting over that dissatisfaction and working within the framework of
the existing calling convention, but also inserting the comment that I
was looking to see, I believe that functionally correct code would look
like this (applies on top of your entire v2 patch set):

-- >8 --
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
index d46a071bc383..c4465dca6b93 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
@@ -59,12 +59,27 @@ int dwmac_serdes_power_on(struct stmmac_priv *priv)
 {
 	int ret;
 
+	/* Because the dwmac_integrated_pcs_disable() call path is eventually
+	 * invoked irrespective of the dwmac_integrated_pcs_enable() return
+	 * code, we risk either underflowing the SerDes phy->power_count or
+	 * leaving the lane powered on, depending on the cleanup choice and the
+	 * point of failure. Keeping separate track of the lane power on state
+	 * is a band aid until phylink offers balanced pcs_enable() and
+	 * pcs_disable() calls.
+	 */
+	if (priv->plat->serdes_powered_on)
+		return 0;
+
 	ret = phy_power_on(priv->plat->serdes);
-	if (ret)
+	if (ret) {
 		dev_err(priv->device, "failed to power on SerDes: %pe\n",
 			ERR_PTR(ret));
+		return ret;
+	}
 
-	return ret;
+	priv->plat->serdes_powered_on = true;
+
+	return 0;
 }
 
 int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface)
@@ -95,10 +110,17 @@ void dwmac_serdes_power_off(struct stmmac_priv *priv)
 {
 	int ret;
 
+	if (!priv->plat->serdes_powered_on)
+		return;
+
 	ret = phy_power_off(priv->plat->serdes);
-	if (ret)
+	if (ret) {
 		dev_err(priv->device, "failed to power off SerDes: %pe\n",
 			ERR_PTR(ret));
+		return;
+	}
+
+	priv->plat->serdes_powered_on = false;
 }
 
 void dwmac_serdes_exit(struct stmmac_priv *priv)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 6097f4b6dd12..e62bba38ab60 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -225,6 +225,7 @@ struct plat_stmmacenet_data {
 	 */
 	phy_interface_t phy_interface;
 	struct phy *serdes;
+	bool serdes_powered_on;
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
 	struct fwnode_handle *port_node;
-- >8 --


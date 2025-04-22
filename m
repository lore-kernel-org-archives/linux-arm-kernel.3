Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C5AC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jt9Mkr75c4uKAU1hZ+a3wXo6IhuSBSJ1I5FWD7KkaKo=; b=q9JirqhZykGEHtw1XCbqLthw2S
	FfKGZq/Xu92CImkQQQT5Vf7yEjiEEq4nANZwmEWOzH0+QlYKRsrrbZen7o0NV44Vt2cKu0gTSWdlp
	voAt7Hcv6QKR81Ib0HKh7E8RGaOPzHPzsrd7g2QAJvvfMGKDriK609djnfN4Doe5XWzf7dvDIXHz2
	BJrCJxTCGS1t/qXIaHiVa7e9Ozrgt0OK+9lbIY8GEq4ijugQ4OiCf4IZgM2IbCaE0odXRqrSjhyPd
	ZDgv7X+lx2wmjGiZrBnW3kwWrmhdVEQE/NjbE2qNn5WB6mkuURR4DvqWyhsNZTOVx+w+Pd2JRa7u1
	B580IKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8b-000000085dg-0xTx;
	Tue, 22 Apr 2025 18:14:29 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EpY-00000007YF9-0GNu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:42:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE75A41CFD;
	Tue, 22 Apr 2025 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745332953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jt9Mkr75c4uKAU1hZ+a3wXo6IhuSBSJ1I5FWD7KkaKo=;
	b=mQbOxbPVkr5b4cEsk2QiCO7WlOWZoOOT2oQwWVn4K5DxpU27RzMBPjwNtHVpQXZ6MRWV37
	7r/QCuZm1iooze+gyHGRrPPHg3qH9N9eM/QHV8BT3oorCPuUv7hAXz7mSa/cIfzJbcQV3Q
	5nvO6MfJBWe8Nm7WbilLrZfs/JspuxXqYB9SgtcbKkuMZhmnvntW9cULdVIRydNZF8/y7N
	AqO+Cxa6Ik5c1YyfNby9a13BHYfA5rO0cGviemIoPAVKy2wQeSiLfS3bpicrVK2Z8J61Ej
	ZX15rnnmRt1SH65uFg6azI3W9YYkAD+AW9QIWjgtPa1xREx7kpYWJ6Mt3xc/lQ==
Date: Tue, 22 Apr 2025 16:42:30 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jon Hunter
 <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next] net: stmmac: dwc-qos: calibrate tegra with
 mdio bus idle
Message-ID: <20250422164230.5ffb90d3@fedora.home>
In-Reply-To: <E1u7EYR-001ZAS-Cr@rmk-PC.armlinux.org.uk>
References: <E1u7EYR-001ZAS-Cr@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheprhhmkhdokhgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgto
 hhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_074236_233760_87F93F24 
X-CRM114-Status: GOOD (  14.99  )
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

Hello Russell,

On Tue, 22 Apr 2025 15:24:55 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Thierry states that there are prerequists for Tegra's calibration
> that should be met before starting calibration - both the RGMII and
> MDIO interfaces should be idle.
> 
> This commit adds the necessary MII bus locking to ensure that the MDIO
> interface is idle during calibration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

[...]
	
> -static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
> +static void tegra_eqos_fix_speed(void *bsp_priv, int speed, unsigned int mode)
>  {
> -	struct tegra_eqos *eqos = priv;
> +	struct tegra_eqos *eqos = bsp_priv;
>  	bool needs_calibration = false;
> +	struct stmmac_priv *priv;
>  	u32 value;
>  	int err;
>  
> @@ -158,6 +159,11 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
>  	}
>  
>  	if (needs_calibration) {
> +		priv = netdev_priv(dev_get_drvdata(eqos->dev));
> +
> +		/* Calibration should be done with the MDIO bus idle */
> +		mutex_lock(&priv->mii->mdio_lock);

Can't priv->mii be NULL, if the PHY for that MAC is connected to
another MDIO bus for instance ?

Maxime


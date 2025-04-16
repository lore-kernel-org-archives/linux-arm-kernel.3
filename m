Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A020DC369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQGQgS3fn9DpLHF39v5wKc9omOFCoaDRzybsm2gWEIE=; b=07su3NlYW2kDFz3InqX16Tz4Nl
	CeWWUhWfUihfIYfj9xFKm++YbV6kL1KT/GlpsSdxXWJDJ0WdT0y+ZyESiuka6tTU6h/CeHgcOA0cf
	/HSzj4xeW72qy0/QEToZa8XDKEqG2aEb0mpt0VBzOhNWkdQh+1RVYt5BYoy6Q0LB8jewodJbwQE8O
	ubI7hEkL35oSGRVgyaPOoOkR5TSPJ1mulsKvscNsl7nfftgH2i0ztu7MosVZPI6FbgjES5mX2QYQ+
	1AL4cJVN+fkdqD4Ts+cQ5k+HpWMCUVyoutlM4+hIrTi5tcPHh1XP694ndG7EhEWilVVXcez7DO8uN
	Hz6kugvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502i-000000098Xq-1ek4;
	Wed, 16 Apr 2025 10:30:57 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yCa-00000008pxA-3rBs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:33:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05D39433EC;
	Wed, 16 Apr 2025 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744792378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQGQgS3fn9DpLHF39v5wKc9omOFCoaDRzybsm2gWEIE=;
	b=UWDn9fuGUR59UV7s0DWAYDL0GZA6lja8F9iLNR0CJm41eX4TBQgHujtyQR0dQ9lamNwbKK
	ynw+rFpw8QvOgLP1M3LsmaAyOW+wqFCNfkKm+jiiwo8yaIvcsXSQH1gEzk5+T5cMLBPCqB
	/egJWGENgZXhvhu721EkXQG3NWlIw3g5Z4nzBLcj35NcuJF/RQcuko7k6+AjY14H0w7Juj
	M9r59IYpzvkiQsahyB2sxO0hsXuO4821Y4D3oXYm4KUWzjbFxRw0LKsU0MCo7EgWbM+bbr
	uE5v0PHcjcYVzMvUPaN3fPUf2HBJbOJJ1Onc+KB/DPZiNxgYzwGymLzNd5zKkA==
Date: Wed, 16 Apr 2025 10:32:53 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/5] net: stmmac: socfpga: fix init ordering
 and cleanups
Message-ID: <20250416103253.629db3de@fedora.home>
In-Reply-To: <Z_9oVrAOnInrhb6z@shell.armlinux.org.uk>
References: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
	<20250416095343.1820272f@fedora.home>
	<Z_9oVrAOnInrhb6z@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdehledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtp
 hhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_013301_259724_E833A03B 
X-CRM114-Status: GOOD (  24.32  )
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

On Wed, 16 Apr 2025 09:20:38 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Apr 16, 2025 at 09:53:43AM +0200, Maxime Chevallier wrote:
> > I've given this a try and unfortunately :  
> 
> Great, someone with hardware, and who responds to patches! :)
> 
> > This is only to get the phymode, maybe we should do like dwmac_imx
> > and store a pointer to plat_dat into struct dwmac_socfpga, so that we
> > can get it back in dwmac_init ? I've tried with the patch below and it
> > does solve the issue, but maybe you have a better approach.  
> 
> Yes, but I don't think we need such a big patch:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 8e6d780669b9..59f90b123c5b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -50,6 +50,7 @@ struct socfpga_dwmac {
>  	u32	reg_offset;
>  	u32	reg_shift;
>  	struct	device *dev;
> +	struct plat_stmmacenet_data *plat_dat;
>  	struct regmap *sys_mgr_base_addr;
>  	struct reset_control *stmmac_rst;
>  	struct reset_control *stmmac_ocp_rst;
> @@ -233,10 +234,7 @@ static int socfpga_dwmac_parse_data(struct socfpga_dwmac *dwmac, struct device *
>  
>  static int socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
>  {
> -	struct net_device *ndev = dev_get_drvdata(dwmac->dev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -
> -	return priv->plat->mac_interface;
> +	return dwmac->plat_dat->mac_interface;
>  }
>  
>  static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
> @@ -490,6 +488,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
>  	 */
>  	dwmac->stmmac_rst = plat_dat->stmmac_rst;
>  	dwmac->ops = ops;
> +	dwmac->plat_dat = plat_dat;
>  
>  	plat_dat->bsp_priv = dwmac;
>  	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
> 

Even better indeed ! I've tested it and it works.

I'll be happy to test any followup :)

Maxime


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E08DC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 11:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgL4bb6DJsY0X2uch3UIRkw8nqLjqKutjCA1hYMMONc=; b=SPhMk30OHnaW8a0WNUV0A7lgFY
	endwO4rlM7au3an8JrP+dV00T3v3fovZVn8K9QlpkMjUCVqmP1VCaXIiXx9OECij1GVdTARzKPriY
	4x+KhzO6hpvVFKXLLaafvlzU/8S9NVg7qFMOnhRzM88bTir2lDw9lQ7bZi7eoR+EYQw7c3q5nruA+
	AlF/P+Vd3ip5719fmhN95QsScy2ZmBoHMQBCjPp44/Jzfy55/8MgZecHTUnQZmSH09hg6bJM6Reh1
	TsM1ck1dNnujx4LJiFn97g+VxeHR72F4lU61M5AmxoPB7swANzx0h4ypdPKYGas8emTv4xvPtHhO/
	KSAaqFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50pZ-00000009KS2-1xeH;
	Wed, 16 Apr 2025 11:21:25 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50nh-00000009KDD-2P9q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 11:19:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 764F01FCEA;
	Wed, 16 Apr 2025 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744802365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BgL4bb6DJsY0X2uch3UIRkw8nqLjqKutjCA1hYMMONc=;
	b=dZbTltA57yBAmrO6sMjbBeHFlyFYNPYxN4/TRtuIGmVHZK+u1R2U9qyfuF6xlEkztr6PqD
	zOe6cLPsQnmbbLR5g83MKJX1jVpoL4t3OVdqmCOsesD2OAShDo7XMmwqR2NY/AC871hOma
	v6I5OLrtiY7/csxLx/DOHJKXoVQYPSllkDW2Zb55ZUSrmqc868mga0sLQw9taA2XlwMF7J
	HdAqAYYfEH5ASaJmxMNOfa0Vw7eN3k2NveqGMVV7474U3q+31z4duXqvp9gzsDWR72a6sL
	qrM9XI2KMvTJNV1WQqtkLoz7TQjGhq5W7sKDIIdXa2498K+a1T2f02NDHNYLdw==
Date: Wed, 16 Apr 2025 13:19:23 +0200
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
Subject: Re: [PATCH net-next v2 0/5] net: stmmac: socfpga: fix init ordering
 and cleanups
Message-ID: <20250416131923.40cf0a06@fedora.home>
In-Reply-To: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
References: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtp
 hhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_041929_921277_B04DB27B 
X-CRM114-Status: GOOD (  21.24  )
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

On Wed, 16 Apr 2025 10:31:44 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> Hi,
> 
> This series fixes the init ordering of the socfpga probe function.
> The standard rule is to do all setup before publishing any device,
> and socfpga violates that. I can see no reason for this, but these
> patches have not been tested on hardware.
> 
> Address this by moving the initialisation of dwmac->stmmac_rst
> along with all the other dwmac initialisers - there's no reason
> for this to be late as plat_dat->stmmac_rst has already been
> populated.
> 
> Next, replace the call to ops->set_phy_mode() with an init function
> socfpga_dwmac_init() which will then be linked in to plat_dat->init.
> 
> Then, add this to plat_dat->init, and switch to stmmac_pltfr_pm_ops
> from the private ops. The runtime suspend/resume socfpga implementations
> are identical to the platform ones, but misses the noirq versions
> which this will add.
> 
> Before we swap the order of socfpga_dwmac_init() and
> stmmac_dvr_probe(), we need to change the way the interface is
> obtained, as that uses driver data and the struct net_device which
> haven't been initialised. Save a pointer to plat_dat in the socfpga
> private data, and use that to get the interface mode. We can then swap
> the order of the init and probe functions.
> 
> Finally, convert to devm_stmmac_pltfr_probe() by moving the call
> to ops->set_phy_mode() into an init function appropriately populating
> plat_dat->init.
> 
> v2: fix oops when calling set_phy_mode() early.
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 79 +++++-----------------
>  1 file changed, 16 insertions(+), 63 deletions(-)

Feel free to CC: me for dwmac-socfpga stuff, I have some HW to test this
on :)

Thanks for this work, it's working fine :)

For the series,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


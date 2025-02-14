Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C381C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+PKxLoAHL0OKiOb08grmk94WrSubefSKGNnWVGebmI=; b=Zzx0NP6HsqTIog
	VeRpieWzC8lTw3Zp74RFIkq9TR3QxMG+JALESFE4UXYQBN6tTo/lRCQ0lM58i55woDHO34Ml89mri
	05A7BG1mBnvYfWA68iPmbu/D7vdsNZ6vvdf4+S/y/Vj/4xR0lYCb7Snrbk8BYV8LOwEyMFLao1MRE
	qq1WqCo0Vu2vif6Xhkts7Dx0koSrpf3S5PqaVcPMGiGoPVvri81EPIULmxngRNmJitlLVO6Bupp05
	F4GhtUHjfzaSy8lyhHzjn3WAT0iyudym+4RkusD/SBVoGxMjuSXw0Tp68HunvLNxrH4oPNnxaPUd9
	yvM6IF5njOT0/ohPfxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixuy-0000000FONC-3m6K;
	Fri, 14 Feb 2025 15:47:52 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixrl-0000000FNV8-05RW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:44:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0B6E441CF;
	Fri, 14 Feb 2025 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739547868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+PKxLoAHL0OKiOb08grmk94WrSubefSKGNnWVGebmI=;
	b=OK5miJOJnRHgzhZeOv6bEJp90XE2/B044jLfMkhE/dkQX4ZWvP4dybs4/3gVcodXPthzp9
	19fHEEdO8FJynxySa03hMIZeWxpMfmWQQSV0W0ZhK6uvpGP+L8MSSnncfrhvGm7NbwSVEK
	dCm3JK9Vwht9KFnAZgp6OcLKk9yWNKE1j38rL2FibzKzcoO6wcegLzaxiyQSdkqHf3SPOX
	7xo/19sF1W2ODueTSqiWu1UFVg5KvYc1g01G+QViX8APL4+682KwCFhwTg23kJQ4+Ebbs/
	YpG3ZTP37vPoZlImaIvbeQyNu4UhDkBHCCIILZa+oQUfmx/vzzeJzSFoyk6FKw==
Date: Fri, 14 Feb 2025 16:44:22 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: parvathi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v3 04/10] net: ti: prueth: Adds link detection,
 RX and TX support.
Message-ID: <20250214164422.1bb58a89@fedora.home>
In-Reply-To: <20250214073757.1076778-5-parvathi@couthit.com>
References: <20250214054702.1073139-1-parvathi@couthit.com>
	<20250214073757.1076778-5-parvathi@couthit.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeejpdhrtghpthhtohepphgrrhhvrghthhhisegtohhuthhhihhtrdgtohhmpdhrtghpthhtohepuggrnhhishhhrghnfigrrhesthhirdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehlu
 hhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_074433_683046_825B8E7C 
X-CRM114-Status: GOOD (  17.32  )
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
Cc: nm@ti.com, vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, m-karicheri2@ti.com, basharath@couthit.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

On Fri, 14 Feb 2025 13:07:51 +0530
parvathi <parvathi@couthit.com> wrote:

> From: Roger Quadros <rogerq@ti.com>
> 
> Changes corresponding to link configuration such as speed and duplexity.
> IRQ and handler initializations are performed for packet reception.Firmware
> receives the packet from the wire and stores it into OCMC queue. Next, it
> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
> service the IRQ and packet will be processed by pushing the newly allocated
> SKB to upper layers.
> 
> When the user application want to transmit a packet, it will invoke
> sys_send() which will inturn invoke the PRUETH driver, then it will write
> the packet into OCMC queues. PRU firmware will pick up the packet and
> transmit it on to the wire.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>


> +/* update phy/port status information for firmware */
> +static void icssm_emac_update_phystatus(struct prueth_emac *emac)
> +{
> +	struct prueth *prueth = emac->prueth;
> +	u32 phy_speed, port_status = 0;
> +	enum prueth_mem region;
> +	u32 delay;
> +
> +	region = emac->dram;
> +	phy_speed = emac->speed;
> +	icssm_prueth_write_reg(prueth, region, PHY_SPEED_OFFSET, phy_speed);
> +
> +	delay = TX_CLK_DELAY_100M;
> +
> +	delay = delay << PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT;
> +
> +	if (emac->port_id) {
> +		regmap_update_bits(prueth->mii_rt,
> +				   PRUSS_MII_RT_TXCFG1,
> +				   PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_MASK,
> +				   delay);
> +	} else {
> +		regmap_update_bits(prueth->mii_rt,
> +				   PRUSS_MII_RT_TXCFG0,
> +				   PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_MASK,
> +				   delay);
> +	}
> +
> +	if (emac->link)
> +		port_status |= PORT_LINK_MASK;
> +
> +	writeb(port_status, prueth->mem[region].va + PORT_STATUS_OFFSET);
> +}
> +
>  /* called back by PHY layer if there is change in link state of hw port*/
>  static void icssm_emac_adjust_link(struct net_device *ndev)
>  {
> @@ -369,6 +426,8 @@ static void icssm_emac_adjust_link(struct net_device *ndev)
>  		emac->link = 0;
>  	}
>  
> +	icssm_emac_update_phystatus(emac);
> +

It looks to me like emac->link, emac->speed and emac->duplex are only
used in icssm_emac_update_phystatus(). If you consider either passing
these as parameters to the above function, or simply merge
icssm_emac_update_phystatus() into your adjust_link callback, you can get
rid of these 3 attributes entirely. It even looks like emac->duplex is
simply unused.

Thanks,

Maxime


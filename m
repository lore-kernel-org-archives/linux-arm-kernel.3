Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621F5CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5kr/bQI82p4aOoVx3CaPnWuXCBcZLFYX+TGL7tLi7A=; b=ayVweH4c5rcNH1Z7CrgN0ecXa5
	YRgGkktm2zK7s6C+76Lelw99RGNMOEMWYkF6E/k8d08ssXrb4IvJ+6/k4AD3NH3k+X79EK3YAXRgq
	D0jOF2IDw+1MeSJ/u7rh0EpXPp+NJVa8f4pTr9ub+D8LEeC0gZkuUPoEnOh+clKkOwtVoahON3VFX
	OLdn+EqCXwgAew8yQbI2rVhOIO83ndjHWdvV9z+XbZy+lzk4lf+vOXJNRa1QP5fHe3iTGIsXBrwV4
	JS6Bn0Y/jbDruauxxBULfAt1m46FMqEPH8jeM5RFn7+BucvZEX6VL1KR2zMbOnhaZnZZqrwSiXT8w
	HrByxkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb8J-00000003SOY-1zwV;
	Wed, 22 Oct 2025 15:52:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb8I-00000003SON-1Jl7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Oct 2025 15:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g5kr/bQI82p4aOoVx3CaPnWuXCBcZLFYX+TGL7tLi7A=; b=eq9lL+uN1rI7FyybubzSDpCpg5
	1rWDvY+bxmuLGTjn4Ez0ndbtAYHfe4d9OCnHdDlW3fnrQ+1kZ/9Q6A09wZFUsYmLRtd0NYUaUCz/w
	qt4HTAVzOJ0llFXEbZju5h3fipQtXtNXiC+bVgZ9HpyiWYsL/FzjTt/b9qfWpVIzifpAuNI/xahs/
	2/+65xp0djDW2tFVOAucV6BTOO0dbnpG33o6jb7Xd7VSACIYab4dOwpNGsUZwQbJfqkFdbrXjLiIv
	g6HWNKaoL8xrM8iO2Dx26N87/GFm9S2p0hGZ71l/rD2DdWMoqsMP0j3eYizlHVPGbRy243XdgIBFx
	rOJDl3xA==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaGZ-00000000fRZ-2L8Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:56:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4710665e7deso27915455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761148329; x=1761753129; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g5kr/bQI82p4aOoVx3CaPnWuXCBcZLFYX+TGL7tLi7A=;
        b=mmzNyxnTAH9d0QdVVZEk4T2JYLuDXnt5hLxNuGc1qBI1bfZIQnknxpKuVc230D3vPv
         CZFXelDifwVDCbCqRwdLU+mfEgp4wgWgcsKhb0t7AJeqh2csroC5MP05ZtGFbpPm6xc5
         bNuJVN85qu+XJlVrrUbd3aLCHkaOPLPN5Y/Qd5qf9lNy9MtJEnprj3qKelUk4yviUASK
         ngnsiBhLrxsHd7i1jQ/ZQ0MEhkrXd3CqKevhzMDnBNMZvDczRhdjTF3zCJqPTBBqFdUK
         Hbf5uwzzW/7QfNbENT0L1lJWH3cOqD8mNsl4yJRukb3c31y1Woqs4l37ftc2KwiIaWgH
         9oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761148329; x=1761753129;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5kr/bQI82p4aOoVx3CaPnWuXCBcZLFYX+TGL7tLi7A=;
        b=q0zpDieTB84NTSd4D92x/9Te1KbyKXzcsUGms/iSbBO0Wq9ABtA9YjZrJQsoVoPxnr
         difO1UvAuWvGs5v99SZr3stbrDlcqMvpDqwYGx+1rrEX9Zk15wbgv/LTFixmt/OhWr4H
         ZvI99zbOR94e3SkxdUd7oZq+d2FwoDjVgeuFp4fMt3AGZrKJkXbWCKlN1mbUw1SsCJzb
         cRo2Y9Y+xFHE4zzpNXcUL77yxezMXA23lQudoN1R0slekeaOyAoml6jwGoTki97NfKSI
         E38AQCFglYDWYGFl3dGrHoLozNSsAZDu5+fTWA1QCQBnkmEzJ95G0FJhg+lPqocEji54
         dauw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ3q6uGBxs7XUGrMw5AUAPrsPf83n7IMMo23Il3B1k/mcwc/f4RvoceCIWkUsMphVcPyN/IwgRiJCa+OcDyVU/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ANACnULYZCib+WBe+KdlYA5CXpfkvOp1NoQNG8jgjTtoS4Rj
	6fe4BGT7f3Pbwb2k9rNQi5bki9uSoRZpiDlyZGbEgPgBVBfLNz65+yWt
X-Gm-Gg: ASbGnctuNCNc/n8AEQxLMrjBY9uJNggFq8cdd+JoNYSAVeFPJ5iU9aFEngiGfaP/4Ew
	IXQLEcdBNCC5kXH4zGcLPG3mobz+44z/30UYBOl1MIZVWdDVBDhIuGIDBKO+113YFumagI0KIZq
	woYnYUM39hYb658UQa+iJil26eHiNXc5vW6McQtXpC47wBxtuv1m6s/yxH5UnzxiIDowgMKhfYS
	sjezy5WOtqqmLajp/VYGpP2++hF/JCL230CRFcZwrSiCm5OCjWC00st7OAGgrlTj3CEld98HJF/
	bpa3BvR51yMCIcDtgt8cVcWD8ItKByF4Zsn+szM7y7SVo+KyycKiqmxA6/AnGsRVMuIsHlLATG4
	JKMcQn1Ut7SZ53Ahb+MAMl1YNTNohCLENtzFSnGRJ/I46KeguNIBypzlRzEloEJcFtHaSt3+6/S
	it97iTlHRNkBZ/WLXBLQ4g7LFk1MIudXseBtIhuC8JH2DU1DCvBw==
X-Google-Smtp-Source: AGHT+IF2VkMFb1grUIsz9Ob5/VnZ+J8LZJM9Q4gOUJAoOT2z3iABDCrdKLQP3lhX3uW6IN4Sf6xW5Q==
X-Received: by 2002:a05:600c:8b0d:b0:46e:39e1:fc27 with SMTP id 5b1f17b1804b1-4711787442amr156532835e9.5.1761148329287;
        Wed, 22 Oct 2025 08:52:09 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a96asm26175138f8f.31.2025.10.22.08.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:52:08 -0700 (PDT)
Message-ID: <68f8fda8.5d0a0220.3519eb.41e3@mx.google.com>
X-Google-Original-Message-ID: <aPj9phaGLkU3JMm3@Ansuel-XPS.>
Date: Wed, 22 Oct 2025 17:52:06 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH 2/2] net: airoha: add phylink support for GDM1
References: <20251021193315.2192359-1-ansuelsmth@gmail.com>
 <20251021193315.2192359-3-ansuelsmth@gmail.com>
 <2a9e1ecc-2f33-432b-bf77-e08ce7ccd0ce@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a9e1ecc-2f33-432b-bf77-e08ce7ccd0ce@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_155643_729389_7D3D8DFC 
X-CRM114-Status: GOOD (  31.49  )
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

On Wed, Oct 22, 2025 at 09:42:11AM +0200, Maxime Chevallier wrote:
> Hi Christian,
> 
> On 21/10/2025 21:33, Christian Marangi wrote:
> > In preparation for support of GDM2+ port, fill in phylink OPs for GDM1
> > that is an INTERNAL port for the Embedded Switch.
> > 
> > Rework the GDM init logic by first preparing the struct with all the
> > required info and creating the phylink interface and only after the
> > parsing register the related netdev.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 108 ++++++++++++++++++++---
> >  drivers/net/ethernet/airoha/airoha_eth.h |   3 +
> >  2 files changed, 99 insertions(+), 12 deletions(-)
> 
> You also need to select PHYLINK in Kconfig
> 
> > 
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> > index ce6d13b10e27..fc237775a998 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1613,6 +1613,8 @@ static int airoha_dev_open(struct net_device *dev)
> >  	struct airoha_gdm_port *port = netdev_priv(dev);
> >  	struct airoha_qdma *qdma = port->qdma;
> >  
> > +	phylink_start(port->phylink);
> > +
> >  	netif_tx_start_all_queues(dev);
> >  	err = airoha_set_vip_for_gdm_port(port, true);
> >  	if (err)
> > @@ -1665,6 +1667,8 @@ static int airoha_dev_stop(struct net_device *dev)
> >  		}
> >  	}
> >  
> > +	phylink_stop(port->phylink);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2813,6 +2817,17 @@ static const struct ethtool_ops airoha_ethtool_ops = {
> >  	.get_link		= ethtool_op_get_link,
> >  };
> >  
> > +static struct phylink_pcs *airoha_phylink_mac_select_pcs(struct phylink_config *config,
> > +							 phy_interface_t interface)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
> > +			      const struct phylink_link_state *state)
> > +{
> > +}
> > +
> >  static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
> >  {
> >  	int i;
> > @@ -2857,6 +2872,55 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
> >  	return false;
> >  }
> >  
> > +static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
> > +			       unsigned int mode, phy_interface_t interface,
> > +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> > +{
> > +}
> > +
> > +static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
> > +				 phy_interface_t interface)
> > +{
> > +}
> > +
> > +static const struct phylink_mac_ops airoha_phylink_ops = {
> > +	.mac_select_pcs = airoha_phylink_mac_select_pcs,
> > +	.mac_config = airoha_mac_config,
> > +	.mac_link_up = airoha_mac_link_up,
> > +	.mac_link_down = airoha_mac_link_down,
> > +};
> > +
> > +static int airoha_setup_phylink(struct net_device *netdev)
> > +{
> > +	struct airoha_gdm_port *port = netdev_priv(netdev);
> > +	struct device *dev = &netdev->dev;
> > +	phy_interface_t phy_mode;
> > +	struct phylink *phylink;
> > +
> > +	phy_mode = device_get_phy_mode(dev);
> > +	if (phy_mode < 0) {
> > +		dev_err(dev, "incorrect phy-mode\n");
> > +		return phy_mode;
> > +	}
> > +
> > +	port->phylink_config.dev = dev;
> > +	port->phylink_config.type = PHYLINK_NETDEV;
> > +	port->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +						MAC_10000FD;
> > +
> > +	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> > +		  port->phylink_config.supported_interfaces);
> > +
> > +	phylink = phylink_create(&port->phylink_config, dev_fwnode(dev),
> > +				 phy_mode, &airoha_phylink_ops);
> > +	if (IS_ERR(phylink))
> > +		return PTR_ERR(phylink);
> > +
> > +	port->phylink = phylink;
> > +
> > +	return 0;
> > +}
> > +
> >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  				 struct device_node *np, int index)
> >  {
> > @@ -2931,19 +2995,30 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> >  	port->id = id;
> >  	eth->ports[p] = port;
> >  
> > -	err = airoha_metadata_dst_alloc(port);
> > -	if (err)
> > -		return err;
> > +	return airoha_metadata_dst_alloc(port);
> > +}
> >  
> > -	err = register_netdev(dev);
> > -	if (err)
> > -		goto free_metadata_dst;
> > +static int airoha_register_gdm_ports(struct airoha_eth *eth)
> > +{
> > +	int i;
> >  
> > -	return 0;
> > +	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
> > +		struct airoha_gdm_port *port = eth->ports[i];
> > +		int err;
> >  
> > -free_metadata_dst:
> > -	airoha_metadata_dst_free(port);
> > -	return err;
> > +		if (!port)
> > +			continue;
> > +
> > +		err = airoha_setup_phylink(port->dev);
> > +		if (err)
> > +			return err;
> > +
> > +		err = register_netdev(port->dev);
> > +		if (err)
> > +			return err;
> 
> The cleanup for that path seems to only be done if
> 
>   port->dev->reg_state == NETREG_REGISTERED
> 
> So if netdev registration fails here, you'll never destroy
> the phylink instance :(
> 

Oh ok I was with the (wrong) assumption that register_netdev always set
the state to REGISTERED but checking the actual function it's totally
not the case.

Wonder if there is a better method to check it but I guess making the
requested changed from Lorenzo should indirectly handle this BUG.

> 
> 

-- 
	Ansuel


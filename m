Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05649CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsPngKrFqfEFSGok7TSQm60g/euZJ7JcyyRZuGnNgBg=; b=Wd+uw2334XhkCrXFfAiHKMPElr
	HRMbfEfGn7c40L/BdmqpkJl91w9DtbuFAnyOZ+4eO1DMwacbENUSQmfh1nUoPH4fjBb32FV0/Jd3k
	nHTzH7+c/RbxuPGsZgXSIvhydvI/UbwW6xUBedUvkaAX3SbZzs8nEcJaePjYiLcFC5jhqGCH4xMF1
	ai2+lKPnPf3JIaup/BX5m+9ebRIiqKyPVojQypdLI/vNb0gm9PfeyxOFAu/jKed+bXhsLTrUgL+28
	4uo0pES5wwYHKYdXMpJQ6/p3cjwpJpC7gU1urH0lquj/lzJSQPoJvJmpaws6arEieIaJ0sE03TtWO
	yqtxkSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPzs-00000003zzX-1ELM;
	Thu, 30 Oct 2025 10:35:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPzo-00000003zyL-2jeS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:35:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so883964f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761820507; x=1762425307; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsPngKrFqfEFSGok7TSQm60g/euZJ7JcyyRZuGnNgBg=;
        b=eLqfI6/NejaTxmSkjks4JpqHE0xayZ+6GEWyG5OXmUEghiMnEqv/9uyzXLBX4is/ZU
         yTKxyCWdGLxlKV8t0h2ykyDQzcwkNAGSWOBAoqBh2021MPDfqXwcC1AylaxdOSCO0H79
         EMgoiqkC4u75r/lOZFHxOH1gMKmsrukQF9eC1H3fx4SaRy80mzW8Xtl+VybvXyiCOREF
         KkfFZ+vrP/R+4qjmWYE6/j12Jia0BlczBy7Xyq5fQrN4JdmdCbrx9w6WrRZlxSmQNef4
         icSV0VzvZrPP80TM0GUpIdo/bmOIV5uev7hmgrZHe/ax5PKlbpX4Rt2eV0pvARAKkdPJ
         9LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761820507; x=1762425307;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsPngKrFqfEFSGok7TSQm60g/euZJ7JcyyRZuGnNgBg=;
        b=pV2vrTo4lzk6DefiSXe2gAHcbmp79Dm0adTt+sPW5di46aOaI7R7aRX4XoaudXxhuv
         kT3FxfFcX5jcNR8W16RLfZXHwxdVg29WwTWe5rRZKfC1O3BDhyTl+0pVlw+sgNIQZzl7
         pgvYpv2H60e4vt1DgWNXlBfmulcYc30QjLBmt6me9rs8+dZXWQZYLbsBgDSP0OwmCWJP
         gIG8A7R/lQJ+C57O0mXs180k4it0CFOph602taQth0lCcbjED4Z1/trBQ8QEJrv1IrSY
         na1dAKyGBqtA3MZ4NYsAZWXYGRZEZJMh+dSRqBE1UuFV+/IkfqHpsCviOYo41Of0R2Nx
         GLYw==
X-Forwarded-Encrypted: i=1; AJvYcCVa5PEFM2tOHElCUxozF39apEmC+woM2M8hz1+3lrg0uIHcnnue8ZJ2WNHi22PYwjlBlJq1rtxWcF6CAwCinZgS@lists.infradead.org
X-Gm-Message-State: AOJu0YwINAcaNqzQhMIcWfh5ZdSY1nV08Bog3dEIs5bpEmNbSUCi5R6F
	Efbrtd15y2d2pmqSu02YwTz6hv23/PsXBQ4i6vqeEN+xSKGijygAaL5b
X-Gm-Gg: ASbGncvDEMa6L82DR5Cd/Em9bc+bAi9UW+RjiQVfQJYZ4I6rHnzZJoRn7+1v6R42ltX
	SGQhmy7YYC5C4I0HSdofMMlIkllppyNE/HvZAti2pKA6e9kszGpvdaFPEjVFgDPRU6dxaC1Pp4x
	dvqjRSjY9WQpHY6ei8lIjNLV3rAjwuiA/m/6PBBvdHbGO5t310lqZYv2FhxgspjsBEIzeRXsCVg
	IfUpY7ATp96z42jyQfPBSZJ8bNnq0zonwIKNKPZFtalZlfmqSJIL3XVWz6uyMunaKr5WPIww3QL
	nAerpjWpJ59zeXi1blvpxZR+TYtSDlQemYpRcf3hBBnI5snlKzkguBP0zNq+lhWxgbE9GribtSK
	wjRXMDdLUC71CRRix1fFeg2C71WbDHrPdvi2zaHPUIIJK7KN1TSLL6DE5Ih1tWZlsZzHMtftbBQ
	4ZVIvOQaI5KlqDU+htTTWuiZkB5f9X
X-Google-Smtp-Source: AGHT+IESaUzzzN97jkFB4AyHPl8jIeK4DpYfr+xMeimLxz4XvTZuV9U4wyHB6rScPa52l5uDwp+EVw==
X-Received: by 2002:a05:6000:2c05:b0:428:3e7f:88c3 with SMTP id ffacd0b85a97d-429b4c9ee77mr2317234f8f.50.1761820506460;
        Thu, 30 Oct 2025 03:35:06 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d4494sm31832354f8f.21.2025.10.30.03.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 03:35:06 -0700 (PDT)
Message-ID: <69033f5a.df0a0220.25fede.548f@mx.google.com>
X-Google-Original-Message-ID: <aQM_WCsuEDykB4e1@Ansuel-XPS.>
Date: Thu, 30 Oct 2025 11:35:04 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v2 2/2] net: airoha: add phylink support for GDM1
References: <20251023145850.28459-1-ansuelsmth@gmail.com>
 <20251023145850.28459-3-ansuelsmth@gmail.com>
 <aP00w4CQdeX9GIJA@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP00w4CQdeX9GIJA@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_033508_724134_FC3DE0BA 
X-CRM114-Status: GOOD (  37.47  )
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

On Sat, Oct 25, 2025 at 09:36:19PM +0100, Russell King (Oracle) wrote:
> On Thu, Oct 23, 2025 at 04:58:49PM +0200, Christian Marangi wrote:
> > In preparation for support of GDM2+ port, fill in phylink OPs for GDM1
> > that is an INTERNAL port for the Embedded Switch.
> > 
> > Add all the phylink start/stop and fill in the MAC capabilities and the
> > internal interface as the supported interface.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/ethernet/airoha/Kconfig      |  1 +
> >  drivers/net/ethernet/airoha/airoha_eth.c | 77 +++++++++++++++++++++++-
> >  drivers/net/ethernet/airoha/airoha_eth.h |  3 +
> >  3 files changed, 80 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
> > index ad3ce501e7a5..3c74438bc8a0 100644
> > --- a/drivers/net/ethernet/airoha/Kconfig
> > +++ b/drivers/net/ethernet/airoha/Kconfig
> > @@ -2,6 +2,7 @@
> >  config NET_VENDOR_AIROHA
> >  	bool "Airoha devices"
> >  	depends on ARCH_AIROHA || COMPILE_TEST
> > +	select PHYLIB
> 
> This looks wrong if you're using phylink.
> 
> >  	help
> >  	  If you have a Airoha SoC with ethernet, say Y.
> >  
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> > index ce6d13b10e27..deba909104bb 100644
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
> 
> phylink_start() _can_ bring the carrier up immediately. Is the netdev
> ready to start operating at the point phylink_start() has been called?
> This error handling suggests the answer is "no", and the lack of
> phylink_stop() in the error path is also a red flag.
>

So I guess the correct way is to move start at the very end of dev_open.

> > @@ -1665,6 +1667,8 @@ static int airoha_dev_stop(struct net_device *dev)
> >  		}
> >  	}
> >  
> > +	phylink_stop(port->phylink);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -2813,6 +2817,18 @@ static const struct ethtool_ops airoha_ethtool_ops = {
> >  	.get_link		= ethtool_op_get_link,
> >  };
> >  
> > +static struct phylink_pcs *airoha_phylink_mac_select_pcs(struct phylink_config *config,
> > +			phy_interface_t interface)
> 
> I'd write this as:
> 
> static struct phylink_pcs *
> airoha_phylink_mac_select_pcs(struct phylink_config *config,
> 			      phy_interface_t interface)
> 
> but:
> 
> > +{
> > +	return NULL;
> > +}
> 
> Not sure what the point of this is, as this will be the effect if
> this function is not provided.
> 

Sorry I was confused with the other OPs that are mandatory or a kernel
panic is triggered if not defined. (for example the MAC config)

> > +
> > +static void airoha_mac_config(struct phylink_config *config,
> > +			      unsigned int mode,
> > +			      const struct phylink_link_state *state)
> > +{
> > +}
> > +
> >  static int airoha_metadata_dst_alloc(struct airoha_gdm_port *port)
> >  {
> >  	int i;
> > @@ -2857,6 +2873,57 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *eth,
> >  	return false;
> >  }
> >  
> > +static void airoha_mac_link_up(struct phylink_config *config,
> > +			       struct phy_device *phy, unsigned int mode,
> > +			       phy_interface_t interface, int speed,
> > +			       int duplex, bool tx_pause, bool rx_pause)
> > +{
> > +}
> > +
> > +static void airoha_mac_link_down(struct phylink_config *config,
> > +				 unsigned int mode, phy_interface_t interface)
> > +{
> > +}
> > +
> > +static const struct phylink_mac_ops airoha_phylink_ops = {
> > +	.mac_select_pcs = airoha_phylink_mac_select_pcs,
> > +	.mac_config = airoha_mac_config,
> > +	.mac_link_up = airoha_mac_link_up,
> > +	.mac_link_down = airoha_mac_link_down,
> > +};
> 
> All the called methods are entirely empty, meaning that anything that
> phylink reports may not reflect what is going on with the device.
> 
> Is there a plan to implement these methods?
> 

Yes. For the internal port there isn't much to configure but when the
PCS for the other GDM port will be implemented, those will be filled in.
This is really to implement the generic part and prevent having a
massive series later (as it will be already quite big and if not more
than 10-12 patch)

Hope it's understandable why all these empty functions.

-- 
	Ansuel


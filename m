Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F25CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWO4yOCaMUYjGeCQQA0uyhzhbdrG4m6pu8cUif/JpM0=; b=GEqCn8f9xd83/ts5vK5ti/poZz
	ws/UgabMEfXRB5VTu6sZRXuvPe/B0ZCltYiFivQ3680xuI1l8WOKbAqJJpHqVxLJ50EP5Y1onOsA9
	ubGtNRu2445jKx8z7borxCXHcUrVl1NkBmCi0hPxTEc5o6M6g7ztutJa70FbZNM/hUJYoiSZUBSqV
	CKci7d6z6oJf/ILHfhdwhi0SaU4rGJELL2zv3j0GAF/VVpFcCt13h6ZHEOW6wFvFt3WBqUroA0JjP
	7ETzKqBDaqfQY8kC/Rv3PT+BrDhPMdvVclyZvG2z7KY4q6NMSiXI4yYrCIKG2EYTNP8Z6a1Atyypf
	AUAGMZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb4r-00000003Rsh-0uMM;
	Wed, 22 Oct 2025 15:48:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBb4p-00000003Rrt-01cF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:48:40 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4283be7df63so2234629f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761148117; x=1761752917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XWO4yOCaMUYjGeCQQA0uyhzhbdrG4m6pu8cUif/JpM0=;
        b=lC2zIz+FmDnlBryjxudxniKGjYVMnY94fu0cXGJ+yRxm++vE2FJJA8KP42+ijipsRm
         uA1/gdbCqA17wfihyTJhH01WVwCvWtrbWevuuhhSsLBBzIlPb+kfBSk01HQIFzaV5Ylk
         j0enlYXWV6yjvMeYy0Vtss1/TNhZw4+dfEUHvx892YtHMD969/oxSByz7wi4q/5Pa2tC
         BRM4D8cvPDwYLyDQXAmyc/tWTn44XLODpNb7VJU2c1NPXxgitu9Gcr/r2w7u7ZtdcwFw
         gyeeBWRpbQRtfN0hYRKrn/6TljVg7A1iTCXj8rwYCYMJcTj1rz03DVaIkLtqV1Iz/F/h
         4veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761148117; x=1761752917;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWO4yOCaMUYjGeCQQA0uyhzhbdrG4m6pu8cUif/JpM0=;
        b=IGNIfJ2DoZp96CJ0mu2+93lXgxV5pBnq9gCHamOSvPRiF9FOiIjpNEXrSt6AGqrOGT
         jwzmAaRLEvr8TZUtMYeNTOpXeF6UF+KrpRi1BFhVta/LUs51Gv/UHT0Tw7P49BOTcdVA
         PDQ4x7A5q5w3+Pk7bgShCKwOaDSvgfzz8YYbf3kzJlXJM6sxxnc3v5m2YroTejLytUR5
         yngLTKm87hzXfA6vx1N9pd4Xqck1dcZN/VlYhghbGBow3PFED8gBpwewsvNJDmdoJ+fH
         8+8lSay+Ip5RMQM6gETz99rVCqAJNWerU2dw0k+q8FZi31TTWIAiOIr57cBY6ZxrrDnv
         zYlg==
X-Forwarded-Encrypted: i=1; AJvYcCXFVbcdsgfJaOiHQ01Cg3bFnYyWTJTxT3Tz/NAb/aP3EERowZ4C5K+ARGZ6bYempDKBgf7nfuyh79WjfGgqeRXP@lists.infradead.org
X-Gm-Message-State: AOJu0YyHXJOyQ/UZsEvr4cDJuLxh88wdvDGFGpvhl9c/0E9VW4olKKIk
	FOynTUbvHSfJ2ZRObBqMCngMbcyzD6+CtMoN95wkc05lXc4e5H/IWFStnOkujQ==
X-Gm-Gg: ASbGncuCWqEvieDI9WJhN/usVyZp9dIU9vx+3Q/z3c5v8w7fNX4OF+kjAVDP+zk9YDB
	fcyymMfFVkS9D5tY+06l7O05XNJAYhC/lTqvuXLNVolakxYMHOgLt5dLHpjuRM2XLjm5Cmtn4Re
	9/+4WgpfTslL83cteO1Qg3QjqWl5UgsRJjkYQZZkbFD8Ff/T7CpaF1AP24XyGZ8M/ctM1NbVw9n
	GYWIY2Z93tw8ED+TSz1DASbe/bJ2B00DR7SVLqpwcUgGBHgARuiMWPFLNtfBM3MUn/niANQalYg
	57pyonnN0g7mIF3ZNDiKslQet3c3VpKVLCs8TyF8vLAVrczudHxZATvrQDREjtLkhzrnTrDtWze
	wEc6n/UZWLVQc9FpT80927zN0AEamEsIl875XfkP4paucKgNMa8r85E5KCrV7YyvF7/vXaIM+eV
	AGMJJRnET6NuLlD/iAwTj5aTDerqVhynT+NGDqhM0=
X-Google-Smtp-Source: AGHT+IHAoVbOJakh16O5eBX5PTSAHI2xQcrVoDpyDPxM5ZW2+gUYAv5HKBvRB8LcVZCJLd8co8c93A==
X-Received: by 2002:a5d:5d01:0:b0:428:55c3:cecc with SMTP id ffacd0b85a97d-42855c3d3femr1634009f8f.37.1761148116971;
        Wed, 22 Oct 2025 08:48:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm25309390f8f.36.2025.10.22.08.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:48:36 -0700 (PDT)
Message-ID: <68f8fcd4.df0a0220.60f68.1bc1@mx.google.com>
X-Google-Original-Message-ID: <aPj80atNusRChjjG@Ansuel-XPS.>
Date: Wed, 22 Oct 2025 17:48:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Simon Horman <horms@kernel.org>
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
 <aPj8J5ntvDGLPYaY@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPj8J5ntvDGLPYaY@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_084839_079674_B69D6960 
X-CRM114-Status: GOOD (  21.92  )
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

On Wed, Oct 22, 2025 at 04:45:43PM +0100, Simon Horman wrote:
> On Tue, Oct 21, 2025 at 09:33:12PM +0200, Christian Marangi wrote:
> 
> ...
> 
> > +static int airoha_setup_phylink(struct net_device *netdev)
> > +{
> > +	struct airoha_gdm_port *port = netdev_priv(netdev);
> > +	struct device *dev = &netdev->dev;
> > +	phy_interface_t phy_mode;
> 
> Hi Christian,
> 
> phy_interface_t is an enum and thus may in practice be unsigned...
> 
> > +	struct phylink *phylink;
> > +
> > +	phy_mode = device_get_phy_mode(dev);
> > +	if (phy_mode < 0) {
> 
> ... if so, this condition will always be false.
> 
> I suspect the correct approach here is to change the type of phy_mode to int.
> 
> Flagged by Smatch.
>

Thanks a lot for pointing this out. Also I'm a bit confused of why
device_get_phy_mode changed the args deviated from the of variant that
return int and required an additional arg for the interface...

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
> 
> ...
> 
> -- 
> pw-bot: cr

-- 
	Ansuel


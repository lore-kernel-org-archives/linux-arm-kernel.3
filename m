Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE4210BA45E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA6nvks9NWJbMOMt4vmE7FGkCZkjbgQYrDEeUucHc6A=; b=Gkm7FEo6w+AOE4uNciEvENYHJ/
	WS51foGbtB3m92AkpL484QOb4wx1lFTnCtbUd1Yfk4VYY/3dWxTOGZDmuEMBAcMxh2jBuiAXSqJQA
	GTY0HzUSlfW5/nnt/y9rvzwYz6/PAPSybklmFTpZkLYab1FMAuObZbvAt9k6LSVG/7/vKYtYFFIEA
	PLXUd8yUzflbP6bVSVGz3P84kHAH3OzHxiRxMI3ARVSmhv5+jtF4AGztMCZCC5PfrX7oTdYMQtMM+
	E62/ohrbSLTihlhWoqGt7sOGoQgYuWGOm3VIsVFC4ToF8cLNtRCFXnjNXdjNVHWm3E89vebdki3Ga
	+vsNp6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Pi-000000073w6-28Cs;
	Fri, 27 Mar 2026 09:23:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Ph-000000073vz-25RW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:23:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EDDD60133;
	Fri, 27 Mar 2026 09:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C0EC19423;
	Fri, 27 Mar 2026 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774603412;
	bh=UUG2DpyL+eUgewSKD3Yd9/PcZ1TPr1oUxFvTW/dSkKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkxF6S0BiL0pUMCoaFi5uLzUqKys1/B/6mt3ukZHPLBa5qEd7hdlLFCxl+Gl75d4a
	 Q6SmC/Vi4JBGKgSYfu/rgGMW0d+oawHZ0jiCn1gdZ1F365s5z4nko5D6qYe4S3Iwcd
	 IQxsqx4hhrYj/h/eYjDeRpi4tWnh01zkzqLoOfbJm3xT0hgNoY/ld1VKopZv9ZdgSz
	 f0ieMUCtFrO2RgZ7tA2E+VSm16BxnaOdxlHNuyR4YWVKbr9pxd6bHP8fNq0b24No7N
	 siyHOR6Zpd82Q1sWqO6bVxxMganoTMAAzr0OA75MU3GkWqiZ2lSeUxD5XnXAj4W8W8
	 sEdoTraxOBzKg==
Date: Fri, 27 Mar 2026 09:23:27 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 03/15] net: stmmac: qcom-ethqos: eliminate
 configure_func
Message-ID: <20260327092327.GA111839@horms.kernel.org>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
 <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
 <20260326180453.GU111839@horms.kernel.org>
 <acV29ruRVy_fcwDq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acV29ruRVy_fcwDq@shell.armlinux.org.uk>
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

On Thu, Mar 26, 2026 at 06:12:06PM +0000, Russell King (Oracle) wrote:
> On Thu, Mar 26, 2026 at 06:04:53PM +0000, Simon Horman wrote:
> > On Tue, Mar 24, 2026 at 01:11:44PM +0000, Russell King (Oracle) wrote:
> > > Since ethqos_fix_mac_speed() is called via a function pointer, and only
> > > indirects via the configure_func function pointer, eliminate this
> > > unnecessary indirection.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > ...
> > 
> > > @@ -623,14 +627,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
> > >  	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
> > >  }
> > >  
> > > -static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
> > > -				 int speed, unsigned int mode)
> > > -{
> > > -	struct qcom_ethqos *ethqos = priv;
> > > -
> > > -	ethqos->configure_func(ethqos, interface, speed);
> > > -}
> > > -
> > >  static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
> > >  {
> > >  	struct qcom_ethqos *ethqos = priv;
> > 
> > Hi Russell,
> > 
> > FYI, AI generated review reports that the comment in ethqos_clks_config()
> > that references ethqos_fix_mac_speed() should also be updated.
> 
> Also already noted (yesterday).
> 
> I do keep an eye on patchwork for my own patches - I have a firefox tab
> permanently open for my patches in patchwork:
> 
> https://patchwork.kernel.org/project/netdevbpf/list/?submitter=165511
> 
> Thanks anyway.

Thanks, and sorry if you told me this before.
I'll try to remember and not spam you with these things going forward.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA60C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQrfsYhsYua4DH51G0fhYUy6NE385/Le3rsntLIKy6c=; b=bAfTCkbxNxNcQoZaZkS/cQVJFx
	xRpGohWOa/rpV9ZTM88OnEfDO3TZrNptJsvQDy9jxkgLM+qol/Ok2oP5uK4JM4cA3oS+ZRRUbxksK
	6j5fAZuB6sTs/kFjvW+u00z0AmyPPE9UYsXPdw5wbPhfVQB1Ck/4XgSTVsj1nhyUgR7kj5oVqmnsK
	9/qayu0mHvnx8l5pmrcAexq2S7+YI0udArcuUk6GtUgd0ytLCEfy+3EJJOzydUDi0aCbANvl0FFx4
	gQnzqGZurzdbabNADM7BCYcn877Wt7RXiQXMLMsd+PP3Z/ld+LkHF/BhfRLxEbUqL2IBLLWJ+Tr4Y
	fnoEsvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0ZR-0000000H2rw-2exW;
	Thu, 20 Feb 2025 07:02:05 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0Xv-0000000H2Pn-49sC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 07:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740034830; x=1771570830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AjVnpHD2v2Yt6Kmq2yAOC5tiCK3gGmXJmt/gK2edgdI=;
  b=e9HjhRzXlNtRMU0U5PwDvr6ID3LeGov+tncWP0nUqksfwDTiMz3xOZCc
   0HhgG2SLboVkHr3xhks/boPyaqsRcYfKPEKcF9fdLVv/DKQanXAqwRcEM
   nossX5Y2ZLBBWaAVqdzi79tVBQBrtelsYbAAFPjtyDync/K4lmK6oIkdp
   2e+28aLOGtED+T8bxZ4pU8IUjTclXaEvZCHHix8wXaEabZN4xhS6/TYqJ
   MStmot4GjPxoLbfnpvKA+v3bJBpoz+3RxliYEbST30qHaYshJZZmtEOaA
   +VSISszjcvz/c1d6dXXdlE27g1v5GuzOEpWGIn9uPzruMii9NxsF/GzD8
   Q==;
X-CSE-ConnectionGUID: cdnY5VCiQ56pEoFKusDZsA==
X-CSE-MsgGUID: vNEvl76UTkivv3xsxxdgMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44450195"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="44450195"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 23:00:29 -0800
X-CSE-ConnectionGUID: kc2+8xHwQka5NTUIeHSFww==
X-CSE-MsgGUID: vC2LJc8pRmePBXEk75jnrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119041836"
Received: from mev-dev.igk.intel.com ([10.237.112.144])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 23:00:27 -0800
Date: Thu, 20 Feb 2025 07:56:46 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Russell King <linux@armlinux.org.uk>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Praneeth Bajjuri <praneeth@ti.com>, Andrew Lunn <andrew@lunn.ch>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: axienet: Set mac_managed_pm
Message-ID: <Z7bSLq1vkYJUzvGM@mev-dev.igk.intel.com>
References: <20250217055843.19799-1-nick.hu@sifive.com>
 <889918c4-51ae-4216-9374-510e4cbdc3f1@intel.com>
 <CAKddAkBZWZqY+-TERah+Q+WUfkqzcpFMA=ySSuTxxBjfP7tKZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKddAkBZWZqY+-TERah+Q+WUfkqzcpFMA=ySSuTxxBjfP7tKZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_230032_074417_A7773262 
X-CRM114-Status: GOOD (  23.56  )
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

On Thu, Feb 20, 2025 at 10:47:40AM +0800, Nick Hu wrote:
> Hi Jacob
> 
> On Thu, Feb 20, 2025 at 7:29 AM Jacob Keller <jacob.e.keller@intel.com> wrote:
> >
> >
> >
> > On 2/16/2025 9:58 PM, Nick Hu wrote:
> > Nit: subject should include the "net" prefix since this is clearly a bug
> > fix.
> >
> I've added the 'net' prefix to the subject 'net: axienet: Set
> mac_managed_pm'. Is there something I'm missing?
> 

It should be [PATCH net] net: axienet: Set mac_managed_pm
Like here for example [1]. You can look at netdev FAQ [2]. It is
described there how to specify the subject.

Probably you don't need to resend it only because of that.

[1] https://lore.kernel.org/netdev/CAL+tcoC3TuZPTwnHTDvXC+JPoJbgW2UywZ2=xv=E=utokb3pCQ@mail.gmail.com/T/#m2b5603fbf355216ab035aa0f69c10c5f4ba98772
[2] https://www.kernel.org/doc/Documentation/networking/netdev-FAQ.txt

Thanks,
Michal

> > > The external PHY will undergo a soft reset twice during the resume process
> > > when it wake up from suspend. The first reset occurs when the axienet
> > > driver calls phylink_of_phy_connect(), and the second occurs when
> > > mdio_bus_phy_resume() invokes phy_init_hw(). The second soft reset of the
> > > external PHY does not reinitialize the internal PHY, which causes issues
> > > with the internal PHY, resulting in the PHY link being down. To prevent
> > > this, setting the mac_managed_pm flag skips the mdio_bus_phy_resume()
> > > function.
> > >
> > > Fixes: a129b41fe0a8 ("Revert "net: phy: dp83867: perform soft reset and retain established link"")
> > > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > > ---
> >
> > Otherwise, the fix seems correct to me.
> >
> > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> >
> > >  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > > index 2ffaad0b0477..2deeb982bf6b 100644
> > > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > > @@ -3078,6 +3078,7 @@ static int axienet_probe(struct platform_device *pdev)
> > >
> > >       lp->phylink_config.dev = &ndev->dev;
> > >       lp->phylink_config.type = PHYLINK_NETDEV;
> > > +     lp->phylink_config.mac_managed_pm = true;
> > >       lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
> > >               MAC_10FD | MAC_100FD | MAC_1000FD;
> > >
> >
> 
> Regards,
> Nick


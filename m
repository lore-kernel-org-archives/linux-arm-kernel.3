Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBBDC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha1L+JSDqQv8B+82Y2MC2nDI3xCTQBY+yLysouv2OK0=; b=t8HGY0HrghuHaAJxEIh0Rwp4vc
	+fiZld56l74nIUHq5/VTNx5ENRRPZJeqCzH3Hk71v1X/DUyAlSE3Q4ZZC6z7xEa9Vw9GTBQ9MhD48
	n/3xNUWBPrZLbC0q7SxzgnWQ8BMuK2GvvpEg1UX743Hv6a44IH3owGm1kZ+IChqPBCYUTR4vKI523
	zpGgrRLjEFgUJWvH0M4IPAhvTZPl25A/BYeOezCtQ/m4Dnq8vXjcBwaYnv9nl0GKTFI7OS11E9qaG
	6oHdFUbjXrjReBu4fyFxQFpOGqoxYJXCxB0ENlVWh8MN3qrks9+4msBag2ztk4sJpdp16DR7RjSd+
	CD93CtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7pd-00000001Og9-2XId;
	Thu, 20 Feb 2025 14:47:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7eO-00000001LS6-28gC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ha1L+JSDqQv8B+82Y2MC2nDI3xCTQBY+yLysouv2OK0=; b=4IzDVfOPmSVlGIsLL+yrvsv89i
	bVNU4TLuoAbSiyGAk/j16COvtDV0EWp5K3ncGaZk/VHlCJIjZV51x+Bd5esZ5o6kYYUiJPNW9/Zfh
	cJz4zQCcBD9PrasMLVFdvdU4KAIWSk2EsRGNGesOofRBMFL5EqyCMouDvh8yV4iI0E5U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tl7eA-00FzMD-B4; Thu, 20 Feb 2025 15:35:26 +0100
Date: Thu, 20 Feb 2025 15:35:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Sean Anderson <sean.anderson@linux.dev>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Message-ID: <ebf49977-fba7-4848-9a07-c187cabe6b17@lunn.ch>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
 <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
 <9d26a588-d9ac-43c5-bedc-22cb1f0923dd@lunn.ch>
 <72ded972-cd16-4124-84af-8d8ddad049f0@linux.dev>
 <ZzyzhCVBgXtQ_Aop@shell.armlinux.org.uk>
 <BL3PR12MB6571FE73FA8D5AAB9FB4BB3CC9C42@BL3PR12MB6571.namprd12.prod.outlook.com>
 <Z7cVlwPDtJ2fdTbY@shell.armlinux.org.uk>
 <BL3PR12MB6571DD63F0AEE29BF2CDFC00C9C42@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR12MB6571DD63F0AEE29BF2CDFC00C9C42@BL3PR12MB6571.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_063540_546198_F1A85C7D 
X-CRM114-Status: GOOD (  18.95  )
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

> > Okay, so it's a synthesis option, where that may be one of:
> >
> > 1. SGMII/1000base-X only
> > 2. 2500base-X only
> > 3. dynamically switching between (1) and (2).
> >
> > > We'll use MAC ability register to detect if MAC is configured for
> > > 2.5G. Will it be fine to advertise both 1G and 2.5G in that case?
> >
> > Please document in a comment that the above are synthesis options, and that
> > dynamically changing between them is possible but not implemented by the driver.
> > Note that should anyone use axienet for SFP modules, then (1) is essentially the
> > base functionality, (2) is very limiting, and (3) would be best.
> >
> > Not only will one want to limit the MAC capabilities, but also the supported interface
> > modes. As it's been so long since the patch was posted, I don't remember whether it
> > did that or not.
> >
> 
> Sure, will document in the comment and limit both mac capabilities and supported interfaces accordingly.
> Thank you for your quick response and guidance. I really appreciate your support!

It is likely somebody will want 3 sometime in the future, since the
current limitation is pretty silly. So please think about this, try
not to put in any roadblocks to that extension.

	Andrew


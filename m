Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E60D59F40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Q44QAHr6FNmqYaxPEnne3qQ3Tm/XxOVBiWjncfQ5Ldo=; b=fnGxUbE4wlGsTG
	V5jDP6EdJAfZThVno206qxryoODg92McSb9D9FswJ5HHU8O+kLEFkRZoJ31NeRQU8bXMCxgf9cYqu
	yrPhvjmRWRXpvA6ZWdriQ5JeZXFD1RXC0UOZ5MYJ8q61JysA1fKGGqTiK47NL6zGsHZJtknKL5O+s
	+YjoccKqMP16qQHz8CY/8sJv6R9KOMjS/87hRn+WueZ7al3dYrbejErwLeKJGxQa5T/Da/GXAMIBe
	6VDZ+/oJjx/i74Hdd/XYypP/BJ/cWKOiGBqx8oVfH8cFl1xq8vF5VeXXy4zE3/T+8pl+fAWpfMQ1o
	RElJjDuIbeQ77UxMsp/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iJk-00000003txU-423a;
	Wed, 06 Nov 2024 15:51:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iI0-00000003tbK-0gbj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:49:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59056A43F72;
	Wed,  6 Nov 2024 15:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4902C4CEC6;
	Wed,  6 Nov 2024 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730908186;
	bh=FgAAS0grrWTmncw1PDMvpu8itvg5qcH9lr5R3c5RBQ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KLI4m8V8ysxLfzGkQNN5S218DMpJBtzWgzEj8jBhuMUYzU9WyCvKP7K/BRkfUsCe9
	 P25NWjkP63S8LWeClBNKPD3PnkOD6AUqPwThyzj/KW11H7JUkUvjlHWpAlEJSSPvMz
	 lhp2uzdYhHbbOOUGmk7AFTL3jIS7fUf75mJKGznIIK9la6aVCGH825o3I+6ZlxMbSI
	 1MNtwnQlJn5z6TyGjTexY2cTcSKQf96XZGEmY5fXDiotPWjEY229wySOxexnsRZt6h
	 zmb8b6TEUD1/KYCHDUw2Sw4WcUSOW31gGIMb1MMcdKsJzep3tZEOgA5lN4PktQg8lS
	 9ZrhWrXmpUiJQ==
Date: Wed, 6 Nov 2024 09:49:45 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, manivannan.sadhasivam@linaro.org,
	kishon@kernel.org, u.kleine-koenig@pengutronix.de,
	cassel@kernel.org, dlemoal@kernel.org,
	yoshihiro.shimoda.uh@renesas.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH v2 1/2] PCI: keystone: Set mode as RootComplex for
 "ti,keystone-pcie" compatible
Message-ID: <20241106154945.GA1526156@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5983ad5e-729d-4cdc-bdb4-d60333410675@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_074948_350010_B041F110 
X-CRM114-Status: GOOD (  29.39  )
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

On Wed, Nov 06, 2024 at 11:36:38AM +0530, Siddharth Vadapalli wrote:
> On Tue, Nov 05, 2024 at 06:57:58PM -0600, Bjorn Helgaas wrote:
> > On Fri, May 24, 2024 at 04:27:13PM +0530, Siddharth Vadapalli wrote:
> > > From: Kishon Vijay Abraham I <kishon@ti.com>
> > > 
> > > commit 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x
> > > Platforms") introduced configuring "enum dw_pcie_device_mode" as part of
> > > device data ("struct ks_pcie_of_data"). However it failed to set mode
> > > for "ti,keystone-pcie" compatible. Set mode as RootComplex for
> > > "ti,keystone-pcie" compatible here.
> > 
> > 23284ad677a9 appeared in v5.10.  
> > 
> > But I guess RC support has not been broken since v5.10 because we
> > never used ks_pcie_rc_of_data.mode anyway?
> > 
> > It looks like the only use is here:
> > 
> >   #define DW_PCIE_VER_365A                0x3336352a
> >   #define DW_PCIE_VER_480A                0x3438302a
> > 
> >   ks_pcie_probe
> >   {
> >     ...
> >     mode = data->mode;
> >     ...
> >     if (dw_pcie_ver_is_ge(pci, 480A))
> >       ret = ks_pcie_am654_set_mode(dev, mode);
> >     else
> >       ret = ks_pcie_set_mode(dev);
> 
> "mode" is used later on during probe at:
> 
> ....
> 	switch (mode) {
> 	case DW_PCIE_RC_TYPE:
> 	...
> 	case DW_PCIE_EP_TYPE:
> 	...
> 	default:
> 		dev_err(dev, "INVALID device type %d\n", mode);
> 	}
> ....

How did I miss that? :)  It is literally two lines down.

> > so we don't even look at .mode unless the version is v4.80a or later,
> > and this is v3.65a?
> > 
> > So this is basically a cosmetic fix (but still worth doing for
> > readability!) and doesn't need a stable backport, right?
> 
> I suppose that "data->mode" will default to zero for v3.65a prior to
> this commit, corresponding to "DW_PCIE_UNKNOWN_TYPE" rather than the
> correct value of "DW_PCIE_RC_TYPE". Since I don't have an SoC with the
> v3.65a version of the controller, I cannot test it out, but I presume
> that the "INVALID device type 0" error will be displayed. Though the probe
> will not fail since the "default" case doesn't return an error code, the
> controller probably will not be functional as the configuration associated
> with the "DW_PCIE_RC_TYPE" case has been skipped. Hence, I believe that
> this fix should be backported.

I guess nobody really cares too much since it's been broken for almost
four years.

But indeed, sounds like it should have a stable tag and maybe a commit
log hint about what the failure looks like.

Thanks!

Bjorn


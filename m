Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55603CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ap24xGx6zxA8VKgZBuv887OXFLFrVuQrrf5tJdD+90I=; b=xUPAx5qNcfWhCLwP3dYdKt4cs2
	3VsJP3u3pgeIYeQgCsk1qREqhofsEcnbB/lak6cvoSeaQqvgZq0+uzn7GvCZSbGj7trY1noAwwWtn
	57cz5zwWAnPWzKzzMNsKz0HIV8hBqclmSc0gnN11SEHTshkkDdIbxfL+CF0QIg/VwJ2TEg4lo4vNi
	lhVMQbJPupclBHei0Uy73wFi2Rb23ELjPboHFjZX+M6IBi5GMTZ+j2HUqHqmB5jo0R3ArdWxxmJL6
	wDh+9hzNGYWei17NSAMwJJABsbveRaN2qMc7nWnzV/QUmoN39sn9GmPdOWfr/CV4wcy366GRoF/JJ
	sFOYMVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIDV-0000000GlS9-0VQw;
	Tue, 05 May 2026 16:01:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIDS-0000000GlR4-3Bc2;
	Tue, 05 May 2026 16:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28D98433A2;
	Tue,  5 May 2026 16:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BB4C2BCF4;
	Tue,  5 May 2026 16:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777996906;
	bh=p03k4D7H3+p+mJwOfE/Zl7so2RTgEEY6I1N4cF+8F/I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LYUk/HeiyCh3Axvju0g5M3iFuATMdDMABJYBK/9siHV3UswdFQSjbhyXI9BmUBuyo
	 1ejGGgrd25HrVCei3j8RaIs+C9Gg7cNKDlvS/4zQvOGrshy5FfVDHQLVYKe7TSfoiS
	 oquGN8LvY75h687/RQjnHWFKBJP4sVHv/kcuT0FexdIXVVlZd0XuiE4tAFqI0O9mIN
	 frigDgaT9VPqG59nIhKSVgtUlaEprpjXZF3QQXr1sW5FtFjDbqjrG0QDLATiABuDYU
	 NTjTHA/wk8cf9yzuXNjjsYGbBj0GVfdfYSslIYGbjHfkoBF8bFpYpdw2vkzmSb3v5M
	 JE6G5DCjsmMnA==
Date: Tue, 5 May 2026 11:01:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Hans Zhang <18255117159@163.com>, linux-pci@vger.kernel.org,
	Dom Cobley <popcornmix@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: brcmstb: Assign pcie->gen from pcie_get_link_speed()
Message-ID: <20260505160144.GA732689@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <631c8f3f-3d38-42e0-b89a-64281d269bfd@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090146_890963_13A79BC4 
X-CRM114-Status: GOOD (  29.82  )
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

On Mon, May 04, 2026 at 04:46:03PM -0700, Florian Fainelli wrote:
> On 5/4/26 10:26, Hans Zhang wrote:
> > On 5/5/26 00:58, Florian Fainelli wrote:
> > > On 5/2/26 04:40, Bjorn Helgaas wrote:
> > > > On Fri, May 01, 2026 at 01:24:38PM -0700, Florian Fainelli wrote:
> > > > > After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
> > > > > pcie->gen stopped being assigned and as a result the established PCIe
> > > > > link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
> > > > > to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
> > > > > 
> > > > > Link: https://github.com/raspberrypi/linux/issues/7343
> > > > > Reported-by: Dom Cobley <popcornmix@gmail.com>
> > > > > Reported-by: Phil Elwell <phil@raspberrypi.com>
> > > > > Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
> > > > > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > > > > ---
> > > > >   drivers/pci/controller/pcie-brcmstb.c | 3 +--
> > > > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/pcie-brcmstb.c
> > > > > b/drivers/pci/ controller/pcie-brcmstb.c
> > > > > index 714bcab97b60..6138fc4bc064 100644
> > > > > --- a/drivers/pci/controller/pcie-brcmstb.c
> > > > > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > > > > @@ -2072,8 +2072,7 @@ static int brcm_pcie_probe(struct
> > > > > platform_device *pdev)
> > > > >           return PTR_ERR(pcie->clk);
> > > > >       ret = of_pci_get_max_link_speed(np);
> > > > > -    if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
> > > > > -        pcie->gen = 0;
> > > > > +    pcie->gen = pcie_get_link_speed(ret);
> > > > 
> > > > Take a look at https://sashiko.dev/#/
> > > > patchset/20260501202438.376033-1-
> > > > florian.fainelli%40broadcom.com
> > > > 
> > > > The notes at https://github.com/raspberrypi/linux/issues/7343 assumed
> > > > PCI_SPEED_UNKNOWN was 0, but in fact it is 0xff, which means you might
> > > > want the more defensive patch instead.
> > > > 
> > > > I'll be happy to replace what's on pci/for-linus if so.
> > > 
> > > I am starting to think a revert is the simplest path forward, it's
> > > not clear what pcie_get_link_speed() brings to the table honestly.
> > 
> > The pcie_get_link_speed function is designed to prevent other Root Port
> > drivers from accessing the array pcie_link_speed out of bounds.
> 
> Yes, so that's useful in the first hunk of your commit where we were
> printing the link speed without checking that the 'max-link-speed' would be
> bounds check, however it is not really useful for assigning to pcie->gen in
> our case, so I would prefer the second option:
> 
>           ret = of_pci_get_max_link_speed(np);
>  -       if (pcie_get_link_speed(ret) == PCI_SPEED_UNKNOWN)
>  -               pcie->gen = 0;
>  +       pcie->gen = (ret < 0) ? 0 : ret;

The point of this validation is to make sure we don't program the
brcmstb hardware with something it doesn't support.

of_pci_get_max_link_speed() only returns an error (ret < 0) if DT
didn't contain a 'max-link-speed' property.  That doesn't tell us
anything about what brcmstb devices support.

I think this test should be something like what advk_pcie_probe() or
rockchip_pcie_parse_dt() do.  If of_pci_get_max_link_speed() fails or
returns something not supported by the hardware, they default to the
fastest speed known to be supported.


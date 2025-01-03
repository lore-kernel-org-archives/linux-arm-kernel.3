Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C07E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 14:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKD2FaoRc2DksUxhM8a8zS6SoleT7JBh2dsJ+eq5pnQ=; b=UZEx36fR5e+PRIdrdIPnvRTlZ2
	3didwsIdRjTBjHYbSWZsmt0RLOS4konJURn50cuZJ/ehi5QybRODylL7udgR+7o3PGfGIErErY6No
	hpEWo3h885GuOOAYbJRMRr8pLX76jkwXTVaZaAKLxGTJCBLk43EPz69lzlkBty58sv6HeF1oXcuDQ
	BI8gXR7HyVE6BiiW7HD9SyEiQSQx5q8hzAZ5EFxOygkW10FvUDsk1p73qzR31rIeBrLsrTUxbHDq1
	iFd8jqOaFW2lxRNASFACs00tCDUP6A6xbQJuUX7HfjNnX6vIcMzD81d5gqClXBukrV+UcZNmpsYtW
	9o7hITsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTixQ-0000000DA5y-3Eeb;
	Fri, 03 Jan 2025 14:47:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiw6-0000000D9r5-3PqD;
	Fri, 03 Jan 2025 14:46:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D125CA40DB4;
	Fri,  3 Jan 2025 14:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF51C4CECE;
	Fri,  3 Jan 2025 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735915561;
	bh=MfVK8HSZs+/BrBxQ1QeZp461yTp5dPXrpsgyNMkk5q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edzXVPeoEnin4dtWT3JZmMhVXMA43QdAN15oHHhjV6Z7/aiQOrLpRbiLQsJr4xXWa
	 fNsNZKqchNrU/5eyNK6KnPDPvv0EPcHOsDF6WQ0RqEiB3wJGVDIs+jfmYgkBKfaL2o
	 y4Uchqz504GnPWTlpMH+2Od7E8yJEN+Zxgu3HbsE+D7bFYOa22lLRNW2ZVzYNEMijO
	 CijlzLvps5e4tKU1XxpHF31p/jofzetZeBZu/B1kbo5xu16hYuNl0Uc54x57KBwH/y
	 UShjRy/sC/RI5mA7sBGq8wdcBuzN2DBCf3DnkFt+9Zrcrr05KjcNK5qL3cviyREquf
	 ejV5wUsOXdUhg==
Date: Fri, 3 Jan 2025 15:45:57 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <Z3f4JQZ6yYV1BJ-b@ryzen>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
 <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <Z3fzad51PIxccDGX@ryzen>
 <CANAwSgQEunirUf3O3FJJAUsQu9mQYD_Y40uJ_zMYDZYVy5J=wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANAwSgQEunirUf3O3FJJAUsQu9mQYD_Y40uJ_zMYDZYVy5J=wQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_064602_914751_75798AF7 
X-CRM114-Status: GOOD (  25.30  )
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

On Fri, Jan 03, 2025 at 08:10:17PM +0530, Anand Moon wrote:
> Hi Niklas
> 
> On Fri, 3 Jan 2025 at 19:55, Niklas Cassel <cassel@kernel.org> wrote:
> >
> > Hello Anand,
> >
> > On Fri, Jan 03, 2025 at 07:24:07PM +0530, Anand Moon wrote:
> > >
> > > Thanks for testing this patch.
> > >
> > > This patch should have been tested on hardware that includes all the
> > > relevant controllers,
> > > such as PCI 2.0, PCI 3.0, and the SATA controller.
> > > I will test this patch again on all the Radxa devices I have.
> > >
> > > This patch's dependency lies in deferring the probe until the PHY
> > > controller initializes.
> > >
> > > CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=m
> >
> >
> > Note that the splat, as reported in this thread, and in:
> > https://lore.kernel.org/netdev/20250101235122.704012-1-francesco@valla.it/T/
> >
> > is related to the network PHY (CONFIG_REALTEK_PHY) on the RTL8125 NIC,
> > which is connected to one of the PCIe Gen2 controllers, not the PCIe PHY
> > on the PCIe controller (CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY) itself.
> >
> > For the record, I run with all the relevant drivers as built-in:
> > CONFIG_PCIE_ROCKCHIP_DW_HOST=y
> > CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=y (for the PCIe Gen2 controllers)
> > CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=y (for the PCIe Gen3 controllers)
> > CONFIG_R8169=y
> > CONFIG_REALTEK_PHY=y
> >
> >
> > >
> > > To my surprise, we have not enabled mdio on Rock-5B boards.
> > > can you check if these changes work on your end?
> >
> > I think these changes are wrong, at least for rock5b.
> 
> We need to enable the GMAC PHY and reset it using the proper GPIO pin
> (PCIE_PERST_L).
> Please refer to the schematic for more details.

The PERST# GPIO is already asserted + deasserted from the PCIe Root Complex
(host) driver:
https://github.com/torvalds/linux/blob/v6.13-rc5/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L191-L206

which will cause the endpoint device (a RTL8125 NIC in this case)
to be reset during bootup.


Kind regards,
Niklas


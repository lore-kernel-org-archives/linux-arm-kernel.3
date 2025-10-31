Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2691FCCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4PdjAgGN9CXMADjTYH6Vrnejj2e5huADOUeceii3Ag=; b=kP20gp1TNhfpdRyJAmVB6ycgCQ
	1yDp4OSGlupCr5KotzYA5m0xX4k0lJYZToAT9zpWO/xWvhluO1UZ11ukHhs9ZtQCK2+zAWImbh1GT
	zjxreq3bD5ZJOnS8kCAF7FQo9lkZG/fwHQjpCCpS+OWNV9v9Zst47G/ZUOFsWt0VjX0VHg01pX5kr
	X9MN1Q2tG8LdqtmKNX3G0cTK4dh3yJLrqvSxa4KodjQDPpv/8JwHhjvXSzGCTHivUT/KVMbe+mELb
	yoDJ0pWyEnZc4/3QEYd8oH7+ReOMWAxeDW3omom8c76ay0ulTSrT9IJwcAwqkI20yp+hzqPxiZfa+
	jW09Whzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoGI-000000064pa-37PZ;
	Fri, 31 Oct 2025 12:29:46 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoGG-000000064pB-42tg;
	Fri, 31 Oct 2025 12:29:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761913773; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lbv+fXr9nldSZ6bg2HxAoLbBLIzWWdu/lCarcLknvjWruEAX72qbG2BejhKPOlAwN5ZzV3YQBkuP5enNXNxGYiE9/9WuEll7ddxT82q8CnApUPaV1j5s+LZpNKN4ZpF7nDuaVpmkpfwF7IEy3VTi9k3hcK0kCyaD/TyASu5t6/I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761913773; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i4PdjAgGN9CXMADjTYH6Vrnejj2e5huADOUeceii3Ag=; 
	b=VjjbDznmMFtS6Cmdz6hoJi+GITJJ23e5wz0WnnFjbyGQDdu/BiSFoCwWREhaTtzz6AnZ7vR44hHaJTGEUddxPtHHORjctN2ohZUjzZ/OyBz2hVkgCVvXXcoz1nxLFLhC1bAwz6KUkTVAaznLOo+vqScX8aEqOfqJKDQBfUD/FSo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761913773;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=i4PdjAgGN9CXMADjTYH6Vrnejj2e5huADOUeceii3Ag=;
	b=gHKvRPN9Tr1hv3oHVcXGKSvjBpijr3x2hWyzkr57PZTRUoUfwmZeTlH66YqGOOcc
	jFCdXsJEY9zQRdS/yl7j4HDOrK3i1UMRfiLAZml+Fsh1RltGxyHWeEb2FEjGCd6XTDV
	EfLPRnMBl8EBvnX73mNzngposYFIGN4ax4WCWStA=
Received: by mx.zohomail.com with SMTPS id 1761913772134279.7995112453409;
	Fri, 31 Oct 2025 05:29:32 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Anand Moon <linux.amoon@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] PCI: dw-rockchip: Add remove callback for resource cleanup
Date: Fri, 31 Oct 2025 13:29:25 +0100
Message-ID: <15087240.uLZWGnKmhe@workhorse>
In-Reply-To: <b2micr4atfax2sgolsublmjk4kwvbmdnqjlk2lb7cflzeycm5i@bi62lg75ilo6>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-2-linux.amoon@gmail.com>
 <b2micr4atfax2sgolsublmjk4kwvbmdnqjlk2lb7cflzeycm5i@bi62lg75ilo6>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_052945_060544_291A2CD9 
X-CRM114-Status: GOOD (  24.36  )
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

On Friday, 31 October 2025 09:36:05 Central European Standard Time Manivannan Sadhasivam wrote:
> On Mon, Oct 27, 2025 at 08:25:29PM +0530, Anand Moon wrote:
> > Introduce a .remove() callback to the Rockchip DesignWare PCIe
> > controller driver to ensure proper resource deinitialization during
> > device removal. This includes disabling clocks and deinitializing the
> > PCIe PHY.
> > 
> 
> How can you remove a driver that is only built-in? You are just sending some
> pointless patches that were not tested and does not make sense at all.

The better question would be: why does Kconfig make PCIE_ROCKCHIP_DW
a bool rather than a tristate? I see other PCIE_DW drivers using
tristate, so this doesn't seem like a technical limitation with the
IP.

> 
> Please stop wasting others time.
> 
> - Mani
> 
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > index 87dd2dd188b4..b878ae8e2b3e 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -717,6 +717,16 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
> >  	return ret;
> >  }
> >  
> > +static void rockchip_pcie_remove(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> > +
> > +	/* Perform other cleanups as necessary */
> > +	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> > +	rockchip_pcie_phy_deinit(rockchip);
> > +}
> > +
> >  static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
> >  	.mode = DW_PCIE_RC_TYPE,
> >  };
> > @@ -754,5 +764,6 @@ static struct platform_driver rockchip_pcie_driver = {
> >  		.suppress_bind_attrs = true,
> >  	},
> >  	.probe = rockchip_pcie_probe,
> > +	.remove = rockchip_pcie_remove,
> >  };
> >  builtin_platform_driver(rockchip_pcie_driver);
> 
> 






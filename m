Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9CDE77194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSrxj+3pIf/w5aqrdGOXcayVx1UKg3mbw6rFSLr+sDI=; b=ASezPkjz/dfzXzCErD2BreyYSQ
	RYU4Ma3U4s4BqsPZ6Dm2mMI49K8y2tvhi6SQbJdyuJQ41emVC0kK1DNoROM8nOp0EQ6xJxKjbXFyX
	5F+kyiRil53K/DiOm3Ocab+mFbVozvPRW5EGZk+CJ2zwlx0ODs8D2YIJ2W/FGa1/xNBC2fleDysMC
	gU+OEVL9X9bj8nUd+iTtZpj8CVKSRvuSFiBGizzdQjrfRwC5spn5KvpU1RTBK2jYtU49umX1d1jKC
	pbiTcwjfa+0UPg4rkv7aD3/ED2PQQ8YoxyE17HKsxo2qtAdCfd/jouxJerzLJC8NAS1py7Nitqb4b
	sXJ6cayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOko-0000000Ax5w-0X5j;
	Thu, 02 Jan 2025 17:13:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOhM-0000000AwbM-0LQc;
	Thu, 02 Jan 2025 17:09:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E725AA410AD;
	Thu,  2 Jan 2025 17:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C49EC4CED0;
	Thu,  2 Jan 2025 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735837766;
	bh=Dfckcslj2/8WRc8SptWS2FQp9woBnJsNqD3xm+9mJes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ruyYold5U8duzlVE6n5ktgNH83eSQ0/GovN3m3oZtWtSnr5Fshqdt/Nrtb16S3MgB
	 lqycf6xuS3anj00QuzamQ2IpKPjJJNCc2v79T83c/NVR5FlOq/B/FmOBOyqn/Nl3zc
	 CGuDGrxIeqVbQ3p3VC4c7vzMeR9Dsg4rtHlzDUm6A21iogjVht5qksfT6kYmx5TCX5
	 +nP6bCUrW8Qs22O3Tgm9YU085lSxkPr+Vb2vtQ24xHpkun+yhLOZ781XIoZ+GzlNc1
	 Qo8p6cexKtpHOo0nW+d20c+dlauVTRXyUyWz0EkZ+EwYmh9xKWq7UIlOYCSNIR5lwm
	 naSL8cRx8xi/w==
Date: Thu, 2 Jan 2025 18:09:22 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Enumerate endpoints based on
 dll_link_up irq in the combined sys irq
Message-ID: <Z3bIQj4b-9gV-Sd9@ryzen>
References: <20241127145041.3531400-2-cassel@kernel.org>
 <20241230191908.GA3962801@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230191908.GA3962801@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_090928_193526_E71EC4FC 
X-CRM114-Status: GOOD (  22.20  )
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

On Mon, Dec 30, 2024 at 01:19:08PM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 27, 2024 at 03:50:42PM +0100, Niklas Cassel wrote:
> > Most boards using the pcie-dw-rockchip PCIe controller lack standard
> > hotplug support.
> > 
> > Thus, when an endpoint is attached to the SoC, users have to rescan the bus
> > manually to enumerate the device. This can be avoided by using the
> > 'dll_link_up' interrupt in the combined system interrupt 'sys'.
> > 
> > Once the 'dll_link_up' irq is received, the bus underneath the host bridge
> > is scanned to enumerate PCIe endpoint devices.
> > 
> > This commit implements the same functionality that was implemented in the
> > DWC based pcie-qcom driver in commit 4581403f6792 ("PCI: qcom: Enumerate
> > endpoints based on Link up event in 'global_irq' interrupt").
> > 
> > The Root Complex specific device tree binding for pcie-dw-rockchip already
> > has the 'sys' interrupt marked as required, so there is no need to update
> > the device tree binding. This also means that we can request the 'sys' IRQ
> > unconditionally.
> 
> Thanks for doing this!
> 
> > @@ -436,7 +481,16 @@ static int rockchip_pcie_configure_rc(struct rockchip_pcie *rockchip)
> >  	pp = &rockchip->pci.pp;
> >  	pp->ops = &rockchip_pcie_host_ops;
> >  
> > -	return dw_pcie_host_init(pp);
> > +	ret = dw_pcie_host_init(pp);
> > +	if (ret) {
> > +		dev_err(dev, "failed to initialize host\n");
> > +		return ret;
> > +	}
> > +
> > +	/* unmask DLL up/down indicator */
> > +	rockchip_pcie_writel_apb(rockchip, 0x20000, PCIE_CLIENT_INTR_MASK_MISC);
> 
> I know we already had a bare 0x60000 in rockchip_pcie_configure_ep(),
> but can we add #defines for both of these PCIE_CLIENT_INTR_MASK_MISC
> bits?

Sure, I will send a follow-up patch.


Kind regards,
Niklas


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B93CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gn+3LWZ/b1D063jPBinRzCmCCfKgEKextYzVs9lXLok=; b=yrTrck7Xji3KjpuLfq8joBS3Nm
	Gsfe/5pkoGPMttJwZfV6xbKa8E4PrH5Q1Ivf14OqGHn4/uMXfiw8K9JJw3UBwkAePCAowJ2Hx2U/U
	peWcxqt1vrmwygDp+F4dYq+ukth1jjd/v1oyW/YQwqbf8KudmvbtjnO79wfELR50xNj8uwKBGCxkv
	Uiy7j2hu4esCbDKTb1SUHmovwSSUkui4VlLMY+MIP0NOoyuCte/YF9ualpXWCWljVC1bRDp7IaCMk
	nQ916wWQFHLR34MX+cEAhfw7TC0S8kPoN8w+ODhvqZQD4tc8aAu0XiyakDBe4yYNY50sxqEueSXRH
	GarxwbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6VsN-000000046Ug-3q6A;
	Wed, 08 Oct 2025 15:14:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6VsL-000000046UH-25ht
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 099CF45308;
	Wed,  8 Oct 2025 15:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E553C4CEE7;
	Wed,  8 Oct 2025 15:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759936484;
	bh=yaCpMcSVmb2a4GcP5V5TbIm8ZHHu7Fc/eP7NoitbYkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NL3mTpfbDtaaxlmJsWQllNwCG97x/DX9MX5VPCC5yEH2q8/vYDjPNQ5dJ1JFdJfbz
	 bVjYLqmEMXre3/ASbmA5dCY89XOxT0Oo+iUY6t9RqX52IyAu86xwAm0SqfKZF6R59C
	 4FEmD2Rrgzz+ufDRWidG496D/W98/qtsWjZcCiu9wWiRszBKactZiVLwTJaTsdSTUn
	 mOg0ZM1m1xaWwaw214QA0SBHBK9c2JdKBgR1MlIMrhonOqSzr9dFwyOS5zjE5LKd2B
	 kp/l6kTdM9mlE0Tbpz3wUBT0jI/JkBRsAFVrnKpM5FWJN7yIbSnL+qAslLPpDLped9
	 KU/UyZugDK5QA==
Date: Wed, 8 Oct 2025 08:14:41 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, bhelgaas@google.com, jingoohan1@gmail.com, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Ionut.Vicovan@nxp.com, Larisa Grigore <larisa.grigore@nxp.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, ciprianmarian.costea@nxp.com, 
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, Frank Li <Frank.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Message-ID: <zdqmmpawrntlbebmeb3ey3z3rpxzmlanqqqp4stmbrouwelbx7@s5qt5f53553x>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-2-vincent.guittot@linaro.org>
 <iom65w7amxqf7miopujxeulyiglhkyjszjc3nd4ivknj5npcz2@bvxej6ymkecd>
 <aOU0w5Brp6uxjZDr@lpieralisi>
 <4rghtk5qv4u7vx4nogctquu3skvxis4npxfukgtqeilbofyclr@nhkrkojv3syh>
 <eba7d968-209d-4acb-ba41-4bebf03e96ba@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eba7d968-209d-4acb-ba41-4bebf03e96ba@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_081445_573836_63093696 
X-CRM114-Status: GOOD (  26.87  )
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

On Wed, Oct 08, 2025 at 10:26:35AM +0200, Arnd Bergmann wrote:
> On Wed, Oct 8, 2025, at 00:28, Manivannan Sadhasivam wrote:
> > On Tue, Oct 07, 2025 at 05:41:55PM +0200, Lorenzo Pieralisi wrote:
> >> On Mon, Sep 22, 2025 at 11:51:07AM +0530, Manivannan Sadhasivam wrote:
> >> 
> >> [...]
> >> 
> >> > > +                  /*
> >> > > +                   * non-prefetchable memory, with best case size and
> >> > > +                   * alignment
> >> > > +                   */
> >> > > +                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
> >> > 
> >> > s/0x82000000/0x02000000
> >> > 
> >> > And the PCI address really starts from 0x00000000? I don't think so.
> >> 
> >> Isn't the DWC ATU programmed to make sure that the PCI memory window DT
> >> provides _is_ the PCI "bus" memory base address ?
> >> 
> >> It is a question, I don't know the DWC inner details fully.
> >> 
> >> I don't get what you mean by "I don't think so". Either the host controller
> >> AXI<->PCI translation is programmable, then the PCI base address is what
> >> we decide it is or it isn't.
> >> 
> >
> > As per the binding, I/O PCI address already starts from 0x0. How can you have
> > two OB mappings with same PCI address?
> 
> I/O space and memory space can use the same bus addresses,
> since they are disambiguated by the type in the actual PCIe
> transactions.
> 

The DWC IP does the address match translation for OB regions, so I mistakenly
assumed that the PCI addresses has to be unique. But it is the other way around,
the CPU addresses has to be unique. So as long as the CPU addresses doesn't
overlap, we are fine.

Sorry for the confusion.

> We usually assume that I/O space port numbers start at 0 (as done
> here), while PCI memory ranges are identity-mapped to the CPU
> physical address they are mapped at, but in this case the physical
> address window is outside of the low 4GB range, so an identity map
> at 0x58.0x00000000 woulds prevent the use of 32-bit BARs, and
> mapping something in the low bus address range is the only
> possibility.
> 

Agree.

> On the other hand, what looks like a bug to me is that the CPU
> physical address range for the PCI BAR space overlaps with the
> the physical addresses for RAM at 0x80000000 and on-chip devices
> at 0x40000000.

I don't understand the overlap issue here. The outbound address translation only
cares about the CPU address and as long as that doesn't overlap with MMIO/RAM,
we should be fine.

Am I missing something?

- Mani

-- 
மணிவண்ணன் சதாசிவம்


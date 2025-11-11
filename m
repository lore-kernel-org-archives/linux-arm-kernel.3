Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4F2CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 21:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sQ1GGsyADGE2FSymKNR8hCsSYmZWWPT6iO480Wt/UvE=; b=m4WyuMTpqGda35
	B+NvKxYpq31xchUPmqk9K2dNpVltvKN2A4sZOJ+ssGLR6z2MIEJq2w+bZHAX0M/qrJK811Yeoaf9a
	WdyjnjBPrh7YwsBdlUG7rUY+a2l8o4Uu6XiUicN7DUp/DkkNiz69XBRY5fZoOL7gSNCrA/coQtYiP
	jRG/QIK+8P2hO6VK4nZKUEPtewDGHSZ3837ADatWT5i7dqY8CgPKLWLTHUHR7n/zcHmyPRfB7IWq/
	S56WknyvcNbc2ot5W0GDN2lRLLGn9OHuAEMk4XYE/i4DG2PIHoveBd3LTxWT8rvuASGBnL9Pe4ZPu
	v97F8Ooihi9tZ502hTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIw9N-00000007oLe-0U9u;
	Tue, 11 Nov 2025 21:43:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIw9L-00000007oKc-1FFr;
	Tue, 11 Nov 2025 21:43:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E52244071;
	Tue, 11 Nov 2025 21:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91EDC4CEF7;
	Tue, 11 Nov 2025 21:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762897418;
	bh=BrVMOaDVyCaFwuLU2xGlgXvKEaAdQBM2gDIRbwlpENA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=sNDC4Lju93urVAUKUTfmYYPoCAbyzJNyscqunfEGxAzUiWXuk69Oh3tCqcbEQtNog
	 EL5EUfHxyJci9q6GXQ6FMmVEFGC66wdo0o1bkvERo8OpIuB73pntJm5uW2NBS9+BRA
	 gz4JWOjBN297BL2+KPNS92L5qLDXbAMgCYFMwPmEMP5ftTYhL4yowjPmTLKyy4jo+/
	 jeBj+u/DMKvp+ovtBwOKlIqquhe9A2Gnogp25YSy9N8fnWPwv8zz0EIw0BA6W0xeCH
	 GYBYOxvLnLdMejVkEM3X2FlTkUUBx3wAXZaipvYqRkCcQ/S40YN4T0tIK2mXt9Y+yI
	 sDV6ifo1bVQuA==
Date: Tue, 11 Nov 2025 15:43:36 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <diederik@cknow-tech.com>, stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates
 support
Message-ID: <20251111214336.GA2190667@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRM1VOodnSpaob3P@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_134339_355791_45C038ED 
X-CRM114-Status: GOOD (  18.16  )
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

On Tue, Nov 11, 2025 at 02:08:36PM +0100, Niklas Cassel wrote:
> On Tue, Oct 21, 2025 at 08:05:17AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, 17 Oct 2025 18:32:53 +0200, Niklas Cassel wrote:
> > > The L1 substates support requires additional steps to work, namely:
> > > -Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
> > >  hardware, but software still needs to set the clkreq fields in the
> > >  PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
> > > -Program the frequency of the aux clock into the
> > >  DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
> > >  is turned off and the aux_clk is used instead.)
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] PCI: dw-rockchip: Prevent advertising L1 Substates support
> >       commit: 40331c63e7901a2cc75ce6b5d24d50601efb833d
> 
> Last update in this thread was "Applied, thanks!"
>
> and the patch was applied to pci/controller/dw-rockchip
> 
> since then it seems to have been demoted to
> pci/controller/dw-rockchip-pend

That was Oct 20, and we had some conversation about a more generic
approach after that, so I moved it to dw-rockchip-pend while we worked
that out.

I fleshed it out the generic approach and will post it soon.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2E2C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Thkcc2S57UNsnh2/3txVPTaOtTVsy5E2FVI5X6jG4zs=; b=mYYqYs95UCpMqFTYLRBheyl8Ai
	sBUVL6tpX432nP9qBb5V5qwWksHqaY/G4xCVTunudF+kPIXgVBhUBf4qH8hBu9ozV1FTxVerMmiCW
	8Kk5Qg7aoBtGVw8+GTztHIoQLwUW57SHb+3811IQpCumCgy3mU6ySDebHoaB7G+gWQLq0Oi5de5X8
	79q8W3+qPmBGLvN3z53cQia2LOtDLSjA0h4eswZ1UA8fBj6XAmVLajFHQjP0cjrDm+3Z3yYN6r8x7
	eny8qU+EqUHPOGD6KblqAhDSLW30wRofVW34VSjmmseix47CWwegIZCNHkyUzyZT1r8h0v7FKQGRL
	mbsWkTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRW-0000000DRSX-0LNX;
	Thu, 19 Jun 2025 15:44:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBy6-0000000Cg8F-2Kpw;
	Thu, 19 Jun 2025 09:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A65E55C5C27;
	Thu, 19 Jun 2025 09:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98164C4CEEA;
	Thu, 19 Jun 2025 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750326840;
	bh=3kDiPSCG/YSn0QGi0c8Zra1rZG6c2gbaqXpd8Muw3N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfbyxoKV+C8IW2ITf7tcRxFv7ovSQRozIwhrvYVvfzncgmpFzwrsoijrTidHx4w9J
	 ykg1odCt52H0hrPNksfyqDcR5qyGz+Me8RJQtR5m46Z6S4RbvGSWJBzfwrG7wZMGXB
	 l4M6K9pk9Dea2wuiMRPLDdwkrnQs8j/FNz9dXUYguxKlUs5JDMzE9N/6CElXBx9c+9
	 tABKRJA7WLRWCWgQZh/R9KmHu9LGFLVCc2cygWVM/uneYxsVAS3wyE3GwZhFmkK3zO
	 KZUvm4TyaXfpzqGxHyWu1RHZpVd01N6aU8FvaRxGtT1s5J1Fq3JnRK0JepYrn/6O4r
	 s81N+V/2KSkDQ==
Date: Thu, 19 Jun 2025 11:53:55 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Delay link training after hot reset
 in EP mode
Message-ID: <aFPeMzLxbiXEOQCt@ryzen>
References: <aFLHYfs1iDgwMdcp@ryzen>
 <20250618195959.GA1207191@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618195959.GA1207191@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_025402_684005_AA086E08 
X-CRM114-Status: GOOD (  23.39  )
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

On Wed, Jun 18, 2025 at 02:59:59PM -0500, Bjorn Helgaas wrote:
> > 
> > Well, because currently, we do NOT delay link training, and everything
> > works as expected.
> > 
> > Most likely we are just lucky, because dw_pcie_ep_linkdown() calls
> > dw_pcie_ep_init_non_sticky_registers(), which is quite a short function.
> 
> I'm just making the point that IIUC there's a race between link
> training and any DBI accesses done by
> dw_pcie_ep_init_non_sticky_registers() and potentially EPF callbacks,
> and the time those paths take is immaterial.
> 
> If this is indeed a race and this patch is the fix, I think it's
> misleading to describe it as "this path might take a long time and
> lose the race."  We have to assume arbitrary delays can be added to
> either path, so we can never rely on a path being "fast enough" to
> avoid the race.

I agree 100%.

When writing the commit message, we simply wanted to be transparent that we
have not observed the problem that this fix (theoretical fix?) is solving.

However, from reading the TRM (trust me, a lot of hours...), we are certain
that this feature DLY2_EN + DLY2_DONE was implemented such that there would
not be a race between link training and reinitializing registers via the DBI.


> 
> Is the following basically what we're doing?
> 
>   Set PCIE_LTSSM_APP_DLY2_EN so the controller never automatically
>   trains the link after a link-down interrupt.  That way any DBI
>   updates done in the dw_pcie_ep_linkdown() path will happen while the
>   link is still down.  Then allow link training by setting
>   PCIE_LTSSM_APP_DLY2_DONE.

Yes.

s/link-down interrupt/link-down or hot reset interrupt/

When Hot Reset or Link-down reset occurs, controller will assert
smlh_req_rst_not as an early warning. This warning is an interrupt bit in
Client Register group(link_req_rst_not_int).

(It is the same IRQ, so we can't tell the difference, at least not from
only looking at the IRQ status.)


> 
> We don't set PCIE_LTSSM_APP_DLY2_DONE anywhere in the initial probe
> path.  Obviously the link must train in that case, so I guess
> PCIE_LTSSM_APP_DLY2_EN only applies to the case of link state
> transition from link-up to link-down?

Yes.

The register description for dly2_en:
Set "1" to enable delaying the link training after Hot Reset.

The register description for dly2_done:
Set "1" to end the delaying of the link training after Hot Reset.


Kind regards,
Niklas


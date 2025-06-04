Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84F1C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4UpoCy7hgoVeYXPJ8EQcsoiTisauGrtx4Ce/DJqgVo=; b=3fKSbtFJ6I1W60dv5zW8bUbyBL
	o0PPV0RSa2pzIbDrhnh4f0nkX1fCSHqseacqlDRU3xqPUms2Bw2lN49lOvcAitMHsSG/HCBngGly+
	vN71zOVhEu6x41OAIoM7GCntm3+Dawv2QCx/9KbxESsk3fAkm3YGlkYgobDSjA4vQpzqZK3lWX3jz
	RpIGokW5iHcDotWZHmIbTE9wTTD6LIi6xr81OO4zE8V9rfdTjMhMn373TxqkoRk4sEI9UGMfUo1E6
	NPszJjmbS7zZFHHudRrmv8JqYmrK979O/zEjNE72oaM9CcYrFdYvXsA17vmcU0ajb0LT2Ho+j0UmT
	rxrn9ExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmWS-0000000DEW7-3us8;
	Wed, 04 Jun 2025 11:43:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmUN-0000000DEQK-2G6S;
	Wed, 04 Jun 2025 11:40:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAD74614E0;
	Wed,  4 Jun 2025 11:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844CEC4CEEF;
	Wed,  4 Jun 2025 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037258;
	bh=na+e7iAyIdNEOxA/Fo3/lMjI298SPFA0QzS+xSDF0Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCGwShIJtYiAjjl7xwa4EpbS0L6ohuJBWlnfXSAmmC1FMtZYotGyitscDbYVcRxYV
	 ynLCuyn2fuaSVssZAmNVKe/M67ECh6gQK3n9/kbHgo2cydL1gZMnxO/01nbd3IuOca
	 dGhbgEwisZyg0PvqjkiyLrHvPeM7tOZzvINjYZEbISW6bvuqu2dRPDzd7b2Kej8Dar
	 jpAZSD2kPPfJFtwDNCaLuTzAPGmXLbw+FvDbBu8cIGTeOBeJvcrpnWNPnB561F7zrw
	 /ykTtbx2u+vOHOb6T/krUbRg4fNruJYeOTYP8PUtu1dLEGayEwWmNplfM2Bd+qZa4C
	 TJYXhYCpyp/SQ==
Date: Wed, 4 Jun 2025 13:40:52 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <aEAwxFysCgdJCD54@ryzen>
References: <aD8Bz4CkdnAd8Col@ryzen>
 <20250603181250.GA473171@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603181250.GA473171@bhelgaas>
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

On Tue, Jun 03, 2025 at 01:12:50PM -0500, Bjorn Helgaas wrote:
> 
> Hmmm, sorry, I misinterpreted both 1/4 and 2/4.  I read them as "add
> this delay so the PLEXTOR device works", but in fact, I think in both
> cases, the delay is actually to enforce the PCIe r6.0, sec 6.6.1,
> requirement for software to wait 100ms before issuing a config
> request, and the fact that it makes PLEXTOR work is a side effect of
> that.

Well, the Plextor NVMe drive used to work with previous kernels,
but regressed.

But yes, the delay was added to enforce "PCIe r6.0, sec 6.6.1"
requirement for software to wait 100ms, which once again makes
the Plextor NVMe drive work.


> 
> The beginning of that 100ms delay is "exit from Conventional Reset"
> (ports that support <= 5.0 GT/s) or "link training completes" (ports
> that support > 5.0 GT/s).
> 
> I think we lack that 100ms delay in dwc drivers in general.  The only
> generic dwc delay is in dw_pcie_host_init() via the LINK_WAIT_SLEEP_MS
> in dw_pcie_wait_for_link(), but that doesn't count because it's
> *before* the link comes up.  We have to wait 100ms *after* exiting
> Conventional Reset or completing link training.

In dw_pcie_wait_for_link(), in the first iteration of the loop, the link
will never be up (because the link was just started),
dw_pcie_wait_for_link() will then sleep for LINK_WAIT_SLEEP_MS (90 ms),
before trying again.

Most likely the link training took way less than 100 ms, so most of those
90 ms will probably be after link training has completed.

That is most likely why Plextor worked on older kernels (which does not
use the link up IRQ).

If we add a 100 ms sleep after wait_for_link(), then I suggest that we
also reduce LINK_WAIT_SLEEP_MS to something shorter.


> 
> We don't know when the exit from Conventional Reset was, but it was
> certainly before the link came up.  In the absence of a timestamp for
> exit from reset, starting the wait after link-up is probably the best
> we can do.  This could be either after dw_pcie_wait_for_link() finds
> the link up or when we handle the link-up interrupt.
> 
> Patches 1 and 2 would fix the link-up interrupt case.  I think we need
> another patch for the dwc core for dw_pcie_wait_for_link().

I agree, sounds like a plan.


> 
> I wish I'd had time to spend on this and include patches 1 and 2, but
> we're up against the merge window wire and I'll be out the end of this
> week, so I think they'll have to wait.  It seems like something we can
> still justify for v6.16 though.

I think it sounds good to target this as fixes for v6.16.

Do you plan to send out something after -rc1, or do you prefer me to do it?


Kind regards,
Niklas


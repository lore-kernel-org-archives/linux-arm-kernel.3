Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4A7CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLDn/qK+a+vpmqkmaq+pHsB5onP0P49qK5MAJD9qW9k=; b=2hxGiLA6HFhdme3GJvycCBMzAv
	1d0k+IuurVGczG7SZyE4BLXC7DaHUcWamlVevQMfcAd9kshPlPZuJkI88dIkllYvCYdXnBTK3Syjk
	gGxl1KqEnkqk2ZP/V5gjbMNRlb/3W4KW+EUQZEKSZY6mBBiVtqDdKnhpcAYSc1jxVJaNJtTg+WeXg
	Hp+68iK64lgmZ4Ddbu+YBBPxu7ZFyV5ry4dOCnHDyVObgPyVyK2OPcyrpovMeOJMngBBsf5I9FoTh
	p0cDmiEv26SBMU+rEfsGYulxcwzZwuHt+i8nPZfzd8HJr2w4IoyGV9R6L1TLFc3cMGQUBCl613IiT
	XghHn1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWQT-0000000FLCc-3aMD;
	Mon, 08 Sep 2025 07:36:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWJ9-0000000FIgS-3DRs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:28:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EB9C601A4;
	Mon,  8 Sep 2025 07:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EB2C4CEF1;
	Mon,  8 Sep 2025 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757316538;
	bh=RDvvo3xdx4TsaQjK5xSMvu9RP3KZphhm9dRO9PYFaHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8/g5uyVIQHXN0e5mPL9I3N+5Fn6il5f2SU5KOSKgX89LWRmezpwmscDnBQlomDrA
	 aEBCNkVUN1lBdnEclWHE3VhOKuYCntWCldDEu7gJ74ZJ9iay1o8qfCECrOKrtsjbGl
	 bGirtqLfDtyXx11f2dN0SAZzmnwm/DDg3vBpdgF0GvG6VOktkr+VY9TvNLQVO7esmr
	 j0srYDy770j88l60UxOBdJi20ZbMBqydj40KYf73dg1BBvfz7YVDkKQ6iQegnXPX/f
	 9y4eynU6UU84qnbeQYveWvRhShVUzT4Fb/JsxJgLihah1qp66vbvLIcB1kCz9GfyQ9
	 RYU+pKsc7qzsg==
Date: Mon, 8 Sep 2025 12:58:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, helgaas@kernel.org, kishon@kernel.org, vigneshr@ti.com, 
	stable@vger.kernel.org, linux-pci@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v3] PCI: j721e: Fix programming sequence of "strap"
 settings
Message-ID: <wvrouqouhrpoexmggwbc6vjz4xflnylzxrb2ffw3ai7656ehrt@keb53gb2tm2o>
References: <oztilfun77apxtjxumx4tydkcd2gsalsak4m2rvsry2oooqjna@2yvcx6cnuemm>
 <b2fb9252-6bfc-45da-973a-31cdfcc86b3d@ti.com>
 <z3ubracmtlq23yicbrhqjgnzrfoqheffm6cvhfnawlvbu4cmmp@ddu2o7xhw5tz>
 <48e9d897-2cd3-48ef-b46a-635ae75f5ac6@ti.com>
 <3wc3t6y5gzzspgfeklsqo3bupfp6gsfy6mls6t66hflcqlqsfk@cu26wv3sow4y>
 <9d2bba15-52e4-432a-8f7f-a0f5d7c2e4ad@ti.com>
 <7hxdcjm7evlphkldct7seytno4is7rjkx5vquvtfhpdkzxdhu6@yocrjgzciwu3>
 <08b87b5f-838b-4f40-ae90-10ded134356e@ti.com>
 <whinfqhjgqbbvlnuzgbukklqi6gocjji4gakqyycovrse4qq6s@6xq5imqbzvux>
 <a0e1d273-239b-44e5-8ccc-0ba83b2b5839@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0e1d273-239b-44e5-8ccc-0ba83b2b5839@ti.com>
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

On Thu, Sep 04, 2025 at 11:33:00AM GMT, Siddharth Vadapalli wrote:
> On Wed, Sep 03, 2025 at 06:51:14PM +0530, Manivannan Sadhasivam wrote:
> 
> [...]
> 
> > 
> > I thought put_noidle() will just reduce the refcount and not invoke the
> > idle/suspend callbacks, but I seem to be wrong here.
> > 
> > Anyway, I guess we have no option here other than to drop the
> > pm_runtime_put_noidle() call. This will keep refcount as 1 and will prevent the
> > parent (genpd) to not enter runtime suspend, but we have to live with it (this
> > was also the previous beahvior as well).
> > 
> > Btw, pm_runtime_set_active/enable change belongs to a separate patch.
> 
> I will work on and post the v4 patch with the following change:
> - The commit message and the comment in the code will be updated to
>   indicate that the runtime PM APIs are used to cause 'genpd' to power off
>   and power on the controller.
> 
> I assume that the driver changes can remain as they are in this patch given
> that the existing behavior has to be preserved. As j721e_pcie_ctrl_init()
> programs the strap settings, powering off the controller via
> pm_runtime_put_sync() and powering it on via pm_runtime_get_sync() shall
> be implemented within j721e_pcie_ctrl_init() itself leaving the rest of the
> probe function as-is. To summarize, the driver changes will be:
> 
> 	j721e_pcie_ctrl_init()
> 		...Existing code...
> 	+	Add pm_runtime_put_sync() here to power off controller
> 		...Existing code to program strap settings...
> 	+	Add pm_runtime_get_sync() here to power on controller
> 		...Existing code...
> 
> Please let me know what you think.

I would've preferred changing the runtime PM calls as I suggested initially, but
still we would keep it incremented which brings the net effect to the same.

So you can drop my initial comment and post just this patch with improved patch
description.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


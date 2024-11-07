Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E72D4336F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=L8OS0pgj1ZavY8jEHok/4n7yXLvBNlE2Q+zahwVsK18=; b=a3ek0MZxMZHSMB
	AeTOUvLT9vnXAXsNeUSZzmKUTVIsh9j5dK/1HVtOsZk2NKXHDZQdnW/F3INqBC8Mcb8JD6npjhFpI
	3PQ+mz2BPDi9sunJSqkmIGKY2uFIM/LalDUfD31RWwcnF4AJ5tz9jCSGu7B5sBgr28r1QHinYpyql
	9iw3Vcni4Hv1yJ1CBlH/2Uga/mAPmMt9vyCLT9WY2OUozuV/oPo5u6p0cJlWzARAKd+f/bv3hHaZK
	2fLfVLkjH8z3sP6OVmF/euIMyKvJ0z8PY3WSD07yUUkztYlFJktHjPaDDd2kWLSQCtHxX+ALTY+w6
	1XvoqMjFVvt46CmVOJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94Hc-00000007Q2X-0JlE;
	Thu, 07 Nov 2024 15:18:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94Fs-00000007Pov-328Y;
	Thu, 07 Nov 2024 15:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0EE08A4475B;
	Thu,  7 Nov 2024 15:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65039C4CECC;
	Thu,  7 Nov 2024 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730992623;
	bh=nOBMM5Z93VYRrmS8VDCWfuHFU5UwC2F9O0lLn0o2yX8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MGUvqI+jo/oOe95SEnpU0MdcS1QG+6EAHLwXb22HVByyosqUJ2ld3+A/Jsc3ksIsV
	 tsk+CooPxFKM50j+ggAW22e8HAdvOaywix/308Su9xIUw6k48gSHo0iZ6DK9BFoa+u
	 w7nkBO3dHxPN0DKGlcSz/5weolwVrGAAXUNzWwiqfNc3JFM0vQ5FmxymzC72P0i2zU
	 EJIGbXVNzkAT9eqicqAbruZXV9NVN1efsScgwSuzam1Nnj5X2NHHm285VbSl7f7FAK
	 VlgT3UfBRtdn980Z4Ym4ezf5uTJGspy3KV7VZmAXkw+mYJXaAYLG2VcaV1V8lwnB8m
	 B6TkCpgLWNpFQ==
Date: Thu, 7 Nov 2024 09:17:01 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <20241107151701.GA1614390@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zyxuv-2SPuEXiL5R@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_071704_852996_B816EF2D 
X-CRM114-Status: GOOD (  25.88  )
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

On Thu, Nov 07, 2024 at 08:39:43AM +0100, Lorenzo Bianconi wrote:
> > On Wed, Nov 06, 2024 at 11:40:28PM +0100, Lorenzo Bianconi wrote:
> > > > On Wed, Jul 03, 2024 at 06:12:44PM +0200, Lorenzo Bianconi wrote:
> > > > > Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > > > > PCIe controller driver.
> > > > > ...

> > > > Is this where PERST# is asserted?  If so, a comment to that effect
> > > > would be helpful.  Where is PERST# deasserted?  Where are the required
> > > > delays before deassert done?
> > > 
> > > I can add a comment in en7581_pci_enable() describing the PERST issue for
> > > EN7581. Please note we have a 250ms delay in en7581_pci_enable() after
> > > configuring REG_PCI_CONTROL register.
> > > 
> > > https://github.com/torvalds/linux/blob/master/drivers/clk/clk-en7523.c#L396
> > 
> > Does that 250ms delay correspond to a PCIe mandatory delay, e.g.,
> > something like PCIE_T_PVPERL_MS?  I think it would be nice to have the
> > required PCI delays in this driver if possible so it's easy to verify
> > that they are all covered.
> 
> IIRC I just used the delay value used in the vendor sdk. I do not
> have a strong opinion about it but I guess if we move it in the
> pcie-mediatek-gen3 driver, we will need to add it in each driver
> where this clock is used. What do you think?

I don't know what the 250ms delay is for.  If it is for a required PCI
delay, we should use the relevant standard #define for it, and it
should be in the PCI controller driver.  Otherwise it's impossible to
verify that all the drivers are doing the correct delays.

I don't know what other drivers are using that clock.  Are you
suggesting that it may be used in non-PCI situations where the
required delay might be different?  If another user requires 250ms,
but PCI requires only 100ms, I think it would be worth having separate
delays in each user so PCI wouldn't have to pay that extra 150ms.

Bjorn


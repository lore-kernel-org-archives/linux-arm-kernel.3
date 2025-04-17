Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5B7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yRysYW1n/SXXGbN3Um4quCAmx4jd/ubhX4Dn+CBbQc=; b=krrA83zk7ZTd+ESeP6BDlBR2SS
	4knP0JIfBDLJHnOgZSDxE9FH1iYUVEdVz1Dy3LVggwBvUXcr9+2tYlHSi9pEJubNaIVKsQvCpBFhi
	G3I+dFHvOzVRe1osHim43BmY9eoPM5Nk3WLVRdhar3BXmHPFAf56sKQej/5Yv0YjKm+JzWysk1lhB
	bOdcAFDGOH5tL2beBTdO7beXIr6V8pbFo7N/R0ZGO7TEC3mPzvw4OO9juMrR1GfgkPyLEWV+tzVN+
	CZ3pFQMNWgIWdQofoDSQraSnfO2zdxFHe2EF1stif2HzN7k5e58s5eqsFtMauIBDA7U/vyCJ26lm7
	0cAaxoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RPO-0000000DYe7-1D4S;
	Thu, 17 Apr 2025 15:44:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QYp-0000000DNp6-0ots
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:49:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B52E5C563A;
	Thu, 17 Apr 2025 14:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA81C4CEEA;
	Thu, 17 Apr 2025 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744901390;
	bh=Y7Ov+PkxBtSJbpqygju98/xVM6r8zkCzNHMncrX/WXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWZa7Ns2UI35IUdO3AWf8Rgvxl3v9kLKuQYI+hh5qssiVNFy5XO9jMUJ3gjGg0U3v
	 BRIA+bdUMhKuujlECrD7v2xDS0S6tkimACnv4XoaVYh5taHq7WwQWI/Ub6bIzWmZW/
	 Z8c03WPWok5FCSkMk2k/3k0gLRW3CaSTLMJVR2Sguf8YjQ/tnMjm6T8yb937j1JmhC
	 auq7dICFiGF2Ll1Z9w2AkEKPzDt9xB78VJrFFAvkITwhF9JXgGVGYqeUzfWUCohEqk
	 OofrLr0IxCKnV4pJiSWv8Q4qp4D7k0Tx11kIBOBe37f7DK5KYLwZzp8bhomXvndna0
	 JNgQuI4KZFjbg==
Date: Thu, 17 Apr 2025 16:49:43 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 18/24] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aAEVB9GpJ2SxTd51@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-18-1f26db465f8d@kernel.org>
 <877c3uuy7u.ffs@tglx>
 <Z/YiLNzRvXUgcHFc@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/YiLNzRvXUgcHFc@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_074951_273662_D278E978 
X-CRM114-Status: GOOD (  19.82  )
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

On Wed, Apr 09, 2025 at 09:30:52AM +0200, Lorenzo Pieralisi wrote:

[...]

> > > +static int __init gicv5_of_init(struct device_node *node,
> > > +				struct device_node *parent)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = gicv5_init_domains(&node->fwnode);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	gicv5_set_cpuif_pribits();
> > > +
> > > +	ret = gicv5_starting_cpu(smp_processor_id());
> > 
> > You invoke the CPU hotplug callback for the boot CPU explicitly, but
> > what the heck installs the actual hotplug callback for the secondary
> > CPUs?
> 
> That comes with a subsequent patch[21]. I mentioned in the cover letter
> that I tried to split the functionality into interrupt types to ease
> review (well, it does not look like I succeeded, sorry) and then in
> patch [21] (when LPIs backing IPIs are implemented), enable SMP.
> 
> The point is, we need patches [18-21] to enable SMP booting.
> 
> I can squash [18-21] all together or I can enable the hotplug callback
> here but this patch stand alone is not functional for the reasons
> above, let me know please what's best in your opinion and I will do.

I would squash patches [18-21] for v2 because that's the only option to
have a single logical and functional SMP working entity, unless you are
against it.

We need IPIs for SMP booting, those are built on LPIs that in turn
requires the IRS code to function - I tried to split all this code
but whatever I came up with makes no sense from a functional
perspective.

The only thing I could do is taking SPI enablement code (SPI IRQs are
optional) out of [18-21] and make it a separate patch, to be honest
SPI management I don't think it is a lot of code so that won't change
much IMO.

Please let me know, thanks a lot.

Lorenzo


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41683C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 06:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pg1wO7RH2zJJHdvT6oW1p4tzR+LsCLRvaB+be90kvZg=; b=HL1SVesKnIP/U9aiB9LG4FjMOE
	5Zx1nInHxwHLExWciNhEX0Murl37vTBtoX49bldajmumy7MwAiRpbwRsgtr/Tp+CFnWmTB383HIJF
	n1+1z5mp5xInLfkBcR8qdzVxcYQRlsEQBAolikj737KsQnWG13GhE3buRvsFIT4veLp2cAZJfFB8J
	dIi2ToDBppgkbj2caO++AgxkRIU7FP1WENHWjd8UBe4d+UcWSr/3+CSp/S6t48bV8PLDCqn3rby6Z
	efbHMlTHGYHSdWP7EVXVTck+FtlDroLRHJJHTpsy+dbC1misl/Ctq/2ttRPwO4PzRv77AyZG08IVX
	RBC8NTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud1Tb-0000000Dy7r-0ZPr;
	Sat, 19 Jul 2025 06:55:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud1R8-0000000Dy0M-2r6r;
	Sat, 19 Jul 2025 06:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 555C0457D1;
	Sat, 19 Jul 2025 06:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7EAC4CEE3;
	Sat, 19 Jul 2025 06:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752907965;
	bh=6OH2X3Wst3e0vy94IdDlrw8pEvX7FDKjFs7Y/qkgnGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xKbO697jatzdRrok3rYuTBbyv8uR0uNOxEioC1xrZuTZJNDfY9ulx1P0yONafeWyS
	 AQntVtchLzGHw9/6TbYdhlZFHgCGrMFLVe22um6xdMjrqZ5867cidTVu/m90RtpCV5
	 ZbC3nSzJqX3/m1/V4xxVP6s321IisGi081KQRfis=
Date: Sat, 19 Jul 2025 08:52:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <2025071919-patience-cattishly-cf7c@gregkh>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
 <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_235246_767324_E5E5F803 
X-CRM114-Status: GOOD (  47.54  )
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

On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Hi,
> > > 
> > > Something that's been bugging me over the years is how some drivers have
> > > had to adopt file-scoped variables to pass data into something like the
> > > syscore operations. This is often harmless, but usually leads to drivers
> > > not being able to deal with multiple instances, or additional frameworks
> > > or data structures needing to be created to handle multiple instances.
> > > 
> > > This series proposes to "objectify" struct syscore_ops by passing a
> > > pointer to struct syscore_ops to the syscore callbacks. Implementations
> > > of these callbacks can then make use of container_of() to get access to
> > > contextual data that struct syscore_ops was embedded in. This elegantly
> > > avoids the need for file-scoped, singleton variables, by tying syscore
> > > to individual instances.
> > > 
> > > Patch 1 contains the bulk of these changes. It's fairly intrusive
> > > because it does the conversion of the function signature all in one
> > > patch. An alternative would've been to introduce new callbacks such that
> > > these changes could be staged in. However, the amount of changes here
> > > are not quite numerous enough to justify that, in my opinion, and
> > > syscore isn't very frequently used, so the risk of another user getting
> > > added while this is merged is rather small. All in all I think merging
> > > this in one go is the simplest way.
> > 
> > All at once is good, I like the idea, but:
> > 
> > > Patches 2-7 are conversions of some existing drivers to take advantage
> > > of this new parameter and tie the code to per-instance data.
> > 
> > That's great, but none of these conversions actually get rid of the
> > global structure, so what actually was helped here other than the churn
> > of this "potentially" allowing the global data variables from being
> > removed in the future?
> > 
> > So how does this actually help?
> 
> Thanks for pointing this out and letting me look at it again. Most of
> these actually do get rid of the global data variables. The MIPS patch
> doesn't because I forgot, but the __alchemy_pci_ctx is no longer used
> after the patch (except where it's initialized to the ctx variable, but
> that's no longer needed now). I've updated that patch.
> 
> The Ingenic TCU patch gets rid of it, and so do the clk/mvebu and
> irq-imx-gpcv2 patches. The two exceptions where it wasn't possible to
> get rid of the global data variables are mvebu-mbus and Tegra PMC, in
> both cases because there is other functionality that relies on the
> global variable. The bits that make it very difficult to remove these
> entirely is that they export functions that are called without context
> from other parts of code.

Ah, I must have looked at the wrong examples in the patch series, sorry.

> I have a fairly large series on top of this that converts the Tegra PMC
> driver to move away from this as much as possible. It's not possible to
> do on 32-bit ARM because there is some low-level CPU code that needs to
> call into this function. However, the goal is to at least make the PMC
> driver data completely instance-specific on 64-bit ARM so that we can
> support multiple instances eventually.
> 
> Maybe something similar could be done for mvebu-bus, but I'm not sure
> it's worth it. Typically for these cases you need some form of context
> in order to replace the global data. On Tegra we do have that in many
> cases (via DT phandle references), but I'm not familiar enough with
> mvebu to know if something similar exists.
> 
> My goal with this series is to get this a bit more established so that
> people don't use the lack of context in syscore as an excuse for not
> properly encapsulating things. These usually tend to go hand in hand,
> where people end up using a global data variable for syscore and since
> they can't get around that one, they keep using it for a bunch of other
> shortcuts.

I agree, I overall like this change, just expected to see more global
structures being able to be removed.

> > Also, small nit, make the function pointers const please :)
> 
> I originally tried that. Unfortunately, the struct syscore_ops contains
> a struct list_head to add it to the global list of structures. I suppose
> I could move the function pointers into a different structure and make
> pointers to that const, something like this:
> 
> 	struct syscore;
> 
> 	struct syscore_ops {
> 		int (*suspend)(struct syscore *syscore);
> 		void (*resume)(struct syscore *syscore);
> 		void (*shutdown)(struct syscore *syscore);
> 	};
> 
> 	struct syscore {
> 		const struct syscore_ops *ops;
> 		struct list_head node;
> 	};
> 
> Is that what you had in mind?

I missed the list_head, so yes, this would be better, but don't pass
back the syscore structure, how about just a void * instead, making the
whole container_of() stuff go away?

thanks,

greg k-h


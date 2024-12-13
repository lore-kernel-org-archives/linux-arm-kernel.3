Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1845DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qj5V9jM7yeXfqobJUv9aozaLzVRoXEay+ww3dHYrjew=; b=nuNShahUmjNNNuL8ez625VNgA2
	pwI3DMlXA6fAf9hZwiJZfHSnMA0/xjw08VPnTKwmeDgVUEZAEHvKbWuhCIpnMlweKqhLSjSP/miXC
	e7i6u8qm/R2coRaf0E8MpLbn3yvOVTBxK8ziAbcCzcIZ9I/nx25bnXZDqpShup52hYi83QbCy6bRY
	1HRUovkAWKaJDpoY0B+pdl46zRpV8jY3uaKKQtJCR8W/FjOmyqn95b5rKctHg0UnH3qMlAH0tjZ8n
	TqvYYrPGuEUS5NdGBEy/Taz9spc4CFKTAJqYBF6C6GMwIfL315A5Ww0UUrhlllkVJl5Xw/SHlFhaU
	/am8EFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8wO-00000004UcP-4ADj;
	Fri, 13 Dec 2024 16:55:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8rJ-00000004TCl-1H5m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:49:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B597C1480;
	Fri, 13 Dec 2024 08:50:11 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15C1F3F5A1;
	Fri, 13 Dec 2024 08:49:41 -0800 (PST)
Date: Fri, 13 Dec 2024 16:49:39 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: ryan.roberts@arm.com, catalin.marinas@arm.com, will@kernel.org,
	corbet@lwn.net, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Message-ID: <20241213164939.GD30314@mazurka.cambridge.arm.com>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-3-miko.lenczewski@arm.com>
 <87cyhxs3xq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyhxs3xq.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_084945_438240_D8C80D41 
X-CRM114-Status: GOOD (  28.04  )
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

On Thu, Dec 12, 2024 at 08:25:53AM +0000, Marc Zyngier wrote:
> Ah, so this is where this is hiding. I missed it in my review of patch
> #1 yesterday.
> 
> On Wed, 11 Dec 2024 16:01:38 +0000,
> Mikołaj Lenczewski <miko.lenczewski@arm.com> wrote:
> > 
> > The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
> > and this commit adds a dedicated BBML2 cpufeature to test against
> > support for.
> > 
> > In supporting BBM level 2, we open ourselves up to potential TLB
> > Conflict Abort Exceptions during expected execution, instead of only
> > in exceptional circumstances. In the case of an abort, it is
> > implementation defined at what stage the abort is generated, and
> 
> *IF* stage-2 is enabled. Also, in the case of the EL2&0 translation
> regime, no stage-2 applies, so it can only be a stage-1 abort.
> 
> > the minimal set of required invalidations is also implementation
> > defined. The maximal set of invalidations is to do a `tlbi vmalle1`
> > or `tlbi vmalls12e1`, depending on the stage.
> > 
> > Such aborts should not occur on Arm hardware, and were not seen in
> > benchmarked systems, so unless performance concerns arise, implementing
> 
> Which systems? Given that you have deny-listed *all* half recent ARM
> Ltd implementations, I'm a bit puzzled.
> 

I had tested on an earlier series of the patchset that didn't introduce
the MIDR checks (has_bbml2() only read the claimed level of support),
but otherwise had the same implementation.

> >
> > +static inline bool system_supports_bbml2(void)
> > +{
> > +	/* currently, BBM is only relied on by code touching the userspace page
> > +	 * tables, and as such we are guaranteed that caps have been finalised.
> > +	 *
> > +	 * if later we want to use BBM for kernel mappings, particularly early
> > +	 * in the kernel, this may return 0 even if BBML2 is actually supported,
> > +	 * which means unnecessary break-before-make sequences, but is still
> > +	 * correct
> 
> Comment style, capitalisation, punctuation.
> 
> > +	if (!system_supports_bbml2())
> > +		return do_bad(far, esr, regs);
> > +
> > +	/* if we receive a TLB conflict abort, we know that there are multiple
> > +	 * TLB entries that translate the same address range. the minimum set
> > +	 * of invalidations to clear these entries is implementation defined.
> > +	 * the maximum set is defined as either tlbi(vmalls12e1) or tlbi(alle1).
> > +	 *
> > +	 * if el2 is enabled and stage 2 translation enabled, this may be
> > +	 * raised as a stage 2 abort. if el2 is enabled but stage 2 translation
> > +	 * disabled, or if el2 is disabled, it will be raised as a stage 1
> > +	 * abort.
> > +	 *
> > +	 * local_flush_tlb_all() does a tlbi(vmalle1), which is enough to
> > +	 * handle a stage 1 abort.
> 
> Same comment about comments.
> 

Will fix.

Kind regard,
Mikołaj


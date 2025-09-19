Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC33CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rezV7vWcomrFYTNFQ1b+JfzxUwNii1PPW1DgulgkHE=; b=dLnjIhdDdGJhhrbv1nDaLbjDD9
	8zs0AuDz3k5xQV+tExHc5NjyeNuWkQuBTAh3WZnIx/fSMKXKeTeXa8jq6Xsw/88UZ//EGM8lvEYew
	/qXLpYt2ZYYxUCTbwargOXwsBMu/niC3t5Q/YwWTvFwWeviXhOuOxYJ5of68PT9cd2TGvHEt1+YeK
	IEPhxrHBt68uYnOmYuBeq5kSVjarpvn4c92HZoXWFDfs84Um3UGd0aSMbWWity44x17aDXSLH8gxQ
	/Ow1tm47uhBwcuWkxaGgOOxR9Wk/UacRBaKPo9nN6dGfdT33KOMVly/fONrJ4TvURMY72ga/+ND/f
	FjkXSGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZix-00000002kMK-3zov;
	Fri, 19 Sep 2025 11:56:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZiw-00000002kMA-030a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:56:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71E7B6013A;
	Fri, 19 Sep 2025 11:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB7AC4CEF0;
	Fri, 19 Sep 2025 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758282981;
	bh=2g66+OQbOGAUuogUvn9+t6VAr2aTSHBay+sw1hDooc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfC2hGf5WfHc9ZZKlDUiYPPOv1IgyTIvSrw11oXeh/kxHhhEK0c5dF5I5xZirlvZb
	 ohqfOhKt64jBwm8dPvrzIAchNQC76cXfOIgD270EA6XSVTp/j3xmZgT9PciA9fZOqG
	 T4OhFZ8a+knvgc/mM3bboHb5xP4N2LeZ9Yvr0w2hs6v4sbApfVNJZPy4hIcVLTYG37
	 3wUhwEptEpHllSdJXG4HAJgCM/ZPF3ZuTlvS1gY8AlGph3f1cuxsm+lpQuHwkL5htm
	 47bH0mcPQ3HIFSVkndmkYTLTOWcohN4N1FVTrv1BBGhUr7NQRGaHabTY3pMgPeR3/v
	 tz44Xirfuel1Q==
Date: Fri, 19 Sep 2025 12:56:15 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@redhat.com,
	lorenzo.stoakes@oracle.com, ardb@kernel.org, dev.jain@arm.com,
	scott@os.amperecomputing.com, cl@gentwo.org,
	Yang Shi <yang@os.amperecomputing.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v8 0/5] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Message-ID: <aM1E34lRjKg7nlRu@willie-the-truck>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <175822779944.710258.10028837182267037801.b4-ty@kernel.org>
 <fc43aa07-d4ad-47d5-8381-61d4a9b8c467@arm.com>
 <aM0-FQlepoxxGkRd@willie-the-truck>
 <ceaf604f-8ad7-4e19-812e-7eeace10d835@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceaf604f-8ad7-4e19-812e-7eeace10d835@arm.com>
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

On Fri, Sep 19, 2025 at 12:49:22PM +0100, Ryan Roberts wrote:
> On 19/09/2025 12:27, Will Deacon wrote:
> > On Fri, Sep 19, 2025 at 11:08:47AM +0100, Ryan Roberts wrote:
> >> On 18/09/2025 22:10, Will Deacon wrote:
> >>> On Wed, 17 Sep 2025 12:02:06 -0700, Yang Shi wrote:
> >>>> On systems with BBML2_NOABORT support, it causes the linear map to be mapped
> >>>> with large blocks, even when rodata=full, and leads to some nice performance
> >>>> improvements.
> >>>>
> >>>> Ryan tested v7 on an AmpereOne system (a VM with 12G RAM) in all 3 possible
> >>>> modes by hacking the BBML2 feature detection code:
> >>>>
> >>>> [...]
> >>>
> >>> Applied patches 1 and 3 to arm64 (for-next/mm), thanks!
> >>>
> >>> [1/5] arm64: Enable permission change on arm64 kernel block mappings
> >>>       https://git.kernel.org/arm64/c/a660194dd101
> >>> [3/5] arm64: mm: support large block mapping when rodata=full
> >>>       https://git.kernel.org/arm64/c/a166563e7ec3
> >>>
> >>> I also picked up the BBML allow-list addition (second patch) on
> >>> for-next/cpufeature.
> >>>
> >>> The fourth patch ("arm64: mm: split linear mapping if BBML2 unsupported
> >>> on secondary CPUs") has some really horrible conflicts. These are partly
> >>> due to some of the type cleanups on for-next/mm but I think mainly due
> >>> to Kevin's kpti rework that landed after -rc1.
> >>
> >> Thanks Will, although I'm nervous that without this patch, some platforms might
> >> not boot; Wikipedia tells me that there are some Google, Mediatek and Qualcomm
> >> SoCs that pair X4 CPUs (which is on the BBML2_NOABORT allow list) with A720
> >> and/or A520 (which are not). See previous mail at [1].
> > 
> > I'd be surprised if these SoCs are booting on the X4 but who knows.
> 
> Ahh. You can probably tell I'm a bit naive to some of this system level stuff...
> I had assumed they would want to boot on the big CPU to reduce boot time.

One of the problems is that the boot CPU becomes CPU0 and that inevitably
means it ends up being responsible for a tonne of extra stuff (interrupts,
TZ, etc) and in many cases can't be offlined. So it's all a trade-off.

> > Lemme have another look at applying the patch with fresh eyes, but I do
> > wonder whether having X4 on the allow list really makes any sense. Are
> > there any SoCs out there that _don't_ pair it with CPUs that aren't on
> > the allow list? (apologies for the double negative).
> 
> Hmm, that's a fair question. I'm not aware of any. So I guess the simplest
> solution is to remove X4 from the allow list and ditch fourth patch.

That's probably a good idea but I have a horrible feeling we _are_ going
to need your patch once the errata start flying about :)

So how about we:

  - Remove X4 from the list
  - I try harder to apply your patch for secondary CPUs...
  - ... if I fail, we can apply it next time around

Sound reasonable?

Will


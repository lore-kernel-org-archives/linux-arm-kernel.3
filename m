Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571D8E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hB8fcNdyeOAJx759nwam0y0AtPuvinsOwg/XIr99EEQ=; b=3+3N5mJtJQ+q/uD05cOCAHvsNj
	WacJzdx15Q6KfDBZWOSISq0gi4gFsP7p7Y+fr0fcxLHO6ErcTLRbMjKrYKorOGd1+pIe5U7L+8lPl
	taHefTyVoM95s4PHG52S1u4ljDA4ukKcflLOlgVbX+c3r+mdhX7CAwa40q+p7YrlHzIz+6pSn8Hsr
	SHonrn3rpfCzhzRSTSBARvnme8spMf2Wlu0yLpa9EyxPLpy56K5LfEeCbXvqlYyiO22L2SwOuG1jF
	LPvkoLj5hhwPbOJi9ois6Bvq0ThxcDDzMcFluSC6iv/7dT0zu178sNmS2uQm2oG+uW3cmPLY7xxLk
	1HkuAJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFD-0000000GKBt-3VGS;
	Wed, 11 Dec 2024 22:31:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVE9-0000000GK6k-0J6Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 22:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1591C5C67DF;
	Wed, 11 Dec 2024 22:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A6DC4CED2;
	Wed, 11 Dec 2024 22:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956240;
	bh=kEy+7GpAxC5wlzuKPjY6924MZlPCO9+PNji5bLINRCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpiqIEXeP61+yi8xk+xvq8O/4IW17T3EiQMXvmR0iweqVq3EpuYWBjEOKXoWNtBYc
	 2B6GIMb14hXxHPefgWSoF0BKNVGWOgQdDmUo0+/DmO1pS9HL9VM7nB/SspU7eJvY22
	 wXmqnpFgpte4CmRG0OObBgSMpDCJUoGmaKB3muFb3tB3ZlbsGct+q6hDHwOCkA42CG
	 djP3hbT6Of8YDgkqVyMdVEHdKumP7iVDb8dkcjhhaZuKABkZirycvCMJWBfyWVKIvZ
	 MnfmcTYYm9XLFUd1NNRAg5SkPuA4r5+Mabtjn4wMl3mqsT2ur0c89x1b7uqBaHQ9Mu
	 KATp9Z1uY+rlA==
Date: Wed, 11 Dec 2024 22:30:35 +0000
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, cl@gentwo.org, scott@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Message-ID: <20241211223034.GA17836@willie-the-truck>
References: <20241118181711.962576-1-yang@os.amperecomputing.com>
 <20241210113151.GC14735@willie-the-truck>
 <414b3388-c2e5-45ae-9f1d-c35310fdbf8b@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <414b3388-c2e5-45ae-9f1d-c35310fdbf8b@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143041_199762_CB2BF83B 
X-CRM114-Status: GOOD (  29.38  )
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

Hey,

On Tue, Dec 10, 2024 at 11:33:16AM -0800, Yang Shi wrote:
> On 12/10/24 3:31 AM, Will Deacon wrote:
> > On Mon, Nov 18, 2024 at 10:16:07AM -0800, Yang Shi wrote:
> > > When rodata=full kernel linear mapping is mapped by PTE due to arm's
> > > break-before-make rule.
> > > 
> > > This resulted in a couple of problems:
> > >    - performance degradation
> > >    - more TLB pressure
> > >    - memory waste for kernel page table
> > > 
> > > There are some workarounds to mitigate the problems, for example, using
> > > rodata=on, but this compromises the security measurement.
> > > 
> > > With FEAT_BBM level 2 support, splitting large block page table to
> > > smaller ones doesn't need to make the page table entry invalid anymore.
> > > This allows kernel split large block mapping on the fly.
> > I think you can still get TLB conflict aborts in this case, so this
> > doesn't work. Hopefully the architecture can strengthen this in the
> > future to give you what you need.
> 
> Thanks for responding. This is a little bit surprising. I thought FEAT_BBM
> level 2 can handle the TLB conflict gracefully. At least its description
> made me assume so. And Catalin also mentioned FEAT_BBM level 2 can be used
> to split vmemmap page table in HVO patch discussion
> (https://lore.kernel.org/all/Zo68DP6siXfb6ZBR@arm.com/).
> 
> It sounds a little bit contradicting if the TLB conflict still can happen
> with FEAT_BBM level 2. It makes the benefit of FEAT_BBM level 2 much less
> than expected.

You can read the Arm ARM just as badly as I can :)

 | I_HYQMB
 |
 | If any level is supported and the TLB entries are not invalidated after
 | the writes that modified the translation table entries are completed,
 | then a TLB conflict abort can be generated because in a TLB there might
 | be multiple translation table entries that all translate the same IA.

Note *any level*.

Furthermore:

 | R_FWRMB
 |
 | If all of the following apply, then a TLB conflict abort is reported
 | to EL2:
 | * Level 1 or level 2 is supported.
 | * Stage 2 translations are enabled in the current translation regime.
 | * A TLB conflict abort is generated due to changing the block size or
 |   Contiguous bit.

I think this series is trying to handle some of this:

https://lore.kernel.org/r/20241211154611.40395-1-miko.lenczewski@arm.com

> Is it out of question to handle the TLB conflict aborts? IIUC we should just
> need flush TLB then resume, and it doesn't require to hold any locks as
> well.

See my reply here:

https://lore.kernel.org/r/20241211210243.GA17155@willie-the-truck

> And I chatted with our architects, I was told the TLB conflict abort doesn't
> happen on AmpereOne. Maybe this is why I didn't see the problem when I
> tested the patches.

I'm actually open to having an MIDR-based lookup for this if its your own
micro-architecture.

Will


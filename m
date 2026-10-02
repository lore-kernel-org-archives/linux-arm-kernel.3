Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5841DCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dw5VpnYB+kyGsgSxBW2FtHebtdgDw0DL49e71hmevo=; b=0QJgVwe+SFe3yB05G6ECT31dJr
	qIZgiUNMXGZQcdWfAmwGWAf7ogXM4Dm0D7gz1/l3VMFAqR29S6Seid3oP5poIxCO9g+qlvI/CTlgz
	uGWfFO45Go6tNSrLEigSgEElviAiK2vkf5WfPCm7a5lGr3GU8UJzNnhtr76Tk1kGjGsppJ0yN+IMc
	UvFOSeUtvrE4ytlyR30VQNzZnKW+ajEkG3fU9lkFIGlv/KirSJlmgjji5dzvnLK48nFHIU/HHbSvF
	B/8Fxv77WrhE5SaXxKopVEipJsEuSehTfLXcZosisRmKWax6TuBKnuU58bsKtgqS0FW8lFxDKN1MN
	gd4YNuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfMP-0000000BxR5-1BWh;
	Fri, 02 Oct 2026 15:39:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfMN-0000000BxQ2-21DJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:39:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FD68143D;
	Fri,  2 Oct 2026 08:39:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 778773F85F;
	Fri,  2 Oct 2026 08:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790955581; bh=bCHHV+bKapdhem/5Gw07QRVQmx273u4r4ya6MRuIaLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQlucJF3nCd3Q+W9IKGllP6HZAeJS5hlx2iPXCTShV428J1pInz1TXhm/pJoTDqi0
	 yBqYvk2QgrNN8eLXJiWtS9pz/SpG69nGwUlsEwE6e84+WyUEviA7S6xj7CW6FlMGgO
	 n94Erbaa8gMK8hyWkFn5am6J4ee8Et+NtIir9IVQ=
Date: Fri, 2 Oct 2026 16:39:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <ar_QOXqCYTGargBe@arm.com>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck>
 <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck>
 <ar_E5HUSTxMSRZhL@arm.com>
 <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083943_571327_48552E2A 
X-CRM114-Status: GOOD (  13.47  )
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

On Fri, Oct 02, 2026 at 04:24:06PM +0100, Fuad Tabba wrote:
> On Fri, Oct 02, 2026 at 03:51:16PM +0100, Catalin Marinas wrote:
> > I couldn't figure out the #8 either. I wonder whether it's more readable
> > as (untested):
> >
> >     sub    x1, x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> >     cmp    x1, #(ID_AA64DFR0_EL1_PMUVer_IMP_DEF - ID_AA64DFR0_EL1_PMUVer_V3P9)
> >     b.hs    .Lskip_pmuv3p9_\@    // Skip unless V3P9 <= PMUVer < IMP_DEF
> 
> This looks correct to me.
> 
> That said, if readability is the goal, I think the plainest is two
> compares and two branches. It's one more instruction, but this runs
> once at boot:
> 
>       cmp     x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
>       b.eq    .Lskip_pmuv3p9_\@
>       cmp     x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
>       b.lt    .Lskip_pmuv3p9_\@
> 
> I used ccmp to match __init_el2_debug in the same file, which does the
> same NI/IMP_DEF check with a raw #4, as does reset_pmuserenr_el0 in
> assembler.h (and hyp-entry.S uses the same pattern for HVC64/HVC32).

I'll leave it to Will. My preference is whatever is more readable, no
need to optimise another cycle or two here.

-- 
Catalin


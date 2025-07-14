Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70560C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PM10Kp8mCilRAyKaY71oAFxnuRStCHW0ElWU+qFqtbE=; b=z/fnmS8YiUqMAClrBQKD5/7Jer
	Rs3dbaT9yGSKZNw7EojNdGZcHpQBETrCxGu3j1zcofcP/Pk/bfEe8QJQ5tAIlWNoyziyzBiX5nu+R
	sHDzBsvH/x8YSyB7bq6HL0m9S+L984Ud6ey/dBLZNe4CTRmNRlB5YTm0d4cqbkeA6GwiLgwicE1Tv
	GsoG6aGSXmPIX311zx0AePYqub6pQlyacXuVQkBK3yhp5FEuFdeSkbST5a1OZtsPRQi3dfd4u3C37
	jFSZTppPNovZtid8tiHBTMeSl++/wClqpyryXk52IIaCVn6tQ63LWVgY93jynMnrtKB4pzSt4pU6w
	+ELd6Jfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMXA-00000002u3S-0a46;
	Mon, 14 Jul 2025 17:00:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKsN-00000002cED-1yhf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:13:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F10925C56D3;
	Mon, 14 Jul 2025 15:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB0DC4CEED;
	Mon, 14 Jul 2025 15:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506034;
	bh=RuTTRF7OLwegrBFSoaHi4OhveSoA5z5OHfS0WesWSuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+IenNAqGRh3utgTHbU95cdolX0hyF8IdKHgHUb52s/JXLkdkEldqVryb0omxuXsz
	 0YL1T4sfEVKl77sBUWlejocHJFsajqM6o8YJors6H+r7GpJA+DByC4L6/LqQRkh1CQ
	 wlJZv5gAnOT0V3OsibUduvv/My1hxIOiMVpBiq1bAlRKA2Edc5W3gM/jU+1NFDc18n
	 H6Aictxnpex/XU4uXcEs+VouMVCVFTHVoNwy6AIjwAj5CJO5mbJoCMAtAbV3yY/E8W
	 0gvfxsbYsEVYTEBhq8jrtJivc6z7ZPTT1bhuFHYzZG0OdtCoJWWlravWtQU1v/tdsu
	 3eSKEk5HzSsOw==
Date: Mon, 14 Jul 2025 16:13:49 +0100
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	German Gomez <german.gomez@arm.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 01/14] drivers/perf: arm_spe: Expose event filter
Message-ID: <aHUerfpLyAPEc9R_@willie-the-truck>
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
 <20250707-arm_spe_support_hitm_overhead_v1_public-v3-1-33ea82da3280@arm.com>
 <aHUBFGPck-O3vs9b@willie-the-truck>
 <20250714150921.GE1093654@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714150921.GE1093654@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081355_602389_5A8E3286 
X-CRM114-Status: GOOD (  26.74  )
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

On Mon, Jul 14, 2025 at 04:09:21PM +0100, Leo Yan wrote:
> On Mon, Jul 14, 2025 at 02:07:32PM +0100, Will Deacon wrote:
> 
> [...]
> 
> > > +static u64 arm_spe_pmsevfr_res0(u16 pmsver)
> > > +{
> > > +	switch (pmsver) {
> > > +	case ID_AA64DFR0_EL1_PMSVer_IMP:
> > > +		return PMSEVFR_EL1_RES0_IMP;
> > > +	case ID_AA64DFR0_EL1_PMSVer_V1P1:
> > > +		return PMSEVFR_EL1_RES0_V1P1;
> > > +	case ID_AA64DFR0_EL1_PMSVer_V1P2:
> > > +	/* Return the highest version we support in default */
> > > +	default:
> > > +		return PMSEVFR_EL1_RES0_V1P2;
> > > +	}
> > > +}
> > 
> > Hmm. This logic was already a little shakey and so I'm not sure it's a
> > good idea to expose it directly to userspace. Maintaining RES0 masks for
> > different versions of SPE won't scale and there are already things that
> > we can't sensibly handle. For example, E[8]:
> > 
> >   | When (FEAT_SPEv1p4 is implemented or filtering on event 8 is
> >   | optionally supported) and event 8 is implemented:
> > 
> > So, stepping back, can we remove this stuff altogether? The bits are
> > RAZ/WI in the case that the even is not implement, but that means that:
> > 
> >   | Software can rely on the field reading as all 0s, and on writes being
> >   | ignored.
> > 
> > so why are we even bothering to police this?
> 
> It's fine with me to remove the validation for the event filter.
> 
> However, I have the following question in comment below.
> 
> > In other words, remove arm_spe_pmsevfr_res0() and the two checks that
> > use it in arm_spe_pmu_event_init(). If userspace tries to filter events
> > that aren't implemented, then it gets to keep the pieces.
> 
> Then the question is: what information should be exposed to userspace
> so that tools can decide which events are valid?
> 
> I would suggest to expose a new entry, "caps/version", to indicate the
> SPE version number. Tools can use this to apply the appropriate event
> validation. Please let me know if this works for you.

I thought userspace typically had midr-based json files to figure this
stuff out? The supported events aren't probe-able afaict so I don't
think the driver can help.

Will


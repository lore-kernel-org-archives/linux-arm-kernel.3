Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33248C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUOYHvHjgF3mlkKAKEU2mycmlQYv6R0nibD5ePdnhcU=; b=DVD2sf60L9txQNw8eg6Z7Brupq
	Wa8mH/YQzFaJ3YG418ZG6Zv06ssfsPYydD5hslCLCezVZQ096UFBKaPjAtkozDXatjbFKhHfFRAnd
	wXBPF0RVMolyDQz5OwWbQOwnARw40EhPcqhwEaGsTdsBHChGwXpMZ6Y32axde/Fa/meyPZaR68sx/
	7JWseNEk7NaiiULCab21qc1lSTDwsRO8pjKEFVF037ZtI1ehtUgFEHYbCQUVhZ71vATZb4EjDWTNt
	rlp/kmweN+s2tBSJMLQEKxpUMpXuitSap2OvxpFIia4TP5iyaPNze05I1ezLVfXtCnmT2cENgMfHZ
	9Dv/JZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOI2-0000000ACvY-0mc4;
	Thu, 17 Jul 2025 13:04:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucN1l-0000000A0FU-2RAh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 11:43:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C3A35C68CB;
	Thu, 17 Jul 2025 11:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90063C4CEE3;
	Thu, 17 Jul 2025 11:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752752632;
	bh=6uGhnGeIROplMLbWKJi+hQJH1Pv8f8Jn73TRI+B3DjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWDFeqpu1wpW9lQnbm7r3vnK65+k2/8NqWUgTzdpBDYXQ4LjXVGKwfqjGwiLa6//F
	 zVT0g2+P2X1lBoIowaCY5SwmSZmF3WGCesIC78MypjeoNcBm/yNgnCfpzThxEyhTUF
	 aWgt8ExwkjEyfMQChTtPw1svY7EoKBITHmidm3sFsjsfzGQtIklK6B6H+8geOTfBmQ
	 Cnh5iy1auCZ1lhAYnJTvf/lM4LS1ooDOv+hqyYLZtH6g5O8rA4KTb3uZVG+PpQF2va
	 MxFevnQ2ajttxyILn3m2GvXwbWvAlU5rVcUKBAKfZJlDEuoQ4D8X1yjWo0z08sRqcQ
	 NOpIwoHebajuQ==
Date: Thu, 17 Jul 2025 12:43:46 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <aHjh8sqeEPQDVg0z@willie-the-truck>
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
 <20250707-arm_spe_support_hitm_overhead_v1_public-v3-1-33ea82da3280@arm.com>
 <aHUBFGPck-O3vs9b@willie-the-truck>
 <20250714150921.GE1093654@e132581.arm.com>
 <aHUerfpLyAPEc9R_@willie-the-truck>
 <20250714154251.GF1093654@e132581.arm.com>
 <f3393b26-a1ca-4d8f-9c22-0330956090b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3393b26-a1ca-4d8f-9c22-0330956090b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_044353_700828_852E90F1 
X-CRM114-Status: GOOD (  26.33  )
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

On Tue, Jul 15, 2025 at 12:15:07PM +0100, James Clark wrote:
> On 14/07/2025 4:42 pm, Leo Yan wrote:
> > On Mon, Jul 14, 2025 at 04:13:49PM +0100, Will Deacon wrote:
> > 
> > [...]
> > 
> > > > > In other words, remove arm_spe_pmsevfr_res0() and the two checks that
> > > > > use it in arm_spe_pmu_event_init(). If userspace tries to filter events
> > > > > that aren't implemented, then it gets to keep the pieces.
> > > > 
> > > > Then the question is: what information should be exposed to userspace
> > > > so that tools can decide which events are valid?
> > > > 
> > > > I would suggest to expose a new entry, "caps/version", to indicate the
> > > > SPE version number. Tools can use this to apply the appropriate event
> > > > validation. Please let me know if this works for you.
> > > 
> > > I thought userspace typically had midr-based json files to figure this
> > > stuff out?
> > 
> > Yes, the perf tool records the CPU MIDR in the metadata.
> > 
> > However, I deliberately tried to avoid relying on this approach,
> > because the perf would then need to maintain a mapping between:
> > 
> >    MIDR -> Arm SPE version -> Events
> > 
> > Given the large number of CPU variants, maintaining this relationship
> > between CPU ID and SPE version, and subsequently mapping it to supported
> > events, would be quite complex. Additional effort would be required each
> > time a new CPU variant is introduced.
> > 
> > > The supported events aren't probe-able afaict so I don't
> > > think the driver can help.
> > 
> 
> If the RAZ/WI for not implemented is guaranteed, can we not discover the
> supported filter by writing all ones and reading back what stuck?

That might be the best option.

Looking back at older versions of the architecture, unallocated fields
in PMSEVFR_EL1 were RES0 in revision D.a of the Arm ARM but everything
became RAZ/WI in revision D.b, so the whole reason we were maintaining
these masks in the driver is no longer relevant.

As you say, we can just probe the thing and report the result back to
userspace.

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CCDC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjUBBHVw1ydUK2XOgvfP7pnewWiYehu7g9bzmhYmqv0=; b=4ce/N4gzQEhkVmmFDD+xy0AlXh
	sbD/1iARa0MqvBBEF5vOQLIVog1ROt1wJxut909m/OZRjDF0RHTaIEMeMZ//4a9Oyl764i62Aga94
	PRviw5H410bObCjBIG/0w3kO9eAnHV6v1mVEB36K59ZB0eqhkJ7MzhKdBgjjt7HqJX/DxBIOIaE9K
	OJZ7vTJjELHVWSxxG3NoJ8lbEFS36PgsV0fv785uQTxjR/ZOOdf+1f/M3IeDP6iAb+qGiILAmUq3U
	s9PiCqfTX0iSc2u6/zs8J1A90KTBh3sJThbyuNxZJPPAWzqxZR3a/s71nayvs3lvQ2ne5mHnTWSBh
	lIp8kGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPmn-0000000DX5M-37zL;
	Tue, 20 May 2025 16:25:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPXe-0000000DSo9-3jtx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 16:10:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BCAB1516;
	Tue, 20 May 2025 09:09:56 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 211903F5A1;
	Tue, 20 May 2025 09:10:09 -0700 (PDT)
Date: Tue, 20 May 2025 17:10:03 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 07/10] perf: arm_spe: Add support for filtering on data
 source
Message-ID: <20250520161003.GT412060@e132581.arm.com>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-7-dd480e8e4851@linaro.org>
 <20250520134632.GR412060@e132581.arm.com>
 <443141db-6950-4a15-83be-ad9e9c0e03a0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <443141db-6950-4a15-83be-ad9e9c0e03a0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_091011_023992_ED4C6B01 
X-CRM114-Status: GOOD (  30.49  )
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

On Tue, May 20, 2025 at 04:00:59PM +0100, James Clark wrote:
> On 20/05/2025 2:46 pm, Leo Yan wrote:
> > On Tue, May 06, 2025 at 12:41:39PM +0100, James Clark wrote:
> > > SPE_FEAT_FDS adds the ability to filter on the data source of packets.
> > > Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
> > > when any of the filter bits are set.
> > > 
> > > Each bit maps to data sources 0-63 described by bits[0:5] in the data
> > > source packet (although the full range of data source is 16 bits so
> > > higher value data sources can't be filtered on). The filter is an OR of
> > > all the bits, so for example setting bits 0 and 3 filters packets from
> > > data sources 0 OR 3.
> > 
> > As Arm ARM says:
> > 
> >    0b0 : If PMSFCR_EL1.FDS is 1, do not record load operations that have
> >          bits [5:0] of the Data Source packet set to <m>.
> >    0b1 : Load operations with Data Source <m> are unaffected by
> >          PMSFCR_EL1.FDS.
> > 
> > We need extra handling for this configuration (0b0 means filtering,
> > 0b1 means no affaction):
> > 
> > - By default, the driver should set all bits in the 'data_src_filter'
> >    field.
> > 
> > - The perf tool needs an extra patch in userspace to initialize all
> >    bits in config4 unless user specify other values.
> > 
> 
> Did you take into account PMSFCR_EL1.FDS being set automatically?

Good point. TBH, I did not give it enough consideration until your
remdinding, but let me elaborate on why I suggested the approach above.

> I think the wording is slightly confusing but I tested it on the model and it works.
> 
> If PMSFCR_EL1.FDS == 0 then PMSDSFR_EL1 does nothing, and if the data source
> filter isn't set by the user then FDS isn't set so there's no need to set
> all the bits in the filter to 1. Once the user asks for any filter then we
> set FDS, at which point it's whatever filter they asked for. They can set
> all the bits if they want, or just one.
> 
> This is same way PMSFCR_EL1.FT already works. If the user asks for any
> filter then it's set automatically, but we don't allow the user to ask for
> "no filters" but with FT set.
> 
> So the only thing we can't do is filter out samples with _any_ data source.
> Which would be PMSFCR_EL1.FDS == 1 and PMSDSFR_EL1 == 0. But I don't think
> that's useful, and there are other filters to get you all or most of the way
> there.

My suggestion is coming for handling the case you mentioned.  Let us see
the combinations:

 PMSFCR_EL1.FDS == 0
 PMSDSFR_EL1 == 0xFFFF,FFFF,FFFF,FFFF
   No filtering on data source

 PMSFCR_EL1.FDS == 1
 PMSDSFR_EL1 == 0xFFFF,FFFF,FFFF,FFFF
   No filtering on data source

 PMSFCR_EL1.FDS == 0
 PMSDSFR_EL1 == 0x0
   No filtering on data source

 PMSFCR_EL1.FDS == 1
 PMSDSFR_EL1 == 0x0
   Filtering on all data source

If 'PMSFCR_EL1.FDS == 0 and PMSDSFR_EL1 == 0xFFFF,FFFF,FFFF,FFFF' is
initialized state, when a user set all bits to '1' for the data source
filter, then no matter we enable or disable FDS bit, it can work as
expected for disabling filtering.

If 'PMSFCR_EL1.FDS == 0 and PMSDSFR_EL1 == 0x0' is the init state, as
you said, when user passed 0xFFFF,FFFF,FFFF,FFFF for data filter, we
cannot distinguish it from the init state, as a result, we will fail
to handle this case.

How about you think?

Thanks,
Leo


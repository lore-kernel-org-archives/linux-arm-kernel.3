Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A021C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7kXI1jBKPAC8RP9tx7Nca/HoTGKyGC+5OHf5U04hXY=; b=J0Pzf15EGvyQ/KHBfW663mYZLS
	cztzXs0oGrIbXwUN2VKKgTPMaWSOcvRZAsc8mhx/13uA/DccMbHdBLgPofeufj+Pjf0SCxi5MBnWV
	DMIs/ANXkb1vhyE7zwUrpVkDDHE6GlHu3q97ZnsqCKw5ZuDSxFEfIB5kez5Vq3GljeFtXTE0Rknc3
	z3RprZk97+dF+63Lr15xvZ8F2haF12KhvEz/seCJ+wMlP9X4ewXdtIU+kgFvW710ga885QDWFBeGq
	9Z/rLkiceFKmEjNk1gIAKH99ct7cG9a62v4GvwlTrMZdK58+ACMDhDpTpPiuIz9fg5NdZPMm04Hp1
	Md0YYmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAsX-00000001z3N-4A2A;
	Mon, 03 Mar 2025 18:51:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAqx-00000001ysj-0gmf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 18:49:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BC63106F;
	Mon,  3 Mar 2025 10:49:36 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A063D3F5A1;
	Mon,  3 Mar 2025 10:49:21 -0800 (PST)
Date: Mon, 3 Mar 2025 18:49:17 +0000
From: Leo Yan <leo.yan@arm.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>,
	Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/12] perf script: Make printing flags reliable
Message-ID: <20250303184917.GJ2157064@e132581.arm.com>
References: <20250217195908.176207-1-leo.yan@arm.com>
 <20250217195908.176207-2-leo.yan@arm.com>
 <34795c29-d256-49ce-9d01-435f8cd91611@intel.com>
 <20250303162210.GH2157064@e132581.arm.com>
 <447bcafc-4c47-4b95-bf21-7aee2cb6a629@intel.com>
 <20250303181152.GI2157064@e132581.arm.com>
 <c227a1c2-13a4-4078-87ee-ed3fe0638060@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c227a1c2-13a4-4078-87ee-ed3fe0638060@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_104923_246573_BBFA3D9E 
X-CRM114-Status: GOOD (  21.47  )
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

On Mon, Mar 03, 2025 at 06:56:42PM +0200, Adrian Hunter wrote:
> On 3/03/25 20:11, Leo Yan wrote:
> > On Mon, Mar 03, 2025 at 05:05:13PM +0200, Adrian Hunter wrote:
> > 
> > [...]
> > 
> >>>>> +	ret = max(ret, SAMPLE_FLAGS_STR_ALIGNED_SIZE);
> >>>>> +	return fprintf(fp, "  %-*s ", ret, str);
> >>>>
> >>>> -21 means the field width is 21 and left-justified.  It should not
> >>>> truncate the string.
> >>>
> >>> No, it does not truncate the string.
> >>>
> >>> It calculates a maximum value between the returned length and 21 (
> >>> defined in SAMPLE_FLAGS_STR_ALIGNED_SIZE).  It keeps left-justified and
> >>> can printing a complete string if the string length is bigger than 21.
> >>
> >> Maybe I am missing something, but that isn't that what
> >>
> >> 	return fprintf(fp, "  %-21s ", str);
> >>
> >> does anyway?  Why change it to something more complicated.
> > 
> > You are right.  I should have done an experiment for this.
> > 
> > I will remove the max() sentence and update the last line:
> > 
> >         return fprintf(fp, "  %-*s ", SAMPLE_FLAGS_STR_ALIGNED_SIZE, str);
> > 
> > Another option is to drop this patch.  But I prefer to keep it, the
> > reason is except the benefit for the debugging log, an extra reason is
> > the SAMPLE_FLAGS_STR_ALIGNED_SIZE macro is used to replace the opened
> > value '21'.  The macro also will be used by a later patch for
> > right-alignment printing.  How about you think?
> 
> Sure

Thanks a lot for confirmation and review!

I will send new version in my tomorrow.

Leo


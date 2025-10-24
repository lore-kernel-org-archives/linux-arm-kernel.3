Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C547CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9DRYThnYgPV4Rdidy87/7h4Dr4ZJiQ1L59J0s5rySc=; b=xVo/Sk9kGBxBwpviAuYSH8FfXg
	CTTkc7vR5e25WT7FyyDcmnFqsq5u/4PaZ6Jhk90/YouV9WzGLsIpLVo8gKPAu6knI+2U+23v762M5
	GcEVjmsG8Ur5x4pxNno/+c19wZl0BGeXJCByFN/CKxRwSfaDty5jWjFO2dPc4A2lr9m/mDvBOk+bz
	2HcJ+AEFlJu1+4iqEkS7AlXe/8l1b7SyVTMUVOxb3tEK0cWiXFN5C3s1WF9pfG2+IV1AFOdy4QoH0
	k7Qmh1/cA0bBicgekdzFtEspjfklnqWjqQDbEVFdnQwzE1AJVBowsHpxJFlrSRp2Grd0pfSjTZ2ag
	WOZmUmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCsf-00000008dYs-1cJ7;
	Fri, 24 Oct 2025 08:10:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCsb-00000008dXV-1MPw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 08:10:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DCC1175A;
	Fri, 24 Oct 2025 01:10:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E93043F66E;
	Fri, 24 Oct 2025 01:10:31 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:10:29 +0100
From: Leo Yan <leo.yan@arm.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: tanze <tanze@kylinos.cn>, james.clark@linaro.org, leo.yan@linux.dev,
	irogers@google.com, john.g.garry@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	graham.woodward@arm.com, mike.leach@linaro.org
Subject: Re: [PATCH v2] perf arm_spe: Add a macro definition to handle offset
 value
Message-ID: <20251024081029.GT281971@e132581.arm.com>
References: <20251016083019.27935-1-tanze@kylinos.cn>
 <20251017021540.45930-1-tanze@kylinos.cn>
 <22b7b11e-b1fe-4d9d-8749-afe57ea1c35c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22b7b11e-b1fe-4d9d-8749-afe57ea1c35c@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_011033_397475_DCDD4B5E 
X-CRM114-Status: GOOD (  14.14  )
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

On Fri, Oct 24, 2025 at 09:27:25AM +0300, Adrian Hunter wrote:

[...]

> > --- a/tools/perf/util/arm-spe.c
> > +++ b/tools/perf/util/arm-spe.c
> > @@ -1732,7 +1732,7 @@ arm_spe_synth_events(struct arm_spe *spe, struct perf_session *session)
> >  	attr.sample_period = spe->synth_opts.period;
> >  
> >  	/* create new id val to be a fixed offset from evsel id */
> > -	id = evsel->core.id[0] + 1000000000;
> > +	id = evsel->core.id[0] + PERF_SYNTH_EVENT_ID_OFFSET;
> >  
> >  	if (!id)
> >  		id = 1;
> 
> Functionally this is to find a free range of IDs for synthesized events,
> but also the range can only have one user e.g. in this case auxtrace
> 
> So add to auxtrace.c
> 
> #define AUXTRACE_SYNTH_EVENT_ID_OFFSET	1000000000ULL
> 
> /*
>  * Event IDs are allocated sequentially, so a big offset from any
>  * existing ID will reach a unused range.
>  */
> u64 auxtrace_synth_id_range_start(struct evsel *evsel)
> {
> 	u64 id = evsel->core.id[0] + AUXTRACE_SYNTH_EVENT_ID_OFFSET;
> 
>   	if (!id)
>   		id = 1;
> 
> 	return id;
> }
> 
> And then use that:
> 
> - 	/* create new id val to be a fixed offset from evsel id */
> -	id = evsel->core.id[0] + 1000000000;
> +	id = auxtrace_synth_id_range_start(evsel);
> -
> -	if (!id)
> -		id = 1;

Agreed, much better than I suggested!

Just remind updating subject as well, like:

  perf auxtrace: Refactor AUX event ID calculation
  perf auxtrace: Add auxtrace_synth_id_range_start() helper

Thanks,
Leo


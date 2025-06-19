Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D98C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tb7i30Yo4se+H/J2FKmNUhvrml1KqY14zfxeonJpX2Y=; b=qj1LXK7qmhka2lY1pSJy9hufCL
	QLx2fcKanCVOG62CBF6fLZRWW1EyiAcXiIC+hxKGUMKvwniAbJYltimgNzu3ZDOZEiDcdjvzvEJ12
	u+jdvBaH8drQUH5ajmBn7e5RAR4YxY+UhMHZdS+AS14y1viSRelYPEyjTprq31vPU85amSZJdewPE
	rh7KRy/z6SnOj4KVtiAJV8ih4JlSyL/Lq/r4cA9qyj2nI4Pn/fEmNIyCvU0iWurs8O92BzXJrgngp
	ei8EqlO37VaQH7OktHMN1j/h+bPMyoX5SAFmArdyf3oeXz3wsxtSv1dVDSBEY72Wr09SRl+VRl+BH
	wPJHLq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKBY-0000000DyAW-01KE;
	Thu, 19 Jun 2025 18:40:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSINv-0000000DdGh-1hDW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:45:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 257D61063;
	Thu, 19 Jun 2025 09:44:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A83C3F66E;
	Thu, 19 Jun 2025 09:45:05 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:45:03 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 03/12] perf arm_spe: Correct setting remote access
Message-ID: <20250619164503.GJ794930@e132581.arm.com>
References: <20250613-arm_spe_support_hitm_overhead_v1_public-v1-0-6faecf0a8775@arm.com>
 <20250613-arm_spe_support_hitm_overhead_v1_public-v1-3-6faecf0a8775@arm.com>
 <5c88ba9f-2627-486c-84d1-2a721ff9ffcc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c88ba9f-2627-486c-84d1-2a721ff9ffcc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_094507_489474_CDE08B0F 
X-CRM114-Status: GOOD (  21.84  )
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

On Thu, Jun 19, 2025 at 02:53:37PM +0100, James Clark wrote:
> 
> 
> On 13/06/2025 4:53 pm, Leo Yan wrote:
> > Set the mem_remote field for a remote access to appropriately represent
> > the event.
> > 
> > Fixes: a89dbc9b988f ("perf arm-spe: Set sample's data source field")
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   tools/perf/util/arm-spe.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> > index d46e0cccac99a36148b4daa37f2bf2342e6b47ef..fdef6f743cf3c76b1dcdd57f5a2c297642fdd21a 100644
> > --- a/tools/perf/util/arm-spe.c
> > +++ b/tools/perf/util/arm-spe.c
> > @@ -839,7 +839,7 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
> >   	}
> >   	if (record->type & ARM_SPE_REMOTE_ACCESS)
> > -		data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
> > +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> 
> Should this not avoid overwriting mem_remote if it's already set by
> arm_spe__synth_ds()? We do that for mem_lvl above.

Here it does not overwrite to zeros if the 'mem_remote' field has been
set. It is harmless to overwrite 1 if it has been set.

I will add a condition for consistency.

> We also still set mem_lvl = PERF_MEM_LVL_REM_CCE1 in
> arm_spe__synth_data_source_common(), if it's not right it should probably be
> changed there too.

I will change to PERF_MEM_LVL_NA / PERF_MEM_LVLNUM_NA in
arm_spe__synth_data_source_common() for remote socket access.

Thanks!


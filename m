Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2030C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZT8WrXrKJY/qGzHZTz/lpJrq9iHVB5/lc2cqaxHQ3z4=; b=MvBrX5p9KqRHDn7g8AQVuJ+KLV
	yEcKxtuv58hMRHITuixIA5S2FHpaSF6ZyWvJDRMLhdHkbIgXfRl52yIG/BJYlgGI97JJiFtsWh0hW
	fGaNO7Q6KZluXlxm/6APMPNYNingAfxZJEvQeRcZ1mIGOgiQwfTRPWLqHqbbkGwfWGTsOoD+jafqv
	cClRuIpeQ4hGSzz10dXJoj6XFY9xRH4+Egd6ieip0bHBb+bXNpHmVX4M+gQk8MkuFtPaII1aLc2PO
	B9OVfIuHHglUgZuc6dyAazJ+Uhw5xaO5WZxZ+3tJFlBzjdhEVr8rg++h46zQr/X9sdlJn91BCeWpo
	V5aAi2lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzejc-00000004bjE-0vb6;
	Thu, 27 Aug 2026 18:21:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzejZ-00000004bhm-1m4Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:21:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B1681688;
	Thu, 27 Aug 2026 11:21:48 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A39303F66F;
	Thu, 27 Aug 2026 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787854912; bh=rUd7+J/8/iNJI3bKZQzX3i/RyNWMQTasR2RA1ttzPaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iob+HDAGtrc0jBrbEfWc/4fcivNp0bnI9NUeUJhCK1UBLaNzPhwgKnUCsNLRrHoIX
	 fuyU7Ggy4b7+Tlzg9spHJZunbmB7Zf6sRtQcJSywt9AAN+fEcachMrlOPH1IkJ8kpm
	 VIlZVsnAUEeNLjMZACsqGm/mQoTIoiSH3glLfpUw=
Date: Thu, 27 Aug 2026 19:21:49 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 11/14] perf auxtrace: cs-etm: Capture wrapped snapshots
Message-ID: <20260827182149.GQ8904@e132581.arm.com>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-11-00c4fd0701b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-11-00c4fd0701b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_112153_645064_E5791839 
X-CRM114-Status: GOOD (  18.27  )
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

On Fri, Aug 21, 2026 at 10:49:09AM +0100, James Clark wrote:

[...]

> @@ -2061,10 +2061,20 @@ static int __auxtrace_mmap__read(struct mmap *map,
>  
>  	head = auxtrace_mmap__read_head(mm, kernel_is_64_bit);
>  
> -	if (snapshot && itr->snapshot_has_wrapped) {
> -		err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
> -		if (err)
> -			return err;
> +	if (snapshot) {
> +		if (itr->snapshot_has_wrapped) {
> +			err = auxtrace_find_snapshot(itr, mm->idx, mm, data, &head, &old);
> +			if (err)
> +				return err;
> +		} else if (itr->monotonic_snapshot_head) {
> +			size = head - old;
> +			/* Force a full buffer read if a wrap has occurred */
> +			if (size > mm->len) {
> +				pr_debug3("%s: wrap detected, adjusting old from 0x%"PRIx64" to 0x%"PRIx64"\n",
> +					  __func__, old, head - mm->len);
> +				old = head - mm->len;
> +			}
> +		}

Wouldn't this be a bug fix, since CoreSight did not have a
find_snapshot() callback before this series?

I am wondering whether CoreSight could reuse the common callback
introduced by this series. I expect this idea may be pushed back :),
however, my concern is more about the overall code complexity.

Reusing a common find_snapshot() mechanism could give us a couple of
benefits:

 1. Userspace could share the same snapshot/wrap handling, rather than
    maintaining different mechanisms for different AUX trace.

 2. It could also make it easier for the TRBE driver to use circular
    mode for snapshot, which would avoid IRQ maintenance and many
    redundant RECORD_AUX records (and avoid the mentioned trigger
    counter for assistance in snapshot mode).

The monotonic head pointer can simplify some calculations in userspace,
but if the common find_snapshot() callback can be extended to handle both
arbitrary and monotonic head, seems to me, this is a good chance to
simplify the code.

Thanks,
Leo


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D4ED39406
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t53LXnYVFSoCuwm9CDAqN0IhCXmmGV/SPQdDkHxkJMk=; b=Sd9sVadA6k/Vo7VDDf3pKJjzrF
	bPndGbgAe6QOsmsaEcYgmF6C4yRfb3W/PFQKC4O1H+nwc3Lzsa+wWIYUKALUQfjXvIJ2SrU6Cd/VV
	ndMjPHe29sEcFfZvxJPq5LQmNHCTm81DyhvO6AwZ0xag7E/GMj9RPfK3sYGi7USdSd8iREPzHcPg7
	ZNSZeuI1yCsl5R+KMNXIvmLY+tD7SClTJtkHSUaFc4yzJI0NxhGWs6klsYRbPJc4YbMtfD2HVjczb
	gwnDzVtyrmB+CZ3nJ7uUFaWRNzGueBTSoi4DLxFy2xrtPcIB4NAKkQWGPYyiisRAQfTydSJbwdfz2
	7C6mtdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Edg-0000000HIFK-2AX7;
	Thu, 02 Apr 2026 09:47:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Edf-0000000HIFC-0H2a
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 09:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t53LXnYVFSoCuwm9CDAqN0IhCXmmGV/SPQdDkHxkJMk=; b=KkcIAfoWpwD4VqdagWiPwzkmct
	gjh2sg5TeUHvhpPsXIEEQ5GWllbDcTCnYL7p5dpwuiALCru6jMtJ8YgJNiKnRwcYqeAXa5cdtSn5z
	DdAQ6I/tOKnoHxCwyWEtIIN4JJtbJn6FtXKxFu0a4hgxvgqEN6psTRFlTJKpdrpjYLtBmKg6KEOtP
	obHgY+/YpqZl4E6LIRSPZlSfB6CU48G4EKJ0p/z06KeUjoKgEqJ9+Jd6eylaiV//DpQ4F0jZ4IsfU
	rJIFE3sXyKUivVULQDKJdWOfTnvwoolRYDRV5L42tLNfJT8lN2PAwrTpbhEvJokuLER2GaEpTF73+
	gLpFkKXg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Edb-000000029rM-036L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:46:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 461452C43;
	Thu,  2 Apr 2026 02:46:47 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB1A13F641;
	Thu,  2 Apr 2026 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775123213; bh=FvUKH05X0Vg8xw6hf+KesUtG3wgK7luuKEGYXj3pxpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/Z6duT8MDcjgpam0RoaorFrpr24ywBdCO2b+95yCIt6TV2ncESJSWqXFv2cQgS7O
	 7sh4nx9VvyflgkMsPvloj+EVZ+rdAe3eMP5+G4JnewXwAvCSIoRp2sJgVG9FfASKtz
	 KE2/CjPVM2cCypGJ2IuFuyhuADdg/uEOpwObIwjo=
Date: Thu, 2 Apr 2026 10:46:50 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] perf arm_spe: Print remaining IMPDEF event numbers
Message-ID: <20260402094650.GH356832@e132581.arm.com>
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
 <20260401-james-spe-impdef-decode-v1-4-ad0d372c220c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-james-spe-impdef-decode-v1-4-ad0d372c220c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_104655_683169_04A6E787 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Apr 01, 2026 at 03:25:52PM +0100, James Clark wrote:
> Any IMPDEF events not printed out from a known core's IMPDEF list or for
> a completely unknown core will still not be shown to the user. Fix this
> by printing the remaining bits as comma separated raw numbers, e.g.
> "IMPDEF:1,2,3,4".
> 
> Suggested-by: Al Grant <al.grant@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> index 42a7501d4dfe..b93712ce0aca 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
> @@ -364,6 +364,24 @@ static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
>  						   payload);
>  	}
>  
> +	/*
> +	 * Print remaining IMPDEF bits that weren't printed above as raw
> +	 * "IMPDEF:1,2,3,4" etc.
> +	 */
> +	if (payload) {
> +		arm_spe_pkt_out_string(&err, &buf, &buf_len, " IMPDEF:",
> +				       payload);
> +		for (int i = 0; i < 64; i++) {

Nitpick: use for_each_set_bit(i, &payload, 64) instead.

> +			const char *sep = payload & (payload - 1) ? "," : "";
> +
> +			if (payload & BIT(i)) {
> +				arm_spe_pkt_out_string(&err, &buf, &buf_len,
> +						       "%d%s", i, sep);
> +				payload &= ~BIT(i);
> +			}
> +		}
> +	}
> +
>  	return err;
>  }
>  
> 
> -- 
> 2.34.1
> 
> 


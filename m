Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7A606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zIq9iUmz;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRYm/p6I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZInQYbUxcW7DtenoLG5Di5mlTcEFYHlYTealy8i6jec=; b=zIq9iUmzHb+0u6v/Wte/4d1fqJ
	cGxZAHbAwEp5kJncYB74S3/ZIGVBSVy1kExsh4HnmXgS0Q8/otAbk3EEBg3RvuhgllQLDkAs9eU48
	DO7pQsJLVCZ9pHIidVmAnWD+j9jZzhkr6RkiDTURtR2qYWdjpirAMu85XHymC79IhWD8WTZGcExsX
	/0KcDLVZO5mct7d8FDRJQdexm36uTQ7x6eYVgZ6GvlNJ5LtWUKKCfrB3SP9F5vhPPtc9O9hI60tsw
	FRIMhTA27pA9m547jk1PbS/GJ7ihHtrf7XRa+T0UqFN63viguOx+Q9kzZquji+u/hvP6CoGRShxvE
	bKNptm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHz2-00000003Gre-3thw;
	Tue, 03 Nov 2026 17:07:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHz2-00000003GrG-0wkx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:07:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0AF343E5D;
	Tue,  3 Nov 2026 17:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED901F000C1;
	Tue,  3 Nov 2026 17:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725659;
	bh=ZInQYbUxcW7DtenoLG5Di5mlTcEFYHlYTealy8i6jec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CRYm/p6ICZSxky9n/VQiT9ftqP0Xz98pTyJeInVCT1/uq8LOHegw/996L7obhOZCZ
	 KYah+S3oETUHs0AXYH3sdrtxI7OjqMW511MPhJB/1OkMOutdbAGJ/Dx5lIM7ljqA9d
	 tspmkeuvKOZeyN2SFMJDUxRcw141O60DY/zM84f7ttM1OiYxpiqU3XZO4jYZU1xXjM
	 gv6IGs07YCcPEgcxv9Z3AVEwatTD2iWNAqdrxTlKdcMRDd7MQlAb+/KFH9NXccX7E/
	 tc1oj8QhxIZv9DgZDNshINWa9fNHRZ/x3ouufFbPljjSd8u71ANmnztteHSHWWxeX9
	 o/Usjq3CtbrgA==
Date: Tue, 3 Nov 2026 09:07:37 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" ->
 "shouldn't"
Message-ID: <auoU2bRDQkQkXJNF@z2>
References: <20261028183137.537812-1-colin.i.king@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028183137.537812-1-colin.i.king@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 06:31:37PM +0000, Colin Ian King wrote:
> There is a spelling mistake in a pr_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to perf-tools-next, thanks!

Best regards
Namhyung

> ---
>  tools/perf/util/cs-etm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index bdcf94813129..65bce2450549 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
>  			continue;
>  
>  		if (!intlist__empty(etmq->traceid_list)) {
> -			pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
> +			pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
>  			return -EINVAL;
>  		}
>  
> -- 
> 2.55.0
> 


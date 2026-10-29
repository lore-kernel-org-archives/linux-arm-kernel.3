Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22868606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DH7LqppQ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OpX1LeaD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JJWiOAmxy65xzOnIzkKiZHs547R//LqHsI7/Rc5J/Mc=; b=DH7LqppQ0zKW/rQVGwRqbQUsRT
	ubUoPUelZztAKBmCpo1FHsVG6D8hEREkcATqO+R0voC35khlYuhO15Tc4F9YmPa/FLUndc6CI+hha
	xxC6snge22Kxv5HiWclytQjAAxZv4v+AuuNjv7jJmRDrVF54J/3+4Kn+7qSToy4TodBtWj1GcreDF
	KZ4ZcDJ39q2NHxSVkzQup8ZUws/AsIcFe49WW5///DaCDuypmuiCQfhiRPVh1Xw+KUtOMk7oxTWG8
	s+KBG8IrFxg32B6g795+jLqb508AsBjCnzJk76gIgaOmh2NW3S6c69mzfb1E3XxP65fRwF8AjFHLj
	bf7E0Hwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMU7x-00000009zin-3rWT;
	Thu, 29 Oct 2026 17:41:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMU7v-00000009zi6-17vr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:41:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C3421682;
	Thu, 29 Oct 2026 10:41:17 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B39BF3F59E;
	Thu, 29 Oct 2026 10:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793295680; bh=GrLXrVxy0qLGUj63FcOKiSL+aGileL5U0QJtN0lpGjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpX1LeaDGd5qmg1b/GecPwfvsij4QQBlMterRUW7DW2dgl6Rc3ZH4ZPupZSb9LimB
	 3izdwbPMZjn16r9O0DOrXshgNp7fhFXT091I41e35b4ioOmF0SjQl5Q7dRIuhpehd8
	 ewYB2RmQbvzBn6Z9P+0r0bTgS/dGGz7C0mYN9e/Y=
Date: Thu, 29 Oct 2026 17:41:17 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v2 09/14] perf cs-etm: Classify exception calls using the
 exception packet
Message-ID: <20261029174117.GC9176@e132581.arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
 <20260923-perf_cs_etm_fix_non_taken-v2-9-6ab8c07a5455@arm.com>
 <7bed4275-0b97-46d7-b250-5039aa95eccf@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bed4275-0b97-46d7-b250-5039aa95eccf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_104123_374654_AC0FC9E2 
X-CRM114-Status: GOOD (  11.25  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 29, 2026 at 03:08:42PM +0100, James Clark wrote:

[...]

> > @@ -174,6 +174,7 @@ struct cs_etm_packet {
> >   	enum cs_etm_sample_type sample_type;
> >   	enum cs_etm_isa isa;
> >   	u64 start_addr;
> > +	/* For exceptions: preferred return address, or CS_ETM_INVAL_ADDR. */
> >   	u64 end_addr;
> 
> Minor nit, but you could use a union. I don't know how clear re-using
> "end_addr" id for exception packets is when reading the code.
> 
>        union {
>            u64 end_addr; // Range packets
>            u64 pref_ret_addr; // Exception packets

Will do.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9D1C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=588q5ihm0RmRCyUIOW4Y1iibeK9fagMr3ZXwuQSEbSg=; b=ltqF1UWgeQJQ5ROslSngQ8OOuH
	g86HM9r1F92cbBxuDcNWa7AuiuLu4SZfMaM7sjJyHhAgwlHiRy1ra1NGST17/bENHQHgSkOQiLkGJ
	jFYMPTE7l6RF4x9t2yDiVZ1C3zWqNTt0sg7IkB/KAuVtN0sCzepBtEMhW5klJb4x2uenV02Kkmc5u
	VX7mGT68fBM1PUYYJT2xEdQKBKzfOsaCRwplQFE+TvoSX+83V0W12R8rY/lrSrNBW4QJpr/tjREEu
	TVmwCMYvj8MEJRpMCTltut/48SAfGQMqJuzDSKmw+LUKcKmKRvRqrbMwT5tT90WrxOq9i/zfBIBl/
	MF74eoCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAIJ-00000001uB9-0eae;
	Mon, 03 Mar 2025 18:13:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAGj-00000001ttS-13aI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 18:11:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81023106F;
	Mon,  3 Mar 2025 10:12:10 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E7DF3F5A1;
	Mon,  3 Mar 2025 10:11:55 -0800 (PST)
Date: Mon, 3 Mar 2025 18:11:52 +0000
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
Message-ID: <20250303181152.GI2157064@e132581.arm.com>
References: <20250217195908.176207-1-leo.yan@arm.com>
 <20250217195908.176207-2-leo.yan@arm.com>
 <34795c29-d256-49ce-9d01-435f8cd91611@intel.com>
 <20250303162210.GH2157064@e132581.arm.com>
 <447bcafc-4c47-4b95-bf21-7aee2cb6a629@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <447bcafc-4c47-4b95-bf21-7aee2cb6a629@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_101157_332696_720EEDE1 
X-CRM114-Status: GOOD (  17.20  )
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

On Mon, Mar 03, 2025 at 05:05:13PM +0200, Adrian Hunter wrote:

[...]

> >>> +	ret = max(ret, SAMPLE_FLAGS_STR_ALIGNED_SIZE);
> >>> +	return fprintf(fp, "  %-*s ", ret, str);
> >>
> >> -21 means the field width is 21 and left-justified.  It should not
> >> truncate the string.
> > 
> > No, it does not truncate the string.
> > 
> > It calculates a maximum value between the returned length and 21 (
> > defined in SAMPLE_FLAGS_STR_ALIGNED_SIZE).  It keeps left-justified and
> > can printing a complete string if the string length is bigger than 21.
> 
> Maybe I am missing something, but that isn't that what
> 
> 	return fprintf(fp, "  %-21s ", str);
> 
> does anyway?  Why change it to something more complicated.

You are right.  I should have done an experiment for this.

I will remove the max() sentence and update the last line:

        return fprintf(fp, "  %-*s ", SAMPLE_FLAGS_STR_ALIGNED_SIZE, str);

Another option is to drop this patch.  But I prefer to keep it, the
reason is except the benefit for the debugging log, an extra reason is
the SAMPLE_FLAGS_STR_ALIGNED_SIZE macro is used to replace the opened
value '21'.  The macro also will be used by a later patch for
right-alignment printing.  How about you think?

Thanks,
Leo


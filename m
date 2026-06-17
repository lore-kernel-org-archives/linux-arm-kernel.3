Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B1CCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr/tLxTiAeYibdOp9Z+3hrJZc0VtAMq5RslZNLBFyUs=; b=t2qUEwoUWXMeZ7AMPL92u9wesW
	kGS0xj6nQQ8sBwydo7lAGGs2m19JrX1ipwZ36q1FmTJ2nKexh9Fyp/3+RxeDv1sY+1ffUloStbuO5
	UgEbFvoqwMzj/GUoY35CRpImul+boKrRxTZ0qz8uVQO2iaBwfq7apkjawVrsyd8fSfDQ2TojPv4bq
	Gu+R6QTgoUDMdc9b2omSx1o7W6Jb9pJWUnJ5vpJ8iU0C8VIqa1hcC7KiDtMMf/thT81ofWQouDdHm
	ogPC1nqfVnGaV1BO2wr/x1nz2a2FV54pEan3T2WmnPG/s9z5zvNEN0AS6F6dCZUVBe2sGzlwZ3G8y
	7ghOgZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpST-0000000HLYM-1Cs7;
	Wed, 17 Jun 2026 12:33:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpSR-0000000HLXw-0b10
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 12:33:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6DCB4794;
	Wed, 17 Jun 2026 05:33:20 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B7A53F905;
	Wed, 17 Jun 2026 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781699605; bh=r83KeuqB3hEVv5E42XQQjBHyG/qeI9tw84x0hh9E0RI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knuQs4aK6TdebO7fIYmkq/OWHeq/Jc4FF5+weqhAr3Z7aOlB0bBLXHDGr53Dhy6BK
	 mT85P3OhrChY/4Uc3edesHHtNqBkAVnQSk3GfKwRL05nrnKORjDFxPH+DfRYYr9ZZF
	 G7eXWf+Bo91zv/iG8yWI5orAOYABOdmR+OVGmOXI=
Date: Wed, 17 Jun 2026 13:33:22 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v9 9/9] perf test: Add Arm CoreSight callchain test
Message-ID: <20260617123322.GD31870@e132581.arm.com>
References: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
 <20260616-b4-arm_cs_callchain_support_v1-v9-9-f8fad931c413@arm.com>
 <6855d77f-d2f4-4dab-8481-a8c586e4872b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6855d77f-d2f4-4dab-8481-a8c586e4872b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_053327_308710_1663F2E2 
X-CRM114-Status: GOOD (  17.91  )
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

On Wed, Jun 17, 2026 at 11:03:07AM +0100, James Clark wrote:

[...]

> > +	# It is safe to use 'i3i' with a three-instruction interval, since the
> > +	# workload is compiled with -O0.
> > +	perf script --itrace=g16i3il64 -i "$data" > "$script"
> 
> Is there a reason we don't generate callstacks on branch samples and use
> --itrace=g16bl64? That removes the magic number 3 and reduces the output
> file size and test runtime a bit.

I checked Intel-PT which does not generate callchain and branch stack for
branch samples. I just keep cs-etm aligned.

I can add callstack / branch stack for branch samples.

> All I had to do was copy the same "if (etm->synth_opts.callchain) { ..."
> block to cs_etm__synth_branch_sample(). It seems like the grepping doesn't
> exactly match the branch sample format so the test fails, but I'm sure that
> could be fixed.

This is likely caused by the regular expr.

> I suppose there is value in testing instruction output, but maybe we can add
> the option for users to add callstacks to branch samples, even if it's not
> tested.

I will try to update the test for branch samples.

Thanks,
Leo


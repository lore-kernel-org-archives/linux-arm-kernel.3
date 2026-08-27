Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE88C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s34Wlcm1yDSV0cCHqMm/x0qZPEUALloEGI/ORhd0Dp0=; b=LbDDUbv1sMATxjM7V5cYuilAw6
	Map4CmTnbr8YqBWVCzFR2w1mdcSo+nOgzypPrQGqbSe0PeSEv1Lur4UXE3DHF/2b+IjAKU7F6HlKA
	WJv0K0ydGqDMY0CLRiz2f0C8We4skp5gxejRKVJ9KMprMJ+KQXLNCgYydBq8DwudOse8RExV/YBqZ
	ybzJg5zpMPKcF+2ARUk2NqQfF5h1XHQc/G1sbl4cRWCaxXrof+a/L1CIz1SIbxOmJ32AUyKLNZDzf
	WCYuuBMOFGMN+ZLQKH4cvlHFrsXFiLj0/kQN08FU2N2a/cFhBHilFuSB1TkHmv/JWd/x5UGEt+uGS
	rFJV5Qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcmA-00000004Iu0-2wPK;
	Thu, 27 Aug 2026 16:16:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcm6-00000004ItO-13aE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:16:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71856165C;
	Thu, 27 Aug 2026 09:16:17 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D280E3F66F;
	Thu, 27 Aug 2026 09:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787847381; bh=Po7B+ioTUC8/AQc54cprCiMxCkcn8AmZZRO/gw2sSvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSz0WQUrcKH2CxlPtJo/0Invj3NXrJJrlz9QcPIDv+6RcnX0U5tzKjzBArF49rlno
	 ZC1qb6WRgIWljwhSLGfZ994TWwRDd9m+hXYBJNYaO80EHzG1UIlDa5HovlCjXOIFWO
	 z0DFR7ViT+KHq3/JM/jWZBAY5XS2s33Kw41C7ET4=
Date: Thu, 27 Aug 2026 17:16:19 +0100
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
Subject: Re: [PATCH v2 07/14] perf arm-spe: Use generic snapshot search
Message-ID: <20260827161619.GN8904@e132581.arm.com>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-7-00c4fd0701b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-7-00c4fd0701b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_091624_343887_D9167F2B 
X-CRM114-Status: GOOD (  20.28  )
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

On Fri, Aug 21, 2026 at 10:49:05AM +0100, James Clark wrote:

[...]

> SPE also had a special fixup case for head pointers greater than the
> buffer length, which is not needed because the SPE driver always wraps
> them, and __auxtrace_mmap__read() handles that anyway. It also didn't
> have the special case for old > head for when the wrap heuristic fails
> but the pointers showed a wrap had happened.

Here mentioned the "special fixup case" is:

  if (head >= buffer_size)
      return true

If the hardware pointer is exactly the end of buffer, it is a strong
indication for wrapping. So it might be worth adding an explicit
"head == buffer_size" check in the common code.

That said, if always checking the final 512 bytes, this case is very
likely to be detected anyway, so I am not concerned about dropping the
check.

> The other feature lost is that this search only looked from head to the
> end of the buffer, rather than always at the last 512 bytes. This was
> flawed because once head is close to the end, it's likely it could
> contain zero padding from actual SPE data and a wrap would be missed.

> It's better to err on the side of caution and mark as a wrap, rather
> than trying to optimize by limiting the search from head onwards.

Wouldn't this be a trade-off between missing a wrap and reporting a
false positive wrap?

Ignoring head makes the search overlap valid trace data when head is
close to the end of the buffer but has not wrapped yet
(e.g. mm->len - head < 512). That data can then be mistaken as evidence
of a wrap.

For a false positive wrap, [head..mm->len] contains zero data. This
should be fine, as zero data are treated as PAD packets and discarded
during decoding.

I'd suggest adding this info into the commit log, in case later we need
to understand these weird cases. With that:

Reviewed-by: Leo Yan <leo.yan@arm.com>


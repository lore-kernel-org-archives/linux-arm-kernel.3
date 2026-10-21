Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B1606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nCwVx5C1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tayxm9lZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1YiWdLfzEcu7fQY4ueusVJXfXfBkH/pMzgprS/6y8s=; b=nCwVx5C1ljPR6I/KCX6TK1yyFt
	BGM/tpVLineIDzmrj/8CF8VavVVKB/Jd6xkHwuFb4MgssbgFDJ0NwFMd06uAS0LCJKHqT+XlYuzHw
	3oQKIDotEPA6WdCYBQ1LyA4K5Aw6fSWj8gyL/jt6vlhRV3AlUnLXJUAAiCE0RVMst7e/DdGH7WCW5
	lDjq1aRpqt2BTqh8k3otD+9+Pxs00VvCSIyyZ67RzLqKv8AhGe0i0++vKijEeOkjtYsvp4rA4IiQS
	X9cjm2m1PHALgJ7Xv3tX0N7kOwH07eFzX0bW+fGwZlvnhImqj/aeork8zmkZklbJubB6QUhAbEand
	A+EzS8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWhk-0000000C0cY-2H5Z;
	Wed, 21 Oct 2026 13:50:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWhi-0000000C0c4-3OFY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:50:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ECF05601DE;
	Wed, 21 Oct 2026 13:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1081F000C4;
	Wed, 21 Oct 2026 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792590605;
	bh=v1YiWdLfzEcu7fQY4ueusVJXfXfBkH/pMzgprS/6y8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tayxm9lZ8glz7CAEW+XpWoXqPogPvAVP5FyRHysSufMVpYFOd5kAHe4eGeJbgfeec
	 lN9UQ6X2/Svm+vKebPAyYr7ByWM+3x5XdfX8TkZij5/m5+vjiA6rkIP/rYabTfcAzu
	 IptdY7DH/bWaKtMjjuZT9anmjj9eoBnVO/+RTyv5Jbn2C3S2B1YcP1vZ9byQgNLmvv
	 RntpHNTTo3qYRgECnXOXprEcrGC2viaZg1w1n2ZdoYCWQwnrPthWmeAIBh3SFkglBr
	 3xt6O8Z9juiX9ctKSXg5b2Uazj542hNEOlHf2l2DCNC9TBxwApcU3K30t5eOWxwnE4
	 2GB3ctpiCEY9Q==
Date: Wed, 21 Oct 2026 10:50:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH v3 0/4] perf: cs-etm: HW_ID improvements
Message-ID: <atjDCpTIrchbCLt7@x2>
References: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
 <2bc4b058-3a5b-4a9c-a469-eb8c93215594@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bc4b058-3a5b-4a9c-a469-eb8c93215594@linaro.org>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:42:24AM +0100, James Clark wrote:
> On 02/10/2026 12:15, James Clark wrote:
> > James Clark (3):
> >        perf: cs-etm: Don't add global v0 HW_IDs to unformatted queues
> >        perf cs-etm: Free partially created queues
> >        perf: cs-etm: Respect --no-itrace option
 
> Hi Arnaldo,
 
> Is it ok to take this one please, Leo has left his review tags.

Thanks, applied to perf-tools-next, for v7.4.

- Arnaldo


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4C4FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NZAgXdOZ8L1ByThFt/b7T5U7hLMlAR5ZEya1Gmvwp8=; b=waEl5GB/kSLlEomw9sE4j5v7Sa
	+l9ImSVLsAByuyxs4jWpSoyQv+osyt4JZ5uesJaQhfUw1YEGEPv9bl6kfhCvsnrrIF5VqG29MDsLz
	LCt9Fgkw8Ve0MeVWQw88I/deAIx4617gRXI9qYZavBFPqufwMBxpJV7MiC031tbLehzTITHlsaXFK
	bEKGCs0mWiBrd2N0/MNrKMdYOgNDv3xTpND7BFfnDFp0cwF5UlH0crsrl4tG5ZEo7zQS8oFn1amp0
	lPX5rL4u/qp3M8Spp/eKSnWTltdruLWYlMNrZ9WCkL+u090JZ2VaCtErdnQjeQODgzYtpAg+CcCGI
	QMEmAnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzIW-000000039Q8-00Yv;
	Wed, 29 Apr 2026 07:25:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzIT-000000039Pk-28Lj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F009B43E6A;
	Wed, 29 Apr 2026 07:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608C8C19425;
	Wed, 29 Apr 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777447524;
	bh=PLWmMocxHZ2qX2NovMeOADpWdzS7exOlBa2w6iPJ4U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rj6xxFujttZuPJkCeRLixk3SSSLQUo5vnoYYYbI8P6HxWYpP8zACy9jiMcnYzYUpj
	 tvOSWPuV2EF6LubdoUBc07gYMX8i0cIHdoX6hAoViTNMn/cXY2Jz1NSrCbSPqEk09Y
	 4SjX8CxaHUIFx3ycsykqICR7PlAUvl64KOuKq+nJxw6WJ9jhUVwbc4arplYSt6cKxC
	 DvIgh8dd2KIC8vESQgoUd2IQ7fpNrXn/WVjFJuXSdjGM/I+ScmFMSmXzf3o/T8k4rg
	 JbafMxVPwmLfKDdE4XVuZHwBybGeJY/MRCHj2bmEdvfFVdSWniObp9RgjtRg4KDRxX
	 YGppVYhsjUoDg==
Date: Wed, 29 Apr 2026 00:25:22 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com,
	dapeng1.mi@linux.intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v8 09/58] perf evlist: Add reference count
Message-ID: <afGyYi01XSNIS-A2@z2>
References: <20260425224951.174663-1-irogers@google.com>
 <20260428071903.1886173-1-irogers@google.com>
 <20260428071903.1886173-10-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428071903.1886173-10-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_002525_566377_0764782B 
X-CRM114-Status: GOOD (  19.32  )
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

On Tue, Apr 28, 2026 at 12:18:14AM -0700, Ian Rogers wrote:
> This a no-op for most of the perf tool. The reference count is set to
> 1 at allocation, the put will see the 1, decrement it and perform the
> delete. The purpose for adding the reference count is for the python
> code. Prior to this change the python code would clone evlists, but
> this has issues if events are opened, etc. This change adds a
> reference count for the evlists and a later change will add it to
> evsels. The combination is needed for the python code to operate
> correctly (not hit asserts in the evsel clone), but the changes are
> broken apart for the sake of smaller patches.

Can we keep the existing evlist__delete() code?  IIUC most parts of the
code don't need to worry about python.  Then do we really need to
convert them all?  Maybe we can convert only the relevant codes.

Also I think it's better to split evlist__put() conversion and python
code changes.

Thanks,
Namhyung

> 
> Assisted-by: Gemini:gemini-3.1-pro-preview
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
> v2: Added evlist__put to pyrf_evlist__init in case init is called more
>     than once.
> 
>     I double-checked trace__replay() and confirmed that trace->evlist
>     is not assigned to session->evlist in that function.
>     trace__replay creates a new session and uses its own evlist for
>     processing file events, leaving trace->evlist pointing to the
>     empty list created at startup. Therefore, the
>     evlist__put(trace->evlist) call in trace__exit() is safe and
>     correct to avoid leaking that empty list.
> 
> v7:
> - Added pyrf_evlist__new to zero-initialize pevlist->evlist to fix
>   crash on re-initialization.


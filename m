Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA88C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLoR3dFRtXbr6vPpFSReD2HvpuUUBOOt3jsnT9F9Frc=; b=owINiFeKhuBTCLwprO1GUKjPF1
	R+3OTjaGLJpUcX9wdUIkfgJBaXE2ibzFpSNqRDV6B0r9tTkHbYqmn5UuzgOzlVG0YT1AR8Rcdg5eA
	nVtHsYrE9IsBwGzu1k+odsa/GhTjJoRD4/IoUBC/V1qTVQWMNyDybH3eBDyy48egT0iuDtyWQAHiq
	qMWzfMcKzmBMqwXsIQziyukv3HQy0Z8tze4tjHEffYPExqARlUvGCO+ebNHfqtM6FeN2l7dro08aN
	UHRebj9bTWXmmN6GU2ibFlXXUFlt1U5iVrQHn7ZjV9cvUwW5jY6zHIc52+ev2EJkhJL5NsN7X5b6x
	yOfJNWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zm6-00000005KWE-40x9;
	Tue, 22 Sep 2026 12:39:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zm5-00000005KVy-2uEt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:39:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAEFC60DEE;
	Tue, 22 Sep 2026 12:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0C61F000FF;
	Tue, 22 Sep 2026 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080744;
	bh=QLoR3dFRtXbr6vPpFSReD2HvpuUUBOOt3jsnT9F9Frc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lbg9w3Rz3woeKACoCIpmcshyiaV/8/f16ymbB2wNrdyYUdFqIWZMzlxKfZidEYr2h
	 SOjBt2oKQ1Ihl/vyvS47nsOVuPEKiPWD/FNNM9HSWSXC30yEWsbESaXtBtAOcukFVl
	 vAw/bjUNfBHO5BH4iZvS7cVdeKVL1pZZMhkLRzGV64gWGjvneOqJKbIKKEKljgjPmh
	 vTS6Bp8ED3jJbd1ZuzAquguJwtAmDeaRoKw789DnTgUyB+AIRAj9tZc/U6WpwKtne2
	 Cs1PD96yqhKHOHHghVoVX895aG/2QqeoQ/Xcir6ZllR/O4cCCPkDhJtlpL5qmEyPFp
	 dy2/h7AjKGENg==
Date: Tue, 22 Sep 2026 14:38:51 +0200
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Chen Pei <cp0613@linux.alibaba.com>, peterz@infradead.org,
	mingo@redhat.com, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, james.clark@linaro.org,
	john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf test: Fix a leaked map reference in the arch dwarf
 unwind tests
Message-ID: <arJ22-nHya17_ns2@x2>
References: <20260914121903.1212-1-cp0613@linux.alibaba.com>
 <CAP-5=fVW6nJXoh8qf4e_jkLXGUzCGCTCg9YivHkN9kkVJmMa-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fVW6nJXoh8qf4e_jkLXGUzCGCTCg9YivHkN9kkVJmMa-A@mail.gmail.com>
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

On Tue, Sep 15, 2026 at 12:35:23PM -0700, Ian Rogers wrote:
> On Mon, Sep 14, 2026 at 5:19 AM Chen Pei <cp0613@linux.alibaba.com> wrote:
> >
> > maps__find() has returned a reference to the map it finds since
> > commit 42fd623b58db ("perf maps: Get map before returning in
> > maps__find"), which updated arch/x86/tests/dwarf-unwind.c but missed
> > the arm, arm64 and powerpc copies. Release the map after reading its
> > end, as x86 does. All other callers of maps__find() already release
> > what they get.
> >
> > Fixes: 42fd623b58db ("perf maps: Get map before returning in maps__find")
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

Thanks, applied to perf-tools-next, for v7.4.

- Arnaldo


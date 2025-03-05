Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A6FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1PVaYBpq9076U3IWZXvGpb8FBXofDXNAhkbJyruFPI=; b=TzVOZqwgflnRcWtMznR8EvMz2G
	3aPhnBdahKunwp3BI5i2Mxu3U/I4c2UedpLVM4pS/2A9/Vz1eoB+BRHtNnt9h6r7y4byWSMJsrA4z
	s2GK9jcqiekbw57eb8c9DQ2rnN8xRKlK1ROqr078kOYIcNzAeFGFdFi5DGXMbqWqONUkBYs0z37oi
	8cdHRDdwMppwZgC5bzF3myA1D5UYtkOXZCaixn1BgTdnPGBpth+lgNe6wxg1oK2c11XikU9oXanW6
	XgKc68wF9rBEaciSO9Qnr/fk/CGUzw/Z9D/lAWI37WXRh55yA9vmU41/3CuLHBs2RWwCZDN4xiHW4
	OU2jqUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvVb-00000009FCi-23Dl;
	Wed, 05 Mar 2025 20:38:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tputW-000000099Mt-35Oq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 19:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=T1PVaYBpq9076U3IWZXvGpb8FBXofDXNAhkbJyruFPI=; b=bIGIuXjA3vXlIO8TqWCLM/FJR/
	xiECjZ8fxNXnH+oMV2r985caH++gXtCI23W+7Sz8XixUCsORvPNVPCd2PMHOqWPOr2jyKe/yqpzzs
	U9u4rgQg+bBIP/gatYOcFWFQRijIa5mkkHA9BhMRtjFdaVkl0PEibdj6JO4f9wNcjMiDn6GL4ofpm
	w6UIP5k5pYvF3v4Gbgq53HC+QjL+zmxYUrDmhzomMJBTfBJhFJh0Z88ecaHAxNkZuft73Vedoi1dX
	xnnVqhpDUC7VzIoGMI0b8zntZy7GMJyiVMuj6Qe9sMbyTkNIfp/AyAz/u6U+2a1P5bReG0fnN4GIa
	ffOpl1Kg==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tputT-000000067yD-2b0h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:59:05 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2feb96064e4so12296313a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741204739; x=1741809539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1PVaYBpq9076U3IWZXvGpb8FBXofDXNAhkbJyruFPI=;
        b=FI/pXsie6BNmU4kXtZaiXxn5vyOavTvtLA6Rrn4aESBmu/THjqjWxklYSsynTD+Bef
         wNpB9CD1OwIhq/5BHAZXbFqkbKsP9bvH0Dv9P76Qc7QXdhYU0cbifsvym4a+qc5Qo95U
         NWZXwv2D1S6vIcyzxwDroTEVqVKHZ7LMX0MGQmkzhhDJmDipnpyZVnr3n56VjzVt5r4n
         ZkcCQP+Pj/6p7CLQ1N/5kAKew34jRT5OcgAQEwlwIgxe94LZrc0BriKiCUsFWdP/Goz8
         ti+kOkUYzaUNtQ5q9rRnXTPKO7BaJ8K/iNu3CUUzkPoJXUPe9+jSyRAE5XrnOKlN2XKM
         HrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741204739; x=1741809539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1PVaYBpq9076U3IWZXvGpb8FBXofDXNAhkbJyruFPI=;
        b=AZTZwVlGTsePXl1kwJA3xN3qjZ2WszrGIl/aE8I5xEJo0fx5I3YhTeq3JX5WUYD7tk
         ieQ7x8mi1AzYIq3Q+Z9MYfw2Jx3pVn0si6LoFZMdr8m7qpCtTibtVNWGz39Bh337Ngg2
         5BzWzxhp1XJRnrX3KIKWmaiGfqUWousrtvcn41FCLFUSAA8NWerik22sx0GUQ/r2zTpC
         DpenZgdX+WofMTsu+/LG+P+5uz/XVsf1i4eOJ9Pp4r3P/oq4hvxpC5XHNc2w90mfyemT
         z9LnvS4YBgNftS7zSm8yZq28TCmZCfnTIOipw3RsAzwL+dy0i5Yx+41Po30IXzjyOCDC
         IHSg==
X-Forwarded-Encrypted: i=1; AJvYcCU9krdLYEwPzFhHrArJcCF7BD+GkliTGADR6LBLczUoodoANBU6KakMOOdZlEwuOXOXvyWG+FbDdLq580HSZ2QP@lists.infradead.org
X-Gm-Message-State: AOJu0YyVsN0BYYoHu2FIEFaWhVvvsi82J7Xp2jegwWjRiPFu8c/9pgLa
	+EYdTiiDbimd0f5EFqSkOfiwGs2Szj3b6PBFQb0+kkZVLooY1SpZwgnlMF5YKbG27MM2XwpR1kd
	fKaDSohP8/MtyigDns1Ekc45PxEc=
X-Gm-Gg: ASbGncsHHQTk3CsBdwZJQwrXKXk5HTQuryuxz13r+9eActjzgHDMamn1xs0aTwg8nqt
	p0jdfDvdtJegpyG3YrAP+uMh4+LKvLYfSOIDtNEtWZ8NbBpW1PWCAlydVoIzFc4GwZwJ1wAHj1f
	EyaTOtAhQDRgHUiV4SQZexq3J3
X-Google-Smtp-Source: AGHT+IFfV/6qDYoZwPNJLCBtJE8ZyU4iJr7//K16BTPN6XDyLemrI4fIv4EKbuBvHlLWUWsZ7sQslXNBrtC5L25iHmI=
X-Received: by 2002:a17:90b:3d12:b0:2ff:5ed8:83d1 with SMTP id
 98e67ed59e1d1-2ff5ed8d53fmr1796280a91.19.1741204739474; Wed, 05 Mar 2025
 11:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20250304154846.1937958-1-david@redhat.com> <20250305152055.GB28112@redhat.com>
 <CAEf4BzbyFy0eQHLac3zR8GiGDOUqYoTGAWDbFaeou903OGOTpg@mail.gmail.com> <62f93f79-a8d4-44a5-b276-3ac5af4ab25c@redhat.com>
In-Reply-To: <62f93f79-a8d4-44a5-b276-3ac5af4ab25c@redhat.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 5 Mar 2025 11:58:46 -0800
X-Gm-Features: AQ5f1JpNR9XR0Xgny3rOP3g1v3FV71Th_LHZWcRds0Sk3eNMx_5PJFuIV4e0zaU
Message-ID: <CAEf4BzZcc6D3u5ATQmpkBt=8EhNuG7Xaibywx=hXcXTp346uFA@mail.gmail.com>
Subject: Re: [PATCH -next v1 0/3] kernel/events/uprobes: uprobe_write_opcode() rewrite
To: David Hildenbrand <david@redhat.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	Tong Tiangen <tongtiangen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_195903_671726_7160DCB7 
X-CRM114-Status: GOOD (  26.18  )
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

On Wed, Mar 5, 2025 at 11:47=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 05.03.25 20:43, Andrii Nakryiko wrote:
> > On Wed, Mar 5, 2025 at 7:22=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> =
wrote:
> >>
> >> On 03/04, David Hildenbrand wrote:
> >>>
> >>> Currently, uprobe_write_opcode() implements COW-breaking manually, wh=
ich is
> >>> really far from ideal.
> >>
> >> To say at least ;)
> >>
> >> David, thanks for doing this. I'll try to read 3/3 tomorrow, but I don=
't
> >> think I can really help. Let me repeat, this code was written many yea=
rs
> >> ago, I forgot everything, and today my understanding of mm/ is very po=
or.
> >> But I'll try anyway.
> >>
> >>> Are there any uprobe tests / benchmarks that are worth running?
> >>
> >> All I know about uprobe tests is that bpf people run a lot of tests wh=
ich
> >> use uprobes.
> >>
> >> Andrii, Jiri, what you advise?
> >>
> >
> > We do have a bunch of tests within BPF selftests:
> >
> > cd tools/testing/selftest/bpf && make -j$(nproc) && sudo ./test_progs -=
t uprobe
>
> I stumbled over them, but was so far not successful in building them in
> my test VM (did not try too hard, though). Will try harder now that I
> know that it actually tests uprobe properly :)

If you have decently recent Clang and pahole, then just make sure you
have kernel built before you build selftests. So above instructions
are more like:

1. cd <linux-repo>
2. cat tools/testing/selftests/bpf/{config, config.<your_arch>} >> .config
3. make -j$(nproc) # build kernel with that adjusted config
4. cd tools/testing/selftests/bpf
5. make -j$(nproc) # build BPF selftests
6. sudo ./test_progs -t uprobe # run selftests with "uprobe" in their name

>
> >
> > I also built an uprobe-stress tool to validate uprobe optimizations I
> > was doing, this one is the most stand-alone thing to use for testing,
> > please consider checking that. You can find it at [0], and see also
> > [1] and [2] where  I was helping Peter to build it from sources, so
> > that might be useful for you as well, if you run into problems with
> > building. Running something like `sudo ./uprobe-stress -a10 -t5 -m5
> > -f3` would hammer on this quite a bit.
>
> Thanks, I'll play with that as well.
>
> >
> > I'm just about to leave on a short vacation, so won't have time to go
> > over patches, but I plan to look at them when I'm back next week.
> >
> >    [0] https://github.com/libbpf/libbpf-bootstrap/tree/uprobe-stress
> >    [1] https://lore.kernel.org/linux-trace-kernel/CAEf4BzZ+ygwfk8FKn5AS=
_Ny=3DigvGcFzdDLE2FjcvwjCKazEWMA@mail.gmail.com/
> >    [2] https://lore.kernel.org/linux-trace-kernel/CAEf4BzZqKCR-EQz6LTi-=
YvFY4RnYb_NnQXtwgZCv6aUo7gjkHg@mail.gmail.com
> >
> >> Oleg.
> >>
> >
>
>
> --
> Cheers,
>
> David / dhildenb
>


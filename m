Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB09FD19504
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZordIwPzkQDLZvR5baDaNuLBEyybU6EqCMS5GRysUY=; b=HzKLR268anG892x3iKGekTnm9c
	FnZ3zdISeSI5OOn3YXZyZJPABNL0RBKJverMAs1Th1Od60Wlwm/mcVxk9bkTMkNCGunE/vuKiC1k7
	eB7yGFwWbgqcnSBJtjjMZT6z1BTiLgPayPUnkAwrRgPrpXVmTMPcV6XGiq6y75VNKhHxnzARum9mf
	cHwcZ4Tg27bGtYLw/ct8yPlgZOsrmDoynwsWwxc1hNsBVXK5JrpvyGYhxM+SSQme4GM1KoNX5fSJ/
	oAPjZ4846f0lIVNhsbV7TsU8OtIBygY+wk11TtEJzc4Buv6fucfU0KIeyVv9EbhTB/S/BeTzBZCFn
	p/diUo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPyQ-0000000Cutm-23CW;
	Mon, 26 Jan 2026 17:01:58 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPyM-0000000Cusz-39Aw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:01:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a76b39587aso134705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 09:01:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769446914; cv=none;
        d=google.com; s=arc-20240605;
        b=ZjC8xHuVo52cDSRMD8eVyQnVA3Bws314C9OOi7l4pRcncCa3b0jrPIog3/vUplwZqV
         cdEusFhSOqWjWRa7ie1tAMzxDtjb81KSQhOIKvGjUucgzbuyqFukyrkQcDLoJZmm1vjX
         3if8fPHTTxGE3CajEL4MsSkkP6uAjxFcTY/S893tbwZYBpGWMr2inVWdULutqWyZf+se
         2Wl1MLQXkGl7W+q8n8w4MevMRpidDVZO8o1SmHcJXmM28jIbJgHBkQkoP5iFF2BqThk/
         yp4YXuJz5ybUz2TpOUH/ZQeoEkFROjPyMG4D6aooLmXzUq9jkv+MRbo92/4340HbyKlH
         2c9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZordIwPzkQDLZvR5baDaNuLBEyybU6EqCMS5GRysUY=;
        fh=vOCjZO6GJ3FjDbM1SGLgnnsyvn51qruOM1nZvPP2Mfg=;
        b=fmkIVOpPkptxRpgcA1r7TeEQiRPOKimbr1WhqmUJdZ7Rtvc7BWdaRVP1RAS4R43uMs
         7k0d1u2m3lKbyF/9Hu0De4eqEk3du4RcTIwJX95OfH0xzBwzeeWOeAWH6FghdhAX6PXe
         qkxP8gn4F7UPHwCmkANNdcfzKTKoBKyjIvhzRLBQS07w0MOG/eS8aCY5EFR7iYFDY86D
         6tjZGcOTnfcdSHP/h79C1Ofzdishk7UnIHOvCGoMKkbaGWQMkSFIqgRNDWiJaZzt5p8r
         Cn1OpgfMInOk/fqCnpZ7kylU7ku8fYF3yp8oRlypa3m8iHmpHnQhazMxyNFIM8Jd/uWO
         CSXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769446914; x=1770051714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZordIwPzkQDLZvR5baDaNuLBEyybU6EqCMS5GRysUY=;
        b=JGdsi701RjtjCf3tV2PO02Xw/zgiUn/JY3NKoTmsXaikzkD5XCbsQcvKq5FF/rN6aX
         g6LlRgb4S5f/PnDNB88HxYbw2n/NIKfCtanEkH7B8tW42LTkat4U7U78I4ymknBy2jQI
         t8Cp6eIFzd+SViQZoVbTPXo1tT3hq/AwtbnViO5da0arr2VaNDavWLf8m4sWtmMtV4ih
         /x3tdyFoISzunJ2BbhVYkcPmiCxFiZZ2xbQjRfsUzWBf7CbRCLNaGWNOnKfXMFYU/0xq
         11Ci9IJ4JJHmIRKtCTVhj71MydjFDpz+gFHXmQH0rWTJMknjpcsZle+tmIiJJj44PO9f
         ylTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769446914; x=1770051714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZordIwPzkQDLZvR5baDaNuLBEyybU6EqCMS5GRysUY=;
        b=wLiK1YuYbEgA9I5NG5brajEVNsusS7iQC96WeFxq3VN9pX+pqgBfkeVZGV5sVewo+9
         9pL0Jya50Yd8KycdH9ONE/s8/p4uKZyFxrMYpfeIX6TbCE1yawfaWLnrHxtPUybN/xnH
         1Wie75GDSLwkRKAYwLAx5iszicagJen+JlBy5FMo9CTjiYPtUMq06rLWB8nobQQOs6YL
         blSKc0AZAONqAHYN5wTMipX3sdJSU9DZqOonrROXydefp2gb5L6Cjq4+PaRW7VIsh9LT
         tGWJymaIJCPCqleV+SMyOm8IzohjX4tvYTsMpykdeCLdI9t9DCFwhaE+5Ly6EOyRpum/
         LRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHmt+L20bQVnA0Vnx4qCz7AQkp/BhcRUtwGZJLEjFRCOMEeS4O4R1EMwB1w9x/RNHiAYsnXOuqzuNdSeqBCLlt@lists.infradead.org
X-Gm-Message-State: AOJu0YyexThmbmtAy2OCZAWekSjln3Cs+Ox0FqXTbgb7KtWpGHgcI7N+
	hoNwQUfS//X0QYjcXjpvfgT+FMyTkCLBmYEtokiuiKg+P6SPKFfKsR2/Z6weCSwjix27K2qe4c5
	8p9KuoLvr80BWlppIQWm2QxRvQcdvDtjp4WlDD5Ez
X-Gm-Gg: AZuq6aKRbBRVliz+4ZpeiwXl9AAE0IV9SKGvUrYCWInFC9m77kgbBUBIoxMbSJaOq5T
	ALRQCA9ZHKrym1mgODPXvEbbJRPisYJJymlrkPGxAqFWlAZWzUYeAgwuONLRVFY0eduHlINEMgk
	F4xQpTZfQm+YBFVz1yVSKe6Ht06OLpMUsyBfoglk5MeQlLJzRX6XjLsSBtoRWOJQKd44W8xaGd/
	+IcnjyO8nXTGvsjN2EJutwZGPyIZeT038i80aYf7wvyJux+LZ8sOsMHVUg8FHSlsBzAj587aSR7
	SFQtpkHVzgLhIcwzvEY4/FFhR3hfH4Ey2G9O
X-Received: by 2002:a17:902:ef09:b0:2a0:89b0:71d7 with SMTP id
 d9443c01a7336-2a844e77f45mr2176075ad.13.1769446913375; Mon, 26 Jan 2026
 09:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
In-Reply-To: <20260126123514.3238425-1-wangyushan12@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 26 Jan 2026 09:01:41 -0800
X-Gm-Features: AZwV_Qg2tWe8uippZ5ldvtEYGALSf4Ro55wkqzh5HcjULP3PISqa2vUjOU2M7k4
Message-ID: <CAP-5=fWkBjJy2i=e+zn1Ou5g3J8rapGKi8O7ryQ-ic2vXFEOoQ@mail.gmail.com>
Subject: Re: [RFT PATCH 0/7] perf tool: Support iostat for multiple platforms
To: Yushan Wang <wangyushan12@huawei.com>
Cc: mike.leach@linaro.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, peterz@infradead.org, 
	john.g.garry@oracle.com, Jonathan.Cameron@huawei.com, shiju.jose@huawei.com, 
	will@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, 
	liuyonglong@huawei.com, prime.zeng@hisilicon.com, fanghao11@huawei.com, 
	wangzhou1@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_090154_798254_9B33A9A2 
X-CRM114-Status: GOOD (  29.75  )
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

On Mon, Jan 26, 2026 at 4:35=E2=80=AFAM Yushan Wang <wangyushan12@huawei.co=
m> wrote:
>
> Currently, platform-specific iostat code for PMUs is implemented as a
> common iostat callback interface and invoked based on what is being
> built. This approach limits support for iostat across different types of
> PMUs.
>
> Support of HiSilicon PCIe PMU iostat was raised at [1], which uses the
> similar approach.
>
> To extend support of iostat across platforms, change common iostat
> interface to framework to allow perf to probe PMU capabilities during
> runtime and route iostat request to the correct PMU-specific functions.
> Then HiSilicon PCIe PMU iostat is supported with the new framework.
>
> Request For Test:
> Refactors has been made to x86 iostat to adapt the iostat framework, the
> probe function that checks if there's any PMU's name contains 'x86-iio'
> may not work properly, tests of that would be appreciated.
>
> [1] https://lore.kernel.org/all/4688a613-c94a-49b0-9d0f-09173c64082d@arm.=
com/
>
> Shiju Jose (2):
>   perf-iostat: Extend iostat interface to support different iostat PMUs
>   perf-iostat: Make x86 iostat compatible with new iostat framework
>
> Yicong Yang (1):
>   perf-iostat: Enable iostat mode for HiSilicon PCIe PMU
>
> Yushan Wang (4):
>   perf stat: Check color's length instead of the pointer
>   perf stat: Save unnecessary print_metric() call
>   perf-x86: iostat: Change iostat_prefix() to static
>   perf-iostat: Support wilder wildcard-match for pmus

Hi,

Thanks for the changes! Given the iostat code is display code, it'd be
great if we could avoid the arch directory usage. For example, I may
record data on a machine with a HiSilicon PCIe PMU but then want to
look at the data on an x86 laptop, as the code is under arch/arm64 it
won't get built. Given the PMU name is unique, is it possible to put
this code into tools/perf/util and determine whether to use it or not
by seeing if the PMU is present by its name? I know that means
refactoring the x86 code that hasn't done this.

A thought that is away from the iostat code and may simplify the code
base is that we could introduce system PMU, rather than CPU, dependent
metrics. Perhaps the iostat code could be replaced by a particular
metric group like Default or TopdownL1, so `perf iostat` becomes
something of a synonym for `perf stat -M iostat`. An example of what
this may look like is (unmerged):
https://lore.kernel.org/lkml/20260108191105.695131-34-irogers@google.com/
where I introduce a memory bandwidth saturation metric dependent on
uncore PMUs (either cbox or cha) on Intel. There is a metric
"have_event" function that can be used to make a metric conditional.
If you `perf stat record` a metric today and then look at the
perf.data with `perf script --fields metric` (IIRC) then every metric
that has the recorded events within it will be computed, although the
code needs better testing, etc. I suspect the biggest downside to this
approach is in how the output looks, but perhaps that can be tweaked.
For example, the `ilist.py` command:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/python/ilist.py?h=3Dperf-tools-next
supports regular metrics.

That said, I'm not against the changes, the arch directory usage, not
using json metrics, etc. and this change is doing clean up, following
existing patterns, etc. Sometimes the codebase has evolved but certain
commands haven't kept up. I think `perf iostat` is a command like
that.

Thanks,
Ian

>  tools/perf/arch/arm64/util/Build         |   1 +
>  tools/perf/arch/arm64/util/hisi-iostat.c | 479 +++++++++++++++++++++++
>  tools/perf/arch/x86/util/iostat.c        | 105 +++--
>  tools/perf/builtin-script.c              |   2 +-
>  tools/perf/util/iostat.c                 |  79 ++--
>  tools/perf/util/iostat.h                 |  21 +-
>  tools/perf/util/pmus.c                   |  12 +-
>  tools/perf/util/pmus.h                   |   3 +
>  tools/perf/util/stat-display.c           |   4 +-
>  tools/perf/util/stat-shadow.c            |   4 +-
>  10 files changed, 638 insertions(+), 72 deletions(-)
>  create mode 100644 tools/perf/arch/arm64/util/hisi-iostat.c
>
> --
> 2.33.0
>


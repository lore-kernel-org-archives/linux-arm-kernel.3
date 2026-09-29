Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F067ECA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkGqvg8vL8qJpC16ZqaKGFhzOUdsa/w+9z6yCQwg5qo=; b=vLr2OHVzK38ZlouLzZWDJ8L9c3
	zbyWVsKjrGsYwdagncFK3uDx6tqfbTG/HFwzm308Z+IDrcSK8ab2XCAKisQfOqnxbGuAiVvhz9BfH
	SAbKhUObcHT7zOJugn0QMh9Y6QmrEn2n8rbe7Jl+kPN6pDj1CbG/RUxv7fnIDYDFtWRvT1jMKByo8
	RELSWxS94crReCfwhQ4WzTNs/HBJiourrxT2W/dxQilP6IrYgD+nGgHp/isghcjBhjVi7M2U6tMRE
	PP6aQjVYH5orHy3Vml49phU5vyemfRuJklA/Q9Y5gTAZJ0YqROEzmpBfSTQFTqL8r6XNbCbL4eCsx
	HJLufZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTCs-00000002m4b-0cUi;
	Tue, 29 Sep 2026 08:28:58 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTCo-00000002m33-2LMB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:28:56 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48879d4fd8aso2274105f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 01:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790670532; x=1791275332; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dkGqvg8vL8qJpC16ZqaKGFhzOUdsa/w+9z6yCQwg5qo=;
        b=q08fR3JcTD1QlkCVZT09EQQMXCFaXwkk39a9K4OuB29AqaQxBlsH7VEgriFumGnutq
         DpVLof8rBE5oVKCBsYXH1aAzYpGOP9Vfve7wdoOfm8b/Nfl6gRmY8ACsWZy7jKQwYXFt
         cd3vifYRgdRMSJKQIha0pUXtxikD3ofrzq34u3lRROdcNdFRmqbP5UnkMDYA0Wmprl6a
         WUtHCWSqqaWdp/4f2dvf/SpHypSAfgI6KkHvSg4SepTuPoGX/KJ2QwaQADylhDn22dtJ
         mxVQUJSUFkg8dW+uCnKPP7slviwEmjHm3UlnKPpjv1INH8PvjMxI2jccYJ8Y8OjD91HT
         GsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670532; x=1791275332;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkGqvg8vL8qJpC16ZqaKGFhzOUdsa/w+9z6yCQwg5qo=;
        b=u02bY8ecJvsKl+HaweGt/o5m+TmVfjQj4zjaYdAAP0s/a6Wp/X8Ojv4/36MItgPSI3
         xurliyjSVnGapmc4iAnjcLZ0SsZ9VH/tG5kOttUOiEttvRelD72PF+Y7sGsMeokGHaCu
         8WYRnF3C8TlMwnOQumOeQMT1y4XtztGnqBwDZpsBePuyG9ZUHOszncp1vf9XHePRFwpx
         Z+py+ZNmb4jRXbwxmZm0vQ7DQIOtw+7bLWv753rYmIwgmIYzJCbRdnTJ63VlrUvBGKZA
         +2Im6NrxaF2Egodc3+XyN3dwIfHrBz0XmsocORQRNjHsWxnPQI6zSQJDbOgD23DuttVL
         gBMg==
X-Forwarded-Encrypted: i=1; AKwUvBxmsVzcTmpABxDnYkjCyG9F48bgelj4T6rXQQA82XEjT0vH3zFAuU/vbiw0szfLwfJi4wsBg1/Su1SfaNoqumMF@lists.infradead.org
X-Gm-Message-State: AFq9FYLNAZXVIN0x9hMSeL88LIMzcauP1CWgXza3jHq0hoFYkMxjxWbn
	GOIO8LdOoQeO3epWHRDzh//ZyEqNUkMGFyV+P2J4q9QO6ZgDAgDVU99N
X-Gm-Gg: AYBFou0DYVkUdbGnFl2vjiuoZpfdwQt7Uj2BUyOG00kXXKrkrlEsNSekLHOfx8bngji
	JnHuaFxE+bgGesgZZ/OI4HqDPlpqxDnfGy+oIhNL4OtpAS3mJNTGNGUSHw1SzwL9D5MNEjeB5Xk
	F0oRMoyHn2hGS1o/jrvnu7+kQWd1GrzMde1yPu0qMCU48244YlJXVUIYg+sT6yD+Ta76Fg7A3p2
	wjgCmmlYDZrSw3lEHKay0kOby8yI7O+p8d701/gV9EMXPTNBEyD8ZmYaw8jPGr8gZW3TEt4C6QZ
	XokUiJw79HR5zBvlvsiyKsXmId2mezeRNhtROsbk4NWs5iYKFZQPKIbvytvVDkY3apsvgGmaCXk
	hIP/fLX+2Zbfmf3eBIFxAR/P7u8d5T6jn1YqbJWG6DmgYKlniplFPCL0yDa8OdLWRsbTDbWVOJh
	a2MDaltN16LC7/eCeE+R6dmnWyy/wb149t4o1qUtvD5ZeC7dTJZqRDMuq8cnXgb/rQ2l6vuUhJ3
	Hh00EST0v6dKHuu5CzPpU3dnmFJ6ZM9uKQ=
X-Received: by 2002:a05:6000:25f7:b0:487:40a:5ba8 with SMTP id ffacd0b85a97d-48af5e29b48mr821503f8f.15.1790670531954;
        Tue, 29 Sep 2026 01:28:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50513c7sm2242165f8f.16.2026.09.29.01.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:28:51 -0700 (PDT)
Date: Tue, 29 Sep 2026 09:28:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, james.clark@linaro.org, leo.yan@linux.dev,
 john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com,
 pjw@kernel.org, palmer@dabbelt.com, guoren@kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] perf tsc: Replace the compile-time TSC support
 check with a weak hook
Message-ID: <20260929092850.697bce16@pumpkin>
In-Reply-To: <20260928094739.2605-3-cp0613@linux.alibaba.com>
References: <20260928094739.2605-1-cp0613@linux.alibaba.com>
	<20260928094739.2605-3-cp0613@linux.alibaba.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_012854_629843_D48F0353 
X-CRM114-Status: GOOD (  30.71  )
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

On Mon, 28 Sep 2026 17:47:39 +0800
Chen Pei <cp0613@linux.alibaba.com> wrote:

> The "TSC support" subtest of the "Convert perf time to TSC" test decides
> whether the architecture is covered by matching compiler macros for
> x86_64, i386 and arm64.  That list has to be edited for every new
> architecture, and it can drift apart from the set of architectures that
> really provide a counter: util/tsc.c already ships a weak rdtsc() which
> an architecture overrides with a strong definition when it has one.

If you mark the prototype in the .h file 'weak' you don't need a
default - instead check the symbol for being NULL.

Then you can do:
	if (!rdtsc)  {
 		pr_debug("Test not supported on this architecture\n");
 		return TEST_SKIP;
 	}

David

> 
> Add a weak arch__rdtsc_supported() next to the weak rdtsc(), let the
> test query it instead of the macros, and have x86, arm64 and riscv
> override it in the file where they implement rdtsc().  Support is then
> declared next to the counter it describes, and a caller can tell a stub
> apart from a real counter without keeping its own copy of the macro
> list.  This follows the pattern of the other optional per-architecture
> hooks in util/ such as get_cpuid_str().
> 
> x86 and arm64 keep the same behaviour, and riscv starts running the
> subtest because it gained rdtsc() in the previous patch.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  tools/perf/arch/arm64/util/tsc.c    |  5 +++++
>  tools/perf/arch/riscv/util/tsc.c    |  5 +++++
>  tools/perf/arch/x86/util/tsc.c      |  5 +++++
>  tools/perf/tests/perf-time-to-tsc.c | 12 +-----------
>  tools/perf/util/tsc.c               |  9 +++++++++
>  tools/perf/util/tsc.h               |  1 +
>  6 files changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/util/tsc.c b/tools/perf/arch/arm64/util/tsc.c
> index cc85bd9e73f1..fd7fba50d0a6 100644
> --- a/tools/perf/arch/arm64/util/tsc.c
> +++ b/tools/perf/arch/arm64/util/tsc.c
> @@ -19,3 +19,8 @@ u64 rdtsc(void)
>  
>  	return val;
>  }
> +
> +bool arch__rdtsc_supported(void)
> +{
> +	return true;
> +}
> diff --git a/tools/perf/arch/riscv/util/tsc.c b/tools/perf/arch/riscv/util/tsc.c
> index 7cc4710ac38c..312b0c755439 100644
> --- a/tools/perf/arch/riscv/util/tsc.c
> +++ b/tools/perf/arch/riscv/util/tsc.c
> @@ -17,3 +17,8 @@ u64 rdtsc(void)
>  
>  	return val;
>  }
> +
> +bool arch__rdtsc_supported(void)
> +{
> +	return true;
> +}
> diff --git a/tools/perf/arch/x86/util/tsc.c b/tools/perf/arch/x86/util/tsc.c
> index 3a439e4b12d2..6c01e96b5c2e 100644
> --- a/tools/perf/arch/x86/util/tsc.c
> +++ b/tools/perf/arch/x86/util/tsc.c
> @@ -17,6 +17,11 @@ u64 rdtsc(void)
>  	return low | ((u64)high) << 32;
>  }
>  
> +bool arch__rdtsc_supported(void)
> +{
> +	return true;
> +}
> +
>  /*
>   * Derive the TSC frequency in Hz from the /proc/cpuinfo, for example:
>   * ...
> diff --git a/tools/perf/tests/perf-time-to-tsc.c b/tools/perf/tests/perf-time-to-tsc.c
> index f8f71fdd32b1..c91e22d93b53 100644
> --- a/tools/perf/tests/perf-time-to-tsc.c
> +++ b/tools/perf/tests/perf-time-to-tsc.c
> @@ -22,16 +22,6 @@
>  #include "tests.h"
>  #include "util/sample.h"
>  
> -/*
> - * Except x86_64/i386 and Arm64, other archs don't support TSC in perf.  Just
> - * enable the test for x86_64/i386 and Arm64 archs.
> - */
> -#if defined(__x86_64__) || defined(__i386__) || defined(__aarch64__)
> -#define TSC_IS_SUPPORTED 1
> -#else
> -#define TSC_IS_SUPPORTED 0
> -#endif
> -
>  #define CHECK__(x) {				\
>  	while ((x) < 0) {			\
>  		pr_debug(#x " failed!\n");	\
> @@ -49,7 +39,7 @@
>  static int test__tsc_is_supported(struct test_suite *test __maybe_unused,
>  				  int subtest __maybe_unused)
>  {
> -	if (!TSC_IS_SUPPORTED) {
> +	if (!arch__rdtsc_supported()) {
>  		pr_debug("Test not supported on this architecture\n");
>  		return TEST_SKIP;
>  	}
> diff --git a/tools/perf/util/tsc.c b/tools/perf/util/tsc.c
> index ebf289bf6b9d..815621b1d112 100644
> --- a/tools/perf/util/tsc.c
> +++ b/tools/perf/util/tsc.c
> @@ -113,6 +113,15 @@ u64 __weak rdtsc(void)
>  	return 0;
>  }
>  
> +/*
> + * An architecture that implements rdtsc() with a real counter should override
> + * this, so that users of the counter can tell a stub apart from support.
> + */
> +bool __weak arch__rdtsc_supported(void)
> +{
> +	return false;
> +}
> +
>  size_t perf_event__fprintf_time_conv(union perf_event *event, FILE *fp)
>  {
>  	struct perf_record_time_conv *tc = (struct perf_record_time_conv *)event;
> diff --git a/tools/perf/util/tsc.h b/tools/perf/util/tsc.h
> index 57ce8449647f..83e76b207365 100644
> --- a/tools/perf/util/tsc.h
> +++ b/tools/perf/util/tsc.h
> @@ -25,6 +25,7 @@ int perf_read_tsc_conversion(const struct perf_event_mmap_page *pc,
>  u64 perf_time_to_tsc(u64 ns, struct perf_tsc_conversion *tc);
>  u64 tsc_to_perf_time(u64 cyc, struct perf_tsc_conversion *tc);
>  u64 rdtsc(void);
> +bool arch__rdtsc_supported(void);
>  u64 arch_get_tsc_freq(void);
>  
>  size_t perf_event__fprintf_time_conv(union perf_event *event, FILE *fp);



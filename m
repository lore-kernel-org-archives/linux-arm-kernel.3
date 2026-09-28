Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346A9C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoieX7gEf9mbaFA2GdnHRYMTOfTM4g2UWo3J9oxSSuw=; b=JtY2qrUymXGZVsfEL9cmA75z8u
	JVeSs6tRu/yZI26zXChqcBVwdszxxyO6DoJ5qLC+EYCfk3j4M8iOCGgnmKJawmcN85BAJtMLMN6Ha
	zcxC1Vnen6SZXq53NVPcbhCAQLuhaEpo1DMXvDp3Kupx5jOf5Ic0pE8GFyFFZBT34jaacWlydDyga
	70sRM3JesLkzUd1gxyecyx7JJmRgPcDngOJIGbOEpvcX9qAiTZH++6k1ME2MTcAo91Kt/bW+Slull
	2KHm6/398Agnxs0SHCUk4rQpcNeq8ZAEVq1FhrUYqZCBSUA7whrYAlrhs8lWpsUK0vcI2eMgLAkAM
	lUl9IzKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBd8-00000000gcz-0SmG;
	Mon, 28 Sep 2026 13:42:54 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBd2-00000000gZP-03Lg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:42:53 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4888129c46eso1639507f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790602966; cv=none;
        d=google.com; s=arc-20260327;
        b=OpG+51AmBNy2+fe+hLlHTEWNrozvp1vxhR9kQnf5xlnif4xP5fiWxof8mSB8xJjOM1
         18Z9CiSENzfNOgSMSPG/NY+xeNFnZYpmqCzlCzROykELjtfr7SL7lkIFiVDQ/avDHtpr
         1AQXtYcX0udG22oRE92MnOMci5oIej91ar1ym9bBRGzBX/yIjyqtEr2GZuy5p5x4KhAD
         hhVv6YSEJ9YQM4nklMAPzVF+1XuIMGg+y6CTknSuSJUVd6EU4tMH7vwJJAcSzTOl16qh
         WcucND+nGoNWECj3Cpqfe9SZpZ6qS6x2uAXGndlFK+amBBnoHx3yP+jmcV0TugzTg+lQ
         mHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VoieX7gEf9mbaFA2GdnHRYMTOfTM4g2UWo3J9oxSSuw=;
        fh=0zFFAKjij3OpYdjLbp9M2mgbWk2nMh9zq05B2QpINIg=;
        b=JLlk/oxkQpZN85FYnxIZJs16Pa7L6GwkqE/UH/DHqvYIy/Q6eWGMq9yvdz7fCrLyXc
         H0kSacgdPORa3ySM+zlBMcYlE/yjUVubKnK3XqRmI9m8F4IKfLL+KDsSCz2Q99D70xUZ
         3BoagTGoLM0Gu40flEFl4YPNoGMGeW2YPQkQp9A6VDYM3lBXC0bhzoFTkJl+gg6uQOI8
         Az4Pek0SfjHXI6+VpBzrSeB8QWymwTnl+6Xv+d1pl85/2c3PLhftbaLCI138XMzFqMdm
         yXmjy3JmQ+YkgRfwsXgcrkiuFUMvVjfVDDesLkb1EI6l0raDhtAfohWwtUQGuoKydYuX
         PqQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790602966; x=1791207766; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoieX7gEf9mbaFA2GdnHRYMTOfTM4g2UWo3J9oxSSuw=;
        b=qkefbo1ozjS/j8uOFJ76rR2TKhm37K1I3qyzUKD29DXvHbXh0I4gKc0Zdl8hO0JLZU
         lZnbwEbrM9yI90pkDyMzANu5q3SOW4DDFSmY0vDO1i79sUYqqOCZ550zXE8ALg3oHEUr
         Sr61x4NUO98kwC9rjgoiIjrHFmpowPqpWt2PDPFfhxuBQYkfBoa3tNtFClkwUuHvBMiE
         Q5JatLLqj0a1ZHW261qJz8S7bDdxsp+L9KMGGVgwNEh9VIVaNZZ8e+Pb3i9+IiJDsNm4
         EdkFM4rAw2Ja+rQ1B5IPeMUOy7pVKaU4xq8rNq/CBv8OMltw5ITzULBvDqSIHafzoBFk
         drMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602966; x=1791207766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoieX7gEf9mbaFA2GdnHRYMTOfTM4g2UWo3J9oxSSuw=;
        b=JNoOz6iDaZfeLL+3bLA9FZ/kWKAiKHOHt8W6P/ZKaMgEaLJhZq8GvwHrsYlPxjkj2i
         nYCPuQivIqnPndqlL9+Yl3DKDKq0YoCtf+MG11vhS2pf7DPxlrLsk2jv9UFaS6B9x4LB
         OljUqKNyXgYSn7HPgrDTiy0p6Y7hIeaLV1lr6i93r5/6oUIIr7mSsI5d6KToVQl+bzFR
         wASTxD8fuhHt5Vz8OyiVwbf20TkmSv9hbGYI44JKQtXObin5IFXmyeAC8J0G/nrMxyZW
         kbMEMLEhHGvqykPeQQy7BSOKD9D5Aui+xz/onlCLsUT3K7LOxwkjTlX9dolNQE8BPDNV
         DLUg==
X-Forwarded-Encrypted: i=1; AKwUvBww4pTPyFPJv7JyE431YKNP4ho5Yx8CR2E9RAWczHMPwHDNMlVv+rddQoMHCTeeCFQRplg1XlSyJrXS0+6k4IpT@lists.infradead.org
X-Gm-Message-State: AFq9FYLmroW4X1lZU3xLIsPGfaaJK+qoKnqoLoL1ax8CrzyzNkgiO7fr
	d83VCJTFMtrMBFo0Crzrw1em+EoJtA+ZtTFBI67rYT68sylpC9USGfnuQSdZLdN9+VFvASgVpI9
	xdali2apWZGq0Yfcuzgrsx59hIr1YivYy+ZSlS/gTIQ==
X-Gm-Gg: AYBFou1we4iSHf7P4l0dVC5dVncuTLeZIVh96CwmyFkrUBjqZYTx3zwzFwOukvXin/E
	/91ZpD7Y+0pbR3gXzlAxEhhdKY23BqtAkiYju0eJeenpliEQj7C6Ifs5xhIp7zrLRYMCJPG96h5
	7N3UHJrhixxflCav0ji9ZQv540/FrYZv888D1zG5B14rZTY8qhaHNHg3qX17DqhG3CE+uAH7LWn
	8JBof8QQjAIG8JUidGYFvxJvUmrjpo7b52t9RkRhm0MqEWOTBqKGBhjMUraC2caoePc5iVwJ0V9
	AJpt9PlC9oI/S9IxN6+btFLoSeJJn32Bcy8dy41bvRlrA4PvMFM6kvc+LV3bowYrI4EdNZuz4qd
	w3UNO8qaYzeNkQz1kqGTpkYSl0LtWTVEEpFCPFofTHdAacPh1ePc1QMnRUl4Q+ryVyUFhlHgEvc
	E=
X-Received: by 2002:a5d:5d0e:0:b0:488:7f1d:2735 with SMTP id
 ffacd0b85a97d-4887f1d288amr19321423f8f.57.1790602965883; Mon, 28 Sep 2026
 06:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260928094739.2605-1-cp0613@linux.alibaba.com> <20260928094739.2605-3-cp0613@linux.alibaba.com>
In-Reply-To: <20260928094739.2605-3-cp0613@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 19:12:33 +0530
X-Gm-Features: AclHuK-74TWd3BjhOYFsGW8F1pliz-aGiiWKp_r2qgxigINlZVJkaGpvr4QoqNI
Message-ID: <CAAhSdy0n7P+UP8M7pge7PHp_aifSsxqcsh8ahTEYjfUO8wengw@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf tsc: Replace the compile-time TSC support check
 with a weak hook
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, leo.yan@linux.dev, john.g.garry@oracle.com, 
	will@kernel.org, mike.leach@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_064248_109562_09A86D3E 
X-CRM114-Status: GOOD (  29.95  )
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

On Mon, Sep 28, 2026 at 3:18=E2=80=AFPM Chen Pei <cp0613@linux.alibaba.com>=
 wrote:
>
> The "TSC support" subtest of the "Convert perf time to TSC" test decides
> whether the architecture is covered by matching compiler macros for
> x86_64, i386 and arm64.  That list has to be edited for every new
> architecture, and it can drift apart from the set of architectures that
> really provide a counter: util/tsc.c already ships a weak rdtsc() which
> an architecture overrides with a strong definition when it has one.
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

LGTM from RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  tools/perf/arch/arm64/util/tsc.c    |  5 +++++
>  tools/perf/arch/riscv/util/tsc.c    |  5 +++++
>  tools/perf/arch/x86/util/tsc.c      |  5 +++++
>  tools/perf/tests/perf-time-to-tsc.c | 12 +-----------
>  tools/perf/util/tsc.c               |  9 +++++++++
>  tools/perf/util/tsc.h               |  1 +
>  6 files changed, 26 insertions(+), 11 deletions(-)
>
> diff --git a/tools/perf/arch/arm64/util/tsc.c b/tools/perf/arch/arm64/uti=
l/tsc.c
> index cc85bd9e73f1..fd7fba50d0a6 100644
> --- a/tools/perf/arch/arm64/util/tsc.c
> +++ b/tools/perf/arch/arm64/util/tsc.c
> @@ -19,3 +19,8 @@ u64 rdtsc(void)
>
>         return val;
>  }
> +
> +bool arch__rdtsc_supported(void)
> +{
> +       return true;
> +}
> diff --git a/tools/perf/arch/riscv/util/tsc.c b/tools/perf/arch/riscv/uti=
l/tsc.c
> index 7cc4710ac38c..312b0c755439 100644
> --- a/tools/perf/arch/riscv/util/tsc.c
> +++ b/tools/perf/arch/riscv/util/tsc.c
> @@ -17,3 +17,8 @@ u64 rdtsc(void)
>
>         return val;
>  }
> +
> +bool arch__rdtsc_supported(void)
> +{
> +       return true;
> +}
> diff --git a/tools/perf/arch/x86/util/tsc.c b/tools/perf/arch/x86/util/ts=
c.c
> index 3a439e4b12d2..6c01e96b5c2e 100644
> --- a/tools/perf/arch/x86/util/tsc.c
> +++ b/tools/perf/arch/x86/util/tsc.c
> @@ -17,6 +17,11 @@ u64 rdtsc(void)
>         return low | ((u64)high) << 32;
>  }
>
> +bool arch__rdtsc_supported(void)
> +{
> +       return true;
> +}
> +
>  /*
>   * Derive the TSC frequency in Hz from the /proc/cpuinfo, for example:
>   * ...
> diff --git a/tools/perf/tests/perf-time-to-tsc.c b/tools/perf/tests/perf-=
time-to-tsc.c
> index f8f71fdd32b1..c91e22d93b53 100644
> --- a/tools/perf/tests/perf-time-to-tsc.c
> +++ b/tools/perf/tests/perf-time-to-tsc.c
> @@ -22,16 +22,6 @@
>  #include "tests.h"
>  #include "util/sample.h"
>
> -/*
> - * Except x86_64/i386 and Arm64, other archs don't support TSC in perf. =
 Just
> - * enable the test for x86_64/i386 and Arm64 archs.
> - */
> -#if defined(__x86_64__) || defined(__i386__) || defined(__aarch64__)
> -#define TSC_IS_SUPPORTED 1
> -#else
> -#define TSC_IS_SUPPORTED 0
> -#endif
> -
>  #define CHECK__(x) {                           \
>         while ((x) < 0) {                       \
>                 pr_debug(#x " failed!\n");      \
> @@ -49,7 +39,7 @@
>  static int test__tsc_is_supported(struct test_suite *test __maybe_unused=
,
>                                   int subtest __maybe_unused)
>  {
> -       if (!TSC_IS_SUPPORTED) {
> +       if (!arch__rdtsc_supported()) {
>                 pr_debug("Test not supported on this architecture\n");
>                 return TEST_SKIP;
>         }
> diff --git a/tools/perf/util/tsc.c b/tools/perf/util/tsc.c
> index ebf289bf6b9d..815621b1d112 100644
> --- a/tools/perf/util/tsc.c
> +++ b/tools/perf/util/tsc.c
> @@ -113,6 +113,15 @@ u64 __weak rdtsc(void)
>         return 0;
>  }
>
> +/*
> + * An architecture that implements rdtsc() with a real counter should ov=
erride
> + * this, so that users of the counter can tell a stub apart from support=
.
> + */
> +bool __weak arch__rdtsc_supported(void)
> +{
> +       return false;
> +}
> +
>  size_t perf_event__fprintf_time_conv(union perf_event *event, FILE *fp)
>  {
>         struct perf_record_time_conv *tc =3D (struct perf_record_time_con=
v *)event;
> diff --git a/tools/perf/util/tsc.h b/tools/perf/util/tsc.h
> index 57ce8449647f..83e76b207365 100644
> --- a/tools/perf/util/tsc.h
> +++ b/tools/perf/util/tsc.h
> @@ -25,6 +25,7 @@ int perf_read_tsc_conversion(const struct perf_event_mm=
ap_page *pc,
>  u64 perf_time_to_tsc(u64 ns, struct perf_tsc_conversion *tc);
>  u64 tsc_to_perf_time(u64 cyc, struct perf_tsc_conversion *tc);
>  u64 rdtsc(void);
> +bool arch__rdtsc_supported(void);
>  u64 arch_get_tsc_freq(void);
>
>  size_t perf_event__fprintf_time_conv(union perf_event *event, FILE *fp);
> --
> 2.50.1
>
>


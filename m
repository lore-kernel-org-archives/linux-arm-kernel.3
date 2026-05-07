Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733AECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cstzvmusnMqk3stu6mxbLSST0VF6CjbcqqN/wNdQUKA=; b=qjDG7PsEihdGyMrwbYCyPVBiDj
	kdVBMEyVsJs2WMneGc7KLUxIMs28FVBoqt4CRLUtQCMY/Q2xumHYOtrbzinH2Dn1nQReHnyvECQxG
	f0qu6Cg2g/4SYnQpXuFxnaMPgbhprQgMwJK05Ra/wv/2iKAIQ1PlNOttKaXJzgCcJDFOGIX4v+p62
	u9XtAH8BN5r1DfAlYyNgsYuo9rLDecIsPzfH7IU03xSj6vnWqIpqHoILasuhWHWed5o8dnkQj9c4I
	aK3Msc+Ua2zzLCyn8rVLrJN7JAZvv+GLBmF8tzEn2v/XEWGJmsoEyfqnpxbx35hC5Ccmm3gQRfPqe
	rDXLrfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0wl-00000004FOH-1HA7;
	Thu, 07 May 2026 15:47:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0wi-00000004FNZ-38hT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:47:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ba180a022dso101185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 08:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778168848; cv=none;
        d=google.com; s=arc-20240605;
        b=MeASzOjQr/IbjrdYp3dnbqK36YFbodEYbv2hRvZaR4Muw+KniF8sSdO5tCcczhd6XJ
         2n0IFmXk2sIzMhpHuMMhV2Slaatz0Hiww2t9FfxD+oW4p8FNBniWnZrVAgMGCRZnEiMb
         9/7F66sDa1vsOEwyRNk0IeIwPonBGChUi2XJ/7PvwjOuhxk/RGnz8h0Y88xLFfkTqQ65
         eQZD9lT3a0nHQZah3hyknP4X5tSCdORf6o4tt/lW7z1/fKUd0E/E6s5bxGRHdEW5rEF7
         qO0RA8J9XKM6oC3otUh0ikwtpKNsoGWHeykMYDeApRtl3zb86x+geuQbbkq1e1EJBkis
         mXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cstzvmusnMqk3stu6mxbLSST0VF6CjbcqqN/wNdQUKA=;
        fh=gFJcLHT7W5n3AFjPMhy6+H1zV8KETyUlN+YFgaJxpaA=;
        b=aPuAeDUpwR0aUm/aQHX9Qui2DJJwSx5+kWXvt/64AG8mqHClHLsr4QYUKz3Zh3DK1x
         izIBf0i9GKetbWMUsVKa2XWUIxnXxdhSFs+lmP2PDNQ1x9H2xRU8CSB4kkGm7SDY1Sdn
         OqhSzcVcpfBTdvyEceM5qNtZMauIOlwVAM0kHOZp4rshmyqzPWtQRLw8uz7l5zhatIf4
         jzAsFzS1ZJdjpIRoOantRDcR3tY+gwgXuzDBZMF+cUIIhD6O4GeUpWrxM1ucZ5FUrPRX
         yTl7OExRc+KyOBseI/ZKPq0ZTN9ixSNrhu8MkenUB5rnSjyQIqkKJ9Fm/sjaK9sDD/bx
         BW9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778168848; x=1778773648; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cstzvmusnMqk3stu6mxbLSST0VF6CjbcqqN/wNdQUKA=;
        b=oEYDnU5srvGTmVDnlH9xQtLXBYa54Q4XGXRU9dLT3yDo7E6e+0nMbs/a7gvcPo3SxM
         l7RniWMeRb38DD9DrVkK2aH1QT4fMIiUdXeY98QW0DSmN1mPBq1NGJt6UJTScafL2edf
         aXkyYFaVIYldLIwMoRoB27gnXk7KP9c6uxIl1n81IxcRx7H1/ghEupOGiFxsjA0El2mj
         9LZvJ6dII0aDPktGrPG6YvGTHgsCYcrTtgdB3R4fQ+TIY0vChNLJiupqlKfijcuXn/pw
         Ub3bSEFpmF/6BNPE+qCXiVKaBZwJocQqTVHddxGJygFAgkTzCxzt65L6FDHQYMF/62B7
         /kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168848; x=1778773648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cstzvmusnMqk3stu6mxbLSST0VF6CjbcqqN/wNdQUKA=;
        b=GI5fj08ZyBsO/4VcCYmTnPw0xoz3KKI9DETLs1PVv/WCw11I+vtFQtDNlqJtR4yvRC
         BWV8ZSwt2Fz7Jmxy/gtsrTLS8HOxQlDnzq56yJUjoObb7EGibJkVVLzjbi7If1djp+Rj
         9tD6siOGQal9XRkUOwUbGmvVPh2QTLwpoVNBSv562g2/fAdndnYfWE1RZgFSwOeUERz9
         DgYnxjgkeownrLBkebTiN5X98oSqVgsZ9a4ah+uiiFPBk+WYzH7chWgaAiv/iXINEPQb
         wlIyJGHw7/ftM7eabIfnOvX8K5irKfblUM/4/RncDLfHOS8XClt3FtGfz6YOCH/AmNhP
         1SMA==
X-Forwarded-Encrypted: i=1; AFNElJ9I7ro0ejylk8LEF2P32AqJvla+PxEHCALQDCoYYWpSUVIIYuHlEnX6TCA4iX9b/oleQz4t9eOmvV7ueNlTbHLH@lists.infradead.org
X-Gm-Message-State: AOJu0Yylvc1RGVC1jPb8GyxcjkZ/hAEv3SBsDO7Rd1EScZpxT3+j1f+T
	eTM2vDpSctP2m2OV3WHwRAs3Obzr5ISdkMevClElGa/udUetYjW2cfATIJHJldSjRwk3kfC7pyb
	1Ds/eETgjIrcg0V9KtbvVrR1I9lS5youSp4e/3nEO
X-Gm-Gg: Acq92OHNQ9lNjPNvUkdrTPsaex9qZzFB1zkbbtanhIpkGDIwMuuA+jxo+UrBlU8XPF2
	HpKolMv5oEw2YVgGf02dr68ozirDqc2FnZVihu1DPKFXSB4KTZ2JTCIQarkGfEAx4gVmBNpRfg/
	B/rWKM9RhWw60cvRdoFWJKusGG7YXNsOOZmr1ikmWequAMObnK21/KmbCW7nKONZwXTSskSgbAl
	+S08/d7O4eq0qtfpzngnLQ3TXXMSXCuO4rOegNCuEvHBjbEY+cOHWY3oO7ia3/z5TiM0rFlf44g
	RJNHuJI4Ah7IOHpl7pE5neIRy7JFVdKBxaUUH6kMSBLFA4HDbtW4B8YZtZc=
X-Received: by 2002:a17:902:d485:b0:2b4:60e6:44bc with SMTP id
 d9443c01a7336-2bae5af396cmr300555ad.13.1778168846966; Thu, 07 May 2026
 08:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260507063737.3542950-1-wangyushan12@huawei.com> <20260507063737.3542950-6-wangyushan12@huawei.com>
In-Reply-To: <20260507063737.3542950-6-wangyushan12@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 May 2026 08:47:15 -0700
X-Gm-Features: AVHnY4IjsZKEkVdxEDddMGq32jUzgwPhqH7KOndqDYmspIKxL9sECLoyqSryYt0
Message-ID: <CAP-5=fW592tmsKW8WqMPodWzq2JKO5G4nHDy7LKo8PCD2RMZ1Q@mail.gmail.com>
Subject: Re: [RFT PATCH v2 5/7] perf-iostat: Extend iostat interface to
 support different iostat PMUs
To: Yushan Wang <wangyushan12@huawei.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@arm.com, 
	john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jic23@kernel.org, leo.yan@linux.dev, 
	robin.murphy@arm.com, linuxarm@huawei.com, hejunhao3@huawei.com, 
	prime.zeng@hisilicon.com, fanghao11@huawei.com, wangzhou1@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_084728_793586_B7F0A0D2 
X-CRM114-Status: GOOD (  31.24  )
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

On Wed, May 6, 2026 at 11:37=E2=80=AFPM Yushan Wang <wangyushan12@huawei.co=
m> wrote:
>
> From: Shiju Jose <shiju.jose@huawei.com>
>
> Currently, platform-specific iostat code for PMUs is implemented as a
> common iostat callback interface and linked during build. This approach
> limits support for iostat across different implementations of PMU of the
> same architecture.
>
> To address this, extend common iostat interface to provide support for
> different PMUs by allowing each PMU to register itself and receive
> callbacks to its PMU-specific functions through the unified iostat
> framework.
>
> Signed-off-by: Shiju Jose  <shiju.jose@huawei.com>
> Co-developed-by: Yushan Wang <wangyushan12@huawei.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  tools/perf/util/iostat.c | 88 ++++++++++++++++++++++++++++++----------
>  tools/perf/util/iostat.h | 38 ++++++++++++++++-
>  2 files changed, 102 insertions(+), 24 deletions(-)
>
> diff --git a/tools/perf/util/iostat.c b/tools/perf/util/iostat.c
> index a68ab100780d..90607d1cf3fa 100644
> --- a/tools/perf/util/iostat.c
> +++ b/tools/perf/util/iostat.c
> @@ -1,47 +1,91 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include "util/iostat.h"
> -#include "util/debug.h"
> +
> +/*
> + * Below iostat_* function calls are scattered through out perf stat pro=
cess,
> + * allowing multiple iostat PMUs and iterated them in following function=
s may
> + * violate calling conventions or cause incorrect display.
> + *
> + * Default to register the first PMU device that matches any of the spec=
ified
> + * iostat pmu name wildcards.
> + */
> +static struct iostat_pmu *iostat_pmu;

Could there be more than set of printing functions?

>  enum iostat_mode_t iostat_mode =3D IOSTAT_NONE;
>
> -__weak int iostat_prepare(struct evlist *evlist __maybe_unused,
> -                         struct perf_stat_config *config __maybe_unused)
> +__weak int iostat_prepare(struct evlist *evlist, struct perf_stat_config=
 *config)

Eww.. weak.

> +{
> +       if (!iostat_pmu)
> +               return -1;
> +
> +       return iostat_pmu->prepare(evlist, config);
> +}
> +
> +__weak int iostat_parse(const struct option *opt, const char *str, int u=
nset)
>  {
> -       return -1;
> +       if (!iostat_pmu)
> +               return -1;
> +
> +       return iostat_pmu->parse(opt, str, unset);
>  }
>
> -__weak int iostat_parse(const struct option *opt __maybe_unused,
> -                        const char *str __maybe_unused,
> -                        int unset __maybe_unused)
> +__weak void iostat_list(struct evlist *evlist, struct perf_stat_config *=
config)
>  {
> -       pr_err("iostat mode is not supported on current platform\n");
> -       return -1;
> +       iostat_pmu->list(evlist, config);
>  }
>
> -__weak void iostat_list(struct evlist *evlist __maybe_unused,
> -                      struct perf_stat_config *config __maybe_unused)
> +__weak void iostat_release(struct evlist *evlist)
>  {
> +       iostat_pmu->release(evlist);
>  }
>
> -__weak void iostat_release(struct evlist *evlist __maybe_unused)
> +__weak void iostat_print_header_prefix(struct perf_stat_config *config)
>  {
> +       iostat_pmu->print_header_prefix(config);
>  }
>
> -__weak void iostat_print_header_prefix(struct perf_stat_config *config _=
_maybe_unused)
> +__weak void iostat_print_metric(struct perf_stat_config *config,
> +                               struct evsel *evsel,
> +                               struct perf_stat_output_ctx *out)
>  {
> +       iostat_pmu->print_metric(config, evsel, out);
>  }
>
> -__weak void iostat_print_metric(struct perf_stat_config *config __maybe_=
unused,
> -                               struct evsel *evsel __maybe_unused,
> -                               struct perf_stat_output_ctx *out __maybe_=
unused)
> +__weak void iostat_print_counters(struct evlist *evlist,
> +                                 struct perf_stat_config *config,
> +                                 struct timespec *ts, char *prefix,
> +                                 iostat_print_counter_t print_cnt_cb,
> +                                 void *arg)
>  {
> +       iostat_pmu->print_counters(evlist, config, ts, prefix,
> +                                  print_cnt_cb, arg);
> +}
> +
> +void register_iostat_pmu(struct iostat_pmu *pmu)
> +{
> +       if (!pmu || !pmu->match)
> +               return;
> +
> +       if (iostat_pmu || !pmu->match(pmu))
> +               return;
> +
> +       iostat_pmu =3D pmu;
> +}
> +
> +static void unregister_iostat_pmu(void)
> +{
> +       if (!iostat_pmu)
> +               return;
> +
> +       /*
> +        * Release function of iostat_pmu is called on the exit of cmd_st=
at, we
> +        * don't need to call release function here.
> +        */
> +       iostat_pmu =3D NULL;
>  }
>
> -__weak void iostat_print_counters(struct evlist *evlist __maybe_unused,
> -                                 struct perf_stat_config *config __maybe=
_unused,
> -                                 struct timespec *ts __maybe_unused,
> -                                 char *prefix __maybe_unused,
> -                                 iostat_print_counter_t print_cnt_cb __m=
aybe_unused,
> -                                 void *arg __maybe_unused)
> +__attribute__((destructor))

I don't believe using this attribute is standard in either perf or the kern=
el.

> +static void iostat_exit(void)
>  {
> +       unregister_iostat_pmu();
>  }
> diff --git a/tools/perf/util/iostat.h b/tools/perf/util/iostat.h
> index 820930a096d9..5cc8963c6122 100644
> --- a/tools/perf/util/iostat.h
> +++ b/tools/perf/util/iostat.h
> @@ -10,6 +10,7 @@
>  #ifndef _IOSTAT_H
>  #define _IOSTAT_H
>
> +#include <stdbool.h>
>  #include <subcmd/parse-options.h>
>  #include "util/stat.h"
>  #include "util/parse-events.h"
> @@ -31,8 +32,7 @@ extern enum iostat_mode_t iostat_mode;
>  typedef void (*iostat_print_counter_t)(struct perf_stat_config *, struct=
 evsel *, void *);
>
>  int iostat_prepare(struct evlist *evlist, struct perf_stat_config *confi=
g);
> -int iostat_parse(const struct option *opt, const char *str,
> -                int unset __maybe_unused);
> +int iostat_parse(const struct option *opt, const char *str, int unset);
>  void iostat_list(struct evlist *evlist, struct perf_stat_config *config)=
;
>  void iostat_release(struct evlist *evlist);
>  void iostat_print_header_prefix(struct perf_stat_config *config);
> @@ -42,4 +42,38 @@ void iostat_print_counters(struct evlist *evlist,
>                            struct perf_stat_config *config, struct timesp=
ec *ts,
>                            char *prefix, iostat_print_counter_t print_cnt=
_cb, void *arg);
>
> +/**
> + * struct iostat_pmu - Callbacks for an iostat-capable PMU backend.
> + * @pmu_name_wildcard: Glob pattern to identify the PMU (e.g. "uncore_ii=
o*").
> + * @match: Detect whether matching PMUs exist on this system.
> + * @prepare: Set up events and config for iostat collection.
> + * @parse: Parse the --iostat option argument.
> + * @list: Display available iostat PMU instances.
> + * @print_header_prefix: Print the column header prefix.
> + * @print_metric: Format and print one metric value.
> + * @print_counters:  Iterate over counters and print per-port results.
> + * @release: Clean up PMU-specific resources.
> + */
> +struct iostat_pmu {

I wonder if iostat_pmu is the best name here, perhaps
iostat_callbacks? It would be nice not to overload the term PMU in the
code with regular PMUs and the iostat PMUs.

Thanks,
Ian

> +       const char *pmu_name_wildcard;
> +       bool (*match)(struct iostat_pmu *iostat_pmu);
> +       int (*prepare)(struct evlist *evlist, struct perf_stat_config *co=
nfig);
> +       int (*parse)(const struct option *opt, const char *str, int unset=
);
> +       void (*list)(struct evlist *evlist, struct perf_stat_config *conf=
ig);
> +       void (*print_header_prefix)(struct perf_stat_config *config);
> +       void (*print_metric)(struct perf_stat_config *config, struct evse=
l *evsel,
> +                            struct perf_stat_output_ctx *out);
> +       void (*print_counters)(struct evlist *evlist,
> +                              struct perf_stat_config *config, struct ti=
mespec *ts,
> +                              char *prefix, iostat_print_counter_t print=
_cnt_cb, void *arg);
> +       void (*release)(struct evlist *evlist __maybe_unused);
> +};
> +
> +/*
> + * Register an iostat PMU handler. Called from __attribute__((constructo=
r))
> + * functions in each backend's translation unit.
> + *
> + * Only the first matched backend is activated.
> + */
> +void register_iostat_pmu(struct iostat_pmu *iostat_pmu);
>  #endif /* _IOSTAT_H */
> --
> 2.33.0
>


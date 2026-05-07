Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43217CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2whKJlQ6ucWiTbs5bN7bxCBSR/cUesXgVrhn1UZxtIk=; b=Pl+H2WXlWnd+VtJ40nRwFQJTAH
	TueTTDG8DVRRQgr9uDX2PuaQsJcvYZsmFudvFfUZZaRk2PvDsNVuNGGhxlW+xlsXcRDhh5bXvrIti
	ZNN8c0E5XzUmmpGsTmvzSKjC4hioCNtjSfKV8w5iRtiUGHfQgo7CGD6G6kR6DOiKUqRk9T1QCfx2V
	KlnYmXwv46AKcO02lZurxPrfS5e9My8L0ZuFloYn3/rrN1vuuSHwcxOAAaBOAPy5H8xEZPKyIDeT1
	d0YK/xEl8O1NNN3vtXUvBeLB6bXn9r1+KHZJLTpATiK+TX5VYRtNn3hV24OhJ+DywcSfjWK9bX5W4
	TsnYeLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1QM-00000004JEd-0Y1T;
	Thu, 07 May 2026 16:18:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1QJ-00000004JE8-1xr9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:18:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ba180a022dso109795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 09:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778170682; cv=none;
        d=google.com; s=arc-20240605;
        b=NiDVQkH28cdK5M4aH2PAO35zgR9liYbijnpA2zWnk+Yf0g0hS1IE3dXf0t7RQCBCf9
         +TKgtC/MvSFGjcFoSdkLlvqZ5aHxJedTGlJ8zYN8b6kHE+PaNDqSJ97Nij7j/ri69XEe
         20qDeSp+YqXU94GV3L6wM4HfouBNopFm5NbeUGRyCs4/DCHYxzHwvArklUnn2Ptd82JZ
         z/T7LQZHZbnQHH1ATtyVMP3635ftJp/wy7ta1NLMz+JUAi3cTP7x7Ru5fzTnwzwgarS2
         sCAo9zolbOye5DCdKQ8eJkdpFDQ5VO7Cwd0hmHNCQTpbCTL1ZEQ1cJ7TuYVSscMIc9F1
         tyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2whKJlQ6ucWiTbs5bN7bxCBSR/cUesXgVrhn1UZxtIk=;
        fh=1z6T9OJvIE2blNFlvWFLVqU+RMEE9clcabUF7NoCCdE=;
        b=ZEADdejoQnxVkFWn7IIoXnf+6K9W6gpbvExxa9egWOePDIywNqY7Nj2EsPWD/qsNPV
         PaKOzi6Rkedgiz8aTav2+jM4qntUdrpLY/tzkzwZlglE8s0lXhBJvfzCwn0NAGCZ3vzP
         lyD8CLnlrS5SrUrEzRsBvC9iVBj77K4g080adzgeDx+YwiqJ0eS86Zh6Z/HU0GL9AsjO
         BPSg60W8B/lvE2ELt40ppIuz3gfjeO8KkkHYFLpeStTG5RBH2HP6dyQlf2gHEUu2kE8x
         2CVVn53IW2ZT+Qc8V5U1DN9bMLYKi4V63gMM2lKFUFkdfnAj5uVyreQ3kszVyNQ7D6Ah
         NlSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778170682; x=1778775482; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2whKJlQ6ucWiTbs5bN7bxCBSR/cUesXgVrhn1UZxtIk=;
        b=ok/IqO35aNnk6cAxS8my6DFDtndD2YVl6l7vemwUj/Wlo05kK12uxAygtrMm3dYzgT
         FuVQQBULlZR4Cs9dl8AeqHpfrCJ3DdwLtBn/FErV9YjIC/WpMqeFqBSP1G3JNUeK0O/4
         aKuwjT9nswGhWzbtfjrH1SVnKNORO4ePB9g66kBuyk7sb7tCftUVzF/jnWWCHAZcLLTp
         +f4RYk/4IeZ61AbR+I+4eCTy/yuzM3/IIObh7nujouJTCu6xCc+3cNbr61nOyhGYoj+F
         qocD7QfzbbXvdfFAxOh4v2P2zF/fYEzdSzSZXO5g37a2qAsreefFDVQHu/q9u743OHLH
         e2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778170682; x=1778775482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2whKJlQ6ucWiTbs5bN7bxCBSR/cUesXgVrhn1UZxtIk=;
        b=pY4uQXSQPywSlr1Ev8JkzgNwhZzENuSK2S4El5kF3d1qF15KHSh1LqSgRODfYox5bi
         To6vWW6Wf94/pyIRA4d3Xm4SNxhO5+/wu75GenzFmQ9iAi22Kesm0Y/KZ+qAlLO5RB8t
         vjwzeWGCngt8o5G/KAwPhqrGCJ9kVKMgAXJzGKUlOaDI+z9DteYsBlRPn6XfcAIu+JoT
         VGisZJJPv+MXtkC+lpkiOgpBABEks+gWPdLQu6jptJZXtZRAVLArvtnTr+BEmTRdlJso
         eJhPcgYXZkqK2JMzKXS2BGm8rvw75Gnc3HaC2CWbXHEYLwVxMlfTESOHMDaa3qITQzmv
         eciw==
X-Forwarded-Encrypted: i=1; AFNElJ/vKNYEhIhTN4BX4WfADrT4DvSHk2eCNTkwBkr/2oRJOFNCmpA24pFWNvmdtLzQwrOgqvpCyJYfBhCJqsf3w3CL@lists.infradead.org
X-Gm-Message-State: AOJu0YwoJslA6R6DNKsPF707ojhuEBDO77kEsWyqovM4kz43W7Qe2uPs
	aOZp47DNSyI78lyqZ0Y3wx8FHhYwoxRYT9dt7BjyQ3S60y7Qyp3VEw+lwmZeQLxcTPV9nRiclN4
	2asH3uw9L5GHK3dp2T83k4+BJxPl2qdWSvmy2RDkX
X-Gm-Gg: Acq92OHQETL2Hzoa83ZoeK1HfkmTBd4xnYBEuWsDTYa7Rr43YGMd4Dv/ro5IvyElprk
	VfBnZuG8r+5ysINUbD/J/UDZCNUlu+mq7VlIDM+Pyy8UDle7qXcM9DEpdw3p7Hr/RonsfVz2lpn
	9vtdqFFuGVbFcj5/nBKN0iPQ1m/+Gtp3jeD61cAHuZE1SO+KzRLYgOnEg/VGBRyMZQL1CNH+PJK
	cDcEsItg+S3tMFrTof4IoqQcSMHUBsTakC9N/CDzuMH1a/QzSo+f0vXOUOtHoCyGgZRWxDLQD6/
	m9QT4MFiFL3ypJ2x69r9vt2xyMnAHzfROjWvQ2sEPCuYBYh2
X-Received: by 2002:a17:902:d485:b0:2b4:60e6:44bc with SMTP id
 d9443c01a7336-2bae5af396cmr428665ad.13.1778170681845; Thu, 07 May 2026
 09:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260507063737.3542950-1-wangyushan12@huawei.com> <20260507063737.3542950-7-wangyushan12@huawei.com>
In-Reply-To: <20260507063737.3542950-7-wangyushan12@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 May 2026 09:17:50 -0700
X-Gm-Features: AVHnY4Lae1gVba_Mnp03LYU57lnp9dlmOIhz1NHsyGbgwg6zHDnudZjlWYxnk8s
Message-ID: <CAP-5=fX1ECS9ECh0WYXDr6DHSwSvqwZBKkAETxQGtwAWcpphfg@mail.gmail.com>
Subject: Re: [RFT PATCH v2 6/7] perf-iostat: Make x86 iostat compatible with
 new iostat framework
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
X-CRM114-CacheID: sfid-20260507_091803_549638_C5A1B970 
X-CRM114-Status: GOOD (  25.37  )
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
> Change the original x86 iio iostat supporter to be compatible with the
> set of iostat frameworks.
>
> The matching function of x86 iio may not be correct.
>
> Signed-off-by: Shiju Jose  <shiju.jose@huawei.com>
> Co-developed-by: Yushan Wang <wangyushan12@huawei.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  tools/perf/util/iostat.c     | 26 +++++++--------
>  tools/perf/util/x86-iostat.c | 62 ++++++++++++++++++++++++++----------
>  2 files changed, 59 insertions(+), 29 deletions(-)
>
> diff --git a/tools/perf/util/iostat.c b/tools/perf/util/iostat.c
> index 90607d1cf3fa..6c51f4a521af 100644
> --- a/tools/perf/util/iostat.c
> +++ b/tools/perf/util/iostat.c
> @@ -13,7 +13,7 @@ static struct iostat_pmu *iostat_pmu;
>
>  enum iostat_mode_t iostat_mode =3D IOSTAT_NONE;
>
> -__weak int iostat_prepare(struct evlist *evlist, struct perf_stat_config=
 *config)
> +int iostat_prepare(struct evlist *evlist, struct perf_stat_config *confi=
g)

Less "weak", beautiful!

>  {
>         if (!iostat_pmu)
>                 return -1;
> @@ -21,7 +21,7 @@ __weak int iostat_prepare(struct evlist *evlist, struct=
 perf_stat_config *config
>         return iostat_pmu->prepare(evlist, config);
>  }
>
> -__weak int iostat_parse(const struct option *opt, const char *str, int u=
nset)
> +int iostat_parse(const struct option *opt, const char *str, int unset)
>  {
>         if (!iostat_pmu)
>                 return -1;
> @@ -29,33 +29,33 @@ __weak int iostat_parse(const struct option *opt, con=
st char *str, int unset)
>         return iostat_pmu->parse(opt, str, unset);
>  }
>
> -__weak void iostat_list(struct evlist *evlist, struct perf_stat_config *=
config)
> +void iostat_list(struct evlist *evlist, struct perf_stat_config *config)
>  {
>         iostat_pmu->list(evlist, config);
>  }
>
> -__weak void iostat_release(struct evlist *evlist)
> +void iostat_release(struct evlist *evlist)
>  {
>         iostat_pmu->release(evlist);
>  }
>
> -__weak void iostat_print_header_prefix(struct perf_stat_config *config)
> +void iostat_print_header_prefix(struct perf_stat_config *config)
>  {
>         iostat_pmu->print_header_prefix(config);
>  }
>
> -__weak void iostat_print_metric(struct perf_stat_config *config,
> -                               struct evsel *evsel,
> -                               struct perf_stat_output_ctx *out)
> +void iostat_print_metric(struct perf_stat_config *config,
> +                        struct evsel *evsel,
> +                        struct perf_stat_output_ctx *out)
>  {
>         iostat_pmu->print_metric(config, evsel, out);
>  }
>
> -__weak void iostat_print_counters(struct evlist *evlist,
> -                                 struct perf_stat_config *config,
> -                                 struct timespec *ts, char *prefix,
> -                                 iostat_print_counter_t print_cnt_cb,
> -                                 void *arg)
> +void iostat_print_counters(struct evlist *evlist,
> +                          struct perf_stat_config *config,
> +                          struct timespec *ts, char *prefix,
> +                          iostat_print_counter_t print_cnt_cb,
> +                          void *arg)
>  {
>         iostat_pmu->print_counters(evlist, config, ts, prefix,
>                                    print_cnt_cb, arg);
> diff --git a/tools/perf/util/x86-iostat.c b/tools/perf/util/x86-iostat.c
> index f8d4c9718594..778655cbc2a0 100644
> --- a/tools/perf/util/x86-iostat.c
> +++ b/tools/perf/util/x86-iostat.c
> @@ -332,9 +332,9 @@ static int iostat_event_group(struct evlist *evl,
>         return ret;
>  }
>
> -static void iostat_prefix(struct evlist *evlist,
> -                         struct perf_stat_config *config,
> -                         char *prefix, struct timespec *ts)
> +static void iio_iostat_prefix(struct evlist *evlist,
> +                             struct perf_stat_config *config,
> +                             char *prefix, struct timespec *ts)
>  {
>         struct iio_root_port *rp =3D evlist->selected->priv;
>
> @@ -354,7 +354,7 @@ static void iostat_prefix(struct evlist *evlist,
>         }
>  }
>
> -int iostat_prepare(struct evlist *evlist, struct perf_stat_config *confi=
g)
> +static int iio_iostat_prepare(struct evlist *evlist, struct perf_stat_co=
nfig *config)
>  {
>         if (evlist->core.nr_entries > 0) {
>                 pr_warning("The -e and -M options are not supported."
> @@ -371,8 +371,8 @@ int iostat_prepare(struct evlist *evlist, struct perf=
_stat_config *config)
>         return iostat_event_group(evlist, root_ports);
>  }
>
> -int iostat_parse(const struct option *opt, const char *str,
> -                int unset __maybe_unused)
> +static int iio_iostat_parse(const struct option *opt, const char *str,
> +                           int unset __maybe_unused)
>  {
>         int ret;
>         struct perf_stat_config *config =3D (struct perf_stat_config *)op=
t->data;
> @@ -392,7 +392,7 @@ int iostat_parse(const struct option *opt, const char=
 *str,
>         return ret;
>  }
>
> -void iostat_list(struct evlist *evlist, struct perf_stat_config *config)
> +static void iio_iostat_list(struct evlist *evlist, struct perf_stat_conf=
ig *config)
>  {
>         struct evsel *evsel;
>         struct iio_root_port *rp =3D NULL;
> @@ -405,7 +405,7 @@ void iostat_list(struct evlist *evlist, struct perf_s=
tat_config *config)
>         }
>  }
>
> -void iostat_release(struct evlist *evlist)
> +static void iio_iostat_release(struct evlist *evlist)
>  {
>         struct evsel *evsel;
>         struct iio_root_port *rp =3D NULL;
> @@ -418,7 +418,7 @@ void iostat_release(struct evlist *evlist)
>         }
>  }
>
> -void iostat_print_header_prefix(struct perf_stat_config *config)
> +static void iio_iostat_print_header_prefix(struct perf_stat_config *conf=
ig)
>  {
>         if (config->csv_output)
>                 fputs("port,", config->output);
> @@ -428,8 +428,8 @@ void iostat_print_header_prefix(struct perf_stat_conf=
ig *config)
>                 fprintf(config->output, "   port         ");
>  }
>
> -void iostat_print_metric(struct perf_stat_config *config, struct evsel *=
evsel,
> -                        struct perf_stat_output_ctx *out)
> +static void iio_iostat_print_metric(struct perf_stat_config *config, str=
uct evsel *evsel,
> +                                   struct perf_stat_output_ctx *out)
>  {
>         double iostat_value =3D 0;
>         u64 prev_count_val =3D 0;
> @@ -452,24 +452,54 @@ void iostat_print_metric(struct perf_stat_config *c=
onfig, struct evsel *evsel,
>                           iostat_value / (256 * 1024));
>  }
>
> -void iostat_print_counters(struct evlist *evlist,
> -                          struct perf_stat_config *config, struct timesp=
ec *ts,
> -                          char *prefix, iostat_print_counter_t print_cnt=
_cb, void *arg)
> +static void iio_iostat_print_counters(struct evlist *evlist,
> +                                     struct perf_stat_config *config, st=
ruct timespec *ts,
> +                                     char *prefix, iostat_print_counter_=
t print_cnt_cb, void *arg)
>  {
>         void *perf_device =3D NULL;
>         struct evsel *counter =3D evlist__first(evlist);
>
>         evlist__set_selected(evlist, counter);
> -       iostat_prefix(evlist, config, prefix, ts);
> +       iio_iostat_prefix(evlist, config, prefix, ts);
>         fprintf(config->output, "%s", prefix);
>         evlist__for_each_entry(evlist, counter) {
>                 perf_device =3D evlist->selected->priv;
>                 if (perf_device && perf_device !=3D counter->priv) {
>                         evlist__set_selected(evlist, counter);
> -                       iostat_prefix(evlist, config, prefix, ts);
> +                       iio_iostat_prefix(evlist, config, prefix, ts);
>                         fprintf(config->output, "\n%s", prefix);
>                 }
>                 print_cnt_cb(config, counter, arg);
>         }
>         fputc('\n', config->output);
>  }
> +
> +/*
> + * FIXME: pmu name prefix match might not work for x86 iio.
> + */
> +static bool iio_iostat_probe(struct iostat_pmu *iostat_pmu)
> +{
> +       return perf_pmus__scan_matching_wildcard(NULL, iostat_pmu->pmu_na=
me_wildcard);

It feels more readable to me as:
```
  return perf_pmus__scan_matching_wildcard(NULL, "uncore_iio") !=3D NULL;
```


> +}
> +
> +static struct iostat_pmu x86_iio_iostat_pmu_list[]  =3D {
> +       {
> +               .pmu_name_wildcard =3D "uncore_iio*",
> +               .match =3D iio_iostat_probe,
> +               .prepare =3D iio_iostat_prepare,
> +               .parse =3D iio_iostat_parse,
> +               .list =3D iio_iostat_list,
> +               .print_header_prefix =3D iio_iostat_print_header_prefix,
> +               .print_metric =3D iio_iostat_print_metric,

Is there scope to push the metric printing into json? For example, you
can have PMUs with json:
tools/perf/pmu-events/arch/x86/alderlake/adl-metrics.json
```
    {
       "BriefDescription": "Uncore frequency per die [GHZ]",
       "MetricExpr": "tma_info_system_socket_clks / #num_dies /
duration_time / 1e9",
       "MetricGroup": "SoC",
       "MetricName": "UNCORE_FREQ",
       "Unit": "cpu_core"
   },
```
and do uncore type things:
tools/perf/pmu-events/arch/x86/amdzen6/recommended.json
```
  {
   "MetricName": "umc_activate_cmd_rate",
   "BriefDescription": "Memory controller ACTIVATE command rate.",
   "MetricExpr": "d_ratio(umc_act_cmd.all * 1000, umc_mem_clk)",
   "MetricGroup": "memory_controller",
   "PerPkg": "1",
   "ScaleUnit": "1per_memclk"
 },
```

> +               .print_counters =3D iio_iostat_print_counters,
> +               .release =3D iio_iostat_release,
> +       },
> +};
> +
> +static void __attribute__((constructor)) x86_iio_iostat_pmu_init(void)

I don't believe these attributes are what we normally do.

Thanks,
Ian


> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(x86_iio_iostat_pmu_list); i++)
> +               register_iostat_pmu(&x86_iio_iostat_pmu_list[i]);
> +}
> --
> 2.33.0
>


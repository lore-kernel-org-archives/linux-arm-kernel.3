Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5FBCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTYDekqrRUKGwMcBjdQn1nmLxpQn+Cw3upH2qbMNVlQ=; b=MvdjFwgWrZZ8KhdpLcCY6iggsW
	K/0mlYs2nXzm0XLiaDd8aowNoyr4FdGqvalllU+ye3IgcE6lwVDR1W7R5R9WJBcL9LNuvniCD4yNr
	6RAIi5knFNgzCWEjTkaGAc6gBUWtmafkNmz2d5TAPMKVcecXOAJXkOscoUStpTdZhFz4+xjX5OxXv
	KTuGpjnMjGOdW2+6jEz8rxnc4RDL7TFhIn6vDFVJFl4FRO08ohQq5si39u7KOccTn2TUxQP4m8nik
	7+Bw1XMZcyfwaFz+RgJxD7j0yZkDGmColYZyZeTKPs/RzyrX7KHUSBIM/kNtiA5Gt1D+JBsuoOVcc
	E1bApHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0ol-00000004Dk8-1Rf8;
	Thu, 07 May 2026 15:39:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0oj-00000004DjR-2JLf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:39:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ba180a022dso99605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 08:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778168353; cv=none;
        d=google.com; s=arc-20240605;
        b=Wd0SESMhQmxhUc4WF+ckKvveRvBMltbu7ntenafWNKhmYKzK6lR9bQeWS9XQ3Y9aPv
         K+/dff5W0QxXjy85ItMeTxcFRyWXqLAQ7gf0zdGeW+ovkV8hRZ639hJk0aroRNq+wVO5
         aPMMDefrNZQKQTuhYhC00TiyMs12BUKoD/9E8Qg4PsACojZx11jxryFZoKvGXQr6mWxa
         JPUpn4krB8pgHlO9vRbPezqV+1nxMgLUs93gKz0pRaVQu2RL03krggmtTsmXIR0t49ls
         9Jlymz2WzTKJh/4VKbNMLXcmuqEnoSHDewx1W3saYGeTrsTzXhGx6kvupGVvpvHpzvRP
         n2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gTYDekqrRUKGwMcBjdQn1nmLxpQn+Cw3upH2qbMNVlQ=;
        fh=16VYXny8eqeA1b8znsCZm5xNP3zFiv1Dwkr42zecRLI=;
        b=iAE/eSsUxSjnoEmSkQC++5fksiUJ078V/+Kx8u5JzKNrH1GvIN+ZqtEBRASVFQcSr3
         OMHYzKnat1oVF/RNOJneb/QK5PuNKyTvIoC8X6wY07+esV3mzvWQWZftSMkLuUeNTSOj
         MHuU9tN/yHl0geaqFsxnRZXfiMcqSeap+hH0t8Ac3njuEQ9iULs5JWR0jXw1yvoI9P0u
         sbjPtthhYcsqkqiQX0x8pqll3MUGOj0VaE6aB4blW+/akWYP8+AMGKemohVa7+FuHT1i
         u1SHM1i6oJEY9CnPbcJ3ehjBmThgzqNRgwVcdaHBSIeBpJWeg8UBrHJVV8ZuzLvxWexc
         rB9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778168353; x=1778773153; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTYDekqrRUKGwMcBjdQn1nmLxpQn+Cw3upH2qbMNVlQ=;
        b=Sk/XNKYSPjJs/THUFoGHrhDXpLv2wEmLnDJIyig7pWYD3XforvF7v4Fuvu30hs9130
         ipNj1MXgxw9HKY6jdPGOIAj+bTWAmZAKu/RhmS+WP/n+LTQhAL8/MB4TwsJX1d3WQi1W
         En4aDHDLy4ausNt0b73QtTW3A60zIXCN2S+zr2X81GPzTgrwiiB5FD2Ijv5yuYjnGrFr
         8AZeVrPA+3JOxDcLiPt2DQvp4rs/VkGIiXsZNKeD91zhAbwTnjhlFC+haYp1Y0HOOmXg
         IMuLwpH0efbRrS+14dhtNoFjN/cc75fQcQjDdfK7R3oWC+kM7jdZDcZ2rLKnx4OcaWbi
         mmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168353; x=1778773153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gTYDekqrRUKGwMcBjdQn1nmLxpQn+Cw3upH2qbMNVlQ=;
        b=tNe3AdkyBKHSdge35ce8P3wcXi34KCS6vSXQxn19YH/uyiVvxgtHlfx0geyLtIXLAv
         7o0Qen7ApJzu/Fy9ZyMl12pMvFvYAuHL5C2SCsaQTEVP0AZqkG6eKFg/H9YXiaJ5HhBe
         eIgQqnZUOYhSee0iaxub4l4OYOFtyRjOGPmctKc6j5loJBtrH5186Icw9aiJGTSbX3Ug
         MXkyJKLWIcwxZjxE+hNH3X7Abmx+ZBZEzCV96i98po/OvJrKXixGZUq86kbJcglZVi7Y
         fUoiIzOHRQXzIHZN8nLUn1OXqAb8ybnxibvUuG4FUTinGLttZgiCl4n7gEcyU4nPbt5P
         +uyA==
X-Forwarded-Encrypted: i=1; AFNElJ8M04Ga0WFlB86HT4vkIYRjelPvdHyi0XacKOqYYWy3JmjQrtdSf/QxVEMl8WBvavUhro/eKQv9RwHXoECJ0is+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrz8R/R5OwOx4mQTfbIAzhQKn5eV1O2tvDqvMcnV+7M5koOVBL
	ieVMESG/o2PDIUQqSFU8dxobhLI4C9+s1oX3jfy4ZN5hx4MUNhg9OTgpSDqc/HRVyWMWtNfBkae
	2wE3HpgqUqTdDV6r01svyHQtVkAIjZCqBzR8IjcFn
X-Gm-Gg: AeBDieuJardE5STPC1SwJyCoAGGB5j3oe1Bn4+HCbL8OppJhMcPjgu4z5eWxx3iYVco
	XJiP/kc8wg6LNqwc5fVGjizZlSiGLIpwPMHFZNlVruVFbiw06zGuHPbKYCu36p6+SCmA590xvXP
	fAOyLL14AhSyHsqQ89vxdZZSemp3S8z2WXxgXK2UgAa6GIVJRtYrM/Pa8HvEdCFauhG4F2f5gQf
	dXfbgl3f+JXzc/mF59xSCgnQOoT5uFvU5cI8LyMI2YbGsUuxsbxrbE6spATIbSKo/7RrTeJes9h
	XZ4nNu49q42wehDajw5se7apeQMJ56QkJDtn1/GaD5PE2qEAtf9r7yh/FD4=
X-Received: by 2002:a17:903:1b63:b0:2a7:6c4e:5914 with SMTP id
 d9443c01a7336-2bab602610emr4140185ad.6.1778168352129; Thu, 07 May 2026
 08:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260507063737.3542950-1-wangyushan12@huawei.com> <20260507063737.3542950-5-wangyushan12@huawei.com>
In-Reply-To: <20260507063737.3542950-5-wangyushan12@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 May 2026 08:39:01 -0700
X-Gm-Features: AVHnY4JkF3wXUtyPgEEQCuM_Et67c3otP3W1Tw-K0ZP-yh5Rc7qin9Nk03qhBV8
Message-ID: <CAP-5=fUVf-6Xcd+xQBm9FbwbWsUff0PYuH54mrBkLeVyU2cj8Q@mail.gmail.com>
Subject: Re: [RFT PATCH v2 4/7] perf-x86: iostat: Change iostat_prefix() to static
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
X-CRM114-CacheID: sfid-20260507_083913_595377_3CCADE91 
X-CRM114-Status: GOOD (  21.86  )
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
> Change iostat_prefix() to static function, since it is not used outside.
>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

Reviewed-by: Ian Rogers <irogers@google.com>

> ---
>  tools/perf/util/iostat.c     |  7 ------
>  tools/perf/util/iostat.h     |  2 --
>  tools/perf/util/x86-iostat.c | 44 ++++++++++++++++++------------------
>  3 files changed, 22 insertions(+), 31 deletions(-)
>
> diff --git a/tools/perf/util/iostat.c b/tools/perf/util/iostat.c
> index b770bd473af7..a68ab100780d 100644
> --- a/tools/perf/util/iostat.c
> +++ b/tools/perf/util/iostat.c
> @@ -37,13 +37,6 @@ __weak void iostat_print_metric(struct perf_stat_confi=
g *config __maybe_unused,
>  {
>  }
>
> -__weak void iostat_prefix(struct evlist *evlist __maybe_unused,
> -                         struct perf_stat_config *config __maybe_unused,
> -                         char *prefix __maybe_unused,
> -                         struct timespec *ts __maybe_unused)
> -{
> -}
> -
>  __weak void iostat_print_counters(struct evlist *evlist __maybe_unused,
>                                   struct perf_stat_config *config __maybe=
_unused,
>                                   struct timespec *ts __maybe_unused,

This change doesn't remove the weak symbols, but they should go. We
should use the ELF machine to determine which architecture version to
use.

Thanks,
Ian

> diff --git a/tools/perf/util/iostat.h b/tools/perf/util/iostat.h
> index a4e7299c5c2f..820930a096d9 100644
> --- a/tools/perf/util/iostat.h
> +++ b/tools/perf/util/iostat.h
> @@ -35,8 +35,6 @@ int iostat_parse(const struct option *opt, const char *=
str,
>                  int unset __maybe_unused);
>  void iostat_list(struct evlist *evlist, struct perf_stat_config *config)=
;
>  void iostat_release(struct evlist *evlist);
> -void iostat_prefix(struct evlist *evlist, struct perf_stat_config *confi=
g,
> -                  char *prefix, struct timespec *ts);
>  void iostat_print_header_prefix(struct perf_stat_config *config);
>  void iostat_print_metric(struct perf_stat_config *config, struct evsel *=
evsel,
>                          struct perf_stat_output_ctx *out);
> diff --git a/tools/perf/util/x86-iostat.c b/tools/perf/util/x86-iostat.c
> index 7442a2cd87ed..f8d4c9718594 100644
> --- a/tools/perf/util/x86-iostat.c
> +++ b/tools/perf/util/x86-iostat.c
> @@ -332,6 +332,28 @@ static int iostat_event_group(struct evlist *evl,
>         return ret;
>  }
>
> +static void iostat_prefix(struct evlist *evlist,
> +                         struct perf_stat_config *config,
> +                         char *prefix, struct timespec *ts)
> +{
> +       struct iio_root_port *rp =3D evlist->selected->priv;
> +
> +       if (rp) {
> +               /*
> +                * TODO: This is the incorrect format in JSON mode.
> +                *       See prepare_timestamp()
> +                */
> +               if (ts)
> +                       sprintf(prefix, "%6lu.%09lu%s%04x:%02x%s",
> +                               ts->tv_sec, ts->tv_nsec,
> +                               config->csv_sep, rp->domain, rp->bus,
> +                               config->csv_sep);
> +               else
> +                       sprintf(prefix, "%04x:%02x%s", rp->domain, rp->bu=
s,
> +                               config->csv_sep);
> +       }
> +}
> +
>  int iostat_prepare(struct evlist *evlist, struct perf_stat_config *confi=
g)
>  {
>         if (evlist->core.nr_entries > 0) {
> @@ -396,28 +418,6 @@ void iostat_release(struct evlist *evlist)
>         }
>  }
>
> -void iostat_prefix(struct evlist *evlist,
> -                  struct perf_stat_config *config,
> -                  char *prefix, struct timespec *ts)
> -{
> -       struct iio_root_port *rp =3D evlist->selected->priv;
> -
> -       if (rp) {
> -               /*
> -                * TODO: This is the incorrect format in JSON mode.
> -                *       See prepare_timestamp()
> -                */
> -               if (ts)
> -                       sprintf(prefix, "%6lu.%09lu%s%04x:%02x%s",
> -                               ts->tv_sec, ts->tv_nsec,
> -                               config->csv_sep, rp->domain, rp->bus,
> -                               config->csv_sep);
> -               else
> -                       sprintf(prefix, "%04x:%02x%s", rp->domain, rp->bu=
s,
> -                               config->csv_sep);
> -       }
> -}
> -
>  void iostat_print_header_prefix(struct perf_stat_config *config)
>  {
>         if (config->csv_output)
> --
> 2.33.0
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7595D19501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGAy20/G0aLhcGacwfot8jtNaLKVL17HJucsdvURcXU=; b=0Yh5QArT+kmwHL02gpc08fCi16
	hmzAbCq3/ONIZ8wj0CK1oCsWbaEFXmurG0gGhTV7g8FzCcvZDqvY/0XBGDw2qv2ljJXJSuOfDofCz
	sAxe7hOol9waAQhrYKBpuyg2sDsV8bQMs7AFjIvaP75nfbSjshxyqjgaHTqnj6QfTZPCbckDUuB2P
	Mf+WxHWEopfFnY5C9a4/wlmszSaaenalIaJTEpIumFmw+pDQKA3CvJjOR4eg+C+a+x60OMEv6ZiBG
	BveShlNplYDuxStwE4HcakVCC/zhBLjhEaOdUQxSkNvusDjltqtB9FNI06/CbcF//IJkRkEltpsH5
	6M3Z5GzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPhL-0000000Csok-2nLt;
	Mon, 26 Jan 2026 16:44:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPhI-0000000CsoE-1Ypv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:44:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0d06cfa93so151135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769445855; cv=none;
        d=google.com; s=arc-20240605;
        b=GAtyVlRkiT+Z1UuX8bKwwttcr3KfURx8XC+RjQPV75vIOnKvCu67KXe9xL1NbxBmsl
         q/DS0P9xtyRNw5LPpBATAWFPgWwlb3nXymM/Y3gyIxt76GmEY9Jmfc7Zsupc7g8GmHNx
         AM95TvTfkKD01qnIuRBiqpNMUwBTCcNe8gmigjLEGh5DWJDD71WJr2cbeFulkizt3tWt
         veSqtGeROBxL2I2eOrtdsZlBw+imfFrCH0kXs7BKFY0m7hbcldDJqtQbF6sT2V3ttKrj
         S+MNHYGTPBki3Mw+A61RPcCqA1oRhZlxk7g5TCY/hWOveH8RL7ObSgWZ4IkzNHFNAO3n
         ixlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mGAy20/G0aLhcGacwfot8jtNaLKVL17HJucsdvURcXU=;
        fh=otXK4XViHQk1geilx75b5H6RVK7Ia04NJ9wvwiMpIq8=;
        b=NNF8KcEw3Y1ChouyF8vLyvxRb8EetuOiQKWNZRYJKkyra2gp/WjmPWAVJqHGeSTb2A
         TNAzvvJSxHqmNJWzk6DkLFH+rK+bYs8HaOdpIsiXI0RCDuL+cIu4LbeTcRh1Y+2vbal8
         rd+qHGs5qaCROm6U5y9YHfhBiQhtqO8n2qD/KvIgnzrkywCnHaC59TjSKJmv0uC6aU/p
         UIt2ov4zC2yJ9OwyVaEg/n1v8hAWUdMeMKVLBDsmpWNDWwlYWBC4q5KMwu8x9oQ5i/cy
         sWgpsixDfWzRa0Z3SIjJ8RtpxV3CHBgwDRkbbUimo1eH0DF4a9rOe1FObHW+9XbqGsiT
         BmCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769445855; x=1770050655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGAy20/G0aLhcGacwfot8jtNaLKVL17HJucsdvURcXU=;
        b=jR9AOdtSUrF5HEsVVDgrKp19kVV4/bDKHpbsj/gCaUT1vJN8WshcnDif86pBglHMR/
         fHsO3uQZwIjxOMz8SGLNOlGOkGMunNoG2iR0inKt0ZIm6TocsCVElaruLRNBqCEtdEZ0
         1IqugwAe/ypmGP5AnF9xBO8zkMkdQifwAGyHnwxKZjwnwfyy7NRPGjXg/1w4nmFZ5Pkg
         MIdvwJALxs5TmGW695NGh4UdeetomKxlI/YazDGSjR8XLTp40cbVi/gNMgoYACt2Uzzp
         X2PGDR0tX0ISx7NWTLY5p1sINQ2qBHPL5QDFQvVrXXUXWV6vHobzphcGHmrN5PoBbzUt
         zvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769445855; x=1770050655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGAy20/G0aLhcGacwfot8jtNaLKVL17HJucsdvURcXU=;
        b=wtutG35XywO73EPPglnDnHujmxSX4Sv0nhMvN35lMIl5bEyASfZMJk7UEswEd/Pr0h
         nLFdNP9/EYECpZg4yuVDp7nQkXHN9rL/l+nOifOsy3hKpbKJqYA9pCEHaHJm1OTr6JvS
         U8ch7JA5/Syk8GM3u7Ikxnw8HdH07L0C5nANaSJM0LVOylLn/+YHQ77NrwPlCNCT86fC
         /Wq8uRYTno1Pl2MjNp90XvoWFxlbXuF1rr8VkG6m4cCkBByjMy9CA31Sada3fHycu5yf
         9gfaVUJyWb3aAV7DgbUeNaqdGF46rrdjE9NMRiauotly9m593/Ksug336Ljgv1DjVos3
         Btdw==
X-Forwarded-Encrypted: i=1; AJvYcCXmlcNgarBD691ElK46k+tcEhRUaxxdxK0Z4Aipc6irsgED5201yjr5uebnJen/IivdR+x2/0H/5y2LAxYv0waN@lists.infradead.org
X-Gm-Message-State: AOJu0YyewIZvQktI2GXj4dOWhvhrG7YoNv1UdFZVMdSjodNhVmubMVOi
	9KO6s/cE0yNRTQwRQPgq+HWlYASPWd+gUd2aPIz8uDDNQhm1zzJcgGztH1UNXxhFXKvJrMscT60
	CN1jEJGeqKtTpcQmRTA5pYdEDSFl7iylqAJIXID7R
X-Gm-Gg: AZuq6aImLyG4WXh/n82uy0+ggKEWQWWrbF2tBfOSp7q9mzg0KvYbHsemsLnSRaRXRlL
	M6sM4uDTiV1ASCwUDYq0Wv/RhA3Rqj2XtSpmv6Zh8yoQ6B3xHHGaeBQ0BRM0fy7vzurXbHAWhEg
	cQFUTTePicIsDGk4f10A/C4QBDx34mXPmW51/GIsqKHgDSnCEDwdpeym27DbZxsHAhuYaLeT25k
	9Thw0uSKJqWCE3ilcM/Sqe1LuoE2zQoV4TBhRJqw8tazC7a949T7HGHUwikf8a7g2GpzJ6cNSOn
	Rv1JO6SWhmVVeEiOH71fUw03Fb1AByEUyb54
X-Received: by 2002:a17:903:384d:b0:2a7:6c4e:5924 with SMTP id
 d9443c01a7336-2a844e5b2d4mr2521265ad.12.1769445854175; Mon, 26 Jan 2026
 08:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20260126123514.3238425-1-wangyushan12@huawei.com> <20260126123514.3238425-6-wangyushan12@huawei.com>
In-Reply-To: <20260126123514.3238425-6-wangyushan12@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 26 Jan 2026 08:44:01 -0800
X-Gm-Features: AZwV_QjpSdff-setUw1tB91cPILzxIvHf82sL-c45HvujlcAZIHtKG667DnWY6U
Message-ID: <CAP-5=fXJSPbZkSvcLMEM7rdaGqYJGzrh+8qmZodrWy=ZGVRp_Q@mail.gmail.com>
Subject: Re: [RFT PATCH 5/7] perf-iostat: Support wilder wildcard-match for pmus
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
X-CRM114-CacheID: sfid-20260126_084416_437658_F0917AD6 
X-CRM114-Status: GOOD (  21.33  )
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
> Current wildcard matching of pmu names only support the form of
> "<pmu_name>%d", which may not be sufficient for pmus with other forms of
> name (e.g. HiSilicon PCIe PMU has the name of "hisi_pcie%d_pmu%d").
>
> To address that, change the wildcard matching function into a callback,
> and add a new version of wildcard-matching function using the callback
> to support more flexible pmu names.

There's some discussion around PMU name matching here (and the replies):
https://lore.kernel.org/lkml/20251231224233.113839-12-zide.chen@intel.com/
that I think is relevant.

> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  tools/perf/util/pmus.c | 12 +++++++++---
>  tools/perf/util/pmus.h |  3 +++
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
> index 98be2eb8f1f0..35184d477d07 100644
> --- a/tools/perf/util/pmus.c
> +++ b/tools/perf/util/pmus.c
> @@ -402,7 +402,8 @@ struct perf_pmu *perf_pmus__scan_for_event(struct per=
f_pmu *pmu, const char *eve
>         return NULL;
>  }
>
> -struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu,=
 const char *wildcard)
> +struct perf_pmu *perf_pmus__scan_matching(struct perf_pmu *pmu, const ch=
ar *wildcard,
> +                                         perf_pmus_match_t match)
>  {
>         bool use_core_pmus =3D !pmu || pmu->is_core;
>
> @@ -436,19 +437,24 @@ struct perf_pmu *perf_pmus__scan_matching_wildcard(=
struct perf_pmu *pmu, const c
>         }
>         if (use_core_pmus) {
>                 list_for_each_entry_continue(pmu, &core_pmus, list) {
> -                       if (perf_pmu__wildcard_match(pmu, wildcard))
> +                       if (match(pmu, wildcard))
>                                 return pmu;
>                 }
>                 pmu =3D NULL;
>                 pmu =3D list_prepare_entry(pmu, &other_pmus, list);
>         }
>         list_for_each_entry_continue(pmu, &other_pmus, list) {
> -               if (perf_pmu__wildcard_match(pmu, wildcard))
> +               if (match(pmu, wildcard))
>                         return pmu;
>         }
>         return NULL;
>  }
>
> +struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu,=
 const char *wildcard)
> +{
> +       return perf_pmus__scan_matching(pmu, wildcard, perf_pmu__wildcard=
_match);
> +}
> +
>  static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu =
*pmu)
>  {
>         bool use_core_pmus =3D !pmu || pmu->is_core;
> diff --git a/tools/perf/util/pmus.h b/tools/perf/util/pmus.h
> index 7cb36863711a..9308afb5a7b8 100644
> --- a/tools/perf/util/pmus.h
> +++ b/tools/perf/util/pmus.h
> @@ -9,6 +9,8 @@ struct perf_event_attr;
>  struct perf_pmu;
>  struct print_callbacks;
>
> +typedef _Bool (*perf_pmus_match_t)(const struct perf_pmu *, const char *=
);

nit: can we use stdbool.h and make this return a bool?
nit: in general Linux style is to avoid typedefs:
https://www.kernel.org/doc/html/v4.10/process/coding-style.html#typedefs

Thanks,
Ian

> +
>  size_t pmu_name_len_no_suffix(const char *str);
>  /* Exposed for testing only. */
>  int pmu_name_cmp(const char *lhs_pmu_name, const char *rhs_pmu_name);
> @@ -22,6 +24,7 @@ struct perf_pmu *perf_pmus__find_by_attr(const struct p=
erf_event_attr *attr);
>  struct perf_pmu *perf_pmus__scan(struct perf_pmu *pmu);
>  struct perf_pmu *perf_pmus__scan_core(struct perf_pmu *pmu);
>  struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const c=
har *event);
> +struct perf_pmu *perf_pmus__scan_matching(struct perf_pmu *pmu, const ch=
ar *wildcard, perf_pmus_match_t match);
>  struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu,=
 const char *wildcard);
>
>  const struct perf_pmu *perf_pmus__pmu_for_pmu_filter(const char *str);
> --
> 2.33.0
>


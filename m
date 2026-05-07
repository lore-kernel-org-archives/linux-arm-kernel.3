Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F504CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJRPPZKaWZPC+g2g3YyNOX1Fvmg1nX5oE76KRCNN+u8=; b=HrWhJIDCLiMIgAvXaKPBd2TMgA
	Uxq/3U+a04mMwOGztVKfuzdJ9Yxjd21MrvNrd0Be0CW+tw6+z+cKPZtJnOafS6Qyz44Sc/82Fqe/o
	RxM4fIuapHUwKqhxfJL6wo1Kz2LJVOhQh+5vmcqJGZOXAKgDiR2SCEil+4aa9QckNyTdPK77VVRxq
	vkkY8UXzDlMoUTurcU1c3CGL471dzTX9XiUkcm+FZM6Lkcn/qQbwewTbKT82OizlaKSQ8TBy9sIdE
	SdK6lzXLoZOsIKzAJA9Rp6YULyhzuwVj3sRcqwoiXLxZ22Y+eynWPwT/1QWG3z3i2NtOo6XBci6tA
	MaO4Lt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0gh-00000004CAV-3cgw;
	Thu, 07 May 2026 15:30:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0gf-00000004C9j-33kQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:30:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b46da8c48eso95595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 08:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778167850; cv=none;
        d=google.com; s=arc-20240605;
        b=I5lSmdemo6kEDy38hFdAKLmUe2uf4mAykfcqVzYmkd5GEl/xQ3SEgowvTNs991zoys
         lUyzwQz8nePncnqB4v5bvufuRkjjcg1TcY9jH9EZ4K2dZ+o6DgXsyC0pxkK8okal9xuQ
         NHOgeWV51en2dwHk2xDiP6yZg0bwpUvI8zuDqtgKkibqcUb7ZuaFnRkWVtcXskJVZ0W5
         yqiWW3rrwzPPw/yJAEzzqCcaWj+s1wu4nYKpDNrtgRyd6A0U7NMOj/9XnMTExxpLUhn/
         2jaoYRCGQOqrinxEaFH0m1L7DC98SPS5G3Gu7u37rX+BRJLCtJG1Z4DtSsclaHPFdmYO
         xAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJRPPZKaWZPC+g2g3YyNOX1Fvmg1nX5oE76KRCNN+u8=;
        fh=2OVPKM066kVvMIO01Ved1EIkVH7OpSKHQtt2cOiSPNE=;
        b=SrjUFy5Kf20mH8SSe6BoVhY7OoH7cu5nP7fBQ0gjbhcJoaKcPAJsbSDVAzYt+URYB7
         SCT5psN3Ls9zLb/30DeM1bprEthUFNj8jlQ6h6Jmdom7qYN0y/+56drvwxIWaEVGg6Pq
         hOnkV1dBHDhwLIj8r5dvYTZDRI45aLMzRdODb3QpAs8KHQZhD52GySJrosLXXME+yYk8
         L89cszzJKXMNTv5wS0VX5Tbn2YsQMZGsv06LquHzsaqTMTQ0ZrhV40MlB2VYsCzOhq8l
         29YWrRqU7acUw51D2V8MFC4x0VArK9WmjfxRaktl2tmcfcNpYc7Jl9ULK6C6hazYwMBx
         fleQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778167850; x=1778772650; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJRPPZKaWZPC+g2g3YyNOX1Fvmg1nX5oE76KRCNN+u8=;
        b=Qakeg8AJ64fpZx3bPUpXXj04wSqngJ57i3SHRvdf+JmiG0MzkdWdAVr75YWjWnVoKK
         1odQkEcwnijrcLknVVaIVCoZKUuOCY2lulAxW5eMIkg+L2iQco8ePUrdIMcNyKGHgpyb
         YI5rLIz8yTwinGfKjvof91Z679z8DODyyVoqRQ+LgXNf5o9Pnksc9k2ONy3PYE0YvaEg
         nMyi5jBALeYczHMnaU+bdGQXlMf2hmbSSbQWx3iUB1s9ly1Q8K0PZtDt/dEGm4E3XtdB
         7MudbOcE1Iu/EGmqiFWrahowWrRCZ8GLmRXGeli8nj+JYqxzmE5JBIu8tvkj1LEEQgi8
         Lvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167850; x=1778772650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vJRPPZKaWZPC+g2g3YyNOX1Fvmg1nX5oE76KRCNN+u8=;
        b=Uuxm8XuJFyxnI4++dM7ssa6uTMFp1Svy9fFW7+lKCXe4Fhrcl6AX5Pg31hVq0ljIFT
         lskCSPxrjRYjFvrTxuWBL6EOrDM9T1teF5DzaXSzknhsQruyjDVHVeb/kU4YQpIriWki
         2Oet3txG9Bjr8jNWHDQe28YvGB2Ed4Mul2IMvb55BCfNs03gBaumiHSyBJE9zzpghpAJ
         7z4UUSpDkbYqG8VVcXUJlOUrZ1F00S29kCbiR8M2BN23JJ1l6kJcLiWXLe0joXoXqdFn
         FHx/MFmd+d9j+LccviPViOAAgfQ/an3XapFcEs7X4Iriu2AwlMYTqHfjgarQHMGw8N6l
         Ijiw==
X-Forwarded-Encrypted: i=1; AFNElJ8tYvG+fZm8K4C/LCkxdAVkUdwDiK975+bhMcOmthHEqYb+CP0gt0lpFXGcJ1GZkpTY4rBYv8yfVnfyyMyeVv82@lists.infradead.org
X-Gm-Message-State: AOJu0YyNhZSXyRLQmcGZOPo99wmFhdh7CCKnKRgXV2/ZIhZNZeb4Wt4+
	8HYuqEWIyT6Bzw/h6VZem3/A6H1bH9hSwLUNXjKBRX0vhg5Noz6O/gdhdpyigbjoglAd9lFrcH7
	3rkwM3eeYkld1rih1sSSYADbFHb0s065EjlmCvmof
X-Gm-Gg: Acq92OHSDP6QVkULhItP0U6j0v/cGNj1juKmiedKFSkhytfaZh9jwSWyJ5Jg7ViZNeg
	ZwARJj9sfSk0OYhUO1+3mZ3+glzx330n9BYfUZP9pmu22JSd33OF5KDjPG1bKCwtXJuHsjs62bE
	xiMC/z7UjKGfMvo8yhJzzNGFNYPCWLg5K2yh3TtOliIg0PPWd7UcWmdMprS62FkbQ/ELQcYVW8z
	8+N5FxrtExY2prS911X1sQQbjG2ZzDQTH9oWB1l2CJUveyUovphdKkt75IuCRS8uUwYu9UzKNMH
	3FP0HUCa/GwHsxbkr5J/XBOHvX63J50HJsn5jy3I1xebEpH1AdVGEmhKUJM=
X-Received: by 2002:a17:903:2656:b0:2b8:e82d:ff7c with SMTP id
 d9443c01a7336-2bae59d0059mr292905ad.9.1778167849553; Thu, 07 May 2026
 08:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260507063737.3542950-1-wangyushan12@huawei.com> <20260507063737.3542950-3-wangyushan12@huawei.com>
In-Reply-To: <20260507063737.3542950-3-wangyushan12@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 May 2026 08:30:38 -0700
X-Gm-Features: AVHnY4I4QvxZzqwfpnvEbeIlSMNnhQaDf0SBrzeqp55KmSJ1VSkv32i2lPyqqXA
Message-ID: <CAP-5=fWkRD17T2iMTAPF8kjkkpW+BaeyxA3EzxXatRc1vN4QCQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 2/7] perf stat: Save unnecessary print_metric() call
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
X-CRM114-CacheID: sfid-20260507_083053_775606_4B361BA4 
X-CRM114-Status: GOOD (  18.57  )
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
> The patch listed under Fixes removed the other branch of iostat_run, and
> changed num to 0 since it is the default behavior of it. But during
> iostat_run, default value 1 of num is required to avoid print_metric()
> call later.
>
> Set num as 1 to avoid redundant print_metric() call that causes
> unaligned blank printed.
>
> Before this patch:
>
> root@localhost$ ./perf stat --iostat=3D0000:20:0f.0 --timeout 100
>
>  Performance counter stats for 'system wide':
>
>     port              Inbound MWR(MB)      Inbound MRD(MB)      Inbound C=
PL(MB)     Outbound MWR(MB)     Outbound MRD(MB)     Outbound CPL(MB)
> 0000:20:0f.0                 0.00                                      0.=
00                                      0.00                               =
       0.00                                      0.00
>                             0.01
>
>        0.100138030 seconds time elapsed
>
> After this patch:
>
> root@localhost$ ./perf stat --iostat=3D0000:20:0f.0 --timeout 100
>
>  Performance counter stats for 'system wide':
>
>     port              Inbound MWR(MB)      Inbound MRD(MB)      Inbound C=
PL(MB)     Outbound MWR(MB)     Outbound MRD(MB)     Outbound CPL(MB)
> 0000:20:0f.0                 0.00                 0.00                 0.=
00                 0.00                 0.00                 0.01
>
>        0.100127590 seconds time elapsed
>
> Fixes: b71f46a6a708 ("perf stat: Remove hard coded shadow metrics")
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/stat-shadow.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.=
c
> index bc2d44df7baf..0056444523d6 100644
> --- a/tools/perf/util/stat-shadow.c
> +++ b/tools/perf/util/stat-shadow.c
> @@ -326,8 +326,10 @@ void perf_stat__print_shadow_stats(struct perf_stat_=
config *config,
>         void *ctxp =3D out->ctx;
>         int num =3D 0;
>
> -       if (config->iostat_run)
> +       if (config->iostat_run) {
>                 iostat_print_metric(config, evsel, out);
> +               num =3D 1;
> +       }
>
>         perf_stat__print_shadow_stats_metricgroup(config, evsel, aggr_idx=
,
>                                                   &num, NULL, out);
> --
> 2.33.0
>


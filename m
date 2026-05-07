Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B562CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VqyUqV5RyIPeVejA62ttbxcIeN0YeIM9mFOL0GF+tM=; b=L4kuWYSvoMbqqRQLIvvHsejOk8
	A9AdzTXZO3HbWqZ7wrEPIWBF7oHwF14ZjHOzMpAGUH1fidry+kZEwDD9BsTfWQ6ocwbZrFlknONW1
	V1jHkkGwYDcMAGbVYi78EzJpXhEEW3hWp9hbV+R9a9MZ93ycvLBrt83jba3J3SBNuLV1XSaZtWb9o
	16TbboK4q3ptHpl1RVrgcV+iM0+oTXMin12yJ7/fqmWmUQ8qEZkv/+RjCUPCi6t8dEGhYz6zzAuF2
	iRpnQupv8hOyttRlUu/QRrDTDcmkLNOFGCBv4YcEsJi4sFw6SYN39ZafUetnFjtAAzJoVsz1kuBG5
	+HGcU3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0j3-00000004Cbn-1i0o;
	Thu, 07 May 2026 15:33:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0j0-00000004Cb7-3tSU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:33:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ba180a022dso98765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 08:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778167998; cv=none;
        d=google.com; s=arc-20240605;
        b=iNbYvC6ZFR00/qCalcq0vhlQRJpjuw2AJsQEpWlkHu5TuAc/dGRc/UNgZ8+/epe92D
         Dc2tDGwQVKG4B3+ZQaPCpgZYfstgZremJZFvYT/f3T3i9AL5skdLCiouZCOxVySp/J/D
         TJSNgkEvGr8xt5tL0cezEHShrgeWTmaDQMX8fQ1ngiThxUyxsfwL25vHLQad2OckPRpX
         8BaF0XSj5ussWnnwxjIqM9DGDlfwEQFmA3DzN7XC/l93HJzD0I/MaC+A1WwCJNqtjr+K
         h5FiUfz8ymtT6LxtvILaTqBVkqhL5yZ4V4c8tsIMbHGXt1NCaTPE3L5x3CeDb8vFjSws
         UhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7VqyUqV5RyIPeVejA62ttbxcIeN0YeIM9mFOL0GF+tM=;
        fh=2daIkmjt7qSg8AErQxihdNL8MRgxDS8qhBWbGG2MEQc=;
        b=Br5E+r45TN/0FB2F1H+f30J/jx+paz1U0SuPNC6cCBu/Xos6shGfVNVrHQuEwoECeb
         jeSqXjH2Z3QQiEDOZMmpTii2mJ0UmW6d3g1UZ7B+kz6ZWX4K9joFSQXNmUjZxiu9FZJj
         6jyO88VPiw2apYIz6chZ9XKNxsfClH3LN19I9IlYtGQ9LemN1h0fsjnLsKCsw4+Q9UUP
         uwHVDdnOOSei8avA4rbXZ3wN1ODtthDI2A7v3P0Zbqu3bW11hLgMju/Fh6yvPGim0Tb1
         8V2y0G9DCxKxWSPP71GRppp1CzSx4/VIBVdY6rvaiOHJEo4ADvqxSvjdpqy+QYu3efeQ
         4W1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778167998; x=1778772798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VqyUqV5RyIPeVejA62ttbxcIeN0YeIM9mFOL0GF+tM=;
        b=DvGhgCeUuhbTw+vUAgv9mK0vVxGm7pKhQBFjUQpK032zwYG2sh8x0EMOiFkQQ+lSIg
         amGMsvjKSJ6MWgZtQeitCrqqaIenBLPMgUmIA4edjAS0RQAd7EpfZFwCBLdaRorTD5Sl
         7vRROtCYjuYycR0uzl+F54S9QL/8+k8n1yDEJqb6yeh/2igjhgoFLjKgshiZZR8pBpmR
         lomqyJs94D/A3Kr7qXpEaJ7HG3uqjBSaie5JAfNdJXwP/zZd7lzR7VjRIlTKTfjZtPka
         SciDMWe/JzURsef3sMl+EXlSvjyrunXMEut7GtqPyajohcbknQpAXcQuE9dJ2yp3p1Pp
         xHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778167998; x=1778772798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7VqyUqV5RyIPeVejA62ttbxcIeN0YeIM9mFOL0GF+tM=;
        b=sIz0oON/soz+QBg3sVMs3ANauWtpS0tTllHHlUFi+4+DFjj21yVR3JsGlEDUoZr1XD
         +TGrqBaYBOuTrqQH8c082QPqTp0KA/O2n2U2bMP0ypbiFiZbai3Cu3Y1Pnk4ZCJme07r
         wWTv2ySnG1jYTexBuF4QqVV7FCg3BYU+ig2v/JbOO4kOkXoI1qabnQvyxsJJoZkyjfju
         S6w2EPjje5fmhkpXy8OlRrGr7kp+zfFq0s7rcMRCHfp6RSq8rhFbNb0hcu0YatBBj6hw
         5xvl//26Ef3i5N1gI935K2wpSFx4Q8D5QFBpmQAGnC+hPMuZe8hSGZ7Te5M0GKda4rzY
         k9EA==
X-Forwarded-Encrypted: i=1; AFNElJ+Xz2xCi9OkCLBFAduz6HkDv0QZC9m9sv7aZJ7jbBGwOoIz5yA2Z7AwmUUUncLK4dk1M3D9GqShUYzn+FuLbKsc@lists.infradead.org
X-Gm-Message-State: AOJu0YziZR6HcmRDFZYUs+qQroQUaY5IWbsRECtrQJrWT6ThReCaulVp
	VrH1SAdssKG067b6quBhMDK/ERoPeY1ooY7NNbylSB79lnzJpVluQQEGqDHqBYbXXW5yPhAe5R9
	kqVRNKwMiMr1Sn2++DGMArHoKbwwbCBCo8EgtHARY
X-Gm-Gg: AeBDievHclJRnKU9I8+ibDfUAm6XGjJQdOTnYgDjjOMTE+z14Fq4Cu+NawME/jnjWpT
	37ZYaadjuDcOsQgJhl8t7y3UAEmqXKlTweUvQzs7mRuSCEKYPq/xGRQTeEFo6bRb238I+FicMF0
	vU1JhaX3hUURagu7Rhuv70mDdGDEZgBaLdBHda1YxtaWhXrp1oXBCUuxQ6upfur2iCbI6oIhvVx
	bT+AAJx/p9URidqZnJwYJ0C+HtrfWYFfVPsmducqbWNMCUy94GmgiW/WrqD4gX/X2cWqzFzw180
	ypNQMmaHcKp1imgiooffbDxnCUuE1sR5I8sB5lc/xMhb0o1OokLhD/MmNjw=
X-Received: by 2002:a17:902:ea12:b0:2b9:e831:5e5c with SMTP id
 d9443c01a7336-2bab6022d34mr4546695ad.4.1778167997540; Thu, 07 May 2026
 08:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260507063737.3542950-1-wangyushan12@huawei.com> <20260507063737.3542950-2-wangyushan12@huawei.com>
In-Reply-To: <20260507063737.3542950-2-wangyushan12@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 May 2026 08:33:06 -0700
X-Gm-Features: AVHnY4LPRYfAZmmxOjJIPz65xmkiiY5Sw9xtkiO-Uu115ZZfiJQbu-TOgh7Te5I
Message-ID: <CAP-5=fXb6-Q2EJmoLyCmp2kmRG5x-pSt8-YAHNToZjn6jid33g@mail.gmail.com>
Subject: Re: [RFT PATCH v2 1/7] perf stat: Check color's length instead of the pointer
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
X-CRM114-CacheID: sfid-20260507_083318_974495_1412A158 
X-CRM114-Status: GOOD (  16.71  )
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
> Color string returned by metric_threshold_classify__color() is never
> NULL, check the presence of *color will always return true.
>
> Fix this by change the checks against length of *color.
>
> Fixes: 37b77ae95416 ("perf stat: Change color to threshold in print_metri=
c")
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-script.c    | 2 +-
>  tools/perf/util/stat-display.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index c8ac9f01a36b..58cd5cd377a6 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -2111,7 +2111,7 @@ static void script_print_metric(struct perf_stat_co=
nfig *config __maybe_unused,
>         perf_sample__fprintf_start(NULL, mctx->sample, mctx->thread, mctx=
->evsel,
>                                    PERF_RECORD_SAMPLE, mctx->fp);
>         fputs("\tmetric: ", mctx->fp);
> -       if (color)
> +       if (strlen(color))
>                 color_fprintf(mctx->fp, color, fmt, val);
>         else
>                 printf(fmt, val);
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-displa=
y.c
> index 993f4c4b8f44..74cba80c24b0 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -474,7 +474,7 @@ static void print_metric_std(struct perf_stat_config =
*config,
>                 do_new_line_std(config, os);
>
>         n =3D fprintf(out, " # ");
> -       if (color)
> +       if (strlen(color))
>                 n +=3D color_fprintf(out, color, fmt, val);
>         else
>                 n +=3D fprintf(out, fmt, val);
> @@ -607,7 +607,7 @@ static void print_metric_only(struct perf_stat_config=
 *config,
>         if (mlen < strlen(unit))
>                 mlen =3D strlen(unit) + 1;
>
> -       if (color)
> +       if (strlen(color))
>                 mlen +=3D strlen(color) + sizeof(PERF_COLOR_RESET) - 1;
>
>         color_snprintf(str, sizeof(str), color ?: "", fmt ?: "", val);
> --
> 2.33.0
>


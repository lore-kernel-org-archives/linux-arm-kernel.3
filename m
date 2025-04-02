Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F397AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 01:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApdxesjkOfai71A/PiCUygzYWV7+z0dnwski1nvbrAw=; b=NsSQrcUzwQnAbUFA8IwiQFhWo7
	MdwcY93aeJ+gAUsnNrK5j/JlOY5j5igaN56RjOZShSZe7m1cMAZA3q/FdZSWbbVq9NMS40rLmdMtz
	/zYzuzofZ85o7gxu1MSkRJvDz9WT8N7ewAseUSmEBO4YRoQS0t2N5vtChftu9tysj2uLvLpIdiEfB
	HvKcsMNJSaKYSwRtJTkwQnN6sxatuB4OcSzyAoQMhEVW9aPjl6uBsyG2UXPERxt9o8zRj24UTup1G
	roS5evosVhmph4rQsdx3chZNsOEg9TLmugERFl4Z8m8ZfFq8pfIK42R1gg8xHq9b2wUVRYDPNxFrb
	e2p0m4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmvU-00000004qVb-2yMM;
	Wed, 02 Apr 2025 01:29:56 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmol-00000004pZB-3vjK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 01:23:01 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e8f254b875so57339186d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 18:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556979; x=1744161779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApdxesjkOfai71A/PiCUygzYWV7+z0dnwski1nvbrAw=;
        b=BiYxZESrbEReUnm0eofYNzIKv94WlD+UuTiFdbt4k96+o2VOsAvecFd0SfwWOfz2qh
         k8HksRQ+4rLByaRaEQGcFgcEf/ImAmRB4mt3bFGfYNhfSwB7BD1cwhWI9NLLtyoYRvdk
         zv8AcliOICfhSX/IB4/nm3SW9/FSo5olms/v4zPxHnei9F4oAh+eLANt8/WDjzUoOe/B
         +IqROWkm/IGCHxtCMJJguwBvbBgw95wfAQsG4DyLmLO6SkVsznT4DjNvZLUM7ylZvKsQ
         gFL7q1/wjTda+/tyj85fvja8nH5843OjsgwOpGosJUBPiuEiOkZje1Eq0lBUdaLZ25u7
         rnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556979; x=1744161779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApdxesjkOfai71A/PiCUygzYWV7+z0dnwski1nvbrAw=;
        b=J9lI4h2OuQ+YM3csTRNJ6qxyRkm5qJ4rH/YlBdLmh++etaC8V9yqItj+k1JItBp9jX
         wf2Ww9rtihhJtpqkYOnJzzmnxNCqfeI6kPAzQ7rQ6txUbZOU8ytvzLtsPhseE6gmWg78
         anCgQzuaxUwAqyShl/nCEkTjfSqgEk6loO+NeIkXv0LcQcctySdjY6TS8gypGmn3++2F
         COQUVi40vJR5DkbguERBrx+emLsXVXKtTudXXOjh66zm9zVpSu/R34wXKp4bTqAw2BM8
         wLyFP9jU3SJnmBzMmCUtgUXw3yJcwlQHfFax3PgKdIymW0B/9Qt1mQNltmdpwqZGqNFW
         dVzg==
X-Forwarded-Encrypted: i=1; AJvYcCUrACzaR4/0u7mDdc8IJD+5uzGY81X6qB7brSKWOZt3AyT4rViJGcSJwFMVpUigWljByI0CVfi2Tx/WJTVOE2vS@lists.infradead.org
X-Gm-Message-State: AOJu0YxnsZ55G/he/wUqohNUW6aA3/CAJeKYV77F3yho3Pv//2LXJaDG
	uCqKKS9st1XFbe7VYDtYQn8Hmjt+0hhGo7ivLdZJTYtWWNa13JKWaLQKYZMhHmDZqtmEtfVuHNW
	1WUh0gjyiGcd5bqzaRaQX186uIncPG7iS+jM=
X-Gm-Gg: ASbGncvbKfbKMZ1j6rSJTCRDsqq6mUnYTJueW7V/E4d91fAJzKtu4P08ySsODHlSkGl
	hg8wXlldxALBBk8BQITFeCA+zSfbtzRoQYSSiLF4aRsuJThhf+TsRSo57zYo0I3cLjkIZ02pEAj
	GMYVNCv9nkfyNA2Wl8BSeI2dZDsG98pn61tdN7
X-Google-Smtp-Source: AGHT+IFT2xaIBFRCTkFePtUG6vwD+8dVcugwyHEGGsvMia3jYcIBJs9VJtiUlqGpwnEiLP2y6qg1U/uTR8BQ8/FRyqA=
X-Received: by 2002:ad4:5eca:0:b0:6d8:f0ba:ea92 with SMTP id
 6a1803df08f44-6ef02c7b3aemr14857656d6.21.1743556978473; Tue, 01 Apr 2025
 18:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-4-yabinc@google.com>
In-Reply-To: <20250402011832.2970072-4-yabinc@google.com>
From: Yabin Cui <yabinc@google.com>
Date: Tue, 1 Apr 2025 18:22:46 -0700
X-Gm-Features: AQ5f1JpEFpn6nSaI8DHriRP1kpO4k9vT001Uil8c_V8-xsDrMAnB4qPjqh6SggA
Message-ID: <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, leo.yan@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_182259_978611_03EC3BB6 
X-CRM114-Status: GOOD (  20.01  )
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

On Tue, Apr 1, 2025 at 6:19=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote:
>
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
>
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtra=
cing/coresight/coresight-core.c
> index fb43ef6a3b1f..e3270d9b46c9 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path=
, enum cs_mode mode,
>                 /* Enable all helpers adjacent to the path first */
>                 ret =3D coresight_enable_helpers(csdev, mode, path);
>                 if (ret)
> -                       goto err;
> +                       goto err_helper;
>                 /*
>                  * ETF devices are tricky... They can be a link or a sink=
,
>                  * depending on how they are configured.  If an ETF has b=
een
> @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *pat=
h, enum cs_mode mode,
>                 switch (type) {
>                 case CORESIGHT_DEV_TYPE_SINK:
>                         ret =3D coresight_enable_sink(csdev, mode, sink_d=
ata);
> -                       /*
> -                        * Sink is the first component turned on. If we
> -                        * failed to enable the sink, there are no compon=
ents
> -                        * that need disabling. Disabling the path here
> -                        * would mean we could disrupt an existing sessio=
n.
> -                        */
>                         if (ret)
> -                               goto out;
> +                               goto err;
>                         break;
>                 case CORESIGHT_DEV_TYPE_SOURCE:
>                         /* sources are enabled from either sysFS or Perf =
*/
> @@ -507,6 +501,8 @@ int coresight_enable_path(struct coresight_path *path=
, enum cs_mode mode,
>  out:
>         return ret;
>  err:
> +       coresight_disable_helpers(csdev);
> +err_helper:
>         coresight_disable_path_from(path, nd);
>         goto out;
>  }
> --
> 2.49.0.472.ge94155a9ec-goog
>


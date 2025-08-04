Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36364C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 04:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ve4t7PRwwZ+6CdX8OjiqWX7q4e7rTv0zRJjQYn4MAVE=; b=tVxt0yzpCtoC1IyU5Evw+9ZI+z
	Qexjj9stvK6mfzjaeJa5w7y/mNMN01cEh7THqnBWBqGn1z7uLvJAZgwKWNdr3UA3PPo3VuP01tC+t
	hws7vTzNCXPqyHkD3cYn+nw01Q0SUdh+xMMnRHX1cH2nO+7T2pZD2p3fmbcqyvZw7UO/f2lIDfBhO
	l0nI6Fp6lQsoBAihXz5P/lvLS94FG6/5KkH5PS1uQhBpbipAkfommlz1Wt0R8S9mPht0V98/3tp1+
	IHfCJlsWKii5aVZRTiKbgvUSFF0dLm3SiYlNoKcWS8sMIsG+7BRDiPDGXUYKU4TdqHDx6hqABztan
	0x/+GR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uinGE-00000009dRt-0BsK;
	Mon, 04 Aug 2025 04:57:22 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uinDc-00000009dFw-3maW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 04:54:42 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3e3d94aa969so19030975ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 21:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1754283280; x=1754888080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ve4t7PRwwZ+6CdX8OjiqWX7q4e7rTv0zRJjQYn4MAVE=;
        b=koxHKGynL8OhptdSZS4rqlsfz5ZuN6iD2e/5Wj5iNuNuIU9sDijd+wBaZg6z4QN8sU
         BQOVBVbcMt+z5b7OOfhSWRJM9lkZVxDaKBA1hNS54LxAHmq4p5H1u7kDRRBEdUc0aVaF
         MQamz7/S3Su7YUa2SU5mTPJK9LAU7csbgEbMjOpkjzx9f5IQe8fCuLs/IFnZcLT7hrTJ
         TXGz5zWW3iayvl4EeKjIUUVEQOGgMkykwv1SUqn3/jpT4tL15YWtnaZUdF3PtJwjmRC2
         7CJ1uUsWeAgwvRXnybIJ1CitVynjdj4+xZCtY+RRjIxDH91jodIr8/9V5bq2rPHQt629
         qxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754283280; x=1754888080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ve4t7PRwwZ+6CdX8OjiqWX7q4e7rTv0zRJjQYn4MAVE=;
        b=iDPligmVV9BRuYpoq7bzMb07kdD1kP2WryYjW0TkeWz7SfZn4wmpHHwn8z7YsRuGwo
         M4T3rNT347qWKCJomd/s1ZaEJhdAdepo2q/7oT6F8+gYoIojunXCeQrB2ICPFnwHwuc3
         SPZc+EyJMMcuW6FjcU1AVXTiqjn5kMCtGNVMq2QLqT6HhwOLU3S3Lr+h2i6af5pTOJS4
         juGuIxj/Pu4FUBaJNooEO/4O45+h5kCjyoUCVZvSSF0Kv8chmrQeZ5fiUXYI6Jobf+e0
         NHBz7TICdboHgGhPNNyiombhwsjX/Mmq77/S6wvhYDdtwVLd5D1/Zm2FS9zSOjnhDMa3
         8/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr5vDwYPTktxQ9QNUSO6SdutdCjfWZFIBVMD08ic+3/fGv8DsMcKO5UnUW5G/8P4gM/xTI5Ds/YuYYgweZMdZm@lists.infradead.org
X-Gm-Message-State: AOJu0YxVQ+VjOgWsEzrm0OM0Cje9QU4i2Vgxh6VtQEi8n//ndsgYUxvQ
	5+DjO8FMSXc1weNI9OiKT6z+Tf6m6ofxQwJ0q3KFeuwYEREQcv0v9fXoKV8jtbcDnEh5rnBV1zu
	WYcxSPyxRW9IO5HgqHNABKG0AxgLQwdVEJFlvFverbA==
X-Gm-Gg: ASbGnctQHGPVoDDHNvWveKKhNBrRZ5CzFcpETAJeMcESSheKakM6/NP7rSOdQkJ0SgO
	5r8F2UAsD6Q5JzgloO/LQG7fmnveGjeTpTq+VvylcX/J5br2/TLbGLV6DqT59nitQGPDymhiJ8a
	1QzaV38jumlx9sOsVq2pgZLz5twq1aE0kp8/xrz/Q8Tr5BZPyMTChlZ0RnbB/T63D+NTefc5B8t
	Mu6vEv5PZoQsOv2kg==
X-Google-Smtp-Source: AGHT+IGOf/eAmkl4Q0GWF4AohALUlaptRfDp1Iij/yEDJsJjyKHpMVaSn+/FjgEyVm9U379DEkNm6wknUSqAYZiC9bE=
X-Received: by 2002:a05:6e02:1b0b:b0:3e4:117d:68b3 with SMTP id
 e9e14a558f8ab-3e4160fb7a9mr156363575ab.2.1754283279671; Sun, 03 Aug 2025
 21:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250804025110.11088-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250804025110.11088-1-cuiyunhui@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Aug 2025 10:24:27 +0530
X-Gm-Features: Ac12FXyo1twqSxNMLHLAzUl4BV1Wjd1pROzrJyHs7h6O6ZZZs4qmilg-EddkdoU
Message-ID: <CAAhSdy1QDZc9LAnoZacFeQt-vCbrBCxxM4cY=EvLJXFAWifv5w@mail.gmail.com>
Subject: Re: [PATCH] perf: riscv: skip empty batches in counter start
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: atish.patra@linux.dev, will@kernel.org, mark.rutland@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_215441_176486_FE792077 
X-CRM114-Status: GOOD (  16.65  )
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

On Mon, Aug 4, 2025 at 8:21=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.com>=
 wrote:
>
> Avoid unnecessary SBI calls when starting non-overflowed counters
> in pmu_sbi_start_ovf_ctrs_sbi() by checking ctr_start_mask.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/perf/riscv_pmu_sbi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 698de8ddf895b..3977f7488e4ef 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -877,8 +877,10 @@ static inline void pmu_sbi_start_ovf_ctrs_sbi(struct=
 cpu_hw_events *cpu_hw_evt,
>         for (i =3D 0; i < BITS_TO_LONGS(RISCV_MAX_COUNTERS); i++) {
>                 ctr_start_mask =3D cpu_hw_evt->used_hw_ctrs[i] & ~ctr_ovf=
_mask;
>                 /* Start all the counters that did not overflow in a sing=
le shot */
> -               sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, i * BIT=
S_PER_LONG, ctr_start_mask,
> -                       0, 0, 0, 0);
> +               if (ctr_start_mask) {
> +                       sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START,=
 i * BITS_PER_LONG,
> +                                 ctr_start_mask, 0, 0, 0, 0);
> +               }
>         }
>
>         /* Reinitialize and start all the counter that overflowed */
> --
> 2.39.5
>


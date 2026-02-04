Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8786E95376
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxBI3Px7yFYe/I8uXtDTSK/tYhQEb2S2RBT2z3tyr+o=; b=KMd97UK0gNHzJGDwfndgw2yHrm
	mY3n9WUbY3iJa21Tmv8cRbAjIVyQJdRDJpUCJI964rBl1otaIDElU6txHVY6uEoZdS1jQhWEebmia
	0iBy61X7+IpihtVFDk0p1mwTr9HLND92VmpChdATJTVDGpW7g8Ro2Gkre0ie8cBSxbGClIHHKl7zi
	4aCMbz5oj7PjkoVKFKQBSAYwvQi3gIHR4z75Q2OI7ghOE3qpuk1+Qo0ezF7rVzbv3vkN/syhLNLD+
	qsKzwt/31sMo7JFS+8shs3Ncprt8nysdW6auxKoveXZl08TnKjOWXfEOMKSen5ZDyANzX4tl7vDnr
	xDEzh5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaOJ-00000008IqK-2Oxl;
	Wed, 04 Feb 2026 10:45:47 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaOG-00000008IpZ-3qVs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:45:46 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d189e5b05eso3239789a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 02:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770201943; cv=none;
        d=google.com; s=arc-20240605;
        b=HiDmn+GQdkysIZveE32leUzqOCihIJx4irwlrcU+wO5alfW9KpcFnHInEcwyxHgGZz
         sEmmPt5fkLsa4wCeJkbk3g84loPK1RG5vnmnOGixrCZQRMC1tao6wOlvQi1RZWlU/nFY
         s7IOxQIuNSXam7yhqthnv7GYzjqzkQrWaNA+QEUxRwSbyS+Zoyn1drkCKFzH3Ga62cqk
         3tQqSgM8HNGZe+AVVavCUkIx05CZ/neM+t4cvBvxEiO8k6MKD9yDs4C4BGbtJRXM0vuh
         6JwS19A0ApZtU44WKBjSBfMMN2cxkcmrBgXLWTv9S95y4EFEttF4ewFqBMxDbN/8MPiN
         lVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MxBI3Px7yFYe/I8uXtDTSK/tYhQEb2S2RBT2z3tyr+o=;
        fh=b2s0Lh3n4Gd5M9rLqCqx1lk31TL3Qg4lf3UYJgu89Xs=;
        b=ULz1gQiowFPrmfdOeeO4OJDCDZUr1JtXYRA+XpDf/9Mrvlc9tPw/FmOTHM/+3ETQXD
         OR/0IXKGStXk+SQ2Aatd2KVwVj1qu0Zdy4c3zwVwm4mG1LhNdkNb5cLSnK9kLAQEOwUU
         DXeI3ft6QWympNqiwjltxJt+MOiQcBqlZMdMOgxzPIXNInkqMqwofTynqrgVf+tGoKDJ
         5U/VVMR9BP+NWTVRYB/hOP5c0Ww9qpFCr4xToDlTctdgzKzwzoP0Xi0xLi39F3e4aYn1
         mi+TIz6nPV3CD89aL5Dmw1Cgyd0n4b0KsdB8tgQdBF9uem0foT/SjAQuK5bu2/Zg1YHZ
         9owg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770201943; x=1770806743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxBI3Px7yFYe/I8uXtDTSK/tYhQEb2S2RBT2z3tyr+o=;
        b=y2aUFKB2SxfxUfofizCOYwmIes4bAizW+m2J1ZpNUjWQHLxzoKPEh+FX4NcGJv1QAE
         3rpInnPpQSENSxG+fV+Wd4r/v7yzSzkCP4mHvRXMNQJff/xD5Hlj5MRVqPElFpRys5k+
         xS1cX6nYX7VQ1vg3+n+OL39NKmtBk3AZ4EeVJVGqyeIuMlvVEg3WF/fi5oOPMGHFO1c5
         KrrWSb6oJCEIuEwahGWX4OgTEwh3zIxIyoXC1SI7VgU/Pr48QsF343AOLO4xEvP/Mk7F
         859eBZ3Su2HTVmxrgEskrRL/x/QYjYyx3ua4D7YlIzaeo4Hxj1hj3lHXrsS1eUVkSMA9
         5A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201943; x=1770806743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MxBI3Px7yFYe/I8uXtDTSK/tYhQEb2S2RBT2z3tyr+o=;
        b=qwT2KhY/7nqL37adwbHZXKW+2Ff6c8Nu56HR1INz71Yr4UFTprffROoUvOs94ceUxR
         4R+2yoXDcjxi/UpxxTIQvhVqWxGolizP0bn7c3HY0PpRhihue+X/fxwXj2pTiiMeCVbe
         vYbfbdSsxVS9kr/t4sKaGl5SKg8gZBk4lvUPZoBSIGl6hMjYJr2jwDD6KYTpv+AAxwg/
         ixK1ixzY/qziz2cKZQHAYQQtEOL67lNfczzemMk7XME0/N21r/T/2J3gynDtS2MxR/uF
         hDpg6eqlTogh0vEd3wJp1ebaFpLnrXXaAW2G8wxhOkgtLGuiZGo2CypTQcY2wgD68+OR
         bo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLvy9FmVfW9kGNB1hqWTk+rPu30Z2fMcAFGaEpwv0oeCJowU6NzKn54xRgyGolRII7hQL3TRfU8uPu8p8tpi9K@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+WUlwdC2U8MYSuEFG7DJ/4Svl6M5Gn/nq9DN99pTmU8mwp1GJ
	VVw5Hpe2DPeYUdj9YDB/43nWbJaU/XuTL+Ffal8FD+vW+BUZad7eCIeyctew8rrv4PZBbqqkt6U
	6ZKeKq70n1T5Lfk3bS+oeJTR/HVTf2fgJF9v8k9GLSA==
X-Gm-Gg: AZuq6aJq7jInRtN/PmJuQk38FiMRan7eMm03EFYTP9mEAzyB7gxrE2iQ1LcqbO11iqw
	OiicyQH7RncVWNweMKapRt/DQsVXkUV0MJ55hAET+ozMUa4IdF1LN8oRNfws7LRjmGHbQktOM0+
	lIHKYLzlJhuTxBu8bFSATHHC5bwJZFyD3/vrkVFzFRjJJxeHx5d40WdphHX+RwsqtzjTNqviCo2
	hDGd040/edli4fjVusifP9exE/leBSUKKABpJXzfhpMogcLDbJqUrSqx3wLjIR0+gq+BbZA8nN8
	NykjXxHR0oRfTeaojWeAmdVGTCbsKKOUowOqKn9DajdIF2zglzwOxNTRIg==
X-Received: by 2002:a05:6820:2d08:b0:668:d715:108f with SMTP id
 006d021491bc7-66a2390a170mr1139399eaf.73.1770201943318; Wed, 04 Feb 2026
 02:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20260202111728.4067036-1-qingwei.hu@bytedance.com>
In-Reply-To: <20260202111728.4067036-1-qingwei.hu@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Feb 2026 16:15:32 +0530
X-Gm-Features: AZwV_Qjv3CycWr9Nq6vgpbjHaX6Q3jzdVxmyiQUktF1pv6KohqSpje4QgNfRJcY
Message-ID: <CAAhSdy3DnWVT1z1C5VvyFQq7mFEf5rD5pt4Eq3WbyRjSLjmAsw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Skip stopping cycle counter
To: "qingwei.hu" <qingwei.hu@bytedance.com>
Cc: atish.patra@linux.dev, will@kernel.org, mark.rutland@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_024545_106685_A201BAE9 
X-CRM114-Status: GOOD (  20.65  )
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

On Mon, Feb 2, 2026 at 4:48=E2=80=AFPM qingwei.hu <qingwei.hu@bytedance.com=
> wrote:
>
> From: Qingwei Hu <qingwei.hu@bytedance.com>
>
> In the riscv_pmu_sbi driver, pmu_sbi_stop_all() is intended to stop
> all available counters. However, counter 0 (the cycle counter) should
> be excluded from this operation because the counter may be used in
> user mode by rdcycle.
>
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 7dd282da67ce..2bc0050dabd2 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -900,11 +900,15 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned l=
ong *mask)
>  static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>  {
>         /*
> -        * No need to check the error because we are disabling all the co=
unters
> -        * which may include counters that are not enabled yet.
> +        * No need to check the error because we are disabling all availa=
ble
> +        * counters (except the cycle counter) which may include counters
> +        * that are not enabled yet.
> +        *
> +        * Cycle counter is excluded because it might be accessed by user
> +        * mode via rdcycle.
>          */
>         sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -                 0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
> +                 0, pmu->cmask & ~BIT(0), SBI_PMU_STOP_FLAG_RESET, 0, 0,=
 0);

NAK to this patch.

Disabling all counters (including cycle and instret counters) is intentiona=
l.
Please refer to past discussions.

Regards,
Anup

>  }
>
>  static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> --
> 2.39.5
>


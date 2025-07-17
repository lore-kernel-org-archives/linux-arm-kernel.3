Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D42C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCn0C31hN22UugwY+nNOxL0Cz8wHEu8jqXWG+wcYuqQ=; b=2CJRO3UGIo7LPl93wGULCuFR4U
	YYqQ6zgYboCF4RFcH65TQ60QcVygcGyCHa5PHk3tTVgKzuPUDgsavBqAlcdRIK8HDe/4eXr8iFF56
	ibnp/Pg+UYeu8ZkyFv2najJoDnE+L/tJyfisUPIsxfOPpM+mmWIC/Ua4x7E3V3dUHNDyhpSSUf9lV
	LAwHbIhZt9SQCJQtLxYKkYJjCaj4nyo0I4pp98Cf5iZhocFZjhXSGcWIIs8bFp7+lvq/nxrldwstG
	PC+FhCRO+/2l1h7IUQJ2jFh3Zc/GqlaunnYS828M8dnXDJc8pVTSP6Z0QCN2FE6ENz4/nrRYdwEm6
	O4VmcVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQmB-0000000AWxs-0q0t;
	Thu, 17 Jul 2025 15:44:03 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQGk-0000000ATvr-1ACt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:11:35 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7d5d1feca18so96977585a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752765093; x=1753369893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCn0C31hN22UugwY+nNOxL0Cz8wHEu8jqXWG+wcYuqQ=;
        b=CizQx1gEjFt3BFIanQ+ATcBMsDAzrJ/Vplns1qtNKerVcOu1t2fYVUJdfj4bhnZ0mh
         Nc9eTpUuKg/LP3PeoRxvHMY66LYpBLYitbm5U8a/7IuZYffTqUTKo2PfCY2J2OcEaNdA
         4oYJ72IqDmbSl/gPbwimAF6b/fxDEsm5K4Ni9w94oV8YWDE7n+N4HvIoU+7QTJKGXZ1w
         wufe019/oLlRQXBpkOw6LWv337oBxAkbVocleAW4WSmk2j1HAhNF6eX9ioJmROCS7qXd
         uyNY6MeGDiKpXuHe0eNi15g7menzV3dIvOd9p13cEe2UbOumhTzrP4blGlpNNC1GTxFu
         TSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765093; x=1753369893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCn0C31hN22UugwY+nNOxL0Cz8wHEu8jqXWG+wcYuqQ=;
        b=WwUQhZRl/1dF/RipBRrHyujdBWHJ5pG+l6qJVHDlkuslnMw3jxXPkIzKfgq84/MnMc
         ewZzZC+YOOcMsZouCG8UUdjLEKScyMgLPNbNyR3yYN7+AO6WpAtbHEcDdIEHpxkdCzee
         ewrp8EXu/Ocler6ViP+h3HcXh/cxx29WdyvAL3K4WwXprrEMt//QBFulSeZOzkLewCG0
         +6rZt1KuKOPnf0sJouB4iakSXQDlHrveof9omcR19UkCzx1KCkwUR5Dq3jRho8MHVK2x
         IOeHBbMq2Yz/purYJqUQ2VQnXUT+bgXwxBs6S3ARFA3YPcx57totytpvScBv7HeAu3d6
         +8xw==
X-Forwarded-Encrypted: i=1; AJvYcCX67TUqTjhX8P5E6GQHKR+KHnhBjIduzLrdR4M94BiEHTQtX861BEbxuKxw/e5cAzzB0PDY6luPx/mkCYxx+gOw@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ5BHYNK3xc9srTZXgFa9u8z827n8rUuSgrP4xjrNZM4iwNMTF
	SzBfzvWBKz29Qjw9BNexQ7TO3JEMVsnyPvWGh0zV0XPskW+ScDnn3pqCpQFrKaC33dL3OdYYint
	XtuxrgwEpr/h1bVMy508V2w4zQj546DkK9tdFhkTVDg==
X-Gm-Gg: ASbGnctu7D2qJRwpf40Y3rgFMNslS6CF/quG0sP56wbqZMnhrYPDtTJH2beABpW6DRf
	WcVw9hRtbkBuhMjiWvfih6ER8Cu9PugFl6OyL75C8ZWGWWgG1vwi8FjOeabuY8g/KsNIpgsNR8b
	UAoZUNBlMgr007j4ym+gz/bU9tuEQKDiFHfHDpbgAgjdFk6oCuFpemD42J/CWtIRz9ScipXX3gP
	6eLgVXD
X-Google-Smtp-Source: AGHT+IHaFJ1sfqQyWiG9DiWncsz3p3oF6sF6SWaO0rxigj/urXDCJiahMXJIk9SDxHRXku+eh2bgCplK2qeaMk0aX54=
X-Received: by 2002:a05:620a:28c6:b0:7e2:77d0:f33d with SMTP id
 af79cd13be357-7e34356b8admr1012854085a.14.1752765092470; Thu, 17 Jul 2025
 08:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-1-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-1-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 20:41:21 +0530
X-Gm-Features: Ac12FXzdth30OveMxtaGx1W5ZBrjzTJj5_mIPZDmwmxiXuGuVRtL8fMgmMv9bXQ
Message-ID: <CAAhSdy1LVhWUovNLwfv2Y2eOzjewM005+gUENFDg-gqUaBuBgg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] drivers/perf: riscv: Add SBI v3.0 flag
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081134_351705_28A1FA6A 
X-CRM114-Status: GOOD (  16.25  )
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

On Fri, May 23, 2025 at 12:33=E2=80=AFAM Atish Patra <atishp@rivosinc.com> =
wrote:
>
> There are new PMU related features introduced in SBI v3.0.
> 1. Raw Event v2 which allows mhpmeventX value to be 56 bit wide.
> 2. Get Event info function to do a bulk query at one shot.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/perf/riscv_pmu_sbi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 698de8ddf895..cfd6946fca42 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -63,6 +63,7 @@ PMU_FORMAT_ATTR(event, "config:0-47");
>  PMU_FORMAT_ATTR(firmware, "config:62-63");
>
>  static bool sbi_v2_available;
> +static bool sbi_v3_available;
>  static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
>  #define sbi_pmu_snapshot_available() \
>         static_branch_unlikely(&sbi_pmu_snapshot_available)
> @@ -1452,6 +1453,9 @@ static int __init pmu_sbi_devinit(void)
>         if (sbi_spec_version >=3D sbi_mk_version(2, 0))
>                 sbi_v2_available =3D true;
>
> +       if (sbi_spec_version >=3D sbi_mk_version(3, 0))
> +               sbi_v3_available =3D true;
> +
>         ret =3D cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>                                       "perf/riscv/pmu:starting",
>                                       pmu_sbi_starting_cpu, pmu_sbi_dying=
_cpu);
>
> --
> 2.43.0
>


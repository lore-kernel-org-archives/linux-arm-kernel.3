Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E62C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 04:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk5P6Goql09+zLhT4UFf1bxLMW3kkptTgrc0lcznfeI=; b=d/HEehZ3YqUoHYghK3BqEo2TOE
	I+2irRQZA9DbLQsnkOshU37grLWJ5OaGHYoqEcTEQCvya64A+5lM2SfSVcJykl8/tk4GSxjBvXYwv
	G17Ob/fN6KlTjZrNdQ4bP1ea1M2GrdAhmKmQpZdgrtlK2Y6k+5wUUiL+17109Yt0zt3KRSDlSpuOG
	tWAw7DOGdwFQ/wnnJ12zzu0O0GCKE8Lsy3+NesG1KMt6lAN4XDh9Mp2lnot6Jqmi8CuwrESp7Fxsn
	HwnhX8yDEF97L3hVGeoStoEfc0IiwJRXVHd4MmhrolmSI7QLyYY/D3RyK7VdhDbVbEVtSeF8AVe3B
	59LCCmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccxm-0000000Bg8w-2ge6;
	Fri, 18 Jul 2025 04:44:50 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccts-0000000BfoM-2kqU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 04:40:49 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3df2d8cb8d2so6736485ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 21:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752813648; x=1753418448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk5P6Goql09+zLhT4UFf1bxLMW3kkptTgrc0lcznfeI=;
        b=acxMJAuLA2tqunUfY/rxhNwEq0HVoscGaYkELeQWQQWY7l07oXwwG+z/xp/vkhWkgu
         avm3+a/1Kw+yekQ/z52kYtwk+xkLmvozdrtCfzvrikMLHmIFJqh3Pxe6QAowsUCgSFst
         UyYo5gqJ8Okm4spSXl1gGhqqIAGRZvgkVp8Ve2vEhZOw55v0STiZs2v5v1/PXsAcW2dB
         iEduasydTuZTYGuZCQ+cPc4glRfo5zXlZpmLKpWd+GzG/4vn76UJkuVVgxOKQtMeZMw0
         WBHLPU+hV7bQKv+33nyGd+DXEOBztwFI8lR2Yg8MtwxVzleAlvZdkSHUbb5mOuLNpMVn
         tppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752813648; x=1753418448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk5P6Goql09+zLhT4UFf1bxLMW3kkptTgrc0lcznfeI=;
        b=mDfdGGVuY2nvb88LVP70uXh5Q74cj0khY0Na1cY51ICT0oMHHjQ6NPQARmQvI17s6U
         LZeGjs10NOahAfO1gXOxxAWSN/RxGlLJyJ0ec1KS3ZPDkL5gi7pVCScO0dgQQC2mojJj
         HpXNDdAZcOjxaBfagKbbI9FRbe9CDvTwEDKmpjWpjf6oDqdFpjLN+XD+slZHUGTUcWV4
         uQkYMCicgLvZ+QAUR92rn5jYAsmknYUf4hbUBUEgUE72Cl5BUOdhmFzCK/dT6zCOPVBl
         PDQFdp01r0nzypyuxP7ScooL5SWJd/yYaBXFn3waZwb/cfEnqVZL81isKTiEjZp2WEZb
         bC4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJCvtAaBpI9lHTHkZSMCwwM2zGL/CgAWUbmgNo7lq8uBPWTLHVC6Efvu1cKkDxR7T/CcaZpERyz61zzDbgo/H8@lists.infradead.org
X-Gm-Message-State: AOJu0YyfiHfg6DV2GBn1LK4NAywc84pxW+tkuLowwsR24tjgjF2l9lE5
	1tVVbQvUXacUdwG2E2Awc3BSJBen1mxPSJN4dCO4zyNPl08Z9uLKCfm9gsGgc+p8YnnjYTN812w
	65GBzmnQREE1yWcoAat6pY9mHiYfBsqAMvdXUsRdJjg==
X-Gm-Gg: ASbGncuyFnTlODYJgvSEsHKLAYPUlnOHMBveeaPnVZV+VQLqA1AEJCQeX7nyn17upEe
	hRxNWqE3P+zEwRfz20/fM5xr2XGSy/YoYiHUQBD43ZXxRakIHkDRq+Aw2YVoi3b+550Es8d4fUW
	7eMtJ9MCSd+eLrdkG56wVHpuoP46XcIi3KPLyiWTN7/7QhihF5gpSCaODByQmiesJLMeYMTbfF5
	YEAjNkU
X-Google-Smtp-Source: AGHT+IEaxS0XjYOehQPTaQpINVNdrhTY0WgdZfr1X928tkogrZyS3xluTJGJB4k36Lrfe/UfgaiC4ceggmbdl7StqFo=
X-Received: by 2002:a05:6e02:440e:10b0:3e2:91bb:c075 with SMTP id
 e9e14a558f8ab-3e291bbc1c1mr30213165ab.22.1752813647913; Thu, 17 Jul 2025
 21:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-7-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-7-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 10:10:36 +0530
X-Gm-Features: Ac12FXxfH_kRUff1qKzc565myWI6pwy0mWoGInqqgjbhV1vA028RQkFxaIa9Vtg
Message-ID: <CAAhSdy08d8DJL_kurFwHSTEm3i+0wv=Nfd0xP+kKR=6rFdm27w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] RISC-V: KVM: Use the new gpa range validate helper function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_214048_701770_0F7FAA8B 
X-CRM114-Status: GOOD (  17.00  )
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
> Remove the duplicate code and use the new helper function to validate
> the shared memory gpa address.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_pmu.c     | 5 +----
>  arch/riscv/kvm/vcpu_sbi_sta.c | 6 ++----
>  2 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 15d71a7b75ba..163bd4403fd0 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -409,8 +409,6 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_=
vcpu *vcpu, unsigned long s
>         int snapshot_area_size =3D sizeof(struct riscv_pmu_snapshot_data)=
;
>         int sbiret =3D 0;
>         gpa_t saddr;
> -       unsigned long hva;
> -       bool writable;
>
>         if (!kvpmu || flags) {
>                 sbiret =3D SBI_ERR_INVALID_PARAM;
> @@ -432,8 +430,7 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_=
vcpu *vcpu, unsigned long s
>                 goto out;
>         }
>
> -       hva =3D kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writ=
able);
> -       if (kvm_is_error_hva(hva) || !writable) {
> +       if (kvm_vcpu_validate_gpa_range(vcpu, saddr, PAGE_SIZE, true)) {
>                 sbiret =3D SBI_ERR_INVALID_ADDRESS;
>                 goto out;
>         }
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.=
c
> index 5f35427114c1..67dfb613df6a 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -85,8 +85,6 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_=
vcpu *vcpu)
>         unsigned long shmem_phys_hi =3D cp->a1;
>         u32 flags =3D cp->a2;
>         struct sbi_sta_struct zero_sta =3D {0};
> -       unsigned long hva;
> -       bool writable;
>         gpa_t shmem;
>         int ret;
>
> @@ -111,8 +109,8 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kv=
m_vcpu *vcpu)
>                         return SBI_ERR_INVALID_ADDRESS;
>         }
>
> -       hva =3D kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writ=
able);
> -       if (kvm_is_error_hva(hva) || !writable)
> +       /* The spec requires the shmem to be 64-byte aligned. */
> +       if (kvm_vcpu_validate_gpa_range(vcpu, shmem, 64, true))
>                 return SBI_ERR_INVALID_ADDRESS;
>
>         ret =3D kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_=
sta));
>
> --
> 2.43.0
>


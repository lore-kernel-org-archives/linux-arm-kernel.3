Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1902ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et6v9MZbTk1pFS1bUNfiOVICylxCPX59YZSHQ0yE1r8=; b=p47ZPVA+wM5Of+7OfXIJbU5j5n
	DYrljZwCNPA4m6SZLjvPIXkM/d5iY4ezAeOigtp82kEFsYo5QX+xb+EhwpUHQUz58P8wxhnBgqHb9
	/PC2Gi3uh/yKKfaNnqAtU6q5J3p/F92ySduPULD9MgsT6qkAh7/zD0ugZIvMXlmNKzGe8xShcgswu
	Psp7KtsS3e7utY8AefYm3o5XByltoZ4nvKHI5WGwZfnUVYclTWVqivr4V4HlBhNOS7pDglebfi4CD
	jD2BgWl/RntyAFUZTqA83mSBKK6c+qpD3lXcsP5kL+YH9y8We005WQM0VVfBzpzMG4nc1uoadnesn
	a6XZSw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yn-00000008sKa-2Dc8;
	Tue, 09 Sep 2025 17:18:05 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy6M-00000007HeT-3YSq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:09:40 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-4135366c152so2010475ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757423378; x=1758028178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et6v9MZbTk1pFS1bUNfiOVICylxCPX59YZSHQ0yE1r8=;
        b=22HJGdUZzONr0ZD0+xOPFOEQfRMkBmjbYGtG8r8qrBHSYo0bdjtXMYJX1h7jmDnlyI
         8igN3ONnzL/xsIDa+WbTtlaXf7L4/qv0MK5sS8xvzZj0W7WxGRKynP/hom5HE/67UQW9
         yKC2e2cuaj9oOfp9oxfBAnkvmjtzzJqsK23hK8UX1Vxv2UQPyO0lYxgwzV1fXzHbsJne
         EzKIVrfz5GFDjos5ZopUz7fHsmL3q8dQyUzglTU2RMp1fq8ufz1IKIHFSJScmOsF23cR
         Z4VQtl0SKf5pslLH/FPQh36B/Y8HJHBQ7HV88zjdVm+Yzep1mvnGbg20kuTYG5fe+tYM
         0gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757423378; x=1758028178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Et6v9MZbTk1pFS1bUNfiOVICylxCPX59YZSHQ0yE1r8=;
        b=cQJfqo2OKrjdkcoKEe01PwHZ2eUHJQAjbAOgMXD++cjZV7yUh4fN+8L7fe7MAu7897
         oDag0Vyv9ZRmH9FmMOQWW3G7EiP16EidOXSqR6c85H+FKEzncsjDh9yZa42iGgl8oh74
         boY2qVB2PRcDqL72JR6Jp7+jKmCrisblc9s5iTtJOcyFY6YwlJ3vAGGxDXTjw0A97uhQ
         MXslwL90Y/uesG8fwmz9Bu6KrQNKfCwb++mtYXX0HJ7q6DqZ+ecBJRfpHzVShuct26se
         5IKnIElCnFxquhy40Ccu8OjuaAGQIPYUdRWfnA2gROxg9B3vT8VgrW8RME3cKC3Op4m0
         k3wg==
X-Forwarded-Encrypted: i=1; AJvYcCWoJIBiL8O+z0ylE5IV0YzRIb0mhMrNSeSEbyDj6wIKW4PTyM2z083tBDPuqjxqpZAFXwlpljz0tyV0EXsAU+q3@lists.infradead.org
X-Gm-Message-State: AOJu0YwsXy3gWuOP1KYHjjuXBoEi9NXLLifNVBVlM5vgMSmd5VGTPgev
	3goO6oHZBzKKoJ3ypsMByOnn3k2Go9ReIf3CIKm2Sq+4AAYwAa/10jShFPlvomxsDe7c8ZmDDQ/
	gU8LTExaANKfJiza7CFOmhWG6SlVdKLgXBWm3Cb69NwDQ8ayPvh+B
X-Gm-Gg: ASbGncvFRgiJwXr+tv8MPMVm2nQXcg9//YgX/BRhmS/34mf5Ac3X0l3/5A7fPeC1bkV
	mYXtKoJd4JukNxVxzJRNW8U1oKLiL1nKiAUvbAEK09m57CCRTkEZEu5qDDUpqKq/RMXPsW0mJsS
	8mvevp5eW6suF1qoqBgeCDswSUMhA8W9Obs9iud9nrniuwG4hyG9hoVJr0odI3CnJz3X6+xCyK6
	FMdbfeBONoq90wMmxnMQ3oTOGtXVKbsPl2dczL7ZpbIxeJfRZI=
X-Google-Smtp-Source: AGHT+IFiVfiLe6MDTgLYfQVJM+7bIAvkNGpPq9pKFcNmWNcz88mlHx0Ry1czmNGFbXc2GRPs/CcX2si0gv35Hm7838E=
X-Received: by 2002:a92:ca0a:0:b0:3f6:5e42:9ec3 with SMTP id
 e9e14a558f8ab-3fd8e3d3a50mr168551415ab.11.1757423377758; Tue, 09 Sep 2025
 06:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com> <20250909-pmu_event_info-v6-6-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-6-d8f80cacb884@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Sep 2025 18:39:26 +0530
X-Gm-Features: Ac12FXwwmRiHCZkeiCDOhDongtd-pqDmF7dqaj5xnX2k1zEPMqCjDokehycy2ss
Message-ID: <CAAhSdy3d31yEBM3rpy4N3jmL0PovU_VSYuo7niGduuqknXdmGQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] RISC-V: KVM: No need of explicit writable slot check
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_060938_893410_F0BDC4F7 
X-CRM114-Status: GOOD (  19.25  )
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

On Tue, Sep 9, 2025 at 12:33=E2=80=AFPM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> There is not much value in checking if a memslot is writable explicitly
> before a write as it may change underneath after the check. Rather, retur=
n
> invalid address error when write_guest fails as it checks if the slot
> is writable anyways.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_pmu.c     | 11 ++---------
>  arch/riscv/kvm/vcpu_sbi_sta.c |  9 ++-------
>  2 files changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 15d71a7b75ba..f8514086bd6b 100644
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
> @@ -432,19 +430,14 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kv=
m_vcpu *vcpu, unsigned long s
>                 goto out;
>         }
>
> -       hva =3D kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writ=
able);
> -       if (kvm_is_error_hva(hva) || !writable) {
> -               sbiret =3D SBI_ERR_INVALID_ADDRESS;
> -               goto out;
> -       }
> -
>         kvpmu->sdata =3D kzalloc(snapshot_area_size, GFP_ATOMIC);
>         if (!kvpmu->sdata)
>                 return -ENOMEM;
>
> +       /* No need to check writable slot explicitly as kvm_vcpu_write_gu=
est does it internally */
>         if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area=
_size)) {
>                 kfree(kvpmu->sdata);
> -               sbiret =3D SBI_ERR_FAILURE;
> +               sbiret =3D SBI_ERR_INVALID_ADDRESS;
>                 goto out;
>         }
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.=
c
> index cc6cb7c8f0e4..caaa28460ca4 100644
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
> @@ -111,13 +109,10 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct =
kvm_vcpu *vcpu)
>                         return SBI_ERR_INVALID_ADDRESS;
>         }
>
> -       hva =3D kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writ=
able);
> -       if (kvm_is_error_hva(hva) || !writable)
> -               return SBI_ERR_INVALID_ADDRESS;
> -
> +       /* No need to check writable slot explicitly as kvm_vcpu_write_gu=
est does it internally */
>         ret =3D kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_=
sta));
>         if (ret)
> -               return SBI_ERR_FAILURE;
> +               return SBI_ERR_INVALID_ADDRESS;
>
>         vcpu->arch.sta.shmem =3D shmem;
>         vcpu->arch.sta.last_steal =3D current->sched_info.run_delay;
>
> --
> 2.43.0
>


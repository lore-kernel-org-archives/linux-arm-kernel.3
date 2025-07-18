Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E03C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 05:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbgPp2KhOfq0y4Sok/APrDX9m8Fb2lQ6Dd/Lb1wol6E=; b=msr2dJ4yADTbEfja/0ynkcL6B5
	v9EOxBS49Rw1/zDPWOMhsld2yI4Lx8XDJGg5LZ2iZhc3TSgUQUiklBV2q6ALPAFFK7/o0FGiOgxMV
	X77riZzT0KCSvb0cz2SqQqNSHFfJeW9SYyxFi/Dy2RaYVBqqwS+bs2kmaDM6hhGAgLYaMVVJFUV96
	K6Y5Sg/il+dTlbEGyRuGV0OZdBu3i3TMRj2C1249ZQbczzMrDRGfFa9c8XlsfnYO0ubFfXOzH73mn
	4sUT85+As988TEuQgJe5+LNy3JVZ+S5w9WH+k9J7P8XofHPS+rwWSSVSwuHdiWz2NETKh41g0DyjN
	ZvSE7auw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucdw4-0000000BjIB-0SDp;
	Fri, 18 Jul 2025 05:47:08 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucdta-0000000Bj6a-2z8c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 05:44:36 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-879399faac9so135532139f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752817473; x=1753422273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbgPp2KhOfq0y4Sok/APrDX9m8Fb2lQ6Dd/Lb1wol6E=;
        b=a0h9HpSIrPmIEoLUgNSHm3NS/Oz/L2DNwqAfNkSRARYHXSsPcDxJWv4niF/NcpUz+y
         gLIhVDym/xinLIWvl+hJR4AsjUTkLjeJNvLuTPOM/l8oSZQ1pkJQoF4nOdgLVROOw1Qx
         L5L1ZO1KXfIhz10N8n21PFEYmwoPXadPUVapyCo0YACOEnNE0TkwYEpLDHc0E1Y/K+z8
         8wV5gj0Uz1ArNfmmEuyO5sYZCNbFZtg3upvSZPAAs//DDSyec8yjTwdzVzTjHhAKICvc
         ChGa2ZL7+SQY1CgHba1miuOZvlk9DjEVFoh23OAhZB6tamNoOibhHp1kcfhOiFh6bQIG
         /9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817473; x=1753422273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbgPp2KhOfq0y4Sok/APrDX9m8Fb2lQ6Dd/Lb1wol6E=;
        b=hNspuRsOQU+2ixeltua+3fG77wXqFxqJ1Il3kaetcQe/M9nAVFMM7ITkHoqQihX2n8
         Zc1ONCSy1NaJCX6sdOJ57SomSvr67CVeysrYeb6QQ3Io8Sd9Cvri2sz//rnR7cN0Lss1
         2oIvqJlrzelZmnAreFJFAXcufWcTLwjXKRqpweqKK5vX/FirQ3L3YP1wfJi/ZVR826Os
         ft1TzEc7LteTj3DNCyH/4b0b1byjRZELlwEY53Hgb469b0KCcb5be7LDP+QGub8mO5YT
         +bu/21ZW4sMS7+VuJXeIBUE925aFQ13jCYkqGBeb6RG9V3mAoNEFSl6kkm5tJhP8WHJW
         TdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCULMQ4o+bIYPRMf11klFaqqDjlwVfV2WDVXaNp0ium28pPjxvfHVltGuERKvnH248pEHgfmDGM7w7Lovy5z3uoR@lists.infradead.org
X-Gm-Message-State: AOJu0YzsF07KiiEyiCmq/tX0iHM55SejLJ2fvJOoXoE1UqgPU2hO1ZjU
	xVzzOVCA8SHaZdMday6DQ/BKSGR5gVDSbfMv2DUZkRwtijrs6p/0qrbG0x3iz0fOY+KR5V0r/hH
	ZjSc+b7cqAtpv//chEnXO/98zBqK5TcqXdA5asnYVpIkDZLO+mPYo
X-Gm-Gg: ASbGncsWDqZaqWVTW1D43ptOCjANIZabkabAuMs7nCdX/aAk1LX+LMpXQ0ZEGOH033x
	J9EoYCY3syceW6r48zQWqbgPOW8gz7g58N286aUp2I/44FhpgO1g8Z3f6ATa+Ol/ImtRqTNw0Cx
	9IBtK0JqDsBie4ewsBa+YdCc1Lpyc+Poxh+0YOGxCF76s/Y0dHv1+ua6krr3jsniT+u+AvkNP8o
	0KSF3PW
X-Google-Smtp-Source: AGHT+IHDgWzcXCwj/DOJpP3ymIG8gmYK7y1xVWQRaZZ4+bN0CjPQTQhbKC7oNlsGD5d5wHcvIALI0L6dBMD+3efHuLc=
X-Received: by 2002:a05:6602:140e:b0:86a:256e:12df with SMTP id
 ca18e2360f4ac-879c08918d9mr1244420739f.2.1752817473316; Thu, 17 Jul 2025
 22:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-8-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-8-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 11:14:21 +0530
X-Gm-Features: Ac12FXyXbFx3oQHSVcqGrTUnY6wqlJWgBpkN376n7_oc300BjXLNazpUiw8OmFU
Message-ID: <CAAhSdy1Ca4pYDjTPz2YfgWx2R-N3GPdEGjoqksJi1Bc_xRdF-w@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] RISC-V: KVM: Implement get event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_224434_982507_CB5A74BA 
X-CRM114-Status: GOOD (  22.39  )
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
> The new get_event_info funciton allows the guest to query the presence
> of multiple events with single SBI call. Currently, the perf driver
> in linux guest invokes it for all the standard SBI PMU events. Support
> the SBI function implementation in KVM as well.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
>  arch/riscv/kvm/vcpu_pmu.c             | 66 +++++++++++++++++++++++++++++=
++++++
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
>  3 files changed, 72 insertions(+)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/a=
sm/kvm_vcpu_pmu.h
> index 1d85b6617508..9a930afc8f57 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -98,6 +98,9 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigne=
d long saddr_low,
>                                       unsigned long saddr_high, unsigned =
long flags,
>                                       struct kvm_vcpu_sbi_return *retdata=
);
> +int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long s=
addr_low,
> +                                 unsigned long saddr_high, unsigned long=
 num_events,
> +                                 unsigned long flags, struct kvm_vcpu_sb=
i_return *retdata);
>  void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 163bd4403fd0..70a6bdfc42f5 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -453,6 +453,72 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm=
_vcpu *vcpu, unsigned long s
>         return 0;
>  }
>
> +int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long s=
addr_low,
> +                                 unsigned long saddr_high, unsigned long=
 num_events,
> +                                 unsigned long flags, struct kvm_vcpu_sb=
i_return *retdata)
> +{
> +       struct riscv_pmu_event_info *einfo;
> +       int shmem_size =3D num_events * sizeof(*einfo);
> +       gpa_t shmem;
> +       u32 eidx, etype;
> +       u64 econfig;
> +       int ret;
> +
> +       if (flags !=3D 0 || (saddr_low & (SZ_16 - 1))) {
> +               ret =3D SBI_ERR_INVALID_PARAM;
> +               goto out;
> +       }
> +
> +       shmem =3D saddr_low;
> +       if (saddr_high !=3D 0) {
> +               if (IS_ENABLED(CONFIG_32BIT)) {
> +                       shmem |=3D ((gpa_t)saddr_high << 32);
> +               } else {
> +                       ret =3D SBI_ERR_INVALID_ADDRESS;
> +                       goto out;
> +               }
> +       }
> +
> +       if (kvm_vcpu_validate_gpa_range(vcpu, shmem, shmem_size, true)) {
> +               ret =3D SBI_ERR_INVALID_ADDRESS;
> +               goto out;
> +       }
> +
> +       einfo =3D kzalloc(shmem_size, GFP_KERNEL);
> +       if (!einfo)
> +               return -ENOMEM;
> +
> +       ret =3D kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
> +       if (ret) {
> +               ret =3D SBI_ERR_FAILURE;
> +               goto free_mem;
> +       }
> +
> +       for (int i =3D 0; i < num_events; i++) {
> +               eidx =3D einfo[i].event_idx;
> +               etype =3D kvm_pmu_get_perf_event_type(eidx);
> +               econfig =3D kvm_pmu_get_perf_event_config(eidx, einfo[i].=
event_data);
> +               ret =3D riscv_pmu_get_event_info(etype, econfig, NULL);
> +               if (ret > 0)
> +                       einfo[i].output =3D 1;
> +               else
> +                       einfo[i].output =3D 0;
> +       }
> +
> +       kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
> +       if (ret) {
> +               ret =3D SBI_ERR_FAILURE;
> +               goto free_mem;
> +       }
> +
> +free_mem:
> +       kfree(einfo);
> +out:
> +       retdata->err_val =3D ret;
> +
> +       return 0;
> +}
> +
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
>                                 struct kvm_vcpu_sbi_return *retdata)
>  {
> diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.=
c
> index e4be34e03e83..a020d979d179 100644
> --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> @@ -73,6 +73,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcp=
u, struct kvm_run *run,
>         case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
>                 ret =3D kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a=
0, cp->a1, cp->a2, retdata);
>                 break;
> +       case SBI_EXT_PMU_EVENT_GET_INFO:
> +               ret =3D kvm_riscv_vcpu_pmu_event_info(vcpu, cp->a0, cp->a=
1, cp->a2, cp->a3, retdata);
> +               break;
>         default:
>                 retdata->err_val =3D SBI_ERR_NOT_SUPPORTED;
>         }
>
> --
> 2.43.0
>


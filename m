Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A335C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lgpunb85reZG9xTZwbNVBuO0rswFdgZzY975TX/jRuQ=; b=pBgPZ0PqKqUeASxduLCNW8SH4D
	ShqbOAakzZhW6IY6BA9LibGDZ0L8WIouqUljqM0rCvgSgZgGHavksEYKCbaleng9fVRhtFcx5Q+eI
	wtJW4LtNOCaw6kl4bGGR6YxDnxzJN2YxpGo5ApEghBMDj4wuEI5Ogu0EzMQrNThQgGW2WIyyZTSv8
	i5tvhcuJ+ZQ9bYEDSAqDvyT9uATKSKmtMKmVBc9bwcS3fI1Y4Axp6KcSuT7UNGGhsYwLZ5OmlwMTS
	nbXKcLRn00ENjjnbzVVS7urV4sYZ2WP2jMHrWJtiCv8cYod3zzI7hy4PE+WSKIrJ8IZ4FBZQwabIY
	HTprJrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRVX-0000000AeTH-0L4L;
	Thu, 17 Jul 2025 16:30:55 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR8y-0000000AaRu-3jL2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 16:07:38 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-875f57e0cb9so81561139f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752768456; x=1753373256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lgpunb85reZG9xTZwbNVBuO0rswFdgZzY975TX/jRuQ=;
        b=U9s866D2x2g4GxQsZ7Nj5bxGMx6y5dzhGkl5ZeTsjkECkGPoDHtoXty7LhStcx3N5T
         GHb9SXUVuF5mkQgwR8L5J++Wsy1ZrfkC7rLcoIopJl7rLpT26Og53s6RPdqfjvAnLjyp
         1QXp6/G+Lj6V4jedPp4RPNefK58R1fNbxAxDKaQrQ73EBUQla1vujse0aIi8eIZrar8D
         kKkIsAcq7USeZtSjzIX93lhVIyQBvx+SjIlD/R2jSKpL21RmmdTD8LfHJ9Fo8N6P663l
         I7H3ayjIJgca1wh3fvy1xkWd9R/xgByh4Q0mRnOyF+OSWl86ocCUjlYn5t6m9tKh2/0m
         b7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768456; x=1753373256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lgpunb85reZG9xTZwbNVBuO0rswFdgZzY975TX/jRuQ=;
        b=I998HL1Xr46F+MsaGTNVMI/wl+Ve9xqo8/H0Y5LCUwGsc4cMMecmqV1Ut+RxfF9krl
         lJT1aWBJvzSiSoXf43XRVriBnn2MaDaZg63TCBNjNLlRIcKmB+M28YmTlCqYv1P0Rhxe
         6pRBhpBF08SxXDUQwjP4PEy9UDtVUSa/tlHduhlaBgisrYg/JplWpXm642RlaOgJpyR/
         qYf6VbBD8sEIy0zNmxy1TnLcXP5KvskOSr8ehcMeYv4bqGccv4QZ734FCq61gr0Hl//w
         ffX18JmESN2HsiSq5DXVHg8R5Z4yjOkz7ppSJE0zhGSMsYZfhDGzX/Gbe5/4DOxlZKuG
         TQ5g==
X-Forwarded-Encrypted: i=1; AJvYcCWQIGmzMfTCpx+wl3Z4UsJxb+/CJVy6hRRIy0ePFurVqhjK9+ttIBM3zQwOVHIyi8NLj6O37lUts88mrMsHYk7k@lists.infradead.org
X-Gm-Message-State: AOJu0YxyWYlqAonCZRUWFXMEisaVu+EZnkxnx9PG1zN73tRYIqJ5x2Qg
	Y3etqzkC0jpHgmPXE1fELgX0IRbxySGFr6tZfLLW/CE3KFi7w4ZnoIMXuZP2jeAX4ZSFE4Xg+Li
	wcb6VyoHLdm7auy3UPUHwI7aDv7kMOasBWB4RtEkgww==
X-Gm-Gg: ASbGncvIWSU4X+JPShlpPcU+NlSvSdDLYPzA3a81ZNApeQZErzO48MXYV3YdpTOK6Ji
	dC538GLpsnLROX9uN0XVBSaE/6iOIj6g/I8uOHvo/34VwP6KnsPFKqboClrlZzuvurI+kNIGbMR
	yuNILEvBemhfVExYbpGzG9fqs3B0gl1Eg2pVKARatMgwgLzIIqdBW6858mJPZUxZMCCoAj9kzpS
	TfBKiyo
X-Google-Smtp-Source: AGHT+IEvFzIaLhWODX98bcuKZ7fOXM6ICF0D1a2FOT238qB2mbI8P4hj1EYgmfVXY5KwbAkFGmwNg5EwCX4keK/F3+g=
X-Received: by 2002:a05:6602:1688:b0:86d:f35:a100 with SMTP id
 ca18e2360f4ac-879c08a6227mr887776039f.5.1752768455796; Thu, 17 Jul 2025
 09:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 21:37:25 +0530
X-Gm-Features: Ac12FXzE6RMfrSSbSC6EtRsKNfdVOghcMO95e74CACCW8lH380ZKbHD2qUlzeo0
Message-ID: <CAAhSdy3UGPjrdzY2x6c=SCa11i1fKZUOna_vEf+8a=ieSvgPug@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] KVM: Add a helper function to validate vcpu gpa range
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_090736_937791_8CB3D0B9 
X-CRM114-Status: GOOD (  22.51  )
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

Hi Paolo,

On Fri, May 23, 2025 at 12:33=E2=80=AFAM Atish Patra <atishp@rivosinc.com> =
wrote:
>
> The arch specific code may need to validate a gpa range if it is a shared
> memory between the host and the guest. Currently, there are few places
> where it is used in RISC-V implementation. Given the nature of the functi=
on
> it may be used for other architectures. Hence, a common helper function
> is added.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  include/linux/kvm_host.h |  2 ++
>  virt/kvm/kvm_main.c      | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 291d49b9bf05..adda61cc4072 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1383,6 +1383,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_=
vcpu *vcpu, gpa_t gpa,
>
>  unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
>  unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn,=
 bool *writable);
> +int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsign=
ed long len,
> +                               bool write_access);
>  int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *dat=
a, int offset,
>                              int len);
>  int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *d=
ata,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index e85b33a92624..3f52f5571fa6 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3301,6 +3301,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gp=
a_t gpa, const void *data,
>  }
>  EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
>
> +int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsign=
ed long len,
> +                               bool write_access)
> +{
> +       gfn_t gfn =3D gpa >> PAGE_SHIFT;
> +       int seg;
> +       int offset =3D offset_in_page(gpa);
> +       bool writable =3D false;
> +       unsigned long hva;
> +
> +       while ((seg =3D next_segment(len, offset)) !=3D 0) {
> +               hva =3D kvm_vcpu_gfn_to_hva_prot(vcpu, gfn, &writable);
> +               if (kvm_is_error_hva(hva) || (writable ^ write_access))
> +                       return -EPERM;
> +               offset =3D 0;
> +               len -=3D seg;
> +               ++gfn;
> +       }
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(kvm_vcpu_validate_gpa_range);
> +

Can you please review this common helper since it is in virt/kvm ?

>  static int __kvm_gfn_to_hva_cache_init(struct kvm_memslots *slots,
>                                        struct gfn_to_hva_cache *ghc,
>                                        gpa_t gpa, unsigned long len)
>
> --
> 2.43.0
>

Regards,
Anup


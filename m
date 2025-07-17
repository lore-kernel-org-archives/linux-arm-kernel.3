Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDBFC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mF4ZzdU4KPm05DxQhuE3nJR3OBuoI7+D+aCP85HQkvI=; b=wX058Rf+qaLcZ656Zto5GeHtZp
	Kp8tUsrj1toIIM6VNWCem7QVMQlYEmG7OwGrXccPKvoqK+P3WF9sTjje7x5Z1Rf6vh7HUZzk8Etvp
	rQk9MUi6NON+TSzXGmT5Yt2HCZLIospvqJx7IQzzqD6pTnFUg7MqOepIPhSQTwSQPS3IYl3K5hO9L
	08IhhYGKEf4n2ugUWN/SicvBUYPWil44fIvs0JsLGPgz7GZOnCr71sVSD0YNl36Tate7iAC9Jq3oa
	fUYt4zRta7e/bz84HoEPGQu0ymNVdO6fNUvXFUsaEko6uuz9BeY2mrJYi78NDxwrDXFcIo/2TQSsP
	QZmM3Rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRmT-0000000Agov-2bnz;
	Thu, 17 Jul 2025 16:48:25 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR6I-0000000AZwK-0tQC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 16:04:53 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso4260925ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 09:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752768289; x=1753373089; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF4ZzdU4KPm05DxQhuE3nJR3OBuoI7+D+aCP85HQkvI=;
        b=YTHRvd+/Ubt7pJnutr266FMgRsrOUY0GqG9RvFoGhbuTNH6FpeBFtjDjgmqIXvnTcH
         1fcASD/QE5Bs4k3an31Q3yDC0aYUlr6pxLXv3jyHJSV2xyGn8oofeFe4SNSiLiK0pHMr
         zQh/KVvq2NhLHSJK8t0QzjpNAha3Kw+RTo6vha9yOBoY+fCB5FYiiv8ye6OOMld+o2aR
         GGTmYDRSL5tZx818w8Md4zNVU+9p+F0BDoKc7dbRA2K5kD33ih79+STnjKGV/OKrUt+y
         tUsytYmoXGTx9OwABnh0GzPlzfVC67jLpBJJa7TySbdZRfhL92WP2eBD1tHvfCccoaDt
         v8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768289; x=1753373089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF4ZzdU4KPm05DxQhuE3nJR3OBuoI7+D+aCP85HQkvI=;
        b=to4cT0C7Gvz4wPnGWDGLNL0D6sNMPZv/0oaa4BqZhRrcdXRrPADYRVVvSUH88fWPBi
         WGE5iOK7O56yW/U4wVhuRE7rc/Izy/J+aKchoZgQ7AwP4YPU0By/dZmdFxlUJMYVEaDx
         EGXxoceyJ1hMksh7cbBBJqKiyRg4UuE+2ZqGHTheR+6QryFmoRmLHGD3Cg63sRQ1z43u
         ETzcDPH97GbS+o53NFTdNCjAVrDanY4ciOudmxaL/chjS752HH+C6q64PMfdTeg1DtuH
         bznHVBqvKwvzORXM8ROtf4FlwplvoBrLz6guaFnW0krgnsLBIkSvxa0Twz3w9QveQtNL
         /84A==
X-Forwarded-Encrypted: i=1; AJvYcCWFV/S2Sido7Zx7xEQHnORhsldpeSKgtUyKyaF1Cb/W3LZ4oZcA+18wiAYs5rLcBSUSvKepgJC2SjLPkWHN7QTZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Y9w/+1XPKcW7umCGa0sbCFJNRTDSxMVPjxsFGeB/8dHNd2pa
	bb3GN4QQfz+lcAhBuj2sYibvuMzotL3QNun4q8Q0kCg4uWO1GJZUtp7CUd7+UDqPEU33Orr3yfm
	Iw41LrPSyRzPZfc/ZebAG6mdMLQ6glEcbAb4SHgKALQ==
X-Gm-Gg: ASbGncsPxBzIsJJNvefFDoezc40eJMWCpbPGqM1K/oZz6QiGoE16HMhXBX4H4Y1jYKC
	rs5IGPzSdzhUSNRjIbW7ci0OH0SOlV8KRK7COL7x9CNVCf907I0SxvQLCOjaNSbspn2xSD+TF7e
	jLcIkSxyVJKt7/NB1E0A6/VK9Iv7sJ+AvU4bPOYFHjmEGg4n7f8ZJ8MAUgVkqDCFIiNATOY+m2e
	cDhKsHILtSsM1gR0G4=
X-Google-Smtp-Source: AGHT+IFAG3wYGrY4xyVVSnggyKQ8Fmk+ZxX7eQXMdYOvL6ZpVVrOgjCMEp0iGPnFH5D2j6kt83DD42IjPEeujKO5F/Q=
X-Received: by 2002:a05:6e02:3e07:b0:3df:3598:7688 with SMTP id
 e9e14a558f8ab-3e28307abacmr89850255ab.21.1752768287054; Thu, 17 Jul 2025
 09:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 21:34:36 +0530
X-Gm-Features: Ac12FXxSVTcSMonhmD8rqZBxMoPIHtsKSpNyakGFXvSyptDFl2Kq_s4PkOsoVXE
Message-ID: <CAAhSdy2v4FSpekE6QNwsP8vVAH3NxW01cZOgECV2tcAOjgXD+A@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] KVM: Add a helper function to validate vcpu gpa range
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_090450_258854_8F445C13 
X-CRM114-Status: GOOD (  21.88  )
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

Nit: rearrange the variables in a inverted pyramid shape.

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
>  static int __kvm_gfn_to_hva_cache_init(struct kvm_memslots *slots,
>                                        struct gfn_to_hva_cache *ghc,
>                                        gpa_t gpa, unsigned long len)
>
> --
> 2.43.0
>

Otherwise, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


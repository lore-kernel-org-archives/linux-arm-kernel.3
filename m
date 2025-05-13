Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E497EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CO3XD8l6ux1EVBnvjNxNYVBqO7/BMtxK8+QVey7D+08=; b=KtnAsGz6RdC/UXa18t5UKae+KL
	Vmf9Ijuo9ayim8p29aZV9pvNkx8/yW9JLBJ3WwusUyMQvSvq0ROWcd7BoSIa5TOo3lySo63UpYFMt
	ctJBcmoeFVEpF0q3YZlvlEekAK6On5C3nnYZTaxqIyJ/rIT5Pal4AJZHsoOSSonSnlnLSltZ4VfsH
	xjj7vmQTSMyaV6PFreK/qujn2XgFWBn2p1DZo+pRgabMOeDSt44406t2m+o5/zkxGwz19pYOgTIDY
	grqu5pcFV2Q2HsXscORcaGj75InJ156THSepLzMig7BPMMZ2IgSKE6GQAiKIS0571F1u1Vf73IwIk
	ZsBdPEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEngQ-0000000CFBu-2nt6;
	Tue, 13 May 2025 11:20:26 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEneJ-0000000CEyz-0y6p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 11:18:17 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so195196539f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747135094; x=1747739894; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO3XD8l6ux1EVBnvjNxNYVBqO7/BMtxK8+QVey7D+08=;
        b=xUqVyh4qK+ViomYS5Qb01QE9niXaldJfJQXtPN9tiWrQvC/6gbCiMpxk5vOmhaY+sm
         y7ok7I/d4f5YqGQr4JOKzAYJvnlnfofM2/lOI2az8owP9Kc2e9vQ+2Gb+lqkexBfK+6Q
         0PLFAf7SLWu6krNoxODbeUxRmoJ8CVg29YANhHwApwfy27xYkxqPNwJLTuhbKcP1QnD6
         jWzcKRmlz5GR9n/Ep35CnkWcannkr0QZZkF7fursMHfPiiCGLylV/iCQEDvUd0cJckYh
         dxfRfdCrtoenXysT22yoaN9t84Y5gsU4DyFOmX8W427T+o6wiSnYmZruZVkcAvjsbp7+
         W19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747135094; x=1747739894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO3XD8l6ux1EVBnvjNxNYVBqO7/BMtxK8+QVey7D+08=;
        b=RoaorzbyZQtLrKet3OwXFyd454MlaD63KQ8dw99mjTo8CZz9MP67CiQPQmmxNE/SQx
         Cyuqzqgcx7P75ACLESNI85H+f9+Lboh1uMRV52GA3H0WNLO7aLO6abCNEmtJ4EoshZqj
         65RElLJRvF8yjBa+SYsVPH/XGwpXGzwigEr+3lNv6C1F5D2AZnVVwWVRwJGHUdbvL6ZJ
         LKs3vVUebq4d5xUUg+iwr4d35sML0Kp0oFMT1vxHTVwBDGlaaUFAJ1bI7ol4L8kyAs/A
         DTyBiHa8Mx4YoqCodDReuozCrvIiLQ8iD67gDg7uEhzw8DP66E2YFpb8Aa2tjw1dm5g/
         bl+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVd2skvKopDj6VoemszO4x0J4CoRTV62nW+FyLyRiE3ouvf1tMlW+wS11xh8stKk/crxtd6wn7PDYt/9X8zKwSg@lists.infradead.org
X-Gm-Message-State: AOJu0YzPfZttFB+cLhz9vHqYwxK7FxovfBt71QuDDLYBp/KfsSbg+cJy
	+1k/EpZdLmc/e5U3QeD/ChKRSKhSQjqJhx7OASxy5dyaTvVYx3lzkkSzxESuFsNvcESST1UZ9zc
	aCbFdyRM7I5i6RCuylpdTY7f3gC04/rJKaYnhiQ==
X-Gm-Gg: ASbGncv5shFEGwKlPc2SxSIp+K5MtlGxF2R6uWRrc6aMyfxVdFr0giSeIOfH4edhyDi
	xtMCNyxACCjWX1I+l91ThJvumu53UzbJA0iVLKSntpXJZefnoFI3mg8AQk7OEkXd8xtv36gDie+
	5l6U80/WsZN/X30KIxZsvhoYGIe3J/JFmKOQ==
X-Google-Smtp-Source: AGHT+IF0TFlq7FI2UFso/yWVI99zcgMhkSX+i8735DmLyH2X4sWMpcDOU2yubNACzzbHeqk7+uSqM/W5xKTfdB5E+cI=
X-Received: by 2002:a05:6e02:2282:b0:3d6:cbed:330c with SMTP id
 e9e14a558f8ab-3da7e1efc2amr168845325ab.11.1747135093673; Tue, 13 May 2025
 04:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250512180407.659015-1-mlevitsk@redhat.com> <20250512180407.659015-7-mlevitsk@redhat.com>
In-Reply-To: <20250512180407.659015-7-mlevitsk@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 May 2025 16:48:02 +0530
X-Gm-Features: AX0GCFuh9Grm7ZDwE_uX_FG0oRRGo90WBh2IG8oJVp8cnWQQL4gcnv0Sdw9D2vw
Message-ID: <CAAhSdy3H8LaDHJq6H0rFirsWhC8tnE+bWwmWFtO8Eag-kcXcSA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] RISC-V: KVM: use kvm_trylock_all_vcpus when
 locking all vCPUs
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Sebastian Ott <sebott@redhat.com>, Shusen Li <lishusen2@huawei.com>, 
	Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Borislav Petkov <bp@alien8.de>, Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexander Potapenko <glider@google.com>, kvmarm@lists.linux.dev, 
	Keisuke Nishimura <keisuke.nishimura@inria.fr>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Atish Patra <atishp@atishpatra.org>, 
	Joey Gouly <joey.gouly@arm.com>, x86@kernel.org, Marc Zyngier <maz@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Andre Przywara <andre.przywara@arm.com>, 
	Kunkun Jiang <jiangkunkun@huawei.com>, linux-riscv@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Oliver Upton <oliver.upton@linux.dev>, 
	kvm-riscv@lists.infradead.org, Ingo Molnar <mingo@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_041815_510182_234A13BA 
X-CRM114-Status: GOOD (  19.15  )
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

On Mon, May 12, 2025 at 11:35=E2=80=AFPM Maxim Levitsky <mlevitsk@redhat.co=
m> wrote:
>
> Use kvm_trylock_all_vcpus instead of a custom implementation when locking
> all vCPUs of a VM.
>
> Compile tested only.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>

For KVM RISC-V:
Tested-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/aia_device.c | 34 ++--------------------------------
>  1 file changed, 2 insertions(+), 32 deletions(-)
>
> diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> index 39cd26af5a69..6315821f0d69 100644
> --- a/arch/riscv/kvm/aia_device.c
> +++ b/arch/riscv/kvm/aia_device.c
> @@ -12,36 +12,6 @@
>  #include <linux/kvm_host.h>
>  #include <linux/uaccess.h>
>
> -static void unlock_vcpus(struct kvm *kvm, int vcpu_lock_idx)
> -{
> -       struct kvm_vcpu *tmp_vcpu;
> -
> -       for (; vcpu_lock_idx >=3D 0; vcpu_lock_idx--) {
> -               tmp_vcpu =3D kvm_get_vcpu(kvm, vcpu_lock_idx);
> -               mutex_unlock(&tmp_vcpu->mutex);
> -       }
> -}
> -
> -static void unlock_all_vcpus(struct kvm *kvm)
> -{
> -       unlock_vcpus(kvm, atomic_read(&kvm->online_vcpus) - 1);
> -}
> -
> -static bool lock_all_vcpus(struct kvm *kvm)
> -{
> -       struct kvm_vcpu *tmp_vcpu;
> -       unsigned long c;
> -
> -       kvm_for_each_vcpu(c, tmp_vcpu, kvm) {
> -               if (!mutex_trylock(&tmp_vcpu->mutex)) {
> -                       unlock_vcpus(kvm, c - 1);
> -                       return false;
> -               }
> -       }
> -
> -       return true;
> -}
> -
>  static int aia_create(struct kvm_device *dev, u32 type)
>  {
>         int ret;
> @@ -53,7 +23,7 @@ static int aia_create(struct kvm_device *dev, u32 type)
>                 return -EEXIST;
>
>         ret =3D -EBUSY;
> -       if (!lock_all_vcpus(kvm))
> +       if (kvm_trylock_all_vcpus(kvm))
>                 return ret;
>
>         kvm_for_each_vcpu(i, vcpu, kvm) {
> @@ -65,7 +35,7 @@ static int aia_create(struct kvm_device *dev, u32 type)
>         kvm->arch.aia.in_kernel =3D true;
>
>  out_unlock:
> -       unlock_all_vcpus(kvm);
> +       kvm_unlock_all_vcpus(kvm);
>         return ret;
>  }
>
> --
> 2.46.0
>


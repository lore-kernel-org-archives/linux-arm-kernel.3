Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA43C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 00:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pG5OgA5u3r7SWYVRvl04U+VJKzgkH/slr5SK5HxcIr8=; b=406ye0NyQqminGNsPhQuLwOHPT
	SuFgUHaNBDDyCduy+S8IkeTxf5bPVbhkkYF3S2bNxE6AGytZmO3vzDgOsL709zmVraFYqi/AtZHav
	NsktFoSkE+QOpd3fEPVGHCmtkoNJpLnDGgx+qlzByCH5RJ64KPKeMcYbih+n/3GkKMpxwfpWCJqjP
	9BveO+qPUi/R6zoaGEScxcZp2efyS0Vl2YDb+bxUVdLqBuaCv4wFH0/+V9Z/ZczjYCaZ4IJrL/Ap1
	DwExBrgrDF8Pkk219vk9erUNsOPVRAXOgUjDJjCz0m3t8+fYNuMVqRzpreDou7QjMPNQjAC0NxJHz
	GbJ1PnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ral-0000000DDun-2Clk;
	Sat, 05 Apr 2025 00:40:59 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0rSa-0000000DCqX-1y4y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 00:32:33 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6e8efefec89so22224316d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 17:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743813146; x=1744417946; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG5OgA5u3r7SWYVRvl04U+VJKzgkH/slr5SK5HxcIr8=;
        b=iWzGsXR5N6VmBa0ZLyL++yIR6+Ce1lL2t6B9kzvO1JoOOZHMxh9qOFfGoyixG5OfTv
         CAQdMIPpfDjxwMqoVRuiaeFBK0BkcFVm8SQwgITsJh2/hcVcTynD3hZlMPd4lYvABLgL
         2AggI0HDigvRjd/vtWgqupFDxZLx/TL59i16I8UFSaXb3gIs5hQGIhiixio1G/fRysFk
         8FepwzwP4GPFNo9UboSnxD/KqZ7BNWJI79CcapwS9cijhU0NbOmWiLeG1y0sMurWQRC1
         YCwAGzkTRSn9il1ePYVu+EU7LlemMqjgYVDXzbzgGDc+7aKzLsN1Rm2Gg1agonLKJm+1
         fMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743813146; x=1744417946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG5OgA5u3r7SWYVRvl04U+VJKzgkH/slr5SK5HxcIr8=;
        b=deiGVlqYE46/sdAKcrf/qarM/BX9LQE8z+xCbwoNhtPFzTMS6+ZE1kuYlOHMhSedEQ
         2eH3ecCemt0f2/rDu8QQxUKnrqnNxGK/byaeKDeOgnWFecbDBZxxcXjntgQLmwdRPNgt
         9e8J0ZqpQ4iCAG8n5XYOKOMrOOu3DgF/xsOl4Eq03z1ZY3VHRkvNGzGX/3DdZuwIsqfc
         TmA/iKp9hhyz91rwFzVT7rHi/sR+UzXXDHPU41nmzyVzMQwfzYQd+MkOvGgsVlnpPMy1
         Xflu8wWUbq9IfVyhz90KJbSUgs9hNGJcSgsMCZ6jmhYx6QQgTe6W0r/KRgrNDQD1q15G
         6ugw==
X-Forwarded-Encrypted: i=1; AJvYcCVT9f0SdNxep3U9f0k8n4ksI11zXmpJjEwTBXENhA085FTJyVsiYwiJlz49lf4gu6mD4H4ibkbO/lZiY+BS8gT0@lists.infradead.org
X-Gm-Message-State: AOJu0YzCLQPPkhBGcwZVkVd7wAb8XZBaBmL+PwdshxP43kGTaemptPEU
	k0OefKJeb0N7DWrCVmhwccMPX9o9N4IaVOcoP6O6tqWca310WMsvHoF0PYtGJSKOV6KLgA2/frD
	bZKo4do2YOEcePoyAc9+dcc525PrC+Aut8mnr/i5CNQZeHKWo6dKk
X-Gm-Gg: ASbGnct6ja/MYxXhroqL1hBzuUyxCdLlgpu/XKXuTbAtS7QPTpcWrKP6260LOIxuj/h
	kvTmi4D+BzJPoJwrf3kkEDqYig+wxI7UHMVe1buC+b1OkECmWP/jmVeif6ONgDCJVi/OQt224Ay
	3L0OiHZ6nV8k5S2stA7IcvD6FsXip9
X-Google-Smtp-Source: AGHT+IFdsVd/lCa/5EHlC59IfCvD5ejt4ymZP3PtjMovWWTZHQUVaynKa8ekIZOHGPXU7kyqQ3Dv7qIk0/P6Afy4pSo=
X-Received: by 2002:a05:6214:212e:b0:6e8:f4e2:26e1 with SMTP id
 6a1803df08f44-6f00deededemr91976776d6.20.1743813146236; Fri, 04 Apr 2025
 17:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250405001042.1470552-1-rananta@google.com> <20250405001042.1470552-3-rananta@google.com>
In-Reply-To: <20250405001042.1470552-3-rananta@google.com>
From: Mingwei Zhang <mizhang@google.com>
Date: Fri, 4 Apr 2025 17:31:49 -0700
X-Gm-Features: ATxdqUEh8xXy0f-Tg56BnLvVp3zRksb0Z3WI3QPNIi_wEpzrRIgGyHaX6LOUeOs
Message-ID: <CAL715WKaAHSgUhtMMT3Ztw90mMoHpVLdKUgVM15xx6yoUws9+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: selftests: arm64: Explicitly set the page
 attrs to Inner-Shareable
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oupton@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_173232_517720_A600ED6F 
X-CRM114-Status: GOOD (  24.23  )
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

.

On Fri, Apr 4, 2025 at 5:10=E2=80=AFPM Raghavendra Rao Ananta
<rananta@google.com> wrote:
>
> Atomic instructions such as 'ldset' over (global) variables in the guest
> is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
> DEFINED fault (Unsupported Exclusive or Atomic access)). The observation
> was particularly apparent on Neoverse-N3.
>
> According to ARM ARM DDI0487L.a B2.2.6 (Possible implementation
> restrictions on using atomic instructions), atomic instructions are
> architecturally guaranteed for Inner Shareable and Outer Shareable
> attributes. For Non-Shareable attribute, the atomic instructions are
> not atomic and issuing such an instruction can lead to the FSC
> mentioned in this case (among other things).
>
> Moreover, according to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte
> load/store), it is implementation defined that a data abort with the
> mentioned FSC is reported for the first stage of translation that
> provides an inappropriate memory type. It's likely that Neoverse-N3
> chose to implement these two and why we see an FSC of 0x35 in EL1 upon
> executing atomic instructions.

nit: It's likely that Neoverse-N3 chose to implement this option (the
first option) instead of reporting at the final enabled stage of
translation

I have minor question here: The DDI0487L C3.2.6 (Single-copy atomic
64-byte load/store) mentioned

"""
When the instructions access a memory type that is not one of the
following, a data abort for unsupported Exclusive or atomic access is
generated:

=E2=80=A2 Normal Inner Non-cacheable, Outer Non-cacheable.
"""

So, the above is the "Normal Inner Non-cacheable", but in our case we
have "Normal and non-shareable" in stage-1 mapping, right? I know it
is very close, but it seems the situation is still only "one bit" away
in my understanding...

>
> ARM64 KVM selftests sets no shareable attributes, which makes them
> Non-Shareable by default. Hence, explicitly set them as Inner-Shareable
> to fix this issue.
>
> Suggested-by: Oliver Upton <oupton@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>  tools/testing/selftests/kvm/include/arm64/processor.h | 1 +
>  tools/testing/selftests/kvm/lib/arm64/processor.c     | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tool=
s/testing/selftests/kvm/include/arm64/processor.h
> index 7d88ff22013a..b0fc0f945766 100644
> --- a/tools/testing/selftests/kvm/include/arm64/processor.h
> +++ b/tools/testing/selftests/kvm/include/arm64/processor.h
> @@ -113,6 +113,7 @@
>  #define PMD_TYPE_TABLE         BIT(1)
>  #define PTE_TYPE_PAGE          BIT(1)
>
> +#define PTE_SHARED             (UL(3) << 8) /* SH[1:0], inner shareable =
*/
>  #define PTE_AF                 BIT(10)
>
>  #define PTE_ADDR_MASK(page_shift)      GENMASK(47, (page_shift))
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/te=
sting/selftests/kvm/lib/arm64/processor.c
> index da5802c8a59c..9d69904cb608 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -172,6 +172,9 @@ static void _virt_pg_map(struct kvm_vm *vm, uint64_t =
vaddr, uint64_t paddr,
>         }
>
>         pg_attr =3D PTE_AF | PTE_ATTRINDX(attr_idx) | PTE_TYPE_PAGE | PTE=
_VALID;
> +       if (!use_lpa2_pte_format(vm))
> +               pg_attr |=3D PTE_SHARED;
> +
>         *ptep =3D addr_pte(vm, paddr, pg_attr);
>  }
>
> --
> 2.49.0.504.g3bcea36a83-goog
>


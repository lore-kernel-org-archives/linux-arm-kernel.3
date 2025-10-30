Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F476CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq8GXPRA+dEqjyDtGrzVHCvlZcTXdwdp55ZinwRmgnQ=; b=SWaagDwJlfWTk9fVzTH+UtCNc0
	MT8kxwmzaKEqpjTZEmains3ESnqI1BN+UwOcGh4FlJBxfX+R1dd06wZjKueA9mNcPj9eyxP0dR2Ai
	k7mbVyr6ROPl75PFLkZEGVboOX00fVNtEUxXBrdVOPYfLAGn1fL5EERnOWh9ASf4gxURPkbSB+Q85
	SidYi00t6YXUTtbKWziZtTXsIJ2PxB9kFPAIunHYVeCQWge31eoJAn3ZvUbCwTHzYQMZf4s53OxyK
	Z0eQC4BJtF40xccnoq212O/Mm8GuGTBOamfi1f2ZawenWLV1fqrSumWlBfst7aUTGqcrOBpazEtzY
	lYRILhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPMb-00000003u88-49Qu;
	Thu, 30 Oct 2025 09:54:38 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPMY-00000003u7X-3Ysa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:54:36 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4eccff716f4so223171cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761818073; x=1762422873; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oq8GXPRA+dEqjyDtGrzVHCvlZcTXdwdp55ZinwRmgnQ=;
        b=grIVvaxNPKVtMUEUaVkffQx+RGEx04hbP5PmQJZBqYmHGPON30IV1CnesIh/yty2qb
         IAeEMikQaqjLVrJiXWnkB6bSm8/Em/w7Wh22QxIqaVzpet5zEfTjlLR16g0rU3Wth4wk
         o4ud+vckybtcLSDlQwVTlG/EWmWGdU2hyPc4HcnHarPoixE1SCQV9pMju8aeH4fHm9Jd
         LA9Gn3sDIuWSZ0t/qNiys5UdeqmwXvlPXbP7L1SFEB7zLYTCgljDeVHy6nfGgatiPZ/I
         LOc1axY3qVNVhM214qbGrJOi2SpTxDzQfV9IZvwaMyskfo2Ld3AFnA8lLpdasJud2DD1
         0QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818073; x=1762422873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oq8GXPRA+dEqjyDtGrzVHCvlZcTXdwdp55ZinwRmgnQ=;
        b=vj/q297Gxb9QVtPdVmc21tcNlPSp1NXxw+arJn0C5lOYjbF8JiyM3fCNI+I4jIqDKX
         Lds8N/OCeKpGjs1VJZYfBA2GO5kwtEGZPqDGJw+e5cLxk8/YJQeAbI0e6vXWlgGWJAbE
         NEPUK9jc11+G0wubutHHllTids6b7F9wHvWwQGS2AnwPNNOJreMP+nPG9v1Hfh9ffYqC
         E/T/EKydOvkEQaMfb5ILyNm9QdK4vypEfcjtNDgLgvJ17O0b5Bb022DaZvIV1Utst51e
         hXrINp5N7boox/ExThkxMe99XJ7MTikaEaNzYfRU5rC8VBvm1+BuLJWiViW5hCra3k13
         BhMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIH6ZeGK2HBtppTZ7WUwoOv+zwfU2PM7t64asVPAYC8HptKf3jkbvdaWeo9QLITbLFAlLnuBwbadhej72n1BZQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzTeB99HKZQtVhu6Xf7sXKwul6H26GGmMmhDfsvDYO31VqiTeDs
	zH2lW6Pwd9OytlZZCgGediIexnxyVJiV9x3yFovgIXXq4nevzqJHlFcsuUq9qvYm3Qttxzl30iH
	Rg13dgxoPO8dYQfOZ2lAEIMIv2nHC9akJ9uZR+hZj
X-Gm-Gg: ASbGncuSwJsg91P3UjJCvhSbAi1RuTCLApFpFZNAEN3GYziTHuT6nIkxEUcyr1MdM4l
	hJ5OvfZjK/BkTafzWzRq4bdjvuJx45QHZuhQ/Z/BjRjrdlmhylUrkj7Ohk5NQB8CPsSU5WvikIn
	yRohedT7rqijh8s0CP5+/kcQKk9hH30DpZNoclXcfQvQKMbruEqwrmJCY4Ae1mU/rUZi8VnLqHY
	9UxD6Mu9NpGwwZBLW8Co+QXsjFHCH9oEWNFkJ1JFCxtlxETb9Jz2mKjvxxaEmKxfwGvFzKe
X-Google-Smtp-Source: AGHT+IGNBhWthLDGQkNUmSDOtBZ6kPG380sDdFzTHRFPTBU3OvIpr+UNhFx9wIKHGCPYeU5eyCPxKOS8Oaq+t58Wi9s=
X-Received: by 2002:a05:622a:cf:b0:4b0:f1f3:db94 with SMTP id
 d75a77b69052e-4ed23befb4dmr3689571cf.5.1761818072639; Thu, 30 Oct 2025
 02:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251027113943.1282568-1-tabba@google.com> <20251027113943.1282568-3-tabba@google.com>
 <86y0ovuwn8.wl-maz@kernel.org>
In-Reply-To: <86y0ovuwn8.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 30 Oct 2025 09:53:55 +0000
X-Gm-Features: AWmQ_bmH6jCHbddd_06rLNhhFptxL-9eDGPvY4LD17aGK3N1aXlsCzh0O39IRrs
Message-ID: <CA+EHjTwscWNSdzCem+3kr+cQWaA61qRn2aUb8BNBDRieKpsT8w@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] KVM: arm64: Add compile-time type check for
 register in __vcpu_assign_sys_reg()
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_025434_927610_E6246F11 
X-CRM114-Status: GOOD (  38.81  )
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

Hi Marc,

On Tue, 28 Oct 2025 at 10:51, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 27 Oct 2025 11:39:41 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > The 'r' (register) and 'val' (value) parameters in
> > __vcpu_assign_sys_reg() can be easily transposed. The register ID is an
> > enum, whereas the value is a u64. This has led to bugs in the past, and
> > the risk was increased by the historically inconsistent parameter
> > ordering of the vcpu_write_sys_reg() function.
> >
> > To prevent this class of bugs, add a compile-time type compatibility check
> > to prevent the 'r' parameter from having a 'u64' type.
> >
> > This directly catches the erroneous transposition (passing the 'u64'
> > value as 'r') while remaining flexible, as it does not force 'r' to
> > be a specific enum type.
>
> I don't think that's enough. It is too easy to pass a u32 and
> accidentally bypass this check. I really think we should redefine the
> register identifiers to be a fixed value structure, something like
> this:
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7501a2ee4dd44..18f65dbff2379 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -624,6 +624,12 @@ enum vcpu_sysreg {
>         NR_SYS_REGS     /* Nothing after this line! */
>  };
>
> +struct vcpu_sys_reg {
> +       enum vcpu_sysreg reg;
> +};
> +
> +static const struct vcpu_sys_reg vcpu_sys_reg_SCTLR_EL1 = { SCTLR_EL1 };
> +
>  struct kvm_sysreg_masks {
>         struct {
>                 u64     res0;
>
> and then enforce that whatever is interpreted as a system register is
> actually one of these structures (with some creative cpp wrapping to
> make it less awkward).

I thought about this some more, after our conversation yesterday, and
I still don't see how I can do it without having to change most
callsites _and_ getting strong type checking. This is of course
assuming I understood you correctly :D

For example, the most common parameter for __vcpu_assign_sys_reg() is
an `enum vcpu_sysreg`, e.g., __vcpu_assign_sys_reg(vcpu, PAR_EL1,
val);

If we wrap it as follows (after renaming __vcpu_assign_sys_reg to
___vcpu_assign_sys_reg), it still doesn't add any type checking:

define __vcpu_assign_sys_reg(vcpu, reg, val) \
do { \
   const struct vcpu_sys_reg vcpu_sys_reg ## reg = { reg }; \
    ___vcpu_assign_sys_reg(vcpu, vcpu_sys_reg, val); \
} while (0)

I can't think of a way to do it other than making sure that SCTLR_EL1
is from the beginning a `struct vcpu_sys_reg` type rather than an
`enum vcpu_sysreg` type, which means either doing a __pte(x)-like
thing at all call sites .

An alternative would be to construct a list of `static const struct
vcpu_sys_reg` for all enums, which is what you might have been
referring to above. If that's the case, what is the best way to do it?
XMacros, that would be tricky especially with the VNCR() within the
enum. Or pregenerate with a script, which seems to be too much effort
for this.

Like I mentioned, even though it's not foolproof, in practice, something like

BUILD_BUG_ON(!__builtin_types_compatible_p(typeof(reg), enum
vcpu_sysreg) && !__builtin_types_compatible_p(typeof(reg), int));

If I understand the C standard correctly, enumeration constants
regardless of the size of the enum itself are always an int.
Therefore, this check is correct, even if the enum expands beyond u32
(which is very unlikely anyway), but might miss some cases if we
happen to transpose a `val` that is int with `reg` . That said, I
think that in practice it catches all the transposition cases we've
encountered.

What do you think?

Thanks,
/fuad





>
> In a way, this is similar to what we are doing for page table
> manipulation, where pte_t is a structure wrapping a u64.
>
> If we move to such construct, it becomes impossible to swap value and
> register, and we can stop worrying about that.
>
> Thoughts?
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


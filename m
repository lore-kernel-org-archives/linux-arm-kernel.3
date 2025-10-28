Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6699CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEqPjVbdveLZ8o7uW0qH4hEXeMOigT5s38XJXvic7So=; b=aXoRD6RMn2Bv42whB/1ariVh7n
	OcVFc+vCpBkiLtbkh3eSp5d89AhRi1W/BMSedYtr63CsHtWmxjwvSxCH7k3tgJCAp15D9Vaw3cwDf
	XsUPW8MGB8sQ0O3zT9T2PBNpD6f1qIxYPwml17w/5wcx3X8QQZdEQxSg4vikpZMaW1q2xcn3BrSPS
	GjJ2mt6rV45ukomOa8rV6XttHdck48DhNZsbbGlOW9+HfY5nu3fEpddeZ/z2eQJ4rR24ORR/XWxN6
	9q8XMi+j/E2NwN1uSNvdA4aS8j3K6x7GqfjmMxZorU/qduS0ZCoM4YVj14R8FMFkkarFhCJoSo5E/
	z4KrBcbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhPy-0000000FoBu-3OLh;
	Tue, 28 Oct 2025 10:59:10 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhPw-0000000FoBT-1Aco
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:59:09 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4eccff716f4so283011cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 03:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761649147; x=1762253947; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JEqPjVbdveLZ8o7uW0qH4hEXeMOigT5s38XJXvic7So=;
        b=sc+pltRX38DYNMja798xLS+AvxzTBwAEk+4kwaKStHO3rFn9zYN4IUOIuYb+Pl3i/Y
         gPchlpKqh2yI4UiJs4bBd8lyDc59VE19EwWCDDY1T2iGp2JuE7NpvSFrYD7EnAmi9GA5
         Jlej/pDVIZ0kMSo2RZ7W3DP4adklueRIxEpQkwjrhWmQnWWNIq9zUJR/gvYcpNbP6TxX
         l1k0U2fZ3ZemujZxp+t2+gmzRE6ETWzOvc69SShjwHA+toVjpx1gQ5luZjcTVmUBW92S
         zwgHWAy2mWf2yEPihATQLlhsoF0QoWuzQ++OaG/QAY8Ze+XTGbYH+i79g/lRP2egfytQ
         ecDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761649147; x=1762253947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEqPjVbdveLZ8o7uW0qH4hEXeMOigT5s38XJXvic7So=;
        b=hLP3QD06e+upVJ5t5yclbumvixASQtC1KtmFU9sJH3nNLw+UQf1+g5k5b35qc/wl+2
         fHvSSgv8iFizjkGXoh9Bd7KEZ+tL0SgXi1pZHg4AXlym38U5gsaXXumVNvthIJi37C41
         SFT5DlHksU3zthno4oFvfoHICHLEhBkHsk63UZiIz0k9Sq0P7PTBkwyeXazpYLiXCqNm
         kMH78ynlrJHxoPmUBOL0sOdhTClTgYBJJr5TBYt2FHeTCyLJbAlrd3SVID3DaC88yO0i
         aclZhTt7IprhRFIW360R14rLX4ba9c8P7DBWXh90mauZd6t5qyhsDSNayV50+AuNR/WJ
         eWsw==
X-Forwarded-Encrypted: i=1; AJvYcCW8A+fc1osdV7fvgG0jINfTF20UHC5iwAAak3GM+iEF8J1jCyO/0DqyWLvGS1LTrCi9LBWvciYwoPyNeYKEPql0@lists.infradead.org
X-Gm-Message-State: AOJu0YzGBEmf/J+y9sUB19H8RNzYgyN9iSN0NVqTXngvl49maX1bEevb
	hrGhb39C0otXMIGfxuEOzrsqb0ksbxEWEHoQi10fATtMkwweTEewVXc+zrhb5/EdOxXptsBy8PM
	6NnIz2sMvxgSkRxFf6WoTGuTIhrmOohC3ca2Ons+wPUyUUfFOuxWPZjOW
X-Gm-Gg: ASbGnculhaEKL31v/nj9Rvu3OU+Je0a5pjYFSHkj9qak+e8TbAg/EY13HSo/oJYfr2A
	CJVNEMO+kadHSQylGVM2LYGhoxIiZMfuA5ZRKNakZAublM4jkgSN1ERYmjlqSQPhtoV6yr3RLqc
	MSfncQXHO/YXyS0KJe2gv7ROpkVX/zaIQzBycqhMMZYlOjNBNhfQRr83r5c5hnt7rHsX47EVf4j
	YV3Y54FYoVOKU3A0NJydK8r8ybGUN0w0xToKygtQM/Hb07OAaGy9r7+MCRzMYAk0wCEN0dxmIVj
	9Yff9uy3HguN6hayUHE5WgdA
X-Google-Smtp-Source: AGHT+IFHqYCE78TNCCMrXfr6A36S/h3QtPnycbrepNYJr6lpAgID88x9FnBFPz3KCjZjq2mVE1Xb5wC6U7UKqfxuBfk=
X-Received: by 2002:a05:622a:54d:b0:4b7:9617:4b51 with SMTP id
 d75a77b69052e-4ed09f6d3bdmr4540441cf.15.1761649146690; Tue, 28 Oct 2025
 03:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251027113943.1282568-1-tabba@google.com> <20251027113943.1282568-3-tabba@google.com>
 <86y0ovuwn8.wl-maz@kernel.org>
In-Reply-To: <86y0ovuwn8.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 28 Oct 2025 10:58:29 +0000
X-Gm-Features: AWmQ_bn-zmvoqhq8rPby2a5mkqXXoPChZUgrdpYa3ieKRdaSKeedfSF9oO-HcTA
Message-ID: <CA+EHjTwOPKbv9ifz8+jvXGwEqHVdrn9+mZwrmP1divVDYSRmrA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] KVM: arm64: Add compile-time type check for
 register in __vcpu_assign_sys_reg()
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_035908_345739_F15CE043 
X-CRM114-Status: GOOD (  29.52  )
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
>
> In a way, this is similar to what we are doing for page table
> manipulation, where pte_t is a structure wrapping a u64.
>
> If we move to such construct, it becomes impossible to swap value and
> register, and we can stop worrying about that.
>
> Thoughts?

I considered that, but then went with the approach I have here to
reduce code churn. I do prefer wrapping it in a struct, so I'll do
that when I respin.

Thanks,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


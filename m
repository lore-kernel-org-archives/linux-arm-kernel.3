Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF43D3EE74
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=id2ydjCWx625r+TrPtlTZ0CXmulo3m7nQYTh0pdFiQU=; b=L2fNAvdKG2FQIn80K/WOXdSeTJ
	T1q2eiNvzTH85Oas06f4FvveaX89IalX+Peuh5k2RKMjWoHRCPjbCnFKkmqaF5fLuxhE+urd2xAFD
	oCvWZwyBXoggxSoPTWJHt0iWgIpzX7byHkVuv4trAX5HQzCY4/qjp8zHEGXo1ExoZOVRTmJGTGViL
	z3X5S2RpYsrXhT/4L65DFvLvW1C/AsB6KK1Pqjj6zDrnVvSs1hOhOdcZdS/6zf1NLldvjtXyx1knb
	2XLbLtaXDM18J1n2hkD7yfAJZ26q1Vrxxe+x1NSrJ31P214hqNb3yj+23aa+GwJZ4/DLI/pOlj4ZI
	H/UwJhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwJ7-00000007Ip1-2aae;
	Thu, 22 Jan 2026 15:09:13 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwJ4-00000007IoK-3XJw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:09:12 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-50299648ae9so360151cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 07:09:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769094549; cv=none;
        d=google.com; s=arc-20240605;
        b=dGW5UrsjodqdXXGQ3yf6Ons2vHV2KvLO76hj+rZdHx/v3kSDrSC6xSJqC2hgXTzRUs
         3oeTa7P/hgOPmoy3YeqcPyaK/7ZKRfIrOmBQ0h/GzwRdJECdsk/OFc5eEDxURSopZiRB
         v035kK+6NWYXFRTprD6XvVq2jyULwLueF2zLw4FpNtzNhwGCWMP7iiJxy+YgMfZryoMw
         Nly/1ZaJpUiSS6ScnHUnA5Av72317yMJRD1q/x1TpGAJiNdp9BtbjIZHRB84UERObJGE
         GMgGAUX0DtuswgNjQ3FMdW+r9Nu98TYfxoTE9fpdrku084xiqKflbEWs/ECZhLSPNLpV
         eldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=id2ydjCWx625r+TrPtlTZ0CXmulo3m7nQYTh0pdFiQU=;
        fh=Vj6jc4DpzaiBz6Q9Ooi5F/zrQlua6i5mSQUb9+eWYQs=;
        b=G3hL0gLmfGj8vbXNHd1Uj1m6bvEXR0ShR2TLu36NAwJkbMJ9r1L+II9QBAoS3sJFEW
         I+XKBheOaWCMjdgZH55cXjpmegyj0o1MvqRcJKvt4uMwiPXkFkgBbAZCrfVHRpi1erlf
         4odM5aXH79uhD1dZmEWvHF1CcHvQEV0q1y1V1eEn19k06+hppwf4+PPsAcbD7+Dz7EmM
         5aAb4A3LRD7RiLqbMZAF8BOI39wyOGNcdv2m29ng9pNOBseOYynlNnYy2DYIq/ZnJJpv
         2zn3DDLBclGZ1aJ0+vX7v/L0NMDKhIFXGsI+v13gVHYZ0YRSGWtIV/eNuz7voqs3sBpc
         t/wQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769094549; x=1769699349; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=id2ydjCWx625r+TrPtlTZ0CXmulo3m7nQYTh0pdFiQU=;
        b=hZJ0qA/+sV8dCOp6/yzIy4HWxPzMZyVxE8VTHjbH1UH+BrJf60HB19cyMC6g6avMjc
         HdSndRcJIbGFuUw1dBZ5Q8hBP6B2ZjWyQifQlIIWeFiEsgtFdrncZIp0w4hS8Ndu4Lep
         iPIBFRJAZkroePzzrL70uahsU9C9kdsyw5dOAA4GPumzg9Nl0af8otqE8tp+Zl+5XfMt
         BzdiXmccL5LNPqSJRus2TWVUy13R1ypdOZGwF8g8mh4pGBKJX15jPgTwifE3ixGS8Tk9
         jWFJpxruH4P96zhOMgwZbsDvek7JKrv7uZogTVPacNv4HG7SBcWmBFX52fKqgy0axezk
         qzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094549; x=1769699349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=id2ydjCWx625r+TrPtlTZ0CXmulo3m7nQYTh0pdFiQU=;
        b=avSUX214ztlnbxYMUDyZoQVcNb/haXBnxV9NdTmeMyWXor0lH+XFCX6hGaXAFYMZdN
         AJd2yv1bhhKKUQC32N2d6pP+4dU2qAiDeMuTqs2JKO6PZaCORH2vyt6dT5cTsjPKkdCq
         6KobtH5QUe6Ky3CThX2nLp9x0MvSZaClLTflOOvFbPfDi38lZwwjFm0vYzWfMc2hR1Dp
         Hgp89xRYgsaB7zGlIbgdaO/C5isMZEsNGjPu+Xrxp8PIDHJHJL4E7gmqof43SaK5yKZI
         oSpJhfFmyBPBpd0/CsjJes7cbFHy3Zo0Z9Bcf+wmN3nVlhVw51DaqmlwIt/+OIsx80tO
         saUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcCMM+sBgbnxWL6uKJ0qdPf+Kb+FNHtFZnWYk35VBA5WrjjSvnh0tOQGtwDVfstD3sVUV5br81EBYX2ENZkUkG@lists.infradead.org
X-Gm-Message-State: AOJu0YwVPfITfac5B/vUR5ZcIqTx/N6LHefdNF9tfFkDYsgwvUN3Y5I8
	4sT5esGqm9MX0uwwjlkxCr1iMZBFaWGtaTlDFvEUB3cCOJP3D/MhlfQoP+Gv18Et4DYuRcMewND
	CfioTTx6nEDT7qdbruDivWbC4ICXBAxL3QKfmmf6M
X-Gm-Gg: AZuq6aKfQSxnJV9B1QFEjyZwJEd7xUnLdNS33s8cXiTv8ueugtFBqq6hyunX2Ejyoew
	ATRTQxZCOhmLvan8qAMEIVcHzft2OgPGbSfooKF4PmOSmntSZasnxhEEOiwPoc6cOrWqLoQhI+h
	1KMe8koMwu5aSHZTUfNDQsS3wHfYRLOrHoE2VX8o2UG2hKECiB5KzvS9ivpPAtNLvN7EpkdV9Rp
	R/5SIKDli0GE26dRg/dzXl/j6tbWZD1fanSK74gQaZ46LmPJntpkSWPGs2km7ftoKhChyIORuab
	cnu5nJo5yfDmpWdrRONJlVDyXA==
X-Received: by 2002:ac8:5a45:0:b0:4ed:a65c:88d0 with SMTP id
 d75a77b69052e-502ebc8d5f8mr11868411cf.6.1769094548427; Thu, 22 Jan 2026
 07:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20260119105651.255693-1-maz@kernel.org> <20260119105651.255693-3-maz@kernel.org>
In-Reply-To: <20260119105651.255693-3-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 22 Jan 2026 15:08:32 +0000
X-Gm-Features: AZwV_QjxHUhzUCCDzHZuSvN8AjYJVhmTDvMhmuADt9S7AlmbgmL_FTheXzhgjUs
Message-ID: <CA+EHjTzxbuyJcJRvwinrS0cqaVqMY03P6x6A8FH99onXphdjPQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] KVM: arm64: Add KVM_PGTABLE_S2_AS_S1 flag
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070910_898707_A68B289A 
X-CRM114-Status: GOOD (  18.94  )
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

On Mon, 19 Jan 2026 at 10:56, Marc Zyngier <maz@kernel.org> wrote:
>
> Plumb the MT_S2{,_FWB}_AS_S1 memory types into the KVM_S2_MEMATTR()
> macro with a new KVM_PGTABLE_S2_AS_S1 flag.
>
> Nobody selects it yet.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h |  2 ++
>  arch/arm64/kvm/hyp/pgtable.c         | 13 ++++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index fc02de43c68dd..9ce51a637da0a 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -232,10 +232,12 @@ struct kvm_pgtable_mm_ops {
>   * @KVM_PGTABLE_S2_NOFWB:      Don't enforce Normal-WB even if the CPUs have
>   *                             ARM64_HAS_STAGE2_FWB.
>   * @KVM_PGTABLE_S2_IDMAP:      Only use identity mappings.
> + * @KVM_PGTABLE_S2_AS_S1:      Final memory attributes are that of Stage-1.
>   */
>  enum kvm_pgtable_stage2_flags {
>         KVM_PGTABLE_S2_NOFWB                    = BIT(0),
>         KVM_PGTABLE_S2_IDMAP                    = BIT(1),
> +       KVM_PGTABLE_S2_AS_S1                    = BIT(2),
>  };
>
>  /**
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 947ac1a951a5b..3c5f399b1b986 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -659,7 +659,18 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
>         }
>  }
>
> -#define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
> +#define KVM_S2_MEMATTR(pgt, attr)                                      \
> +       ({                                                              \
> +               kvm_pte_t __attr;                                       \

nit: new line?

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> +               if((pgt)->flags & KVM_PGTABLE_S2_AS_S1)                 \
> +                       __attr = PAGE_S2_MEMATTR(AS_S1,                 \
> +                                                stage2_has_fwb(pgt));  \
> +               else                                                    \
> +                       __attr = PAGE_S2_MEMATTR(attr,                  \
> +                                                stage2_has_fwb(pgt));  \
> +                                                                       \
> +               __attr;                                                 \
> +       })
>
>  static int stage2_set_xn_attr(enum kvm_pgtable_prot prot, kvm_pte_t *attr)
>  {
> --
> 2.47.3
>


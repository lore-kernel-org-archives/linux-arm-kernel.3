Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39293E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXgN7N+sfvyWYJUrx20Eam6+/moqssT/bJkQiBA9Rqc=; b=PqM+KWNmxuc1lTv701dqs90slp
	YSoaksLeJrCpjf/jMwnB3aA619B1G2OY8nqGkAnPZ285DyczOEtHDn032TCMvdB0sFz2bmCpTtB9J
	Re43pNov/cQGwj1j+Y2TJk5uj39IIW0IM7PKqj4WOmfibMfjhOM5t8CA+ltTUSl3rjgDp4sSYHIvD
	VeyIp5PbvMH7f1nDYM1xxhnInhnUxoE6xIbPU571SrSb5SSKuZU2hx3+AE2c0tJoQ6slNJ4fsGWE9
	aALwIWT2pm9sfqvDYSbu4SrWLuv2wIoimghMBZnxSevCx/qRC81sGyM+57mipSUNc8ztpvZojdfu6
	SbVsb7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzt1-0000000BWCY-0dGu;
	Tue, 10 Dec 2024 13:02:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzqj-0000000BVX0-0R7T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:00:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-434fa6bf6e4so33905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 05:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733835622; x=1734440422; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hXgN7N+sfvyWYJUrx20Eam6+/moqssT/bJkQiBA9Rqc=;
        b=vwNS+dNjxg8IffZYDN+tDUVG2XW+5XmRnBfgVd3Bjo/vEDiX3I15Iv3XoaLVIv8U1X
         VFjv6AnfXirUcMqCzy1BOJBg5GiL/MhfW4F0G110MK0ozcriCUHxc0s9u3hascAd91fo
         /7k3EGWsW9WDxDLeNXUWi9g/9JGyyG7BEN5YXDRvrKhX171gW/DRanZjdEMvyCAna+UM
         mQF9g0LVKSnqmfnskKeUkcuXrog6zoJnB1B1bZaa7U4VBCvt+3E3eWsfvXszerjzMGSA
         dkINi3+Tshn1+ppxvS/XdUStJwjPO+IFQx0FSef5oAJuMgjat8DPicI+SnJAfUrMIANC
         H/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733835622; x=1734440422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXgN7N+sfvyWYJUrx20Eam6+/moqssT/bJkQiBA9Rqc=;
        b=pKXbsnRqXDjADRhwZUUKrL+0VdBfeVXKcYRAmARbm18vjnQLpyot7KqYpOyz6Xi71v
         h9KinNyOgqb7MCZcnalcgmwZZGxmw6NZvVqsZTKSfxuII5YlBQLrdwito80eV+vdRyDA
         8lMMcso1NIzYzL7lg2vc2GopyQmVXTxysiUjDXn2Yi2gUTRdBJfr1PtcpH2kyhkF8xgq
         0r0mYwkYZj8o9Zz5E3lWmb18n/NGf0QxNvlaSOLlWWxnCeLXSzA1yaJdqsvsNmEszhp1
         ZRB21oud1/nPNfKmAWh7lLGkh7B6fvIUxoK4GgyH9s7x/ETa+e3W0X/MI1KoYZKmZvyy
         q24Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPT/7f/6bv5oSanmWg2V3KiIVUzlhacMbbf6LP1DMYGrDBJSvvGse2EAmOb5TFleJnHgi/mfxhi7ev6/l9US2m@lists.infradead.org
X-Gm-Message-State: AOJu0YxqfVIdmSi9Zal+N/TK/e/7BlmLtLACZFsaFg3p054Noba08SIS
	epzle9OHBX7sxwZlJnrExmb4Xzqi9XDsjY+jSG5150Ywn7FC0IXw7zNzUjgspGuFzlaZ2IZmVPX
	nfV+HD7CJXo6YvU3iPgv0nVL4oKMsamSLWUYK
X-Gm-Gg: ASbGnctHS+rRlIVORFReJy2r9JUR7krLckunwlPS9o5dXglzOcwIKazBjThBi6e8JiY
	8gpJteoqpD6A+nsPrvMtCHE/6qLCRDsaEZFbB98S9PHqfc1sfVEFza5lYgHfTQV7a
X-Google-Smtp-Source: AGHT+IGaGhDWDnawra1F1/dbQTTbNMD9zXwWoIQ2OEhqZyNYqK9fVKTHmmaCrYxgr29shZgJAAHaKKezDZL8LZSStsI=
X-Received: by 2002:a05:600c:6b06:b0:434:9e1d:44ef with SMTP id
 5b1f17b1804b1-43539dd9773mr1029035e9.7.1733835621326; Tue, 10 Dec 2024
 05:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com> <20241203103735.2267589-2-qperret@google.com>
In-Reply-To: <20241203103735.2267589-2-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 10 Dec 2024 12:59:44 +0000
Message-ID: <CA+EHjTxfchr+ggO_z_zrrFTrFpS3oTJXt13t-854xWxYY=oSQQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] KVM: arm64: Change the layout of enum pkvm_page_state
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050025_161945_65292F0C 
X-CRM114-Status: GOOD (  18.10  )
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

Hi Quentin,

On Tue, 3 Dec 2024 at 10:37, Quentin Perret <qperret@google.com> wrote:
>
> The 'concrete' (a.k.a non-meta) page states are currently encoded using
> software bits in PTEs. For performance reasons, the abstract
> pkvm_page_state enum uses the same bits to encode these states as that
> makes conversions from and to PTEs easy.
>
> In order to prepare the ground for moving the 'concrete' state storage
> to the hyp vmemmap, re-arrange the enum to use bits 0 and 1 for this
> purpose.
>
> No functional changes intended.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 0972faccc2af..ca3177481b78 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -24,25 +24,28 @@
>   */
>  enum pkvm_page_state {
>         PKVM_PAGE_OWNED                 = 0ULL,
> -       PKVM_PAGE_SHARED_OWNED          = KVM_PGTABLE_PROT_SW0,
> -       PKVM_PAGE_SHARED_BORROWED       = KVM_PGTABLE_PROT_SW1,
> -       __PKVM_PAGE_RESERVED            = KVM_PGTABLE_PROT_SW0 |
> -                                         KVM_PGTABLE_PROT_SW1,
> +       PKVM_PAGE_SHARED_OWNED          = BIT(0),
> +       PKVM_PAGE_SHARED_BORROWED       = BIT(1),
> +       __PKVM_PAGE_RESERVED            = BIT(0) | BIT(1),
>
>         /* Meta-states which aren't encoded directly in the PTE's SW bits */
> -       PKVM_NOPAGE,
> +       PKVM_NOPAGE                     = BIT(2),
>  };
> +#define PKVM_PAGE_META_STATES_MASK     (~(BIT(0) | BIT(1)))
>
>  #define PKVM_PAGE_STATE_PROT_MASK      (KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
>  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
>                                                  enum pkvm_page_state state)
>  {
> -       return (prot & ~PKVM_PAGE_STATE_PROT_MASK) | state;
> +       BUG_ON(state & PKVM_PAGE_META_STATES_MASK);

This is a slight change in functionality, having a BUG_ON instead of
just masking out illegal states. Is it necessary?

Cheers,
/fuad


> +       prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> +       prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> +       return prot;
>  }
>
>  static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
>  {
> -       return prot & PKVM_PAGE_STATE_PROT_MASK;
> +       return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
>  }
>
>  struct host_mmu {
> --
> 2.47.0.338.g60cca15819-goog
>


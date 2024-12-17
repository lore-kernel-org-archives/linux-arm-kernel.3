Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40207E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d00JPz9uD5IVTXLbqjCoJE43ltdbYjCzx2p8kqI3aJM=; b=tS9JSNRL7fejYt8P/PO1vD/EZR
	j5u4W77YiOc8szObkjfCGyO+wBkZiTzbyaRy+gFQmwAl/Re58PpmVlCrFpuc2FAl6JXXVeO3Hh3vI
	cX6afG+yoPQGqLpQ9+/F+EbELuTrl3wZcyFlRbhrdkS3pDPHvJkNqCT/Wp3/e/cZbUQ5H1AX7nipH
	3/7mf0krYh4TWkA093TxwaRGteZeb5GtZ5ogkBeaZQ7Iai0XtGGFM73PgzalYOb/2M7XbV215xJ+u
	AUdnNasudbNxLH6fe7rg3wUyW2kjguYqXC/4lWLS1AsqkAxW+G78iB/MC+r6ktVq/rsW1UMawLKVk
	R0E31okg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTDn-0000000Ckve-2F9j;
	Tue, 17 Dec 2024 08:46:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTBA-0000000CkDh-3Iyn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:43:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43621d2dd4cso38265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 00:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734425022; x=1735029822; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d00JPz9uD5IVTXLbqjCoJE43ltdbYjCzx2p8kqI3aJM=;
        b=nZzmoAvuwxxDmJhcVeN5UHyKXLYUk2mPo4jxVKcFk5yOxf0GEpGMvVrXcRraRoWmUd
         vsu1I/D5pcZeoSf2NBF+xcFoeZMQsZrL7sFyIlSrZZejTrfqRA7bT3LkALVztU5Zf5Fg
         b5nclgf1j5kfm0hOPSttmHl+kcej0CAmRFtinAjlgnK3wSrPTR1eyQppt3GJJfDe9eYk
         6Sqa8qzylEV4Lmz9Ljl7OyeFwXxC3b0930pOQXQ7Ud3N6Yz65jg4JgWAbZamsIbDnzDp
         4SUaKh9D/+mmKoahIVT6mpowY0upqLIzM4nv2LhSuvE3s13zomQl/ztL21HZOprevPV0
         iRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425022; x=1735029822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d00JPz9uD5IVTXLbqjCoJE43ltdbYjCzx2p8kqI3aJM=;
        b=a6KRUstt+NwgtVMoAmDuoV9kVdvqd0hGBNZjSCJzMb1d2JY9gdZ4EGA3AdqJeSiM1I
         mzQ4bNHJg5vkX2B58DrfQOSkSARhnx1zy/Qf722+u+dP7nirnS3HMqn3mywgYiGXeBcQ
         5YEUi3mZtIrmUcnW5xZbrmwaglpT1OBaG1kAhZyjSL54DhvyCG7682/PulSKHvxN0tkM
         qO8MFLGZJmb1WxLbyn+MxQddZ0RHiwYSF63NmtMHqtUvjxDovzCpCBQtWQ7pbj8gYqjO
         w4bn/PlhL/8Zgh4+PNyFgb8q0EAoIEhWFAm0okn1qXShVzPtL6Lqn8jjKG4xWVUETxdO
         XXiA==
X-Forwarded-Encrypted: i=1; AJvYcCUMsoAdMb/rEAZHQz4aMJDD8FGjADR2eEqT5Ze8+YiVHxgL3SGzKq1McuKwKqMkn19iSzdNG3Zi+mJUTayas8Ib@lists.infradead.org
X-Gm-Message-State: AOJu0YwMnm4WKHnbYLXWgjvx+P4LobN2X5NP1YpiLe1p+gX28DK+u7ph
	917k/hzhjqKGck9EwLWTwYzPsni5g6XtesQuOolsGjEmqStevoSSeyNc8PDvOv8vsLPe63AHyT/
	Zj2vgbQzsubCSM08LsFQhgeMGlbrdvUnmkARx
X-Gm-Gg: ASbGncstYg5f+6MCB95VZoFsdtfUhKXRPnI5mrqy3i5hy2bY5TuyzmvvBPcafOF1vr2
	3HDVPazhvVgJlHA176VWSBOT288rCUyet4IKx13BoM1Svut9l2xpcOYymms8Eb+aM67o=
X-Google-Smtp-Source: AGHT+IEsm2ztvlxRIl5e4zdw11F91muRBnmV6gL9hKtcRS9F1Dhy25XfzClb2ijrhja7+oQZG9pObyx3mcUaDBXuJjA=
X-Received: by 2002:a05:600c:5690:b0:434:9e1d:44ef with SMTP id
 5b1f17b1804b1-4364ad4d797mr740325e9.7.1734425022162; Tue, 17 Dec 2024
 00:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com> <20241216175803.2716565-2-qperret@google.com>
In-Reply-To: <20241216175803.2716565-2-qperret@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Dec 2024 08:43:05 +0000
Message-ID: <CA+EHjTzYA5tFSR8YUfuEGzPjDYnp1a+T=K6AfwjGUVmxcQudjA@mail.gmail.com>
Subject: Re: [PATCH v3 01/18] KVM: arm64: Change the layout of enum pkvm_page_state
To: Quentin Perret <qperret@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004344_824747_5D160994 
X-CRM114-Status: GOOD (  18.12  )
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

On Mon, 16 Dec 2024 at 17:58, Quentin Perret <qperret@google.com> wrote:
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

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 0972faccc2af..8c30362af2b9 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -24,25 +24,27 @@
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
> 2.47.1.613.gc27f4b7a9f-goog
>


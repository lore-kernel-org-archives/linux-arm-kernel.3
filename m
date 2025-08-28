Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74932C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9E9CQIEDOr2UcYitZQ4gvIXZ41Noi3g2Rn0AmT7jQqk=; b=Rf54Ilgmc954UuOQKqxEpq+Qn0
	4X7ErFKhKUM+ND+9LhoauYh13x9Sep/nTG8FKAEwHld6OGqnGab3JZs/h1RhrT4qFpX+tYWigQioW
	0cRH92tpUXVCD3ItdQ7EhXPcObNFCDn2NgdR+uD3AFpClXNnJDdTH4WU00QTzMYzC+ggVBgG/Er7F
	Zbq86LZ1bA8ngwtEVGAWYLjaA2Uw98xzurW7Q2aoL4/SylCg54tjV329YfRLxW+gUEytwzWgKiFYA
	YgYdR5/LsI+d1li/BBG/lKN8au6yoQLLxCUoOqNg2R07DvjTNX7dH0BN8A9M1PPwqkDLJKuyr37j1
	GiqfCdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraYO-00000001IuM-0IUZ;
	Thu, 28 Aug 2025 11:12:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZXu-000000015Rj-1RRT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 10:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9E9CQIEDOr2UcYitZQ4gvIXZ41Noi3g2Rn0AmT7jQqk=; b=VK3TKsCEObkmHXoWtLNL/8WHCz
	wlrDQpRXzu5TjgaJdrFyDKFinQoFz246o/97FXoE+p99HGxoKwv796W2kRN+OLrQH1zm20kArXvCM
	8VUjSnZvS3YS+rTldW1FEOU/4nolSV+siuoPeowUOhohldr3HCUCkmf4NQ1IO33WhBDA3V79ioj0j
	p/kTbEluV27yb18wS5nO/VWBSI6o+2wdwfX49LeYktH2SzxhMuhi5MjppLJyGAurIo6fUFYRx0N5S
	BXs2A8tThnzpwhyyCa2S87Y7QjdVkYORTcfKU39ynNo8/Gl3lNmjdwHKZ5zMosnFPsyIdfpFHg964
	hugp6OwA==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZXr-00000002hSS-16Dn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 10:07:53 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4b12b123e48so322041cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756375668; x=1756980468; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9E9CQIEDOr2UcYitZQ4gvIXZ41Noi3g2Rn0AmT7jQqk=;
        b=xGAa87og9+UFE18U2EQ/So2p9tm4Onz3yxLSFAo+yQTaawN+s0OXtYaKKcbwoN8IiH
         guvAVoPpH3ROSmzyCtGRxum3Vf0PwUgGqt6ckrrRAc99KxXXoji7RjUlwIr9SQBkXmyA
         M0KNtFlwqPo1lrdb+b69KZiIw05711r+LPq8MPlbhvIgffW6sJplqACTaswqgqmarLrq
         8wpGJWy1MOCO5rQ/ffc+Rr5DTjwcxkmkpjWJ3LHZCV3H1eB/B6iKa8VVvJ7Zb0+W3QF4
         cWbq67MnyKTLK8D+XVWTqNc1++A1bN8vNaxFeXlV/RMGKYkK+Ub5vCoAZ/0TxlFl1HjP
         2vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756375668; x=1756980468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9E9CQIEDOr2UcYitZQ4gvIXZ41Noi3g2Rn0AmT7jQqk=;
        b=UqU9IBFlghnMgZjv6joFnjlpn11e6EjyhccyRVYxKnep6F48erg7gc9NPnpfju8Fw7
         Fx1BN4pM0Tbhlk+YbzuEZK9WGzmGR6HbiwdvTsFPvgE5PuQphu2hoX/vEDsV4Y+dxWCn
         s5sgvsMeXB3t7UYBYN6UncDMkiAtpCyBeIb+CnaNhbc64UP1b196h3aztR+px6jPN+vW
         aa+innAEDbJCOXn73Jkhi/mgQTBHgD1QqIcm8W6Bp2TjEKfItaVfDcbZehwXnl806L9W
         Y0wZxQEV4GhzOkNahN9n/jAWGEe7m7es0T0/RvZtPKqaf5krESImr3177p6jcU1vP0BD
         Hb4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzuh3D7ndd9sVpKwBRDQwEK1JtWvkFFZSh+bBIjLHk9vYtZYyXAeygmkcAabOCrwLIMYR0LtGJlXf/jWnV9HI5@lists.infradead.org
X-Gm-Message-State: AOJu0Yysp9/idBZtKOb166kKwUnszF9NTDLjcVxXqj1nb1t8dGQX1+kG
	urCzrRFLi473oTInPLNBWYZj54wYNe9IxALTQbM9FnM6qEv0ZYufLgKt1syFzSHvLUs/TvOyy4k
	B2GRtcdTISwAiG6hPHEROlvNoBkBMt2UWHp1zK7wu
X-Gm-Gg: ASbGncvipmmm/QcyF4/MRqO6eVmYtps1TFYmU2WJCP9sRT2UWn8u45PM/tCIa3Qfz46
	8J06a6YmQhM9+yKWyeqwmZDKQMWRKEustZk//XnXMS9fTt7EC1Ls84P3SDGlzxsbo87o9aFmplt
	mix9723msozXKumFG8c4E0Toiw7ajOiFGAKUFCBfbG6ntl9fLNmuI6bGruecwkDSSsllzFthObw
	fa9A1fU07gNTI8=
X-Google-Smtp-Source: AGHT+IFRjTT6s+Lga012dxByxsEc3lbr9K1CdoyVsw5ZK+adWd1hKzUTB9FTJRCdYTn8BAJBAZ04Flo9bNZpApNjkqk=
X-Received: by 2002:a05:622a:1816:b0:4a9:e17a:6288 with SMTP id
 d75a77b69052e-4b2e2c55f8amr18542401cf.13.1756375667872; Thu, 28 Aug 2025
 03:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250828093902.2719-1-roypat@amazon.co.uk> <20250828093902.2719-3-roypat@amazon.co.uk>
In-Reply-To: <20250828093902.2719-3-roypat@amazon.co.uk>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 28 Aug 2025 11:07:11 +0100
X-Gm-Features: Ac12FXyRDhAk_TvQ6RybLCFXLNR5ZeiLskg-xMwpbNc02N3Vn5Fv4ySMEuemdfk
Message-ID: <CA+EHjTwDZ-FRV2KfC5ZG9SJYeeMRVUHQ8rVtb9dx2AQwCriPQw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] arch: export set_direct_map_valid_noflush to KVM module
To: "Roy, Patrick" <roypat@amazon.co.uk>
Cc: "david@redhat.com" <david@redhat.com>, "seanjc@google.com" <seanjc@google.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "will@kernel.org" <will@kernel.org>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"Cali, Marco" <xmarcalx@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_110751_591144_C0419966 
X-CRM114-Status: GOOD (  17.04  )
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

Hi Patrick,

On Thu, 28 Aug 2025 at 10:39, Roy, Patrick <roypat@amazon.co.uk> wrote:
>
> Use the new per-module export functionality to allow KVM (and only KVM)
> access to set_direct_map_valid_noflush(). This allows guest_memfd to
> remove its memory from the direct map, even if KVM is built as a module.
>
> Direct map removal gives guest_memfd the same protection that
> memfd_secret enjoys, such as hardening against Spectre-like attacks
> through in-kernel gadgets.
>
> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
> ---
>  arch/arm64/mm/pageattr.c     | 1 +
>  arch/loongarch/mm/pageattr.c | 1 +
>  arch/riscv/mm/pageattr.c     | 1 +
>  arch/s390/mm/pageattr.c      | 1 +
>  arch/x86/mm/pat/set_memory.c | 1 +
>  5 files changed, 5 insertions(+)
>
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 04d4a8f676db..4f3cddfab9b0 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -291,6 +291,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>
>         return set_memory_valid(addr, nr, valid);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
>
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  /*
> diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
> index f5e910b68229..d076bfd3fcbf 100644
> --- a/arch/loongarch/mm/pageattr.c
> +++ b/arch/loongarch/mm/pageattr.c
> @@ -217,6 +217,7 @@ int set_direct_map_invalid_noflush(struct page *page)
>
>         return __set_memory(addr, 1, __pgprot(0), __pgprot(_PAGE_PRESENT | _PAGE_VALID));
>  }
> +EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");

This should be after 'set_direct_map_valid_noflush', not 'invalid'.

With that fixed:

Reviewed-by: Fuad Tabba <tabba@google.com>

>  int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>  {
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 3f76db3d2769..6db31040cd66 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -400,6 +400,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>
>         return __set_memory((unsigned long)page_address(page), nr, set, clear);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
>
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void *data)
> diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
> index 348e759840e7..8ffd9ef09bc6 100644
> --- a/arch/s390/mm/pageattr.c
> +++ b/arch/s390/mm/pageattr.c
> @@ -413,6 +413,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>
>         return __set_memory((unsigned long)page_to_virt(page), nr, flags);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
>
>  bool kernel_page_present(struct page *page)
>  {
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 8834c76f91c9..87e9c7d2dcdc 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -2661,6 +2661,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>
>         return __set_pages_np(page, nr);
>  }
> +EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
>
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  void __kernel_map_pages(struct page *page, int numpages, int enable)
> --
> 2.50.1
>


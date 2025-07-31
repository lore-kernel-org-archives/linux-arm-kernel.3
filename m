Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0388EC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnPE+sz1C/80U9yCW9/f/ei/+/2FFUemOvS6oEBnVic=; b=ZnkU0DLNPJlOnUvo0GtdrXuXCd
	DGqxLPEOXuStUtzxiF99eBU/fSUmDcwzXFJdxYn/fNy686vWPulRUx/OmbWOzg8jRd+0DPvAlg/+6
	B1EMqNAO/lexaw/jQheVrzS2L6pFJfrYmw6Z6eiMGPc1RRuygb87X8kchqv+aAa93zwYyjMw1wFxv
	jICi2AWpyRS5qOC+o2vomu/lrYPRz2PDLy9nGAOrMLAwVLSoJWil6JIjAJZEmeFE1GBzCIwN9bTbX
	30SmFPNXo/OJqSNrgNUUBiSTfi007f/eLjbUyeAMJ4GKRbdNI2XWkqem0rfQ4u7G5aJe1aJK9McAG
	tDUBR6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOb4-000000039hX-3sjh;
	Thu, 31 Jul 2025 08:25:06 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOLQ-0000000381U-1EGd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:08:57 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso274361cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753949335; x=1754554135; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GnPE+sz1C/80U9yCW9/f/ei/+/2FFUemOvS6oEBnVic=;
        b=oN9ZDaMgS3MCu2FsiorciF2la3wFmn6YNPZNqigYQDUaVnuipZi9rS6CaJdXM0r5Gd
         XATGL6vd0hKf06ZbFh/vasT4iyt4NmLpxJOh+meN9iqzxYMcEwzljRAGzN4c0u7mQ4Do
         vnzx2AG7aUBfRm6hedbaFnISZVm8TprkzFxvQ8C6I+fGFRBfavg8HTPFf3A5qWedupuo
         Z+xzMVK4/qufWYsn+B3FRq0bVtX6Msr33MS5z3RqrB0pU8EZ5PfyQtldHIMDqhRoDHKM
         VGjDhYlOMv6bQhYlfFBmG4SSKtgyhAiM7xRawmhrkL2nKKFUWmzi8XrVa6sIW8lgj8/2
         m2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949335; x=1754554135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnPE+sz1C/80U9yCW9/f/ei/+/2FFUemOvS6oEBnVic=;
        b=bWiFFOa/hNSvUasYX6Y2OVs4APqbsJSxoMcm57+6XvtZ1KPYcnBKs6+yHEQPa4KTJ4
         CP/zZPYBqRln1cGa6J+axodLWfrUG1Mr2A6b+jNvLMK9S+2kyLg9SGBWlr1c+PVTNGVD
         yTICo6UdcHv7MWbKNWVLGitvd0TDaTW4dyVVx3b7IHRZ+A5uZb4rFazVrTpaD4OdR/NQ
         u7aqAICBxT69yPU8ctpA32tQkLnOOW/o/lRjPKAdnT4gCIFCkRq8or0af20cA6CuTneR
         qplic/G2RbAqx7+PYm54XKQ1y4RVAvjSnyAyW2We2fGlQ0XFUq9PR6jR8wGgv8PEm0JP
         sDQA==
X-Forwarded-Encrypted: i=1; AJvYcCWFi+3kCkZcP7m1dXLg0VrhfCxUnauEUqXeG9MiL+gZ/8XqZUVGHsCm9ap+9FCVLZwvUQ5JQVuynYVLVeUxMMCv@lists.infradead.org
X-Gm-Message-State: AOJu0YysFPxJz6hA/x7eWE3f6gXO3Ms08L7+19CLQ09aiFOIElPvAyL9
	l+bz6hEx+UVaqAitBVnMVCnNQBYS49tH1/btqh4cMa5Igashmjt3OMYeOGv+xeaUYYjeMn2nQaj
	/vNW471Ht9VUbfNj0Tt7CYHC6WB3deOTBYCM4XbsDotE+vZKmznTGENgUF+TcXQ==
X-Gm-Gg: ASbGncuViUOLowAYBo3MuuN3zN7+zjmREcyDukBaGcoaHGXe9FJeJxgBYx5pGkwr4Ae
	pgH3nutz8MF8J7KhqauZcBQd+KcOX1Ye6u91mOK0WzjuuiHE9Zfn/DS4GHvKlwnlQWVwXf4VGOw
	5uiDr9+v4Q8CHbNKYCPGZBCVJ20efTMebv5+9/nZ+7Zz6gIXmBk8OOmsQIDbsaD/l+49/XC3XnX
	GLf+xU=
X-Google-Smtp-Source: AGHT+IFK/wJp553R4XjzZSWJ+dcd/8ojrcK2vt8dKw6Dg/D6YDKGLkDZhQfaq4WdtYxdsAtQNGiLyd6uqBH+0njZkJk=
X-Received: by 2002:a05:622a:178c:b0:4a6:f525:e35a with SMTP id
 d75a77b69052e-4aef1c6158fmr1665301cf.9.1753949334737; Thu, 31 Jul 2025
 01:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-4-seanjc@google.com>
In-Reply-To: <20250729225455.670324-4-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 31 Jul 2025 09:08:18 +0100
X-Gm-Features: Ac12FXwMtfUYkRsjJ3iXPfnzRPX0pAHczqzVmU7Q3OVeBtET53NBzRBcYs_fBLw
Message-ID: <CA+EHjTyZx5pU6Qhe8HNw_ciGXDVfasaD6eBnofSfUJk3VnbzTw@mail.gmail.com>
Subject: Re: [PATCH v17 03/24] KVM: x86: Select KVM_GENERIC_PRIVATE_MEM
 directly from KVM_SW_PROTECTED_VM
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, David Hildenbrand <david@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_010856_332035_A47C8EC2 
X-CRM114-Status: GOOD (  17.41  )
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

On Tue, 29 Jul 2025 at 23:55, Sean Christopherson <seanjc@google.com> wrote:
>
> Now that KVM_SW_PROTECTED_VM doesn't have a hidden dependency on KVM_X86,
> select KVM_GENERIC_PRIVATE_MEM from within KVM_SW_PROTECTED_VM instead of
> conditionally selecting it from KVM_X86.
>
> No functional change intended.
>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---


Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/x86/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 9895fc3cd901..402ba00fdf45 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -46,7 +46,6 @@ config KVM_X86
>         select HAVE_KVM_PM_NOTIFIER if PM
>         select KVM_GENERIC_HARDWARE_ENABLING
>         select KVM_GENERIC_PRE_FAULT_MEMORY
> -       select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
>         select KVM_WERROR if WERROR
>
>  config KVM
> @@ -84,6 +83,7 @@ config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
>         depends on KVM_X86 && X86_64
> +       select KVM_GENERIC_PRIVATE_MEM
>         help
>           Enable support for KVM software-protected VMs.  Currently, software-
>           protected VMs are purely a development and testing vehicle for
> --
> 2.50.1.552.g942d659e1b-goog
>


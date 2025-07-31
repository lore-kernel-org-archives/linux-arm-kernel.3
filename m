Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5269C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jeno8f5+usJMV/ac339wMG/DF96hWxCd1z1Rm4i7gbQ=; b=XoAXCKJ8AQeiEv88dFn+UrBHZR
	OVvBIvC5yi9Ert9J9o2nIrSLV47X5xR4g1fkcjqEoYBMFiOVytaWcqXE5dwhExQjBp615vtAK8W6Z
	iP4emcYP0xK4+PO+UOM0gYI++pf9519FvV38G8KJRDtAjlIspx7C7YzoJOQIR6FWm5jJmJlF5RkMg
	cfMvNvpb/uZK8cB0gu61mCSQUvymK/WzsSjHFQ4I9p/gWdU93mgyoGcpD0FNHjaTB8/LRFDoDWFIM
	QASG3uNoON76LS67/LILfUPf1UFIhjuWMjj4A2sFWDy2iCX8gBk4aw5HjgjjHC4JURhL60m8coAot
	HdDjMB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOYc-000000039Tg-0TsV;
	Thu, 31 Jul 2025 08:22:34 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOKx-000000037wc-1KxE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:08:28 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4aef56cea5bso60981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753949306; x=1754554106; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jeno8f5+usJMV/ac339wMG/DF96hWxCd1z1Rm4i7gbQ=;
        b=pqogcM3ZgCzNxxOm0oBVRI0QfKkIh8LoTrlGjLpoWwmg4bWA0Pnih0TMgzXjExaja4
         51bI5tzoIBH+eYsgDl8Q7IIzFnTfEpvZpSM2k1nJBx4Ff15imPn0Wy/7pv8EfG34puZF
         28WDEewUqBgLIjtr0IlQJJc7VIldKFAFEF+JYOCqV8r2s8HrigVDGx/Wq8qBpSOBoui0
         fQmRBmxo81qHX/dgwlBMGYYI7yuab8ki2nwIzYKO71Z3Mz9Adfi/DA09ANdiUKZAgLY+
         RLyDLgWnGvKzivL9IURzHIkuReYloUwafbjE9Tox5TujBeWnoekcsNpE6AGP9WYebs98
         fPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949306; x=1754554106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jeno8f5+usJMV/ac339wMG/DF96hWxCd1z1Rm4i7gbQ=;
        b=WBN+6kQQCnOBrRG86y8Gox3qmVKf6fLrWzIgjxK+TXQ6RnkZ66qWo0mJwpTYNZhECW
         lQIb6Z/N102Gz8yEkKMU+NdsD0KjYYkZ/j+qFLq4GhJnKCtnVI0sZAne3YoZiihhLGrZ
         WWRu3fFwYVN8kDs9nMxrbfqV0zqmXKkgg/GA7lUJJ2Ad+nJWW+2oNhYmA4isbk/szNoQ
         mKxBr41ZwXPVZKOxnQbBR6r0TcXPyRMT1aozEXJ3n7rPb90FjRRig3DEwsy6W+sfzZVe
         n/ZKdPg4NGDrUN713vzj/yhIxZ1EN4kSwWXDuLX6eMYkuVPQ1l+Gw+OQlGkXUghbg0dY
         oxRw==
X-Forwarded-Encrypted: i=1; AJvYcCVIOuVupBngH2pGyCQBP7FVKc5ldipjT8ojt5clEheG1thsy1g9Tp2gKMgsZObIhwj/czYp7jq+8b5PUWJfwaMi@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo19tHixQwV6bIrLwszvhQfUsPsKpBapQXRTcmmn/A3JcBC76E
	55hQ3NbW5nodAnE+VnN1uLsiPm8hpvf2xdrXueswMT8kcHP4Aqr4ueVua3T7Zbn2ZCPhKpxJXoa
	FNp8ALnEbgUvXGdUNvHyV/pEHGoCqCjEid6KcB3hj
X-Gm-Gg: ASbGncvUHycjXAh/pUYkJpathpbbFPgDqK5YCq2wvpj5976RO9yjfh7SlHxG4dGp2tJ
	NHyYQguPIkrWSk8obmLNa1LLXSrF8BEYAD9bVn7B4fV5R6JkKogBmkxabPTM8mRW6HNCSH235BN
	AmIZL5++CpG9PFOj5Xf14j4FNHxPRRYFADzF6ArkQvyfpDaiizBqgO+6BO9RjKkMpA1Z5tSCt7Y
	CIV/WI=
X-Google-Smtp-Source: AGHT+IFbmVQN1x5b+62iRQ3U8XZDUkGVQZbiaLNVWtLXncLKF5qCofgpdoCiMDPvbq7m8yKnT95C2PAE3uUVd0hLcc4=
X-Received: by 2002:a05:622a:13cd:b0:4a6:fc57:b85a with SMTP id
 d75a77b69052e-4aeeff89123mr2556921cf.14.1753949305731; Thu, 31 Jul 2025
 01:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-5-seanjc@google.com>
In-Reply-To: <20250729225455.670324-5-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 31 Jul 2025 09:07:49 +0100
X-Gm-Features: Ac12FXy0R_yNTeBd7qrXPHZNFcLfR6ujjjzcWA_Yc7EECI6d3AjDyGMKsJvuKKg
Message-ID: <CA+EHjTxHk4hsPXDiUY2nOfGdT9GjPvu7YdNKApkUJK4RjBKB4Q@mail.gmail.com>
Subject: Re: [PATCH v17 04/24] KVM: x86: Select TDX's KVM_GENERIC_xxx
 dependencies iff CONFIG_KVM_INTEL_TDX=y
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
X-CRM114-CacheID: sfid-20250731_010827_360735_8B90A034 
X-CRM114-Status: GOOD (  17.03  )
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
> Select KVM_GENERIC_PRIVATE_MEM and KVM_GENERIC_MEMORY_ATTRIBUTES directly
> from KVM_INTEL_TDX, i.e. if and only if TDX support is fully enabled in
> KVM.  There is no need to enable KVM's private memory support just because
> the core kernel's INTEL_TDX_HOST is enabled.
>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---


Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>  arch/x86/kvm/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 402ba00fdf45..13ab7265b505 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -95,8 +95,6 @@ config KVM_SW_PROTECTED_VM
>  config KVM_INTEL
>         tristate "KVM for Intel (and compatible) processors support"
>         depends on KVM && IA32_FEAT_CTL
> -       select KVM_GENERIC_PRIVATE_MEM if INTEL_TDX_HOST
> -       select KVM_GENERIC_MEMORY_ATTRIBUTES if INTEL_TDX_HOST
>         help
>           Provides support for KVM on processors equipped with Intel's VT
>           extensions, a.k.a. Virtual Machine Extensions (VMX).
> @@ -135,6 +133,8 @@ config KVM_INTEL_TDX
>         bool "Intel Trust Domain Extensions (TDX) support"
>         default y
>         depends on INTEL_TDX_HOST
> +       select KVM_GENERIC_PRIVATE_MEM
> +       select KVM_GENERIC_MEMORY_ATTRIBUTES
>         help
>           Provides support for launching Intel Trust Domain Extensions (TDX)
>           confidential VMs on Intel processors.
> --
> 2.50.1.552.g942d659e1b-goog
>


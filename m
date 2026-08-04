Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2415AC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57eVHha9yn05PRoBRgBz6lC7HiDLbzFyMEEXKt7qjx0=; b=G8JMG/f8kMVQdI/bVKrKMQMAt7
	GIEgTkJ/MLMuuSxNDKllSJNpWKC+pmd53s7oZxWYZvBACBrc9G9m1W3iOF/RlowmByBmLK8LPQ3Z6
	k6/hhkH35/YUExtjAzkqsIR7lj3HDmkonYz5AQIeufiKeyKF9MeLrEtJ2TPDqLoN/dufwnY0mhYq6
	e2pJFISHSlN9hY2ztsKSaoFUAy/EjHpcVUSJIpEoR5X0sQumhgIxImKHgRj57wn0xrdFDRnrRdokM
	TKFBS1P1yPIIlNTkQ+LivN9x3Q90KT7ZfzVZUanvo+sS8D0GFN1HzICHvyL0fDesU8hD7kms67Rb/
	E1hSYozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGys-00000002CX0-3UDT;
	Tue, 04 Aug 2026 15:23:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGyq-00000002CVm-0M2I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:23:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-498012a61f6so60525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785856978; x=1786461778; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=57eVHha9yn05PRoBRgBz6lC7HiDLbzFyMEEXKt7qjx0=;
        b=CJs4e8sOkc4j+2Ss5pz4yRMdJQWA3qBZPnsMKj7JdIBhbaULjqSfjSA9c6FDyINE0A
         zSCFW9NHoP8FB/5QOHOm3DrW3lLnmyh/KeQJi3sMXhyQ1Ni+FVaxJCEg/WwZE4EgPsHy
         QDQgEIoVciqBdbQ23m2NSen4cV201MV2D7uo2rqOYsxnNUvpvep7QiN+IcFvKGqjmKpJ
         3zIrAVHjzEaLs4E7SXesAsUev3/IBXpanQQkefPv6bRX6UfJRh0di0uZgZyoPYETeqh0
         AzyGii3dohxIW8JsrzzOPJDgTPAJUjBeRspCTXkzOwDZSCgQ4XH58ml6dZ3ZuCLYy6us
         9Teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856978; x=1786461778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=57eVHha9yn05PRoBRgBz6lC7HiDLbzFyMEEXKt7qjx0=;
        b=SGyEznSP424FfTnDHNLjsdN772FM7yDIA/Sv64dGYNPQLnEpE+hhtXu6bO2I6YAggB
         ijLXMc1nevGMi3S499M3F7Af6DozrMeYBXCDXlEJ6xPfff3qhl4P4HFx4S3KlfmKEZcW
         TTEkrVVQ6AJYHAEdCPkciwCLt8z1f6b7NlUxkNNcCnF1Gvedr5pEnKj/oreB10vmBasZ
         ANY+v5BvkH54ncKX+rHFAdS5HY4SZQxbe9cT54m6ZMH9IfLSaXUippOrMUmYTZMi0tzu
         Z3uIoxDZ+63qgFo+8zETTcuemxPY4WgHY72LthITixIgxR/FXPmZKY2wz6jZqzblw1aN
         UwZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqM0dUcfoX6RnitweYEawHsPLA+gnNQHo8urQFhpYbfGHPB+BBTDigqkygAmAsUdNgForjo6rMu4H20wlDXJ77K@lists.infradead.org
X-Gm-Message-State: AOJu0YxXtjpMXVPEuEmm7eP5LaKAjtyrqreJp4OnBrcxlQMqwHRNgUuW
	EqugYLRJpcZPstEqCKLBMyyzoakAJtAn/xoEguN1uZK8/rncOZESKgNjJTlqp5qG7g==
X-Gm-Gg: AR+sD122ymQNtZIBRb9vgbFXmlBRdlBvGgVjC/sKuGcan4wxCKGxQcl587u5PHz7q/k
	5d5wwFaUXw4bskWtR/cy0L4J8MHrjz5i+PMi+iISaDXkRFsJWxxcNQPz7o/KGx/3neToqBXIBbN
	AAYwaPR/B/cFgiKN8wxRXoYjaCzUP0mpDMCqrUO11CwAJ8riy4f7xA5pFHvLhmmjBZjj8ni5PTa
	pJ2Wsjl7KRsQxyD7TIMehfKI2o9snOh3rNMenG7u9fpV81XtRvA8gO4HZEiO3RjZ0s8R/Hp1BmI
	7di6Lx48nKKX9l6p/R3CPB1A82M2X682px4IcIoVlA8/HMgEGuTFLE/hfy9jQ9ujm7DpgXOmw4P
	4OX6wIOQ4howwL7ql8VoIun4RGxt/CNVzyKxxmk0/1x+V1D/CVc+iaipaKOVcOvuWEj9jp5IHRi
	q461MN2NeheqxEKDKeBpvGelmwF+aewlFt6kL3nshzr9dAEtHbyKpA1nSC8Lhh4rRwHMPQEM9FG
	VaK3KUr9DUv5H6elKQqlDvpHi+nHmg/
X-Received: by 2002:a05:600c:4987:b0:495:51b1:3b7c with SMTP id 5b1f17b1804b1-4994a3818b8mr1298075e9.8.1785856977525;
        Tue, 04 Aug 2026 08:22:57 -0700 (PDT)
Received: from google.com (63.235.189.35.bc.googleusercontent.com. [35.189.235.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm87206685e9.4.2026.08.04.08.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:22:56 -0700 (PDT)
Date: Tue, 4 Aug 2026 15:22:52 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com,
	dbrazdil@google.com, joey.gouly@arm.com, kees@kernel.org,
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org,
	perlarsen@google.com, qperret@google.com, rananta@google.com,
	smostafa@google.com, suzuki.poulose@arm.com, tglx@kernel.org,
	vdonnefort@google.com, bgrzesik@google.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH 02/14] KVM: arm64: Track host-unmapped MMIO regions in a
 static array
Message-ID: <anIDzEogJepLfIOc@google.com>
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-3-sebastianene@google.com>
 <CA+EHjTwDkgF5GV-k_VZ_nXbmUmwrAXaQJ5sFsk2tgr8LL3j4DA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwDkgF5GV-k_VZ_nXbmUmwrAXaQJ5sFsk2tgr8LL3j4DA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_082300_152007_7E3AD038 
X-CRM114-Status: GOOD (  34.28  )
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

On Thu, Mar 12, 2026 at 07:05:16PM +0000, Fuad Tabba wrote:
> Hi Sebastian,
> 
> On Tue, 10 Mar 2026 at 12:49, Sebastian Ene <sebastianene@google.com> wrote:
> >
> > Introduce a registry to track protected MMIO regions that are unmapped
> > from the host stage-2 page tables. These regions are stored in a
> > fixed-size array and their ownership is donated to the hypervisor during
> > initialization to ensure host-exclusion and persistent tracking.
> >
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_pkvm.h     | 10 ++++++++++
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c |  3 +++
> >  arch/arm64/kvm/hyp/nvhe/setup.c       | 25 +++++++++++++++++++++++++
> >  3 files changed, 38 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > index 757076ad4ec9..48ec7d519399 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -17,6 +17,16 @@
> >
> >  #define HYP_MEMBLOCK_REGIONS 128
> >
> > +#define PKVM_PROTECTED_REGS_NUM        8
> > +
> > +struct pkvm_protected_reg {
> > +       u64 start_pfn;
> > +       size_t num_pages;
> > +};
> > +
> > +extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
> > +extern unsigned int kvm_nvhe_sym(num_protected_reg);
> > +
> >  int pkvm_init_host_vm(struct kvm *kvm);
> >  int pkvm_create_hyp_vm(struct kvm *kvm);
> >  bool pkvm_hyp_vm_is_created(struct kvm *kvm);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 0808367c52e5..7c125836b533 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -23,6 +23,9 @@
> >
> >  struct host_mmu host_mmu;
> >
> > +struct pkvm_protected_reg pkvm_protected_regs[PKVM_PROTECTED_REGS_NUM];
> > +unsigned int num_protected_reg;
> > +
> >  static struct hyp_pool host_s2_pool;
> >
> >  static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
> > index 90bd014e952f..ad5b96085e1b 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/setup.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/setup.c
> > @@ -284,6 +284,27 @@ static int fix_hyp_pgtable_refcnt(void)
> >                                 &walker);
> >  }
> >
> > +static int unmap_protected_regions(void)
> 
> I think the name of this function is confusing. It's not really
> unmapping, it's donating the regions to hyp. Maybe
> donate_protected_regions() or claim_protected_mmio_regions to reflect
> that we are doing an ownership transfer?

I renamed it to donate_protected_mmio_regions to make it more clear in
regards to what it does. 

> 
> > +{
> > +       struct pkvm_protected_reg *reg;
> > +       int i, ret, j = 0;
> 
> Please don't interleave the iterators with ret. Moreover, you can
> define ret inside the loop below. Also, you don't need to initialze j.
> 
> > +
> > +       for (i = 0; i < num_protected_reg; i++) {
> > +               reg = &pkvm_protected_regs[i];
> > +               for (j = 0; j < reg->num_pages; j++) {
> > +                       ret = __pkvm_host_donate_hyp_mmio(reg->start_pfn + j);
> > +                       if (ret)
> > +                               goto err_setup;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +err_setup:
> > +       for (j = j - 1; j >= 0; j--)
> > +               __pkvm_hyp_donate_host_mmio(reg->start_pfn + j);
> 
> This rolls back the regions only for the latest `i` iteration, not all
> the `i` iterations.
>

I re-wrote this bit since the last version of the
__pkvm_host_donate_hyp_mmio accepts a size as well.

> How about (not tested):
> 
> +    err_setup:
> +       while (j--)
> +           __pkvm_hyp_donate_host_mmio(reg->start_pfn + j);
> +
> +       while (i--) {
> +           reg = &pkvm_protected_regs[i];
> +           for (j = reg->num_pages - 1; j >= 0; j--)
> +               __pkvm_hyp_donate_host_mmio(reg->start_pfn + j);
> +       }
> 
> Thanks,
> /fuad
> 

Cheers,
Sebastian

> 
> > +       return ret;
> > +}
> > +
> >  void __noreturn __pkvm_init_finalise(void)
> >  {
> >         struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
> > @@ -324,6 +345,10 @@ void __noreturn __pkvm_init_finalise(void)
> >         if (ret)
> >                 goto out;
> >
> > +       ret = unmap_protected_regions();
> > +       if (ret)
> > +               goto out;
> > +
> >         ret = hyp_ffa_init(ffa_proxy_pages);
> >         if (ret)
> >                 goto out;
> > --
> > 2.53.0.473.g4a7958ca14-goog
> >


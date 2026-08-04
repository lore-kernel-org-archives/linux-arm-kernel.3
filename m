Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A5EC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoiYuPF6Lxrjv4D/1nx7DDBtlGVMorYZQ8pdqOx51TA=; b=xf5DcyFsZaOsSPt7EG6ex9sdsa
	Zeht0XAs1Pb2dUVRldO5zsTDnSBtzuv8kOtZf5qc1HrV+RPk/lTIYtMCuyccEbZwGse1Mcl9i39to
	NhLRSitb3ne0fWmeLa2EqGzWZvlBal53sXt9LMDkUDqvyM0hjitqljJvLMVI9TNGxqYKTyPAN8GYT
	4Im7huVunn2gITmHgIRqpgAT4aEytsKV3ow/epOQIE0pHk/wUdwiXbDxV5wWF4Z6WZBQ+oUDutpmW
	1QPweLA/BoU8ejyED14is8pRRSJs/06FP4XtHPhqSkIwx6hmscsgGa45tRz2ODPIrMmDEyxnNeqNW
	XSVfm46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGTF-000000027nN-42fV;
	Tue, 04 Aug 2026 14:50:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGTC-000000027lm-1btj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:50:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-495509b08ebso46925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785855015; x=1786459815; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aoiYuPF6Lxrjv4D/1nx7DDBtlGVMorYZQ8pdqOx51TA=;
        b=aZSSRosWaTEnAMYC8dk3Azt2ndTOn80zsVnztx7mYc1b5rECsRHcnic+vaplopam2h
         l+lGl1sk9DMQJVcor4APRFOT3isSyegUUVA5PGeUGB60qe1qCBlmjnYaY3FtsiP2P4hK
         icRk/DUAIU93UHVm2hgvt9UakW/NHkQE/g1oqCXzh8HVySwWI5jvkumA3v/dav0yEWlY
         BNSmxRsJUwGq22/jRzxXNmX+ZVi3dxL6L8KXh8yv8k6mgA2G42nN/c43ir8elRRNDtNC
         yaKzftZT5tZD7enlQlswJIo3FzFb5iLGf0wg0c7G6GMOoBB68WFvjqz/4efRQH590h6J
         co0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785855015; x=1786459815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoiYuPF6Lxrjv4D/1nx7DDBtlGVMorYZQ8pdqOx51TA=;
        b=ATR9LPZ33BwJ9Bmc/qPvRJyqDuQmlLOwpIyfOILYSJzz+FWeKiiaRwk8ME4xcWnm0c
         WKpJTGxJ9RHJd6cDmRSXv8ncmCc7FlGenUsnuV2hFvJdkG7fqNwXi2PoTUc91R1YJ41H
         V991jPgUeqSHnghpBIHPc4IeGueUeQy45tHUjU27px4OeoLrtAodPfC1s50oU90Q5tZs
         xMr/uwRqbs0wHGGFiekuQtiz5cGxZ43KnKyzVZwW48sN3BloHMC9OYe8fp1ZRarKZfMa
         IUMftPV5h5yBFoNSNb4G5hUWa6NyNUP77bypyYdqobsh7YNnGlm6b03hBGKNuddxZF8J
         K62Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfqlIxbxxG7dtKnt/TMSSvEgQqQzvhZx0yT3SC5KNDFLn4BgaCQLDPbTGJvVlmrjklIJw6E0Xz3erFoUfpjcFc@lists.infradead.org
X-Gm-Message-State: AOJu0YzB9Nn5rXzH8iMOxHzBmWvaOAcCwKLZShvx/CIgNT64WxOvkSvZ
	bRXaL+EJd62t5OZq/CTMzEWP/1zBdRdCYqAzZNOwC4A6dDJtK8BL14VcPX2md8WRig==
X-Gm-Gg: AR+sD108ch+sHdQ5q8IHBwCPIkCeGdMQxqlCK2hqRija2og6vbm6xkm3m2SHyGxVaTM
	m1WEBbdTSK9ILoEMQAM244NaDTI9ms6VlFjilpyadmzVW5qroYJ+HQi239IUEeC+7C2VnHFjvvJ
	7iGqMzd3DyVgeEjxEnG59F7PV5n3nrhE2lmLotmQzGCKWORhqVHmKJV39Sd9Vq1Yw0dnikfC20q
	+/a/E5sKQh267dSfbUcggsb8A6ZmNFuHJwJUT3Tzto8qmPA/3mg1hFfV0kDISQGTNpH4eYwr1xK
	rS7V3E0FD37qEVlM0Fm/7jtD1Vu1BcHc5Q3/kw/B0/+LqdG4GmAiH6EpbLx1JD4kkdSbFWYLHMM
	kOfWa/6mCO7aEXT1McEXYtvT8jkNo1SAoHld78l94pztStwC1lKQWBcrolTIlk4Mt4MEhP0TDqx
	iH31Pcn27mE+X2hbZ76DPKeIKgNNlsnnK40q5Wf7MrKuRVyNkpT4hjKLMf22GtwLmz07aFujZY2
	n4ysk4s3KTlK31vuko823D2uWxUnK1w
X-Received: by 2002:a05:600c:230c:b0:495:3ffd:5e39 with SMTP id 5b1f17b1804b1-4994dc85254mr145915e9.3.1785855014652;
        Tue, 04 Aug 2026 07:50:14 -0700 (PDT)
Received: from google.com (63.235.189.35.bc.googleusercontent.com. [35.189.235.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec232d74sm181843f8f.17.2026.08.04.07.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 07:50:14 -0700 (PDT)
Date: Tue, 4 Aug 2026 14:50:10 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com,
	dbrazdil@google.com, joey.gouly@arm.com, kees@kernel.org,
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org,
	perlarsen@google.com, qperret@google.com, rananta@google.com,
	smostafa@google.com, suzuki.poulose@arm.com, tabba@google.com,
	tglx@kernel.org, bgrzesik@google.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH 02/14] KVM: arm64: Track host-unmapped MMIO regions in a
 static array
Message-ID: <anH8IuRrbQV67Q4C@google.com>
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-3-sebastianene@google.com>
 <acJrldyUBXgbvWw4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJrldyUBXgbvWw4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_075018_448706_FC196252 
X-CRM114-Status: GOOD (  29.76  )
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

On Tue, Mar 24, 2026 at 10:46:45AM +0000, Vincent Donnefort wrote:
> On Tue, Mar 10, 2026 at 12:49:21PM +0000, Sebastian Ene wrote:
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
> > +#define PKVM_PROTECTED_REGS_NUM	8
> > +
> > +struct pkvm_protected_reg {
> > +	u64 start_pfn; 
> > +	size_t num_pages; 
> 
> nit: "u64 pfn, u64 nr_pages" to align with everywhere else.

Ack,

> 
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
> >  				&walker);
> >  }
> >  
> > +static int unmap_protected_regions(void)
> > +{
> > +	struct pkvm_protected_reg *reg;
> > +	int i, ret, j = 0;
> > +
> > +	for (i = 0; i < num_protected_reg; i++) {
> > +		reg = &pkvm_protected_regs[i];
> > +		for (j = 0; j < reg->num_pages; j++) {
> > +			ret = __pkvm_host_donate_hyp_mmio(reg->start_pfn + j);
> 
> If this is to make this static at boot, we don't even need __pkvm_host_donate_hyp_mmio()
> 
> We can just map the region early enough in the hypervisor pkvm_create_mappings()
> in recreate_hyp_mappings() and then let fix_host_ownership() do the host
> stage2 unmapping.


I looked at this and tried to implement it this way as you suggest because it is more
elegant but then I realized that `fix_host_ownership_walker` doesn't do
well with MMIO (it returns -EINVAL).

> 
> > +			if (ret)
> > +				goto err_setup;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +err_setup:
> > +	for (j = j - 1; j >= 0; j--)
> > +		__pkvm_hyp_donate_host_mmio(reg->start_pfn + j);
> > +	return ret;
> > +}
> > +
> >  void __noreturn __pkvm_init_finalise(void)
> >  {
> >  	struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
> > @@ -324,6 +345,10 @@ void __noreturn __pkvm_init_finalise(void)
> >  	if (ret)
> >  		goto out;
> >  
> > +	ret = unmap_protected_regions();
> > +	if (ret)
> > +		goto out;
> > +
> >  	ret = hyp_ffa_init(ffa_proxy_pages);
> >  	if (ret)
> >  		goto out;
> > -- 
> > 2.53.0.473.g4a7958ca14-goog
> > 

Thanks Sebastian


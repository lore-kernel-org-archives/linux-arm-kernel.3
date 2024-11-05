Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA654D31769
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=473DlSot6ue6xbPLLwBdkXEbSfpgFoGTCnq7nesFQaI=; b=YmJFkbp6jX8ni3FKiIyBz/o89Z
	7G8vNjKT+08ojxth7QMrOgz0WCs9kYAtWhk5imcG9SJq2Ozj3ZALS0w9bNLs0FSpyMeKKbgil0ppF
	YAgSjQYLibMdJEPOjdoB/FYaVOpxKbF1CzHYNt/QkHi9Q6T4VW4YhNLTe2ao+7aajjk/EOIkru18I
	FnYJfLRu+y+bEk/W85kmhgOrnGqxsMsxZWRVRh8V4EjPza8o2SZ812lb96de/owptKb1m9BOCrU+s
	fxFqOuWTIt957HWdgpc97NxxtSS2e7WqTtSsh+gNq0jpP/QuqM0L/iztUk+5GwqRLuZSgbDW7NkNT
	SHZK5HTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8N4a-00000000ANm-0CsO;
	Tue, 05 Nov 2024 17:10:32 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8M5Y-0000000HZd3-17Nw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:07:29 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539eb97f26aso3555212e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 08:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730822846; x=1731427646; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=473DlSot6ue6xbPLLwBdkXEbSfpgFoGTCnq7nesFQaI=;
        b=RnWDeKg/mNhNLAdwrfqHI3g9tTRYI6rIQEb0upONaKhjT2lILbMJHDPs6qV1qA0XgH
         yeanXYnf+JSLZg2BQXft+wIZe5COgIULkZseTgg9W1a5pUg9f4WAhrHo+Kk3hmOMPBay
         q6ec9ll8YRcoIdcw6v1op39q4AIofjtwNXYNcDhXDt1NAdUlxzSHdfbX5B9KT4eE9KGb
         LsybA/ZOJ9Cd0Chxw+DLBikBG8BAPnFOIJXbwT1oTsceF4b602Zq8S/BG+1uOPp+Vh+1
         p6bUEKDD4uspLu35iICTnnPozRlwsBX3hzhA22AuU6FGL1pqa96fT/mV0UcdkIplNyaC
         MyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730822846; x=1731427646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=473DlSot6ue6xbPLLwBdkXEbSfpgFoGTCnq7nesFQaI=;
        b=JSEIbw+CYOFFdnIiiQ7JCwBu67m73GgRYN6L6JrIfsGgx39M4Lo10RW8FPpYyjtYFs
         y3lthjFh7cavH9gkY7TR/fveOph0FxGl0G9/LqAU//05/dnt+7124/FHoR0Ixm+vIwm7
         2VFjnI9tAZQiBVpcbuun4kUAwMR+1BdBZKrYRGTIQkbY7HDoAoLM6EOCwNIgU6fx/lqY
         T7znajVYtiQNKkUdyJpsMXutr2qVph1QkYX3ROITGcdJMtzVMWp/PbcQ1X+4Z1P0opzM
         Dh5DkHoHgD4eo4nfVnHJWnNXsN6oVnKNq6DyzR85cROdBFhGbfetRDcv5vIhjjUX9z9f
         ELYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXammxm67IqYEjw5t0kWupNRUYCpNn/tDRe8yqXV8v9dx1RzlEnODnrKXd7VZE5WfL9WsZaiNNUIzFJ/bE+Gars@lists.infradead.org
X-Gm-Message-State: AOJu0YzJkgiL8EcF0APYQosTknq9VcVGi83G2XQXihef+eUpiTn0bcXp
	GxQR88R8IApaDvfDc5tF5zTeg5xeGdD8diHiPrBc8Ow03uK+y5Cf9TXxXjLSGw==
X-Google-Smtp-Source: AGHT+IHQrLAwD8G22UzU+Ve3Dp55NDLGsHlnPaeRYF6+uIfupSs5Q35hB7K725aR+e45CXT07QcH/g==
X-Received: by 2002:a05:6512:3f13:b0:539:9490:7257 with SMTP id 2adb3069b0e04-53b7ecf28ebmr12296414e87.30.1730822845919;
        Tue, 05 Nov 2024 08:07:25 -0800 (PST)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17d0adasm151224366b.111.2024.11.05.08.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:07:25 -0800 (PST)
Date: Tue, 5 Nov 2024 16:07:21 +0000
From: Quentin Perret <qperret@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/18] KVM: arm64: Plumb the pKVM MMU in KVM
Message-ID: <ZypCuSRW9VJEEWnr@google.com>
References: <20241104133204.85208-19-qperret@google.com>
 <202411051325.EBkzE0th-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202411051325.EBkzE0th-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_080728_329424_D5A2643B 
X-CRM114-Status: GOOD (  24.57  )
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

On Tuesday 05 Nov 2024 at 13:53:22 (+0800), kernel test robot wrote:
> Hi Quentin,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on v6.12-rc6]
> [also build test WARNING on linus/master]
> [cannot apply to kvmarm/next next-20241104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Quentin-Perret/KVM-arm64-Change-the-layout-of-enum-pkvm_page_state/20241104-213817
> base:   v6.12-rc6
> patch link:    https://lore.kernel.org/r/20241104133204.85208-19-qperret%40google.com
> patch subject: [PATCH 18/18] KVM: arm64: Plumb the pKVM MMU in KVM
> config: arm64-randconfig-002-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051325.EBkzE0th-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051325.EBkzE0th-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411051325.EBkzE0th-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arch/arm64/kvm/mmu.c:338: warning: Function parameter or struct member 'pgt' not described in 'kvm_s2_unmap'
> >> arch/arm64/kvm/mmu.c:338: warning: Function parameter or struct member 'addr' not described in 'kvm_s2_unmap'
> >> arch/arm64/kvm/mmu.c:338: warning: expecting prototype for __unmap_stage2_range(). Prototype was for kvm_s2_unmap() instead
> 
> 
> vim +338 arch/arm64/kvm/mmu.c
> 
>    299	
>    300	/*
>    301	 * Unmapping vs dcache management:
>    302	 *
>    303	 * If a guest maps certain memory pages as uncached, all writes will
>    304	 * bypass the data cache and go directly to RAM.  However, the CPUs
>    305	 * can still speculate reads (not writes) and fill cache lines with
>    306	 * data.
>    307	 *
>    308	 * Those cache lines will be *clean* cache lines though, so a
>    309	 * clean+invalidate operation is equivalent to an invalidate
>    310	 * operation, because no cache lines are marked dirty.
>    311	 *
>    312	 * Those clean cache lines could be filled prior to an uncached write
>    313	 * by the guest, and the cache coherent IO subsystem would therefore
>    314	 * end up writing old data to disk.
>    315	 *
>    316	 * This is why right after unmapping a page/section and invalidating
>    317	 * the corresponding TLBs, we flush to make sure the IO subsystem will
>    318	 * never hit in the cache.
>    319	 *
>    320	 * This is all avoided on systems that have ARM64_HAS_STAGE2_FWB, as
>    321	 * we then fully enforce cacheability of RAM, no matter what the guest
>    322	 * does.
>    323	 */
>    324	/**
>    325	 * __unmap_stage2_range -- Clear stage2 page table entries to unmap a range
>    326	 * @mmu:   The KVM stage-2 MMU pointer
>    327	 * @start: The intermediate physical base address of the range to unmap
>    328	 * @size:  The size of the area to unmap
>    329	 * @may_block: Whether or not we are permitted to block
>    330	 *
>    331	 * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
>    332	 * be called while holding mmu_lock (unless for freeing the stage2 pgd before
>    333	 * destroying the VM), otherwise another faulting VCPU may come in and mess
>    334	 * with things behind our backs.
>    335	 */
>    336	
>    337	static int kvm_s2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  > 338	{
>    339		return KVM_PGT_S2(unmap, pgt, addr, size);
>    340	}
>    341	

Oops, yes, that broke the kerneldoc comment, I'll fix in v2.


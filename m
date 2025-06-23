Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5059EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=tGQz+pPj9rguv78Mk1DG88zZ+C5YYmZS8y1NwOe8IHE=; b=sOBa5UE3jrSxcS
	qtvU4ICiJRYKLhTOpoAk+mN9cFBkiOOgDaP+F3xBo3Wqf/OEgK1RfQ2lGEreWc8k2eC13j1GIAhCZ
	po7+uTA2Qx4dz+XARoKhArKIJNzsm8YnpcP5QsAlAfbZS+0CN2dByuF9+5qdAM5PSgRCYgo/u18zC
	Sl7jMEwRnOk7Bywmc2fNkJ1zTe8vZcjTscztkO4yD5jun9P82WzkcCzB1F5YaT0IlifL6UphZ5oIj
	3cm4FYfXrQNgb2L22F9zuiE7IWLbhW5/iiiQwJccjqMGPGObUmwGxCNsNdzNPi4byJqMY8Dv+ZFgV
	8F7YZtEMr4pMGJQ3KMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrbV-00000004IBC-1Whe;
	Tue, 24 Jun 2025 00:33:37 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpNl-000000045CD-3mOQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 22:11:19 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86cf89ff625so406459539f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 15:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750716676; x=1751321476; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGQz+pPj9rguv78Mk1DG88zZ+C5YYmZS8y1NwOe8IHE=;
        b=RAdeKgUSh9VVHAMLMyUX9PVM+XqdDQnsVEupzPUkhg/6EO6AoXw7OHns4LdRmxDFkr
         DdTfaDJ4FrBP7Imb3rUW0Nda1c/OrNJPgw1F0RsNmWIHfcXBfs07zj/wlXDHoEa8rpYz
         9QJ9eulvU3iEQCZB6mPgvD1+XRW8eafoT+YO54mlaSTvN6OKxTplPCtHzu1vPP5h8s5C
         DvR6kAadCOgCYg3zYBR/bMvjYrO2Rex/jT0Bzc4bvWGnbRajhhR1abY+RMOUPP+U0aC3
         XFObE5OLWUpKPdAt4/XUCaH+YtjR39/QHjsK2WHPPtYVDs4edwhygoL7rAAgWiglBwCw
         SfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750716676; x=1751321476;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGQz+pPj9rguv78Mk1DG88zZ+C5YYmZS8y1NwOe8IHE=;
        b=VIjF8Bndmj5gAUF9mRvliqCMg2PQjLQn1TbKVTPbpG+gcSPwhwDXZz8Qak17C7wOMn
         m1BIWf8fkvctWJ3F8BI/H3tGgQKmV/lEyuThINY1ANFjV4fpp8eTv2rq1d6FIPweqH7f
         qy6Dq4U1xLd9IhiMsNf1kPVMnM5XlqMFLwTg9swFrRbkE64fGR+Wl3ecYp1yeo47lEpD
         Mt3u/Qa/6VZHIES9rW2ZxvfpYJP6MqOo3VotiZVlDrCbqZuSo7jr45mGIENJMN+PaZk4
         BG9iMgyO1umsTDAL3eAZlgqzSgc7XF3WXQM/lErOiJLzjVBXZaE5juIzNY0f/X7zeB1m
         FrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxsGEAZdC5FwUiUEmHtfCyCentzIJsfjTEl8Ru8EOjmddbZG0QYG1yIgWfNMMkIiDluuiXKZwbxDT3UzGYWKRd@lists.infradead.org
X-Gm-Message-State: AOJu0YwfOza0Kk9HIUw5Uvj7ecn4eDeXI2lS+dRKbc0AhurEOBK1ytRe
	RzVhU3tnwiT3skyFl1qHC8J6fb0EDBZeCP8q8Nk3g0+Dd3TmHHvq8eDeaR2QaGcZeBoNMhGsqxH
	07NdsvBvLl0VntP5F9fGHLdxNcg==
X-Google-Smtp-Source: AGHT+IFROh/q8Un43k3KAN6/Y7TN0oBqMJ1o65GnORb3dUVRyme5Qfos+kVCSSkafOZNJv6Ve5iTj9GtWD2hqiOqYQ==
X-Received: from ilbdr12.prod.google.com ([2002:a05:6e02:3f0c:b0:3dd:b580:4100])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3499:b0:3de:119f:5261 with SMTP id e9e14a558f8ab-3de38c1c019mr212245545ab.3.1750716676655;
 Mon, 23 Jun 2025 15:11:16 -0700 (PDT)
Date: Mon, 23 Jun 2025 22:11:15 +0000
In-Reply-To: <202506221711.tFNGpzj4-lkp@intel.com> (message from kernel test
 robot on Sun, 22 Jun 2025 17:32:31 +0800)
Mime-Version: 1.0
Message-ID: <gsntikkm9kho.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 17/23] KVM: arm64: Account for partitioning in PMCR_EL0 access
From: Colton Lewis <coltonlewis@google.com>
To: kernel test robot <lkp@intel.com>
Cc: kvm@vger.kernel.org, oe-kbuild-all@lists.linux.dev, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_151117_939557_1D81168D 
X-CRM114-Status: GOOD (  20.27  )
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

kernel test robot <lkp@intel.com> writes:

>     In file included from arch/arm64/include/asm/kvm_host.h:32,
>                      from include/linux/kvm_host.h:45,
>                      from arch/arm64/kvm/sys_regs.c:16:
>     arch/arm64/include/asm/kvm_pmu.h:236:50: warning: 'struct arm_pmu'  
> declared inside parameter list will not be visible outside of this  
> definition or declaration
>      static inline bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
>                                                       ^~~~~~~
>     arch/arm64/include/asm/kvm_pmu.h:241:52: warning: 'struct arm_pmu'  
> declared inside parameter list will not be visible outside of this  
> definition or declaration
>      static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
>                                                         ^~~~~~~
>     arch/arm64/include/asm/kvm_pmu.h:246:53: warning: 'struct arm_pmu'  
> declared inside parameter list will not be visible outside of this  
> definition or declaration
>      static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
>                                                          ^~~~~~~
>     arch/arm64/kvm/sys_regs.c:856:6: warning: no previous prototype  
> for 'pmu_access_el0_disabled' [-Wmissing-prototypes]
>      bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu)
>           ^~~~~~~~~~~~~~~~~~~~~~~
>     arch/arm64/kvm/sys_regs.c: In function 'access_pmu_evtyper':
>     arch/arm64/kvm/sys_regs.c:1076:7: error: implicit declaration of  
> function 'kvm_vcpu_pmu_is_partitioned'; did you  
> mean 'kvm_pmu_is_partitioned'? [-Werror=implicit-function-declaration]
>        if (kvm_vcpu_pmu_is_partitioned(vcpu))
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>            kvm_pmu_is_partitioned
>     arch/arm64/kvm/sys_regs.c: In function 'set_pmcr':
>>> arch/arm64/kvm/sys_regs.c:1271:33: error: dereferencing pointer to  
>>> incomplete type 'struct arm_pmu'
>            new_n <= kvm->arch.arm_pmu->hpmn_max))
>                                      ^~
>     cc1: some warnings being treated as errors

Looks like the main problem here is struct arm_pmu is not defined if we
don't have CONFIG_ARM_PMU. I'll provide a dummy definition for that case
and swap out the field reference for a function call.

Secondary problem is making sure there is a prototype for
pmu_access_el0_disabled in that instance.

> vim +1271 arch/arm64/kvm/sys_regs.c

>    1253
>    1254	static int set_pmcr(struct kvm_vcpu *vcpu, const struct  
> sys_reg_desc *r,
>    1255			    u64 val)
>    1256	{
>    1257		u8 new_n = FIELD_GET(ARMV8_PMU_PMCR_N, val);
>    1258		struct kvm *kvm = vcpu->kvm;
>    1259
>    1260		mutex_lock(&kvm->arch.config_lock);
>    1261
>    1262		/*
>    1263		 * The vCPU can't have more counters than the PMU hardware
>    1264		 * implements. Ignore this error to maintain compatibility
>    1265		 * with the existing KVM behavior.
>    1266		 */
>    1267		if (!kvm_vm_has_ran_once(kvm) &&
>    1268		    !vcpu_has_nv(vcpu)	      &&
>    1269		    new_n <= kvm_arm_pmu_get_max_counters(kvm) &&
>    1270		    (!kvm_vcpu_pmu_is_partitioned(vcpu) ||
>> 1271		     new_n <= kvm->arch.arm_pmu->hpmn_max))
>    1272			kvm->arch.nr_pmu_counters = new_n;
>    1273
>    1274		mutex_unlock(&kvm->arch.config_lock);
>    1275
>    1276		/*
>    1277		 * Ignore writes to RES0 bits, read only bits that are cleared on
>    1278		 * vCPU reset, and writable bits that KVM doesn't support yet.
>    1279		 * (i.e. only PMCR.N and bits [7:0] are mutable from userspace)
>    1280		 * The LP bit is RES0 when FEAT_PMUv3p5 is not supported on the  
> vCPU.
>    1281		 * But, we leave the bit as it is here, as the vCPU's PMUver might
>    1282		 * be changed later (NOTE: the bit will be cleared on first vCPU  
> run
>    1283		 * if necessary).
>    1284		 */
>    1285		val &= ARMV8_PMU_PMCR_MASK;
>    1286
>    1287		/* The LC bit is RES1 when AArch32 is not supported */
>    1288		if (!kvm_supports_32bit_el0())
>    1289			val |= ARMV8_PMU_PMCR_LC;
>    1290
>    1291		__vcpu_assign_sys_reg(vcpu, r->reg, val);
>    1292		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
>    1293
>    1294		return 0;
>    1295	}
>    1296

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


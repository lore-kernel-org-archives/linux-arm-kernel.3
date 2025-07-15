Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB2DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 21:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=W3m+1hLOZ8hAFq4B95DKPtg5XMn2S7HOXjCLINFrtq0=; b=ryiUkVux+czRHa
	bWAQ2Kvki/ByTV8MKbV67SdXRsMz7RPs1WmCHQnvWsHzxVoJf0XjU352OC02Clhrk3LqosacOw6Mv
	Pu9tbi+d/AAD/pe4fPXrR/LsCHlAGqbUjqD30D1N+dK2H2gw0gd1X+Pz5HqCMJ2Dxdt/okQir49QU
	erOkR7I/DbfaRMz5wG8dIjd72v1Ahb3bYYwQGj5UQRPK3uYYuK8KDoCL1Yato18c/enU0otpR0JvB
	Fvp1Nh4x2MTiC2QxNOtfSzal1yapQwBwlRPPc6wR9llH/Rc0+BawbUS3KUXumxiMjz/6Ruc2e30Na
	hbeELJlq9E1KRl2Il2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubn3c-00000006FGn-2gtE;
	Tue, 15 Jul 2025 21:19:24 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubn1B-00000006F5A-1Kzk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 21:16:54 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-611fdcbe1d8so4054044eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752614212; x=1753219012; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3m+1hLOZ8hAFq4B95DKPtg5XMn2S7HOXjCLINFrtq0=;
        b=b1xZkOM3RkVGBHjOHiesj5pD/NYwFp020+4xlqyhDqw+I8sKQqAWxMpkNP2dBDcCk6
         3/BVs5wCjqmLgl3sESnr87FnbTtdIYO6s9JwHk0X0CxNzbje8GD5t4fDF/yu8m3zsy0L
         9dX11kmvjvALmK5zhpc0GHdqiY0fHgMkqd/mMt3htMKgc/T0UX5iHaKpSSnT2IqkPWdL
         aC3zy1VrbMYW6APc2wlOY6yufV1dqUnM6LcQEKFFAq4BzXQXoxKmMa0BFwWUS7QHz4x1
         f704CLDAKUlJcE2VjPYWBvQ7k6BW1CmKhUlKD26Cp502C609kYEYd/kajbbifg8e5kiD
         t/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752614212; x=1753219012;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3m+1hLOZ8hAFq4B95DKPtg5XMn2S7HOXjCLINFrtq0=;
        b=aOQr6XyqqHG3NoBNo8UCztlBZ5Rr0iU94TTfMbINIDSQ01OtMMBAODYNjXE40ADJRo
         bIIUXiEqx2eNokRYfhmuhcoZeC/1ZJ2YJJmNwmKMZfpXn/yQSPskYp/UwyUhEsCYRydu
         sjp3cs/1AGs0ZMsaPduFfA7vVxvSjkKaBqKmBvfTdxVRz2o47rITuIQOMG0iFNE7au5C
         SkoT8d8jaGzqDPdHfg2Qt9TbhhNeXU6YYpXLlk3rmsP8y6i2As+QtXgngLfEnAxPACCq
         qzjGcSgudckMgoNTgtM7p65fU3xx3uPGkjrXfFzIC6UI4s+cptpk4loaDQz/ehyZdjsq
         0HpA==
X-Forwarded-Encrypted: i=1; AJvYcCUM56ErA5Q7G4MCPzu0ZYMrExHPnuKt8yNi1ORjxYL9yIKBeyWYWZyPkiGIMdB/EqY4BnEW8RMCUXGLNQhfMOPB@lists.infradead.org
X-Gm-Message-State: AOJu0YyAfizmpnzqwC9ijYqBwBx7mtbAtk8uSJhDTesFnmte//I1FEiv
	XxEQMQKB/mA0kvvg2jAGAQ9lUramH8I7cSnXrdpxC6FQ5J8FWNQuSJ9+mUYxWHLz6yHNy1FQWAM
	fDdzWCu93K25GWk787Tjw0A6+TA==
X-Google-Smtp-Source: AGHT+IET2M3P36gkp3EjMv7BaUc9VYIy2qskuUCF22ILqTd3hhERB/uyQyetYE1K8s52+LEBtd/RipiSFpzH6qhMLA==
X-Received: from oobic4.prod.google.com ([2002:a05:6820:6704:b0:613:872a:7b2b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:418e:b0:615:7c7f:4aa6 with SMTP id 006d021491bc7-615a1f5b472mr11828eaf.3.1752614211817;
 Tue, 15 Jul 2025 14:16:51 -0700 (PDT)
Date: Tue, 15 Jul 2025 21:16:50 +0000
In-Reply-To: <202507160129.vrvWpdVu-lkp@intel.com> (message from kernel test
 robot on Wed, 16 Jul 2025 01:26:23 +0800)
Mime-Version: 1.0
Message-ID: <gsntv7nt9mt9.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v4 22/23] KVM: arm64: Add ioctl to partition the PMU when supported
From: Colton Lewis <coltonlewis@google.com>
To: kernel test robot <lkp@intel.com>
Cc: kvm@vger.kernel.org, oe-kbuild-all@lists.linux.dev, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_141653_363955_50258AC3 
X-CRM114-Status: GOOD (  18.75  )
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

> Hi Colton,

> kernel test robot noticed the following build errors:

> [auto build test ERROR on 79150772457f4d45e38b842d786240c36bb1f97f]

> url:     
> https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20250715-070741
> base:   79150772457f4d45e38b842d786240c36bb1f97f
> patch link:     
> https://lore.kernel.org/r/20250714225917.1396543-23-coltonlewis%40google.com
> patch subject: [PATCH v4 22/23] KVM: arm64: Add ioctl to partition the  
> PMU when supported
> config: arm64-randconfig-003-20250715  
> (https://download.01.org/0day-ci/archive/20250716/202507160129.vrvWpdVu-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build):  
> (https://download.01.org/0day-ci/archive/20250716/202507160129.vrvWpdVu-lkp@intel.com/reproduce)

> If you fix the issue in a separate patch/commit (i.e. not just a new  
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:  
> https://lore.kernel.org/oe-kbuild-all/202507160129.vrvWpdVu-lkp@intel.com/

> All errors (new ones prefixed by >>):

>     In file included from arch/arm64/include/asm/kvm_host.h:31,
>                      from include/linux/kvm_host.h:45,
>                      from arch/arm64/kernel/asm-offsets.c:15:
>     arch/arm64/include/asm/kvm_pmu.h: In function 'kvm_pmu_is_partitioned':
>>> arch/arm64/include/asm/kvm_pmu.h:301:43: error: parameter name omitted
>      static inline bool kvm_pmu_is_partitioned(void *)
>                                                ^~~~~~
>     arch/arm64/include/asm/kvm_pmu.h: In  
> function 'kvm_pmu_host_counter_mask':
>     arch/arm64/include/asm/kvm_pmu.h:306:45: error: parameter name omitted
>      static inline u64 kvm_pmu_host_counter_mask(void *)
>                                                  ^~~~~~
>     arch/arm64/include/asm/kvm_pmu.h: In  
> function 'kvm_pmu_guest_counter_mask':
>     arch/arm64/include/asm/kvm_pmu.h:311:46: error: parameter name omitted
>      static inline u64 kvm_pmu_guest_counter_mask(void *)
>                                                   ^~~~~~
>     make[3]: *** [scripts/Makefile.build:182:  
> arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=21662191

Same spot/declarations that triggered a build error on v2 and fixed in
v3 but moved to void * in v4 rather than defining an empty arm_pmu
struct due to v3 feedback.

Notably I remembered to build this branch before sending this time but
these definitions do not trigger an error or warning on gcc-14 with this
.config and W=1. So I'm not sure how I could have reasonably caught this
myself before sending.

Anyway, I'll fix. It's nothing to give the parameters a name.

>     make[3]: Target 'prepare' not remade because of errors.
>     make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=21662191
>     make[2]: Target 'prepare' not remade because of errors.
>     make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=21662191
>     make[1]: Target 'prepare' not remade because of errors.
>     make: *** [Makefile:248: __sub-make] Error 2 shuffle=21662191
>     make: Target 'prepare' not remade because of errors.


> vim +301 arch/arm64/include/asm/kvm_pmu.h

>     300
>   > 301	static inline bool kvm_pmu_is_partitioned(void *)
>     302	{
>     303		return false;
>     304	}
>     305

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


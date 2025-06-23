Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8B2C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XtLVtTxbmHrCBpSNsrNTm3SDGLbs218ttvI0elQ1Q/A=; b=ceM4Te/aYdMYm2
	fecH2O30UfDa5WGnj8hS9aA6tFzjP4FVPhD1ZZ3GZykXkPHx4diEHd8OOREYAhXQI2nGiiLT9Ofr4
	hJjKxbwpQVJh2oNrkbYj9/II8Z81EJUZUmkj4EeQT+XRiH8wV5RTYHEv/J9rd/VrIHg26esjwLiZU
	kguos6P3Fck6R7krNV9pYTWdHq3NgRrzwyfFiDRrUZD0/kE6WwlZocAm+F0NWa1w2aMqXUstj76xg
	obPc8KTlbvd3+41utS/lsnK88ahQi/ux8zx2FIMSZgspE8TNXdCRs+gpP3/eg3LLNzZ85shMWzUQl
	eoKUB2BgVPelyIUbHF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscM-00000004Ni3-30ib;
	Tue, 24 Jun 2025 01:38:34 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpHE-000000044Np-01bs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 22:04:33 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-735a87c1601so3273187a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 15:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750716270; x=1751321070; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XtLVtTxbmHrCBpSNsrNTm3SDGLbs218ttvI0elQ1Q/A=;
        b=lA8TgZ483bC6rZg30nxH65FSOwUnXAsqygjKdSYK6AkM82vBRCybCQ+/UlYznZ2pX+
         RgCuXzjvt5Q+GEyGC4XOzyfYNT0mIlRDClxPYgKQae8em/ztX3ewVjwTE+htTshbDE13
         mbgY5vvWqCI4EtgrvkjCzUC3XnxtlyS+dtmTAdi0rVePHNLftll6RpQh06G0u+A8CZU3
         nxfv2xE1Wt4x5T/e6ELLordTJXWxmCjam4cKLY2iC+1Rz+BVPxVFiVHMyUonnFH/pQFn
         sHuIUw/IUTjuYj3u1pn6Cq29BlKNSZMpcwlxk8h5axX1PvM9fiqYVh/Sz5pA8t215/vO
         IFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750716270; x=1751321070;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtLVtTxbmHrCBpSNsrNTm3SDGLbs218ttvI0elQ1Q/A=;
        b=I5GUFQZQ8hqnhk5g3YbMWenfwvyla4KuaomUNnMD/4FFged6NVWGdX5hnah0pfk6Hj
         veH4pCB496eN79dk+2/OvKR5zPt3aPxMzb9OhAaVflt85ehQF3YW9BKGOHEpq5YEm6Nm
         UWIlpOnYcQ+qaYcqAw8AyQlyDOy3+YLM3RWCDyhhwdYTG1tphWa6A4t7lMYXy/1bgj4g
         ES+tXkjgPvRZHv3fr1Wn112HWBL/j4161ZJzTcxg3ibP6+lMFW2CcuPTNw03lJ81UE0+
         yAUrrlWdqs6+20RrgGO8rIIFxrPdriuF6tLCmyPNmgKGQjmmSRj7qmOgFRfLtnalFDsR
         +uoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD1EY97OIfECQHF4VV/uMW0peRPRfJJhAHlWXlzDJCMabZ7kR556CP2RU8GLRDA55rall9J2Rz8EhkGHPsjqI2@lists.infradead.org
X-Gm-Message-State: AOJu0YyWJnkNJhmSL/lDv9TyxpZRJJOT0lZdxoMth3P1LfCiBWy5Z36+
	63n+uYmo6dJooURfYjGAvR/rHubfNIxqUL8TRQbj+/0/wlX5iq3YupFiplnhOePh1/gmMwyMBTJ
	m5/217OpD4q/2SX1gvvWaaUnR2A==
X-Google-Smtp-Source: AGHT+IFkDmfiUvq4ze8ArvjRNaiH+ZXYtlXJVVDDWXvRxwvqUxfAjNMLJj1dksngCu/MtTNVejcjEvPTGswxYjYzFQ==
X-Received: from otbbx10.prod.google.com ([2002:a05:6830:600a:b0:72b:88be:33e6])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:d8a:b0:73a:8d4d:426f with SMTP id 46e09a7af769-73acbd8e287mr1029204a34.2.1750716270304;
 Mon, 23 Jun 2025 15:04:30 -0700 (PDT)
Date: Mon, 23 Jun 2025 22:04:29 +0000
In-Reply-To: <202506212205.NmAR3sAH-lkp@intel.com> (message from kernel test
 robot on Sat, 21 Jun 2025 22:56:09 +0800)
Mime-Version: 1.0
Message-ID: <gsntjz529ksy.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 05/23] KVM: arm64: Cleanup PMU includes
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
X-CRM114-CacheID: sfid-20250623_150432_048722_D2D68CF1 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

>     drivers/perf/arm_pmuv3.c: In function 'armv8pmu_enable_event_counter':
>>> drivers/perf/arm_pmuv3.c:680:2: error: implicit declaration of  
>>> function 'kvm_set_pmu_events' [-Werror=implicit-function-declaration]
>       680 |  kvm_set_pmu_events(mask, attr);
>           |  ^~~~~~~~~~~~~~~~~~
>     drivers/perf/arm_pmuv3.c: In function 'armv8pmu_disable_event_counter':
>>> drivers/perf/arm_pmuv3.c:702:2: error: implicit declaration of  
>>> function 'kvm_clr_pmu_events' [-Werror=implicit-function-declaration]
>       702 |  kvm_clr_pmu_events(mask);
>           |  ^~~~~~~~~~~~~~~~~~
>     drivers/perf/arm_pmuv3.c: In function 'update_pmuserenr':
>>> drivers/perf/arm_pmuv3.c:757:6: error: implicit declaration of  
>>> function 'kvm_set_pmuserenr' [-Werror=implicit-function-declaration]
>       757 |  if (kvm_set_pmuserenr(val))
>           |      ^~~~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors

Looks like some dummy definitions didn't make it into a non-KVM config.

I fixed this and a similar problem I found with kvm_host_pmu_init().


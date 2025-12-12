Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762C2D59D93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 20:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IMNyF6rnk7IasEWeVI8MWH21McRpJbckeB5bd8oSwWI=; b=x3vFpfDgF8UZYM
	5SS2LinrydNAGW9YEhtdCMS9jBZG+EPeMlfwDtNItC7sg8XuNSF1kJ1FLyytnk8eMjOJswDBJyYPt
	JiiZ5QDmYTuPAlKoN9leUAl05J4d1GYsoLFaC24HlNkmm+3syx+iNTrlZib2s9jz691foFh34asfk
	I96zT3bfbfWlY50XjxDIWk7F2ea91uY2TcC6dz33UjcO3FZ1trZeHiBkT81Gmp6GDaQUk8j8xpN3a
	6ml5bfZ7k0zAl2t91Nt1UNDYOKLjtesAKw9wfD68BqH+ipfuBm1zxPxZqvAR7uDz2FcrqY/TTKMZE
	sAAOVatYlH9xa4pG3cAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9m9-000000013Gs-1ot2;
	Fri, 12 Dec 2025 20:30:05 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU9m6-000000013Fs-3e1F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 20:30:04 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-3ed1786c92cso1280533fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 12:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765571401; x=1766176201; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IMNyF6rnk7IasEWeVI8MWH21McRpJbckeB5bd8oSwWI=;
        b=nzBhNc5cPkMlMmxV9Qqsy8Ok74q0AU5JHmfXJMTNuZO4r0hmWo0YAVpFqcaDM5fT6e
         QP1fV2+NvC+VfUTU4w9WDooTUOD/ZIqo4mO262kAemjukmtWtouQkXgjwkvIWabE2K60
         fJSCf+gCtMQX5xc8XTpShIvBOsGdsud+D7wiY1ZLhBYD4Lx7gCq5E+++AsnzVNNr/69X
         cNnHskuxWC5zUTpM+H/0N+BcNKDmpnBVGpOWY0xFEvzklUOvB7l9D9fCYW4+9j/5b3Wk
         JqCuQnyFYlwGu8DJTOaj4q6YmDsYfKOL6kShCcgK5ARjlKSNrpPEWLMgZm8If4JGp7U+
         7bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765571401; x=1766176201;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IMNyF6rnk7IasEWeVI8MWH21McRpJbckeB5bd8oSwWI=;
        b=Y3gsr+v33qGxtBndFab0/4l3s8M/p41X0eewIdTeSQ0d8TrBvuzQIYFhOy1RMk7Qo8
         MtkJULDOTr4my9wUGtHD+V066iMEiaIf+joIF/w3lgw/jAE6MyH/n2ClK4QXptYykYxU
         T+fwyeR55UQVQtwVaU1I+/fRp6j4ttc06R3fatyGv+BkKKlRmRDTX61UuwACCBQWnLJ9
         qT9EKDHsLb8UeDZaFnIQeOOm8qn0/N1wzApBjwgYEKyxzmn7NSt0ZIuuKXyoT4LsGC9k
         AtHeZkNpfq53+o5E9mTIzlBWtiFbCBH943Md6L2ou2C/+/quQW7QQGAfUMTfU2/cv9W0
         J0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD4NI5Ix9lUGBtkkxg+3I3A+nBFb0iLeosRVtRSslZvnt3rofyH1rSRMWqvoTeSnhEG6sUakyCIE97SIpMIM1J@lists.infradead.org
X-Gm-Message-State: AOJu0YxY8x956ihbvCbD/iFe1QDcbvWzBbNXMz7u+wrBVOtylXvScP0Z
	XRjb7CCZulJ3jCHFZ4UHDPnGiZMa65PuRiMjnkzw1ncpCcsXLWFn1jxCjSdDpTiYhoOcO/q+jen
	/Vfm/gPizsw0ka968QX1R/JyWVw==
X-Google-Smtp-Source: AGHT+IHCc2P1hnQfNfNIerRNuvTcLdQFAWD/TzzhCNvUPfhQTb3KYPRTL0VnqSzv7pNym78BlH1sW72DFgyhEDe6qA==
X-Received: from ilbbn5.prod.google.com ([2002:a05:6e02:3385:b0:438:15d1:5e1c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:178c:b0:659:9a49:90bf with SMTP id 006d021491bc7-65b451e95f7mr1599664eaf.62.1765571400768;
 Fri, 12 Dec 2025 12:30:00 -0800 (PST)
Date: Fri, 12 Dec 2025 20:29:59 +0000
In-Reply-To: <202512110439.UXwb1Qh4-lkp@intel.com> (message from kernel test
 robot on Thu, 11 Dec 2025 04:21:58 +0800)
Mime-Version: 1.0
Message-ID: <gsnt1pkz4f5k.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 09/24] perf: arm_pmuv3: Keep out of guest counter partition
From: Colton Lewis <coltonlewis@google.com>
To: kernel test robot <lkp@intel.com>
Cc: kvm@vger.kernel.org, oe-kbuild-all@lists.linux.dev, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, skhan@linuxfoundation.org, 
	gankulkarni@os.amperecomputing.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_123002_910757_E72BA3AA 
X-CRM114-Status: GOOD (  12.47  )
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

> kernel test robot noticed the following build warnings:

> [auto build test WARNING on ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d]

> url:     
> https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20251210-055309
> base:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
> patch link:     
> https://lore.kernel.org/r/20251209205121.1871534-10-coltonlewis%40google.com
> patch subject: [PATCH v5 09/24] perf: arm_pmuv3: Keep out of guest  
> counter partition
> config: arm64-defconfig  
> (https://download.01.org/0day-ci/archive/20251211/202512110439.UXwb1Qh4-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build):  
> (https://download.01.org/0day-ci/archive/20251211/202512110439.UXwb1Qh4-lkp@intel.com/reproduce)

> If you fix the issue in a separate patch/commit (i.e. not just a new  
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:  
> https://lore.kernel.org/oe-kbuild-all/202512110439.UXwb1Qh4-lkp@intel.com/

> All warnings (new ones prefixed by >>):

>>> Warning: arch/arm64/kvm/pmu-direct.c:75 function parameter 'pmu' not  
>>> described in 'kvm_pmu_guest_counter_mask'

Just a missing argument description in the comment. Fixed


> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


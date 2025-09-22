Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA516CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqTj3W7IZ9HZZBW9wKpYWsYyOAxKSEoa6COxIZsKaeQ=; b=M9hDocsCUQrMnmBQ4FYCZYUAN2
	LCKM8R6pyGYklfwVE5+eLgF0K5u8FkUpdr1TNCFM8Zu0eC2MdVr1UFVw/V1+Ik296W841OREQpYeO
	pDDMiXnrv9NxA6G8uQ8/o9nWY7SkwlUfngIRfif6CEdcvWkOrsveegblOJ93U9TcSABuNSXuEAYcI
	3ZCDbVs7dkbRxzmEZ4D2rIilfNAfdfm5qgjkDTBf3MRpSFOLFKi7xKbuiU8SqrC13jKHJjLUF/p1T
	9n9IKvkOzxlK+umVyDmBIU7jbd9CH2aYsP1gX1rOUW5K4kwicXCF/u6gjTvLzvk+JtO0oAHrDz+y0
	9nXHg9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0boc-00000009g4n-3E6t;
	Mon, 22 Sep 2025 08:22:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0boa-00000009g3o-2dxQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 08:22:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46d72711971so28015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758529346; x=1759134146; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gqTj3W7IZ9HZZBW9wKpYWsYyOAxKSEoa6COxIZsKaeQ=;
        b=i+odVXJ8BwSFrhDdMSxAX/HxBMn1b+rJsp4ot2jHhczEzSag4eWpjWX7xn0iHJ4T0L
         ujauCNClqbpBRjCCA7NeRvHzi55GR4Dm0t9dL23UyQrYHN831SNhAazYHGbJu4XMY3BY
         G2ft3fM5OZWKxHwCaVM/tBI3HaId3PAlycoDeDfJf17GMj6a779664Omwo6Q1YHjv9KM
         +NQa5nKeJMEhkdUAT61A2X8dy+ODuuUICIwobDByyn+1Fh04eeo0EwdJVKmdyt2g9TsH
         Y2EcjhNVMJWVOccukSWd0oqeVpPzfyxcPmU6GgF4Y94ZbG4WFPW9Ulz7KAMPHxam9Upu
         kstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758529346; x=1759134146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqTj3W7IZ9HZZBW9wKpYWsYyOAxKSEoa6COxIZsKaeQ=;
        b=ZGwjbPeH71q1OY/XPyApubfPmg9gU0gjWXSyHM7Qvtwsh7uJa2B8GnsYy6KYI8BJu4
         SBj5Zn7VWBck8zm7VPruufEA+N2cdjbhWoTdzvgszfzMf15OT1C+9wXZrvDVO56ElibB
         UUnwQPNOOhIyjHs2Dnxn5FTO9XaEuFQfySz31oIq5edjxrz7muo2cNao5oU6blHbWXnw
         YajOsLghrG9MlazNy5tgtx6R8GViSRYFTlD+L5KAj5syJ+JVta39fhqJbN3QMQwW+8PU
         1u7e1HHAkrktbu2kc90fPmNiC3wxxHnh19cfHbMnKbBk46vvfsk1TGxQc9HuqqiwDR1M
         Cffw==
X-Forwarded-Encrypted: i=1; AJvYcCX+avDyTiUbb5jWS9wRz9L1VnyADxVbcyHYwpigm+b3qxvLNyhQQrPwhAgQFzZho+w7ovUMGyFasB72ToPFyTZE@lists.infradead.org
X-Gm-Message-State: AOJu0YzAgmG3jSo36Y4R1cq+NIZGGMXxCftBDmx2CO49yiv2goBVyRA6
	JZwyTlOffZjKSVO30aDPVrdD5Akldq6y72UIY8dxDpUYpXsEMfon1/85Kn0BFR59c2KSW4Z8h60
	M1K9afg==
X-Gm-Gg: ASbGncs2Fu5TIyV6zo2hCNXjLHHrpFwVxm+ZjcGjlpRg50SXtBkaI6BNUb/hEl2PPQD
	kRnhVKTgX2cj8fe9QhBBkTvI9mtvDQa44u2JcYXcH0rIs2Wn/0ayBw5ete/79eyftOLr5CWOQ/i
	x0al8eNU5z0e7TOE+h2muLcwnGumEovFlFgHlrfRdUTMhFAVQ8h1sxBszrlKD+rnGnmWUf7lhk9
	nY/93rPvNwhzlERlta7XKIj6dyjwVBXNQMhdRsnWPGlpTgOcl/mv4kvOs/vPB4TqMad+FFJYjYU
	bckgweQQm3ZXcVpk8Uzm2oKY4WEVHBYhsWBwx2cMR5MCoiLy6jStpr+Ezl5EdgeGVCtFYkpztch
	f5J901wE+9kJQG1jfX+Y20jHIyvQf2WUvi9WOJtLb7XsW8vhe9yPpH++NagJCeMc=
X-Google-Smtp-Source: AGHT+IHFYkFn8z+GUWkNUAawcZ1YV51AhOshm97PW4qM3AjxsaLYtJ0SsbO2jweyVtrKw2JD5LyFpA==
X-Received: by 2002:a05:600c:4251:b0:46e:251:b1c2 with SMTP id 5b1f17b1804b1-46e0251b2b1mr355875e9.7.1758529345943;
        Mon, 22 Sep 2025 01:22:25 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee1095489asm18071631f8f.24.2025.09.22.01.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:22:25 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:22:22 +0000
From: Mostafa Saleh <smostafa@google.com>
To: kernel test robot <lkp@intel.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	robin.murphy@arm.com, will@kernel.org, joro@8bytes.org,
	jgg@ziepe.ca, praan@google.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <aNEHPo16_HgyYafz@google.com>
References: <20250919133316.2741279-5-smostafa@google.com>
 <202509201819.f369wBHc-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509201819.f369wBHc-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_012228_684995_975E0C10 
X-CRM114-Status: GOOD (  18.76  )
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

On Sat, Sep 20, 2025 at 06:42:59PM +0800, kernel test robot wrote:
> Hi Mostafa,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on soc/for-next]
> [also build test ERROR on linus/master v6.17-rc6 next-20250919]
> [cannot apply to joro-iommu/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Mostafa-Saleh/iommu-io-pgtable-arm-Simplify-error-prints-for-selftests/20250919-213912
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> patch link:    https://lore.kernel.org/r/20250919133316.2741279-5-smostafa%40google.com
> patch subject: [PATCH v3 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
> config: i386-randconfig-013-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201819.f369wBHc-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201819.f369wBHc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509201819.f369wBHc-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> WARNING: modpost: drivers/iommu/io-pgtable-arm-selftests: section mismatch in reference: arm_lpae_run_tests+0x100 (section: .text) -> arm_lpae_dump_ops (section: .init.text)
> >> ERROR: modpost: "alloc_io_pgtable_ops" [drivers/iommu/io-pgtable-arm-selftests.ko] undefined!
> >> ERROR: modpost: "free_io_pgtable_ops" [drivers/iommu/io-pgtable-arm-selftests.ko] undefined!
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>    Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]
>    Selected by [m]:
>    - IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST [=m] && IOMMU_SUPPORT [=y] && KUNIT [=m]
> 

There are 2 issues here:
- I missed one __init for dump_ops
- Then new kconfig change to select IOMMU_IO_PGTABLE_LPAE broke build for
  some ARM targets which select GENERIC_ATOMIC64

I will send a new version shortly

Thanks,
Mostafa

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


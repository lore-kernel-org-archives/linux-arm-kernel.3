Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60997CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 19:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zewo0mhIoTcxNO/9A7yjzXwrm/KIOI+nyjxjOFoxQhU=; b=O270/0ngK+oS0y2C/8P/sHCyJb
	Gv3ffx0aineKi7bwsqfC38d+Vs10dv2xf853ixw+tjlEM1hFjmrVSeNHcsT8Wk/NEnT//dEK+kQjG
	mgu5hjnoN9SHWzN4jX1Nh6rIicDHrrVP4rm7kzw4nWrbQIFJrIyzI3lPffOlnvnawkKUsFn/hncjd
	gc65AfW12q6AgC3RxhdMln52HzMt/X2sf9lLfHw0InyPbzT7Mmxz3T2xgqcj3i6TjDxxXhw6TqUfF
	r082Of5JvAxq0zHioyuEhG94SD9zV2G32uikr/VA9PBy1htxgICYi1/it/WG2qk/MzgIESYkKU8Wt
	MVF2/IRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18n0-0000000Eg7U-0mZy;
	Tue, 23 Sep 2025 19:35:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18mx-0000000Eg63-2cCG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 19:35:00 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2699ed6d473so45975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758656099; x=1759260899; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zewo0mhIoTcxNO/9A7yjzXwrm/KIOI+nyjxjOFoxQhU=;
        b=S2NwYFzYelaOoZFylGDE7kTP0JGxRgV3JR7mdSJFHY7sj+i88inAwTZP9bZscAST4d
         mohWyewAM/q9szDP9OvM/c8nGkWExDAxYXDUoxGGhPHVX6Q+gZPvELvQHmedh+T3kS2O
         KMiTck9lMfcMPG/HtUL+oF5IncUbJuMz8Pswxpga4Mf/yLnuI1EAa/OdpCLxyB9+h4dw
         aQeGXjeFumFH/DiG1/2b0YkYtiJsp8eX/E1hEFaJMRASHeAqDjglK0ztUkKfZpZ5N2GF
         Xyf7+hly9is98bF5+Cf01VFlH+/x9uCdr/dtcl4P3J8yeR4w/UGq4U/EjOg1lXwJm1B5
         mx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656099; x=1759260899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zewo0mhIoTcxNO/9A7yjzXwrm/KIOI+nyjxjOFoxQhU=;
        b=KrimtNSIG7C5uCyc1HoCXttidCP+rn+GoQdfCxt0jg6N2Bntv4rRgyZur3HqtX73vW
         MTDlyhIC7ealL+Mb2k+lnjaSjs88ak9WhQxU+8udZWpHuszpxcMMlG8jgpqAgg8B2RlQ
         D4/Mdxr9w9dFNuIQvw4+zfyBp2uCpkZBsOXYNE488CbDvhtdSgHHYNqs2rL3P5yrhwiC
         xXwt+nF6a5nMyGC++tv9YjoRfej7snIkHT0qMm6QEueS33CDD6GtfTixw9E02Ikyy9Jd
         2iFoi+yjYtzHr9WTdEAeEEkJXPtzotEPBwsAJH0M7LyrEX2/rIZCwx9+maD6xsVZYTQG
         f8nw==
X-Forwarded-Encrypted: i=1; AJvYcCWgrBYfk38voK5QUEf8sqbQB+FmwyFfF6KUnTDSlyzow1Iilx67KyVf7p60uqnBFhguVAYTBlrNIT+ben/nOpW+@lists.infradead.org
X-Gm-Message-State: AOJu0YyLRn5/xeoP3W2exiosmlnyRVWzQ0Hm2x2TBaW2mHjuWgvOgGFj
	28wvmoCWp4em2ByXXMxCOHitKblmQA5KyJw0TT+EpYw5nv2MOfyaj23sPhWy/WhK9A==
X-Gm-Gg: ASbGnctIQ9ebWYVL4J3GLdJYdI6E6mTzB0sgYasmdFkXGFIOTz8Xw5j6FDYQ8yvtaT0
	ql9LbqK6gE12i/W5wSmlaAyzPIlxuu/OCOWT7yxzUjf3sd0GAIDxJQgOmrJcS98/nlgFm6aaRVk
	8a0RrrNddJylNqQ8PcVS2t3BPUGy0AWBsqNpo8PK6ToVY2FEPq+ltGdzk8oSSUZdc1Us343IL33
	yfZmdJ0YbBBl2AYpY8TdYT9N/L/6bBCk31E9liBbYaCO2Q97VbSBXTMRo2psZ5dKLQ5eeB60fUh
	tKcjso5AAm5QYvL7ZTsNAZOsUhOe2OgSqF51N0O3jX0E8ppJPONpzL2uvfcgHMqJyck3WPNJxf7
	cev9e79Odt0p3pIfkS95J0/h8xO6b54QTMuba29g/EDf82lhz39bnyW7uGwCXjbQ=
X-Google-Smtp-Source: AGHT+IGcLnWCz9d4nYxuf65Ty9MkZA/5wp1lFrLjgKZSwPv3qhQduS9rYWSQL1OpaLq3vwTFgQJI9A==
X-Received: by 2002:a17:902:da90:b0:26d:72f8:8cfa with SMTP id d9443c01a7336-27ebf19022amr701305ad.13.1758656098489;
        Tue, 23 Sep 2025 12:34:58 -0700 (PDT)
Received: from google.com (23.178.142.34.bc.googleusercontent.com. [34.142.178.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033c2e1sm170372665ad.128.2025.09.23.12.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:34:57 -0700 (PDT)
Date: Tue, 23 Sep 2025 19:34:52 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, jgg@ziepe.ca, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <aNL2XFd4Mb_dvaMy@google.com>
References: <20250922090003.686704-1-smostafa@google.com>
 <20250922090003.686704-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922090003.686704-5-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_123459_680213_D2B0928B 
X-CRM114-Status: GOOD (  19.90  )
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

On Mon, Sep 22, 2025 at 08:59:28AM +0000, Mostafa Saleh wrote:
> Integrate the selftests as part of kunit.
> 
> Now instead of the test only being run at boot, it can run:
> 
> - With CONFIG_IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST=y
>   It will automatically run at boot as before.
> 
> - Otherwise with CONFIG_IOMMU_IO_PGTABLE_KUNIT_TEST=m:
>   1) on module load:
>      Once the module load the self test will run
>      # modprobe io-pgtable-arm-selftests
> 
>   2) debugfs
>      With CONFIG_KUNIT_DEBUGFS=y You can run the test with
>      # echo 1 > /sys/kernel/debug/kunit/io-pgtable-arm-test/run
> 
>   3) Using kunit.py
>      You can also use the helper script which uses Qemu in the background
> 
>      # ./tools/testing/kunit/kunit.py run --build_dir build_kunit_arm64 --arch arm64 \
>        --make_options LLVM=1 --kunitconfig ./kunit/kunitconfig
>       [18:01:09] ============= io-pgtable-arm-test (1 subtest) ==============
>       [18:01:09] [PASSED] arm_lpae_do_selftests
>       [18:01:09] =============== [PASSED] io-pgtable-arm-test ===============
>       [18:01:09] ============================================================
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/Kconfig                    | 11 ++--
>  drivers/iommu/Makefile                   |  2 +-
>  drivers/iommu/io-pgtable-arm-selftests.c | 82 +++++++++++++-----------
>  3 files changed, 51 insertions(+), 44 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Moving the io-pgtable selftests out of the main driver code and
the integration with the KUnit framework looks good to me.

I was able to apply, build and test the series with multiple configs on
QEMU virt. 

   # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010000, IAS 40 OAS 44
   # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010000, IAS 42 OAS 44
   # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010000, IAS 44 OAS 44
   # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010000, IAS 32 OAS 48
   # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010000, IAS 36 OAS 48
   # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010000, IAS 40 OAS 48
   # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010000, IAS 42 OAS 48
   # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010000, IAS 44 OAS 48
   # arm_lpae_do_selftests: selftest: pgsize_bitmap 0x20010000, IAS 48 OAS 48
   # arm_lpae_do_selftests: selftest: completed with 63 PASS 0 FAIL
   ok 1 arm_lpae_do_selftests
 ok 1 io-pgtable-arm-test

Thanks,
Praan


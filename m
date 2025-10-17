Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BECCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cm/Xe7cjynibkOQ6Px4QnhuGS+eC9ZhGU5GEHOrppAM=; b=ypZnO83utLZCCvrnLLU/YKvgxW
	NLVko+mZMeMOK4okeOKkOBqzKQd+T3o7bmyd59UlpIHxNL+qZXGCPD0XMF8p8FpbUH/GHDcingJAi
	ZBjP6yAqMftpuxcFv1ORDtQ56fuuE5Z/+dfRaNHhBocOlB4nWcCgC3Fxqr5FIuxsUqnvEz2ttJRJK
	U+sXMojgfgCKg0V5+25x6TaxEQTIYm3XcZHMj+0FwNS0Kw1h/r0ba1HGzyCeh59vmIoU6lToXMIGO
	a5lUiCsE7EbzNGqorQhKy7aBH2Ooki7NU2RzCHxbu1qdn4N0D7OTk7ZcrDDrgV5CaN0oteeql/cHg
	xD+o4Dbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ok7-00000008dgc-0gmv;
	Fri, 17 Oct 2025 17:59:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ok4-00000008dgH-2Lzx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:59:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-471005e2ba9so5205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 10:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760723991; x=1761328791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cm/Xe7cjynibkOQ6Px4QnhuGS+eC9ZhGU5GEHOrppAM=;
        b=t3dMw8+CVupQEtmraxY70KqcMdDiJJFnXRwf4i+C/rKwb5Wq72cO2ooucL0KXEbn6O
         7qtN2w3NlhEdQVzxY1qPghBaQkYmhxk9953BmXLd3UsllFODg7S7HmoRLog/MVwRpkqZ
         g9s8YmA0UzkPpMRaOrXaP9g8oXNQ5g+T34hTZYXgHQDriprizpexKi5J+rSsoXtMl4ok
         3q1AqfQXlCMo+KMkQoBi4tQXz/7isUjC9tdgXlmLyKxErsTSHI1XpArOTzD82BouGLPr
         u+0HR4OTwlpx6YG2uw61ul61necEs9BOadMxZ9pye8t/Z1lJhbl0f45TuiwzHW7BUJP+
         UqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760723991; x=1761328791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cm/Xe7cjynibkOQ6Px4QnhuGS+eC9ZhGU5GEHOrppAM=;
        b=B3p21H1yEjGHH/1ZDBdZpE6SOyBEFoob1k21y/Q2ICyDPTxXM3jFuWPIKiBdnG6gM6
         UFIOObOE4ApVUZEtRIKRNOPoGAf0U8w4kb0+2vMm+yyxVFwdnAs+xde+bW7JlmdHWkCY
         Y6XUDBrA1eaqNCjzn5+14BiNlbkzQ83uPvs+jIz4jrwfN4K6dkDgl9knBp4qzDrSEIs7
         3ea3NzZx4rGAmd7aEYxkBqmP8Z5vHb62qtwxA3DRjPZ/DsZ3aCbcMBmKOwT0cyZNhwTj
         ENqNm/NwyRIVZGkRWuS2RubkxUw002daFYDZYTe9/XEAiO4IFG1G0ETNT0RSyWPrY3HJ
         c9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmS/4F1ZAOCLfleus9oz4ehXBuoX1bHhzF/o6Ycky3htCtWfsXudPsNW4PfGdpsOgPyl5j2x5oYDv/u/7aWZZT@lists.infradead.org
X-Gm-Message-State: AOJu0YyY203fQouSbzaM4GtPudM6QwIoOUDehIrsoJYlcVqgY0Q2Ndmm
	0ahleyUcrQIQUULRYSKX1SglIf1JXNaj5USSoMK9UXAsZ/YUsX4XIbGEFK5dyBINuw==
X-Gm-Gg: ASbGncvpCpf7Yzdv5Ki8vG6PGhpxcC6f6osGpILnT7nOVTSyhHJdtO5fv9Ts2hL7wUa
	CWgOiUgT04R8GE2zfxzof/nPvj9U0UYwaBWgkJmvgkBM0YYz0jR5VUdhXn9TnB09N9kj3AfZiXk
	CzN7D7ToJZSNFkKjd8Jxo1PDxM+fCphpAlFNzfMKEBWAgHI6fz/Ny6s/vl3VPx+t+fxla2P+xj7
	gBJpcS/h9Lm2JWzv/Xl1oiHqiULliRQgev4JamnFGRzlrkwZXRqjZ1QKb+IqrqKhZ40vKtDMxiz
	3z71dY0zfvTsukwqGZW0dWTHdW+yElA+9hz+SmBfoMkx4QLOnhwmpbPgiaU4aVS09U0nRlRWyCJ
	xlZoxdFrRHj9kJZZMJSvRVB0aGR8ax5TTiH0mi0XkZLxXs9P+M/F3y0xKZm5pgNO0vvkGwP6Ss5
	CnWPdE5SmIM2xLbyHt2RmOPU11scvd+2xsRTExCQ==
X-Google-Smtp-Source: AGHT+IE8/FXhVVJrozgI0Wh8A6TqTcaQumti7JajkJKRLGU4JC0DDWkhAHhYmkS9bQHIRIjtvr95Fw==
X-Received: by 2002:a05:600c:4797:b0:46e:1b09:1cda with SMTP id 5b1f17b1804b1-470ff2e9434mr4517485e9.5.1760723990610;
        Fri, 17 Oct 2025 10:59:50 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b988dsm420433f8f.35.2025.10.17.10.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:59:49 -0700 (PDT)
Date: Fri, 17 Oct 2025 17:59:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v5 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <aPKEEuCYbbJbN9Cr@google.com>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-5-smostafa@google.com>
 <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com>
 <aO9vI1aEhnyZx1PL@google.com>
 <b48193a4-a37b-41ba-b4ba-8b5c67d812bd@arm.com>
 <20251015151002.GH3938986@ziepe.ca>
 <73a1d5d0-8077-450c-a38f-c1b027088258@arm.com>
 <20251016172524.GN3938986@ziepe.ca>
 <aPI-8YfqC83QlltH@google.com>
 <20251017141312.GP3938986@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017141312.GP3938986@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_105952_664614_13B1B1EB 
X-CRM114-Status: GOOD (  17.20  )
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

On Fri, Oct 17, 2025 at 11:13:12AM -0300, Jason Gunthorpe wrote:
> On Fri, Oct 17, 2025 at 01:04:49PM +0000, Mostafa Saleh wrote:
> 
> > Is simple enough and verbose and can distinguished from test failures,
> > it will look like:
> > [    2.095812]     ok 1 arm_lpae_do_selftests # SKIP Failed to allocated device!
>                    ^^^^^
> 
> The test "passed" though, and since we never expect this failure it
> seems wrong to make it pass.
> 
> I think there is no point in distinguishing "infrastructure" from
> anything else. Either the test runs to completion and does everything,
> or it fails.
> 
> The use of skip is for things where we probe something and detect we
> can't run the test. Like maybe you have a test that relies on
> PAGE_SIZE=4096, or CONFIG_XX so skip other systems.
> 
> While, "I hit an OOM so I skip the test" seems wrong to me. Maybe the
> OOM was caused by the "unit under test" leaking memory??

I see, both are fine with me, it seems the kunit maintainer is more
inclined twords the failure approach [1].

So, I can keep the test failing, is it OK Robin?

[1] https://lore.kernel.org/all/CABVgOS=NfRcXYzJVMMKqeXP8SyTewffwb7vdGN1D8esO2f0KOA@mail.gmail.com/

Thanks,
Mostafa

> 
> Jason


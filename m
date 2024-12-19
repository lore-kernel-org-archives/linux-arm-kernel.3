Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B277E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaFUYqfbJ0FVFTC0Qejf2fBra+Am279oXsL2ycAM8YU=; b=I5RUztsvTVtKD9ZoFTVz/OdTWv
	gzODFkjYUy0RvMBRadkGVBwgy6N0dEhB2mYaC46kYZjvIch3SGIdRYGJxFMjeX+UBLlQWA/HqLhVy
	7ciPzOATt5QIcTDx2bRdxkSlOiII4KeWio5evM36WW8qFbGQSso4fzjmzxCBhHc9Kgz1GpjvaES0t
	cOU/LayHD80FioXtERlKNkt/6xg3h47Rs/Bb49TlnNGp/wMgju4f1gSFS++ceH4RM9jKYJkU00XMS
	Ba9suh+Q8rKY4w+SQvcimMTN0GdHpwCUiu9x9ro1lZb4891kLP1PhDuN9Pp+OJeUCccFL/kvdH+SZ
	YQc1Czlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEa9-00000001eDj-3rcn;
	Thu, 19 Dec 2024 11:20:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEZ3-00000001e14-3OFC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 11:19:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso48625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 03:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734607171; x=1735211971; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DaFUYqfbJ0FVFTC0Qejf2fBra+Am279oXsL2ycAM8YU=;
        b=YJ/WuoNCYkzaWDBsXqCFcnZKeRNFG5A8ROOpYmLkQY3225TaLFXAFy8Qgq/BWyw6VF
         msWWHCg1ij4f6HDy8GmelcrLOlK9VpH29Tzy4rTAEKd7C2ZKVOOq6mADboXKyqG/7TwH
         WuIyQnqQ4b9FqEuF10JovioH9YuiNHcx+IrJRRoIwqK7SHNWkqvMjCEkQTtCpp2r7USq
         dgbWopmLmUQsxgMpYkm3a+0nw6ML3pghCNe1wJOeAqGJCEk45SHCwC0DEWjQE+aeD/CS
         ZlKNUmrlUVtBnpcJ2+CDrxDsQZOIN8Zi1iSWrrxWjg/1Qc5b//YJV1VYQpgiwlpUFv8t
         sh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734607171; x=1735211971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaFUYqfbJ0FVFTC0Qejf2fBra+Am279oXsL2ycAM8YU=;
        b=MoUV9lMKJNmi8YZmUBYNgwl+12ErmU+x4CxznTjKESrpXaYeVXjRdWqPdJZKcbAsc5
         H66ID7bvp/92wITGOofcimC4hKn0B76pJx7OlhlYNzd8fCUXlzmQTob8abmbzmzUyZVz
         xZiFIhfON7e4HaY54HfPi8vQR4TDBiQ/Pfk1W8jDeJO/OJQTzlecuh/5KkUJddCMAIT2
         0xETkkl4gzOplJcs6EswZADq8Ui72E078kOsyowlns9Wa30JP9JWqRTT9mq+zz7itlcG
         0UCVYN9GPWayzLqwBhLLdagawqDmolPvSTDdheDD+QF8dGZNkOx7OSeU24BW7qVpXw//
         9ZPw==
X-Forwarded-Encrypted: i=1; AJvYcCVH2ePajPKcY/cdlE0hdfx0dXeW12jZkZyDGi+I9YYwYx6L9byzN6aCDoqTtixofEeRUwf3doaJMl8jJDBao1ad@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1g81gpoFg4qXKgHXHEDSuONr1cI68UaMIdncFY7mX7dG+/Dlc
	sK7NHnnRWrmnG3l/hxiaUal7k4cQrv4UXUxuadP5hze2pwcTcUBkcWyMECKyXA==
X-Gm-Gg: ASbGncvmwITo4YUsRhl4f6BgRtLiIOMllu6iNYpMxPl4jyPRdRhRa26ZexUCGH4sZRt
	1zoN9gkRy+4w7mw4h54gjP9g0s+zXXIgrj9hrM5QJ1uZcX8TvOcPm6TPSLXTTUSAgDOd1Hsbzf8
	/0qLeaSgD0Caj/D4k+/t3CRe4rDmh2sHPWINSt6qcWEPCQOlKGvKBl3dnXh8TgO97onyLWJ5WUK
	HNwf6LSYERNLIjP2HXawFZSu3Q4c9LMa8ORzeyOMLGygaqXi3VZjZVoi6LxgvPxya7yRsImOnF0
	FCCK7kgjX2NV7z6V9T8=
X-Google-Smtp-Source: AGHT+IGXfoawYuXIuMfIIDaYD8hngDHiUTctYslUp+cxCbwWzZSbONX4t2aPmw9QcUFfEenJ6bez4w==
X-Received: by 2002:a05:600c:3590:b0:434:9fac:3408 with SMTP id 5b1f17b1804b1-4365e5dd70dmr1072565e9.2.1734607171199;
        Thu, 19 Dec 2024 03:19:31 -0800 (PST)
Received: from google.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6cb1sm1345355f8f.89.2024.12.19.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:19:30 -0800 (PST)
Date: Thu, 19 Dec 2024 11:19:26 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Quentin Perret <qperret@google.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, vdonnefort@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 21/58] KVM: arm64: pkvm: Add
 __pkvm_host_add_remove_page()
Message-ID: <Z2QBPtRvnB3PGvMG@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-22-smostafa@google.com>
 <Z2P_H4eahmrvhkIl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2P_H4eahmrvhkIl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_031933_849139_86E6CDE0 
X-CRM114-Status: GOOD (  16.10  )
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

On Thu, Dec 19, 2024 at 11:10:23AM +0000, Quentin Perret wrote:
> On Thursday 12 Dec 2024 at 18:03:45 (+0000), Mostafa Saleh wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > +/*
> > + * Temporarily unmap a page from the host stage-2, if @remove is true, or put it
> > + * back. After restoring the ownership to host, the page will be lazy-mapped.
> > + */
> > +int __pkvm_host_add_remove_page(u64 pfn, bool remove)
> > +{
> > +	int ret;
> > +	u64 host_addr = hyp_pfn_to_phys(pfn);
> > +	u8 owner = remove ? PKVM_ID_HYP : PKVM_ID_HOST;
> > +
> > +	host_lock_component();
> > +	ret = host_stage2_set_owner_locked(host_addr, PAGE_SIZE, owner);
> 
> Any reason why this can't be expressed using __pkvm_host_donate_hyp()
> and __pkvm_hyp_donate_host()?

That makes more sense, I will fix it.
> 
> This doesn't check any state, so it feels like a dangerous primitive to
> have. Is the issue the overhead of mapping/unmapping into EL2 stage-1?


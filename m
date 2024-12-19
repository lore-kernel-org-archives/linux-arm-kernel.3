Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4960E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5b9H3Sr5EYFy0j2cHR9n5SDx5jRbjOaoGMUJe0iL/U=; b=n6tvzNOZoUoetrwYgijXGIciNI
	1LxXExu5Oc8NJbg9gg61EknGZk/cRaHe/cx6E/vSbLoIQp8y/4zkzeNFJhGegKvvLvC/tsyNz8tI6
	9lpNCk2KqrRT26Cme+lqOUDq+m06qZ6TWK72f9dkhxYa77vTsUEbA/EPeODSkPU9ywUGrofTWc1f9
	85BKtOKGgIhWzL+x5hKT+IXTj8iYdK+4g7zk8Vpv8RN9LL61Cp1PUUdMx7VFZ8Yh2ZmE50h9WdLfn
	AhxwauSi9dHQD9ccoQ5TmU0svCc8TYGCrJbwy3ZuD0nVO9pAWiSAf710K/Z+82YrJGAtsfGebJAnB
	HEX+PVIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOERu-00000001cxw-0GJ2;
	Thu, 19 Dec 2024 11:12:10 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEQG-00000001clt-2xUH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 11:10:29 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa689a37dd4so131486066b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 03:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734606627; x=1735211427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d5b9H3Sr5EYFy0j2cHR9n5SDx5jRbjOaoGMUJe0iL/U=;
        b=xdTuobBoNJCig6mtm/WXOQ+g/HP4J+2c1KPxcDmc81fl6EvVLBNN6apRmIyacSX/Gz
         +48HVpupzgCvExOo5MyandAH34TAFSQ0fBfWL2606BVk4pP/8gy5k8akwXyEGhqZZxjg
         GeQ6Gi/pFxA4QYgPN+jfy7+Q+yG4BFw2IuQTfgZdsjBmi89isS0rUlNSSpH2ii25i3Dt
         1567TcRwWxuOdFz/bLlHgyJ0dQvbzWy7V7m/kygw2fKgM0aGb+8OrFSpS8hD6fk65d3N
         K0RQhJ59DSWCdK8WjR+AfEgxyy7BcQdd3A/vWMNd7BgqZ5EdK404vsOEXUSFXl25lATt
         hfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734606627; x=1735211427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5b9H3Sr5EYFy0j2cHR9n5SDx5jRbjOaoGMUJe0iL/U=;
        b=QBFAlMcXlHDas7khhL/yz50TNIaRYQaod2wReLCLJerU9iW3I4OkQGfGc6CQTE/de6
         Cf/Xi63Q2WFW5GOXHrjQo+MO/aKfysxbugVy7mLbSiW0PLRHiF60fZVkVH45rXNp2KBF
         Ax/p3Hy7rUqhcJZjhmoElo8d7jzngHaxVG1lmK4BVIfSnoXMjzybjkkTSjzOAPvgdaX6
         ThqhivQrccwJFAS99X2ijbUmdemgmIvjcOP5AqV7bhoJNeUPsJuahMfslnbPIXh9iKHq
         ig+jwkIEycNXnu77r7J41NBgvkKMXQOKckj0ClxbWEpmytQu1M9zGqr9NE0iZp2Aa3Gu
         lmKA==
X-Forwarded-Encrypted: i=1; AJvYcCWW1CLJWmyz1j3eqUdy77K7zj+dj6/Bs3nDPhaxdOVFsY2i3SLFMNM/RaVQ9Ynl+LspLd9UrJoTlFuCZXXRBI/0@lists.infradead.org
X-Gm-Message-State: AOJu0YzjqwOPcbUtqJMCqRElKxcJ4ZOTvOw1+H4olJwTxchyhAPK0QRY
	2UkzUnVH+6We+gmpFfaN9jwwiPBdnWngBJ3m7qQ1OEuAzHP0R+u0wkQVvY00+g==
X-Gm-Gg: ASbGncu1LMjMk0+N7pTm9btXbGlVs7SC1Hydgr8s8Z41klzF2sI+ES3YdbHdWdEmwgT
	yTJ2tQzpz6K1yiPipOeiRaBP2Nm7Vmz5jaCGo+2HDmcHhVs6ZkRkuHTz+n7GxLgsfGTNUrJ2l3y
	cgvhvTpda2CPO1gCYGuybDsOpL+nsWcOcwbFxnsEkYGIw6hXYK7R6Z2XWnUsA3o2b2c1MgqWKI8
	hfYP8a2E7RvVW4mK2o8r+Pnk7o1AChOyldRhNHwWOBZyxmvgHggNSd9O9wmiulZ+ZAIM5gQ72XW
	HzjviWJwWKuARuA=
X-Google-Smtp-Source: AGHT+IG1QUopT3Ag0ASkVgubCSavXZGnEyoaVH9YZtChHHKZ/cqx6LkSAMoHjTC7eHCXPYeU1uUf5Q==
X-Received: by 2002:a17:907:7da0:b0:aa6:8d51:8fdb with SMTP id a640c23a62f3a-aac079029cdmr282978566b.19.1734606626623;
        Thu, 19 Dec 2024 03:10:26 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894f7fsm54124966b.46.2024.12.19.03.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:10:26 -0800 (PST)
Date: Thu, 19 Dec 2024 11:10:23 +0000
From: Quentin Perret <qperret@google.com>
To: Mostafa Saleh <smostafa@google.com>
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
Message-ID: <Z2P_H4eahmrvhkIl@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-22-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212180423.1578358-22-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_031028_741138_D7BFFB5F 
X-CRM114-Status: GOOD (  12.13  )
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

On Thursday 12 Dec 2024 at 18:03:45 (+0000), Mostafa Saleh wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> +/*
> + * Temporarily unmap a page from the host stage-2, if @remove is true, or put it
> + * back. After restoring the ownership to host, the page will be lazy-mapped.
> + */
> +int __pkvm_host_add_remove_page(u64 pfn, bool remove)
> +{
> +	int ret;
> +	u64 host_addr = hyp_pfn_to_phys(pfn);
> +	u8 owner = remove ? PKVM_ID_HYP : PKVM_ID_HOST;
> +
> +	host_lock_component();
> +	ret = host_stage2_set_owner_locked(host_addr, PAGE_SIZE, owner);

Any reason why this can't be expressed using __pkvm_host_donate_hyp()
and __pkvm_hyp_donate_host()?

This doesn't check any state, so it feels like a dangerous primitive to
have. Is the issue the overhead of mapping/unmapping into EL2 stage-1?


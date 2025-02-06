Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B975C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjMZZDjHtCceqfzd+zK9UkArZCmEsWhxxeyu2AQZCbw=; b=4oRi/nZGz+BPz5tFwJDHpkMDEL
	wvBcUWBXNg6/pH70IoUI8enNV4mbGUDfDMxgkeKUqCt1TJ/yLkhMM0WoWKsQnJCZKr816Ova9Q/nR
	WYXmyGusW+jnEIDgvj7plwV3oPUY4ogV4X36KWvtoW78KuBXvqzJevqIJfSZbF2I3Sg1bd4GKQJVM
	9LK7aifUvkUJJW5+PiLPsQQS3ogD0n5hDLfOenVmznEkPCit1899vMTe0nPOSpL5h26bl0AJSnzQW
	OT5AFoK4lkMK2Y2RGhRy5PdOok+chfJdjppfZwJDDoUlMJNnqRLmCjjCJItbn3B2zNsTQuJKjsB+5
	6g45BzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg96O-00000007Xbv-3txC;
	Thu, 06 Feb 2025 21:08:00 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg94z-00000007XCE-2kiw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 21:06:35 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f9ba87f5d4so1960235a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 13:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738875992; x=1739480792; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjMZZDjHtCceqfzd+zK9UkArZCmEsWhxxeyu2AQZCbw=;
        b=FWvz9yhs0Ejk8IM2U5VDjLwBrPW1Frkxd1AziOb3mHq7Dnt2x7tmPSi+Hqo2oqurX0
         NWNug8P+PXs73jiCuNLbJ2RwlZPtUlXQzxS+P+nrXFwHyl37LSH8Vb+eutkVgKAORLIB
         vsumt/aRl+3KtGvJJLrqOM1WA5SBdedAW/sgGYG//l0QAHUeA6i0UY9zIEUJgutb4fJL
         JMII9ovbo3ob3JUENRYi9zLi6PIakyOuS+g9P0yx1UEb+9cbvw1YdLx9pbb8bjb2QGP7
         q3kbF1Klec6l+T1Mblo1h7JvRz8o1nYbxXhKA/bAouJ55ci6BIWgJqeyCKoq80CDXUzH
         51gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738875992; x=1739480792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjMZZDjHtCceqfzd+zK9UkArZCmEsWhxxeyu2AQZCbw=;
        b=k5lHvIe38wgIR4pIoKEQ22Y9MaAB0O4HlQMddH4JmmX6w1totXoYwZM+7Xfqmkbm+F
         EgeT8BV1RtjwKfSl8P252tiPvM2BRUx+qKRVqDjUZRceO7dvsLablh1qPtpSFWiU+5Xq
         DpJvkETSXUUZG4FDjvR1mGHxvUEPQkQ9pEMvOM5NWp+KwEwebao+d3QlV9YAAErY0Hep
         BcTeQYq25NCOcLeH5IYmbmiJ/lZm+GNloG3gzmVxZSsQBmobHhNdbnI7EBi2aDBB3ezm
         Emgp/ukfJd/8IczF5014FAf2VwwsjSaFAJKF5J/u6VclHAokmzA/zwypwPNiYTHJTVaz
         I3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwSKXlFmtFcNKZdtVkWrY8kklbIeFT3fvy9ckJwbJEYTENHrKOg6KeGgrGFw91kH5NhPpEDgct2bR1w0jKnVBn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Ww2K1Oa4s6m6wAurHnMV0781iUSIa/SK81Bo+XLrzQ/OPaoj
	wzYXnXWOeApS3Iv+OqrXhp+aiUEeebs09OHCpWLPFnkaQs9WadPK
X-Gm-Gg: ASbGnctUXg1lSQw0ouc5G5bdTPzxJCCuna6CaYTQebwm24lefqZ07f3mFPzXUJxtN/M
	W991j9WGgmBXm1Arbf4hdj1aPW8MJnaO9C9qx9z57wh4r5weGNI164Tr7SFByOfTUtYGuIhgzLN
	fAqM1dYdg6xvohXH0Ov88j3m7oDMDfEtsQFlmif/kzrIG6iopbmK8zYSFvcaBcdMo48nSSZxuK8
	eF9BQQFqaTF/RTNkC26VV/sJrp1z5Vt+gRnum2neCxGyKhLMHb6X7OKAmx+4xy44oiCFr4wu/7o
	lYrYJ4qjopoYASWWs6F6bZWc9oyR
X-Google-Smtp-Source: AGHT+IH78/uCL9JiB7gG2UlgfTf9jp7yPy30ClKcc0/9tpp9zOrpumyNaOrCnZmQL5OMHTgXCvjCaA==
X-Received: by 2002:a17:90b:4b8c:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fa23f43a0emr821750a91.2.1738875992197;
        Thu, 06 Feb 2025 13:06:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa17618064sm1089562a91.41.2025.02.06.13.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:06:31 -0800 (PST)
Date: Thu, 6 Feb 2025 13:06:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
	Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v7 19/20] fs/dax: Properly refcount fs dax pages
Message-ID: <f5e487d8-6466-442b-ae97-a7c294dc531e@roeck-us.net>
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <b5c33b201b9dc0131d8bb33b31661645c68bf398.1738709036.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c33b201b9dc0131d8bb33b31661645c68bf398.1738709036.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_130633_694822_73B38D62 
X-CRM114-Status: GOOD (  21.39  )
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

On Wed, Feb 05, 2025 at 09:48:16AM +1100, Alistair Popple wrote:
> Currently fs dax pages are considered free when the refcount drops to
> one and their refcounts are not increased when mapped via PTEs or
> decreased when unmapped. This requires special logic in mm paths to
> detect that these pages should not be properly refcounted, and to
> detect when the refcount drops to one instead of zero.
> 
> On the other hand get_user_pages(), etc. will properly refcount fs dax
> pages by taking a reference and dropping it when the page is
> unpinned.
> 
> Tracking this special behaviour requires extra PTE bits
> (eg. pte_devmap) and introduces rules that are potentially confusing
> and specific to FS DAX pages. To fix this, and to possibly allow
> removal of the special PTE bits in future, convert the fs dax page
> refcounts to be zero based and instead take a reference on the page
> each time it is mapped as is currently the case for normal pages.
> 
> This may also allow a future clean-up to remove the pgmap refcounting
> that is currently done in mm/gup.c.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> 
> ---
...
> -static inline unsigned long dax_page_share_put(struct page *page)
> +static inline unsigned long dax_folio_put(struct folio *folio)
>  {
> -	WARN_ON_ONCE(!page->share);
> -	return --page->share;
> +	unsigned long ref;
> +
> +	if (!dax_folio_is_shared(folio))
> +		ref = 0;
> +	else
> +		ref = --folio->share;
> +
> +	WARN_ON_ONCE(ref < 0);

Kind of unlikely for an unsigned long to ever be < 0.

[ thanks to coverity for noticing ]

Guenter


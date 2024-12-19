Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61661E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNoCLTk5PLrDllVxHnAKqOI/0xe6p3W8/JGr5L06//I=; b=OvLcFpB7XndX05ZPKgwSjHlGyv
	719ahOVJPMB7fNp/7evqS6Nm6d0R04yrH+kt3psrAlShk13Xt+97a1PULcqU6Iv5l4bZOhk9FXbcV
	QdWJhKTk9ukQCFMFjvyXxPbB2UwsZToQuobK5e2d/TDEu8wUbD119btth9qxAXW8+m9s8hCb/rPrD
	Af9PgEXS8fGeOZp/gPHDaW3WmYkpGP3AU2PtYy6f5JQrNHHAj9lloXnGNJ6dWy3lM7NjP9UccfZUM
	CEYr9Xv/8l+Rl8JX5QInCD0WY+XX5vXA/EQ+CC6poqOH7q68h8lh73ZjprDWe9lLM0qVfbjPVdAMY
	vCFkZaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEde-00000001enO-1E4h;
	Thu, 19 Dec 2024 11:24:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEcX-00000001edS-0u0G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 11:23:10 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa692211331so126786266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 03:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734607387; x=1735212187; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNoCLTk5PLrDllVxHnAKqOI/0xe6p3W8/JGr5L06//I=;
        b=4eRUk7nsOQg6dm22vHR2/6836kUWDuaB6HISdC6kGMVrjooxBKF5kIaljrHws4kbaI
         zUet0wEUOI4Z/wYtHxOolF+DskAqNFZa56BuivK+F1EyZzgeJQoa6INmR6qkhG6eFNk3
         iFLwUjrSJevbCN6C5VvDZvBIaIk6jcm2viaBdrbwoKSsl2zkqeOUhwgbq4DmvouxxoB6
         4fLdIZbTVcbRpMbMOe4Vz3S7TnHAzO2YtEX85MS4Lz65HHUaXSjOhxAumtcGmV//hWU/
         blgLvvKLNVjMdj1O/R1/A8fHDUZEFW7Ea7IiCdYTEkFfrhefhgGlZmFPY41KEHF1qu3+
         WZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734607387; x=1735212187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNoCLTk5PLrDllVxHnAKqOI/0xe6p3W8/JGr5L06//I=;
        b=HfkWnsuEM1sT4QEDEbAyl6im+1tcXvlx2m+5ky0eE9vPRhczQNaTM6CpsgV/SDL2Li
         STYpiTHrlob6gpbI3Be0xAEwru1FF/Ze1rqogv61et9Dzv6fTcXbK0p2rnJptvPc1u4P
         LMf3WDrPwq9eLYzwpjMKDEQsdzevE67WBdRLdTFh6eUQr3SsiycXM1bhElX2uLFPrAtE
         s0qz1AQ42yvaLre/fGBocOnY2aBP1sXITEEM7zSECUAFe58qsOjg5Ux/IednPam6WCTb
         OUIDHyJLN7d87WV4b7PpA29hpJyZa40tF0RskkBmufPKd0M4lJFPIiOaThyGGfUtPxJX
         YJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG7xErvssAHf3cKpp/F1VzOnTt8J0DZa61x6LwLoDpE3b4flLEs32Lew79WoRDC2KoYta6UbtjUJ+uAuEh+ZR1@lists.infradead.org
X-Gm-Message-State: AOJu0YxGiTvZ4IPtIrzn9ai877e3hqmrG//NPZF5kwHt2UZb64IUF9Q3
	wOAXqUbCfYMOwHPNjajiizzF2RFkvbSYn9V8nLy9MJwwk2SfEIPQTWkVsPRKRQ==
X-Gm-Gg: ASbGncujZfuzY+kxW4p8UnhTcVbsyZz1iNUpUudsRjRVk9/zQbx25Q2oBmPRGdENRr2
	9DNoZgt8dWn1AFKnzAngs+VxQEL0w2n2+/rR9HXQryaBipHHBw6eistLL3UwAt56Xk2ZR3B4yBY
	+MZ1fHRHZ/LBsUa0fZFXOky4CjzXSh4tHHTC64DZeW+vZFCbOLTbMcyiu0hxxeJk6YpvuVio7at
	YSZNO1I6fnZg/AqYkbluwLWNh/1yJKxEeBNHV3a19JjA2MgdPAPptlJanxOrc/FrMNof2YpjktM
	EgSmewtlIn9QtD0=
X-Google-Smtp-Source: AGHT+IGBbkrBT1+E3hcflKVgebxmfU7Se8YKjT9HtDdCtUo3a97FGuUSH0zyshOzjTlEgkesB5a4qg==
X-Received: by 2002:a17:907:9615:b0:a9a:6c41:50a8 with SMTP id a640c23a62f3a-aac08155183mr234984166b.17.1734607387303;
        Thu, 19 Dec 2024 03:23:07 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f31bsm54976666b.1.2024.12.19.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:23:06 -0800 (PST)
Date: Thu, 19 Dec 2024 11:23:04 +0000
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
Subject: Re: [RFC PATCH v2 12/58] KVM: arm64: Add __pkvm_{use, unuse}_dma()
Message-ID: <Z2QCGFN5V41Vux6Z@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-13-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212180423.1578358-13-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_032309_261703_5712138D 
X-CRM114-Status: GOOD (  17.23  )
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

On Thursday 12 Dec 2024 at 18:03:36 (+0000), Mostafa Saleh wrote:
> +int __pkvm_host_unuse_dma(phys_addr_t phys_addr, size_t size)
> +{
> +	int i;
> +	size_t nr_pages = size >> PAGE_SHIFT;
> +
> +	if (WARN_ON(!PAGE_ALIGNED(phys_addr | size)))
> +		return -EINVAL;
> +
> +	host_lock_component();
> +	if (!range_is_memory(phys_addr, phys_addr + size))
> +		goto out_ret;

Nit: I think you can do this out of the critical section -- the memblock
list is guaranteed stable by construction.

> +	/*
> +	 * We end up here after the caller successfully unmapped the page from
> +	 * the IOMMU table. Which means that a ref is held, the page is shared
> +	 * in the host s2, there can be no failure.
> +	 */
> +	for (i = 0; i < nr_pages; i++)
> +		__pkvm_host_unuse_dma_page(phys_addr + i * PAGE_SIZE);
> +
> +out_ret:
> +	host_unlock_component();
> +	return 0;
> +}
> +
>  int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
>  			    enum kvm_pgtable_prot prot)
>  {
> -- 
> 2.47.0.338.g60cca15819-goog
> 


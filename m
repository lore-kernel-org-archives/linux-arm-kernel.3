Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028F5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yflr35iQtozkrKsWPSXMB3haiCYqPE+VDxf/660hH9k=; b=WPESTaRmKVeFj9hN+/DgHtKgFT
	9daWULBqMcV9fprFqXbYKCSorpytG1TdHgoPXm8n4f1fTt9FWoUK/7CGvy639hl+Grw97HFR7IgBm
	WeB3BWwhxBz8vXWN/q7gPjcmnOBAgbtzGEtM89520bjOREXc7pJEj/9R2wM1393wfBo2X0Dg4sBTt
	UlpOjypGacSZXLBLi1uooTpY2HbgCmesT751WgJ5cRIB4ZI04aEDsxO0cU67atzdVwwNkWSBa2i1C
	sSpzJxs1XOoQM6oIeVHekFjbKNPRHjTjTEo4ZjGYpH5dmUYreOXpzzzZneBT2SQUOuui72OvSYLfA
	UUm2sfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKrW-0000000A9Wc-3H4F;
	Mon, 13 Jul 2026 17:54:38 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKrU-0000000A9WG-1KPg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:54:37 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-92e855da580so273322185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783965275; x=1784570075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yflr35iQtozkrKsWPSXMB3haiCYqPE+VDxf/660hH9k=;
        b=PvbysSTFitauYZvUwYSTAiYkOusP6LOGs+ZiLZA98PSwwoIK40ysqRStGUuFyeyaNW
         PWhDLsBTjoNmru1Sp7YzQ5/e/f/NjfX9R6rLxtt74BnpnPqYDb04EoY2n0QrBOl/EHh+
         diBjgWya+Aq8S6X0AfG2LEZsZF86/4XzDv+v0lAM8uJqbsSUqFy4uqDLBHoYVMRMaWW3
         hkxhjHirxN3LC5QScP4f5pTZGz68jNSFMfyPQRAJBlTLNQZZq8j8fPhBrRBivsRgktVO
         8QpqUBs3yRj5QpA3jzuhFVD09C4wHXLw2G7amEWTGOKRv280ULMHVYzknlVXI0lwlCO5
         BTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965275; x=1784570075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yflr35iQtozkrKsWPSXMB3haiCYqPE+VDxf/660hH9k=;
        b=fZmx4T1iqgJ3ZOvP2qowwWxuFP6f0EJNMbgyMhxZGjLLhbkFw3T6SzJM0T7VnYN4EH
         cUR7yoLR80otBydmLiFKeQk2gu43UvyN4AZ4GhIg/IGiWrflOUVJlww++ZRVJ0Bt2HiS
         61HfFNfMCLFLGD08V3ZHlv8AsfccupP1QJRz0tTHvi7T8igZPR6dpF8CfhKfSxEe23je
         3Rf9HFfeutb1CQyLNwA0k/M4AMKup5ku71GuZAwxWAvBc4vlTjYkukgYO/NShYIFjqSg
         aT0JvAnzDfssOfT2R9A4nXWzkJIdvE4dG0fnrE+Pelbk5qQisjyL8OhkMPw4OZtgnjRt
         vl1Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro+AIY320QGUZmMu9n1l4V9LBfwbLyL5Vf1Fr0GFPM8qhnghjZucSCvCYJhvCo1iqIueBV7LEXRJo+xgzNDdOSf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjhie37F8WF+X4MXBI7ybJtgS424BHxKgbAwD84Mj+TBC9fHg8
	BEFBSIFE4CoCrMwypo0mMcEyDTC2gW1cF1dFzma3Y+50sNsIc1uQ9gBV4V+qBsf2Z1I=
X-Gm-Gg: AfdE7ckJTQ55yLIILMBfHk36shhNUrQLbSAZsXTEaQjbmf1Cxyigp4dQGr/pfVmmbA8
	3bUHFGdjtkL+PCGrA8mIZTlXAgOu26PiSGmO9yyaMdOxPBpsTIsquV4WD4VUQhY9K8JuwLq4Xle
	+uK9szswFoxgjQkSAJlvtcrvKIvM3AsLBu16I1q+FnIqkPgnIZS87A2yppisspyWV6pOD3jS8y7
	XkV90iYa/J8q215gHDEMJZWdyc4SlQwkY7A5uH+n3+EsKppJ8aPb4ScdJtSskvh5OpUtPIdHMtk
	p2HHoqlGJFidmD0VCYmPQEs6fJdXJJKhzRtlTLQxkO4z58CgxBOX8RhF0fQ72hxJsbAwHxXM6ua
	t+XiybUNZj3MQB12Nky+lQL288vd9oqZGEAXBtrZHownQtHNAfcGNtkIhDmkB
X-Received: by 2002:a05:620a:469e:b0:915:94f7:55df with SMTP id af79cd13be357-92ef2bd609cmr983527785a.20.1783965274729;
        Mon, 13 Jul 2026 10:54:34 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cfdf6fsm1229104285a.24.2026.07.13.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:54:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjKrR-0000000DwzJ-2as1;
	Mon, 13 Jul 2026 14:54:33 -0300
Date: Mon, 13 Jul 2026 14:54:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 02/22] dma-pool: fix page leak in atomic_pool_expand()
 cleanup
Message-ID: <20260713175433.GI3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_105436_366794_24EC8DB5 
X-CRM114-Status: GOOD (  10.31  )
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

On Wed, Jul 01, 2026 at 11:19:06AM +0530, Aneesh Kumar K.V (Arm) wrote:
> @@ -115,8 +116,10 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	 */
>  	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
>  				   1 << order);
> -	if (ret)
> +	if (ret) {
> +		leak_pages = true;
>  		goto remove_mapping;
> +	}

Truely these _set_memory_decrypted() things are an insane API. So a if
it fails to decrypt it can be in any messy state?

> @@ -130,14 +133,15 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  				   1 << order);
>  	if (WARN_ON_ONCE(ret)) {
>  		/* Decrypt succeeded but encrypt failed, purposely leak */
> -		goto out;
> +		leak_pages = true;

At least this one makes some sense..

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602BDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5KluJxuBWim2YOI+gCMldEdZU/bLOQ3tr992AX6OwE=; b=lU5ONPCLqGVsT10MqRIDW2Gi+X
	lgpiAWU7SeJgC/MSO/GluqVsQbx6UWHCjCvhGC+ZGV7/eQ8ebTuSY/1PTOQ4L+FfDPKdJvESYQEC0
	2uq0ejzYRA7EP0WycDFpquEA1wMq2WDldtrNZztoZOiUdyJxzX3Bkyj7kuGwo+/fvpPktBnNdyg7h
	O/sNXuN8zNvqBSb4DZbic3OCkK3FVdua6UwY4vyf4/an2p6qIJsJKUXND5tP6QqTR9tCviCEGjL+5
	LeCe+eKLjONCvajGTeGhYLDuCv9PSE6bQL6hP9KMx72ocxTdnaBrVzABeNkYH1BUq71gANhBl4f/e
	11sE84eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMXl-0000000AJK8-1Yrm;
	Mon, 13 Jul 2026 19:42:21 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMXj-0000000AJJT-2sGS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:42:20 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-92e6391b114so18520485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971738; x=1784576538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5KluJxuBWim2YOI+gCMldEdZU/bLOQ3tr992AX6OwE=;
        b=esUsthj+pGWkDGbR7JMwhdzkKY6In34S0ZpeDk15rg9T78ThpCUrVA+NL0Gh2fsgyG
         A5sJsEaBx/+2evw3K2vq7LxoXFAKrOkH0fbg/a6vH+D7oxm2u/GSIIhZrjwYdbMQ3tYI
         BNV3IMW4iw/GTADpUhzeUkc39D3dlbwsSrAUn2bIb1nYsucEs0D8mlz6SYZgCEq0W41B
         Ey5H1jJe3t+5SRSk0rQdLhvteep3YQZs0aAKsEsc9LagWWTrb/VVoaPQOKP2VWjBJTI5
         KITDq5qrVztEw+kryt81/IyrE+ueo3bEQznuMJCDWmPPJS1cDl7JX070R4DIJTFfnatm
         SfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971738; x=1784576538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5KluJxuBWim2YOI+gCMldEdZU/bLOQ3tr992AX6OwE=;
        b=AvFYDMAB0Su9Qcf7jZpwX6k7oXzZMWwKIpAk9nNa8ZzBtqcCew4FyZtu4YHQUCb9lI
         yJMLyKN4WRilvPZeDk/PZgUv/tN7sGWqLMEJRbQDOh98usapy5b/FHZdCFz2WPJT/FQ3
         N2W8tBmHbxW1ya9Lm6Cw8QZisHIr/uffc4aVjmOYwlfq5vR+Ycr0JRldfrrKjD9DZ/bC
         lkgPgk6gG9wRrMy42EDhz+TcdadDlK/8o3izH/90iA8CouK0HK51TVZbJF5/vEKAjGDs
         yJkBOzZApyPpUc1ftYb/SPyxA0JJ+LwQrHskL+Q2dGEKewNJv0Id+KzFqxmEBB1dbnfB
         s6TQ==
X-Forwarded-Encrypted: i=1; AHgh+RruAFZq5yuiPfH8GZxHmGbNC9k/O8+fv+vcjCksJpJxLzJGRBJPTLsTuGAaGmKcb1ju83NrMkB2e5ad9YvDSL29@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7GEHWUdy2ZlNSasQtHBFFYLV7tuxcWb2c+zThi8temow7H9XL
	ml8iWZ4vZOqKomfi0foSccXSlhwua9amskHR7XPtBCa4hXf3LRf48/uKBq6SLHOz7L0=
X-Gm-Gg: AfdE7clCZWsVXfT0GcuRK00vm/n9pUpc2/rW6OpTslpYWoUpWoUoUcdISGrsKWo8N3i
	+dJIEHdjw9dm7132h3JL6FNrZICNJPYWTAznSnJW257BI5CWp8LlR3fTfLnRETtl4jkRwPJXMzb
	9A/1sueu83gQ9qj/4GR3eXX8BdvaRoKxWBJFZgp3rop2+qgA92cM/+vvrxdIP55vvpZH0DlezxI
	+7wtOMnhJ8s3qec2032uM9fuPX5QpI3xWSCGYD1lip+k1nIPs6blcQZ9Wu1BHMbMTfZGAbo9FDL
	0cOQ0HGp/fpEmehcDPyxu1ySWg9e8HA4CNNnlr/OqzFeetmOYHydIYipsMZ6fIzqqEUFKP3fbmm
	bYKUrXm+2tnKITd7n8a3cv9bFhSPt4dwSWPKx69Bl+gWXoDtgrUzImOZdD2th
X-Received: by 2002:a05:620a:262a:b0:92b:d4e3:1f08 with SMTP id af79cd13be357-92ef2bcc2e9mr1042196885a.55.1783971738155;
        Mon, 13 Jul 2026 12:42:18 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d37540sm1154048285a.38.2026.07.13.12.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:42:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMXh-0000000E6o6-0etu;
	Mon, 13 Jul 2026 16:42:17 -0300
Date: Mon, 13 Jul 2026 16:42:17 -0300
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
Subject: Re: [PATCH v7 21/22] dma: swiotlb: handle set_memory_decrypted()
 failures
Message-ID: <20260713194217.GA3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-22-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-22-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_124219_730544_5B2A203A 
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

On Wed, Jul 01, 2026 at 11:19:25AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Check the return value when converting swiotlb pools between encrypted and
> decrypted mappings. If the default pool cannot be decrypted after early
> initialization, mark the pool fully used so it cannot satisfy future bounce
> allocations.
> 
> For late initialization, return the `set_memory_decrypted()` failure. For
> restricted DMA pools, fail device initialization if the reserved pool
> cannot be decrypted.
> 
> This prevents swiotlb from using pools whose encryption attributes do not
> match their metadata, and avoids returning pages with uncertain encryption
> state back to the allocator.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/swiotlb.c | 80 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 65 insertions(+), 15 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason


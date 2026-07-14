Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBC3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 03:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8EROicyvyqBHzNN9rE23d0T/JySclZqP++7t7T4RaE=; b=NbA5HL/Wp9eRr3uX9dEJkJgSol
	tNO0ZXbSZc5fITFaXnrtU66KhsILL9SItSg4lrb4SSz22ZzY37VvApHmw4RaBKDGRtE+4YTb2yajd
	FOHgiBz7H3mbUyFBcu0uPplZ/6QppjS1fTFZzfbX//EbzhbNEUGHLitsgfZ0cnNBd1S4rLMuwdnJi
	zlIKHe/CvNQsFHKxpRD24qseWFUJNZTkrZ5DclI5DNDEo78SE4ZIFQafKuD4kELf1BpbkLFM9jfnl
	XTgWplUmA4x6si77k47cpuGv3zJX3ekg3aQIYOFpVMbtVGhGvMrtYzw7+oHs0ZdW2H2AO3VeoH/PB
	QgaqJu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjTvo-0000000Apb1-1H4U;
	Tue, 14 Jul 2026 03:35:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjTvn-0000000Apau-1EBk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 03:35:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C84614349A;
	Tue, 14 Jul 2026 03:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3675A1F000E9;
	Tue, 14 Jul 2026 03:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784000138;
	bh=J8EROicyvyqBHzNN9rE23d0T/JySclZqP++7t7T4RaE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EcW9AEgvcMudcqLdd5C8/BiDRQ3ckffoh+3joXtfcvQArty1Bqy7GiIydvzIBCLJI
	 ZYtj7PhBn7KY5xOXpbDoYrxVdGcfi3vpdsHKGCNWFha4MIt+IhEV5jDEBjBoyWy2iq
	 bj05AAquiv+sKEDadr4DNLJ3+mfRTpc6qQeInr7Odr7bDn+pbXtO5yQMpfS+FUvAU4
	 8ZpHoUc5+sQxY4Zemd+uQ3SKfXOCSJ2Ui1KfmTI6rr1/awo2nLjrYkhAKzaSTOFy+Z
	 5A/hh2E0gsAAMZGguGSuY4n+PIlelCOb6vjM8CYbnyg5x9L/brWLTpdEsmw8Hz8Ctc
	 KsvvwB6a/KzRw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
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
Subject: Re: [PATCH v7 02/22] dma-pool: fix page leak in
 atomic_pool_expand() cleanup
In-Reply-To: <20260713175433.GI3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-3-aneesh.kumar@kernel.org>
 <20260713175433.GI3133966@ziepe.ca>
Date: Tue, 14 Jul 2026 09:05:25 +0530
Message-ID: <yq5azezumef6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Wed, Jul 01, 2026 at 11:19:06AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> @@ -115,8 +116,10 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>>  	 */
>>  	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
>>  				   1 << order);
>> -	if (ret)
>> +	if (ret) {
>> +		leak_pages = true;
>>  		goto remove_mapping;
>> +	}
>
> Truely these _set_memory_decrypted() things are an insane API. So a if
> it fails to decrypt it can be in any messy state?
>

Yes, we could possibly try to encrypt the page again and, if that
succeeds, avoid leaking it. We might want to do that tree-wide in a
separate patch.

>
>> @@ -130,14 +133,15 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>>  				   1 << order);
>>  	if (WARN_ON_ONCE(ret)) {
>>  		/* Decrypt succeeded but encrypt failed, purposely leak */
>> -		goto out;
>> +		leak_pages = true;
>
> At least this one makes some sense..
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> Jason

-aneesh


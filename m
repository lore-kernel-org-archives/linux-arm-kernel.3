Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDDE109C04A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 17:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIRJqVgkv7eJh7WngwWl7V6I6npe4X1bVof1DxqQYQg=; b=X98ezFnOhUS7NwMGyBygk3+++V
	y5JfO49hiXY4Em72HEnDU4kfSdnvmMh/AuAESp9E/HhCbPhyNJ7qzzosYbZ4OOEArE18uc9rJEXRB
	xkYvrHs/Bu5dR0tgMwKMrXe3cCtMljwxdDL8R457lukRVGJpv1oTU9invDB25JNZDXboT2qH2B6M+
	Qv51QfJB8aWjcjFiOWW2FXguunIZswTN8glPntTYUm4sVAjdekImfAXkRpYblk6U74aJNe/8O7qMx
	TQlCr2xrClQeP1dbrWkjxIp9pinahUZJ8GEs29WGc34oPilEYKfD1vgyDryea0RnpXShKlJD5JNYs
	p4e0wWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5S31-00000003zZI-1jJW;
	Wed, 25 Mar 2026 17:29:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5S2y-00000003zYi-39Qv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 17:29:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90CCA2444;
	Wed, 25 Mar 2026 10:29:27 -0700 (PDT)
Received: from [10.1.26.165] (XHFQ2J9959.cambridge.arm.com [10.1.26.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBB1D3F836;
	Wed, 25 Mar 2026 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774459773; bh=q6eWBosAeDItDiHUT1TERXLrvVldKxWmQvT5h1zzdjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kVT1fFB9AZMrcCSWy1U6kIZWPU+dsS9jxoN4CIZPyEpXOCoAF6sIhEyvYHFo3WGNR
	 qd5xg84fI3shijg41iB5Vac8p4fbm62OtMv9hWbyQPG6nP00wlg/fXIydzNWD9FORC
	 3gFA8+2rWeg5DfVXUnuS1+EjsnS9DXDKN9wDBS0o=
Message-ID: <47d033cc-33dd-4fb2-9e8a-bc5762db6b6a@arm.com>
Date: Wed, 25 Mar 2026 17:29:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260323130317.1737522-1-ryan.roberts@arm.com>
 <20260323130317.1737522-2-ryan.roberts@arm.com>
 <a3766dfc-06ed-4cdc-9c55-0dcc3638746e@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a3766dfc-06ed-4cdc-9c55-0dcc3638746e@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_102936_945152_231D44C4 
X-CRM114-Status: GOOD (  25.55  )
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

On 23/03/2026 21:34, Yang Shi wrote:
> 
> 
> On 3/23/26 6:03 AM, Ryan Roberts wrote:
>> Commit a166563e7ec37 ("arm64: mm: support large block mapping when
>> rodata=full") enabled the linear map to be mapped by block/cont while
>> still allowing granular permission changes on BBML2_NOABORT systems by
>> lazily splitting the live mappings. This mechanism was intended to be
>> usable by realm guests since they need to dynamically share dma buffers
>> with the host by "decrypting" them - which for Arm CCA, means marking
>> them as shared in the page tables.
>>
>> However, it turns out that the mechanism was failing for realm guests
>> because realms need to share their dma buffers (via
>> __set_memory_enc_dec()) much earlier during boot than
>> split_kernel_leaf_mapping() was able to handle. The report linked below
>> showed that GIC's ITS was one such user. But during the investigation I
>> found other callsites that could not meet the
>> split_kernel_leaf_mapping() constraints.
>>
>> The problem is that we block map the linear map based on the boot CPU
>> supporting BBML2_NOABORT, then check that all the other CPUs support it
>> too when finalizing the caps. If they don't, then we stop_machine() and
>> split to ptes. For safety, split_kernel_leaf_mapping() previously
>> wouldn't permit splitting until after the caps were finalized. That
>> ensured that if any secondary cpus were running that didn't support
>> BBML2_NOABORT, we wouldn't risk breaking them.
>>
>> I've fix this problem by reducing the black-out window where we refuse
>> to split; there are now 2 windows. The first is from T0 until the page
>> allocator is inititialized. Splitting allocates memory for the page
>> allocator so it must be in use. The second covers the period between
>> starting to online the secondary cpus until the system caps are
>> finalized (this is a very small window).
>>
>> All of the problematic callers are calling __set_memory_enc_dec() before
>> the secondary cpus come online, so this solves the problem. However, one
>> of these callers, swiotlb_update_mem_attributes(), was trying to split
>> before the page allocator was initialized. So I have moved this call
>> from arch_mm_preinit() to mem_init(), which solves the ordering issue.
>>
>> I've added warnings and return an error if any attempt is made to split
>> in the black-out windows.
>>
>> Note there are other issues which prevent booting all the way to user
>> space, which will be fixed in subsequent patches.
> 
> Hi Ryan,
> 
> Thanks for putting everything to together to have the patches so quickly. It
> basically looks good to me. However, I'm thinking about whether we should have
> split_kernel_leaf_mapping() call for different memory allocators in different
> stages. If buddy has been initialized, it can call page allocator, otherwise,
> for example, in early boot stage, it can call memblock allocator. So
> split_kernel_leaf_mapping() should be able to be called anytime and we don't
> have to rely on the boot order of subsystems.

I considered that, but ultimately we would just be adding dead code. I've added
a warning that will catch this usage. So I'd prefer to leave it as is for now
and only add this functionality if we identify a need.

Thanks,
Ryan


> 
> Thanks,
> Yang
> 


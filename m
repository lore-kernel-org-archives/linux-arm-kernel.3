Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF44C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRx/KbW622lc9oNGjU0HBG2ucuK06pk04r2BRU2Rs4k=; b=YPbCj/JTCi6gE+02r0nxa67hCC
	rlpSqs13kDR68DwhBf/xMAs+9PmJLnzgKligXbM6cKPscakqgVQ122LPIMGReH9LRrGdRSLadzJHL
	1iUnerHjaoY0PRSruowfDotDiuSErAVWEM4z64eWzfTQqbg/YUsV1YGdJZ8hyfZNDBYQ2dyXNX9PD
	L9tg8Pd+9YF+TZpybZ0oe2s4cOb9P0SdmxcyYgYwo+a3ugbYKJCTxLjhzDtG9iNaAPox+I5bYIZao
	PCPtkawUzjfNCmh23ghN6LDZEr+fR3nIPPCux/a4z+FQ6R+P5VnndFrxF/zzbdgu3R0+60/q/mp6p
	W7vGTSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PqL-00000008s7E-2u1h;
	Wed, 23 Sep 2026 16:29:13 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PqH-00000008s6E-1Tlt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:29:12 +0000
Received: from [10.4.158.9] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id C049D20B7167;
	Wed, 23 Sep 2026 09:28:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C049D20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790180898;
	bh=zRx/KbW622lc9oNGjU0HBG2ucuK06pk04r2BRU2Rs4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lk4iTPb2Y7uutncKN/+j8ht7tPnRTZ6o43sCv1igw+EdAbkap5LleY6qa51nPpFa6
	 oFrn4wb6BHxvCgReQsk80Yv5Gq+s/5rQRHwDalOdArIoH0GTefNuq6TyY2rgXsVOhS
	 gNMu/nMv3dX8EIbRcFZTUFCIb4A9JF6t3XJZs7Dw=
Message-ID: <5cbe0bde-47d8-41ca-b244-bc0329d0d066@linux.microsoft.com>
Date: Wed, 23 Sep 2026 09:28:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
To: Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, mhklinux@outlook.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, christian.koenig@amd.com,
 Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Thomas Gleixner
 <tglx@kernel.org>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org> <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org> <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org> <arOspFxWZ1DjgcAr@arm.com>
 <20260923130611.GF1540250@ziepe.ca> <yq5atsng10b2.fsf@kernel.org>
 <20260923152124.GG1540250@ziepe.ca>
Content-Language: en-US
From: Kameron Carr <kameroncarr@linux.microsoft.com>
In-Reply-To: <20260923152124.GG1540250@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_092910_632539_183DC51B 
X-CRM114-Status: GOOD (  14.69  )
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

On 9/23/2026 8:21 AM, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 08:28:57PM +0530, Aneesh Kumar K.V wrote:
> 
>> I'm also considering requiring the address passed to cc_make_shared() to
>> be in the linear map. This is currently required by both TDX and CCA,
>> while AMD SNP appears to support vmalloc addresses. The only user of
>> that vmalloc support is Hyper-V VMBus GPADL setup
>> (vmbus_establish_gpadl()). How should the generic CoCo shared-memory
>> allocator handle this?
> 
> vmbus_establish_gpadl() is the the same wrong abstraction as the arch
> code. Get rid of it and use vmbus_establish_gpadl_caller_decrypted():
> 
> 		pdata->recv_buf = vzalloc(RECV_BUFFER_SIZE);
> 		if (!pdata->recv_buf) {
> 			ret = -ENOMEM;
> 			goto fail_free_ring;
> 		}
> 
> 		ret = vmbus_establish_gpadl(channel, pdata->recv_buf,
> 					    RECV_BUFFER_SIZE, &pdata->recv_gpadl);
> 
> 
> So you made an allocator that returns folios, now you just need to
> use that allocator to implement a kvzalloc wrapper. ARM can call vmap
> on decrypted memory with pgprot_decrypted(), right?
> 
> Or maybe this can use vmbus_alloc_buffer(), it already does it.

Michael Kelley recently proposed [1] moving all ring buffer allocations
to use vmbus_alloc_buffer(). If we move forward with this, it should
remove the dependency on vmalloc support.


[1] https://lore.kernel.org/all/SN6PR02MB4157B71CAC1433B04B92B700D4832@SN6PR02MB4157.namprd02.prod.outlook.com/

Kameron


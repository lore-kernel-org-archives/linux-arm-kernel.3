Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444A8E81BDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VqpxsoivxoAEysOIEjzhEtCaEfoLPs/MzwZ/mDFB+I=; b=4Wnf2mQl29VVAqcGvJQE0ZjR+b
	ERuKz4UcLMptxIWSkWMNc6T1/rr76aetyGEG+eD20Wc5wrtAjHz41j/uWdJEDziKrIyaxM1PEmTDf
	IEqNrjChb0hGCcWD6ojwJTSvreSL9BUg4tRWZMf7al7mViVseDlQ5DGl5y+7jYbcXXXcmbv2U4oTz
	+GvjrncZ7esMbiO1SCDUZoYCX8BMm2Z4hhZ/Jm+NTacO28CwMUU+sOBEnJSUYD66ru/tgYEBKmFU0
	2E5bnbqAaAe53crvo1wsBhhqvMpRraa1v0b0sBURgGR+32/txzRom1/zKC9et8yvzzhoEQB9tggBo
	zfnfStDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTQw-0000000FdB1-3RtY;
	Mon, 09 Feb 2026 15:44:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTQu-0000000Fd9b-37MO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:44:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40567339;
	Mon,  9 Feb 2026 07:44:05 -0800 (PST)
Received: from [10.57.52.189] (unknown [10.57.52.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FF653F740;
	Mon,  9 Feb 2026 07:44:09 -0800 (PST)
Message-ID: <d129d0cd-ac01-40e5-92b7-77518bf32b3b@arm.com>
Date: Mon, 9 Feb 2026 15:44:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+ GPUs
 page table format
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karunika Choo <karunika.choo@arm.com>, Liviu Dudau <liviu@dudau.co.uk>
References: <20260209112542.194140-1-liviu.dudau@arm.com>
 <0af5b5f3-912a-4f16-a68b-032617576537@arm.com> <aYngwtq_GtBYGjOC@e142607>
 <ac5c3df0-1d94-4a1c-9eec-a359096cfce5@arm.com> <aYn7obNImaI72MhK@e142607>
 <20260209163534.45b0ec7a@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260209163534.45b0ec7a@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_074417_055164_EF0A8039 
X-CRM114-Status: GOOD (  24.74  )
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

On 09/02/2026 15:35, Boris Brezillon wrote:
> On Mon, 9 Feb 2026 15:22:09 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
>>>> Ultimately the role of this RFC is to start a discussion and to figure out a path
>>>> forward for CSF GPUs where we want now to tighen a bit the formats we support and
>>>> add PBHA and in the future we want to add support for v15+ page formats.  
>>>
>>> PBHA is definitely an area for discussion. AIUI there are out-of-tree
>>> patches floating about for CPU support, but it hasn't been upstreamed. I
>>> don't know if any serious attempt has been made to push it upstream, but
>>> it's tricky because the architecture basically just says "IMPLEMENTATION
>>> DEFINED" which means you are no longer coding to the architecture but a
>>> specific implementation - and there's remarkably little documentation
>>> about what PBHA is used for in practice.
>>>
>>> I haven't looked into the GPU situation with PBHA - again it would be
>>> good to have more details on how the bits would be set.  
>>
>> I have a patch series that adds support in Panthor to apply some PBHA bits defined
>> in the DT based on an ID also defined in the DT and passed along as a VM_BIND parameter
>> if you want to play with it. However I have no direct knowledge on which PBHA values
>> would make a difference on the supported platforms (RK3xxx for example).

So we need something better than a DT entry saying e.g. "ID 3 is bit
pattern 0100". We need something that describes the actual behaviour of
a PBHA value. Otherwise user space will end up needing to know the exact
hardware platform it's running on to know what ID values mean.

> I don't know if that's what it's going be used for, but one very
> specific use case I'd like to see this PBHA extension backed by is
> "read-zero/write-discard" behavior that's needed for sparse bindings.
> Unfortunately, I've not heard on any HW-support for that in older
> gens...

*This* is a good example of something useful that could be exposed. If
the DT can describe that the hardware supports a
"read-zero/write-discard" with a specific bit pattern, then we can
advertise that to user space and provide a flag for VM_BIND which gives
that behaviour. And user space can make good use of it.

But from what I've heard the implementations tend to have something more
like a hint-mechanism where it affects the behaviour of the caches but
not the functional effect. This makes it much harder to expose to user
space in a meaningful way because it's highly platform dependant what
"don't allocate in the system level cache" actually means in terms of
performance effects. But it's possible we could describe more of a usage
based flag - i.e. "PBHA bits good for a tiler heap".

Thanks,
Steve



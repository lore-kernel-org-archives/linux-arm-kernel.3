Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565ACD6CFBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 03:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbX/oFPcvjkok5UfyGkxjeZ3cS0obURt1rnWqjCSVtY=; b=I8TEnkT6zikdyjj/eSuMWITFwQ
	6FsbtHU+VsWej3dsMWbcNP9HnwofutlJVuPVnq8BstfA0mM9mxunEz6qAnBWhcwTfrzVULTiJoca6
	e9lPnOaAkQj3NiNv6JN/lzK4//oYdM4Wj3MFFiys85MVYol234irXtKPIAGWUfUXo/vbfUiM5faas
	mGmmbHeWYZWJsdOcY4+q04+9ZdU4Hu5hsrcoOGxwUeqxFxeuOXxZBGNF/XZDGK64has3dc96vaud3
	BV8Gowg/r5ZA+2AEJHFDhljdde1RFdBpKsU3RJ5eO48tGkzZhpkGMPHuft6/X+n3MP/WidGyr2OGn
	LjUyTe4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8DB-00000008APJ-49wy;
	Fri, 23 Jan 2026 03:51:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8DA-00000008AP8-2WHW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Jan 2026 03:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QbX/oFPcvjkok5UfyGkxjeZ3cS0obURt1rnWqjCSVtY=; b=W00IbrFldS8Upe4i8IHpvlJyX7
	SPH8aeTmLA+ONwJwFniyW9ikYbB6xyFsTA9014ziPBcO65pIGZaC2TXIeb2vXH4ufiplWHUrOeclf
	xZSK6A5As8YoK9p3ffz2S5VU8+WpxmBoKwa660enzzsjhGDLD311fT4f075QmFij4bAACUtowVL8g
	w6/RNUzbCiHmKicfdc+OVOxXhl8FBiJNR9Hw/es7GwHLUBJwFiAbQTGIZ6fZTDdk42zIzMc4ehDj8
	QZXz2855MiF0gSaSdWah0RDeFvZ4XWDn6Gp1YQpkDgG91o7FU8FQvPxTy//wLqpxgASLTTrV0PccK
	jvlD8t1Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj76I-00000001YR3-16bV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 02:40:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DB471476;
	Thu, 22 Jan 2026 18:40:20 -0800 (PST)
Received: from [10.164.18.52] (unknown [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6B7B3F740;
	Thu, 22 Jan 2026 18:40:24 -0800 (PST)
Message-ID: <8e9f762f-5933-4e30-ab6d-489a56de4eaf@arm.com>
Date: Fri, 23 Jan 2026 08:10:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 ryan.roberts@arm.com, cl@gentwo.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
 <aXIxYcAsbFZn3ZNU@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aXIxYcAsbFZn3ZNU@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_024043_209283_42C0096A 
X-CRM114-Status: GOOD (  17.85  )
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



On 22/01/26 7:47 PM, Will Deacon wrote:
> On Thu, Jan 22, 2026 at 10:39:25AM +0530, Anshuman Khandual wrote:
>> Hello Yang,
>>
>> On 07/01/26 5:59 AM, Yang Shi wrote:
>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>> rodata=full"), the direct mapping may be split on some machines instead
>>> keeping static since boot. It makes more sense to show the direct mapping
>>> use in /proc/meminfo than before.
>>
>> I guess the direct mapping here refers to linear map ? IIUC it is called
>> direct map on x86 and linear map on arm64 platforms. Then should not it
>> be renamed as s/DirectMap/LinearMap instead ? This will align with names
>> from ptdump as well.
>>
>> Before the above mentioned commit, linear could get altered with memory
>> hotplug and remove events as well.
>>
>>> This patch will make /proc/meminfo show the direct mapping use like the
>>> below (4K base page size):
>>> DirectMap4K:	   94792 kB
>>> DirectMap64K:	  134208 kB
>>> DirectMap2M:	 1173504 kB
>>> DirectMap32M:	 5636096 kB
>>> DirectMap1G:	529530880 kB
>>
>> If /proc/meminfo interface is getting updated via  arch_report_meminfo()
>> why not add stats for all kernel virtual address space ranges including
>> vmemmap, vmalloc etc aka all address range headers in ptdump as many of
>> those could change during system runtime. What makes linear mapping any
>> special ?
> 
> tbh, I think compatability with x86 is a good argument in this case and
> so the naming and formatting proposed by this patch makes sense to me.

Fair enough. Probably adding a comment above arch_report_meminfo() along
with the commit message, explaining the above rationale would be helpful 
for developers to understand/recollect this equivalence later on.

> 
> I'm also not sure that it's particularly interesting to see these
> rolled-up numbers for the vmalloc area. You really want information
> about the area, so extending /proc/vmallocinfo to give information
> about the granule size for each entry might be useful but I don't think
> it should be part of this patch.

Agreed - vmalloc has a separate file for its details which can be improved
later to accommodate rolled-up numbers. But what about vmemmap ? It always
gets updated along with linear map during memory hotplug and remove events.
Should that be included here ?


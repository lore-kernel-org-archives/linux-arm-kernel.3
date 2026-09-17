Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE669C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AU8CGgy6Pa5vfZgK02vvr6pONCCFzHgT9ly82BtluUM=; b=cxGkQK0qM/8/h2zeKLlGSc+8zd
	qPM4CXLmItsD5dVj+4y9TI1mhceAw2MqwJ4YfhY33NKhIbnRXH9SFP5iRVrC+A6bpVh/KKCiagFRh
	ghMiMz0B40JTX7eNnw7G47Pn2qezS3TY7ba6v/EEeGLqPw82s4eGHRBizEtm8LhB4fK4auXjbacTi
	+w9u5quoRbOwz/gsAf6rqYmsODcprqr2DTJ1jwRJcGRPqw26VwOEtKfxlpaDKvB6jhUGkGovsXnoE
	K5DjfODLTCiFFKYUcA+smB54Dx0OWJQ7yom0TVEgEjn7WECzXxEUMr/X/IZoOebGUmF9+HdyuV3Gt
	dSPJ27GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Caq-0000000BTDn-2izn;
	Thu, 17 Sep 2026 13:56:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cap-0000000BTDa-0m6M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:56:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 84CA760052;
	Thu, 17 Sep 2026 13:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB311F000FF;
	Thu, 17 Sep 2026 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789653362;
	bh=AU8CGgy6Pa5vfZgK02vvr6pONCCFzHgT9ly82BtluUM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=f0o1NCLoIaKYvHe6FBZBBPQIdVjNHSj17+boe4ixXC3+KOmFDflYlsRC5fnT5VKxe
	 HiRy4SVb68ngiM7azj5+u6m0xyNju5V08cQfHJi2NV7PnWKPKN0HohbudLio9W316d
	 /edQAOX6ErcG27FlD7aI7nIlFvgogzkRyJF2d47a43MYtpOIbd3z+9IDQOratubN4N
	 ZuFV4D+qsmLiDJtiANyhBpkxPnBMa9HwkwVS+ElI9GOaUk8mXNshPSlsKTwpKcv5iZ
	 W69f14zdA0DevKSl2Y8ooTN16Hqf4yJJ0lXRIWagnyzIQCBiYdtgcfS7LhiSuDGGLp
	 iwWBqDVpHt2jw==
Message-ID: <c92a1202-1fa6-4cd8-9d82-b46a1b5d8f56@kernel.org>
Date: Thu, 17 Sep 2026 15:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com,
 leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <493ef264-eab3-4be3-a80e-357f01ae1b37@kernel.org>
Content-Language: fr-FR
In-Reply-To: <493ef264-eab3-4be3-a80e-357f01ae1b37@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 17/09/2026 à 14:17, Christophe Leroy (CS GROUP) a écrit :
> Hi,
> 
> Le 17/09/2026 à 07:29, Wen Jiang a écrit :
>> From: Wen Jiang <jiangwen6@xiaomi.com>
>>
>> This patchset accelerates ioremap, vmalloc, and vmap when the memory is
>> physically fully or partially contiguous. Two techniques are used:
>>
>> 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
>>     segments
>> 2. Use batched mappings wherever possible in both vmalloc and ARM64
>>     layers
>>
>> Besides accelerating the mapping path, this also enables large
>> mappings (PMD and cont-PTE) for vmap, which are currently not
>> supported.
> 
> This series doesn't apply. I tried to apply it on top of v7.2, v7.3-rc3 
> and next-20260916
> 
> Can you tell how to apply it ?


Finaly I was able to apply it on top of v7.1

Christophe


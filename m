Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61641CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaAADn2tjVGmaUuA7pdaJnA2tTQPkC4HmSChEbT3Pag=; b=Gd5Xw9Q2shkGPJYwLHC+bfGZbP
	haAiKr8zEH7qrVvfp3y5PzJN4NQxsFgNlJ7K9OkzkH966khPdAkwjhZLf3uOUyM+sMa6dLTbIBycQ
	NGqfZLXaKw0hz71XYWusL4kKHOd/V/bQvDuNv8Uouep0CsZfaTKwSPUE2D88czIyVh/T7xAJfsMCw
	Ddap+ofkg+7+b+KHLtHEIBnBiondG8asp4fOEFiD5V8243on0OGOEEoi/Hrdnmo+SjemcWQyD5Gkv
	oXWZJ8ZpnFYEFk4pcFmD0tWQfXdgkMxPVzCnOD644n/ENSTqcj+k+cCtHIdXHTEUHXV9JrUdyXcBb
	sPXgR62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH7EB-0000000GGV6-1aYl;
	Thu, 06 Nov 2025 21:09:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH7E9-0000000GGUX-0PvP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 21:09:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E54B341695;
	Thu,  6 Nov 2025 21:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D91C4CEF7;
	Thu,  6 Nov 2025 21:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762463343;
	bh=NJj9/t+gNJr+vDdyBNpiibSut3OUg0RSfdxa5GXVBOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V7pmPyhwR1NHuXQ/SZbGykER1QPu/pdUavbqQl6lMhdn9SNsP0Go5SI0PwXrOFvNf
	 dhwHYwxhSY5AklnvDVpA+307VZX9vB8ApKlaMW5AKmXUWI4+ye35gNVQTAaNKShC0m
	 mtLvFsqUb8PbK7hujQbA8riepBt3KA+z/SebXLsdxEFcGS7HVxOnnmEz9hTm8PtrSx
	 3qykHLv0EfwMMr9AGOmStyKD1KoOoUP9wRrNSMr2qji2FaQBbRsPNP9FXy1fUVNIrg
	 E7A8tZlTz49SIoS8OxWG5sRdU25gnaR4NgNgsI1NbvtPQozTLVi3wuqhGOuUs27V1f
	 SUl9Zc6jk6WcQ==
Message-ID: <4356959e-102c-433c-b1d5-3fc7102ea593@kernel.org>
Date: Thu, 6 Nov 2025 22:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: mm: Tidy up force_pte_mapping()
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, yang@os.amperecomputing.com, ardb@kernel.org,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251106160945.3182799-1-ryan.roberts@arm.com>
 <20251106160945.3182799-4-ryan.roberts@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251106160945.3182799-4-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_130905_162235_E2071CF0 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On 06.11.25 17:09, Ryan Roberts wrote:
> Tidy up the implementation of force_pte_mapping() to make it easier to
> read and introduce the split_leaf_mapping_possible() helper to reduce
> code duplication in split_kernel_leaf_mapping() and
> arch_kfence_init_pool().
> 
> Suggested-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---

Reviewed-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David


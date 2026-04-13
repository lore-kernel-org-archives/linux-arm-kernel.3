Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827ECF34C42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evhBVSjuTjhT8AZO7ALqiR4oNX8BYOQjZt5OTWr3Ezw=; b=lZ2NbWmbdn02D4yMgh3qZxHiwI
	6qCDGmAwgOwdOLgWX24Pjs4fCsAWKE3EO4fpM+twnvTsqcCFhC/q3xbGlCzcwZp2DcgBd+D2tM5/W
	3aUE9KQJKQXmMvbhmOQ4uuQmOS0DdAr7fGie9v0ptesan8wa0nCf+f68Hzl5VYl0qP7fKlymUZ0t5
	g9Ujr7UOMHC2ddr9ZPS2efArb1LA1sEHqjoDgd72KCJ1/0l/zL+lBK9k88gMONb8XmFyYTU7bxT7Y
	z2/z5sLIl0tAbLbs+g+olc2Sy5O/MAk14KUmONoZRPWIqGxYoSLoNVxl4qjAKCVl1bSdnIwFEhRsa
	/uD/CJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFlx-0000000FbVq-2FBm;
	Mon, 13 Apr 2026 11:48:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFlu-0000000FbU3-43UN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 11:48:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56251357A;
	Mon, 13 Apr 2026 04:47:58 -0700 (PDT)
Received: from [10.57.62.88] (unknown [10.57.62.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01B053F93E;
	Mon, 13 Apr 2026 04:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776080884; bh=evhBVSjuTjhT8AZO7ALqiR4oNX8BYOQjZt5OTWr3Ezw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YaWnVFBrwC0Eg04p77bwiv1keGMJvUXOueR4q8XLZcsWqZXhBry1x/GeYZa16HucH
	 zhSFjRx9tRhig59WdPy5jvMsxPmGXxymsq9WK5jH4c4NMDp9yVkSTou4Ay4RS+L85m
	 lDGalKbe2j/0CSWqrscuyR92t3mwl1Cqe7Czc9Zc=
Message-ID: <9e47d3a9-e1ae-480b-a202-54d9d72479a2@arm.com>
Date: Mon, 13 Apr 2026 13:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260330161705.3349825-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_044807_144031_6B4AA282 
X-CRM114-Status: UNSURE (   6.87  )
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

On 30/03/2026 18:17, Ryan Roberts wrote:
> +bool page_alloc_available __ro_after_init;
> +
> +void __init mem_init(void)
> +{
> + page_alloc_available = true;

I knew I had seen a simpler solution to this: vmemmap_alloc_block() uses
slab_is_available() to tell whether the buddy allocator is available.
AFAICT this becomes true somewhere in kmem_cache_init(), which is called
just after mem_init(). Probably good enough for our purpose?

- Kevin

> + swiotlb_update_mem_attributes();
> +}


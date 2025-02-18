Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A37C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 12:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HY3q21qGHPhZv65VuksanbKEYDSX6CNI9ocW1+BoF2M=; b=ZjzH8XV5AdNsQ+SiYkXw/CGzxH
	IKDnqvNCicRjDXmIZnTYQeqBSINqecXArKxQlKm+Xp2X1UmZVd+pyCbNHkbPF/e1kKkHIeXn2LLhu
	Bl+BpsxGQpx2M83KdM+X61c0573ywYIvfOcDUCKyBu/6RNx7vnXxT62HgBGncc3pRVn+jsBsUNyr3
	ugBsKW0jlCDN25It0SsOX2cM4JkZH/l3dr3/feyt0Njq32xCWXBb89pzNFCV+fbEniXchtwT9R9ft
	CeV6O07L4Sq0FrZKHDLqWq4lAMD7KkH1hWV5sMkpsS0chG9Wds9h/3CmrznHbvUFUzTu3dfIj/8hV
	6S6SOMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMeZ-000000088Hj-2wey;
	Tue, 18 Feb 2025 12:24:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMEr-000000083IA-2SVS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:58:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA5B152B;
	Tue, 18 Feb 2025 03:58:27 -0800 (PST)
Received: from [10.1.27.186] (XHFQ2J9959.cambridge.arm.com [10.1.27.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 987F23F59E;
	Tue, 18 Feb 2025 03:58:07 -0800 (PST)
Message-ID: <43192985-584e-4d6a-86b6-5299638d9fb1@arm.com>
Date: Tue, 18 Feb 2025 11:58:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 0/2] arm64: support FEAT_BBM level 2 and large
 block mapping when rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: cl@gentwo.org, scott@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250103011822.1257189-1-yang@os.amperecomputing.com>
 <022c4799-bf0e-44d4-b657-d6af29a9a31d@arm.com>
 <7ca5e8a6-9f01-40c6-a46d-c717ae7ab3b1@arm.com>
 <8e3ad39e-de59-48bf-b776-b27dc784a8ef@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <8e3ad39e-de59-48bf-b776-b27dc784a8ef@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_035809_674469_B3502F8F 
X-CRM114-Status: GOOD (  14.37  )
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

On 13/02/2025 21:27, Yang Shi wrote:

>>> I don't really understand how vmalloc is relevant here? vmalloc can already map
>>> huge pages you use vmalloc_huge() and changing the permissions of vmalloc
>>> mapping will only affect the ptes pertaining to that mapping; I don't see why
>>> that would cause permissions to be changed on the linear map or for huge pages
>>> in the linear map to be split?
> 
> I just uses vmalloc() API to emulate what modules loading does. Allocate memory
> via vmalloc() then change permission to, for example, read-only, by calling
> set_memory_ro(). So I can stress the page split by doing it on the most of
> memory, for example, 80% of memory. It is more efficient than loading real modules.

Ahh I see. I hadn't previously appreciated that we change the linear map
permissions at the same time as changing the vmap permissions. Makes sense.

> 
> It is implemented by a patch against test_vmalloc. I don't include the patch in
> this series, if you think it is useful, I can include it in v3 anyway.

I don't think it's necessary to include in this series. Although perhaps useful
as follow up patch to beef up the vmalloc perf tests.

Thanks,
Ryan


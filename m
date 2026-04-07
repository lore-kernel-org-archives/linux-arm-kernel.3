Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87353EDB7CC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdX1LIpHvqh2DDSNmEcY8xRZ9YTUqTMVm1kziL2Iug4=; b=OVX6IZSx2o5xWwv+1bdJwnbVC6
	9H6Fwzo2enIat2sLbHLheavaxPwvNlcLCKeY8KjxegALHHomyXvmTFVTo8igbdQG0ETdxUnawoqht
	pz+fOsG3qAEU6cZYqCENVfOqlC/5tt4CdP0N6t1OIVuadhhesrj7R/hqJ+6Mkz10K4utjXsH5VYxU
	qZhS1hqpJwRb7ogHxGt/1mt88INYDMCPRWxTDwiwry2TVowQyEV9Bh/XsoGsu5nL9oKIbGDf/LFgH
	Dq2Lm71X5YBa5ClSQ/cKAE1fCTp1xW/MRmxHCrkmrCUqxXatMJk3DIv5S3A8JxZ2EmnJfgzQoNZ4j
	rWirsCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA22H-00000006B5y-3xCX;
	Tue, 07 Apr 2026 08:43:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA22F-00000006B5d-2Qej
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:43:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D5DC1D6F;
	Tue,  7 Apr 2026 01:43:40 -0700 (PDT)
Received: from [10.57.87.42] (unknown [10.57.87.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8594C3F641;
	Tue,  7 Apr 2026 01:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775551426; bh=yBLiVzjBRJft8vkh+7dn+QeKm7TtX8g2EDLLFcDXOZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U8bvururo5b1ps+KdeqNiZedG+dYujaDyNUBLnI5D3ezXZ76ozBXVKrKkte0h1gQ3
	 KhrRvUK/4bauOvy0bt/z3ZnAtclb5oWoHQKyxrlTaHGqKZKxOAzB4XElR0vAPyGtIg
	 jN/i3x5oZOztXV7dewzuwpwnlzJI+jcJqSpt2jhg=
Message-ID: <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
Date: Tue, 7 Apr 2026 09:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com> <ac7VD4Z85nS30GCp@arm.com>
 <ac-W9oNM_O5RTtaf@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ac-W9oNM_O5RTtaf@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_014347_683041_3F3B2791 
X-CRM114-Status: GOOD (  16.90  )
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

On 03/04/2026 11:31, Catalin Marinas wrote:
> On Thu, Apr 02, 2026 at 09:43:59PM +0100, Catalin Marinas wrote:
>> Another thing I couldn't get my head around - IIUC is_realm_world()
>> won't return true for map_mem() yet (if in a realm). Can we have realms
>> on hardware that does not support BBML2_NOABORT? We may not have
>> configuration with rodata_full set (it should be complementary to realm
>> support).
> 
> With rodata_full==false, can_set_direct_map() returns false initially
> but after arm64_rsi_init() it starts returning true if is_realm_world().
> The side-effect is that map_mem() goes for block mappings and
> linear_map_requires_bbml2 set to false. Later on,
> linear_map_maybe_split_to_ptes() will skip the splitting.
> 
> Unless I'm missing something, is_realm_world() calls in
> force_pte_mapping() and can_set_direct_map() are useless. I'd remove
> them and either require BBML2_NOABORT with CCA or get the user to force
> rodata_full when running in realms. Or move arm64_rsi_init() even
> earlier?

I'd need Suzuki to comment on this. As I said in the other mail, I was treating
this like a pre-existing bug. But I guess linear_map_requires_bbml2 ending up
wrong is a problem here. I'm not sure it's quite as simple as requiring
BBML2_NOABORT with CCA as we still need can_set_direct_map() to return true if
we are in a realm.

I don't know what it would take to run arm64_rsi_init() even earlier, but that
would be the best option from my point of view.

Thanks,
Ryan



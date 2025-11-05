Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859A7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 02:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/+QNmCKr0lmhgLfbQJ14ZgfIq9QVLLszzOyRiiIMf8=; b=ie88eiuOzXxDwhSF0PNiS/MHyu
	l4CT/i8IYCY7Id5BWYPjDRHuQYvkZ218FTSttguMxmWMvPYHwaQ9MRw9mw3VKSA+zpSqXoAfhKx7R
	rYWqVvlcvpXZQkBpCt0S3ZgPsuksPx+NHY/sK6OkQS3cwkXYaB/5zVxzFqBdqJ1KtAW7SK3+/StsK
	HanCdDXgNxNfF5tN9vy/uf1n9rayYVykfR9XqoClX2mMf6WbgrXp+8jhaaNdzTxZjIV/lJfuL/7Xm
	+GapP3KvNCNxu5nPgJG5c06wu6oFD9lctq7KIdfBm0Oj67Ym1K3YACE56NnhEGw6fjs6QwqPw1Kn1
	p9drCVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTff-0000000Cvd6-3LwT;
	Wed, 05 Nov 2025 02:54:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTfc-0000000Cvcj-2Tn0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 02:54:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 555DB1764;
	Tue,  4 Nov 2025 18:54:37 -0800 (PST)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76CA03F66E;
	Tue,  4 Nov 2025 18:54:43 -0800 (PST)
Message-ID: <e660e033-6300-4deb-b034-4d26746d8d01@arm.com>
Date: Wed, 5 Nov 2025 08:24:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Add a fallback stub for pgd_page_paddr()
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org
References: <20251014110633.304961-1-anshuman.khandual@arm.com>
 <aQoORmgliayA0s_a@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aQoORmgliayA0s_a@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_185448_677644_00EFD3F9 
X-CRM114-Status: UNSURE (   8.07  )
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

On 04/11/25 8:01 PM, Will Deacon wrote:
> On Tue, Oct 14, 2025 at 12:06:33PM +0100, Anshuman Khandual wrote:
>> Add a fallback stub for pgd_page_paddr() when (PGTBALE_LEVELS <= 4) which
> 
> typo

Sure will change - s/Add/Adds
> 
>> helps in intercepting any unintended usage and which is also in line with
>> existing stubs for similar [pud|p4d]_page_paddr() helpers.
> 
> Are you saying the kernel compiles in this case without your patch? Which
> definition of pgd_page_paddr() does it end up using?

Kernel compiles for PGTBALE_LEVELS <= 4 just fine without this patch as both
its current users p4d_offset_phys() and p4d_offset_lockless() are wrapped in
with PGTBALE_LEVELS > 4.




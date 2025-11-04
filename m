Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283F3CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDTOLCKmwK5HsGpdGPVjVo3Ub1IiZNd30+49VwjCsAo=; b=eSLTCfufRE0rypf3FGpukkOFUm
	9yiKcLxKqhcX3pVURI2NSZ92SIIWqWdCezhwzbRRPGq/9vzWFnY7WtkoR5hCaPKE88mK1Z/oDYGJ/
	fDxyNgFeUt96e7W9vZqibok3mosMhB7rnhVbXwCQw8rZYI8H9LGd/hAMTDzpE24UT54SVYAmj6K0h
	7jp1R9jWtwoppVfnOoDlnRVNRvQe1hoOmI4QZhOe/yaDWDfZrVHbBEQSzklpb3IkJ+0/PVCrAM4An
	/TiTEzMjesPis9b8w2kQYnJtlyYEcvSbgkLKluPdrqYcSP7+upFAZDH2TKyjzpcuibSR9jRuot2mX
	wwdzuoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHbv-0000000Bwaa-20hx;
	Tue, 04 Nov 2025 14:02:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHbs-0000000BwaA-2XpZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 14:02:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E79C01CE0;
	Tue,  4 Nov 2025 06:01:58 -0800 (PST)
Received: from [10.164.18.64] (unknown [10.164.18.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B037C3F694;
	Tue,  4 Nov 2025 06:02:04 -0800 (PST)
Message-ID: <053b2bfd-df5e-41fe-854c-f0eb96564dcb@arm.com>
Date: Tue, 4 Nov 2025 19:32:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: kprobes: check the return value of
 set_memory_rox()
To: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251103194505.4077265-1-yang@os.amperecomputing.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20251103194505.4077265-1-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_060208_712667_50C2C1A7 
X-CRM114-Status: GOOD (  22.94  )
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


On 04/11/25 1:15 am, Yang Shi wrote:
> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), __change_memory_common has more chance to fail due to
> memory allocation fialure when splitting page table. So check the return
> value of set_memory_rox(), then bail out if it fails otherwise we may have
> RW memory mapping for kprobes insn page.
>
> Fixes: 195a1b7d8388 ("arm64: kprobes: call set_memory_rox() for kprobe page")
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
> I actually epxected 195a1b7d8388 ("arm64: kprobes: call set_memory_rox()
> for kprobe page") can be merged in 6.17-rcX, so I just restored it to
> before commit 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in
> alloc_insn_page"), however it turned out to be merged in 6.18-rc1 and it
> is after commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"). So I made the fix tag point to it.
> And I don't think we need to backport this patch to pre-6.18.
>
>   arch/arm64/kernel/probes/kprobes.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 8ab6104a4883..43a0361a8bf0 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -49,7 +49,10 @@ void *alloc_insn_page(void)
>   	addr = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
>   	if (!addr)
>   		return NULL;
> -	set_memory_rox((unsigned long)addr, 1);
> +	if (set_memory_rox((unsigned long)addr, 1)) {
> +		execmem_free(addr);
> +		return NULL;
> +	}
>   	return addr;
>   }

Looks obviously correct:

Reviewed-by: Dev Jain <dev.jain@arm.com>

Although I got confused by why set_memory_rox() is being called; it is being used
only to handle the linear map alias perm change, which is not nice :) but I don't
see an obvious way to refactor the code to only perform the needed functionality here,
and probably this is not a hot path that we care about.

>   


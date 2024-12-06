Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12039E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 04:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9G/rQWXYepwrMwJ3z6Ob8LvDgrCzifINkjNGXZVuoE=; b=OVLWVrv5nEzio8+DZkJBO1aVfw
	MyFHGX0L3rGsCCbLN+k1l2lDY2Ttzg179+iXeKRE3WoOiBzMgTgfnvmkyOpoA2sbbQH1kJpd/1sBd
	CI0qLlD970zufsc7g8Lde7MnOqtglRJmYMPCr+0hpEO3hmUl47UXqHset/v35uzlTD9dsbVJ4per2
	J1cIZX4ZX1fNEiKk7Jed9dJ/1JbTrjUpMSijXgMgVBe4SUFy/UF2kG7YtX/j86Z9F2QDqOV/egswO
	GgNydWMN31MS2AWZOK8CN4SSuODtsaKULevf9ccYyoh7ltUQTiPL73F0YgoXjjfq4KkoUZHB94qeH
	1s3KrqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJPzF-00000000VjD-0mA2;
	Fri, 06 Dec 2024 04:30:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJPyC-00000000VbU-2wNa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 04:29:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A47F2169E;
	Thu,  5 Dec 2024 20:30:02 -0800 (PST)
Received: from [10.163.50.12] (unknown [10.163.50.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDAD13F58B;
	Thu,  5 Dec 2024 20:29:29 -0800 (PST)
Message-ID: <03245d82-ad68-4ac2-a6f1-d8e4cc5397c3@arm.com>
Date: Fri, 6 Dec 2024 09:59:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: introduce rodata=noalias
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, ardb@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, mark.rutland@arm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 cl@os.amperecomputing.com
References: <20241126085647.4993-1-shijie@os.amperecomputing.com>
 <20241126085647.4993-4-shijie@os.amperecomputing.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241126085647.4993-4-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_202936_786850_46B3EC60 
X-CRM114-Status: GOOD (  16.41  )
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



On 11/26/24 14:26, Huang Shijie wrote:
> The rodata=noalias is the original rodata=on.
> 
> The rodata=noalias can provide us more block mappings and contiguous hits
> to map the linear region which minimize the TLB footprint. And the
> linear aliases of pages belonging to read-only mappings in vmalloc
> region are also marked as read-only.
> 
> Also update kernel-parameters.txt for it:
>    change "full" to "noalias"
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  arch/arm64/include/asm/setup.h                  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index dc663c0ca670..54b4df42e631 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5894,7 +5894,7 @@
>  	rodata=		[KNL,EARLY]
>  		on	Mark read-only kernel memory as read-only (default).
>  		off	Leave read-only kernel memory writable for debugging.
> -		full	Mark read-only kernel memory and aliases as read-only
> +		noalias	Use more block mappings,may have better performance.
>  		        [arm64]
>  
>  	rockchip.usb_uart
> diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
> index 5ded3bd11476..3d96dde4d214 100644
> --- a/arch/arm64/include/asm/setup.h
> +++ b/arch/arm64/include/asm/setup.h
> @@ -31,7 +31,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>  		return true;
>  	}
>  
> -	if (!strcmp(arg, "full")) {
> +	if (!strcmp(arg, "noalias")) {
>  		rodata_enabled = true;
>  		rodata_full = false;
>  		return true;

This patch should be folded back into [PATCH 1/4] ensuring that

- "rodata=" processing gets updated completely i.e dropping 'full',
  adding new 'noalias' and also updating the documentation at once

- Avoids temporary the "full" option breakage as mentioned earlier

Also please do add in code comment above arch_parse_debug_rodata()
function explaining all the options after these update.


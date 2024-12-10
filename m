Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BE2E77181
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 07:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZ+t6Dd2Y/MHenIqxVOzShqTquOZpGAyTCWNL1A8zLQ=; b=BP1MepkKo3otq0bF7Gcad50R7/
	9JN2i1ogRsvLx3v3WxNlCtoS3IZtwPP/BvnluQhG1DQ/uu9aCNMKKts+nTzN9JqSO0jz708i+SZcn
	sZVsXo035I1qD7WVDIaNjVekLGDj8h9uQpEkwX4dtmlnHWgeJIfkTYV4gHaJu9JvBSadTf2l3WNr2
	AMaZ7gGVhDaVpMf2wBmLwZ0ULOJdgB/ehOJRQyHvAJlMbwhJrwFR6RuKFoXIippdyNlfK2/JDj5u6
	iK6r1byVnuA35wiwoQEe4Oe6HqmkAgw8nodEHClV2nBhO5gWQHN8wky1DyL/dmxqdGAjHfBHyCMhb
	L54/PPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKuW8-0000000AX1G-3Lb2;
	Tue, 10 Dec 2024 07:18:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKuV3-0000000AWtO-3yPx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 07:17:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B81E4113E;
	Mon,  9 Dec 2024 23:18:07 -0800 (PST)
Received: from [10.163.48.173] (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF19D3F720;
	Mon,  9 Dec 2024 23:17:35 -0800 (PST)
Message-ID: <d13f1879-7fbc-458d-8fd3-4340b51165fd@arm.com>
Date: Tue, 10 Dec 2024 12:47:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: refactor the rodata=xxx
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net
Cc: patches@amperecomputing.com, cl@linux.com, akpm@linux-foundation.org,
 thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com,
 ardb@kernel.org, inux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241209072020.4743-1-shijie@os.amperecomputing.com>
 <20241209072020.4743-2-shijie@os.amperecomputing.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241209072020.4743-2-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_231742_083513_A9E98DF1 
X-CRM114-Status: GOOD (  25.31  )
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

Hello Huang,

On 12/9/24 12:50, Huang Shijie wrote:
>>From Documentation/admin-guide/kernel-parameters.txt:
> 	rodata=		[KNL,EARLY]
> 		on	Mark read-only kernel memory as read-only (default).
> 
> So "rodata=on" is the default.
> 
> But the current code does not follow the document, it makes "rodata=full"
> as the default.
> 
> This patch refactors the "rodata=xxx" :
>       1.) Make rodata=on behaviour be the original rodata=full.
>           (Drop the original rodata=full.)
>       2.) Introduce "rodata=noalias" which is the original "rodata=on"
>       3.) Add more comment for arch_parse_debug_rodata(),
>           update kernel-parameters.txt.
> 
> After this patch, the rodata=on will be the default.

Could this commit message be reworded/reformatted something like the
following instead ? Although feel free to improve this as required.

-----------------------------------------------------------------------
As per admin guide documentation, "rodata=on" should be the default on
platforms. Documentation/admin-guide/kernel-parameters.txt describes
these options as

        rodata=         [KNL,EARLY]
                on      Mark read-only kernel memory as read-only (default).
                off     Leave read-only kernel memory writable for debugging.
                full    Mark read-only kernel memory and aliases as read-only
                        [arm64]

But on arm64 platform, "rodata=full" is the default instead. This patch
implements the following changes.

- Make "rodata=on" behaviour same as the original "rodata=full"
- Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
- Drop the original "rodata=full"
- Add comment for arch_parse_debug_rodata()
- Update kernel-parameters.txt as required

After this patch, the "rodata=on" will be the default on arm64 platform
as well.
-----------------------------------------------------------------------


> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  2 +-
>  arch/arm64/include/asm/setup.h                | 25 +++++++++++++++++--
>  2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a22b7e621007..51bce7b9d805 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5901,7 +5901,7 @@
>  	rodata=		[KNL,EARLY]
>  		on	Mark read-only kernel memory as read-only (default).
>  		off	Leave read-only kernel memory writable for debugging.
> -		full	Mark read-only kernel memory and aliases as read-only
> +		noalias	Use more block mappings,may have better performance.
>  		        [arm64]
>  
>  	rockchip.usb_uart
> diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
> index ba269a7a3201..b3063326b79a 100644
> --- a/arch/arm64/include/asm/setup.h
> +++ b/arch/arm64/include/asm/setup.h
> @@ -13,6 +13,27 @@
>  extern phys_addr_t __fdt_pointer __initdata;
>  extern u64 __cacheline_aligned boot_args[4];
>  
> +/*
> + * rodata=on (default):
> + *    Apply read-only attributes of VM areas to the linear alias of
> + *    the backing pages as well. This prevents code or read-only data
> + *    from being modified (inadvertently or intentionally) via another
> + *    mapping of the same memory page.
> + *
> + *    This requires the linear region to be mapped down to pages,
> + *    which may adversely affect performance in some cases.
> + *
> + * rodata=off:
> + *    It provides us more block mappings and contiguous hits
> + *    to map the linear region which minimize the TLB footprint.
> + *    Leave read-only kernel memory writable for debugging.
> + *
> + * rodata=noalias:
> + *    It provides us more block mappings and contiguous hits
> + *    to map the linear region which minimize the TLB footprint.
> + *    And the linear aliases of pages belonging to read-only mappings
> + *    in vmalloc region are also marked as read-only.
> + */

Reformatted and cleaned up the above comment a bit but feel free to
improve it further.

/*
 * rodata=on (default)
 *
 *    This applies read-only attributes to VM areas and to the linear
 *    alias of the backing pages as well. This prevents code or read-
 *    only data from being modified (inadvertently or intentionally),
 *    via another mapping for the same memory page.
 *
 *    But this might cause linear map region to be mapped down to base
 *    pages, which may adversely affect performance in some cases.
 *
 * rodata=off
 *
 *    This provides more block mappings and contiguous hints for linear
 *    map region which would minimize TLB footprint. This also leaves
 *    read-only kernel memory writable for debugging.
 *
 * rodata=noalias
 *
 *    This provides more block mappings and contiguous hints for linear
 *    map region which would minimize TLB footprint. Linear aliases of
 *    pages belonging to read-only mappings in vmalloc region are also
 *    marked as read-only.


>  static inline bool arch_parse_debug_rodata(char *arg)
>  {
>  	extern bool rodata_enabled;
> @@ -21,7 +42,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>  	if (!arg)
>  		return false;
>  
> -	if (!strcmp(arg, "full")) {
> +	if (!strcmp(arg, "on")) {
>  		rodata_enabled = rodata_full = true;
>  		return true;
>  	}
> @@ -31,7 +52,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>  		return true;
>  	}
>  
> -	if (!strcmp(arg, "on")) {
> +	if (!strcmp(arg, "noalias")) {
>  		rodata_enabled = true;
>  		rodata_full = false;
>  		return true;


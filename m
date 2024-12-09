Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362CEE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w053HDzeJoceX0UAdLDZfmalC9qVxGWs15WdZIxBXrw=; b=1aPGCTNW/XBgCk2Mv26LrKkuUF
	qzsINlUjG0QyftcqEewiEzD3L3rswwGxKkI/6Hvety+UE1baoupM2ZZpvzp//1UN3/Za6dWigDvgb
	+S1Ym3B/WM3kxx9b2Owrwwd/GxZPrdHTyh5UY+EZ2B1pVShL1Czz3aQ4yD8vy2yNK+wYl7nTrHmQN
	l4Zxvjv79eFaADtjaY2olusajHqmcUisebzIKCSNHcXaPq30MOhiVOrIg1TnXohdnZMc8e03C4QPb
	Qiwm6n9YnUKDmYenKYe6l2jMqt9YNaQr244ngrDApHnrTq3+KqgDa+G6ZsNsyDEkbxnlqYHP2DogR
	EcvTtBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhLN-00000008hOY-2PEq;
	Mon, 09 Dec 2024 17:14:49 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhKL-00000008hHo-0DXO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1733763904;
	bh=NOQvmRjMxuixDwXhq0ZtvQv1134vT7qqg7jES3HNwME=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rbVJR35wrs+kQ237ujRbc5WO8rAh1S++7Ll7LqO0QvG4J9kx30dlHYLCWlZ9l8Ko0
	 ZU41JJrqsNP6C6YduE8yz18uNEwLp3+zD+ylA9UnkKNgO/jLPBw6Vr6DCXQU2/MAW+
	 mgDEYqiYbFZDyuPrMAOsJo0qxIM3O/9PHevDVczc=
Received: by gentwo.org (Postfix, from userid 1003)
	id 4EF3140737; Mon,  9 Dec 2024 09:05:04 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 4D5E54018F;
	Mon,  9 Dec 2024 09:05:04 -0800 (PST)
Date: Mon, 9 Dec 2024 09:05:04 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Huang Shijie <shijie@os.amperecomputing.com>
cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com, 
    corbet@lwn.net, patches@amperecomputing.com, akpm@linux-foundation.org, 
    thuth@redhat.com, rostedt@goodmis.org, xiongwei.song@windriver.com, 
    ardb@kernel.org, inux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] arm64: refactor the rodata=xxx
In-Reply-To: <20241209072020.4743-2-shijie@os.amperecomputing.com>
Message-ID: <83d01335-c6be-d17b-511a-378ce3ad0663@gentwo.org>
References: <20241209072020.4743-1-shijie@os.amperecomputing.com> <20241209072020.4743-2-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_091345_129531_AAC2E7B4 
X-CRM114-Status: GOOD (  18.44  )
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

On Mon, 9 Dec 2024, Huang Shijie wrote:

> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5901,7 +5901,7 @@
>  	rodata=		[KNL,EARLY]
>  		on	Mark read-only kernel memory as read-only (default).
>  		off	Leave read-only kernel memory writable for debugging.
> -		full	Mark read-only kernel memory and aliases as read-only
> +		noalias	Use more block mappings,may have better performance.
>  		        [arm64]

Maybe use
		noalias Do not check aliases in order to allow larger kernel page
                        sizes on a platforms without FEAT_BBM2 support[arm64])

instead?

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
>


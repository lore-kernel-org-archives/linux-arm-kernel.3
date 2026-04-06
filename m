Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B7FF46C66
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umdfzPYe5UYw57GSr1FJjZ8H+6rmeeqO+4eLZHs1fic=; b=2F9hrzxQbtV/6w8NPogz0T38bI
	M6rAK1o0hGoyS6G45OHf4LCJd9JJwWXQxpkSItMudKpKg/OoMOsaSOlQLqehKs57aDuC4EJDaWk/s
	g4w0EHb/SgWqffW+vJI4U8FHkhSrI0/AB1u8kv9YE+jk7jxcpJ0u8veQ1dw4hbuffW7vO6J0h2ZiX
	HyGVzW9tCQMg6y05nVUKaVFLSpU6rG7PMdrjOEp/XXdOp/fyv6ZMRiVCSlLMCEE80hMOH8gnHKiGv
	DYfwWpnSQ6qBPh3xiihSgETGfEkiIcMbtCifjwwUTMtw4AgDjBci3oNXa6rjSFixob5yuQR/n9WvE
	g9y4rwwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9o1P-00000005N4u-3nh9;
	Mon, 06 Apr 2026 17:46:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9o1N-00000005N4O-3ktA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 17:45:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06B3960103;
	Mon,  6 Apr 2026 17:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A70C4CEF7;
	Mon,  6 Apr 2026 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775497556;
	bh=eGWDO6+7WjkWzY6Nuvk55mQI2p6QMYb3HOtGf9ZPtvs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hUoM9ayNjSVoFMJafY8c5o6aAvUJb/dRfyfVfa9S9mwp4NqtU+js5Y3gVVoICyhyv
	 Arw9WZw193LcuzHf4v0Zbc4ovk11fUbqcWx59M3vbvYoquPnBXUrzbQFShQsznjNxE
	 b8rcoh1/+vDJnJQc+cIcMFjBKHFNlk5DHKM3nTj6tBQSTfRnG9+tbWv0kJuMF75W23
	 iRVbRHKq0aJTgHoTKWSd3d2qhDq+B5U7yGz1NOoduP/aGfPTW1sVsZHzEnnAa+tInQ
	 SA+sZK/dRcPRjiF4SIuGLFvICDGgbw1flUV4Mo60kWTqAd/uATN0RV8ms07d3Z47Cc
	 kUTMIxPcVLbXw==
Date: Mon, 6 Apr 2026 10:45:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, jgross@suse.com
Subject: Re: [PATCH v2] ARM: xen: validate hypervisor compatible before
 parsing its version
In-Reply-To: <20260405094005.5-arm-xen-v2-pengpeng@iscas.ac.cn>
Message-ID: <alpine.DEB.2.22.394.2604061045310.2873990@ubuntu-linux-20-04-desktop>
References: <20260403111502.2-dt-arm-xen-pengpeng@iscas.ac.cn> <20260405094005.5-arm-xen-v2-pengpeng@iscas.ac.cn>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sun, 5 Apr 2026, Pengpeng Hou wrote:
> fdt_find_hyper_node() reads the raw compatible property and then derives
> hyper_node.version from a prefix match before later printing it with %s.
> Flat DT properties are external boot input, and this path does not prove
> that the first compatible entry is NUL-terminated within the returned
> property length.
> 
> Keep the existing flat-DT lookup path, but verify that the first
> compatible entry terminates within the returned property length before
> deriving the version suffix from it.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v1:
> - keep `of_get_flat_dt_prop()` instead of switching to `fdt_stringlist_get()`
> - validate the first compatible entry with bounded `strnlen()`
> 
>  arch/arm/xen/enlighten.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 4feed2c2..25a0ce3b 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -218,8 +218,9 @@ static __initdata struct {
>  static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  				      int depth, void *data)
>  {
> -	const void *s = NULL;
> +	const char *s = NULL;
>  	int len;
> +	size_t prefix_len = strlen(hyper_node.prefix);
>  
>  	if (depth != 1 || strcmp(uname, "hypervisor") != 0)
>  		return 0;
> @@ -228,9 +229,10 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  		hyper_node.found = true;
>  
>  	s = of_get_flat_dt_prop(node, "compatible", &len);
> -	if (strlen(hyper_node.prefix) + 3  < len &&
> -	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
> -		hyper_node.version = s + strlen(hyper_node.prefix);
> +	if (s && len > 0 && strnlen(s, len) < len &&
> +	    len > prefix_len + 3 &&
> +	    !strncmp(hyper_node.prefix, s, prefix_len))
> +		hyper_node.version = s + prefix_len;
>  
>  	/*
>  	 * Check if Xen supports EFI by checking whether there is the
> -- 
> 2.50.1
> 


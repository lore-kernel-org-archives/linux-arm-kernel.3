Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476CEE88D6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 23:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tuua3MHnd3lXwIfhjuKhBB4mlRycT0J7rogmu0HQ/Rg=; b=E0ZS+lTlRkV9AzFFXBTpc5pAU9
	rlrJOPvvWTdtViXwiUt4TNoWUmsrGpSr2dDCo6qej4Yq/thymFBDcqlqzaNbrik/pnz3oN1ysJJes
	OSa/z3sSJFs0niOt+zhFVF6rgwLbC7w9uXmgjtjk+tngX+hiGg3RW6Z94HihBeY/gssLZuw1d6v5H
	iJxizgSSS/97cMilDe3Yezcwi6Srr0vvRlOnkladn4fdOQkPBSx53fCCd20vb1sYZUBzuJSdkYxoU
	GNMT902sNoY1hL6ZhiZHMlVH1nONy4Dp6SBI3ot8QVFnchv3IrsXYfXrVw3W0o3pXcme8T92oDaR8
	dn3mfQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8oF9-00000002k1k-0bK3;
	Fri, 03 Apr 2026 23:48:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8oF7-00000002k1L-1Tsa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 23:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D209643BAA;
	Fri,  3 Apr 2026 23:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134E6C4CEF7;
	Fri,  3 Apr 2026 23:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775260078;
	bh=A/UuuA1NVFkJMO81wS0G58dAgB2oCFTP3hEqag6xc8c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GJl0pGY4rSCZdff2BVZvDGgyy/PfbnKnWwsgH/4L92t8PypTgMmGCNS58Ab86tTra
	 5NKgnGl1oFDIfLg5xe7Yf3J2iHFHk1dG/uQJIpLQZCr7OY69AvYjJbzqUvwIG5ryxW
	 /zHLZ7IKxVrKRxpWHSJqMKRfyYiC4zkjF00C+Mr/fAQNgp5PD7J8FsmEdIv0nrnPJ7
	 oyCUPGhqIjOsXeb7MNN/AuSy3sJrTQrP8nqmEA0x2ct7z32sJgecpC+AMcB8jxGYdN
	 F8GCcJKKje1tvzAR8OCYbqtAHMk2ve3lIHaBQZiOZtuhLaglBgnEPpP4XEeXVnmdWS
	 Jga7pSoh180UQ==
Date: Fri, 3 Apr 2026 16:47:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: xen: validate hypervisor compatible before parsing
 its version
In-Reply-To: <20260403151502.2-dt-arm-xen-resend-pengpeng@iscas.ac.cn>
Message-ID: <alpine.DEB.2.22.394.2604031637130.2873990@ubuntu-linux-20-04-desktop>
References: <20260403151502.2-dt-arm-xen-resend-pengpeng@iscas.ac.cn>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_164801_417728_4FEC2831 
X-CRM114-Status: GOOD (  19.85  )
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

On Fri, 3 Apr 2026, Pengpeng Hou wrote:
> fdt_find_hyper_node() reads the raw compatible property and then
> derives hyper_node.version from a prefix match before later printing it
> with %s. Flat DT properties are external boot input, and this path does
> not prove that the compatible string is NUL-terminated within its
> declared bounds.
> 
> Fetch the first compatible entry with fdt_stringlist_get() so malformed
> unterminated properties are rejected before the version suffix is
> parsed.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/arm/xen/enlighten.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 4feed2c2498d..f69290a4c639 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -19,6 +19,7 @@
>  #include <asm/efi.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/libfdt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> @@ -218,8 +219,9 @@ static __initdata struct {
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
> @@ -227,10 +229,10 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>  	if (of_flat_dt_is_compatible(node, hyper_node.compat))
>  		hyper_node.found = true;
>  
> -	s = of_get_flat_dt_prop(node, "compatible", &len);
> -	if (strlen(hyper_node.prefix) + 3  < len &&
> -	    !strncmp(hyper_node.prefix, s, strlen(hyper_node.prefix)))
> -		hyper_node.version = s + strlen(hyper_node.prefix);
> +	s = fdt_stringlist_get(initial_boot_params, node, "compatible", 0, &len);
> +	if (s && len > prefix_len + 2 &&
> +	    !strncmp(hyper_node.prefix, s, prefix_len))
> +		hyper_node.version = s + prefix_len;

I'd prefer to go with:

  s = of_get_flat_dt_prop(node, "compatible", &len);
  if (s && len > 0 && strnlen(s, len) < len &&
      len > prefix_len + 3 &&
      !strncmp(hyper_node.prefix, s, prefix_len))



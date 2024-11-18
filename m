Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28754D4920F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 11:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DkSUVJZ6u6JrGCcnVNQfAy6eJw+uQUm24vGODUv3z4=; b=RitaMmzzCWoPkHuSAklnFJZ15z
	xZt+viTBkEoe5UpkNm7MKCjvbIX7A4iYFaenTgTvzA5z0Kj2yGxZP+cJkDN3jTqaA3W3R8lbh7KJY
	FbFValWl9+bfcd7X9Fs7fW3TJSayQocx6IP9hQfd3Svnp2rN9M7F9oEXgyG7LQxn8E0AJXCvj/hod
	8MCiWmQ0b+10PMrjUzGMOSou51DO4xgJITIjIUBeWAHPDFvponmu7C7CwhEdVefCStzR3tezN7O4Z
	XcY9BbaEiS4grNUfRLkSQcSv+0/mW2uH3SzCVyOaQSdgxjiYHnMAaDM/bwlYylWLPHl5N3EwHpM+6
	rC1XK0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0OH-00000009Klp-1xZO;
	Mon, 18 Nov 2024 11:58:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD0NJ-00000009KgX-3so5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 11:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3B09AA40CB4;
	Mon, 18 Nov 2024 11:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03432C4CED6;
	Mon, 18 Nov 2024 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731931020;
	bh=q64Cj5gfNQRbm22pEVpRN+2YfLJFUaDCOEu7yxyDpjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KizvJHfFWezkiBD+AQdhr9vC6oTyUJ8HX5Thl81gGGqJ1GE899miak+4/8zMn/jPi
	 Zjd+qCINlEfZBtnny2Z3UH57R2G8tKIURo3tYjmQTdhGlT3yI6EnYo1RCkRLVNFyd4
	 EXEcjc2WDIeFO5pjRqiw7W5VIpsVtdhA6b1OGVEGMVC9JvsS7nakHBQ/uY/U8id8kG
	 8naWjvNILiXv/R3lL8xP5qHNCVE+Br8d2eaF89Qgt+aQTjmt8LAhxxT9sGyz4l26UK
	 1eOLG6NU42hm5GpC+pp/DLpmmSzY7ucuukSZtfmRhtozM55+2x2y7yPr4KlMMkHuU8
	 Y0WTu85KQhGgg==
Date: Mon, 18 Nov 2024 11:56:55 +0000
From: Will Deacon <will@kernel.org>
To: Gax-c <zichenxie0106@gmail.com>
Cc: catalin.marinas@arm.com, robin.murphy@arm.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, chenyuan0y@gmail.com,
	zzjas98@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: uaccess: Restrict user access to kernel memory in
 __copy_user_flushcache()
Message-ID: <20241118115654.GA27696@willie-the-truck>
References: <20241115205206.17678-1-zichenxie0106@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115205206.17678-1-zichenxie0106@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_035702_022482_06152A31 
X-CRM114-Status: GOOD (  19.08  )
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

On Fri, Nov 15, 2024 at 02:52:07PM -0600, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> raw_copy_from_user() do not call access_ok(), so this code allowed
> userspace to access any virtual memory address. Change it to
> copy_from_user().

How can you access *any* virtual memory address, given that we force the
address to map userspace via __uaccess_mask_ptr()?

> Fixes: 9e94fdade4d8 ("arm64: uaccess: simplify __copy_user_flushcache()")

I don't think that commit changed the semantics of the code, so if it's
broken then I think it was broken before that change as well.

> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/lib/uaccess_flushcache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/lib/uaccess_flushcache.c b/arch/arm64/lib/uaccess_flushcache.c
> index 7510d1a23124..fb138a3934db 100644
> --- a/arch/arm64/lib/uaccess_flushcache.c
> +++ b/arch/arm64/lib/uaccess_flushcache.c
> @@ -24,7 +24,7 @@ unsigned long __copy_user_flushcache(void *to, const void __user *from,
>  {
>  	unsigned long rc;
>  
> -	rc = raw_copy_from_user(to, from, n);
> +	rc = copy_from_user(to, from, n);

Does anybody actually call this with an unchecked user address?

From a quick look, there are two callers of _copy_from_iter_flushcache():

  1. pmem_recovery_write() - looks like it's using a kernel address?

  2. dax_copy_from_iter() - has a comment saying the address was already
                            checked in vfs_write().

What am I missing? It also looks like x86 elides the check.

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A15CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnQ9RgKaNsNwcPR6h/jF/G5/iqFMlMJPbSMjyRrPPH4=; b=Oqqvet20pD6CwkJ1WjDiqtZP/g
	bcwYdCNZEO/3OKEscFuUwds6PooGV3O2sImI2dNpOT0BBJ3OIl3X3JzAnE4KHUSSDMXPOQvmzYUkT
	Jf8ZWiobhfb1ddRpEz1CxMXBV9UjkBU6/2g07hFXG94JrJJKn9wZxlKqyoN0qW6eoNnHvl7i5pTEj
	9Nfrd6LWvTwh74aFrJIxeHmDrGIjKUPs6JEdqeFwumIoDLJfAquQ1I1t6ITwa2IGXqXQGM5ic3KE9
	dCSBi9+LeQ1eSl1VcdCqT29QXOUelw9V/c/Z9e8l7FNrU2jSQU+8Ppumdj6xasO7RAyGBhJureuBq
	lml6MCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRk9-0000000GpuW-1eqK;
	Mon, 25 May 2026 09:37:05 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRk6-0000000GptQ-3XQx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:37:04 +0000
Date: Mon, 25 May 2026 11:36:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779701819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnQ9RgKaNsNwcPR6h/jF/G5/iqFMlMJPbSMjyRrPPH4=;
	b=ITEMvkyDepRUxpz/GvZIhxeNE12ljx8AEJKrhfQFdjpCLScZUyQDwT6EyTn0jSXOFpA7Rl
	Ajlz9d93Bm+4vISbWdPlhs+tgCByaY8hjvCcXavxCCLUXYUz0JQc5Q+b5Sr+7cemVztqJJ
	DQuXt/L/vS74HSE4SvuY+sf18h5kBsE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] stm class: Replace kmalloc + copy_from_user
 with memdup_user
Message-ID: <ahQYM0LA_-4yHToW@linux.dev>
References: <20260402165933.895706-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402165933.895706-4-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_023703_031864_E6D5025D 
X-CRM114-Status: GOOD (  15.09  )
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

Gentle ping?

On Thu, Apr 02, 2026 at 06:59:35PM +0200, Thorsten Blum wrote:
> Replace kmalloc() followed by copy_from_user() with memdup_user() to
> simplify and improve stm_char_write().
> 
> Allocate and copy only 'count' bytes instead of 'count + 1' since the
> extra byte is unused.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/hwtracing/stm/core.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 37584e786bb5..49791024bb86 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -645,15 +645,9 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
>  			return err;
>  	}
>  
> -	kbuf = kmalloc(count + 1, GFP_KERNEL);
> -	if (!kbuf)
> -		return -ENOMEM;
> -
> -	err = copy_from_user(kbuf, buf, count);
> -	if (err) {
> -		kfree(kbuf);
> -		return -EFAULT;
> -	}
> +	kbuf = memdup_user(buf, count);
> +	if (IS_ERR(kbuf))
> +		return PTR_ERR(kbuf);
>  
>  	pm_runtime_get_sync(&stm->dev);
>  


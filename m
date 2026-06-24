Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4132DCDB471
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZbMotHgAD6jel0fNJNyUErzOCiB1TTJiURnxn+giCc=; b=4mhuCwYMgAl9CGl86Nf7/ox3Y4
	C/DixueTjjwI6FaFKHQDauaJOovkQ0wWlz6Cn1cDM9PU61GfqsTm8uFNlT94Iho8lCxRQxwJuoTCf
	KG6W8aE7JgA8/vT/NaqfOfId1mPQBjwrwcudDI0n+2XrExLsMTWtRhEnpjIXKdQY6TJoqPqcKCTHG
	JPGdyFBsNVFKVBGCnc17dMyH4pCZjGGC8ft+w6odVFb8GjOoozrJJbRQlhe0ScHozgtxREswy9HWO
	Z6FZb2yiedOIhHn8bDUrZl+QgXxexO7cZbDyTBJPrULUC/+5Y2CWugHVrChr1ZJ6nsAzZajMkSbpT
	97Fxp6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM7u-00000007iAO-2WI3;
	Wed, 24 Jun 2026 11:50:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM7r-00000007i8r-3t8Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 11:50:41 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c07fd4dc2c8so96366966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782301837; x=1782906637; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZbMotHgAD6jel0fNJNyUErzOCiB1TTJiURnxn+giCc=;
        b=rsfPY5Lb8FVXFfiOhLhTm4ctMFoixsoE66T0xHckz8mFcXYYid3LIQPsMSBo2tfVsU
         JkO+uKNmI574Z8IcatVy9sbxW5ttYuR64jYTFCsrgC8bOp5xfn/ZByE2gopP3I+LddVL
         FRmjQn9/9QBozMFcS6785ZaE9MjazA2gxrA5k/J0w/jY81CCOkxCwh1Vg5D47eFAfbxi
         /F+hqXf9jEElmXqWGkh7U1WQZdIFCGT0QKNI9u3YQCIo4hJAwy9IhXfQg5yAhR9ipDg+
         maUnIvaugN2H5CExrMlpiAER19qsDfwqZfxgCtEaKGTQ2fc3P64mQ/7HgMdqFrNp8nqN
         R9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782301837; x=1782906637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZbMotHgAD6jel0fNJNyUErzOCiB1TTJiURnxn+giCc=;
        b=lndgFp496jfb+SnmOxvumFX7bfeF0uN9VR8jTLYCyQrhqf3LFdker9gj6p0zQov6Xd
         ReGXv8B1AEAWoJKvc53fTa8Qa7TyVzMcIcIaCjnFIwarF72L95U+rGzCir6Fx26CfO7J
         KNpP91/3KZRz7M2f33heNJAbvICfEVhRGlqSBtak/tvpWISqgXh0y+nIC9EVNWmrdKj5
         XZNwM8k/MeV9nnh59NmZUVpl7LulU6gRPfaHj2yag0VRNVGFBjmgM97iJhhqs/Q/pi2R
         OzhckKuW5RBmc2PGhqpX6A9p2jZK0f9ZPpJN1gjTuJM4m6B4re5H8hi8xgCUV6uuPTgQ
         Iupg==
X-Forwarded-Encrypted: i=1; AFNElJ8loWQpFuyc4chEmwlCkOOwL5uuh4YoKmejY4kJOnel/zrxWDGWkHcFndoNDRAhFUezkDvxax3zLcyK1edi9pz7@lists.infradead.org
X-Gm-Message-State: AOJu0YwRVL0o4pldKOR9nlwAPNquLGf7s1nTrfjpcq/I6xxN0a7s0U0O
	DZ7x13AeQRgfLMrEy6wgOjNxkLNzjML04Soa3Jk06vtDAq7qUMqXQlZ8
X-Gm-Gg: AfdE7cnVsrXNx7rS6TuSirMC/Gau93hg9Nau3q6yfQZQcMfAzldO+0esbmTvzWFoESQ
	0cGtmd2gcYU3ClUWYYkV7/JDFwRRWF02q0J5vbLxyp715TMHV4dLm03Xw6fOA+D4NXHrht74ts0
	4VQuwPmT+mXS1VInH5HVOJOhGc8e3QMD319QKRRfb6tpUvGGdqR5bqvtchPRsGaRQRh8ey8XB77
	AGNPAfGrEkZ0UY+XoAh4utuPHUSXzIjVAAO/ZgxdCNlaCUFti3poU9flfCdLzc66WEPKYA05in+
	VN9z1KBjKwhFXIKfq2+CgMW+DhdAB5S4osHoBJkdKAOAM3uuctBGSDicL5kgo2rSlULITaxC/mX
	hw0bWK5D20T41l14xZt60wfenU8vl3tdZYPALMa6xWRNwaNPEf6mGwFdunjO73dP1sOzzOJjp0B
	xTpi9EIg5z
X-Received: by 2002:a17:907:9719:b0:c0d:8c04:92d0 with SMTP id a640c23a62f3a-c119f6127cdmr148307466b.49.1782301836889;
        Wed, 24 Jun 2026 04:50:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161f195sm656749866b.63.2026.06.24.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:50:36 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:50:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: mripard@kernel.org, paulk@sys-base.io, mchehab@kernel.org,
	gregkh@linuxfoundation.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org, hverkuil@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
	zilin@seu.edu.cn, stable@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: fix memory leak in cedrus_init_ctrls()
Message-ID: <ajvEiDkI_CcXUz4_@stanley.mountain>
References: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_045039_975919_2CFC028B 
X-CRM114-Status: GOOD (  16.24  )
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

On Wed, Jun 24, 2026 at 04:59:20PM +0800, Dawei Feng wrote:
> In cedrus_init_ctrls(), the V4L2 control handler is initialized before
> allocating memory for ctx->ctrls. If this allocation fails, the function
> returns -ENOMEM without freeing the previously allocated handler
> resources, leading to a memory leak.
> 
> Fix this by calling v4l2_ctrl_handler_free() on the ctx->ctrls allocation
> failure path.
> 
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1.1.
> 
> An x86_64 allyesconfig build showed no new warnings. As we do not have an
> Allwinner SoC or board with a Cedrus VPU available to test with, no
> runtime testing was able to be performed.
> 
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> ---

Looks good.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter



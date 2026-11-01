Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C909A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJepCpDU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEB8z/uT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zz0SgYmzMlFmYbvywWRdsNJhbZCdEWF94qrr5u2SZBg=; b=HJepCpDUotSyaQHjEPxyjE2jvB
	YPK+W6aNbA1hO5+siDLPKauFC11UE2slck0Xj2y/BQvPFYBFkiiXjrEnaT3b9/tnpDS3TNDHwElvU
	Hd4sXMzCNdhwYBAE3Y4BD//BzjhD8F8iwzTZtdTqVUEImCPxiFU5tCzHn2sN8WibM7/F+RB7hw4vh
	fIgwsdg5/GEhqq0sZrsy3WBgQIDWxwAKDnRW1e7QeKuiKNUZ0KcpNTlCjqYGUXNSVN0FQLRROjZuy
	9f28m5ULtF4Rwi5cUi8fwbXbYji1HtOjIIeGGnkurKP7eBMD1/6BoVJlwX2YA8YPJ0rPI763Q5PKI
	bs6g/iQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDn-0000000FA4e-3EeB;
	Sun, 01 Nov 2026 22:40:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeDm-0000000FA3i-2HOb;
	Sun, 01 Nov 2026 22:40:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 470454176C;
	Sun,  1 Nov 2026 22:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB1F1F000C1;
	Sun,  1 Nov 2026 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572814;
	bh=zz0SgYmzMlFmYbvywWRdsNJhbZCdEWF94qrr5u2SZBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GEB8z/uTQp1CRy8jvIiM4D3Tva+bUAi1CqUQ0LJdgHgywDg9ZzPO89IQ2YwunLrrF
	 nBWDsAqeAwEYkB46xe1aKwLJX3/z+lQNcuikoGXr/s7iAD/tMEsGz8yow3dfHuxrSA
	 jnGt1Trhrslmy3Pc6x/bog8KFbtwtcoqyubFtmRqiGv80+Gwjww9G6Gh7JWHk/XVul
	 U510JibNyuI59Yw4IYoDvfGa1iqvUs4M4UtTRoV9PXYmpYrevq+Me1QZEwWFijEypH
	 yHCbYQo8ScidZSHAePpYaXp8w68yVMG8ulLtKqFEFBBP626Y0Gup3lDRAV8OO0hQt/
	 86TTR7aRak/TA==
Date: Sun, 1 Nov 2026 15:40:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Fix "no-cfi indirect
 call" warning
Message-ID: <20261101224008.GA910831@ax162>
References: <20261101095538.1046918-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101095538.1046918-1-l.scorcia@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 10:55:31AM +0100, Luca Leonardo Scorcia wrote:
> After converting the driver to OF probing, kernel-test-robot reported the
> following new warning:
> 
> vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi indirect call!
> 
> This occurs because of_device_get_match_data() returns NULL when
> CONFIG_OF is disabled, which results in LLVM dropping the kCFI setup
> since it knows that there is no valid target for this call. Adding a
> check for a NULL timer_init avoids the warning and it makes the probe
> more robust since of_device_get_match_data() could return NULL even
> when CONFIG_OF=y.
> 
> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610290223.iOEGeDs2-lkp@intel.com/
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/clocksource/timer-mediatek.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 842d6ee4259e..e772f5fe8742 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -353,6 +353,9 @@ static int mtk_timer_probe(struct platform_device *pdev)
>  	int (*timer_init)(struct platform_device *pdev);
>  
>  	timer_init = of_device_get_match_data(&pdev->dev);
> +	if (!timer_init)
> +		return -ENODEV;
> +
>  	return timer_init(pdev);
>  }
>  
> -- 
> 2.43.0
> 

-- 
Cheers,
Nathan


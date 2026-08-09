Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF76AC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTzrk2R8kv6gXqCQ/BV0ySdWUtQekk7wApQHuKS3F5E=; b=P45wAubIcPIr/JBv/VHr3XTR6f
	osK5ZN0wj8E4PE31k/uzcneV4GPPz+2+sc5F/l9DTEtWUlt5Wdjv3+dmr7HD2DZhM2cCiva80PzZo
	j1pYKS6WBYaNRT5TepgfDAfquC2CpHT5fh384IiCqeHokWp5J8nbWWIpon/kqPyrvQQkRiAVj7I28
	mVCPcdBmi+ZW9UwLZQ0JGwEgnM8OyD3fzbrisCCln72SKxwTgIcit2/OeCCGop0Hp7MfTeoI4h/Bz
	de3xwY1JdHIyZULo5+dFlIJA8XCPD2kmq0FgWHoLIDMvrtquEVBVaSkeOWUhH1NYm+fl3Xr6UEgVL
	OyN1SLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt50j-0000000APtf-1H00;
	Sun, 09 Aug 2026 15:00:25 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt50g-0000000APtB-1jPF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 15:00:23 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cbe3fed2f58so752148a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 08:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786287621; x=1786892421; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lTzrk2R8kv6gXqCQ/BV0ySdWUtQekk7wApQHuKS3F5E=;
        b=rULfbmV0J3IxmZZe34KB9sjB1e3XLX01GCXUZ6t4CDjBIattZq4zNthFvEEyusLOsZ
         3bCuyF71JE6O1VMxzasUSAqYJcdtURPnClSsiOgdsG5sbyE+yNsixQ66XeboCmlzz2Up
         M5qolEnEmRYozHRGGq89R02K02XAcCkDnvb8Hw9EUYhUUAb8TM8ouo76PWc1Me6xUlmr
         /inmkP3MM6pULWhqreMV1GeNZPeeI2in+REA6kn3nPIoxSvaZzypJ7WvcLuVFOG/xJGB
         usIzq8WOKaLrFR23PiuQr7zVvXSyu9+Cwc3oPdhwpljPc3ibFl/jHn7HQ5dRYfS/3AgB
         cvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786287621; x=1786892421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTzrk2R8kv6gXqCQ/BV0ySdWUtQekk7wApQHuKS3F5E=;
        b=YrEObaiDXLvDucY/Pu1w2ikZf3KwOQZ7Vvj2Z4SFlwhbmYvh2Ze7cr9QMtX0sRg/7E
         2x6nLvd9VTedjYExcth1YwSi7wo07I9YWVEripdtkcReGLpe1ODrRjmeq175sdcCXYGy
         U9Y2t3Lva42aWVp9gUTJSVNxWucPqukTvsqwUgLgGgfGYc7i0V/36NSHq+3ZvoJVatqG
         NxlNIF4k/Z/+3JiLspLmSL7FoDmZj2cRkD53qTeeGBTnorv6dsGt3LK7TuyLT8bI2fEJ
         MYduqi5OBC9UVW97rMl/ejEiHEkcbZQW4FGXibSjWMA1cB3gcZU9teihnndHjFBQMGov
         brVg==
X-Forwarded-Encrypted: i=1; AHgh+RoDAGAFvGPQ9TBC7+Pm0l6LPLB/25FsU52GZFsf7Unc2qZ7nRZWzof/qxAOSv/4NXN4ysLkCJFwluX+RZXCIJO8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy836cMOi/ssBcLdocvvdjA98jZ1pHgPgcgHBmvTBeDSUbftT99
	6RBWE/1uhusR/32AgbACwxiaVcI6wBW+wQ14i6gFpJYTfAg2qrn1dBy+
X-Gm-Gg: AR+sD10R9H7Q6SbX3okXD5eMRGUb0AwqwGpSNdbgK75NSYxxA749E7kg4Ui4cE/4hUq
	Uijh9HFsmk9UEg7/Hby7anSXxsezkh+GmpLUPV7NE4T0WI9M66KrklrB/FWwW0U0UZtOYtSSTKZ
	xWS7di2NgxxUSq1wDhSM7RbwkrR8YepGFko4YbXV8tq6gv3Wd0jpgUfOpVzbGHw9GG/B6XpR19O
	smX+CjqrTBI1zvQu0UszphTH4wXkGONEk2+GpUfthiZtfZYRzMEiJZvijZKJHh48uu2QwJVOGlq
	4VGEOCW3nVL+BXrbCyumEILreQSoeHIPtPzh5jjG5x0vd6INXwaWrxCN9jLrq57P+xt0n9scMQY
	Xj40jsrRrpVne4hTQOkLM3jR2LJXEDfTSWJVu9myMktI+3FPZmK2nsXifFfsEEAOpf5zlOcI8XK
	ot4Xo6ZCZnTcacGRrz4toTqQ/hYu7dWXJoODNbjakyAljun5ItzljUlSMIEg/Y0Qe25P5e/kDSV
	JfTPjwaTc1vdA==
X-Received: by 2002:a05:6a20:6a1f:b0:3c6:61b9:917c with SMTP id adf61e73a8af0-3cb85e2b463mr38599908637.11.1786287620225;
        Sun, 09 Aug 2026 08:00:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm26361846c88.14.2026.08.09.08.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:00:19 -0700 (PDT)
Date: Sun, 9 Aug 2026 08:00:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Constify some structures
Message-ID: <50bec487-2900-47df-b9ae-0ff13791f4de@roeck-us.net>
References: <99019b7e560c2d9c087be340e68f9cce4db1988e.1786283336.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99019b7e560c2d9c087be340e68f9cce4db1988e.1786283336.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_080022_475741_FB027AE1 
X-CRM114-Status: GOOD (  11.94  )
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

On Sun, Aug 09, 2026 at 03:49:10PM +0200, Christophe JAILLET wrote:
> 'struct watchdog_ops' and 'struct watchdog_info' are not modified in this
> driver.
> 
> Constifying these structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7319	   1768	      0	   9087	   237f	drivers/watchdog/apple_wdt.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    7543	   1544	      0	   9087	   237f	drivers/watchdog/apple_wdt.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Thanks,
Guenter


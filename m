Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D446C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06G8DBL+yE+EwkMk4FIE8+EABcux+6ejNjNymvMveGU=; b=XJorw57BF5AhGjyUwSr1yLoYZX
	zB/CJbCqKCI+y1h/BPgv4sIzvQVMiWKE4h76qqVocgVGI7QhLtTq1sRHsnaUH73b5706lsT5Zn2/K
	lkpM97uV3lzKVjKGKfcX07HhpGWZLfbRKGMzYiVlbtgVZN5P2HQGfFjTzrz5iHHoRrkNaBS215uPR
	9lAB8YLbErInYGHqoQSDSPkh8gVFt0fLBDOnx/KDpn5VwRB2lnpdnKJdaPEBxuwnNXxXAotBanODv
	syQfPhrjIXIvRKrAWmSjjXOI91yYKEmBS/lMKHagzJhuqSi6fIAhMXW1aUTducU0aQfxt52HRTvqb
	ILHwTyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEA3S-00000007ZEB-2f1k;
	Sun, 11 May 2025 17:01:34 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9l4-00000007X9D-41bT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:42:39 +0000
Date: Sun, 11 May 2025 12:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1746981750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06G8DBL+yE+EwkMk4FIE8+EABcux+6ejNjNymvMveGU=;
	b=icTaweuOgQ1MYUdG58b9VuBfGvM0S8yMcRDmLZNfqTcgsShr1ALVEsujoabf9j48819oFV
	nRxcUiSrnTfpTrWykrRGl8Nb0vfh79/81Ykc/z/pKZ5SjMicf7SYdXkyRYtFrBuFAOag86
	Pb39WH7IQFBoYYWXsr+g4Ijyy+WOjGn+q0zKgBAyTM7v5zLxuxHIYmeSQkof9LZUzz72ql
	Tz4WpvzHXUa1Y26xBmKIljtKXAHxycR5qXXvSMSNKzcYrzxpzyzxeiDHIGTEY/zNxCfH9i
	jDhKn7IJ9hfaGGFO9aXer1EINtXujvOOJfqq30AmWy0nhGGacNR915zvkt/QFQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 04/10] soc: apple: rtkit: Make shmem_destroy optional
Message-ID: <aCDTcUtxPkXKK3lg@blossom>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
 <20250511-smc-6-15-v5-4-f5980bdb18bd@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511-smc-6-15-v5-4-f5980bdb18bd@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_094235_522547_06840E2C 
X-CRM114-Status: GOOD (  14.88  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sun , May 11, 2025 at 08:18:39AM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> shmem_destroy isn't always required for coprocessor-managed buffers but we
> still enforce that it exists. Just relax the check.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/soc/apple/rtkit.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index 5fffd0f003dc2f4f377faf96cce0c1ce4ff0b788..b8d4da147d23f7e99e76eea314e4d976cddbd1c6 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -279,8 +279,7 @@ static int apple_rtkit_common_rx_get_buffer(struct apple_rtkit *rtk,
>  	dev_dbg(rtk->dev, "RTKit: buffer request for 0x%zx bytes at %pad\n",
>  		buffer->size, &buffer->iova);
>  
> -	if (buffer->iova &&
> -	    (!rtk->ops->shmem_setup || !rtk->ops->shmem_destroy)) {
> +	if (buffer->iova && !rtk->ops->shmem_setup) {
>  		err = -EINVAL;
>  		goto error;
>  	}
> 
> -- 
> 2.34.1
> 
> 


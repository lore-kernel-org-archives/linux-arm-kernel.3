Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2320CC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25lW1olxCrNiyANiOxoyrikBwf6oNATnngWHhqIjQZk=; b=mE/81n/vNSjziyKUuvynDS7P17
	98WJyVjOqJdxmtUll6+DfL29ocu8pJdMBqpUsX5kc/O7YO42jYiWQuWQfvlu09HFL4Bz8xQ5+TC26
	H+k7QjHfbm0t8YAvScRbq5Q6/yWvoLuiVGT/W6vbZ0kepKHzH8hlW4TzXhcwABt080GJALKWQ1Ogb
	J6fwFVlSj3McK9MK/zgcXixASvHGU/Bo9BbdLm0WwvQHzM8qLkD7TSrBe8JJVgRAQWhacWYGwOZyg
	f0+Ovstpp37tEUwvMNVmDb3Rwq1gRulXHPNwpNztf3ffEep6ZHC3uU6xI2HeYUgUpriD3rkc9W5aa
	6qQuXcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcuU-0000000CfCV-3KrC;
	Wed, 22 Jul 2026 19:47:18 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmcuN-0000000CfC2-3Wcx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 19:47:16 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6a374c190beso4563214eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784749630; x=1785354430; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25lW1olxCrNiyANiOxoyrikBwf6oNATnngWHhqIjQZk=;
        b=aIToYYATMndoHGWDlG5Vr6zs1PomzmDy85Cc9Ki1SSLZs9sLEUa2dC/RD7u6SdYG35
         +uyCTEqjWRt4su13yWUToNx/COWv/S7DwrH+Zry+zBDjfH8jTL0JLtfMyZKvnodjY8ay
         AyYmWWWC/z+KziJ0nZDM6OqMyOKD3QOYB9f44fmFh7vJ1hFN7kJlCrX37R0dTx1KnF5W
         gRkvQdIKNlewfWSzNoNXTB2PJWTx82pML5LA4sTvo0mhyFG9T3SYRtH9/lkqwetSerkw
         07YuOrKrbBfsbwZkFEx9/fBpHAi6YJNNMr1JuM2JpiFlf/u6JQJ+wEpnYSCKT4bNQ8Aw
         XvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749630; x=1785354430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25lW1olxCrNiyANiOxoyrikBwf6oNATnngWHhqIjQZk=;
        b=GXb5SA4xAlOQPr8Lm5IA5zONQM966G7oE3NDTIK+F+8pxrghHGTJCFRGp8elyg7kDB
         15OYJfTlKu4jJ3b/wX8fXBLjCfQp4625hYa7ZXNYvBnEOo3bYq06a3AAQThvFjtMS+Jj
         A3mgVkAuV0ktnK+8TqqkwSkY3rmxOb0GhJXS8jiaef6Gv3ymv29WmIoYbabhZZ5QmbNr
         Obhtk+z8ASEbn8ulMZEvJ32WemZanrKTvugVK8BfA9MLrMLQsLbpX5hl+3zLmgMq8IK/
         19r7RbokgD7JjyBHcMb2Xm4zKyV1JmCr6ExSwS1zirh7ylKJskip31bYIU/9TFnAT6Pd
         LmpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp74srYCSqxlCfcVcj/DHhYwPLU7sLwvBAIQPAPkYo+2qvo5z6qMSLkbXuA992iuI0XkwyxrR6JBDdA2ClGS9YS@lists.infradead.org
X-Gm-Message-State: AOJu0YwITC2feGSs7YGVmpYsM2ZLSgSSFJ0jfrJZ/qcUxUqlAFB5GIFh
	oCniFh5246JKqCA5sbufr80FS3gvJYZT06vn9ruObyRFYiJSVgGyqMRvH6NRFNpMcMs=
X-Gm-Gg: AR+sD10HTHY3aTeIzlAf2VkoGMY0g369G9F7dJH8OSAKvmb/EESuAFnRoJhth8k3Llx
	/xkXyn5oZ3kJM3G19zpMpjExM9anqzNZibGOmEgYaPCoRsppcSBhCUY9/jFn/bzNRO1Rleby3fq
	VT/vtW3Gwt68NsZqGc7iQj2Y6Dhi5QsspBAT84lvS7Ye1TFpBnYGukKug5CvFHpl7xqGUe2HPqw
	RBKn4NfHfpTSQFxNxdFqmovU4UJzJrQ6tUhyjBWLneSe+qppbH5HJnb6TUeaO0nwZnHD4zHZu1Z
	tW+3Qz9rN7FpMMus0koGGPdA6m8YLyTn1R4sC1nX/4b9DfywFN7R6dALXz57WEW43thrpeBjYx/
	hx0/GOZmmDThEq1Xq4tPBSu7TWHR7tEXZH17rkG2qnnKNA9rvDYgRs+3VCALrysvKsOsbHGR8oT
	r7NNMOoP4KlzAEGRVK5F7R77Ff6OAIiIlHRXhBeEshzwocP74M9Q==
X-Received: by 2002:a05:6820:a28b:20b0:6aa:c665:e73c with SMTP id 006d021491bc7-6aac665f3a6mr1085425eaf.71.1784749629880;
        Wed, 22 Jul 2026 12:47:09 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:d067:7d1:556a:2be5? ([2600:8803:e7e4:500:d067:7d1:556a:2be5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aa76233e99sm2189786eaf.2.2026.07.22.12.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 12:47:09 -0700 (PDT)
Message-ID: <3314a217-5e6c-44cb-af8e-1327c375c4dd@baylibre.com>
Date: Wed, 22 Jul 2026 14:47:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: at91_adc: use const char * for DT string
 property
To: Amin GATTOUT <amin.gattout@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260722-master-v1-1-ab0591897e4b@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260722-master-v1-1-ab0591897e4b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_124711_892558_A41ECFF3 
X-CRM114-Status: GOOD (  16.23  )
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

On 7/22/26 2:39 PM, Amin GATTOUT wrote:
> Declare the local variable as const char * and remove the unnecessary cast
> when passing it to of_property_read_string().
> 
> Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
> ---
>  drivers/iio/adc/at91_adc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index f610ad729bf3..0ac74ad92fca 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -988,7 +988,7 @@ static int at91_adc_probe(struct platform_device *pdev)
>  	struct iio_dev *idev;
>  	struct at91_adc_state *st;
>  	u32 reg, prop;
> -	char *s;
> +	const char *s;
>  
>  	idev = devm_iio_device_alloc(&pdev->dev, sizeof(struct at91_adc_state));
>  	if (!idev)
> @@ -1023,7 +1023,7 @@ static int at91_adc_probe(struct platform_device *pdev)
>  
>  	st->res = st->caps->high_res_bits;
>  	if (st->caps->low_res_bits &&
> -	    !of_property_read_string(node, "atmel,adc-use-res", (const char **)&s)
> +	    !of_property_read_string(node, "atmel,adc-use-res", &s)
>  	    && !strcmp(s, "lowres"))
>  		st->res = st->caps->low_res_bits;
>  
> 
> ---
> base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
> change-id: 20260722-master-23179d7c00c4
> 
> Best regards,

Makes sense.

Reviewed-by: David Lechner <dlechner@baylibre.com>

Although perhaps could be simplified instead by using
of_property_match_string().


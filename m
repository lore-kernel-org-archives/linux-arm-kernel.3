Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0EEFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 08:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JA+E2OJoqNXeWdWbhpFOoKA8w/M6yXZ6Nq/L8Dy8vA=; b=YuXPsWD/1qTHkD8qiJ/VCe4OgR
	DgKT07/PGog57kQb7giWpRuk5U5vvtjPBw5ppi3RIZL1TT5JAd3nx5+6ZMw56DDvBwBJx/AgT25hy
	bYLlfPkijcR3y+jvcJiWu21P47JWskK1dHZj2b05YMrEhJZz7jTSKRa6fWFMH9eD7dn9WrBcFebyV
	3L7R6172y0kXZMtRZPScdnQD+h5UouWWAvpFk2PtZxq/0mI8GI9n1zGCdVFPTM9QzRaVqopIobhVU
	o8y9YzCClQ0d40HYPWNknsQ5gRyDttjVg0ApH5R7R24SgGY1IuR97BUNMdqIKF1h+jewhYU3/5ktx
	xipkA4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHe2-0000000GUOM-2GmB;
	Mon, 27 Apr 2026 08:48:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHe0-0000000GUNt-1O47
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 08:48:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43eb012ac4fso5980858f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777279722; x=1777884522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JA+E2OJoqNXeWdWbhpFOoKA8w/M6yXZ6Nq/L8Dy8vA=;
        b=G82WuSy8ONfyXcPYjeByZs37i3obxDBQMbBLDIQG/bixHs1GP1/0bX1RMlWSOu3Txw
         q8VzpSCjS2P+uWLMjmWtgLtpkHqCjaGr8ZwoihqIB/1YZ7CRxajM53KuGtdEV2VSKo1R
         aSt2yCfcS5eBDHKDS+VpkqDhEn4j+NH7h4TOZMXXH2bwIcJ/bt8cEsw9WBRSvY82cGN4
         TLNP+AkDWr9isLOyvxaM/AYULC5L4ITTld7JIP8Atz5Hi/JsIDxLEgD2TBqrK6VsMnNn
         YlZ7Rzk0IVewqMeVEQuHZsXdvMqpRmKoEHD8v/kriYZacKSKD6X7GN7PBRZIurQfka0x
         Q49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279722; x=1777884522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JA+E2OJoqNXeWdWbhpFOoKA8w/M6yXZ6Nq/L8Dy8vA=;
        b=UE4hVjyOePCvIvgp8ReW2LX4zyFRRTmhMyR9EPFP8u79ToVhQ6QxTO0JmKEI4CBQdh
         uvAwMBR7b4/pJowykkC3roHUa4e17Nxsafr3QhJ1tY5/enp8yzEXso10Pin314JIrCqe
         YC3eEIqiMePc6XN8IcTycdUnu6f2ZZDhlEK5i1e/KknJVpBzNhSc1AD8iOPLE5dqAo/6
         W1K1VS6Z+dJOUp6dbxpoNB78TLY+JO1G2GST8Bwfm3DGgixjtI0eZ39GGYTKfW/KLjKI
         k7LjFEMNd19dstrK7bipNCixBMn7KX7bwpU7OImU3eNmHYUZ7+lI47F+SL8eR7rInVHC
         NDlA==
X-Forwarded-Encrypted: i=1; AFNElJ/26jj+HmlpIEZ0XazuCiaT3iJgv2+B3JDs7xjrsMGCVvUXDEBaxZh/YnjBlvDYdW2FPt6b9UWD/E1CfQdT6T+S@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ5KLBBwilqWmx/3c34ydfUWsQ4F7ADtKIl5BxPUyThBaALxSt
	gJjzHzSmxKrBCjEptlZulqKLxldJj4KamUveIlwmtQy/u+oAVJjZk30Hyydk2wDmbf4=
X-Gm-Gg: AeBDieswJ6jpoEk9d5WmFrJLCeUmeEyIwFnb9wG+UCmRbPXDHcAgcL8CkIIBpvhJ7F6
	ct6aqXtZJebFw2e8PxPx0HPF4BB/BSAPrTdbCG8OG3QCZ+L9wcz+KyKuYjibKFl3DrFCYwWDzCU
	vlg1PxX59sTQ6bnNrtkFFNDXyuo2CcH3SeB0Eb/1oMGNJHip9d2/7UWxqbZhyYV4+FuB8i/XCq3
	cLkjcpBVc9fbtTJtCK+A/xBGv+efQ2Pcso8dfSxNqivcGy0PSSlKIFkZniNsFESYa5KE6DSRfJj
	ynTjTTTQMoHN6SUW4qQz9NJrF/jaWVerJwZkUwRU9ZPiv+CEvSu75fTQU34CuaGKnnQEVLxtlOd
	LqcmJYaGCs06cW1gE4u/+ZlgLlla6hUt+o5Y3aO4/JW4ECebIlr3qFDgXFapQcbLpd+Ac9pUbCt
	vRCAfWYFYrezyV80lnsVan8/epAxtd/WYiUmb7oSHjcTc=
X-Received: by 2002:a05:6000:184e:b0:43b:9a9f:8956 with SMTP id ffacd0b85a97d-43fe3e0715dmr63483116f8f.22.1777279721576;
        Mon, 27 Apr 2026 01:48:41 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm79702504f8f.13.2026.04.27.01.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 01:48:41 -0700 (PDT)
Message-ID: <84c292d8-d2a0-4c29-bd28-cc00f66c2f43@linaro.org>
Date: Mon, 27 Apr 2026 11:48:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: samsung: fix stale response flag in
 acpm_prepare_xfer()
To: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260426210255.73674-1-titouan.ameline@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260426210255.73674-1-titouan.ameline@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_014844_424014_146A64E1 
X-CRM114-Status: GOOD (  17.62  )
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

Hi,

Thanks for the patch!

On 4/27/26 12:02 AM, Titouan Ameline de Cadeville wrote:
> acpm_prepare_xfer() only ever set rx_data->response to true, never
> false. A reused sequence number slot could therefore inherit a stale
> true from a previous transfer that expected a response, causing
> acpm_get_rx() to enter the response-copy path for a fire-and-forget
> transfer whose rxd is NULL.
> 
> Unconditionally assign the correct boolean value so the slot is fully
> reset on every reuse.
> 

How did you find this?

Sashiko identified this too when reviewing the ACPM thermal patches.
I sent some fixes last week, where this bug is squashed as well:

https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org/T/#m1c32aa4c84ea7e3909bc8fe7599585b71e95d8b5


Thanks!
ta

> Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
> Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 16c46ed60837..2fee6bb60efc 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -380,8 +380,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
>  	/* Clear data for upcoming responses */
>  	rx_data = &achan->rx_data[achan->seqnum - 1];
>  	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
> -	if (xfer->rxd)
> -		rx_data->response = true;
> +	rx_data->response = !!xfer->rxd;
>  
>  	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
>  	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);



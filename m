Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A18CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHs5QmsAznY6JYFFT0GfFNt0MOtPZ8zk+n24R7ETBWM=; b=ERs81LdFTZyAUoruRrGc1SohII
	9jpNNYlkJ5CtXP1f+lp1WZjq5HXcqEoe8Yl1pBsf8FLLeQ4/WsHVHgXJOm+1mvl6sZWpaFfxMyFBe
	AGyi4X9L8i7UE4pu0MIRRb3zxGjlTjHY6WY0CN7jgFZ/5KLb4KXs+1YIedPeeZPlco+GfvuwWKF5L
	Z1HYMmVYGGSNIRKks9eDyEK45JeoSba0K1iPQrL67QDHP7l5kRLPmVgpM94N7qt2/4Jlr55pQAFU9
	P++p6yGdwH5VY2MyqBfdv73V8jMZPcd8rKn+1vXGjI7RzFCrk+9C4Wox+v/MyB33o5EH21PjdusHV
	L/QUTOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCFx-0000000A361-0hWt;
	Mon, 12 Oct 2026 09:23:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCFu-0000000A35D-1qkU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:23:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so9532135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791797016; x=1792401816; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHs5QmsAznY6JYFFT0GfFNt0MOtPZ8zk+n24R7ETBWM=;
        b=l6EmWO/ULBSMXg9IvHY+xDiEcIfGx0McC5nkIVVb5F+UW0VjRYvY7refW6V0R2qhrg
         h6we+O1Wu3sk3tbESnS5vJSrtMD9BM2LG+r5H2xIdZyP9BTblEgiS/9jL+hvEfTIG+Ub
         P0qAhQphSB3zvaxkqcNi2SrPkgB8v8+qXmjmL8TyhIM0tOHOU26u6dE4q3jXcbwKOeqi
         Pfy8CpnjE2v8IjKCcx997gz81v2tQOoSVc/uXJIzKwkvbiWoSMEJvPJaLJhTZLMfbgbP
         IqU1UmZeK/qKXA1AtGKMiS3R8s/xda4HLvhsx2QpWw7U8FU3+nuteWQz/bLSqcRdsQ0U
         lYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797016; x=1792401816;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHs5QmsAznY6JYFFT0GfFNt0MOtPZ8zk+n24R7ETBWM=;
        b=YId6deAqbdcX5mkJp+CfIwMmMkd7e4P0L88gjJTJn4315TcRY7Kbp2QKYX4VaSx/qi
         0PchQ+4OdBznG7bDFRF0j5v4sDGqejwkW3Dg8t4+V3QjKZUdMuqaeFY3vRb9SNYyddxr
         pGgQL5+x7CIYRBegJHP4cwTLtK5GPQEfL7BvHPTBdYYTVI3UGKz4q5WYgsojN9XX7b5O
         CVnDHg7HYG5IGanq4lZKcynwmzbpjZLe0dbxcQ2nlRwF6mRKHy1+0HqALnZiguuWp5zM
         0d5hLk1pmuImLWuL+htMJ6ItWNYOXhtO/xgTtdXOCCR7lMwSV5GQe917puFWAVizBdRM
         5yvg==
X-Forwarded-Encrypted: i=1; AKwUvBxuoAUUE/dbxdL0nb7Paro545X/8FxvIpf81Prd/KrvkU7a2oolF8PgQhZ+amp/j5BLEAM2BLApAWUYlEGYPyEM@lists.infradead.org
X-Gm-Message-State: AFq9FYLWk33a+dwlepcJWR7GGFYRfCBCJY6eJbDNyi7V//EHn1IKMaTN
	tp4mHJPvHGfG7KzJJb3rifZRKjUp6dhMxj/jv8RdQpvw0GugxzAgWqgD6L6R/LjuxoXwBXFEJtc
	Nc732eRM=
X-Gm-Gg: AYBFou3w6It/m9wI8+veUKVswuRnRVz9CniYFI/IwXBc2NZxgNSlWy4IWrWsxzAa5hJ
	g9xdIQmAd0fHNaPvoJAa80kF22/rYE2d18XujPs7onVh7nSet8KodqDPDsybptHIAuVprHMbuXG
	wCGM4bTtRriL6BZuq25YTHSQQeADJ7P7DXOMVYZF/k8Oef5GR9nTzoDx7DphQwKyNKKxtE8uKPR
	xUVp6r6E2QZcJVHWHDAf5zDMF57kszl35SjrABip4qWRTBquBg1iFFqiTV1kwJ9je2jXNcVwJ8E
	Oeb2ZtRHAl/Y8TZsRGayVMrpLbOOrT4gzmRw+Nr0bTcfkMEGwvGDdmiHw76mns6zOSjL/eL9nCu
	o0IpqnPNrNbokRyyUzR4X5Jo7M7Un/uma9xMJulTW5Tehti0soucLDK4or5Q3rVoz/O5ipQExds
	H0aAMCJ0Py3eYuErD3vR5Urf1EeebmLiprloNnS81gwaX790wJDAVybgLacXF7YHTY9rSX1bHWl
	TX5qd5NmkLJnxWO/BzdgYPY3EGBh5WibXySNxksmYh7LuD5CPo=
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr156670605e9.15.1791797016157;
        Mon, 12 Oct 2026 02:23:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:417e:f4c4:5b8:8c48? ([2a01:e0a:106d:1080:417e:f4c4:5b8:8c48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm304568075e9.0.2026.10.12.02.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:23:35 -0700 (PDT)
Message-ID: <27d5c013-9346-4159-aded-12ed8ce4e951@linaro.org>
Date: Mon, 12 Oct 2026 11:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/4] mmc: meson-gx: honour the busy timeout for R1b
 commands
To: iav@iav.lv, Ulf Hansson <ulfh@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261009-meson-gx-busy-timeout-v3-0-67d0db3a8328@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_022338_543217_0A6C2ACE 
X-CRM114-Status: GOOD (  22.42  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 10/9/26 19:02, Igor Velkov via B4 Relay wrote:
> For a command without data the driver programs a fixed 1024 ms into the
> CMD_CFG timeout field and does not tell the core how long the controller
> can wait for busy. Erase and cache flush then fail with -110 on eMMC.
> Patch 3 fixes card_busy, which reported a busy card free; patch 4 makes
> the core rely on it.
> 
> Tested on ODROID-N2+ (S922X), 256 GB eMMC, btrfs root with discard=async,
> Armbian builds in docker as load. Without the series (7.3-rc6): 262
> errors in 3 h and 68 in 2.5 h in two runs; the first came 4 and 43 min
> into the build. With v1 (7.3-rc6): 0 in 16 h, 2.4 h of it under the
> build. With v3: 0 in a 37 min kernel build and in a 20 GiB write +
> fstrim; a sanitize went out as R1 and the core polled DAT0 for 523 ms
> until the card was back in TRAN. On 7.1 with the previous eMMC module
> a synthetic test (20 GiB write + fstrim) gave 48 errors without the
> patches, 0 and 0 with them.
> 
> ODROID-N2 (S922X), 128 GB Kingston eMMC, 20 GiB write + fstrim:
> without the series an erase hit the 1024 ms limit and failed with -110
> in 3 of 3 runs. With v3, in 3 such runs and a fill of the card to 85 %
> with rm + fstrim, 5 erases took over 1024 ms, up to 1219 ms, and
> completed; 0 errors.
> 
> ODROID-HC4, SD card in SDR104 at 1.8 V: 0 errors in 5 boots.
> 
> The timeout is rounded up to a power of two: the field holds powers of
> two only, and the timeout is a lower bound. MMC_CAP_WAIT_WHILE_BUSY is
> not set: I have not checked that the controller waits for busy on every
> R1b command, HS400 switches included.
> 
> ---
> Changes in v3:
> - Clamp cmd->busy_timeout to the range of the field before rounding it
>    up to a power of two: the rounding of a value above 2^31 overflowed
>    unsigned int (Sashiko).
> - New patch 3: card_busy reports busy from DAT0 alone. It required
>    DAT0..3 all low and reported a busy card free (Sashiko).
> - Link to v2: https://lore.kernel.org/r/20261008-meson-gx-busy-timeout-v2-0-8bde1adfb5b4@iav.lv
> 
> Changes in v2:
> - Split into three patches, as Neil asked: name the limit of the
>    timeout field, program the R1b timeout from cmd->busy_timeout, report
>    max_busy_timeout.
> - Link to v1: https://lore.kernel.org/r/20261008-meson-gx-busy-timeout-v1-1-d92f3c68c409@iav.lv
> 
> ---
> Igor Velkov (4):
>        mmc: meson-gx: name the limit of the CMD_CFG timeout field
>        mmc: meson-gx: honour the busy timeout for R1b commands
>        mmc: meson-gx: report busy from DAT0 alone
>        mmc: meson-gx: report the longest busy wait the controller can do
> 
>   drivers/mmc/host/meson-gx-mmc.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> ---
> base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
> change-id: 20261005-meson-gx-busy-timeout-7e8e3fdcb3e3
> 
> Best regards,

This looks much better!

For me it looks all good, so:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4765C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5Zspx8VsAZciUPcNSItD/7x4YS9zk9zDIhR00Qm1No=; b=z1ElvsA+S0AqP69E2akwqCG3KM
	b6ySInAIDXvhmIug1mrOFwuiGpTDJdqLKq4OA2pjIvOwzK5mMg2ZZwRVXbdjEVStm6wxhMMD90Uvh
	KzNF1g8cKyrqrhdS8u6CNPXqic/OYyw6pcDk7/d7EZJzXpTz+ouzEHq4K3gT25AQ58Fv8cix1YBo9
	q3QILnOccNuw/wyNu29UlI0wCq5Ltgm+bKe+If6OvHl+TFpzVYRSFzhQR7ugskirewfX23c+7DtE8
	UFhMH0T6K4sZEXgzEX5EdLynzxB+jVORGtxmwb8X74BF8+6TXwGEdYmzilmxQW2O2O1BdK7JNg+El
	x0LC3SOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodDN-00000004ijO-05HS;
	Tue, 28 Jul 2026 08:31:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodDF-00000004ifm-0Tvu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 08:30:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso24285135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 01:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785227455; x=1785832255; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5Zspx8VsAZciUPcNSItD/7x4YS9zk9zDIhR00Qm1No=;
        b=M39d6qqfrhL19Lueb6fvd8DhHganieY/3VVQwnrDhHhu7HXc+0ORmVmxn/XGJTL1Sg
         hRFonCR+ugbve5TY3Cx2NdbFJ1ZzLv0MVw4D1A5opFV36j8/3ZdZXaBKRgM2EA7H99cH
         UMY+JawGlZxY6wMAAmT6OUrmY45BXSzfzlFl8q18elvwgWPrJ/YGQW5qdTsqRt4/sNCS
         Ef3l+Kgw4Ul+seFMWj6vbzom8iIcFX7F9jXdeuEAlbYZBNHsClipy+MYZhP+Ci0Wc8yg
         WLP97ihh2/WxegY1qoaS6lzR3Ku4o7AE4jotGIXo70g8ffL0IbsFSIIW+Chz5SVVXj3U
         uKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227455; x=1785832255;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5Zspx8VsAZciUPcNSItD/7x4YS9zk9zDIhR00Qm1No=;
        b=rx23MrsNMWgL0tGna5/JKHCDQcxR6eWfzFMTrPT9z0h/pTW40Om7fTgHcoFVFv9TqP
         gVhpVdZSYUvnKbAzGIHgnW79OANDLSHpBKl9AjSAbzijuTSzMfCwtduAB+OgfcnQnIuw
         IZSwVQCUAebBJk+SPMWry6+O4PSSFPG0o1PLy6/3kEwtIya+8M0gbZzvIDfVBXLwjNx9
         12LFz9aGnoG3iZwGSg7UyLy8cXJLBi1F/JpiWkGdohNiTyHmHGyziGASOQJJtIFwc6j1
         FIDk8kvFAmqY16vLleAO1UpTT4lgTLwojHJwqoxe3z4hD2HImTjwRBNnA4iqFaDBmTxJ
         9q9A==
X-Forwarded-Encrypted: i=1; AHgh+RqeS7wfsJ4pO1AOXF9XVcwmddVCr3MYYhuosizBxoy6On0oBFgo9bikT8JmhPkxlY/DVOynk8I/PKwrzdcBanF1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ZBcEneAa9Y4+R8LCaldpOmlK/eN1V+N2diImDIkBiZgiG2kC
	CkZLWp5FiP52ohXyiThqTBzs9oFsu0vjccqIOTXcOJ74hRDvpWV4tCRUZB8vUys7jbc=
X-Gm-Gg: AR+sD126mZOMip2R3DdYCT1PoQAm2w81elTzOK/p6WcNOg7gNtYPN7kbxWhjyCh9yie
	98BvDWHzqmHuvi6OvxMshgIY6dhse0v3KZwaoBFrTIpjlpJFCz/JjEobYh/klw731XDRTa3WmAX
	QvgyYn2r05ZVx+IP7Gt5E7KwbRIo74oJ5tKJFIxhOjS7jPu7Y0d975dKaVQXyM20GFNRNfEMBdb
	KvHnS1F6lT+vqorCTuk8B8LJRpipWHGuPvPDxHnmPZYMcWUQgKuVZxiWpH3tuhxTi2OEKpGGfhN
	R5crYIlFoSsiWoZYKFV0buAYI+rtzJXqmWrwDqFGWKbDVnTeeG1W40hIj97zUn5S/KtphMNIXbg
	QR8raHjlTdKIB0+TEER/7hF9UIsjN5SKoGTNlz+WKQRbFVRM7QWqqaxm2L59W3lNrgqkqfka23w
	MJbg+ta0L2z7iS++xYwty6ZwuKi9s77m2aY+IHEHReWsXkm07vNkAXE0+NgSLhxYT57YwM
X-Received: by 2002:a05:600c:a46:b0:496:bbce:fd with SMTP id 5b1f17b1804b1-496c642d9bfmr14729095e9.6.1785227455027;
        Tue, 28 Jul 2026 01:30:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46240c4sm59208655e9.12.2026.07.28.01.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:30:54 -0700 (PDT)
Message-ID: <27c09961-a76b-4c52-8db4-b82379339252@linaro.org>
Date: Tue, 28 Jul 2026 10:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 09/15] media: meson-ir-tx: Ensure probe error is
 propagated
To: Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: stable@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1785158244.git.sean@mess.org>
 <45cb104675d7abe96dd3570d54f017bce7063be4.1785158244.git.sean@mess.org>
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
In-Reply-To: <45cb104675d7abe96dd3570d54f017bce7063be4.1785158244.git.sean@mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_013057_193044_4CB97D78 
X-CRM114-Status: GOOD (  15.83  )
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

On 7/27/26 15:18, Sean Young wrote:
> devm_clk_get_enabled() may return -EPROBE_DEFER which needs to be
> propagated else the probe will not be deferred, it will fail instead.
> 
> Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
> Signed-off-by: Sean Young <sean@mess.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/media/rc/meson-ir-tx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
> index abb107d19e8c..174d5135e1bb 100644
> --- a/drivers/media/rc/meson-ir-tx.c
> +++ b/drivers/media/rc/meson-ir-tx.c
> @@ -290,7 +290,7 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
>   
>   	clock = devm_clk_get_enabled(ir->dev, "xtal");
>   	if (IS_ERR(clock))
> -		return -ENODEV;
> +		return PTR_ERR(clock);
>   
>   	*clk_nr = IRB_MOD_XTAL3_CLK;
>   	ir->clk_rate = clk_get_rate(clock) / 3;
> @@ -324,7 +324,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
> -		return -ENODEV;
> +		return irq;
>   
>   	ir->dev = dev;
>   	ir->carrier = MIRTX_DEFAULT_CARRIER;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


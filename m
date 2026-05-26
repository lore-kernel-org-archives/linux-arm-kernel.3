Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DC8CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qT/bMdEBMK/k6bRtXEjwywoU6w4KQoZt190nLYNxOs=; b=LbDwZK1psewd+vtOSoqTe3FmYl
	ozZjRoXGtWKZPSfoszZWtzn5GMdbt8u859KlPES+LwJ56PYp9CDEoALuKEa1vVJKYOKTaq3mly8OQ
	EyJCoGAnqjPiQobc7Qx8sfe1iUhrU34QcWqcYYEdnNxbxfiNneoFy9kFkJi9QTae6hvOiTE0JvBOk
	trZKIm5XFjkCJ8WP84Nj0iBixt5ZHrBK5d2OHxGT9QupDDvjIVA9oC6ldFkLJKCxStFZjim8rekpV
	jJwu4QcpP08iiuQ/v3LRbdRmsrxqL0X1rEHW2aaBt2GGDpm2OkddV9Ar5IAShGa/TZSa6vrMQUF6Y
	s7dMBZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRm1k-00000001FGB-3Qpj;
	Tue, 26 May 2026 07:16:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRm1i-00000001FFO-46uM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 07:16:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso87457105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779779793; x=1780384593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qT/bMdEBMK/k6bRtXEjwywoU6w4KQoZt190nLYNxOs=;
        b=fVUj+TxNL58AxV8TgP3u/+3o0Kj3WqjV8Vt1DK2OpkR4+ZqHKxRp8j2+c2vqEb0HHn
         GtO/Q5qXrq8hrEfPNYH8gJZ0AwU9jg44J7FFbOGthb8eSbSiqxXSnzIKXxRij/RuW71g
         at6sKN5EFJufaZy4niK35UiAGYDjcuFFvS89+AgvPHgjv3iKuggUWCiY4PgSvKQiLDy+
         GNeEBB6JFO/DkatopTdKnVfu7a9bw4XEvwY4RqlhD/RfWtw8BAyoEkrxSWp/tBF7SuYB
         9bLnwFYJ06ikdIqJvpJOmB/VHz9QhwGtf5XcRjXpZNvmyA7XvnLn28M0l3f1UnKFq1fr
         33ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779793; x=1780384593;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qT/bMdEBMK/k6bRtXEjwywoU6w4KQoZt190nLYNxOs=;
        b=Pqs4TY2quj3MTu6V6KBTQOLrIsYK6xTjEyYUkY/n3ZVGy91ucEqtbtNB0DDCbg9mkg
         F+uHoGs8WvMDCjRRWCbyFf7Sp0SleHe5TsDmlLuwBCxxoPDgYn+4bWIm5Ike5Pltue/w
         w1A0xXHNu00UrybIYrqcGy99lpglnPj7ywbeCafuYgtg8q9D86SliRDA1ZRXUycaA+2a
         71SQtEKZkO2zzutAs7T7sxdlnwt5Kqt4V6t/Ulvk34sermxsUj3Qs02kcy/MoC4ezLMy
         mZekKnuQwFU24ftlT5prllt68PklGL09GaBBbP2J+S72ZDuYMZKFLScnZ4AvrzDTI34+
         9Bnw==
X-Forwarded-Encrypted: i=1; AFNElJ+l5zmgwwoEuIbp9r7AVZSUe809RkVgaidDQ29nwoF0J5KP3WtrzXx2fZ/bOJQkBVtHFuXFu7zVLKU3axspMni9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7gR4bh2/Tr21J64QXmgz80YA031ygI+qN1r0wlpSTJDBl93tN
	TzYzZ3TYPM4Wsqq92Tqo+kaVj24napNbdswEqBK1VUFacR7Qf+xDU6msL33OtUA62Iw=
X-Gm-Gg: Acq92OFaXGjVvCf+sD4t+C4dv+2KjOvqqL0SaDB+B/Nn1CukGX6V9gjZ+bhi8Mnszgs
	hrXEDJvEyqeSUUxZ68nfWwFXbmN3B0dnv0w8uSyqgF983XhioVcVVEDoLJ3KiEdmEDYvVxyvD5K
	sEh3hgVWCC0UD2HM1tq5NFEd//ftZy2K0r0jnBfkZeijdEVskn9Q3gy3ZRmLtQAvvLprCSU/3nG
	nuVSN0CeNiXkJZRdNVVwucZPKW64ElUL/L8ohNjMgbID2GRD6pSmiN+cgrIyxOnf9tsVWkl0wYv
	8oMwljqt8F8lcW9c1ORwXOBgi01dwgx6bthnx72l6mGfwJZOOb2X7fuuB3iwvnaWjMGEpvQM8oJ
	SW9dLJE+AEF7t7VhdHAM3C+O734DhEz3mEpfhumjrU/nYW3t8uG1x/RUdbHCHYA/RhFOAPY5w6j
	65eCooOOgfE3NXVQlXz/7kDdY5Ob/1od2sO3GOiwJYvRiVYFAKd8+tHepA8yWD+n+iq39NwLROy
	2nmq8WxgHG7ytq9yQ==
X-Received: by 2002:a05:600c:4591:b0:490:6869:46c6 with SMTP id 5b1f17b1804b1-490686947a8mr90737495e9.31.1779779792774;
        Tue, 26 May 2026 00:16:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:aba9:2be3:1465:636a? ([2a01:e0a:106d:1080:aba9:2be3:1465:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm299610585e9.3.2026.05.26.00.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:16:32 -0700 (PDT)
Message-ID: <147bb128-a77c-49e4-897d-ba6ee1b1449d@linaro.org>
Date: Tue, 26 May 2026 09:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: clean up KMS polling on register failure
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
References: <20260524160657.17802-1-mhun512@gmail.com>
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
In-Reply-To: <20260524160657.17802-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_001635_134000_40200432 
X-CRM114-Status: GOOD (  16.40  )
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

On 5/24/26 18:01, Myeonghun Pak wrote:
> meson_drv_bind_master() starts the KMS polling helper before registering
> the DRM device. If drm_dev_register() fails, probe unwinds the IRQ and
> DRM device without stopping the polling helper.
> 
> Call drm_kms_helper_poll_fini() on that failure path before freeing the
> IRQ.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 49ff9f1f16..e49de5df73 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -352,12 +352,14 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   
>   	ret = drm_dev_register(drm, 0);
>   	if (ret)
> -		goto uninstall_irq;
> +		goto uninstall_poll;
>   
>   	drm_client_setup(drm, NULL);
>   
>   	return 0;
>   
> +uninstall_poll:
> +	drm_kms_helper_poll_fini(drm);
>   uninstall_irq:
>   	free_irq(priv->vsync_irq, drm);
>   exit_afbcd:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


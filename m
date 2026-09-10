Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC6DC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMpBVc24Sz11F3KFnL8+840MzJ31UofYHjzEvyoJR1s=; b=WltgZkUoT8VcIWNnDiPGtqc2P1
	/zNQVXNgofIKPr6jSPJeO01kCz9v1RwV0kC4C4PKp3+mBeLwSMRVpIFcSydQpRYsMahH29xncRzIh
	Vy0a+wjCPe3db768BxovAEelDRSOOCk6VBqe8QhN+Q+DeSA9v1X97UziKPdePKeZ0LQc8v1MUUJlD
	RwpUyJlmuFtOLfYYsA/WU8DCA0eGGpAXHX/nGrE425lKetcwHIZjfM6UZAOwR+61ih7XXkQ4s5JYl
	mm5ljeaYs5rzo15NjeegAjHfjPfRzSB08XHTWxmQaeO93sWBPeCsJOo0wNjoK49mLAVeGBb7WIi5H
	sGUD8gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z8V-0000000DcRk-1SrK;
	Thu, 10 Sep 2026 07:23:55 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z8S-0000000DcQk-3P5h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:23:54 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874aso880597f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 00:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789025031; x=1789629831; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMpBVc24Sz11F3KFnL8+840MzJ31UofYHjzEvyoJR1s=;
        b=SbFwrCyhrOx8MtTpZFnMLag8/nVz+z3He+lCieupSkcwrSRiICqa89tvsuG2C5eiFC
         EXQsEamIQGATJWONAuSYB4GJWBOvJpTTpjqUAR2efUBcygkuqf1SZlJmKk4VYAjrNmyX
         MPyQ/wrjWUoZLWQKBKmLqSdYGZ8Q7xmXZCTxGoJ3YVry3bQbow2zO/q+p8ljYys2j/ll
         Z2xXIz51TFZHSJCYfox5S6IDFoefxlDnDSQLMtDswxnTj8dy58CtDckJHSYusS9yiiXC
         Kc2u8LD0nAPZu369YhrpLYUt8d9iM0xGO0eUTzaxWfCNj8c1aeNE9NhME0LkMdbt+SSN
         rNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025031; x=1789629831;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMpBVc24Sz11F3KFnL8+840MzJ31UofYHjzEvyoJR1s=;
        b=opx2vrLvMy3AGBxSWDzra1tklCcl50qwI13iNXaS9HsFB8KVcnyxVmb6h6a4AkD7tK
         h+PmXRnEr12pdvOHUrjlpb32Zs/8qV0rG4lxfkYPwLDp4edrwcfp5hEZqVEnHgpFs5J3
         YyVuJ5100T4FXyNrIK6I+OMd1xCMsVO8ME0iH5ogtRVNZPLfB4Gzk2rrABSrBsr8zyZm
         iGtf8H2rxGPVxDZmUrNJRk1M0kKF7HEvfG6zdai2TjtWHLTaq01x8hWInlsNv6nqG0Vj
         2ROCGKGQCXEVSes8SNNzTSadhPMWleNUcX/f9jlKRdvf0jEupIw4ncadnohBpzFqAbU5
         iMRw==
X-Forwarded-Encrypted: i=1; AKwUvBzoz12KXreLE0upO3YkCyBoMFQhcaGUngpCfAWAcfe9NuD0wD+ZpE8k21tp3bPX6/A+ST7J8pbzEYIQJ5Uk2AFz@lists.infradead.org
X-Gm-Message-State: AFuF++lJaiys2v9su9kZWPz42u/QsWeKMsJ9csOlcMlTHDr0MxY1Yyp1
	El5Aw7TbKDb6I6laon1L+KkRkt7aZQxrFHeoSeud4vRAqp6RYYslj+8qBzCXQCAUYzw=
X-Gm-Gg: AYBFou3yzhhRTKNclQROvK2OfWKyCkAgtkjgz3ZsF2TBJUg0eCd0basKgsx99YNLfMK
	bhEzSx5obq/Ansr6dPHaWrL0QuWmTJEn+R2oUz1nFWz8NZUFVUVDCd6Mw8Y9xWOrM+zQS5L6cev
	zkBV+a7KB+kDbdueY58izI7uYNo3WkwPHb9nlFUJFd+lHl9Zbr07CJF8MjYATC1JX0bOTxUglfW
	5s3ymzbMDghPU5MwG4wYN8ANbw6FrJyrBVQHzaXKjEtzfss8ouAjZH5UoNcXLhj2WukCUkrbStt
	cMEQuwY7IQwagtEfS580fQNIVzpzsKqY6hT+LCHDJruWaI+ZhcLsD+eZOVnM56SQrE8P6DI99L4
	9aJdveupwMjLJUQIWbCEHqZFr2kaTh74biihTB0vGkZsuLYVfCs62c9/89JTMtv6Eb1SLqKfe7i
	ZS8xa+0wyQPr/HX09BP/aZ6z62DlLLS3iT8cfXIAnvoRNpQLE0+PAf97/cnks2NyWf716MOgQjn
	XuK5645H7wJ15su3oJWHLxjKbIJW7N06peDFmN1PINUvZWxFKBxDhxWqmJ/g5d6
X-Received: by 2002:a05:6000:2dc5:b0:485:afd8:3e42 with SMTP id ffacd0b85a97d-485c23ec07cmr11470084f8f.22.1789025030483;
        Thu, 10 Sep 2026 00:23:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm51488978f8f.30.2026.09.10.00.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:23:41 -0700 (PDT)
Message-ID: <ca31e73c-09be-43fe-8904-8a813152c3ca@linaro.org>
Date: Thu, 10 Sep 2026 09:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix device_node leak in
 meson_encoder_dsi_probe()
To: mileskrause5200@gmail.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
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
In-Reply-To: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_002352_883000_E133BC94 
X-CRM114-Status: GOOD (  18.90  )
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

On 9/6/26 21:43, Miles Krause via B4 Relay wrote:
> From: Miles Krause <mileskrause5200@gmail.com>
> 
> meson_encoder_dsi_probe() looks up the DSI transceiver's device node
> with of_graph_get_remote_node() and hands it to
> of_drm_find_and_get_bridge(), but never drops the reference that the
> lookup returned.
> 
> of_graph_get_remote_node() returns the node with its refcount
> incremented, and of_drm_find_and_get_bridge() takes its own reference
> on the bridge it finds, so 'remote' is leaked on every path once the
> lookup succeeds: on the -EPROBE_DEFER return taken when no bridge is
> found, and on a fully successful probe alike.
> 
> The two sibling encoders in this driver already handle this correctly.
> meson_encoder_cvbs_probe() calls of_node_put(remote) immediately after
> of_drm_find_and_get_bridge(), and meson_encoder_hdmi_probe() releases
> the node both on its error path and after of_find_device_by_node().
> 
> Release the reference in the same place meson_encoder_cvbs_probe()
> does, which covers both the error and the success path.
> 
> Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
> Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 3e422b612f74..3fe604496294 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -120,6 +120,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
>   	}
>   
>   	meson_encoder_dsi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
> +	of_node_put(remote);
>   	if (!meson_encoder_dsi->bridge.next_bridge)
>   		return dev_err_probe(priv->dev, -EPROBE_DEFER,
>   				     "Failed to find DSI transceiver bridge\n");
> 
> ---
> base-commit: 88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8
> change-id: 20260906-meson-dsi-of-node-leak-744899da5712
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


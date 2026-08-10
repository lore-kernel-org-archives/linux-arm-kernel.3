Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E31BC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyEgdVp7O6CUMToSIq4Pkng5Jk2xx180zJ29o453drU=; b=3tVf26GAitj4AgzSOb/icxpgOW
	r+sTn+/+/gl4/QVLr/IfNn/SvnVah9k9aI+3CIBzFEl9NIM3TW89Vc/FokInUXOnM08lczA5NSUAC
	YsadJQ5sTTqxwo1NCU/OQlF+180T89tIykMYTpQSkavKOq3mES4JONhbTwY7oyZQHlnHYauVAPDoU
	V+L3YQEpSTqbZL3XY1d6p2ln2pg7vlieiRGTgdL7u/NiJcEMAHzWJJkW8eR+O/MjAWOFh31DsnXKh
	tQfSeRDxXxNHSBAt80jeMgRRiGyjQ33DivQwlIQs1gNWaaALVyvx5/cu5piB7sEA2Dv5Nw940GmWl
	ag+Xeh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMZb-0000000BQjQ-0VxL;
	Mon, 10 Aug 2026 09:45:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMZY-0000000BQi3-0T2j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 09:45:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1046552f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 02:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786355129; x=1786959929; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyEgdVp7O6CUMToSIq4Pkng5Jk2xx180zJ29o453drU=;
        b=BSQ8vCYsP3KQbI2iRZaljS2NCMp7lKS0XIV4eJ7pR8rlEYnjfdTPT3w+5evHux/xxp
         V1k9r2AgYHcTtdSnujPRMM+LP+c8iAWX/Z2VulJO35Dvs5qQA50ltLn3/nIuP+xqfE2o
         1z67Ut7LDIPOiM2FYLmEeDSlJa/1IkTYZByg0DgAV9+I5bvpzMRcL9RqY7ZeR3RN+7fk
         5AB//Z5rT548E2GX/2idWHDw2BwHtkLiiaKm1vUTJEFiJ5j6ROK1ZH3WhoOZkROgr37Z
         4wNzxBXdJImP04PgDeJL5HFCLzovp98vMooptSEOZ94GDLRo/DLiGTcbviV1uB9WX986
         fgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355129; x=1786959929;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyEgdVp7O6CUMToSIq4Pkng5Jk2xx180zJ29o453drU=;
        b=ng6/c/aH0f58ZN47r7RREnD+kI65FKWZYCgqnO+ScbSZ4guBzhW+DxWgbGe+RVwDf2
         KIy+03qkqYMvCYQPFVx+7fP/gpt3rTouuUN3y1xb4reT197Ua5HHJHOypFHTdvBEx0Vr
         qYhyPMTlVUBzb9Us6nO7xq8wyJiIfshFWqEZyG8puTNPQQZkF1GXaYocyxD5FprJXSW+
         z+5tLadihmvLrISC3Fa6a3WJMTFtGkCebWoWKv22oytfBbO+8ZbzNlReQfvYdH5W+vtK
         Vcg+lrn0K1UwpafUSKbAFdlU4cLSwe9NK0wvHUjLhk7YugY2zHTPjJ+etXkzmftubAJx
         mR9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrjj4KZkYgn36N1afFKh5fuixoEcQIU1WjWiqfY2f/+ILdYjpM2Lhk0B8BpbxwSPaMiXGjNKWuOrkrqfG/RQtL1@lists.infradead.org
X-Gm-Message-State: AOJu0YxpwDxmOVKxYoYobHymTN5AVECJ12SIvQsFjT4SyJjXS+RykyC4
	FIy3q125okZBDv/TASh+NQQ1ZKO3dsj6LKSAjCdHPdCGN2k5TTc0sZP3kKmmrfrECsI=
X-Gm-Gg: AR+sD13Ler4w/L2bPPQ8qnZFDWO9gPFneG5peDBl5cCmYt1vOf1K8x3QSuAhKnZ0uhu
	yQX3zK7XH35cRgSZUC0FKQq5eT4sTtNP2BW8AXAljEpxf9ZDkS9LeCKMVWcAnW+llNFqdJq42QC
	i8aBZiG3SDfm6K+LQYoCdsSSlA+pR3CaASVxeO9mgN1O+k3ZkERkkGvwaBqMTwo9EvYABEvNC38
	d3QSGzUG1nTo8O27Kwak0cLcOBXnFD0ouwY6q5X6CAhz0U4ASxRfnymNN7qFpkrjITnUkO4/e6k
	cHEj2fPEte2vwTRXH4HHiQIp4OKIrlGN46WCAiHU/1n8caDlgFSGuTIssmgLTrcZMcfV70+aZcF
	DVNa44yx9dbmv7pJkuiRRC2wTVy0dudNK+6nCtZfgt6/UR6N8CPD0vGp+C51eT/GRU5c5Pp9clf
	uZ866LLrP7AO6IfostYEp6RrPl9CmWPGE8Nzlw/N62ue1r5PPEuxuuauactAahg9BlCq4C3R0YB
	Gm/0mFHO6tNTpkni8wcq5SEEvZRdme7fWXX7KMTqcJ6689ToCvu
X-Received: by 2002:a05:6000:4305:b0:47f:4fa9:ae42 with SMTP id ffacd0b85a97d-481455f8844mr733292f8f.11.1786355129252;
        Mon, 10 Aug 2026 02:45:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32? ([2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800215078asm32050521f8f.12.2026.08.10.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:45:28 -0700 (PDT)
Message-ID: <d0c1f707-4d44-4d0c-a45b-5a78c94f286a@linaro.org>
Date: Mon, 10 Aug 2026 11:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] drm/panel: ilitek-ili9882t: Set prepare_prev_first
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20260809200107.842945-1-marek.vasut+renesas@mailbox.org>
 <20260809200107.842945-3-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20260809200107.842945-3-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_024532_201917_E38E05B3 
X-CRM114-Status: GOOD (  15.24  )
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

On 8/9/26 21:58, Marek Vasut wrote:
> Sending DSI commands from the prepare() callback requires DSI link to be
> up at that point. For DSI hosts is guaranteed only if the panel driver
> sets the .prepare_prev_first flag. Set it to let these panels work with
> the DSI hosts which don't power on the link in their .mode_set callback.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> index 219d048cb883f..24e72ad0d29a1 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -808,6 +808,7 @@ static int ili9882t_add(struct ili9882t *ili)
>   
>   	ili->base.funcs = &ili9882t_funcs;
>   	ili->base.dev = &ili->dsi->dev;
> +	ili->base.prepare_prev_first = true;
>   
>   	drm_panel_add(&ili->base);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


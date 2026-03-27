Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACC410F2843
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvkzTXidkq1oU2J3drENCTO+YWf7SQg/DYufC7x3VxY=; b=uo6t1A9DqkWj7iQaoN7DaQy9PD
	1A/qRznDZEW5xDmwM3NmMfm8doieAjHqmKBugko2+lSxYinMAr5v87mLmDqhTurT7ntWL8HZDhia8
	O+6A2q9UtW1UXHp0tMrJGsH+N9ApV4CQ0BZ9GF6gDABvNhA/XrWeud88gB3xHLikSkUChhVw/xi21
	h5/idz4jBi1DEsd3Dk8eemJX/Ya21RMn30nI2UETBilyNiIGjVENLDHinNZGF568Q8go8eVigI8y5
	Ny3kBBaUMM7lfdkWbuhNKn13470pJZRPzYEKqn/igi2qioL3TpXhhk1vVLG6LD4Lijj3yeexx0ZA2
	Y8WSV9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Cs-00000007hNE-3uSq;
	Fri, 27 Mar 2026 15:34:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Cr-00000007hLN-0eMQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 15:34:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48374014a77so27389615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774625679; x=1775230479; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvkzTXidkq1oU2J3drENCTO+YWf7SQg/DYufC7x3VxY=;
        b=YQke3wXCk6g5mibRWef6ea1xg8AxI1S7/r/02ySzVUmyPYgQYK1hxEYinhnmnLMS1r
         zgVqsCuVe0PPaYkEMHQ9+ttdhbrBGPlJwOhGnCnnLnVHqtvjtKI3w930Ss6gV1FQ4bKx
         p5I15hC/kq0ehHskherJtV833R1xIXlAlpxWqxyAXQQUoo+zfGZQrV/rDKM2wJR8xGAt
         /eQEiQjzhrs4iHvShA+fnz96TwxQeAE88+mgHxrZrGbm8oCDaSrVod8ZnqvHZBPz6dOB
         1CCJTlQA0PQEFUAfjtksRDGoWEZjh57xdFl1FEjdKE/h2byH4tdgxU/Q3HWTAjo35eL1
         jxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625679; x=1775230479;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvkzTXidkq1oU2J3drENCTO+YWf7SQg/DYufC7x3VxY=;
        b=isFl3q5/qvsbM3eBKO2etCtqCUzf/jBxjEgTdP2pX+19to/UP0AqMR26sxFSF4dC/Y
         SrtSd4brD4TKAYs30IxikomOH9tChYev6dxjreCXgMN63IrcXVNstf8SyaoIvmw77rsU
         geBM2cSIfzfzauYmBVjWjmoW4DyWyekabhuQquuIGjJSy9orCwEJ2U8NwYO7CRkbHvTA
         EvLfSjFbQHmb/JvkkyGA20bnZhfP9pBpxYbazv+gdOndNDbifrG4tjXKerN5ZlyR5zQO
         v0G4jFJkB+NlAhe+ThoF+suwfHGMhsiN+pe8R7KdawC943KKmJ305tEXRX5I1gzkt0DN
         2nug==
X-Forwarded-Encrypted: i=1; AJvYcCV9XCjvaPWG/rqhHfL0XjKLmw80KvOwsYia1vE3/VsE7BbVrBYlTmkq461uc8xKUaGbcAaLbLBBkO7dQtU+sQKE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4SMvOkEUG42mERxZghBrr3q1bz0R+xTHVGDIiHB2sq3CZJDeV
	Cuuixr9br83vBf2tCqXGBwlavnXoXong8pRJ1kakV0RYLkhDQFVGK7fGXFIB9+x8MQk=
X-Gm-Gg: ATEYQzwUcVnCP9NMMNJJq448owK97gZGrx0TFMw4OZsS/gzN6iklEyjpuw9BrLEPiwN
	liVTNEE322/zjL+8+1d/el60b/KUdEt2ELDYhwEEmMGhYzpOU9TSJve2e+oV2xWulYadKVQzwoU
	FEw9Z9+nsAsAwct8QvVSRJ4rPA4oAxXH8/drnQUEAS6MOUNxdLuOJ2ulKILgYG5p80TP/52Z7W+
	lhXCtNO5KzpribYga5iQrtTDvI+5B1oyuH+rBzu58uhdXGCER+wrQrgZ0T3dvLCc5ZlRzdz3xVv
	WhUNgLwO3JCynmfcHX9wFbX3dV5JGAPff75eHAVD/CMKZ/G3v+2A6DHH0EIphBco/e2jjmytNYp
	jJWoz8PDgaduJbNq+cQkEiNLP4hMmr9JOGrpUB6+btEmwcRO75V40bB9jq8maHX5Or1vx8VRkSA
	P/N+epVvyK1W3FwAeCtpLa0xB1nA55xQiq+3R9luYyZVhszsz/SumcoPrkb1hta0ewdd2rjZ24M
	8T9Nv4=
X-Received: by 2002:a05:600c:3b24:b0:485:6ec7:2df with SMTP id 5b1f17b1804b1-48727d5f7a5mr45624505e9.8.1774625679470;
        Fri, 27 Mar 2026 08:34:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:39df:9101:d239:f5dc? ([2a01:e0a:106d:1080:39df:9101:d239:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9f58fsm161290455e9.11.2026.03.27.08.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:34:39 -0700 (PDT)
Message-ID: <4a6c04d4-2865-4277-8bee-abaf2710b04f@linaro.org>
Date: Fri, 27 Mar 2026 16:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 3/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 use rc-khadas keymap
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327093016.722095-1-nick@khadas.com>
 <20260327093016.722095-4-nick@khadas.com>
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
In-Reply-To: <20260327093016.722095-4-nick@khadas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_083441_223526_219EC3FB 
X-CRM114-Status: GOOD (  12.33  )
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

On 3/27/26 10:30, Nick Xie wrote:
> The Khadas VIM1S board has an onboard IR receiver.
> Configure the default keymap to "rc-khadas" to support the official
> Khadas IR remote control.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> index 7314e0ab81da3..99d5df71b9cd4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> @@ -242,6 +242,7 @@ &ir {
>   	status = "okay";
>   	pinctrl-0 = <&remote_pins>;
>   	pinctrl-names = "default";
> +	linux,rc-map-name = "rc-khadas";
>   };
>   
>   &pwm_ef {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


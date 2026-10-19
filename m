Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E154CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 07:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTmZAXM73d5UutovYrMzHxjVi/hMLxPmTYLuwel/w7Q=; b=AUjq/MDf9ftVCBEm/DLt2tZLdP
	JIptnmmfiFSg7QGieci2+uDC3+sTJC4fvzwftpYxEPaL/FV7J7+gwXweG652Ai+9Fl7RxKsEogFQ5
	x73zNOl4J0/WUkbE1WtFyL1bzcCkHi++5dZCrXQXAeobxBTy9OBKE7s89BklccWD4Rxm1ebEi9RDN
	7So768CjvDCo7bp2KkQnL0rN6Tf3br+J2HLDCpyCwWwhrCeZdUihin9Zt3M7nIORJHVx/aeXGBkLj
	BVbTgit7mVL8QJSzvkxDeG8q9k40yogCZc7xKQN8bq7W3tCvbKSyBI3sbXmr1e6OAJBXM+JgW2vZx
	qNIO5Drw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIho1-00000006lKx-3JPa;
	Mon, 19 Oct 2026 07:29:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIhny-00000006lKG-49nv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 07:29:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1132032f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792394949; x=1792999749; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTmZAXM73d5UutovYrMzHxjVi/hMLxPmTYLuwel/w7Q=;
        b=EeJmHDJRgWtJv46y4AX6sT5FTEPBVyfwkkbxbVZTuBhinMJm+nX2XKeluON8eRqQ53
         WsmQZFEWnHJwEwjGMcWRU1IzyYY+ODulpuLswZqRlzxTR0UNMLlWoPsPJBRulQctiwRc
         Lw4Y0MyfDbdhay81sj5NJOD8lpgHE+jRuLmDl0JuCyULuu+slhfCHm6LrtlqJJHqBWcU
         jMLQgoOwsVA8YqRVIOeU+JYkuC6V0hqxfvrKTDfEKtMUAzwEGOZXlrE+wGBlgxgkyrRL
         UMXJIKI7lhc++WUkIl4mfdbn+wEhTZfRYvg3BlTzE/nVw/rFx/Qa+vbRK+bP4EZABFdb
         YErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394949; x=1792999749;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CTmZAXM73d5UutovYrMzHxjVi/hMLxPmTYLuwel/w7Q=;
        b=EKQePLNm1bYI4nWthkv84U3DbbWd7T8FipzQ6LPl0dzrPOLN/g7X83Il3Yb+VKo6dG
         pxLaFlttC3eMnni2xZFwO5g3s2OldYnybhpiXoK79I7TIXwRacqD2rsWqI6Ol+Go2z0s
         oy1wixv1rp2ZfgRwNEcW2dl1OmUnEzFBrRHqmLhGvsUXa5kW7UkcLNyN9Z8uWGLDq0VH
         Ywd5VwFin73U6p7TE5nhPEJmzw4xv6j2YF6l7coBln66VY23KKg+fAflQgWEjp077O8r
         iMEIcRm/oBiYAD2E30TadX96jaJ/+eOOy/xGJYo5QhpWyDXyav06i/FG6BCIw1Wt+FAb
         NrdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfBTC0gOhhxgUR8gIbmW+0gLe8UCVcrsC904CdPvZ0McCyDpmn+zMD5BBgQrqawtqljYjIrgYpq7khsCd5S03I@lists.infradead.org
X-Gm-Message-State: AFq9FYI5dTAJAkxZD8+d0qlDnD0+y4jJD8zgpXDiCo42bd6JEkq1cd/4
	B5Prv1RoRHONimZYNt8fkh/ZYB1jy/7Y9iCmWY+cwd/lZTbXv+87eTNMGOaDUtQtDcA=
X-Gm-Gg: AYBFou164bMj5k0E2tmDgONhGg/7uz7BAO9uwAzhmt634EJm8+gxb+ZNw+2k4dJ+WLW
	o4+lzoVF5rGQL0Z177JCPjyDXk0xVo9CKKbxwbiZsvRA4ev+DN70qI2t6tyPsD4IemzvL1OwZtr
	VK3zhGya25PL+gth3+br80pydaR3/V6jd1j6cgfJhe8JmkNLYEnMGUz4MLIeUO+MYt73tg0NpzN
	xwkluOg7mGOk11h9+xRud9EwsSJwst0qHeRd1mig3ZlHlI58TBOm5FpfSPeuwxaQAmrFVo7gG8B
	bs68boIkzoqGxTfPKMCHvm9UeOnSPC00ad81Fkx3rT1wL4B5aj09l7pwuiu2lXc+m21FhCilvRc
	vXcjmuQWMtpyd7AMaKpbSoVf3I9jax6Kl0cN6j0jUunbaegOcFyaHKLRK6PR3qZVC3/75/Xwzz4
	Gi2CoxdULBvJemBvna+SJLcu49Tu5weYkneoQXRp3L/EG/Gyw67uezv90agMYXInpvr6JfAay5Z
	1lFg10MnHcc0X7V74JTm//e+NywVAYitnG6y43WiiBLscBfaAZKEQ==
X-Received: by 2002:a5d:414d:0:b0:487:219e:5e20 with SMTP id ffacd0b85a97d-48e07fa8ce2mr9406189f8f.51.1792394948485;
        Mon, 19 Oct 2026 00:29:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6674:33bf:38d6:bc10? ([2a01:e0a:106d:1080:6674:33bf:38d6:bc10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm21249024f8f.45.2026.10.19.00.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:29:08 -0700 (PDT)
Message-ID: <0b5c28f0-0a43-42b3-a07e-4ecf39b2380d@linaro.org>
Date: Mon, 19 Oct 2026 09:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: odroid-go-ultra: use the RK818 RTC
 as rtc0
To: Shigeaki Asai <y-asai.0816@docomonet.jp>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261017110743.3555391-1-y-asai.0816@docomonet.jp>
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
In-Reply-To: <20261017110743.3555391-1-y-asai.0816@docomonet.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_002911_198618_D3047AF5 
X-CRM114-Status: GOOD (  21.38  )
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

Hi,

On 10/17/26 13:07, Shigeaki Asai wrote:
> The ODROID-GO Ultra has two PMICs with an RTC each, RK818 and RK817,
> and the SoC has the meson virtual RTC. Only vrtc has an alias, rtc0.
> 
> An RTC without an alias takes the lowest free number, and the RK817
> RTC registers early, so it usually becomes rtc0, the RTC the system
> time is set from at boot. The RK817 RTC seems to run without a 32kHz
> crystal on this board: it ran about 1.5% fast while the board was on
> and 14-17% slow while it was off. The RK818 RTC keeps time well:
> with it as rtc0, the clock was off by less than a second after the
> board was off, with no charger connected, for 12 hours 40 minutes.
> 
> Use the RK818 RTC as rtc0, and give the other two RTCs an alias as
> well, so that the numbering does not depend on probe order.
> 
> Fixes: 62e73f000696 ("arm64: dts: amlogic: add initial Odroid Go Ultra DTS")
> Assisted-by: claude-opus-5-5
> Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index 348baa4e6d84..86902f68d7d4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -18,7 +18,9 @@ / {
>   
>   	aliases {
>   		serial0 = &uart_AO;
> -		rtc0 = &vrtc;
> +		rtc0 = &rk818;
> +		rtc1 = &vrtc;
> +		rtc2 = &rk817;

The vrtc was used as rtc0 because it's the defaut wakeup rtc,
can the rk818 and rk817 wakeup the system when in system suspend ?

Neil

>   	};
>   
>   	adc-joystick-left {



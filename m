Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E8CC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=; b=H72fdRU8flfW+iGKceyg1Pqwey
	2dWXLGrTQUamRdLGRCHvyupOSqDD3Jmq2F76/7HGIELyFzewndbTk3UQJz6enzogmIFIGLleYA49G
	VMej74ojWxlDKLNSPrLHE0hiXMHqJZE7dfsTJYh3k+rljwXiV74vPB5YteeJWJ+rdFibAhWIN8viI
	WRdadsUivfvehIipL2s4k/eVeir0eaNEtQXqMRHJX/pDrwnB6Ezvg7645TltnkwL8C/JADqtF+RsX
	XA9F8nS4pOfKtFPf/p8iUNxScv9qACBtFkym7HYS62mj6jiPdCbmfbMO0qTRSv/RlRSNTDS1Ie/oE
	RpGE5+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fDL-00000007jCv-3Ws0;
	Sun, 30 Aug 2026 13:04:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0fDJ-00000007jCE-0Z7g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 13:04:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso26389735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788095083; x=1788699883; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=zAeJpZYoMeHOjkPngfoPlUrPuhfXMM7R5hcDH94DD8K6RsRiEwTwc2zZ5TBsrEU27B
         2LEJRV413BbLXgkLbEHHFHdds7RxobJCVoxO4PE9VBqoB0URVy5uXtRpi8SrHK7VFtui
         l1H1k214ZUDE8reVp2Tvh+vu9mr6jbx4AlHF3LyZjHJIQgXY8e7/c9qsgksJoKWtHS7B
         WsVoQ5Tu6OuMBljkEn2EvzeHXRViYEkJrJ9q2ntqiOwHoGkD33xt+dnA+LGDMLnAp/yb
         kC0O1H7+4stiIxhjqvuQHMIpJvubleJOvUcN1pwUh+Fg0Az62dz8TijVZZeRNgiLelDc
         Tqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095083; x=1788699883;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=QZTF/JcyoeeRAiaIB6AUzWJScOT08ge4ddg3TUNUhu5fR8VmaAT91XdEd/4Kxre6Zt
         lCFlFZVcFSRRfTR8xeYtXIuYMrgKMzBVcXeXcd/lfI5DjL1dikSE6JOWsyPg9yNe0/VC
         jlUZxaSdZBo8RPe5wuhbnNlZ5KNctJilzs344Qrh9Js+55Yb2LvwujMfzJqYtliJAlqH
         ZfMephCVPHx3Rcs+wa6VhwzoPnGfSfU1vWGZ7gNgtKxBybng4qeUZ2aVNyaJ7pjLxcVm
         9cUp992zy/VaxLrN1yZKiN9t4ftxIf2gr7oTYKtNMWTxIh5SJTtL1pqk4WtiinfhXtBI
         qyLw==
X-Forwarded-Encrypted: i=1; AHgh+RplhlwmZWOsOYwLG+stQaquFrXPSEgqId+F5ALihGMMNpe3UxAOQFVh8Be5L4wbZJHURiBXikY1IMr9ncJN+wVV@lists.infradead.org
X-Gm-Message-State: AFuF++lNsZbocjhPHMVZMfu6Tl1RISEgypbRJ71COTW0F1zQ+h1jvY+x
	A81izylVYp+8cyZF/dCOgdX/iX3oEPlZ9+Ih97GKDXf2dthWX3aGOATelx4HK78U16c=
X-Gm-Gg: AR+sD13yCcWdO+s/3C6g9nw1jmwV+MGgZWhmmDm724RWyISW+QYjFfAjrqCCVx6XJc/
	KjXBBRIPxw9C2burAc+naPzqGU6ICKieKZxCCAb5SlA8msrIEG27R5mLC7NYIv4qN0gOy3XHwS3
	j2QXBJxw+E2ER6DP5r5jhYMjYQ13hq4VGhV/npmFw8D4GKMwUOfqrMeunWnXiFmibRD6u7sU2Ca
	16jjuYUUVPYS8KzCZCyOkQt6xChyLquTG1/KkeGpZInK67UFFaX2xw2mWNjOV6mo53kv4jO1mX4
	bk4QubRdhZosvKFfKCYEPLpQNEm74B2JAOoXmSkY9OWrdqMWQl9C2Rtz1sN7D/oZ/3eqwdmZBMx
	mOdgqh3NHXil8vLskJORWhiEhlsCDBholbZnaetny9sJFicpnO/aI+ZyS2mK0yxCkmFDaeDbBgX
	d+pIpmRUzfZjSK+YjAfIrvZkiX2f3lvrc4stNkqVh3bPgEoLsxpdUkjrigBGCHpGo+y0Ury2u8
X-Received: by 2002:a05:600c:8b63:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cd53c438bmr35600565e9.8.1788095083121;
        Sun, 30 Aug 2026 06:04:43 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95018ee8sm205342395e9.15.2026.08.30.06.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:04:42 -0700 (PDT)
Message-ID: <d4ba8298-fb80-4fed-b1ce-7fc5d0adf5a0@linaro.org>
Date: Sun, 30 Aug 2026 15:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the
 vsync PWM
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260829094758.23248-1-tanure@linux.com>
 <20260829094758.23248-5-tanure@linux.com>
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
In-Reply-To: <20260829094758.23248-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_060445_238234_56F749B2 
X-CRM114-Status: GOOD (  15.43  )
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

On 8/29/26 11:47, Lucas Tanure wrote:
> The vsync PWM output can appear on either of two pins, but the
> description named a single group that does not exist, so anything using
> it would refuse to start.
> 
> Name the real groups instead, one entry per pin. No board describes this
> output yet, so nothing changes today.
> 
> Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 8c4bd683cce0..719e111bc3dd 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -546,9 +546,17 @@ mux {
>   					};
>   				};
>   
> -				pwm_vs_pins: pwm-vs {
> +				pwm_vs_y_pins: pwm-vs-y {
>   					mux {
> -						groups = "pwm_vs";
> +						groups = "pwm_vs_y";
> +						function = "pwm_vs";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_vs_h_pins: pwm-vs-h {
> +					mux {
> +						groups = "pwm_vs_h";
>   						function = "pwm_vs";
>   						bias-disable;
>   					};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


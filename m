Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B726CFD640
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4OWSPX6k/FAnvyvL1batKFKTUKdKrqMMtHiUrTlOo8=; b=hogwp4nLmYZkRH42QMtiqk9ZuI
	xQsRXylFYGN5SahgxDlEZ78aAN3WgAk1bcc8Wku9vdEZ5Q0mvCbV0M/eUzl2II3nTpxssxFzw3o3V
	2RPrrXDhCRT6dyC3nPIbqY0XO9ut/GdDDc8pFaWLz/dAnzaMvcQlpxs2IUCQkONB9IUpKUcG3f9Vd
	gAYVdCKmHpW8qe117uZwxWmJmO9SzwOn4UGt/tD0dd1qz3D04b/kzbASp0b07b9MZV1STc0GdGojv
	Jsc12npZuU83a7bUTnN6ffx8pvrYzkynNMTHfPiqVt/NeFEN7xyKBmwa44JLcP625qzm9XwQuuM7U
	a4Hqznlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUAr-0000000F3G0-0kq1;
	Wed, 07 Jan 2026 14:06:09 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUAo-0000000F3Eg-0CqC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:06:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso1314229f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767794764; x=1768399564; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4OWSPX6k/FAnvyvL1batKFKTUKdKrqMMtHiUrTlOo8=;
        b=UxrcCwA2MyGrYbiAVAv36flPN/a3/sEuRnhokAvbtu+6hBXutKySxkREM/sI+QLYVm
         Yw+Ilq1IpNH3OdztYla3Pgqqgb4L/VcNKkEbg3sRs07canbfcfU+9pMkxUzLNk9p5Yj2
         yXzhyMvoubu/AWfMgeMZOOc4/pb1scc7OOqa+IXC0iSssV5rN2VLnvLHjnE5vFW0QwDC
         YRystDA7BwcP5cMfLbeSsIYi4Y0LCuOFGHbcSSu9+w1mXuP565SvvwUtkiHpqLDbUmTv
         NzVQQBcIuYpVZ979m/Hch+wjtV4q7i5qEF1bglM4mgOjU6qScmH4upLJ+z/YuAT90Uk0
         mPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794764; x=1768399564;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4OWSPX6k/FAnvyvL1batKFKTUKdKrqMMtHiUrTlOo8=;
        b=i+PFs9Y/r0kD9iKrOzxKRjc8KT8OpsFdIQiAN+jxUEARRB8EhtmqLqFiy3JGyIpDP8
         pO6Sq5aLi1NZDleEN788hT/ScNdk87DO+nIIxk+m0+RN/lIbP8xJU3UfWQGOcXSQgneU
         PS+4Pzi2DLS/36aXus8eoLOOJR+G06oSsIF4DxJkOyhH37k4710lT3CcJT1ftmYI0/Eo
         uk2XGayyNwA++Bsx4rOeIL32jnU0owgurfeKRIqH3t/9xasUBo10s967Kbta7Fs2N5gx
         65c/QSV0YZAtM7HRtP6pplve/Zj20tUG2OA/MTUJjkoD0ohuJESpDJpk2XjKi5rjXht0
         Wi3A==
X-Forwarded-Encrypted: i=1; AJvYcCWwfxxW75ZpkNDDkzTn6U08lpIERp210gol52aelMDLkAX6axlnBPltI9EytpuH4cea7+Key1W+Hyev7OMmeelw@lists.infradead.org
X-Gm-Message-State: AOJu0YyxWOQrcI3LlDbPwN12E+Kq4wrnSM5AUhjebtpouAN7Ri1uO8Ng
	1ZcgroLE4FKq9Kntw7Z6bSsnn1VGXMWcwXbpa0TCePWcA/s8eSullMa6D+HWc1eSYLWIiUa2+nv
	2abv7Luw=
X-Gm-Gg: AY/fxX4pLr9dMdbjOifnAIgfjXoPPwz2beNN3Tb/GhlJUT4g6P+rtqYbZHhLN2t4iAA
	k4Fz0Q/eYQp601wgGVtr9q+ZtFFMjrb4gf3YfBzYlmqaV5tHlqM5g9boXF7Jn2NrY/s1O04WtlY
	N5pSAyi+y7TuZgjWpb1ui/5LrmrvmghLqJrfy6GykYYjQ8YmOnjioT/2BRcVE4ultMpyhtcdhPl
	FS6q6LkD9yhUNRQbiaqcI4leDyO7oRoUu46RULuKAGVl91oLkIM0flcBsvgGLz8ufpcODuYl+Ok
	THAFD/Hv5qk9fDc7jfNnvTEFcIhexsDEXS6KxV0EfLdhtsShcuPrzlCIRvNzGlWwlYmLKg8uGmf
	IDuq9BXVzcM0z/tmIjq6DVgxdG07Y+wvZUB5i4z8TaCFeUkyVZmLGN1aa+oKs6p+8dzo6fxkVJY
	sbWh/sxarc4szXxZ5ihM/an+6F5PiDdbHVc3CpJkpgiv3MVYC9wan0XBTppReujnc=
X-Google-Smtp-Source: AGHT+IHIInONEmJofoaMnpqjvi/SYFz3DESp7XX5V9uNY23GsIlZu7g8JTx03zYk70fn6DVQHwurTg==
X-Received: by 2002:a05:6000:4287:b0:430:f65d:c0df with SMTP id ffacd0b85a97d-432c37a2f8fmr3792056f8f.56.1767794763671;
        Wed, 07 Jan 2026 06:06:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:2542:a09c:d0d8:7a1f? ([2a01:e0a:3d9:2080:2542:a09c:d0d8:7a1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm10937478f8f.17.2026.01.07.06.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:06:03 -0800 (PST)
Message-ID: <d0e8d9f2-6a2b-4cbb-8bd7-e0f7770ffe52@linaro.org>
Date: Wed, 7 Jan 2026 15:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: amlogic: move CPU OPP table and clock
 assignment to SoC.dtsi
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20260106090624.518117-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20260106090624.518117-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_060606_317022_F0F8374D 
X-CRM114-Status: GOOD (  14.46  )
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

On 1/6/26 10:06, Martin Blumenstingl wrote:
> Move the assignment of the CPU clocks and the CPU OPP table(s) from
> board.dts to SoC.dtsi to reduce the code duplication.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   .../boot/dts/amlogic/meson-g12a-fbx8am.dts    |  8 -------
>   .../dts/amlogic/meson-g12a-radxa-zero.dts     |  8 -------
>   .../boot/dts/amlogic/meson-g12a-sei510.dts    |  8 -------
>   .../boot/dts/amlogic/meson-g12a-u200.dts      |  8 -------
>   .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  8 -------
>   arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  8 +++++++
>   .../amlogic/meson-g12b-a311d-libretech-cc.dts | 13 ----------
>   .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 24 +++++++++++++++++++
>   .../dts/amlogic/meson-g12b-bananapi-cm4.dtsi  | 12 ----------
>   .../boot/dts/amlogic/meson-g12b-bananapi.dtsi | 12 ----------
>   .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   | 12 ----------
>   .../amlogic/meson-g12b-odroid-go-ultra.dts    | 12 ----------
>   .../boot/dts/amlogic/meson-g12b-odroid.dtsi   | 12 ----------
>   .../dts/amlogic/meson-g12b-radxa-zero2.dts    | 12 ----------
>   .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 24 +++++++++++++++++++
>   .../boot/dts/amlogic/meson-g12b-w400.dtsi     | 12 ----------
>   arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  7 ++++++
>   .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     |  8 -------
>   .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  |  8 -------
>   .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  8 -------
>   .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |  8 -------
>   .../amlogic/meson-sm1-s905d3-libretech-cc.dts |  9 -------
>   .../boot/dts/amlogic/meson-sm1-sei610.dts     |  8 -------
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  8 +++++++
>   24 files changed, 71 insertions(+), 186 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> index d0a3b4b9229c..abf6b63ea0d7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> @@ -265,26 +265,18 @@ &clkc_audio {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &ethmac {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> index 4353485c6f26..a85f383a1699 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> @@ -218,26 +218,18 @@ &clkc_audio {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index f39fcabc763f..5b6716aeaae5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -312,26 +312,18 @@ &clkc_audio {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> index b5bf8ecc91e6..dd9da7a5ec5f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> @@ -405,26 +405,18 @@ &clkc_audio {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &clkc_audio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 5ab460a3e637..015e3c7e3a91 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -261,26 +261,18 @@ &clkc_audio {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index 1321ad95923d..51317d11f263 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -25,6 +25,8 @@ cpu0: cpu@0 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2>;
>   			#cooling-cells = <2>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&clkc CLKID_CPU_CLK>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -40,6 +42,8 @@ cpu1: cpu@1 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2>;
>   			#cooling-cells = <2>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&clkc CLKID_CPU_CLK>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -55,6 +59,8 @@ cpu2: cpu@2 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2>;
>   			#cooling-cells = <2>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&clkc CLKID_CPU_CLK>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -70,6 +76,8 @@ cpu3: cpu@3 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2>;
>   			#cooling-cells = <2>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&clkc CLKID_CPU_CLK>;
>   		};
>   
>   		l2: l2-cache0 {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> index 82546b738977..5747acf8f337 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> @@ -6,7 +6,6 @@
>   
>   /dts-v1/;
>   
> -#include <dt-bindings/clock/g12a-clkc.h>
>   #include "meson-g12b-a311d.dtsi"
>   #include "meson-libretech-cottonwood.dtsi"
>   
> @@ -74,38 +73,26 @@ sound {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &pwm_ab {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> index 8ecb5bd125c1..f15baa708b36 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> @@ -109,3 +109,27 @@ opp-2208000000 {
>                   };
>   	};
>   };
> +
> +&cpu0 {
> +	operating-points-v2 = <&cpu_opp_table_0>;
> +};
> +
> +&cpu1 {
> +	operating-points-v2 = <&cpu_opp_table_0>;
> +};
> +
> +&cpu100 {
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +};
> +
> +&cpu101 {
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +};
> +
> +&cpu102 {
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +};
> +
> +&cpu103 {
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> index 39011b645128..7a204d324dd4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> @@ -153,38 +153,26 @@ &cecb_AO {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &ext_mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> index 1b08303c4282..4321d08d11a6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> @@ -261,38 +261,26 @@ &cecb_AO {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &ethmac {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> index fc737499f207..b16247e0df9f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> @@ -49,38 +49,26 @@ vddcpu_b: regulator-vddcpu-b {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &pwm_ab {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index d5938a4a6da3..c81d7fdbe2f5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -279,38 +279,26 @@ &arb {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   /* RK817 only supports 12.5mV steps, round up the values */
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
> index 3298d59833b6..88d995006f94 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
> @@ -225,38 +225,26 @@ &clkc_audio {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu_thermal {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> index 1e5c6f984945..e95e193eaebc 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> @@ -257,38 +257,26 @@ &clkc_audio {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu_thermal {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> index 19cad93a6889..eef98add05c6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> @@ -99,3 +99,27 @@ opp-1908000000 {
>   		};
>   	};
>   };
> +
> +&cpu0 {
> +	operating-points-v2 = <&cpu_opp_table_0>;
> +};
> +
> +&cpu1 {
> +	operating-points-v2 = <&cpu_opp_table_0>;
> +};
> +
> +&cpu100 {
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +};
> +
> +&cpu101 {
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +};
> +
> +&cpu102 {
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +};
> +
> +&cpu103 {
> +	operating-points-v2 = <&cpub_opp_table_1>;
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> index 9b6d780eada7..4834f418bef5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> @@ -211,38 +211,26 @@ &cecb_AO {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table_0>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
> -	operating-points-v2 = <&cpub_opp_table_1>;
> -	clocks = <&clkc CLKID_CPUB_CLK>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> index 9d5e28cf5958..7aff554085e3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> @@ -57,6 +57,7 @@ cpu0: cpu@0 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2_cache_b>;
>   			#cooling-cells = <2>;
> +			clocks = <&clkc CLKID_CPU_CLK>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -73,6 +74,7 @@ cpu1: cpu@1 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2_cache_b>;
>   			#cooling-cells = <2>;
> +			clocks = <&clkc CLKID_CPU_CLK>;
>   		};
>   
>   		cpu100: cpu@100 {
> @@ -89,6 +91,7 @@ cpu100: cpu@100 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2_cache_b>;
>   			#cooling-cells = <2>;
> +			clocks = <&clkc CLKID_CPUB_CLK>;
>   		};
>   
>   		cpu101: cpu@101 {
> @@ -105,6 +108,7 @@ cpu101: cpu@101 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2_cache_b>;
>   			#cooling-cells = <2>;
> +			clocks = <&clkc CLKID_CPUB_CLK>;
>   		};
>   
>   		cpu102: cpu@102 {
> @@ -121,6 +125,7 @@ cpu102: cpu@102 {
>   			i-cache-sets = <64>;
>   			next-level-cache = <&l2_cache_b>;
>   			#cooling-cells = <2>;
> +			clocks = <&clkc CLKID_CPUB_CLK>;
>   		};
>   
>   		cpu103: cpu@103 {
> @@ -137,6 +142,8 @@ cpu103: cpu@103 {
>   			i-cache-sets = <64>;
>   			next-level-cache = <&l2_cache_b>;
>   			#cooling-cells = <2>;
> +			operating-points-v2 = <&cpub_opp_table_1>;
> +			clocks = <&clkc CLKID_CPUB_CLK>;
>   		};
>   
>   		l2_cache_l: l2-cache-cluster0 {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> index 9be3084b090d..661e454ca673 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> @@ -145,26 +145,18 @@ &cecb_AO {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU1_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU2_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU3_CLK>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> index 5e07f0f9538e..f0e4b168a411 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> @@ -183,26 +183,18 @@ &arb {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU1_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU2_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU3_CLK>;
>   };
>   
>   &ext_mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> index a3d9b66b6878..4e1e9a502666 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> @@ -49,26 +49,18 @@ sound {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU1_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU2_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU3_CLK>;
>   };
>   
>   &pwm_AO_cd {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index c4524eb4f099..ad886d446e96 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -248,26 +248,18 @@ &clkc_audio {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU1_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU2_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU3_CLK>;
>   };
>   
>   &ext_mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> index 5daadfb170b4..2a16f54332df 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> @@ -6,7 +6,6 @@
>   
>   /dts-v1/;
>   
> -#include <dt-bindings/clock/g12a-clkc.h>
>   #include "meson-sm1.dtsi"
>   #include "meson-libretech-cottonwood.dtsi"
>   
> @@ -62,24 +61,16 @@ sound {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU1_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU2_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu_b>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU3_CLK>;
>   };
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> index 024d2eb8e6ee..e275b0f36b09 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -357,26 +357,18 @@ &clkc_audio {
>   
>   &cpu0 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU_CLK>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU1_CLK>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU2_CLK>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
> -	operating-points-v2 = <&cpu_opp_table>;
> -	clocks = <&clkc CLKID_CPU3_CLK>;
>   };
>   
>   &ethmac {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index e5db8ce94062..8f5b850b1774 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -63,6 +63,8 @@ cpu0: cpu@0 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2>;
>   			#cooling-cells = <2>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&clkc CLKID_CPU_CLK>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -78,6 +80,8 @@ cpu1: cpu@1 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2>;
>   			#cooling-cells = <2>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&clkc CLKID_CPU1_CLK>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -93,6 +97,8 @@ cpu2: cpu@2 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2>;
>   			#cooling-cells = <2>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&clkc CLKID_CPU2_CLK>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -108,6 +114,8 @@ cpu3: cpu@3 {
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2>;
>   			#cooling-cells = <2>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			clocks = <&clkc CLKID_CPU3_CLK>;
>   		};
>   
>   		l2: l2-cache0 {

Tried to apply it on v6.19-rc1 but it fails to apply:

error: patch failed: arch/arm64/boot/dts/amlogic/meson-g12b.dtsi:57
error: arch/arm64/boot/dts/amlogic/meson-g12b.dtsi: patch does not apply

Neil


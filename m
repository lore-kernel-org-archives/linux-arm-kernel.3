Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2185D41161
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdE2/EIh5PxxtCe8snCSpffsq8cE6agwihA3skxg3X4=; b=uZB1E6b9xE3cF9DX6EOzMyPiMp
	MtNr2cVG/uFAxDBYQ1j0TnUWaQuijpA8B1HC60v8Lyx7PtwdBE0+ezRdQDtp66FB482sXyuK+i8Vs
	vSAuDMRhErn+Rirx7Z/9RcTMsV6M7pN6NuZl3zLG5KoTAwiLrLpTq86XUqIf4l1rAoSl+svzaycu1
	5cw9ScsYAgx8OJHFd46skw2yQ8YVeGoMZKrxNLzvAM9cmBQTJJsLfMCGPItWbywSjVT8vfoMzP+Il
	tr2kwlFX3PiBZEm3ncIHvoFstIcMEWpFUpk34dRnDc81uMqvnBFz54LbFiUgmUM2wFCcbeEV4iCmB
	lNtpNaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKXi-0000000C9b8-3s09;
	Thu, 15 Jan 2026 10:25:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKXg-0000000C9aA-0UdD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 10:25:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so9004665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 02:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768472726; x=1769077526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdE2/EIh5PxxtCe8snCSpffsq8cE6agwihA3skxg3X4=;
        b=epDPlrfVBLoqcjTBVX0QNCC3TAYauaCLsOOjSGQcxgrbgXhjAnmEaHaQYK+10LdVox
         c+9qnaeUnBcH73Sy/Fm3IN7BrRIzfuDMto/87qAtqbgnj94lQCkWxho5KoIhDj3LLbIA
         KUqB/lw0OT4UG6vGi8IxiARrfRIAUS2xW/nUgRP6MqnZXOPjcQ507C8IQf+QtXJgeC90
         fV6wmFwAIdafQl+/bd//im11EQ41JsSM1g1Dh5CADTeJFT0Lzv+Rw6biSgMNZbEDTD/i
         vs1XNzc0lfpkJr09pfvuGGuTvwmV1m28x/ZHBxLUt2aE7N95b/mMBNhZE4apVKRIbd6M
         7DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472726; x=1769077526;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdE2/EIh5PxxtCe8snCSpffsq8cE6agwihA3skxg3X4=;
        b=BcrZrFS4+zaGKANdGZZs/ITYzKZdBvG8ZO2Vs/WZ8hjQay48O0NqZOo7S0/z06DitF
         r49O3e0kmppNszEmyYyWxbDWBf5WIyD7+AgeT6WFESEYz7YVWvTrsnIiqfZFG2I3yzCx
         6qIWWZRu84PmLpMxrbB/zqzArAFC7Jn6Yt5GWlVY77mtF6AlgKoHwP8vAqy5fiuEmhlO
         4HgQRVrTYcKCoeQiNpv3uZf2z1iLB7NGo1R0QkOY8pq+0XMZF3+r/RkIFgIxfOJsk54U
         rCqj3rR0ngNDKbO/S09UQBZQFtL+vLdQbk3NkngCLWP1PSyU+D3opV+P69u/icRX7Yk2
         24PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMQzjnmO2tqvIQH4idHAiQcNU5f9mRlnSbxhUXJ2jsYRCI1cfdcsf/Ghsl6nFnEL3aZqQ7tyVRK/uMuqxmn+U/@lists.infradead.org
X-Gm-Message-State: AOJu0YxImv24p0o9vytXe50MlFmDzR5X2BFklwWI3H0jYY/Q43HcDaMt
	dN/UOyujw0oHialeCS3ugQiGp85vFGCteWcMoL+PZyWpsYNgg4vyyhhWI4veWhw9+Aw=
X-Gm-Gg: AY/fxX5xaNBVuJlaSUVxjkf4aI6PnTm0mqBonN6e6Eio6LdNp+dz+fIFicygZ1ms2DG
	61XLQESgn3D3/Gnn4Jr1Hx6Jf2Hbn1YPjLok6JenTVi0U6JA0E/HJ480kvgpLKJSjrAL/bTpM9W
	5oiphVCeTVNbYEcyW8ydPPohIljcy5R9fF7vV0Qpw8G3rdtMOmGGVse8t8sxm6SAG9YEOUqh/WD
	uvn/JZN40tdMHPN/o3EjXZFBi9/o7nSn4j4ny23f2Yt/zMYrgNmgO74jyGdhI4Ypa6P9zZTWkYk
	Pr7KM2NhG9PLmNg188qDGjgT7DDZPrBygSpve3N6/MtirpHvVdhCfWk+IfgcaZntq1hw8MDouUJ
	U0EQ1D/QZts9pNofbI0g9lDsf4OjunXHi0S3nwi+vu0ROFhMZz0eVl1CqVEL30JikcyaA1GLrVa
	RDfJovT57r+ilpZ1CXayypnizB1QfHOo9v8+BXN77eOnx4VIh2w22UWQKFR0qInLk=
X-Received: by 2002:a5d:5f94:0:b0:430:f718:23a2 with SMTP id ffacd0b85a97d-4342c503303mr6819283f8f.28.1768472725536;
        Thu, 15 Jan 2026 02:25:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a6c0sm5011446f8f.5.2026.01.15.02.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:25:25 -0800 (PST)
Message-ID: <6e72d279-e134-4920-a580-50b6ae5edb05@linaro.org>
Date: Thu, 15 Jan 2026 11:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/3] arm64: dts: meson-s4-aq222: update compatible
 string with s805x2
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com, christianshewitt@gmail.com, krzk+dt@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, nick@xieqinick.com
References: <20260115030015.1334517-1-nick@khadas.com>
 <20260115030015.1334517-3-nick@khadas.com>
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
In-Reply-To: <20260115030015.1334517-3-nick@khadas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_022528_175635_9A46519E 
X-CRM114-Status: GOOD (  14.90  )
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

On 1/15/26 04:00, Nick Xie wrote:
> Update the compatible string for the Amlogic AQ222 board to include
> the specific SoC compatible "amlogic,s805x2".
> 
> This aligns the device tree with the updated bindings which now
> differentiate between S4 family members (S805X2 vs S905Y4).
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 6730c44642d29..0a3f81ea0fb0a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -9,7 +9,7 @@
>   
>   / {
>   	model = "Amlogic Meson S4 AQ222 Development Board";
> -	compatible = "amlogic,aq222", "amlogic,s4";
> +	compatible = "amlogic,aq222", "amlogic,s805x2", "amlogic,s4";
>   	interrupt-parent = <&gic>;
>   	#address-cells = <2>;
>   	#size-cells = <2>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


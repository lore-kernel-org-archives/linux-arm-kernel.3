Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3972EC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uSQneWyD9u8uXUDCmfCQSOWQMsG1MluBHm0qVsycCg=; b=B65nlH67Wl0wnbL0T814Jbn8Hv
	lFZeLV7/18XiGJJoS5sO3eWj+9NpDw8Y/s33vZ3p9wAB3P9oL3O/ujLG2UMAwRCiXsGFQlBF4jqsB
	8GQSs2MkjdiFyjlhYUdmPR3iUwHrOLjK1eKq4OWEjp6vxMSSQZLuloVxSHqf+8AFO8w2UI7u4p6L+
	U7dN2DGKweyLIhmCRd4yc8HpPR8ygeF3ZA5oFFqJWjt2bQiOq0cwDfXKTJnIe0PPN6PdVCDoE5XW/
	gAcSPsyDRVMRBVL58Xgz2TJFhpRiKXFjikqjBX01VD9Ft5yMibr1QjClM2X6zWclniQP1uxY0JRKE
	QeYABDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UXZ-0000000Dsyu-0Tog;
	Fri, 18 Sep 2026 09:05:53 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UXW-0000000Dsxj-2ajj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:05:52 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so5029755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789722349; x=1790327149; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uSQneWyD9u8uXUDCmfCQSOWQMsG1MluBHm0qVsycCg=;
        b=L32eejerRBzuJGzqnXciCKToKO31+xEqNw55YO1IsSxxCNKt8zik8k9wXsvjZ9bgrM
         J5/DQHKmUrkGRs0hzyIQd8InHaGaCeHgnTy+zdR8xAGjHAqyKIuOvPHAvuk7C468XBgN
         S7kdYFmpQ+543MHfDSqQ7FsXZqYP3BAhmlNJV5/8MXkiSXrua6tvQwmizyieMvB+QB08
         LohCWy1VcNhY74NbyoHq1Z4TrAMk4Jok3L1v9/n+B1bpAc57sZ9BTfN6JJOa7I0VXfT6
         NJbDVF2CNSR+fj+Hg/Y+zgULuZaOurDL5y7Tq9etEuels6qUZvzV0TzVeFyqqY9qmFF6
         DC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722349; x=1790327149;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7uSQneWyD9u8uXUDCmfCQSOWQMsG1MluBHm0qVsycCg=;
        b=V0NW2EJXrjEW0OXmULI3O1zbdTxVNvKhcfqk3c6fWi1YxPD7nKOz6Awc7rejaWsgD9
         cyxVHppwdK6Q0i00Agoek0TJURtG9OpqD6EKFL7lql3wqT/16mMXg+J7aY/qETMqRTDK
         zVGrn7fnKfBeSHwA+u3Igm3MVyG55TILkcyG0zVi2/ONAbax145U6BsH6hueXJuAWvoJ
         6PLqBsZpejqPu6HYKjbQlYV738l25Wn4jT5UmXeH4Ks78zf2ICFqQSl1QUIGKr0kbD1n
         cOrch+2fufPmvrXKkFALkFTMieuN3X/fXwsS0DurTIDtnqV7xK2PSjKGRB2T5zjFYaxv
         erNw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ88GbRqUdwXEzG2NVFhChq2HAMe0hL4/D4WSk8LF4pMb9B/i2+aJerueTmqdWwR8AGczzlMO//zFtepwVGE2r@lists.infradead.org
X-Gm-Message-State: AFuF++nWoQZL/ab5XYxTgO5sqGLc/Pew+oM5IFinwlDY3xNFyHXk0wOo
	5aEaFgAMkzC4kdwy+MVgLvaPShAA+FVKvBmCn4mHsoKVliSPWIBqEqMTBv5b+o8YKpI=
X-Gm-Gg: AYBFou2splVF11fu6OnsZzQ4EQDwa+LCubYQc/6fDrkWz07BrNbB1w8h3UKKm0LPNIu
	mngyBuNvrkQFMn0tU8ljgvoccxScBwnWcH21I14sSs/c2DTZ7mX0DTEx2kaFfm/ZpWhDS/IYwgq
	2jAPidsM8OAKedIpWLCnKRCNxGgszPryCEVUDrREOJLIoZuoyM/5t6ypK7pjj50xOK6w6P3ivas
	s2JSjKvWnW6J04qBsRRAU3Dw0mc2vxGEai0E57YYvuaCM6dCvT2FoCIkqviri2KwX+3pM2+zQOh
	62k11ItqWcJ8ySqZtLU13FXiD/wJrFAIPzcnliSvZ8JE6R1NemAzYLuHacoZlTCrQ6uPvPeStjM
	dMWmyo2wzzh2XOOIHo+cpwuLSt0CUQ7r7Eh+wMTIFAp0hty8evuLAFvZ6JLO8vFRe5j8CMbt+Ru
	UwDwCNajD8i6nlussZNctnbjSpoPMV91p/GxAUYSh7CYy2RfIHk3G1TfD/bRh/t14pp/+CcUJr8
	TN7RyEqTWEPzb9RgNv/Pn9NbG8O/BoIOGc99G5ZqvP63XfkfgvDnQ==
X-Received: by 2002:a05:600c:1f8f:b0:49e:8354:26fb with SMTP id 5b1f17b1804b1-49fc574c729mr22905995e9.32.1789722348545;
        Fri, 18 Sep 2026 02:05:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc? ([2a01:e0a:106d:1080:c55f:cb91:1ca5:54dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm26149925e9.0.2026.09.18.02.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:05:48 -0700 (PDT)
Message-ID: <43f75100-b255-462b-aed2-b3f19fb19342@linaro.org>
Date: Fri, 18 Sep 2026 11:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v12 2/6] mfd: khadas-mcu: Use MFD_CELL_* macros for cell
 declarations
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 mfd@lists.linux.dev
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-2-497cd543a148@aliel.fr>
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
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-2-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_020550_714994_7D3D82B2 
X-CRM114-Status: GOOD (  18.50  )
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

On 9/17/26 09:59, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Convert khadas_mcu_fan_cells[] and khadas_mcu_cells[] to use the
> MFD_CELL_NAME() helper macro instead of open-coding the struct
> mfd_cell initialisers. While at it, make both arrays const since
> they are never modified after initialisation.
> 
> This is a pure cleanup with no functional change, done in
> preparation for a subsequent patch which will need to attach
> platform_data to the fan cell.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/mfd/khadas-mcu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index ba981a7886921..0e74efe14f367 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
> @@ -75,13 +75,13 @@ static const struct regmap_config khadas_mcu_regmap_config = {
>   	.cache_type	= REGCACHE_MAPLE,
>   };
>   
> -static struct mfd_cell khadas_mcu_fan_cells[] = {
> +static const struct mfd_cell khadas_mcu_fan_cells[] = {
>   	/* VIM1/2 Rev13+ and VIM3 only */
> -	{ .name = "khadas-mcu-fan-ctrl", },
> +	MFD_CELL_NAME("khadas-mcu-fan-ctrl"),
>   };
>   
> -static struct mfd_cell khadas_mcu_cells[] = {
> -	{ .name = "khadas-mcu-user-mem", },
> +static const struct mfd_cell khadas_mcu_cells[] = {
> +	MFD_CELL_NAME("khadas-mcu-user-mem"),
>   };
>   
>   static int khadas_mcu_probe(struct i2c_client *client)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD80CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgbuIPvwGTDZ1vH1DcLJwAkJi5BHMTFvMXCyADYeRKI=; b=zXHaU9KF1MiYXHZFaajkqolhrp
	3cc+g9ExiHUwXNgYNQzmblrd5Wo/EN45XphzO7Me4MSMoBsBDhdoFT2vQ0uuSVfCMfAlgN5BE7b6+
	ycLfXS94xuTZRpKtWVEqQEBVfG/XTPXjWWf1nWAklQsCU+GTXXDrWAzeb/R/ZMqZkG+HVckIRGC9g
	YGI7XVXpwiHXERvFjNaMZiwrUl96xJmCZpGJC2SIOqNsgERU5Q8ctH7/XTy0ISyNpJH0uyCDNy5wn
	iR8F3JLh23GHSd5UUm2gPEQ5DUX0dMFES2uP8d8cRcCRHqJ7P6+Ua4q2CC6vhSUT8kEgp45QxowUP
	Q9gkxYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdZE-00000001A0x-1xsR;
	Wed, 06 May 2026 14:49:40 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdZD-000000019yY-1jrf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:49:39 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-449de065cb3so4208281f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778078977; x=1778683777; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgbuIPvwGTDZ1vH1DcLJwAkJi5BHMTFvMXCyADYeRKI=;
        b=JrhYrE+S9MzFP6Nq6tTfOU+5OBmIToQj2bctqfpYBJg6BTNpHavH5888toanlK1DLL
         TPIeWIRuyxaYSBUWcJ0Y+UpsLR+B1LH/Wjsk7/0KZL6l5f1VzLRTbaMe3JNcPgUdF4S3
         xTaE0UHdUB6EWE2aErNydIxM1TRO76ffDjumySBjGefAhyfzTEJGrDxTidYzizO6ulm5
         rnXCbRUUzraJu03/IDhzOBl4xfDKZZE6h3MOeS5ZxOC5o7e7PSL3PhZHXhntC7mN5jiz
         3AWLzEgU/4dPFCQ3/KgGYUpRtmQhoflxYVp3CDv2vSlgIxGdDOtARjF6Ys30jxethYDG
         lVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078977; x=1778683777;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgbuIPvwGTDZ1vH1DcLJwAkJi5BHMTFvMXCyADYeRKI=;
        b=JNMIvAiWmo1wD/G8aZ1mG6RO36Bd7ilp+WtWWdrq4yROuj8/4sUESTvxn0vAqUDlbT
         JamembPeOh/2/4KtaWVhhJC0tixPIWoafDm8b19Bivbe1HIdybt/rKoMt1x6fpOWbLSZ
         8CUtLsWZaQQ7B/SBo7wamx2f915SAiVmr9iHJPOC/C0DlnGUlDfk+uvcEnWn2Tvymsnq
         qMXcI65JJ2LIc471ZEB0T7c35TEXG0V+eET7EAg+62a3MVekn4I+ltXYzI3qtYbWgSxx
         rm2oj8SPtr2EAWeITpQ1WMd0XXaZ3qPfnRj1Si2Jz45MBZPK8JWCSJZjaEVuJxntcBav
         VzJA==
X-Forwarded-Encrypted: i=1; AFNElJ/5wcDLy3bbRs4lUvnvqwaGD+snZvZ0JYyJIRSIPuti5vieWfOU4pDJdXXprgPDYRQadXdpr9E9qti5sqRm7r9x@lists.infradead.org
X-Gm-Message-State: AOJu0YyCeeXgxh57qys4Em2MfaM96OOTKzeZn78eLpXQmXBfD6nq8OuG
	aqVafIpCk2sBkrHZvstbsQjSrJpMN6RphbWwxzNqie5b3S5V+CCflNAncMsee79fJjA=
X-Gm-Gg: AeBDietoaPLAxDeohXXLiLyZJK8UgKqXrPmoWBCkHFgoFMoMNUkVad91jTdnGJGwsm4
	4lWNpkfoGkPlN+hIcPp8Cd8KCkAbEC5qy2iDxfwpAXbu5dsou5ZmnOfjxdgYSK0v+mOImi/lbZb
	ZhudAaaPRT6paYK0jlkJvrxbxd3yTwI/nVMpbeKwUDWxnmJc1kO/4hTMSSUpQbkUDrkjM/EIx+I
	8tav6KjQBBNHXfA9cg2IdDBH/J9TaGc2tHB/2xu2xbyfY6EImTJ0KQEouJsNVDZO6KskYJKZxdS
	uX2z7VK/PNPWBiPp1M13bQMCDdsRPZiqh1Z++kgP71u+6aSYa7/kZ7UYWLBvE80eSCiYtGDWC8H
	TnbksSMFGYoN600lXWBfHIy02SLut73n1B1kcF7H4DbtsYZ59R6DX0qwBkt+S1Ycp5o0acZ2NLy
	btFeox2ZNq3Gc4Vgos3BnK+/Nkzh1cpDitdYFDcaYdQCcuBzQLfhNrG78iUr4QR87icqtPEhHIW
	gcdHW3Zu4nBXUNNKw==
X-Received: by 2002:a05:6000:2013:b0:43c:f3ef:ee36 with SMTP id ffacd0b85a97d-4515d4d0fbcmr6911189f8f.33.1778078977349;
        Wed, 06 May 2026 07:49:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02c5asm13014040f8f.19.2026.05.06.07.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:49:36 -0700 (PDT)
Message-ID: <ab5efb9a-a2a7-4871-94c3-599ba8510dd3@linaro.org>
Date: Wed, 6 May 2026 16:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 05/16] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 devicetree@vger.kernel.org, William Wu <william.wu@rock-chips.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-5-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-5-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_074939_485024_A600EE6B 
X-CRM114-Status: GOOD (  17.73  )
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

On 4/28/26 18:13, Sebastian Reichel wrote:
> From: William Wu <william.wu@rock-chips.com>
> 
> According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
> the device under test(DUT) must not respond if LFPS below the
> minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
> platforms, because the default LFPS detect threshold is set to
> 65mV.
> 
> The USBDP PHY LFPS detect threshold voltage could be set to
> 30mV ~ 140mV, and since there could be 10-20% PVT variation,
> we set LFPS detect threshold voltage to 110mV.
> 
> [1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf
> 
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> [Taken over from rockchip's kernel tree; the registers are not described
> in the TRM]
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 1f686844c337..97e53b933225 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
>   	{0x0070, 0x7d}, {0x0074, 0x68},
>   	{0x0af4, 0x1a}, {0x1af4, 0x1a},
>   	{0x0440, 0x3f}, {0x10d4, 0x08},
> -	{0x20d4, 0x08}, {0x0024, 0x6e}
> +	{0x20d4, 0x08}, {0x0024, 0x6e},
> +	{0x09c0, 0x0a}, {0x19c0, 0x0a}
>   };
>   
>   static inline int rk_udphy_grfreg_write(struct regmap *base,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


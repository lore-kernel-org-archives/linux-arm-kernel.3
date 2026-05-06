Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77686CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpSjTagPhl7VYCNjsjMoXdAj9yIuGfraDWHI738kHCI=; b=SqMjtuteINBY3bg6zJpLuiirQ8
	qwOTnw9eCmAkY2CzQ53t0PRlkDgW49PwbyXRKz7qm0yreV3aXqEBG1GQ3NwzaoAWlKo/1X82Xodcz
	oGfrxzu1dmdw1iSZ5WMvV8I98DVK5IQmE9pUEL9JMQ9vooEZFeM7TUMF7D3dWaGJf0Fu1rew7c0XX
	MLHjPpf1jRBng1WLfZevhD35S/uOvvqdd90rGx2KaF09+Wi8afM+vyo34Wl1NI36Pt5KEfxXPuh1q
	UxxHvKbKwxk4mgJiHqkWY9bgcIgrR7cZHgkkaeSso+sstoAfhuod4vXr6mwheRPaHJ0qr1LA4xSm1
	yV70/Pag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdcs-00000001BTQ-0mG6;
	Wed, 06 May 2026 14:53:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdcr-00000001BSF-2KwA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:53:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso3721055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778079204; x=1778684004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpSjTagPhl7VYCNjsjMoXdAj9yIuGfraDWHI738kHCI=;
        b=dPkszWCv/9wKUzcafLnh14VeBkrPI7IF49vAAgeunmgMBH0UQFYm9lyE3zle8lO7h0
         5jdybIvCTnTemB3H+MG9bbm9j6Ntj6Qg4fnRMIq42/MhMH9GnSvtqafarCnte284q/qr
         mapafzoxGTGbmg0blZKhFjNdDBATcqdrdFqOERAtfRllgudoBA+sRDQpoeK3jZICnVTH
         MR7qiH7Zvv5BL5HF//9VzFOo8a/tlCtdRdR5HoTmWcyn11Cjg93QcJbTGm0jDEKqM1kM
         XRN83iX81BvG8wKx73d9yjeWbm2avbjgjopVuS1nG1WisoijP2barytRuFOX/okSjVsH
         QIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778079204; x=1778684004;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpSjTagPhl7VYCNjsjMoXdAj9yIuGfraDWHI738kHCI=;
        b=TDg0vrAfMT6M7EJaLykbXzrw/MrYrnq0AuxYtKlO8OWTj47iRapIq9WBMqt89a9KV8
         5VrEt5ovwdDej1Git5A1U83Y8/iqJEC1oVj9D79HymDKV6FcIyskQeSExJ10gJUbYaKb
         yyu1Y/NfY3m5SmWceM0AON+1KJblXd9WtlWhsKg46MS0Xn+j8Kkd1KtB//JIGUGp2UmD
         BVL2Hh641mnSWtRGrMnwAj9GX6NNK3WqAXSRcffs4wGmTbQT+HO2Zo/ZHDF5ZZ3J2HcJ
         7+U9xoww7uTf/Sqh4vpKnKptVIJeT9ANyNJZtAz5/NryfcZW91zr2bAJHI9UWuiNEFL4
         hAZg==
X-Forwarded-Encrypted: i=1; AFNElJ+D9d7TJvdzu96A3Pey1fhyteLEq617Sj9vHBIVb5r+4q+w8I64TjEMbEdiJJq1cm5iIc9USbDDLmXUHTSmZXeq@lists.infradead.org
X-Gm-Message-State: AOJu0YxoCoRzmHbj978/7Em129KspGVjcH2VKcPRBrODVQv4oDaZENfP
	txlumYgacvqCL2CSYSAPmihOk3JFslIOQKa1SWlzkDYrxsvGwdEu+m+BALqOSUfcjXY=
X-Gm-Gg: AeBDieszIoIhdOnob6j0CxFXX+omdqQVoKLs1wzgy2/+ecUCwR05piosf0J0brM46Ll
	gkHRtsQEnQUyAoTkEJS6yMVKvOwf+dLdCR4WsGkwgIvc0lQoVuyIOXMoQMOWvPt8wnrqoBw0Bxk
	UVV9Um7ON8qlQE6kZFC79kRV1cUV8guroiY3fYxgtFloyCSKci4noWfo4kJNBsgmWRTkmLCdY6n
	7MlUG6RNPIjunSIdYyiwKaFYyNkhHbIx3FRixsAQP6+14M4Ae6aN0xgt4bJLHL1Ksq2MLg9aBhG
	BzyXFPtI7Y4pYDyw/ROizOeR5p9ojQpVGhsiLbnFlBFIL3Y8jp20OO2kSIZIuK0JOCI+/u6rhAz
	tAKspcSO7pWaUK9leC8SW5Zu21AnpmBHc74QnX6APnrcT/M2tWlqjKUMHtAZxNCPEDv9U6hzTZr
	ul55wBdSIyZEi68RcX/Uci1UVfAt85Vf4Q855i+bXYHw+OkJbil0NpHGpiUbasN+Ji60hYilonr
	qs+ZcPqwJxFrelhzA==
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr72610725e9.21.1778079203544;
        Wed, 06 May 2026 07:53:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530a68aesm28180715e9.1.2026.05.06.07.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:53:22 -0700 (PDT)
Message-ID: <40518e75-fea1-4367-a47a-024cf115bd12@linaro.org>
Date: Wed, 6 May 2026 16:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 08/16] phy: rockchip: usbdp: Rename DP lane functions
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 devicetree@vger.kernel.org
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-8-7775671ece22@collabora.com>
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
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-8-7775671ece22@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_075325_631873_2CE3BA56 
X-CRM114-Status: GOOD (  16.35  )
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
> The common prefix for DisplayPort related functions is rk_udphy_dp_
> (with a final _), so update the two DP lane functions to follow that
> scheme.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index bf8394174294..6d7ca11b308e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -547,7 +547,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
>    * ---------------------------------------------------------------------------
>    */
>   
> -static void rk_udphy_dplane_select(struct rk_udphy *udphy)
> +static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
>   {
>   	const struct rk_udphy_cfg *cfg = udphy->cfgs;
>   	u32 value = 0;
> @@ -576,7 +576,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
>   		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
>   }
>   
> -static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
> +static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
>   {
>   	u32 val = 0;
>   	int i;
> @@ -1072,9 +1072,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
>   	if (ret)
>   		goto unlock;
>   
> -	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
> +	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
>   
> -	rk_udphy_dplane_select(udphy);
> +	rk_udphy_dp_lane_select(udphy);
>   
>   unlock:
>   	mutex_unlock(&udphy->mutex);
> @@ -1092,7 +1092,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
>   	struct rk_udphy *udphy = phy_get_drvdata(phy);
>   
>   	mutex_lock(&udphy->mutex);
> -	rk_udphy_dplane_enable(udphy, 0);
> +	rk_udphy_dp_lane_enable(udphy, 0);
>   	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
>   	mutex_unlock(&udphy->mutex);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63F7CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3d9aSuODkFC9g/oScA6ndSxxtPyvcgy72vCoZYW6hk=; b=V+2mIyhPeusbY7iqYvJSbQQxGs
	0Aug1xbKe8GvDtu8QsOwV/EWKlwatn6GceKMQPCXr9z5sBksFmGnGmvFVZx2NNpGunlXW0kDeoTGE
	oz7tQc40WfHv8Luy4DPa1cqE3SfhRcAInMWuBSQoghf6YWNhZ2AKtO/1Z/5oZJt6isz6dvBLxzGU5
	YfsVAOlPR81VmbrmPzrAfo2VymAXTnKi+8FU9+CCqB2RRXBwExz4LPjBWVXPJm+de77tIPFAto6fG
	SCIAHrwkXTMtlPWqyWw5nEvkFdnOdX8E+h4f40wTdfUjI4R8+jBCcUYb8338FdOQ1w+EvqYHGCVQf
	kr/rWJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHmJ-000000008ri-144c;
	Tue, 18 Nov 2025 09:13:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHmG-000000008qj-1sJH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 09:13:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477a219db05so13548995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 01:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763457210; x=1764062010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3d9aSuODkFC9g/oScA6ndSxxtPyvcgy72vCoZYW6hk=;
        b=z8ZnnMX/te44kUaQROOmdrbhGCUuddwUvQh+fSh79eLDAfK8NlSJrilDCITqgsOl6M
         eNpsuPSwf5gBqfLNHilmUD0uc2vi4Ma1ynDda4dj6rCrGXc0x0IKUdoQngnp8JT4IrHF
         2HJMETBZLBvF/qmP72otcJnqk06GHO5nXgupfBJ6a+QCxh/Dd7/BR14vPgcAatBVb3dF
         9F7muzs2o+gZt3qF8leMBFYQ0zEMWnvoXg0cjx9U3XwtUyCUamHB+uYz3fXcEUi29oeL
         exCGbUTSacVAXZbNPG+HDdmE8c/vUjrjqXSuwmUlbTveXn4svtKEHDu7MpD3HmZh+9Uk
         /asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763457210; x=1764062010;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3d9aSuODkFC9g/oScA6ndSxxtPyvcgy72vCoZYW6hk=;
        b=bXmvjxjStkBXfwy40PaUgE7fJorNAZ6heO1eg7KMDB+F+sObMygHKDFlCZzxbgv0h5
         2x1EZ9Tm/xIC0+mko2eeEhlTGQgDRqZQqFgbCHWMIsBWeFBp0q7NLnx8fKb1ZT1a6jUI
         E5YhCxJK/Z6DvhF/fF//F0/oNtxQB4coaQr/nMES+Alqrz6F/9wlqc1pizg4UgZekgFE
         W3qQdEQX3siJvSaG6JB9kfhEs1sIrtd21dAnU17rwxwXAGvSpKRZhW4/Iv7zmNC6uQV3
         t/23i9w/0fZC3UHbbnUbflt4mZ987NgNGcEEzbTLBazmyn9ACtpEvPSMK2higL4AbrYA
         5toA==
X-Forwarded-Encrypted: i=1; AJvYcCW+DmNFgVnvBSpCwXvVI9U/F/l6MajWFeX0TihPKfzDEC/UQjmwURO2TukR6ckhA17nQFhVSX4USXqt8vvrh6/K@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8wGCIqMTmZHNS+r67bTrlxiejBKowvaIHKEmp1pbVb9lWBJt+
	zGKwd+gBSYA6Yx04HT++lKbmhYoVvTImXUjNcoe4Hh8DumeBekOq9+S/ZQKQKC9qaIA=
X-Gm-Gg: ASbGncvTGTwip3NvdGxWbnUhvwsmtJP543WrdmzJjvtco91BfyhPo4VGwwQ7KpJ+pJQ
	72SMTcMXxaP8dSWBxpZgPj1dTxxKHucOmn5PSiCxYa4uyrjQ6MzU8DKUIYP3LudZjDoZyhlCiTX
	igrYXEU6ZwzCnxdYTxOYl8fkQaMdTiRUllINBIZQovODl9MlQ1V2jl5rjN5VOul6yCvtgQ1CUuT
	MroqtGJAyTh2z2ATNmelVfRryqQBadgR7FOkf7cTfkC9KK487Vle3wLBg2jmQNECNafDPp+Brmf
	dV/cOr7cjWm9XL+cmBulUqEBQtl9GSf/DJ70+NpW9kCjDq5EnLkT4gokxgtfEtjFivSGpLFAhZJ
	JWAjZIYNnsddS64advWYAodC2ZI6okAsRtJna0XDTsnfxgGRcA5PWtPeLYrK4C2djxzzHGktJiT
	ONcyfSILpLJPUJ8dV0YPL4uvr6+ArLnaQLnWk5h+EDMSGdTgqytibKBR6Kb05EUJI=
X-Google-Smtp-Source: AGHT+IG0kFz9gx02O1y5oWOQ9n3OLuLQ5sSciCR005X4QnJdS+EzbkU+x3njzrapxSpWUzk8bgSoEQ==
X-Received: by 2002:a05:600c:3b25:b0:477:7925:f7f3 with SMTP id 5b1f17b1804b1-4778fe62d4emr129814195e9.14.1763457210262;
        Tue, 18 Nov 2025 01:13:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97213b8sm13156565e9.1.2025.11.18.01.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:13:29 -0800 (PST)
Message-ID: <c95faaf1-57e4-4387-89c1-be6befc79416@linaro.org>
Date: Tue, 18 Nov 2025 10:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 1/2] phy: add new phy_notify_state() api
To: Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20251112-phy-notify-pmstate-v5-0-39df622d8fcb@linaro.org>
 <20251112-phy-notify-pmstate-v5-1-39df622d8fcb@linaro.org>
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
In-Reply-To: <20251112-phy-notify-pmstate-v5-1-39df622d8fcb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_011332_516504_2CA508D3 
X-CRM114-Status: GOOD (  25.62  )
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

On 11/12/25 17:27, Peter Griffin wrote:
> Add a new phy_notify_state() api that notifies and configures a phy for a
> given state transition.
> 
> This is intended to be used by phy drivers which need to do some runtime
> configuration of parameters that can't be handled by phy_calibrate() or
> phy_power_{on|off}().
> 
> The first usage of this API is in the Samsung UFS phy that needs to issue
> some register writes when entering and exiting the hibernate link state.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v5
> - Fix typo phy_notify_phystate to phy_notify_state (Russell)
> 
> Changes in v4
>   - Add missing 'used' word (Vinod)
> ---
>   drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
>   include/linux/phy/phy.h | 19 +++++++++++++++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 04a5a34e7a950ae94fae915673c25d476fc071c1..60be8af984bf06649ef00e695d0ed4ced597cdb9 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
>   }
>   EXPORT_SYMBOL_GPL(phy_notify_disconnect);
>   
> +/**
> + * phy_notify_state() - phy state notification
> + * @phy: the PHY returned by phy_get()
> + * @state: the PHY state
> + *
> + * Notify the PHY of a state transition. Used to notify and
> + * configure the PHY accordingly.
> + *
> + * Returns: %0 if successful, a negative error code otherwise
> + */
> +int phy_notify_state(struct phy *phy, union phy_notify state)
> +{
> +	int ret;
> +
> +	if (!phy || !phy->ops->notify_phystate)
> +		return 0;
> +
> +	mutex_lock(&phy->mutex);
> +	ret = phy->ops->notify_phystate(phy, state);
> +	mutex_unlock(&phy->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_notify_state);
> +
>   /**
>    * phy_configure() - Changes the phy parameters
>    * @phy: the phy returned by phy_get()
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 13add0c2c40721fe9ca3f0350d13c035cd25af45..2af0d01ebb39f27dfb34ccb5140771beef8288d5 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -53,6 +53,15 @@ enum phy_media {
>   	PHY_MEDIA_DAC,
>   };
>   
> +enum phy_ufs_state {
> +	PHY_UFS_HIBERN8_ENTER,
> +	PHY_UFS_HIBERN8_EXIT,
> +};
> +
> +union phy_notify {
> +	enum phy_ufs_state ufs_state;
> +};
> +
>   /**
>    * union phy_configure_opts - Opaque generic phy configuration
>    *
> @@ -83,6 +92,7 @@ union phy_configure_opts {
>    * @set_speed: set the speed of the phy (optional)
>    * @reset: resetting the phy
>    * @calibrate: calibrate the phy
> + * @notify_phystate: notify and configure the phy for a particular state
>    * @release: ops to be performed while the consumer relinquishes the PHY
>    * @owner: the module owner containing the ops
>    */
> @@ -132,6 +142,7 @@ struct phy_ops {
>   	int	(*connect)(struct phy *phy, int port);
>   	int	(*disconnect)(struct phy *phy, int port);
>   
> +	int	(*notify_phystate)(struct phy *phy, union phy_notify state);
>   	void	(*release)(struct phy *phy);
>   	struct module *owner;
>   };
> @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
>   int phy_calibrate(struct phy *phy);
>   int phy_notify_connect(struct phy *phy, int port);
>   int phy_notify_disconnect(struct phy *phy, int port);
> +int phy_notify_state(struct phy *phy, union phy_notify state);
>   static inline int phy_get_bus_width(struct phy *phy)
>   {
>   	return phy->attrs.bus_width;
> @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
>   	return -ENOSYS;
>   }
>   
> +static inline int phy_notify_state(struct phy *phy, union phy_notify state)
> +{
> +	if (!phy)
> +		return 0;
> +	return -ENOSYS;
> +}
> +
>   static inline int phy_configure(struct phy *phy,
>   				union phy_configure_opts *opts)
>   {
> 

LGTM !

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


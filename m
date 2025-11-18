Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FDBCEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 09:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PebSiGPl1ns0dYlefJC1vEn1itPg8Ola/syHJIvUBo4=; b=epp+OUUzmUwpBy3NJPGg3l/ZvV
	B0rUfRQKax4HBW48rd8tOxQcLVqXarJtCsquuZgpRd9YMP2mXa3xFnnxN4/Y2sgCUWoLQ6wLKzJth
	3GRz+h7l2f/8UXSKC8lDGzT21zX2XtBr5Eg0pHegQ76S/T17UK2g+v6e+ZxG0I/PLNABswUDcPbvH
	Zv+D8Lz+PK7QqZjm9dcIw0R4cQjtwe4El0ViNsPwVlqvVWmeuhJWu3gUG1JOuHoDsANbNZLNf3OjX
	z0Cvb91tyKGNzv2MDjqDi57ZGrLRpaSQeaVg/L7GdzVsb73W1GuVqDy6xLDZg1P37adiqKqwuFJKN
	/MRdWyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHmy-000000008zH-0fKS;
	Tue, 18 Nov 2025 09:14:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHmv-000000008yK-1Py5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 09:14:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47796a837c7so18726035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 01:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763457252; x=1764062052; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PebSiGPl1ns0dYlefJC1vEn1itPg8Ola/syHJIvUBo4=;
        b=iPwHEFfv+G640eETyVp4UbfC7UAiw7DZ9qe5fokn4jgcVLO8cIFB5FoaOIg9Lw8Etk
         ktttKf8cRIfk3uC59gGGpIsHZPlxYI7awMX/3w7QI5B5c7+zQo4YzONazZzFfQ3OLBYW
         qIXhl3fDy5leRKD6uahWvco9b+OHJnaZ4ZRhjt0qXbATvwHqgosLvGVETUYQSNzgdMiB
         JUbhMuH3/553Kt70rQcOeVTaMggfKsVSBG6Q5ofRqx2G3t2QlnOyyH/Ge4OAZCspzdmQ
         5gy0NSwCf/by+Tpfobz+R0npCwJGbA5+W6WnWkAZML7b3zYjKQqwpFR9yI8CPQ2tLw8/
         nqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763457252; x=1764062052;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PebSiGPl1ns0dYlefJC1vEn1itPg8Ola/syHJIvUBo4=;
        b=lvofInBNjfzYfPIDUzGVFD7Do0F6i2WsYvW/jhRTpA1fsIqnVFvD6YhgigcgkEAThN
         KBAiHrzWgZVk+ci3LSr8a/thUJQIBxWfhWxH1+kKS7TTAjq7Dkfv6AGmo3p5x5MGqzyx
         1q/ffQKIyrKB5jxeB2FKz7bFYHpPL7wc2zcDAfJrHKZxgZNO4HWCgDXW/8TyWkq3Fz44
         023CsTLExIgro5ynn4LJYU7gjDOpLL9ACxg2VKhbx4yILc1flPteiKh3HRj6/Cb4ixBa
         O5fkztQJm60CT7nrt2WvXkCd2Jfqyt2wVPp2Lx/cDiqjFMY2ETwTiMVg8AbJIGH7G5zw
         JUag==
X-Forwarded-Encrypted: i=1; AJvYcCVUatvLtcl1mu1Zt5HPg4gW1XqiZva6io7khuP8pYU3zphUSzD1kGuHEHNMQ8YGN8PcYGBdBb7sWOJGSfY6t5uM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm9w5qVDGLCxGLageVsxN7gZZVKz7eR7LeqdHcXL2rvdW5P+L1
	DVKgnsS0nb7kI7MVcl+wkHy47SCd3mj5RuTyOZJhiUkUIJlRZF6NADdE9laj3XQqyQU=
X-Gm-Gg: ASbGncv6SfrQum1R153YFEX1gu+LUgHXak6Vl6HzmsOAyKI8DgzAGbsqfm1oxguyLFa
	JheObwbqWaww6heNSKBe9WbkMbXMU9qAO2NTQXbzFi+ocVMjQGU+z62QyPBazo0zbxCYuSAC9nb
	g+iVFVMfI+aD/K1QoHbN2ejSfQGRHCSgVRnfNWsaEwZ0kDzrCE2K47fMINxQPwqxpHizvw1QPii
	SNapcJ+YCKqje6tlqRo9B4aQd2xvKbodZjNf5ijD3BdF5w/YMTW9Ct0ihW8ICwtMOCcI7K4XpDV
	XKtPT/6mtkgsn+jK7KvN+/8hgbSwbkxW71HAB7yagd1DPw15g07wY0t1Soj0utmlO30GKDhX45M
	65zNZNcQC5fMhbpcttPa4N4ZyPbXKPRiVCVt1s0rcqv3pnzyOit2TZ5mMtZGfiYm9CnpS2qdzo4
	Pieri3z2stAoxQ4Q/xzaSc0nKefbtNLPMn6pIbOHRQqHgUJpdnl4DN/eZzdYYGKmlZ2HTqrmc1f
	Q==
X-Google-Smtp-Source: AGHT+IEYy6/KbbCp7l8IvIhZJFi+0VW8FfDRXOxrQm9yiGuqpablbDwGJU0+st74VLAeFQ7djiYlnQ==
X-Received: by 2002:a05:6000:1845:b0:42b:3aee:429e with SMTP id ffacd0b85a97d-42b5938a9d7mr14137889f8f.56.1763457251502;
        Tue, 18 Nov 2025 01:14:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49? ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f174afsm30272784f8f.33.2025.11.18.01.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:14:11 -0800 (PST)
Message-ID: <254ec2db-bfe2-43aa-8bd5-a45ec89a7d0b@linaro.org>
Date: Tue, 18 Nov 2025 10:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/2] phy: samsung: gs101-ufs: Add .notify_phystate() &
 hibern8 enter/exit values
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
 <20251112-phy-notify-pmstate-v5-2-39df622d8fcb@linaro.org>
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
In-Reply-To: <20251112-phy-notify-pmstate-v5-2-39df622d8fcb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_011413_429984_A880B81F 
X-CRM114-Status: GOOD (  22.19  )
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
> Implement the .notify_phystate() callback and provide the gs101 specific
> phy values that need to be programmed when entering and exiting the hibern8
> state.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v4
>   - Resolve Intel 0-day warning
> ---
>   drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++
>   drivers/phy/samsung/phy-samsung-ufs.c | 40 +++++++++++++++++++++++++++++++++++
>   drivers/phy/samsung/phy-samsung-ufs.h |  7 ++++++
>   3 files changed, 75 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
> index 17b798da5b5761f8e367599517d2d97bf0bb6b74..a15e1f453f7f3cecd6d3aa75217633ac4b6085d0 100644
> --- a/drivers/phy/samsung/phy-gs101-ufs.c
> +++ b/drivers/phy/samsung/phy-gs101-ufs.c
> @@ -108,12 +108,39 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_post_pwr_hs_config[] = {
>   	END_UFS_PHY_CFG,
>   };
>   
> +static const struct samsung_ufs_phy_cfg tensor_gs101_post_h8_enter[] = {
> +	PHY_TRSV_REG_CFG_GS101(0x262, 0x08, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x265, 0x0A, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x1, 0x8,  PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x0, 0x86,  PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x8, 0x60,  PWR_MODE_HS_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x222, 0x08, PWR_MODE_HS_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x246, 0x01, PWR_MODE_HS_ANY),
> +	END_UFS_PHY_CFG,
> +};
> +
> +static const struct samsung_ufs_phy_cfg tensor_gs101_pre_h8_exit[] = {
> +	PHY_COMN_REG_CFG(0x0, 0xC6,  PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x1, 0x0C,  PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x262, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x265, 0x00, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x8, 0xE0,  PWR_MODE_HS_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x246, 0x03, PWR_MODE_HS_ANY),
> +	PHY_TRSV_REG_CFG_GS101(0x222, 0x18, PWR_MODE_HS_ANY),
> +	END_UFS_PHY_CFG,
> +};
> +
>   static const struct samsung_ufs_phy_cfg *tensor_gs101_ufs_phy_cfgs[CFG_TAG_MAX] = {
>   	[CFG_PRE_INIT]		= tensor_gs101_pre_init_cfg,
>   	[CFG_PRE_PWR_HS]	= tensor_gs101_pre_pwr_hs_config,
>   	[CFG_POST_PWR_HS]	= tensor_gs101_post_pwr_hs_config,
>   };
>   
> +static const struct samsung_ufs_phy_cfg *tensor_gs101_hibern8_cfgs[] = {
> +	[CFG_POST_HIBERN8_ENTER]	= tensor_gs101_post_h8_enter,
> +	[CFG_PRE_HIBERN8_EXIT]		= tensor_gs101_pre_h8_exit,
> +};
> +
>   static const char * const tensor_gs101_ufs_phy_clks[] = {
>   	"ref_clk",
>   };
> @@ -170,6 +197,7 @@ static int gs101_phy_wait_for_cdr_lock(struct phy *phy, u8 lane)
>   
>   const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy = {
>   	.cfgs = tensor_gs101_ufs_phy_cfgs,
> +	.cfgs_hibern8 = tensor_gs101_hibern8_cfgs,
>   	.isol = {
>   		.offset = TENSOR_GS101_PHY_CTRL,
>   		.mask = TENSOR_GS101_PHY_CTRL_MASK,
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
> index f3cbe6b17b235bb181b3fae628d75822f0c9183a..ee665f26c2361ff9c3933b10ac713bbd9085b459 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.c
> +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> @@ -217,6 +217,44 @@ static int samsung_ufs_phy_set_mode(struct phy *generic_phy,
>   	return 0;
>   }
>   
> +static int samsung_ufs_phy_notify_state(struct phy *phy,
> +					union phy_notify state)
> +{
> +	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
> +	const struct samsung_ufs_phy_cfg *cfg;
> +	int i, err = -EINVAL;
> +
> +	if (!ufs_phy->cfgs_hibern8)
> +		return 0;
> +
> +	if (state.ufs_state == PHY_UFS_HIBERN8_ENTER)
> +		cfg = ufs_phy->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
> +	else if (state.ufs_state == PHY_UFS_HIBERN8_EXIT)
> +		cfg = ufs_phy->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
> +	else
> +		goto err_out;
> +
> +	for_each_phy_cfg(cfg) {
> +		for_each_phy_lane(ufs_phy, i) {
> +			samsung_ufs_phy_config(ufs_phy, cfg, i);
> +		}
> +	}
> +
> +	if (state.ufs_state == PHY_UFS_HIBERN8_EXIT) {
> +		for_each_phy_lane(ufs_phy, i) {
> +			if (ufs_phy->drvdata->wait_for_cdr) {
> +				err = ufs_phy->drvdata->wait_for_cdr(phy, i);
> +				if (err)
> +					goto err_out;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +err_out:
> +	return err;
> +}
> +
>   static int samsung_ufs_phy_exit(struct phy *phy)
>   {
>   	struct samsung_ufs_phy *ss_phy = get_samsung_ufs_phy(phy);
> @@ -233,6 +271,7 @@ static const struct phy_ops samsung_ufs_phy_ops = {
>   	.power_off	= samsung_ufs_phy_power_off,
>   	.calibrate	= samsung_ufs_phy_calibrate,
>   	.set_mode	= samsung_ufs_phy_set_mode,
> +	.notify_phystate = samsung_ufs_phy_notify_state,
>   	.owner          = THIS_MODULE,
>   };
>   
> @@ -287,6 +326,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
>   	phy->dev = dev;
>   	phy->drvdata = drvdata;
>   	phy->cfgs = drvdata->cfgs;
> +	phy->cfgs_hibern8 = drvdata->cfgs_hibern8;
>   	memcpy(&phy->isol, &drvdata->isol, sizeof(phy->isol));
>   
>   	if (!of_property_read_u32_index(dev->of_node, "samsung,pmu-syscon", 1,
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
> index a28f148081d168344b47f2798b00cb098f0a8574..f2c2e744e5bae87c9cfcaa17f4a09456f134966a 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.h
> +++ b/drivers/phy/samsung/phy-samsung-ufs.h
> @@ -92,6 +92,11 @@ enum {
>   	CFG_TAG_MAX,
>   };
>   
> +enum {
> +	CFG_POST_HIBERN8_ENTER,
> +	CFG_PRE_HIBERN8_EXIT,
> +};
> +
>   struct samsung_ufs_phy_cfg {
>   	u32 off_0;
>   	u32 off_1;
> @@ -108,6 +113,7 @@ struct samsung_ufs_phy_pmu_isol {
>   
>   struct samsung_ufs_phy_drvdata {
>   	const struct samsung_ufs_phy_cfg **cfgs;
> +	const struct samsung_ufs_phy_cfg **cfgs_hibern8;
>   	struct samsung_ufs_phy_pmu_isol isol;
>   	const char * const *clk_list;
>   	int num_clks;
> @@ -124,6 +130,7 @@ struct samsung_ufs_phy {
>   	struct clk_bulk_data *clks;
>   	const struct samsung_ufs_phy_drvdata *drvdata;
>   	const struct samsung_ufs_phy_cfg * const *cfgs;
> +	const struct samsung_ufs_phy_cfg * const *cfgs_hibern8;
>   	struct samsung_ufs_phy_pmu_isol isol;
>   	u8 lane_cnt;
>   	int ufs_phy_state;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


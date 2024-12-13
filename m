Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA57BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEItgojaVXZbU1GN6003YTd4LyqNe/xYZINzdoL1yzo=; b=M0EVrcLtW7dcDk8zpdVNly2Tm9
	cwOS8cKruKhqFwojrYg5vG6FhjW4REzWIKLvIAfkf3FJHycAcHvO2vaNiPzWopk6ypE7tLMBrv7Sp
	23jWWjSMDclv1ZmmJqrRMSp0cTSjz+TB4jjML3L51Xu6/RkL+fXvQXQB6sdcF+HYHN+bjehnJpTuT
	zMypuAZf2hnEH9oRXZxqL9xK+Hmllrefo+PybP+I6rCoHR9IH1+4dCusrFiDKc/o/SrnenkuiJhrn
	5WWMMZDsyKNpjjzEj0CVKWU6siAbLZf1fS1f5KmnLbX3QWAg69bFE/O0VdeABy8Me0j2xjX6lQ7sa
	PBMXd7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8co-00000004QL3-0jFi;
	Fri, 13 Dec 2024 16:34:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8aV-00000004PqC-2R3W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:32:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-382610c7116so956561f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734107542; x=1734712342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEItgojaVXZbU1GN6003YTd4LyqNe/xYZINzdoL1yzo=;
        b=u1v5ICEc2pSt69wwsn6ry17etZkZQlwccbxtTsVI6iTmUn1MOwq9Hn3J24cX0+eqpf
         1/e5hk7HuyHK6RamEzLljNxds8KONysIYkYzMxh2MWic83aJv3z+RHDbEYNFATuFTFsW
         ZYZ7RJJyqab0DEGG8rcJvYoRCTOw3YzzMX/29LOyddsE7O6Rm2m+hMWimes9b1xFJszb
         h8Qq5KE8isQzAGlXoyUo/IC7y4dwDtw610V22hSoBCdlRdiUIQg7WWqAK9ECpX6DTp6c
         YnBYnHjAxgWw9mMjgVtRCSTpAao/LX8OZowuIKV3s+Cy7qgF5P2w2StLVL/tI8kso0i7
         Bzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107542; x=1734712342;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DEItgojaVXZbU1GN6003YTd4LyqNe/xYZINzdoL1yzo=;
        b=NhSardZyOTZpOMNx6PTKWFXlD6pkPOUpwY50O0npOlkUnSzgSKsGBNQWUlu+3mJ+an
         RQPsNeu+I1HOFdCJJLHwJ/96KALFCrMLF9Ps+bnCc1h1mi88UYWSNz4l2EmQBXKvEro6
         4Sv8nuvPwWfs2w2QOry+6NohQS2iuEFwpR4hJ1iA3NQ7//Ld+QWR6ZZOcVi8v57nTExW
         g+I1o/GIYi42of+XDlihSz0gubW53burhpkKXHfNXCN7dXWMEUYJe545waTEX1NB/Dp0
         Hw4xDRX+77H9nNpk0uV1z1Lj7DWTmMCaEG1gz4THX0Yybz6rAfsxbiYecKPup7x6GmSl
         bbUw==
X-Gm-Message-State: AOJu0YzC2F6t0MpESxhjAAzhzK6691binGqK58Ip+byGwH7dEI2AT+Kz
	dZkwZGpoExJZJrj3Zj3JcfwWrZ/JhGHxXr+96ETjD14cUqw7uxYGAGiMP34/dG8=
X-Gm-Gg: ASbGncvBUL6ijrQPnN1huU0q9R8Gwi7XWxQAQ42dVbnVm8erT6F5JxTKflA0FhSLG9s
	VanztIkZ9vdq+Ip9PgHjZahV33D2v6xt6P+u8p0QO12NCw6UFdMLeZ0jM0MQ92PIgs+b1yyUf4G
	RviYXBoZEonVwkcjdLjZ5OCESKt9NkbaibLBTa6ts5PKfHv0YMXo/ZuAXQBw+Qs6+AOIpLpIGjD
	3tvdkJYj+g0EJ4WrLf8fTP+GU8CkxG5m4ZyZwHgQreXKlGX3TBtocPHy+iPx5VBvxTAST9ykr5c
	Od6ZyWwQo9o6FtiXZAOzhNeapxl1G2zYRw==
X-Google-Smtp-Source: AGHT+IGi3FSQoKO9DoZDt5mN0jq76MoXzn0hU8XoMEuvmZepHPVL8hpQQir9gtzLFbj267rx685IwA==
X-Received: by 2002:a5d:64aa:0:b0:385:f38e:c0d3 with SMTP id ffacd0b85a97d-3888e0c15dfmr2184770f8f.58.1734107541936;
        Fri, 13 Dec 2024 08:32:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4795:2d16:2587:ed70? ([2a01:e0a:982:cbb0:4795:2d16:2587:ed70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4a25sm7571456f8f.27.2024.12.13.08.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 08:32:21 -0800 (PST)
Message-ID: <335fb7ff-35a0-44bb-981f-757204d829a8@linaro.org>
Date: Fri, 13 Dec 2024 17:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650
To: ross.burton@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20241213-clkmaster-v1-1-dcbf7fad37b1@arm.com>
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
In-Reply-To: <20241213-clkmaster-v1-1-dcbf7fad37b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_083223_634453_1F1D4850 
X-CRM114-Status: GOOD (  14.48  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

+ linux-arm-msm

On 13/12/2024 17:12, Ross Burton via B4 Relay wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> This option was removed from the Kconfig in commit 802b83205519 ("clk:
> qcom: fold dispcc-sm8650 info dispcc-sm8550") but it was not removed
> from the defconfig.
> 
> Fixes: 802b83205519 ("clk: qcom: fold dispcc-sm8650 info dispcc-sm8550")
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e6158633f07c1f3532fba62f09b31e7448..c6d6a31a8f48c7ce9c9ca74e29db3b8835bfd556 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1352,7 +1352,6 @@ CONFIG_SM_DISPCC_6115=m
>   CONFIG_SM_DISPCC_8250=y
>   CONFIG_SM_DISPCC_8450=m
>   CONFIG_SM_DISPCC_8550=m
> -CONFIG_SM_DISPCC_8650=m
>   CONFIG_SM_GCC_4450=y
>   CONFIG_SM_GCC_6115=y
>   CONFIG_SM_GCC_8350=y
> 
> ---
> base-commit: 231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
> change-id: 20241213-clkmaster-558e5d7c966c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


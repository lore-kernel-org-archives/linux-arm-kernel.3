Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01FBC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRqWZT3EBc1tCny87S20bhNlMrhX8IzD8m5JUC/YP94=; b=N1d361sAg4BYdF253sFQ3RDpAT
	3AA+U/1LR8J2SDuTHl9qlw/mZ83nOBbx4Wqn2CcRM69YHdtjG/r3OjbG/gp2DrS5HzBY4Yu9+bB1e
	SaNJ3gM5BaCvCiPFKWGkULhksqSnERkrAtI1nW8hsHB7BhhR6mQUBPOxdDOUc7o0GX0hetb8s/l72
	mnhvdgdpTTDTAl99/vfALNgWbuIWpbChomXC3icmGRMro3PyaWPgLPMGQfe1ZlFnxYmk5VRNrYg05
	qnLnVT9rL6k2no8zgQFj9v6QRG1S2RnRxSwWuhzHBgyC1t4iu+Alp2G1WC9rezFJdlUQqjwFyLNnt
	7ZW3e5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiypa-0000000FYxR-0CbU;
	Fri, 14 Feb 2025 16:46:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyml-0000000FYRE-0hlC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 16:43:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab7c14b880dso94609166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739551405; x=1740156205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRqWZT3EBc1tCny87S20bhNlMrhX8IzD8m5JUC/YP94=;
        b=ANEPE/oQobjLPsNwQ6lmgweApopHXjaob8D/SWaHke8IPZcvsANHxBLrhFXFFdUUB5
         Pg34Jl0YVqku3lXTdiMrOWHgFVt7gxHWs+mylYrBr789OyP2L7DZqsPgp20U4mw2ULMf
         IlKPHEdyEBuwG+Il9XIyzj+xhtR1fdPa9rz0HwAhd3/Voh5i3uIyMmeufbSA5PUrFLtN
         smWe+M0Jd9dbrGzxt5LPK3l/Vt4GavNW6+zfElBTPRN0fPcM+vABUxJStccleV9t09Xy
         gT8v5pJgHBYxrE03qlXi/1EJ2czOdx8d105ctxwhnAQ8raC95wUrgYGfPP9yylPzYmqT
         aG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739551405; x=1740156205;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LRqWZT3EBc1tCny87S20bhNlMrhX8IzD8m5JUC/YP94=;
        b=C4XN9fW+iDSgkQA3Eg1hrrtG5Pfm2vKBGe4ZVKJQsisFhf2pBgoE11U0pRzx20DvR7
         toPyYV4SavxYsLrU87zWcJSj9sMLR8VQoyUWUGxp46KEbVubr86XMFw7qn/nrnTcPNus
         vMW+lAvTCZQ721MmGCacsSSXONdmwoAaVe9veU9WBUn0qsYFzfuTKX7QRI7BRtp5UC07
         CNIqXtoSRx5zO+PwZwXVOCGmCPOlNB5I9+DjC8aWgHC/uyOcUIFGUxNBbXD50fGmn+Zs
         IDvrKb+z+38j4mVQ+ZG68Cqtlbzoe4e51APRCBP+qOUrMHtt0QmuDrJ5HPkNyzKxFmC9
         u16Q==
X-Forwarded-Encrypted: i=1; AJvYcCUH2JIh8Yt35qAQ8RI5gEdStFvucwB2nIki2LXPHbk9ydUjUGDM2VyLWUAQv3B0QgYN3v4xuGSjCuJV5dtAO1pG@lists.infradead.org
X-Gm-Message-State: AOJu0YyyyhuBrnTtlqdlT3aSRIvAWQFWYE1m3PcKdwytiTm5HfElk5Y0
	VFGMUvLMfRm13elcaGWWddb1vZtecwFRUXf4MlT1glk4pGh0elUA0DbHfeWPGpg=
X-Gm-Gg: ASbGncvI11FLZddo564l/5Ipvu3ipPsR5PxPzH0C/+h15yocJod/TLhRNOOPEtCO949
	lYOLIHHQIIYd1zvnJ+EDjtBcLd8ynMyFUDfXQTeZNx5xJnmL5/tlR6CaVIFEZBnQ5UvYurPvpOM
	uSp+Qv0o+T0nVj4pNBIfMU1RgiJIQL4Jy+zEc/yTRyni98pwhDweostwpH65lWi9Vkvng7EOWrg
	iX5LVATs4s5mqOE2XxsHI04BDz46eFtB1q4h+2AYmazQbEJXulOAGoGd6JHzm/xVIhJoCavWGTr
	mZQBlZfTytBmD3lmNFoS4+1S2KguLLNLfn85doFAxOZtQMihgDpiGstzqQ0bhRVJVLk5
X-Google-Smtp-Source: AGHT+IFJuSESmgIJ+f/guNQjZTVvQM42EUhcNb7YjZIMzJarYW5+AD5ul67Inm+uaDqq7havtVXdPQ==
X-Received: by 2002:a17:906:c112:b0:aab:eefd:bfd8 with SMTP id a640c23a62f3a-ab7f389f31dmr1360440466b.49.1739551405379;
        Fri, 14 Feb 2025 08:43:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:cd94:8ae7:d2b7:7369? ([2a01:e0a:982:cbb0:cd94:8ae7:d2b7:7369])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6cb77994sm11523366b.64.2025.02.14.08.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 08:43:25 -0800 (PST)
Message-ID: <0dcab844-d9df-421b-bf6d-462b40da7a14@linaro.org>
Date: Fri, 14 Feb 2025 17:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: defconfig: enable DRM_DISPLAY_CONNECTOR as a
 module
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250214-arm64-display-connector-v1-1-306bca76316e@linaro.org>
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
In-Reply-To: <20250214-arm64-display-connector-v1-1-306bca76316e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_084327_234043_2FB8E2F7 
X-CRM114-Status: GOOD (  15.65  )
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

On 14/02/2025 15:57, Dmitry Baryshkov wrote:
> The display connector family of bridges is used on a plenty of ARM64
> platforms (including, but not being limited to several Qualcomm Robotics
> and Dragonboard platforms). It doesn't make sense for the DRM drivers to
> select the driver, so select it via the defconfig.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index cb7da44155999b59aff95966f4cdc9107f2af46a..dfcc754962f7a40377d1f8e0f16983af5ace28f4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -911,6 +911,7 @@ CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
>   CONFIG_DRM_PANEL_SITRONIX_ST7703=m
>   CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>   CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>   CONFIG_DRM_FSL_LDB=m
>   CONFIG_DRM_ITE_IT6263=m
>   CONFIG_DRM_LONTIUM_LT8912B=m
> 
> ---
> base-commit: ed58d103e6da15a442ff87567898768dc3a66987
> change-id: 20250214-arm64-display-connector-c1c1569f9799
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


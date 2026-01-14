Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92A8D38FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxA45yuwhvAuNepLYjlGsV0QtZmbxlWi4B0eDH+Qoig=; b=ONLQN/bNPXoGBR
	DUAftKdYumfUpjtuvLRI/2p9sEHIKlUNrci4xtlsEaf662ZbBs37BV6bem9ernVn+qlkbGJA1Cfmw
	AOCqeyUvPgV6iYK34pH28EFTpTjpTRRegX1u8JoZU+kPlSqz98uopl/7PJ4lLI1CWHc3T/LhxH7Ku
	drL99rBPffccFFz1CLFt/+6OCiHSv+yFDgKITe0ytO5dx1wIQ43D6Asq6oOntXiBSvJDuyvIjJ/Xv
	j18Sh6+nuwRPybhcBSckBG7NXBh1a9BMIXIMsqQFG7AsZz58S46W6SACSzlx4M+YVtmqrCsMNtj7e
	TlLAxZgTZAwiU2OJSKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4QJ-0000000A55F-0WMC;
	Wed, 14 Jan 2026 17:12:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4QG-0000000A53N-0jhs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Jan 2026 17:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=rxA45yuwhvAuNepLYjlGsV0QtZmbxlWi4B0eDH+Qoig=; b=qwJZzQrj9ZBkNR6wloeflLRlI+
	ERg+b7O3zYFGlTfERKu+F8YE7VbpkSM/Q8duU0bxK4jnquUbgMZCFTyt/eJh+XLPseMZcSRezq3mL
	rMwAlWoWRoj7qPsEsq4m2BghS9Y8YiePmauVCkgzcbm1e1Mk/4IqiYCYnVGlaRWVkBPH81bo0kHEI
	XUG/jxmo5DBva78ey/AqBpBjbw+Z5InM1FrSy0Ml6SWSHQup3lpsZO7q/X/J9HSBqGkylijb181db
	1r/2wAwqvRj+tjf2wToxShLVBg3yj7xZy5pkoYcyWhzzH7UPR8y0HO0oeLywAtCf8CMCfqI0oqmbz
	DiGpLUJA==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4Q6-00000005Kbc-0Cgu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:12:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-43284ed32a0so41441f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 09:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768410751; x=1769015551; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxA45yuwhvAuNepLYjlGsV0QtZmbxlWi4B0eDH+Qoig=;
        b=rzJqV41KSBbWwv3YdiZ0pWxYJwr2DT/FMJeR9ml2uSi03/daPwTwOn+8pWyW8R0lNR
         rX9UEtqjsBUyJSLNNkgsnUZfl4DBhYxEGCNvjJXE/RQsaA7R5hISDoY3KOAdwAEzPS0D
         7B7WMl3kl7Hl9UgL8cSuIZuvh/PbloHywR0vCJxpiVrGqcT+gvK4LA0D9iA1kiEFWma7
         vm6da1oKHH2DbDdXSsZi8hnzHcR+tMioDWvOcmahDoXjepMpQLKD2dp0EDiIXZ9aCNvj
         EvExwC27ZaShTDhqfqeF0jTynhGv448c3FH5vUWwBlp2gdo5BEtcxe0xEG/JPzbcsV6o
         XoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410751; x=1769015551;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxA45yuwhvAuNepLYjlGsV0QtZmbxlWi4B0eDH+Qoig=;
        b=E/moH1W0qWf1wRwKV0kyQWaIn14sYA9cvhttXStVemoNPR6aXPEPuL9KaxIK6ofu1/
         i9xBQcpWLmACNCFOe6vfG6RTyJTynhFvLrytp0+FEw43FvvwXlNTefZ8n3oP9+qPptix
         7vLWVHFE5tEJ4O1cY/EyL7pYw50zATz4gfl+PrPBTV2D6O4mTCGfyhV29NFSIbA7vUYJ
         GUHtg+Z7lvsgZHtB6EXwkec7BsH6H4ofDdohC3M3ZH2xb/K+qW5pjb3N6+10vzTNpCWv
         0LMqDayy8i8EZnpgckFimcgsTAZDVwqYiKZX9nuv13pVDx+qx3t33nc4Ptpxv99sS1Vy
         h2gw==
X-Forwarded-Encrypted: i=1; AJvYcCVmtwW/il+G4KbIFLj939DEfFz+PKHJSCjNiFQh9Sgc5ybnuB+XGIEx691m7RUfn4KLCA/ueW3tAJ9b23VxFgP/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5YPHqHwMXSgw0KLuvZZUg0XdX1N/db7pUGcxnenGhYLELA2bi
	BK8WS2idPqoXrLMfEuCOLU1X2QetmmRSdh4H0o5zNjwIwC+h9s0TgoYiG0YXb5NUZJA=
X-Gm-Gg: AY/fxX6jd4NJtTzqRGcHSH4lrO0XFXDvENrDsOV+qdySd28n7bVxjNxyXdaD8jZZvoV
	BVEoa8Bdt96zlKDy7eshswqEHTZ69A9odCP5jwGaEpULgOcmwcyyHOGBVJPnpOjpMYMEWwr+nm6
	T6cArD0v15+2V7Whytqwh7VDQyZozoXo7fetQ7FIMMLn3TRgavdBgb455BYLx+Gs5jD0DNnte3M
	a55LVYEYv8bk6a1AGmj7CUJKrGjwNJ3ZxD6KIg4Lk+UYZoh1svsCBEzLMTCQ6Bgw0Ec/mdf+tXS
	t7SGnbi5VQgGN9Ko91nDjNRxTtwsmdcdYjFOLgLZqwBdqlT6nNfI+XY1jqgF3TtfhXzXo6GsCAv
	cJiXx6hP9udw+h1vOLDUAcqb6yZZcEWAL1kGYtiapipKz3WztzX0ZArvG/o5otSDkhnXXi9K/so
	sIU/VRh+WNjG/qgGr12EhQs7EaWqtKW3zfWA+J6qPNM/Hnp6btk6CtyuPhH/zMbI8=
X-Received: by 2002:a5d:5850:0:b0:430:f1e8:ed86 with SMTP id ffacd0b85a97d-4342d59bef0mr3575666f8f.4.1768410751001;
        Wed, 14 Jan 2026 09:12:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6e09acsm360931f8f.35.2026.01.14.09.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 09:12:30 -0800 (PST)
Message-ID: <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>
Date: Wed, 14 Jan 2026 18:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_171238_042575_030CF9D4 
X-CRM114-Status: GOOD (  20.73  )
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

On 1/13/26 07:24, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.
> 
> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> prefer SMCCC over a vendor driver can explicitly enable it.
> 
> This avoids unexpected format changes and keeps the generic SoC sysfs
> stable on systems that rely on vendor-specific identification.
> 
> [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> ---
>   drivers/firmware/smccc/Kconfig | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..f830d11ebdca 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
>   config ARM_SMCCC_SOC_ID
>   	bool "SoC bus device for the ARM SMCCC SOC_ID"
>   	depends on HAVE_ARM_SMCCC_DISCOVERY
> -	default y
> +	default n
>   	select SOC_BUS
>   	help
>   	  Include support for the SoC bus on the ARM SMCCC firmware based
>   	  platforms providing some sysfs information about the SoC variant.
> +	  Note: Several vendor platforms provide their own SoC information
> +	  drivers under drivers/soc/*. To avoid conflicting sysfs attribute
> +	  formats in /sys/devices/socX/*, this driver defaults to disabled.
> 
> ---
> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f
> 
> Best regards,

Disabling it by default impacts other platforms, the arm64 kernel is designed
to be generic and run on any platform with defconfig and from the same build,
please don't forget that.

If you want to ship an arm64 kernel tailored for Qualcomm platforms, you're
allowed, and you're also allowed to disable ARM_SMCCC_SOC_ID.

The soc sysfs interface is designed to support multiple source of information,
from vendor (like qcom socinfo) and smccc ID. And this is well documented,
and pretty obvious...

Neil


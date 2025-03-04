Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DABC282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIp1cph66/HGjo1LcKFC/SHdEMb7MTb3g/6N0/oA0e8=; b=3if0jQJIR6mJ4WoRO7KNQwL8Fu
	Gn30p3B4VbrrOGMA0GjrEntUxgYMeWlfs3I5TFNKxL3JKmGsi0iKzg6jA224vo1Cf9GLIv1q+r85U
	M72lPBMBRMyq9UDDN8yafOBK0Pmie6HMHVWXAVzI6BqC9nL8MCP9n40gkYmekwgx2krS83S/48kj3
	S4uYEGKtSpYaYp2P8eOA14W+F4tykwrPhA71XVMNeKiNLD7Tfemo+VvsYSzRum7DBYkOM4tOqKAqe
	Xq7QjD1clWo50ZJdoYbsnYR8M4Ea51kgxnbfkfm0xG/kJ8bFc8IA4he2LLVy1lJND1jWlyKtWIFcC
	JlvzurtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPce-00000004B0G-3fn2;
	Tue, 04 Mar 2025 10:35:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPJV-000000045WD-3yA2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:15:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso11572875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 02:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741083348; x=1741688148; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIp1cph66/HGjo1LcKFC/SHdEMb7MTb3g/6N0/oA0e8=;
        b=vpiGhgRIoZJtS5KKjvTtG6rMWKiSBl/fRFdQOiloC4TFiyAb0notXyh2YNWeh9l+MK
         9q6zorvAK72cCpgkfC+oM0968J5jDefmhtZIL/1p5VI8oI7icWBmB/9M9Ye7R9wXWz8g
         s28mgxxu+vo6VwkC9ESz0TubniQU0jYbaUUJEzLOHRtyqGbmIPnHEXg6/yD1cpuZKXv8
         MNSk2zgBT5yfuNQcJp3BcU4ltWfNnhlKrI4i34gNpxidCdnZTOePAuaokntAUCjeGS6O
         CWZ4veIiCoSEtYvc+2QGVghQdtnLKPS5Xy7+E1iz3CrgnJi0iObIhAunol/SRBMh/ftI
         VapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741083348; x=1741688148;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kIp1cph66/HGjo1LcKFC/SHdEMb7MTb3g/6N0/oA0e8=;
        b=r+jLF1n+oPsrcAn9wrAYw+EmqqYnWqYwHmVrfG1KmeFaRJDSPD9ubJMp9kBuRsJ3vw
         tKGaikvBET0B3PS2gdYM+3dwEDDZtdMPdyyex1CdM/q+yLg01amI5ml68GQnITNQhlw1
         IH/9xTun9M6a3yBAi7XSte9QMACub97QWb/1fbZ3F0oZTTR9TWNZKRMpwebVmgPm+iS1
         e9gpF+WlyEOaHGcmmQrKurka3CysvLAZpKeYqf7cUbDHrpBAtbJmEV5P3qWiXLuDGIhX
         y24s0S90bMQ72nmKxmkuMD3C0a8UVU149Qv/UQNELyahyxcMxxgyJI/7NhZ1xjSrakhx
         HyjA==
X-Forwarded-Encrypted: i=1; AJvYcCUtvE2slPYLf0RJtwosYbCqp/xrPH7IYAmJRlBVtV0oR/KELRJXxqv4lk3Ze+N60Ea0k4+E/9rTlpWQympjGn4V@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4epeTmEn8ObGdC2E2qUxYbBhhOT0blE4KYBYjHleG7K0TPqRj
	8VnJNzYkBB4jMHFNBEfnYIiZyzKNznOjv7rivGpm/+oL65ZdOeXbZa+4lU6c8uo=
X-Gm-Gg: ASbGncukT6dapc80YiaYLhmEei/Ba5aEAF39ULO1EYVAxdjThAEwsdQfTy7uGgP6jAR
	EF9AMAAU0RvKOyphoUa/uj3hoATyIuKQsGIM/gUnHFgm+0sO0MF3qOngqjUgOG7ko91rmvMW0zw
	KqugayRLS6ZDeeXhG95oOktZhqiPkXSSZR3+DxiLdc8CGzlcPFW/bZoGlE5FkHAiNShn5j2OerR
	zE/pvEc3TnFdx2yUeuFcDffH+k4r68xQ5TO5aDhSz362yoVQF+8XuLjX78SDCV8ne/2Ru4sOhl3
	yWFNQmm7FBEj6tqApbiYCKTppSCVdgEH21FXG6gRiQAiMyE2UNBy4MoD
X-Google-Smtp-Source: AGHT+IGey+kjBPOhuoeEklMVdzB91lv2feUrKYSiI7u29mC2m39dGVaqOGpmY1/H5pbh0BrYF7k6rg==
X-Received: by 2002:a05:6000:4029:b0:390:efe7:20fa with SMTP id ffacd0b85a97d-390efe72244mr11536252f8f.47.1741083348262;
        Tue, 04 Mar 2025 02:15:48 -0800 (PST)
Received: from [192.168.1.101] ([37.167.169.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc18452c3sm69076095e9.25.2025.03.04.02.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 02:15:47 -0800 (PST)
Message-ID: <2b5c44c8-4eca-45d2-9599-a4d00bf44f5e@linaro.org>
Date: Tue, 4 Mar 2025 11:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pmdomain: amlogic: fix T7 ISP secpower
To: xianwei.zhao@amlogic.com, Ulf Hansson <ulf.hansson@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250303-fix-t7-pwrc-v1-1-b563612bcd86@amlogic.com>
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
In-Reply-To: <20250303-fix-t7-pwrc-v1-1-b563612bcd86@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_021550_019560_522603FC 
X-CRM114-Status: GOOD (  15.81  )
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

On 03/03/2025 10:06, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> ISP and MIPI_ISP, these two have a parent-child relationship,
> ISP depends on MIPI_ISP.
> 
> Fixes: ca75e4b214c6 ("pmdomain: amlogic: Add support for T7 power domains controller")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/pmdomain/amlogic/meson-secure-pwrc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index 42ce41a2fe3a..ff76ea36835e 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -221,7 +221,7 @@ static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
>   	SEC_PD(T7_VI_CLK2,	0),
>   	/* ETH is for ethernet online wakeup, and should be always on */
>   	SEC_PD(T7_ETH,		GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(T7_ISP,		0),
> +	TOP_PD(T7_ISP,		0, PWRC_T7_MIPI_ISP_ID),
>   	SEC_PD(T7_MIPI_ISP,	0),
>   	TOP_PD(T7_GDC,		0, PWRC_T7_NIC3_ID),
>   	TOP_PD(T7_DEWARP,	0, PWRC_T7_NIC3_ID),
> 
> ---
> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
> change-id: 20250303-fix-t7-pwrc-f33650b190ef
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


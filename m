Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83565E77194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBrc7EuOMXY8yTx/TbXVRV+IK2Cs6RWnPvid7BqXfWc=; b=uMJpgFSUy1/97CsZ6wpk76CJ22
	qkLFTAhRkqOeCd5PtvFK4amJJmI+5XnnS0X+X9Q7nWTLNX/HJqbwvMZjYX3lh8KjClE/gKbOWpkbF
	0dkpai16hh+hMvGFOKPn55SJBj+sCDn51luzRlxuhy/OH5lKn4dqt0Tkrs/R8Oqw+aijeZzOqnqFS
	b/AmCmCBs+IBl5+EA25a1h58GjdePhWg6jHrEcq2CT0gXKmA5ySOicO/S0TJGmy1SvPhnw0AXNEEy
	Mcv/ZgdmdWEErJFBkTSaoEeKFb/wKMUKCCP36qoWTql47IjnzoQhXs4yLM1tnOKJ7LSRH+osTEbha
	6bo+NjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHiG-0000000A4Sd-07pH;
	Thu, 02 Jan 2025 09:41:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHh4-0000000A4Cb-2I1F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:40:43 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so8830836f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 01:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735810840; x=1736415640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBrc7EuOMXY8yTx/TbXVRV+IK2Cs6RWnPvid7BqXfWc=;
        b=wnIdNAcxZXJ+ofVHS+DFsl/daz8DwtT3w0ROJYVqqk8mH23vDgLPhxZYsRMSNS9hBK
         4XgTfBbTiCqj0jSnTC/ga7YBr53h5+iwZ02YJC95ammnL6DR24cnnBQqVozeiHp3uWx6
         hZz2jofcGaGOtDC7vSe2MF01SbuLNpeV51JGYb6a8utrCWSlVmn9U3tefYhvTOVtJIBA
         HwOl1OBBaUuJWQ3wBfAKXV2/0Cym9tLLfFfc6oc0FUoAg96J0ilyLUwKQADeTqmGSP+E
         PEkLDx7qmXapNuWHE1C95NNDDOKo5m7fqfiM/MpynCIdnPhwPJTwguFxymBqFVBUw0Oj
         qzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810840; x=1736415640;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vBrc7EuOMXY8yTx/TbXVRV+IK2Cs6RWnPvid7BqXfWc=;
        b=lAQr3CoBfOtg1GiMldajrGb1dEpCiTSCMUv9NPkkjRaxmTvtkXZoOf19b2jHkE3C+o
         1rIjDqrZLHu3icaCuLDqZyaCCb3rTXWybHSnXakPxN6Z5+Zgs50+H7N8564TmzLo9gyU
         TZHO3iFsGToevQMcJul++bLufXSkGaFANvPW54/jjcTpTqSTLglytT/JMV+xqQF7XGI7
         aM0ss5gawY32/eQykoLmj5rSyxe6aVvudZLncNT2stFtNQmZvUvgM8cpcZpSTnGM2PLJ
         wCG0s5VL/aI7WNLy7fWZz6u2HHPtvQmx1geydxX2JvV7kV6Uv5BQ3ELAFB7mv8FLgHgZ
         TcxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/i9/QFAHcgC0D6Ql7kA/V1ViSd4NEeJagfRDv2Jf1Ba8o3vax/SCf9bxjBMKhh2ASB5GSkn+tcIeAqybeC+Xk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxa0I709PL0u1B8Q40IRtTWBS2E2ZsOpNSHaMB0ImMSzkazEca
	uzrBXPBiJQn1a4mvzZNtrWaeXyUF+K1uspHe+g4s8ZcjVJWoyS+YCPygGnVo8Yc=
X-Gm-Gg: ASbGncuz/gXX40OgqhF9VZ1jHRcZpsXjuloKJsdbjHYI3aePniwKBpMAi/Gxea5cmbK
	XVn160pu77JH1t5xxVsaDi+L6ZVeR4XI+bGGiwxBK53KjwN32VPOSHOM1Z9GrDPJ4xGgnOeiJ5N
	BERrHk3WTnDUiBQVPgzjjbYB+PTzCBbsWXQw6HyDJhcsiVe4Jp1Ca7wh5PqIR2WSAcyiR3hOoJA
	ebpCrSq1r/SpBmIOQPCxLAemtLdWKm6R71G5TOthzNcEK5QOzvnIuTOur8o1r7/ImBcr+Pekosx
	pS/vSrzg/+tvPew22Q8b2jjrV4CwaJBdcg==
X-Google-Smtp-Source: AGHT+IFyQxq7+SLmgC3lEOJrijlLY/blJUqn/3ChXyKJbxUPuO43SDrq1oyRFY0OkutfbUe85tJpHQ==
X-Received: by 2002:a05:6000:2ae:b0:385:ed16:c97 with SMTP id ffacd0b85a97d-38a224088aemr34478674f8f.49.1735810837548;
        Thu, 02 Jan 2025 01:40:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1cfa:329a:aa2e:f0be? ([2a01:e0a:982:cbb0:1cfa:329a:aa2e:f0be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828bd3sm37151921f8f.10.2025.01.02.01.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 01:40:37 -0800 (PST)
Message-ID: <f888d948-d79e-41a0-8844-b3a9659498c2@linaro.org>
Date: Thu, 2 Jan 2025 10:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [RFC PATCH v1 0/2] iio: adc: meson: add MPLL clock workaround for
 GXLX
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lars@metafoo.de,
 robh@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gnstark@salutedevices.com,
 krzk+dt@kernel.org, jic23@kernel.org
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014042_613547_20FBD8DB 
X-CRM114-Status: GOOD (  16.76  )
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

On 31/12/2024 20:42, Martin Blumenstingl wrote:
> Hello,
> 
> Amlogic GXLX SoCs seem to be mostly the same silicon as GXL. The only
> known differences are:
> - one less Mali-450 GPU core
> - no VP9 codec
> - and an odd one: the three MPLL clocks need a bit toggled in the SAR
>    ADC register space
> 
> This series attempt to fix audio output (which relies on the MPLL
> clocks) on the GXLX boards. Unfortunately all we have is a downstream
> commit [0] without any further explanation (or anyone who wants to
> provide details on this). Since it's not clear if this is a gate, a
> reset or some other hardware fix: the driver side includes a warning
> for users to update their .dtb along with kernel images in case we
> ever figure out what these bits do and how to model them properly.
> 
> 
> [0] https://github.com/khadas/linux/commit/d1d98f2ed8c83eb42af8880ed8e206aa402dd70a#diff-c5aaf54323ef93777c5083de37f933058ea8d0af79a1941e0b5a0667dc0f89b3
> 
> 
> Martin Blumenstingl (2):
>    dt-bindings: iio: adc: amlogic,meson-saradc: Add GXLX SoC compatible
>    iio: adc: meson: add support for the GXLX SoC
> 
>   .../iio/adc/amlogic,meson-saradc.yaml         |  1 +
>   drivers/iio/adc/meson_saradc.c                | 34 +++++++++++++++++++
>   2 files changed, 35 insertions(+)
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


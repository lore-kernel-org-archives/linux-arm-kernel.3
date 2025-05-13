Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8190C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 09:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2a2UHdYAk58d8k4bpqZnst1+U78+dixXgzNfhERVMo=; b=zdUkRL5NfyKVIYo06HeUuguOAQ
	wlnGi3UF6Q932uvXzYQFkQrK/C7Wn8PKRQHfAlu+AzkVi7N4sjzny2kwnYNlz3Yv+V5b99H02K1jf
	FBe+1iOTxcBH8T9RdkyPsic9NYdiZYUldORrEW/Mv41bv+9dL4gxuQiyvocM43f3XS+xRvYUOHYoE
	DNJOBcpO/bEflWA8JTpTq15UuA5q2GOr4vxh42UFh6xOP7T6Ix7iyWxV2Z6PgkS3SwCLp2YrVox7Y
	KNb9ZxLjO+taWOmnuxmgvz+27j7TGwie2YamCqBPXr67djYR0ZRdyrMSv3OubDJPjlBfRSSrEdPOd
	UclAnO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmOV-0000000BzfJ-0cSo;
	Tue, 13 May 2025 09:57:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmMN-0000000BzPU-2uFm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 09:55:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso36073385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130137; x=1747734937; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2a2UHdYAk58d8k4bpqZnst1+U78+dixXgzNfhERVMo=;
        b=vSn8cF8CO4WlloJPyX/SvL0A+4W97amU9uM1AJ7TGD1D6BBpRmDYhNR2SGbCssY5So
         V9ByjuAdrg9bTSmuNeSbm0CY0nurlQ+tTSOB5RL+99hv0utiIrKySQRIzm+Rlm3tTO26
         S3muQAfmM0I34aQmSxmPq0QJX08Abfz2B7U8i0ViDKb80JYi8Aw3h9bBagf0KRBdKS4+
         dY+vC7IeRlmUUzVLDz4A58ptqjak9gkzYk6Ta/QFiV9O+Mj39LhEefXdttQ4Z6tpJQGy
         ezbt50ITq0Bif66fr8KsrvRk863NQ92Ul/oGDyAjfHh9CnerOTKaEsVxQNCmZzf4MUPJ
         psqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130137; x=1747734937;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B2a2UHdYAk58d8k4bpqZnst1+U78+dixXgzNfhERVMo=;
        b=DQh+vAD409A6K7NuKVyrainRHVy1UyYoqhkFMmEItutyNa2x7WhfAgLjyv6R9J8mHn
         90WbHfG8pYNHEBQxKxhfrAVfJXuCsLGsYgznqYW26XjmUz63+o6Znh8FISLumZs3XrHM
         NxEqWiMW1L/UqbmElnyhE5f/BjEnOdJUtoZCuTXAC/122mqccoiR+htrDQDIlT4GJ8mB
         DhBZBOYf7WfHxFsX8Wo+8rn6dcgeVwyFUxa3TuXDUqnkgSGTnwND94mwQSVv8HL9LnP3
         HS0UDnC4G5u0sn+Sb4kscyMM5EFT8tjNpNvY2eAnA4QIvlHbP60elOr7YSlICNcKUjc7
         ZWSA==
X-Forwarded-Encrypted: i=1; AJvYcCWBP/tyd/4Gcr9NDpkyIGWks3XqAkt8FIzOvIK5IskuT9yPWkuqc5GOzs7qfNQ1d9ujjY476JSqzdVgCSI+kkP0@lists.infradead.org
X-Gm-Message-State: AOJu0YyHNOpgG5nAg66mcj+OtCLzjyTkcYFxg86I5uHdKzaSD1ueuGVl
	NMAam8qC/0NOJgsPBiCahQEgCHg+lm/mO0pppd6wKAc473dQrcvyRuG4O43JIhE=
X-Gm-Gg: ASbGncvS9o70MfV3xQy1DrAr+XeEr/4pTUGPWd5+6ntERskAFiNUWg5oTVAS4b4OWp1
	SOMDsqHrfIx+yD1Km96bxdoI61cdu6a1qg+mr8yWdIN6xqTeqxsBno86vfd0GJJPg7zoeCm+j/a
	QaZMTCxw80XtItF1CjBn6yLThM/KT10SQ5xeeWKlsWiPMJYa+ybfbgkYxHC0x9QHgQtPXF5+Ybo
	+iLEBMwIDg/ZImt7xqD1b0yhagYCzEsaVXeLLHwhg1CfoOgYKjAAjXfHscSqrHIvEzqakaTtJC/
	0FzhNh11jJP4M9gPdkCgtT7yOUQ465er+nKf5PRRq733BFUmmaHOAGZpGxHSPKil3NksIdYKtAC
	Wgck8Au/mZIzl
X-Google-Smtp-Source: AGHT+IHLCcNUV1+oQboYgA3SkbfN85gAOCapDtK/POQGga3hETjWJtXjQgemjr2/TZaqn6DWWyppTA==
X-Received: by 2002:a05:600c:6090:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-442d6d18bfamr148650455e9.5.1747130137461;
        Tue, 13 May 2025 02:55:37 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32835dsm205893815e9.6.2025.05.13.02.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:55:37 -0700 (PDT)
Message-ID: <b090cef6-5b9e-4149-872d-0316666f9e90@linaro.org>
Date: Tue, 13 May 2025 11:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: amlogic: Synchronous Abort with v6.15-rc6
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, sboyd@kernel.org,
 daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 lumag@kernel.org, robdclark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
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
In-Reply-To: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_025539_730342_D08F100F 
X-CRM114-Status: GOOD (  13.08  )
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

Hi,

On 13/05/2025 11:41, Vignesh Raman wrote:
> Hi,
> 
> The Amlogic Meson G12B (A311D) SoC board (meson-g12b-a311d-khadas-vim3) fails to boot with the following logs,
> 
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76210200
> 
> 02:58:27.819: Starting kernel ...
> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
> 02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
> 02:58:27.819: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
> 02:58:27.819: elr: 00000000f2f26a48 lr : 00000000f2f26c88
> 02:58:27.819: x0 : 00000000050fffc0 x1 : 0000000001004383
> 02:58:27.819: x2 : 00000000f2f6a358 x3 : 000000000000003f
> 02:58:27.819: x4 : 00000000f4fefffc x5 : 0000000000000010
> 02:58:27.819: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
> 02:58:27.819: x8 : 0000000000000008 x9 : 0000000000000001
> 02:58:27.820: x10: 0000000000000010 x11: 0000000000000004
> 02:58:27.820: x12: 00000000f4fefc00 x13: 0000000000000000
> 02:58:27.820: x14: 00000000f4fefc00 x15: 0000000000000000
> 02:58:27.820: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
> 02:58:27.820: x18: 00000000f0f21d90 x19: 00000000050fffc0
> 02:58:27.820: x20: 0000000000000000 x21: 000000007ffe9000
> 02:58:27.820: x22: 0000000000001710 x23: 00000000f0f0e8c0
> 02:58:27.820: x24: 0000000000000000 x25: 0000000000000000
> 02:58:27.820: x26: 0000000000000000 x27: 0000000000000000
> 02:58:27.820: x28: 00000000f0f4f790 x29: 00000000050fff60
> 02:58:27.820: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
> 02:58:27.820: Resetting CPU ...
> 

Could you boot with earlycon enabled to at least have a clue of what's happening ?

BPI-M2S (A311D) is booting fine on v6.15-rc, see https://gitlab.com/amlogic-foss/abcd-linux-test/-/jobs/10004997032

But perhaps something specific to the VIM3 is breaking, do you change the kernel config for the DRM ?

Neil


> The board boots successfully in v6.14-rc7, but the issue appears starting from v6.15-rc1. These tests were run in drm-ci.
> 
> On bisecting the kernel, the first bad commit identified by git biscet is,
> 
> 59c35416f4246aee66b5f5523fdc950b83325d82 is the first bad commit
> commit 59c35416f4246aee66b5f5523fdc950b83325d82
> Merge: 472863ab2aca e988adcb5dee
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Mar 29 17:23:34 2025 -0700
> 
>      Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
> 
> Please could you look into this issue. Thank you.
> 
> Regards,
> Vignesh



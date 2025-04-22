Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5569C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EW9WOjwKhGKY0mSAGuVe1/yMsQLEVZGpaUvajrqIQo=; b=RhaqIt3M2t7S0SXoN+t8R2FzSP
	ZVHL9RHs7gowU/QCi2NrBFP+H/r/cJM7HFnbxZLsIkYPG/CDaaWipV3iJdzkE5QxDpJteWGvC59p0
	2Yr52z++WgqdH9/xEDyVYNFOR5kjWHQwdQVzyPXs0ZchUr9CqygKENZjF/an/vl3O00dl/dlSvYGM
	TKP6lLJnB3P6W+1qPcu1sYi0dKqcGMwL6kmxM68svBLMl0KFhtb31Wt/ymCZWrM+RVtlQblbcxEaf
	Ype68DqAtsxualeGz39RRfY5TcaUhZkYlE4j6ELDtA86XVhu2bn7WezOrTGdjmp3JLRRGtrCOhLt/
	6V1zdeGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78Et-000000069g8-41PD;
	Tue, 22 Apr 2025 07:40:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77ew-000000063Zn-1iDZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:03:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso4609143f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745305389; x=1745910189; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EW9WOjwKhGKY0mSAGuVe1/yMsQLEVZGpaUvajrqIQo=;
        b=KUVMmote8VRrPOk4KL7d02syplwajQc0p+BqADKguXqI1JvbhGyM+3kBSYHkChiX05
         Pmyy8idXT2tKl/n5Wfm7D2cZjN5LfVujqUMF/eA5lSt4hDTR24E/ujNhNwnkMYifBzmC
         nyAmstq0vFTCK/ZFKA/bAot144vnEzh5do+SSS9VxIGpCRjQlhhRZo3r8k/Atg4MY3ez
         i2+LzUZNRG3hAeTgGVJdaEF1xNL9149GaTpgs5ocfj4t/7LCRRo1FHBZNKDZO+j4jXu9
         kzZO4nPP6M+jzcDVIfTNhCg5aZ2c2a7BE5ShifffOyCf2ZaWgo73TKzKBMv09g6XKsyW
         9tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305389; x=1745910189;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+EW9WOjwKhGKY0mSAGuVe1/yMsQLEVZGpaUvajrqIQo=;
        b=vAWvl5oLyNaOqO+L0e7YXDa27BYK9jpz2+pN7YsVqfKT9qkh3wg9JeX3S2Qh/fq3lW
         73lRgzDYn3bVCoQSU3esijD15s/XRdBOCkJhegVogALtb4eO+h+li5R/lpMaUBHqhdm7
         IROqQwt2kAjJXy6fCHSiBcZZ1ArsUj8FcUeOQMMF2ObI8Mwv52P2U30ID0EFalcZFBiu
         Vk2XC1o/HFaZcOUGHym2Z7zH5miX7b/nSZk4jcy0tdaizIweABTGfbGpud4yEc7UM26X
         K/Pae/RAqZHXJ0hrfc6+lqDhfpFNR8h3sXK7cKA8jA6gRGhA+uVSeyojvEE6t0fjdTmN
         qR5w==
X-Forwarded-Encrypted: i=1; AJvYcCWRyjxnIvIcQomSpPuHRZk+9Tx6GY5xrqHiuUgcOsCVaaKmipHFJZtu7XG/16jf6u55AERft/RVJYVKHB4Bo97M@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5C+BN6t1Ll217VPUJTLpk2eM0iRmdda1Gj7GSjjkr8I9X6lLR
	BDde7TkyJNbfZ9j6ijt0TISBOjQaOFe6EUnvweR/q3OdsHhRpNtgdBpHpfKZZIk=
X-Gm-Gg: ASbGncu3bbpx91UnP8FYTY7/iMuW5vadCIxZe13/YDAgTN1vHMlbdLP99i6t03ZYPdb
	hqrUNN5MyNN1x7L5sRUvTnZQHRitkOfVald/ujqlAqkVwHc52QoOkser8s2Z77BKruEsLdoxCkt
	xNGvzFJoJKClSvUEOPa0wR/f0D6a1qHhFqbaq47Z29EtVQBsq/mM2cy2ptKEYW/EI7In1etsNQj
	uNgnjML33bny6OZHl3JEnIFEj6y7afWHQF9IwEaWmsPhKi6FIxmye63k40pnwwQAJTVhbducESK
	FQaajsVG/qSLn63IlLKzl6wy/ltAPDmxtyWeCBzGD0zUQQwrgfxXH72C5ROBDICfnPBSm19bnmN
	wo7DtGqA8lSWoAKfOxw==
X-Google-Smtp-Source: AGHT+IE3A44CHRZT4LFqIN9Z4MWfOqywDl3gBVdthcSxAs8gC51/XERlOdOoQsF0+0M1L1XTm+SLEQ==
X-Received: by 2002:a5d:6da6:0:b0:39e:cbd2:9129 with SMTP id ffacd0b85a97d-39efba2acd7mr10294748f8f.10.1745305388778;
        Tue, 22 Apr 2025 00:03:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4c37sm14496017f8f.98.2025.04.22.00.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:03:08 -0700 (PDT)
Message-ID: <b88bfe5a-9256-4de0-822b-b22d74dfdec0@linaro.org>
Date: Tue, 22 Apr 2025 09:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk
 calculations
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Cc: christianshewitt@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_000310_466321_9AA706D5 
X-CRM114-Status: GOOD (  15.66  )
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

On 21/04/2025 22:12, Martin Blumenstingl wrote:
> This is a successor of a previous patchset by Christian [0]
> 
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
> frequencies. And importantly it uses the relevant 64-bit maths helpers so
> the code can still be compiled using for 32-bit ARM.
> Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
> still something to implement with future patches.
> 
> Neil, I'd like to hear your feedback on this approach.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20250110074458.3624094-1-christianshewitt@gmail.com/
> 
> 
> Christian Hewitt (1):
>    Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
> 
> Martin Blumenstingl (1):
>    drm/meson: use unsigned long long / Hz for frequency types
> 
>   drivers/gpu/drm/meson/meson_drv.c          |   2 +-
>   drivers/gpu/drm/meson/meson_drv.h          |   2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c |  29 +--
>   drivers/gpu/drm/meson/meson_vclk.c         | 195 +++++++++++----------
>   drivers/gpu/drm/meson/meson_vclk.h         |  13 +-
>   5 files changed, 126 insertions(+), 115 deletions(-)
> 

Thanks for re-spinning, will apply.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks !


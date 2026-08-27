Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027F7C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVehDwDn3vUosVzDAVI89hDucj1hjpgV8XEbxurpbsY=; b=QJ8eZNzIfyUH37NPSqJha7dOY9
	FtHMGQKoTTCJYHFTRaOs2rAIdZft1+SL9kbhS6eYlMSK3W5dQ1T+nC/t3mfrRi+kt+wQpLfHeZwO8
	kSQX7IRQPhotRiYzZfUtNxJQT/eSk5kja8fTTM3R3lj1Dnp4a9GjPcrUrgN5kFcz+QIYnTV9pL3K2
	LELn0Oq5T61HPgCPPnr/OwkFpwwdNi1w55UXTF+myeHWuFJWSPIIrx7T0CaCTAqSzX751pcHLB6nT
	hrKWMG6gKvcPSWgnAJRz5fgnrd4A8JfvglhD9ezXfws4w7Hc1k+7MAlhegU8EQDpxx48qNhbrCtwM
	J9L/yxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVrl-00000003glG-1BfD;
	Thu, 27 Aug 2026 08:53:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVre-00000003gi9-1zRt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:53:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso340663f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820816; x=1788425616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVehDwDn3vUosVzDAVI89hDucj1hjpgV8XEbxurpbsY=;
        b=dnoWiYpQ97+ZK+fvJSlp91KmrMjWB0Kx9C0/aJbj6MzzdfLe7IRA6sa5AvvwSiN1ZP
         Jmt8qhvq8jPcF4ETfsd1cAU5eo6MyH0YrtKPtma2ziXsFSLe2Ebnum2Bx/c40nxaINcA
         ie1Lg9k5r0QVlCNXjPX/F0Z2fD2emtXGgqTbu1PSVr/gguDiJfWKihQKXNHazlBSUT4E
         qkAnMWxmc27FshHFEf7DFj5qp8nKQc/ntp4uqq1EajKhweFdDncI3scWn5WcFeWF+EA7
         7V5W9HGMzv5aoUuULhtB4bp0eM/yPlznO0QbkgdONE9PrTH2kz+h/mIJdQ/D0dQhH69G
         zaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820816; x=1788425616;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVehDwDn3vUosVzDAVI89hDucj1hjpgV8XEbxurpbsY=;
        b=aA/epx45XHRUp+Cadg4Oz3nwAg0fEVED+4p23irUQ08ZqgHG6eILZ4RZlVQTaf3pUH
         Dm2/ov30SC0lIT5tjNDdtmi7/+9sXpL7tGYEQE7/b1z1Yl7oHA6zXIUqHUUsNgacjfkE
         YSQOrog6p0RFb55dJTX6awaSQK3720dJNkxVVS5zwTr1UOtwHE3La0fWTo6oC/VzivpW
         V5XBDZ7K5cnK9hZciCJwgyIrE/Drb7Qf38YfHrRvB4NenhAWgDDUd5kIQ45CQADImm5Z
         erOjYxq9hwInD3aLWBLtmjTg0eulzD7StcPv/zaIFg3DqzJcJgItwp8p8ucfvFczkh3w
         OrFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIZA3ZrLQXTO+0gyjujwUv6ZUo5nHdbQEuXEwZQSpLa6TEVSoqttloSE1HYg4bkFoBKlOanCgSPR5PEgMsNYXx@lists.infradead.org
X-Gm-Message-State: AFuF++lzxoTbLs6ss9ZrqpoOdqleP655XQ8IgK1EnsMyxjjUPBTIy6s/
	HmhRuzwYdVqvdLGufZHUEMXcj6EVteRv+uuIpwFg4lPDMNHyrIWKxMILavxwrTtcKRRn+9uqI98
	FKXGKaHA=
X-Gm-Gg: AR+sD11JwRDFXtn1iCLsbDw/mjl6VH2gj2SX9sJz4hpBX0151ZXXD3EI39/MoGJA8fq
	8xNmJ0oZZvALTbC3+paRCWEG0bXDxOLZ6OtvRT/tZELZJFjlI41Bpjb4HIhtwdvnQoRZEppFazL
	MuMYVx8LBzSsDoHcRHjpIWIamJi7bI0Ciw7xx1fZg5VOfvwbmzBj0n8QXuM7djESwSOxQhFDGB8
	kOGlAmCNrZSSm5O8+FtBu38F2X0Mj/in+Lqp+3nRR/mVybbbhJ1KtG7iA0C5JMFT0qLPatgOArg
	NxnNyOCp9l+wmSAfF/cJK+eZO8JQwU7L04Fd/rXZ0wWwGhIH1sMPUI0JdzQm5F0SmCsu+Hca0wh
	lq9QJixdG2ZxDpqZ7+NCvvUD724GMiDL00pdJlcgoQdJs6wNCd50tuqsxBSf5uvH1EATqQwif1y
	yimm7NcsXrsjS8tCycYMSv+A7Ilp+ROlHNaZn3qImQD56SXYlam18hN+E851QrLRxwpo0N
X-Received: by 2002:a05:6000:310e:b0:482:ebb0:d00f with SMTP id ffacd0b85a97d-482ebb0d2dcmr5858920f8f.5.1787820816409;
        Thu, 27 Aug 2026 01:53:36 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9f0esm8105572f8f.10.2026.08.27.01.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:53:35 -0700 (PDT)
Message-ID: <444d0f8f-e669-4267-b28c-697e205df51f@linaro.org>
Date: Thu, 27 Aug 2026 10:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: Fix typo in s4 group name
To: Sean Anderson <sanderson@brivo.com>, Linus Walleij <linusw@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Qianggui Song <qianggui.song@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20260817162212.1890616-1-sanderson@brivo.com>
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
In-Reply-To: <20260817162212.1890616-1-sanderson@brivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_015338_558619_408F67C1 
X-CRM114-Status: GOOD (  14.87  )
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

On 8/17/26 18:22, Sean Anderson wrote:
> One of the i2c pin groups has some junk at the end. The name should be
> i2c2_scl_h1, and indeed that's the name used by i2c2_pins3 in
> meson-s4.dtsi.
> 
> Fixes: 775214d389c25 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
> Signed-off-by: Sean Anderson <sanderson@brivo.com>
> ---
> 
>   drivers/pinctrl/meson/pinctrl-meson-s4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> index 872948699e9fe..365dafe457a9f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> @@ -854,7 +854,7 @@ static const char * const i2c1_groups[] = {
>   static const char * const i2c2_groups[] = {
>   	"i2c2_sda_d", "i2c2_scl_d",
>   	"i2c2_sda_h8", "i2c2_scl_h9",
> -	"i2c2_sda_h0", "i2c2_scl_h1l,"
> +	"i2c2_sda_h0", "i2c2_scl_h1",
>   };
>   
>   static const char * const i2c3_groups[] = {
> ---
> base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
> branch: meson_pinctrl_group
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


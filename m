Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E32EEBFD22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 09:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++gWQ1SwhCFjmBGRgz/y7dJIShpHiYWMcQltdeeVLx4=; b=ZsajPAou0tgSwE055VMmo2QDjE
	ALbt45mjCDz1ZFFKw1w1usy7Q6WqwxkMSrmK307Ipf8sGgnx6iK0C6xYrDZhpV5cPJZqcrzeocwtO
	witmpjaD/7bMsa3BCI424p+GKJG97a2atrG+nidb/GLMjzF7L7nE6AGfesuUf/cd9LY5xeFofbe45
	8iK8z4xkM5g20thQVrwwX/xHoyVtJiI0dG8Y/God3raikDaZ5FLtpivgNaloU58Cgu0iP79tKW94E
	YXR1LIJjdnXx5gKxPTMrWJbDMgxuvO5xbdU3ttXqYM57GjrlGqPzkPTYYTDcBlekBKKgOAwCk+voq
	xBUQwyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDXH-0000000FMjS-0yvf;
	Mon, 13 Apr 2026 09:24:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDXE-0000000FMif-2PDX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 09:24:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488a29e6110so45624335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776072287; x=1776677087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++gWQ1SwhCFjmBGRgz/y7dJIShpHiYWMcQltdeeVLx4=;
        b=pNxykhnCzeV0c/bparxk0Dn6/Q4UGcCfs+iE+U2lpnhZpvHRw71+YJgJ3Whoo+XfUb
         kj9K3wGc+gF3ta1TPH9Z30drb3yDpwS79AoXVDjQwih0hiTY0yZLNin8t81H5ATscys+
         dzP+H+qAJAtRokq7i+WwJoQJdIaTXpLVZRmh3EOLssPB+qDKtg0wY+4gqv6Wr10+u3QI
         3ZibqNHVEHBO6Ik/+f3AatV2lIG4EeiRTlxIovGKrwxc/yRmUMurCbQA9rEWCGyR6Q5j
         fIYDusyciEU2Yy1ma+eYFM2Zx2Hl+SlBYPF2d9nIxFz3AKClduqasPStZAomNbSfFOUs
         TkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776072287; x=1776677087;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++gWQ1SwhCFjmBGRgz/y7dJIShpHiYWMcQltdeeVLx4=;
        b=fySABY//WZTZ2tEJCiEww8NyQPA+iizC9I+pd+C+/Gswae+OsMN6Wk3vBBjIZ3lmwA
         yr/n7JtcXfYs9OxqPP3jL/4cnT43Zm4bySqRQ5q1h0Ss1YMoi8wtwZ8W6zX+eCqyUkFd
         91XsfPfInUDrVKzbDpo5Heq35QULUYjtnzU9PnVUdD/nSCzHWQhkjngnMGnvaOE4UHZd
         7WdVOrXl9n24OHB+fcCiS90pN5gmetyitG76XysJN2+HlwCaGlTvMZgstUA8808A2npb
         2tzzscziuhz+Vt+yWFKJqu7qw0G+KN+sWpIMCHWAP0OQT1b5p+MzbNXvVM8mKWRgSVWm
         rlbA==
X-Forwarded-Encrypted: i=1; AFNElJ8Z53mGWIvspYT8LnPVMq/luihOFfsX9c0OId35mdLbkwACZF/Jg3fYhEcNxp5F/3dAerDpjLbKm2h69kQxxjZJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwRqN/iFOTsZ+n7soQZy7ubn1T9lzBdVo4AgTXPg/Jh9KH1XvAO
	stlEHXMh7PS05J0nqXM9yARcwlOLfuh6pOTxqrnLcOCcQHXgc2b4ocm3LPSIMChrzVI=
X-Gm-Gg: AeBDietDiKlBbPQClCXQBAnwpaDnUOkt/loIkbmrBRQRZ2rBaZ0Q0DVB85vw26GTopQ
	II4jssJXgAHDmRO9pxBS7UMSt5j61wWXCdKjbn2o/uwfGk1GlYZI4jCTrZwkCkHV+d/IivmED8g
	mKFCGFDCsPKAxq/v6oUmgT7MAnyQs19BfEecLOTbmHZ1udQxCYF2OnVcEfhiUQcdJ9vheFlQKxE
	x1TkardiKA6/cHQfjJj6oalHugR6e8DFFg5E1L5EgTpwMJ2SFWdW09FxBL2/eVseccXY+GB2ng6
	XWU0GoD3k84l6VW98mVTSWj4HDfcITyWWxCUbsZQybaDDt+vd2ag3FSuK1kfCXkz4OGq0ghxRpL
	lksQ5cqwqvMThEoTInw45K09v2li3x3CkAid1XO8Pw1udUm84MY0gzja8ekB+pU0bnsh/yvOKAJ
	p/1NuKRs67VTT8tLcqOzwDxYAYSbnbkig9YurrB08bp3SUgAlymYiDjE4W5MKef7oDDPD+W0bU7
	rJFbJ+D
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488d67fa48emr177471465e9.9.1776072286480;
        Mon, 13 Apr 2026 02:24:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm373689155e9.3.2026.04.13.02.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:24:46 -0700 (PDT)
Message-ID: <3a08bb84-b313-4b3b-bb61-1b686226e902@linaro.org>
Date: Mon, 13 Apr 2026 11:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] soc: amlogic: clk-measure: Add A1 and T7 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260410100329.3167482-1-jian.hu@amlogic.com>
 <20260410100329.3167482-3-jian.hu@amlogic.com>
 <9a4f69e7-838a-4992-af1d-46324e14eb48@kernel.org>
 <274d2abd-05b9-4dbd-b962-ff70044b8d07@amlogic.com>
 <b0d81181-d4a4-4c03-8c26-c7f6e8cde70f@kernel.org>
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
In-Reply-To: <b0d81181-d4a4-4c03-8c26-c7f6e8cde70f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_022448_685454_8A119C40 
X-CRM114-Status: GOOD (  16.94  )
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

On 4/13/26 11:10, Krzysztof Kozlowski wrote:
> On 13/04/2026 10:21, Jian Hu wrote:
>>
>> On 4/12/2026 5:55 PM, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 10/04/2026 12:03, Jian Hu wrote:
>>>> Add support for the A1 and T7 SoC family in amlogic clk measure.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> ---
>>>>    drivers/soc/amlogic/meson-clk-measure.c | 272 ++++++++++++++++++++++++
>>>>    1 file changed, 272 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
>>>> index d862e30a244e..083524671b76 100644
>>>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>>>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>>>> @@ -787,6 +787,258 @@ static const struct meson_msr_id clk_msr_s4[] = {
>>>>
>>>>    };
>>>>
>>>> +static struct meson_msr_id clk_msr_a1[] = {
>>> And existing code uses what sort of array? Seems you send us obsolete or
>>> downstream code.
>>
>>
>> Thanks for your review.
>>
>>
>> I have checked the previous Amlogic SoC's commits. Such as Amlogic AXG,
>> G12A, C3, S4.
>>
>> The clk_msr_xx entry is added after last SoC's array, sorted by
>> submissin date rather than alphabetical order.
>>
>> So I place A1 and T7 after S4 accordingly.
>>
>>
>> The A1 clock controller driver was already supported in
>> https://lore.kernel.org/all/20230523135351.19133-7-ddrokosov@sberdevices.ru/
>>
>> It is also present in the mainline kernel:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/Kconfig#n113
>>
>>
>> This clock measure IP is used to measure the internal clock paths
>> frequencies,  and A1 clock controller driver was supported.
>>
>> Since the corresponding clock measure driver does not support A1 yet, So
>> add A1 clk msr here.
> 
> No, what qualifiers or keywords are used for existing arrays? IOW,
> please investigate and understand why you are doing this very different
> than existing code. Maybe because you sent us downstream, so you
> replicated all other downstream issues.

I see, the existing uses "static const struct".

Jian, could to switch to that please ?

Neil

> 
> Best regards,
> Krzysztof



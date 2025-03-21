Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA11C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6Qr8QAI+Mok+bWdMsFd6M7n8U4F8tUmQSbLyZ4Fyg0=; b=u8zCWGYjjT5e2BpJbE3Ms9KF8a
	GYUGzW9zbJ4jZOmocbjZp7Sr/1t1olyurgAK1F3gtlarmJG1N1OG8ffFd+/7BDrgRl1eBz9kgbZlH
	QGavT7ehM3+wuzZQP9Qv0vMSj1RAzLw5tLJd0LiRYyZ+KXG+H7YGrcEaZV0Qo+cFhhQv3782H0ww5
	nJYF8AsMRyG9TLAr3RYiIYaaw3ygVpMLA7KW4vM6mYzUMqVdWay39liEV65vf6B4W/+JRE+Hpg0Ia
	YE1MX2zMekL0CSicmSV+9yyRYEuBCcvLAl4o+eGTI/SUcmdZY2kaaOLYd/XF2XYqvgtRjf6lQ2oVq
	es69qmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdXY-0000000F9WX-0xMN;
	Fri, 21 Mar 2025 14:40:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdSd-0000000F8AC-3sXQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:35:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3912c09be7dso1332383f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567698; x=1743172498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6Qr8QAI+Mok+bWdMsFd6M7n8U4F8tUmQSbLyZ4Fyg0=;
        b=SrLWAgr5Gd+AOK7DymkO3BxXTWWfd96RYJn+upOZeFDz7yhd6iULrpXA1rKzo05iBK
         BKu4sxKhWvvpUSGKkVcP+OCGkk0xQCsDbSGomhjXLGngCbfAS7+UqW0VTp2Q0h660pdk
         1GrsajM42ENJgYJo+Nx12lL9QYL6hf0nVIYduiEtNaV0OqXf/KNCPr0VcLJ8TrsaDnos
         OCf47MH+Asn4QivtQMq/dJuvy8n1cbD3JCanNFDpvNsX7hYWMIo1vyocLKFj6crfBeMm
         hdk8w1jYmazAdXRtAh5P/9sv6gq3hCCOKXrlA/jXYuouGTBJ+5dhX33Iq4bCpWMQLHny
         y6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567698; x=1743172498;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y6Qr8QAI+Mok+bWdMsFd6M7n8U4F8tUmQSbLyZ4Fyg0=;
        b=K3svyaT9oiQbNFrwCn66yn30PwsQr7I9fcvJOHJO88w38Nnn7kcr2+t+/Z0Eg1uuO9
         iIbt+6WFBCL6zxdhg3cAne8eBRyS7DX0BNYke0IcO+Y12NZWYSsfYZkE1SeXG18awXHf
         R1yHDCXmMf5wYmIpJ0BqFynzDTfvVKlodn9KtKy6PM0o5YAqR1Jt5br3krSmDpmD6gh8
         X0uYaRlUgG/n4VUmb1VQ3BSGO6MZ1PnuMUuEHxCRvYfTkee1sQSEz8gEmzc9XNdJ0ciP
         AihY75D/BMDn/PZs4QzmOVxKsUE1xyqdI/mF1Vgg8IazOVMtvgvetA2DQvQFTZYG6HuO
         S6Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUGxzRk3EGOkvDPxI97JEAT1nUV1Mv/N9BjL5B6RC3FRx9lB/DQjiHkN2achtLQyHWCnppPUxfu7g8gZa3UZIJS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnd3AN/Pug6Oy/+TU3TAC/JlYseVHiUmSx8jadpVVaw1Ox2e5G
	b2KDIV0arSrA82klUiuOj7UvIoQwBSZVlaAmGNvLqCmsd1mi8AFE9g72JQC8asU=
X-Gm-Gg: ASbGncujttQgDLgfffn7VNLu7bc5rk/bM39mDb4bvldDatJkj+F1lIfiNO7uI0LwvAQ
	wYGUHj0pST8+DRQ7TrjdmXDyANinnPpHAOJqhLV2E+EN1AR6m67PwMKz0yy7mH/GOhrl6gIJyHB
	d2lF9r3Awsmaidn8OSfLjTZufOfM8OBFkVTEG4spqGhqNiKIIPIsFpcfZNZ7SerDrQtQOp6tRki
	tY5UOWVF3XZh7zHVlZt1/0/rTpTAPyGRPiu4dyEln7OJ6vQUYYnF42Mtdxv3mvVUyKcK7oxLnbd
	5fIMysUfMaFNGU/QsbEfHkw1m4CPYOb/cq3oZbvhoyeBmw3Zpeu3ruesdNm3uBdX8lPIngkEZzr
	5MtaSQIZSypYLJ/2b3uNOFw==
X-Google-Smtp-Source: AGHT+IGa8KHeqSfvai4gM0A+MR712S3ariHHnp5X7yo+cWqQtSzUkx4fPOGLLduFzalQxzqnA/R9mw==
X-Received: by 2002:a5d:6485:0:b0:391:2d8f:dd59 with SMTP id ffacd0b85a97d-3997f90d943mr3320018f8f.24.1742567698365;
        Fri, 21 Mar 2025 07:34:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5080:77b0:43f2:5276? ([2a01:e0a:3d9:2080:5080:77b0:43f2:5276])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b55cdsm2544183f8f.52.2025.03.21.07.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 07:34:57 -0700 (PDT)
Message-ID: <2b572981-7e63-4052-8186-4ba17f530cca@linaro.org>
Date: Fri, 21 Mar 2025 15:34:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 05/10] phy: phy-snps-eusb2: split phy init code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Abel Vesa
 <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-6-ivo.ivanov.ivanov1@gmail.com>
 <7v3xkvldjnpqakrndwl6wb6vdsl3idbirlhddpqhwtt3ddadzr@kjafi3updcsb>
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
In-Reply-To: <7v3xkvldjnpqakrndwl6wb6vdsl3idbirlhddpqhwtt3ddadzr@kjafi3updcsb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_073459_974270_C6AF6EA8 
X-CRM114-Status: GOOD (  16.19  )
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

On 21/03/2025 15:31, Dmitry Baryshkov wrote:
> On Fri, Mar 21, 2025 at 03:58:49PM +0200, Ivaylo Ivanov wrote:
>> The current phy init consists of hardware power-up, as well as
>> QCOM-specific eUSB2 init code. Split it into two parts, to make room
>> for such non-QCOM init code.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>   drivers/phy/phy-snps-eusb2.c | 96 +++++++++++++++++++++++-------------
>>   1 file changed, 63 insertions(+), 33 deletions(-)
>>
>> @@ -378,6 +401,11 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>   	if (!phy)
>>   		return -ENOMEM;
>>   
>> +	drv_data = of_device_get_match_data(dev);
>> +	if (!drv_data)
>> +		return -EINVAL;
>> +	phy->data = drv_data;
> 
> Nit and completely bikeshedding, but this looks simpler:
> 
> 	phy->data = of_device_get_match_data(dev);
> 	if (!phy->data)
> 		return -EINVAL;

Please use device_get_match_data() instead.

Neil

> 
> 
> Anyway:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
>> +
>>   	phy->base = devm_platform_ioremap_resource(pdev, 0);
>>   	if (IS_ERR(phy->base))
>>   		return PTR_ERR(phy->base);
>> @@ -424,8 +452,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>   }
>>   
>>   static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
>> -	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
>> -	{ },
>> +	{
>> +		.compatible = "qcom,sm8550-snps-eusb2-phy",
>> +		.data = &sm8550_snps_eusb2_phy,
>> +	}, { },
>>   };
>>   MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
>>   
>> -- 
>> 2.43.0
>>
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899FFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Iot9I4h4jJMqZbR9/3Iio7a6IBbtlOgx6s1kh41LTE=; b=bT8Zl/BsiMyYTliLwPIe+JMWX3
	QaWB3NHBD2/aShC4/CyhhDQCGO9ex6lu3dejecHRTruF/KXU8/e9tzOVQvnidH7k0fTFU3sjFFHa3
	657jpQ82uexvRyhVI7axLKe/lGprk5S/QIdwD0TeQZ5o4HmShzBrmgD0OzYGz2c2Lk9ozDcq63Fx+
	apw/p+Dxd57yB+FXa6diOPDtbojC7FNOeaJsSpLT6TWrFg270XfNVLOuPy9ojolWO2hCSNwH1hc0h
	815T4X8wZ4NPsNmAvbzy2NBLSST3eTR1wBwhZx2h4odV8eAwzOzq64tYDQY+VveUtD1oso/Gzmg9G
	oK4RiO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW9r-0000000DEzz-1bci;
	Mon, 24 Feb 2025 10:57:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW79-0000000DERG-2Yhm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:55:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38f488f3161so2260387f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740394506; x=1740999306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Iot9I4h4jJMqZbR9/3Iio7a6IBbtlOgx6s1kh41LTE=;
        b=G9vLz291+MbV5m79zK/Z/LM2XGYG1k67apBNmSgVz6xpCzY7vwBQyTcUKE8f7m+uw6
         FL68DP/QZVTXFEVIIpof1kps56EaEPb8uoqjc2wBeWfotOJNprAnlXKCKsd3IGymvZqJ
         MeZIgvwM2qORfBi3Z7c8cPz1jCKjPNmmM3OPuAmH1V+leqPAKGOCBmzUZbp2ipXPNVIq
         hO2vl/Qe8p6Ju2TMTxpGNHTUSAwsj83qdppUC3mGRNaFCLF2udFuofXcC3WX18UqxjID
         DFp0HSf4J+BPf9RU9AzSmfrcShb0S9CrA5agZ4UClFZAJ2mBNbbS71SJ7APdsez2mjUE
         KttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394506; x=1740999306;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Iot9I4h4jJMqZbR9/3Iio7a6IBbtlOgx6s1kh41LTE=;
        b=YwySDZqY6hpVtCUutskVTAfJZpRCtlJJqHktJVq8Jw1Ks5bE3VOOJM9MEv/MMxBb5w
         fyjtjALiYh2i4miqSBSDzSeMpeLIaIEC65Frxuxison7Ye0qd9rvkHj20U5tqJtzLDVg
         6PlZ2PbSX5m64Rm6cqGn+npv/RxJ9NbFITxN5DG4zrDl5sHohWoLworyG2Ufhyu5HGV9
         allP9PL3bhd05Q58okgv/dW5svSEyCVUkLTEFBMsnTWbomARWh8tfC+PL8lHJ/0D9rp4
         EVKFHMAQ7i8KoaxRCcsFwK9fl7FnAi4irEkEtdtaE066R98usTt8UpF8dt4TD0ydjfUs
         v1iA==
X-Forwarded-Encrypted: i=1; AJvYcCXe7KcqgLOEiCt0y13R1vP3yJRLvojh/1uiH8aZLbTFXKFp2oecJBKh+mx1GuUuM+qLpDPoC51T98xnt5oM9h+8@lists.infradead.org
X-Gm-Message-State: AOJu0YwTQkLOmx6gkdxnzamTkg4xg3VllH/4P8gnxddntUFAvkuR0/vE
	qhNh3Z7LT6TkJb+/fnE4+dxb96lj21zMTno8Oz+gjcvr4eSz8N0t7X2yEfjt4OY=
X-Gm-Gg: ASbGnct/8mtuZAk1sUfSjEy7XTECYI0Q26ObgKJkF4w0a/00oV6ev3DIg7r3TLBXmDF
	ptBPgaEw3iVIKWLwYN7ZeJgftW4HxkXQ0oWKJzJtXttNT+P5Zc90qijp6amBcUYzyocq+835WDf
	CMRp6C9p5LyUYFToy827lJtBVN7T8H0Twn8KC0UfeGWtCu1RcIfjjmtlfKcN9GAKKrrDPocThfX
	CiJZk4ecJ3G8n2yuJO2y+eBTeaBtLEkSIeUzixZ+IvEP57g6rkrYzg9Bi9F95km3X4TWJUCelkN
	N3XHinyV5324knEBl5ow0EfqGkDya22ZjKk4SjrRqltEY9XNX9hHRBTr+Ndz9+dQW0Iiqh6pM6l
	rz+k=
X-Google-Smtp-Source: AGHT+IE4j4S+EDiD5wh2IMuUEhCY86d7JCH8Dc3GdjFV6vdXtjgVdXLV1ClcAd5tybFFKQM3S7o/Bw==
X-Received: by 2002:a5d:5985:0:b0:38f:4808:b9f with SMTP id ffacd0b85a97d-38f7085c617mr10519652f8f.47.1740394505896;
        Mon, 24 Feb 2025 02:55:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:825b:5392:ef70:cc0b? ([2a01:e0a:982:cbb0:825b:5392:ef70:cc0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7979sm30904426f8f.83.2025.02.24.02.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 02:55:05 -0800 (PST)
Message-ID: <d3067b8e-38fe-48b0-b031-8aacd1aedca4@linaro.org>
Date: Mon, 24 Feb 2025 11:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
To: Abel Vesa <abel.vesa@linaro.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
 <Z7xF66TctF2wuoGj@linaro.org>
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
In-Reply-To: <Z7xF66TctF2wuoGj@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_025507_807898_52C518CE 
X-CRM114-Status: GOOD (  13.25  )
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

On 24/02/2025 11:11, Abel Vesa wrote:
> On 25-02-23 14:22:24, Ivaylo Ivanov wrote:
>> Some platforms initialize their eUSB2 to USB repeater in the previous
>> stage bootloader and leave it in a working state for linux. Make the
>> repeater optional in order to allow for reusing that state until
>> proper repeater drivers are introduced.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>   drivers/phy/phy-snps-eusb2.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index 4e5914a76..dcc69c00a 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>   		return dev_err_probe(dev, ret,
>>   				     "failed to get regulator supplies\n");
>>   
>> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
>> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
> 
> Maybe make it optional based on compatible or something?

It's already optional in the bindings:
Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml

So it's:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
>>   	if (IS_ERR(phy->repeater))
>>   		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>>   				     "failed to get repeater\n");
>> -- 
>> 2.43.0
>>
> 



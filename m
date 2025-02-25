Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88A8C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9USewdvJ7PYqMLaARTkWJYtBQaK26VR+XCGXeZgq7M=; b=LE1rxnXFMbcc8VlJPSnlKKtsvG
	lc41IYnD6jCt+p8P/Dx5+rDsXUNRKa1TwjuQ8SCTLp0LnnXCuj6UFYnDBoYuPDceMGvCeKad63d3d
	QtWD4PtM2kyR3gxGtDekp0gGj4RDpVcLib0cL09pr0m93L45Mrg22ZG8Cmsy26AkLluMxxo8YeYyL
	Yv9nt/On0Rasyo42M8M6rbkJ8YPNxMSrvy5gBrY/DXhVqTv+r8e6NsFfdxojUwA6bRICEOU8VWRUY
	2R7Bu/pgqk83mDcGy4giOe8BabBmcV6q+e6CBNh6XXGfERT0hO0caUHRZS5S5+5UQMpJ1NuY1m8f6
	H2mOT5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eT-00000001991-46m1;
	Tue, 25 Feb 2025 19:31:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzB2-00000000mfv-0BA4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:57:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3376624f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740506222; x=1741111022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9USewdvJ7PYqMLaARTkWJYtBQaK26VR+XCGXeZgq7M=;
        b=ZpjaKu+S7jlk/ctjMNyu5a7Xh3RmDAIFIeP1H5SsjYTvR66SSt5wi0DCY1kBBoMfK6
         KtOhS8usfAaqmU1M8oWEP/gX3zPPprIRPtFUONS1a/H6vwHsLRIzCmHw/7fOWle9SFHA
         7DU/WA5VwtqgcWgXAwOdfNRfx7ttTxVsWJqngX3Kku6HtsNyFfTYis7G9So3b1onwsET
         0hV4oKpqi84KjVv+UddiZr9FH1+5F+WmPvxjXNlSQUK+O2rCoyKGXCpqFmUAQi6zxmGa
         E8UfLGpnUfqqlJXRGQfNxBH7eViLk0C72+TuneIl8w6TVRgKiFhfkjwDHg3Eo7whiCyJ
         18UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740506222; x=1741111022;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e9USewdvJ7PYqMLaARTkWJYtBQaK26VR+XCGXeZgq7M=;
        b=jWm9XYV7plQtCLeQXJxOEZFMw/RmlGsWxSOjuGoDmmG9jxK/LhqMAhISp/R0ejn5LF
         Yi6z0s5MA/JDktQBUNNpLzMmXrf6KcqfkTiz4STcZEhypy3g+hfj4hCcGUIFq7NxNCQ9
         fJtAy0oSR1cTzxi/BWPEbareixYI0BAs1T6cTtondxj/pYIYUQyGj50yGTylAjAeNiEH
         yf3RNaHyDjOzKPb0obFSpji3744pfsvrQBliTU2nuES5WrUVgr24c7allSeXXrYAWZGU
         P/pI5Zb7mTEHybbKekR0ORMjuUuZFjD9MoaXtcDn1/yLS7M97Scp1UgZGKAJfgd9hchR
         RXTg==
X-Gm-Message-State: AOJu0YxU6uu9+o8b1y5PN1tRz6E+xgRGYMYCTXW+FVPvL8LsOBD44z0N
	O2SKGYP9g6b1vkGuyfHhqY6h5CQCpKUEx//SUQIJ/F//16Ig3A2iCyj6N1FHhaI=
X-Gm-Gg: ASbGnctE2MXGn6BMOA0UOYOwkQmv8OuonmJPWS8/KUbqoVyRIOGrTx1UgJ4mZACVDCh
	auF+EeWPnRKPlzoROUMhyHfw2oMMCzDK2HNeWwfqX0MXeAg/EB2OxfO2rKsEC3l9PNoCPzF12Ne
	DbBgnY7VHNwoTgvcTOVmRFlAngMhw17zuuusWmolo0Eh7nANR8xibbtlLAmyJYPlHkPCFaPXyqv
	bHTt5yapvptTeOrpfhKAC+3SHZ3T73TBD0i9zWr+hCNm84O/Z5dHfqJmm43csbp/W0WS8qHEgJw
	SE6qcAJpJco100sLMVPL7wOhbNlvt33RoHFklIpW2U31n0DJD6OHNorM6bb2ETEDym5qCa6oAZs
	sojU=
X-Google-Smtp-Source: AGHT+IHUAgL2tByhpFFBEFGQOdfrkVcNwwIG2P9l39t0NBi1UKfkNO4hyH6LvwamNSW5TxfMBytNRw==
X-Received: by 2002:a5d:5f8a:0:b0:38f:260f:b319 with SMTP id ffacd0b85a97d-390d4f84733mr232456f8f.44.1740506222366;
        Tue, 25 Feb 2025 09:57:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b? ([2a01:e0a:982:cbb0:23a1:f1ec:7a08:3a2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc1f9sm3000134f8f.88.2025.02.25.09.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 09:57:02 -0800 (PST)
Message-ID: <07d7f05b-ed3c-444d-8879-9df99174b7c9@linaro.org>
Date: Tue, 25 Feb 2025 18:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550 as
 module
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250225-topic-sm8x50-upstream-iris-defconfig-v1-1-8a17e2e193d9@linaro.org>
 <e959c772-9c10-4c87-a22b-e2f91ca05af8@kernel.org>
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
In-Reply-To: <e959c772-9c10-4c87-a22b-e2f91ca05af8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_095704_088004_DF0A4222 
X-CRM114-Status: GOOD (  13.10  )
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

On 25/02/2025 14:08, Krzysztof Kozlowski wrote:
> On 25/02/2025 10:10, Neil Armstrong wrote:
>> In order to support the Qualcomm IRIS driver on the Qualcomm SM8550
>> platform, enable the IRIS and the VIDEOCC_8550 dependency as modules.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/configs/defconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index a1cc3814b09b31ee659536a64b7db704153d6fe9..710452f75133896af2e3a19ae544f139e1c28a98 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -847,6 +847,7 @@ CONFIG_VIDEO_IMX8_ISI_M2M=y
>>   CONFIG_VIDEO_IMX8_JPEG=m
>>   CONFIG_VIDEO_QCOM_CAMSS=m
>>   CONFIG_VIDEO_QCOM_VENUS=m
>> +CONFIG_VIDEO_QCOM_IRIS=m
> 
> 
> Does not look really as Kconfig-ordered. iris is before venus in Kconfig
> include.
> 
> 

Surem I'll re-order.

Thanks,
Neil

> 
> Best regards,
> Krzysztof



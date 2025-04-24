Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9591DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsdYiir2/QPJiZE91FucRo493WTjvg2844/jPSOuFnc=; b=nzNGQYt2o2gS4nVIy5cBWjPaW3
	8WXQ4/P409t8PRkZYwJDL6cAW034ykydKRTSyzdLt8HYBE44vzVEQfGAeGNqbgs7HTLAncIgqmAwv
	cMqs+QgAb2YaROMiie3szJPqFUFEs8QrJY/jKalIhu9dQTJ/ZMtDURYnBf6GseuivTUReIOSXzJnT
	/Nzy7qi/nxc11ZjHCIxaGIr2jHWQZT1tSbrURFraZs9y+mPAxeLwCU1d/jzFXFILFd8zDQIMGbFHt
	KmmYzclTsQGy5DfeaG5aAMpjoNdAvRYE9azYCeS2cox9z3bOFqjXImQbOXjPRhs34nC/gM82zWMS6
	11gGmfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tzE-0000000DiDL-1QKH;
	Thu, 24 Apr 2025 10:39:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t46-0000000DXe8-1gfy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=GsdYiir2/QPJiZE91FucRo493WTjvg2844/jPSOuFnc=; b=TZisszCC/fBfnTCqno6rlXkXS1
	+5KN1DC/UVwxj9jLfknyQi2W2DumoEswx7zYpTRwdfzQm6IMQLeAkIT9eM0jFSUUw/9k/FE33xq9d
	avNp4zX4Co7p1i1ZIt9+SZgjm+gRBhh7Fa0ofCU8dxGGiZS5QdIA5/N7jw3RmP47WN44ioDXvRDnw
	w2tmqLakuq8TD1qm2n/pKGe2LFAcZXQvFHFqEteMmZxcJLyGb2xI/17Hgc7LSfxxBv06KI/3ERHOO
	u2kWsul/30n+9NGeMC+XhkhSGaHnTtZQSgdA1q+jlcsfQSLvzAWPwwuYzyti6MoiYWeE6xhSHglQP
	wDEPu4Tw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t41-0000000Bgxf-2ekj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:40:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso3903695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487611; x=1746092411; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsdYiir2/QPJiZE91FucRo493WTjvg2844/jPSOuFnc=;
        b=o9dQdHms+BMUKVPT4TzJwI/4p+yj6ui/oeG2KwxmJ9nLVyW+kg+82HGcwEASKHLXrX
         iuz95jmIW2KhRYthW5qEaE6K7sXZmS/53ggwErrxYMBzqbxo1uuzdS3J0XM22eyWhjNy
         u2E4YJmF2rLn6gtdrfRzdd/y9mzYkN/nzGRIOeWzNZRUJkqLKP7oMARSnbvNZerZWLr1
         mQ6ESrNo4V8qH9otDRfG0aLEQv9Ct/ExdAOnKYBXOkbcun1j/zv6inNcyRcnhsSkWy3C
         MWJTJBxQge8zJGpu6b/Tar+3BWnuxn5K5rRdVbi6P/cbA65CwDvgfQky8eZqUTQmfods
         qxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487611; x=1746092411;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GsdYiir2/QPJiZE91FucRo493WTjvg2844/jPSOuFnc=;
        b=bN15pHBtSEaVki5B5s8+Lo3FY1pB6LOCT3Uk3m/Raz3FLCv/DwS6re4NlsABFYiY+J
         MP7tyxZ1+JWJ2Kwq9hyJEBJhxSwXNPAWCOgj4h6C3DgMhRKfrWPgfvCVL1ZFEPjmJzK4
         IAtLSvsi3CK4P0H37MeEea9dcvb2qzdeQ0A0NKFpPAJmc8kpB+Ek4Kula14oSe3SjI1m
         bog5weJ+jjdsPjgateCPiYdNV1FkUAiyb4uv8G/2zUDJZXxJpr+3qCAQ8uTtrXprXU1u
         nGoS5gwcdH54hMWGwTUlxUhMBnBnc9TftqyimNumsljWUWQOnzPAFOew3VT9zlEopG/k
         d5LA==
X-Forwarded-Encrypted: i=1; AJvYcCVE3GJzCpA61AlKtFwAW4kzXe111TvgF7TzDCd16UBTMNTOQFQL4yBwlcfmJB0qF9SznvBVqpX+aRW4ZRjFUPF/@lists.infradead.org
X-Gm-Message-State: AOJu0YxwuHBrnqodyk17uC6r9hJqUO32sENQxXO2CN4FEvEhVa2cUD3c
	6xT8EcEUlUDK3yFvW3xc2jlCwZ/PDpSuo+PTwVftysovVugpe/inkV+fyf4JF3k=
X-Gm-Gg: ASbGncsnTF/6gAHvC+aAuCnNA4/zC62jw97Zgc/bFp3x19+OYsSFizHdm5RMwLiofIc
	uVJoNPhOvp84Seof5dU0H3U8WIr7XDqIq+fm01AVkM3h4t383EMt9tgpeQwD/5a/No9KJXNqUKP
	lXs7583U3Y08ylYBkf69wINv4H9DdZ/LN1fwUwFdn/PAMt+n8Ns0HXBO1HVP60smMxUUD071AAo
	bvzNdeWkp5Feo+jZ3IXXG5/U2TkJluJtgX34X+3EiBHFgi4S4hbTJBWsK+/rrH9BJ1kxpgn99H0
	F7Ecb7yxM8vqpBVw1QCeaoFxLJrqCsg5dAsQsvbtXKCJhF55ZUcJIFNW6yAaZ/+fn6F6i1pRIg0
	2lCbV+DBTT0z5kwf8Lg==
X-Google-Smtp-Source: AGHT+IGbKzH+UdHoa8Vh4y2Ra8BSslqvY1MacnDBCVBoNcCm+y48fIa9KnJUakAXtxUbplXif8s16w==
X-Received: by 2002:a05:600c:3482:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4409bd23196mr21055935e9.13.1745487611286;
        Thu, 24 Apr 2025 02:40:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2b77f9sm13631535e9.25.2025.04.24.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:40:10 -0700 (PDT)
Message-ID: <094c0d7e-7b24-405d-8e44-c981100383f1@linaro.org>
Date: Thu, 24 Apr 2025 11:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 0/3] Add support for Amlogic A4/A5 Reset
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
 <ef1ac07a-09c5-4f8a-89d5-44d232f8ae41@amlogic.com>
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
In-Reply-To: <ef1ac07a-09c5-4f8a-89d5-44d232f8ae41@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_104013_829568_5B5AE90A 
X-CRM114-Status: GOOD (  15.40  )
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

Hi,

On 24/04/2025 10:32, Kelvin Zhang wrote:
> Hi Neil,
> 
> Are there any improvements needed for this patchset?
> Thank you for your review!

No, waiting for Philipp to pick patch 1.

Thanks,
Neil

> 
> On 2025/4/11 19:38, Kelvin Zhang via B4 Relay wrote:
>>
>> Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.
>>
>> Imported from f20240918074211.8067-1-zelong.dong@amlogic.com
>>
>> Changes in v6:
>> - Rebased onto the latest v6.16/arm64-dt.
>> - Link to v5: https://lore.kernel.org/r/20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com
>>
>> Changes in v5:
>> - Rebasing on top of the latest upstream changes.
>> - Link to v4: https://lore.kernel.org/r/20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com
>>
>> Changes in v4:
>> - Remove the superfluous 'items' in the dt-binding.
>> - Rebasing due to recent upstream changes.
>> - Link to v3: https://lore.kernel.org/all/20240918074211.8067-1-zelong.dong@amlogic.com/
>>
>> Changes in v3:
>> - rebase on 'amlogic,t7-reset' patchset
>> - Link to v2: https://lore.kernel.org/all/20240715051217.5286-1-zelong.dong@amlogic.com/
>>
>> Changes in v2:
>> - remove 'amlogic,t7-reset'
>> - move 'amlogic,c3-reset' to the other enum list
>> - move reset node from amlogic-a4-common.dtsi to
>>    amlogic-a4.dtsi/amlogic-a5.dtsi
>> - Link to v1: https://lore.kernel.org/all/20240703061610.37217-1-zelong.dong@amlogic.com/
>>
>> ---
>> Zelong Dong (3):
>>        dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
>>        arm64: dts: amlogic: Add A4 Reset Controller
>>        arm64: dts: amlogic: Add A5 Reset Controller
>>
>>   .../bindings/reset/amlogic,meson-reset.yaml        | 22 +++--
>>   arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     | 93 +++++++++++++++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  8 ++
>>   arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     | 95 ++++++++++++++++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  8 ++
>>   5 files changed, 218 insertions(+), 8 deletions(-)
>> ---
>> base-commit: 4bc28af2da876531e5183d25ae807e608c816d18
>> change-id: 20250313-a4-a5-reset-6696e5b18e10
>>
>> Best regards,
>> -- 
>> Kelvin Zhang <kelvin.zhang@amlogic.com>
>>
>>
> 



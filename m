Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8945DC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yopYTcaLHy/YngxUjGRVUYbmllYbCh12wVB+pNQbzC0=; b=2so6nxJLWtgCnBHr3/OnNleT4T
	fp2PiBdRvbZGSf/EYS7yPBkx53Yl5tnkshOLfsxzKWVF9Jes4r1KjSrsAzevLK3uqqK9oKxDzF4gR
	xOybGkT4RjGubkoTd7Rj4Agl0bO21/sxBdxtMb68nP6DVAICLVhWlaiCM2G3FSuY4H0ACxQOQdetb
	4uODUZovGqLGQ84pdic86emtYX98/gGEUMkc2fOcqYXhgx3ZKWv1PfByMza+tRfAi3aHYF6zdYjT7
	mltgWHd+Tn02v1s5DlKg/M2s8+ebUJ4t08jeCzEBQWPf5mjdzeVsuY8DizCVSsITU5tjbVaAghATi
	3sGb+3Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebj1-00000005QUg-49Zp;
	Wed, 23 Jul 2025 15:49:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebVx-00000005Oiz-3LUx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 15:36:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so686405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753284976; x=1753889776; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yopYTcaLHy/YngxUjGRVUYbmllYbCh12wVB+pNQbzC0=;
        b=nMhbGuutm57Njv/a3kbiaj4RKDIQxigCaRqyr3xS/tYgmE3GK/DQ7JpBQ5mEv6GpxC
         i7TCcP78HumVMvvQhr3XH+CxQo8hv8T69tNwxj3Xg+sBEs+gCW55enoPV1mZznOKvbDr
         r46d2u+nXeKTdrsnThBTvzkQrIl+2yW/JAEUU4ub6fOtczelMrezPOtvKzJfu0jF7i6I
         ZZNBZVh8QS9u8f9vpRyWH//pDL67l2Kmgl7SDa21up78EZ2s6Wh83g1lEQsCvy/Mzkdj
         5AsuIyhQ0+IdKuIUrpuJ66WyJYrGfUilIioedW2J1YDTY30+198xnBwptayRUHgqky2p
         nP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753284976; x=1753889776;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yopYTcaLHy/YngxUjGRVUYbmllYbCh12wVB+pNQbzC0=;
        b=RKFnMS22+DI1x3zWhDxIeVqin6E02fz3MBlWT+Xmf3ZpESciiFTbXO57OH3lMkKiuC
         3yWrkUpJqCrH2YXOd5ON0TkFQvNrAKnZvH8SdtNT9GeinRgizoRETSYqpS7YiFKxTncE
         aJpGcLqP8H6bmYq6ULiNBrkkS52+zWGGFT1xlpzgcQxq8FkMG+8Ne6Hr0+pkQ3sd6+RC
         R0b3QOhdiEizSXBe4x6PZzNTkLQP0Gy8JXhC1Tbtv56OiPX1/fJBHKLUxAFjqzzIbOOa
         2d/Tj/pJBUmZzxI1hWfjebyeEK0qjAXxb5kaalpvTdD8dZrcIVA5IoF4KooH1xi6N5CZ
         020Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6RZnyuvDcmvTc9D2o681kyMbsbvdRC0mfym/PAgw4HzBVo+k3rJiF63vLJRjPnJXdkZdN72b/zYj9CljbLM91@lists.infradead.org
X-Gm-Message-State: AOJu0YySlFoFazCJqXEjcfyb0QTJYc/JNTajNo5V8roaN1orvc6LUi6O
	mguhWt1DfaiwPQII5fY0BVBg/Tt6EwamE+KgSPxyN9MQzL2CsTC3kaGEjOh8vJlM7xg=
X-Gm-Gg: ASbGncvQgHW74f3JuBY3t4kyCH8ByhcTAOlp+ct5Nd1bqbeb/3CY9BqcWcsvRGQoKh+
	mRNGnEn/DsdEPW7orcdhet033YYtb0IqisaBE6TLYL89qhFtlvlAdsquxECZ6giqKfpaMEkY9kB
	9NagqOhJ4mJH/DXiHez2ZQ2pTNdpHZNpfmM0oQs2Xj/bQNzJcvAGS/wBhe0W29cFZEZ/4hy6g9D
	WNyKyz/F0XAKqz/3gPsUckE+uiQ5MEFksHAuAvFJbtdGiGtnklmxBx6EuwWk6Fca4Yv5Ix0eUbY
	LsKAOpy1COdmrjZNlTTrwJfYiz2geLlreM8Xd243li+YLDO8CNXjP0vYbRmTAup/KpH45D1a54N
	roDWl4t1TngsQZyIn+BTF74WPDB6Pt0JYdRka6QVbuVwYDs5QEdUCvTVRPYR6l8PyLKHom4PbIj
	2W1Z7jD7jPWs4h
X-Google-Smtp-Source: AGHT+IE36FCAwkzfiHLT8YUTKB5dl8mhn5lwwrUiNUjYfXCamvnt7XB94dMS1C8m5vdXXhKPLuuwTA==
X-Received: by 2002:a05:600c:4fc9:b0:456:1157:59ac with SMTP id 5b1f17b1804b1-45868b23d24mr31817135e9.7.1753284975917;
        Wed, 23 Jul 2025 08:36:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb14:150f:cf00:b6af:e6a0:6569:3a1? ([2a01:cb14:150f:cf00:b6af:e6a0:6569:3a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586918094csm26728745e9.2.2025.07.23.08.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 08:36:15 -0700 (PDT)
Message-ID: <268811ba-03c5-4957-b073-1dfbad77747b@linaro.org>
Date: Wed, 23 Jul 2025 17:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>, Thomas Gleixner
 <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
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
In-Reply-To: <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_083617_848405_BAC8364A 
X-CRM114-Status: GOOD (  10.17  )
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

<snip>
> 
>> +	pmu-a520 {
>> +		compatible = "arm,cortex-a520-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>> +
>> +	pmu-a720 {
>> +		compatible = "arm,cortex-a720-pmu";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>> +	};
> 
> See:
> 
> 9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
> 2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")
> 

Yeah switch to 4 cells now, so you can properly route the PMU PPI interrupt to the right core.

New SoCs DTs should have 4 interrupts-cells from now, I'll migrate sm8550 shortly.

Neil



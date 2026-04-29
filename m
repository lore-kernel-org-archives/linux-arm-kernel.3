Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAB1FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Lj5tmUBXJFmzYH2N7Dd27gLNCll+S51FdGFIIdlW1Y=; b=R96pZCTHdNdHLyfBhe2gLMMiWO
	YRzkW4oa1mFwgjmebinIpuRQVeAjG3KFxQ7wlnG0qb62Bb6hmRqGV1zy7tOLk44Z6J8DUK+bBBkhf
	zqfzc8f3b/JQgolGxI74X2jRKSoPhSe4iqNBTGsfaAM7G9badumVjFmV0zFq9BlbfZ/GH0OqRPXfp
	rSe259sbV9r+VasOWr0dd0OWgTDaAPBPgfMCGkjCQrbJXbawm/27PbNzH4o+h6Tbw7stB/2+BwmqQ
	AYmO589qfyt/icaunC6BlPWoQDlr7fzakWt5JDYe5xSMwy9winA+KVHrkmhwXcs6ZzPNPKqhZEW8C
	92SfELaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0tM-00000003IP7-1tJr;
	Wed, 29 Apr 2026 09:07:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI0tK-00000003IOX-3Q8Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:07:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48374014a77so157736825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777453653; x=1778058453; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Lj5tmUBXJFmzYH2N7Dd27gLNCll+S51FdGFIIdlW1Y=;
        b=njjZ3hlaeqD1KeonIdkf/iSRLX9sTWFsJMioVVyB6YNRMnm7tGcvYshqE0d7iJUyUt
         Ouhf28k4Ks2KaEcZM79KKv1omeY3XtGOxzX0lBj1AQmZWxFuENvl8vudvmQ/1AlqfgYu
         fhIOQmb2WASzUHxVpB+8OZnErdIaW6Wce1xYxSoY8EB/Q39QAu62NjZQ4InvP4mjQ0He
         HOgiNaTjn22KmXCJRGe0iAwViUpenhWnCrfGve/vhqtp/iRsRb+eYvcvpa3qk5yq6fwX
         rGektx+zZXlPRsAj/DrnO8j8xVvx5xvS0LLbyzrCePVtnRifY3bf4GmIZy9h2R4Q2xFw
         r9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453653; x=1778058453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Lj5tmUBXJFmzYH2N7Dd27gLNCll+S51FdGFIIdlW1Y=;
        b=aaZbkvMgRfB8O+Llc1VCK86svvOwsuhHMDQsv5EO2oXDxK8NCgoz1rkJU0HhOErN9e
         Cy22CmlTY91JUzBe45g9z5jBq8zIOtzsmXyg+OTTsqJnuuK3WhV+d8h5sbPfxAPSjP9l
         oE7By2zuwYN+kACKBEXYy2rR7C3UEcFYeywV4SqOoV4Tlg9HMByQn7RrSig5XQeabOX7
         l+A1FzX+CVm1LY3h9pZhw36xLDrVP4gT2qCsXwYfOJG+IrjoNo6/w8sIb4edunYA+Sq4
         fkcl+X2OrIQ1HnefB2uK0Q/QdWWtdN9gSGw4EW4i4HcjOz+wwytfzVKZ58ruxkgtK/hP
         x5Kg==
X-Forwarded-Encrypted: i=1; AFNElJ8LwnS3q9xpou61+/UePpqamUd2/clyAL9gomiO8S1acL7qU2iSjwgjp6QK728f60sxR3b6Bz7kH1mvckv2si6h@lists.infradead.org
X-Gm-Message-State: AOJu0YztK7G/jdyFZ+vjHB5pkh/63ZMXgNcG6zmXpbQjBV6fotYomJsX
	Irgd42qGMI0VrQOT2DFPtCHr471FED7iRrAW5/pn+b9JkTiWiodP6UAGCl3Jcnbr2zE=
X-Gm-Gg: AeBDietInrev0xix0K3bZtynx/4r9V7p0ondBpeyt4nsGBOwYP7w5RG0aKmypb5KEk6
	lgZR81NXJoaXMwbjAqnZqWfG6SrhIZcqiwYdDN9SGStexVFxos56AG+4edqbJs+EVB7br5EeRiH
	NFO9rT/L3t2wS3p22K9Djc2jnXTR3yoor5b4+JMB75Sn5isYk8RUO+pK7K78ROUc35iwa2KRRPv
	Mnjl2vM3NDyLpE0UnvJh7kYu49vlv2QAAkbRmXAJiIHJjWqciLfk8sMzQ3USfrvMI+oU6lavXGr
	h0WIDgzWJnPFg0P0U0dhZJ/yF0HY4kSavBsVFNBfr6xkD3Xfje7g8qy9Vzz4Dcu6Y94SRXAQpPE
	CvzWNZTC37f496nXMrgj6ClZOdoRJWi2KGjaKibbBh6TKk7wUWBM8YTEXs1ksP8LetfxtPPfDpT
	6Oh+5ztJXT81MHWp2mCDNPY19wis196KfmICjV38Xplt4=
X-Received: by 2002:a05:600c:2e55:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48a7b55131amr28563845e9.0.1777453652729;
        Wed, 29 Apr 2026 02:07:32 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c5d1a53sm40803645e9.14.2026.04.29.02.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:07:32 -0700 (PDT)
Message-ID: <6dcb5348-e973-494d-adf1-7fa2dc5655f2@linaro.org>
Date: Wed, 29 Apr 2026 12:07:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
 <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
 <DI52JP9JH6AH.3I5OKWOZ56MIU@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DI52JP9JH6AH.3I5OKWOZ56MIU@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_020734_889454_314B188A 
X-CRM114-Status: GOOD (  16.03  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 4/28/26 11:26 PM, Alexey Klimov wrote:
> On Wed Apr 8, 2026 at 2:08 PM BST, Alexey Klimov wrote:
> 
> [...]
> 
>> On Thu Apr 2, 2026 at 9:42 AM BST, Tudor Ambarus wrote:
>>>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>>>  		return -EINVAL;
>>>>  	}
>>>>  
>>>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>>>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>>>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>>>
>>> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask instead of
>>> a shift.
>>>
>>> I would rename irq_doorbell_offset to intgr. It aligns with the register name
>>> from the datasheet. You won't need to prepend _offset to the name, we already
>>> see it's an offset when doing the writel().
>>
>> Sure. Thanks. Let's use FIELD_PREP.
> 
> +       /* Ring the doorbell */
> +       writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
> +              exynos_mbox->regs + exynos_mbox->data->intgr);
> 
> FIELD_PREP() wants a mask as a compile-time constant. Unless you want me to

Indeed, I forgot, sorry.

> add switch/case for different SoCs or I misunderstood something I don't see
> how this is gonna fly.

other option is to have a .ring_doorbell callback defined in the SoC data,
and then you can use FIELD_PREP. But it increases boilerplate code just to
ring a doorbell. I wouldn't go via switch/case. I think we'll have to live
with the mask and shift.

Cheers,
ta


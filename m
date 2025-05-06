Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FF3C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7q2D+DX8gUEt0LGQO16zlU47C6emYh/iTsjzICyS8DQ=; b=xM7EecIFqZB+1NpaFc580WI1kD
	6/b18MIUjaIM6o2wsgeb8L5QskQU9IePxj8DdhWrsdfLQO6kV2Gj8NYcgT5J/SJTyFWm7NAVcsKBf
	G0yKLi/u8QUZvBqd4j0qBlrFBqM+7rCtgqd7hoqC0r10V6as43HQDvtUZ0x8MiypwEjjUTzLT/VFV
	XKf08ZY4Tq3Lf/WJgw9Uk2TxC7of8Tp3NkqmC7dZesYPdMZLi/5QoO2IuH1CfpFRAjQNyHnK0+udI
	i5Wb+6J7CgXk+7kTGx00Q1NRsk/lS37lxix4VtimWUzqPdhG7dS1EcoAxQrk/3zb/8iyPQ4EPKFPl
	IhHRhVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaU-0000000DuTb-0JMu;
	Wed, 07 May 2025 02:32:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNZX-0000000DBSL-18xx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 19:03:20 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso8456751a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 12:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746558197; x=1747162997; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7q2D+DX8gUEt0LGQO16zlU47C6emYh/iTsjzICyS8DQ=;
        b=CcH+fYGC1xTaH39HxVxoIA2ba3tCykWAe56OYQY2//8hLLsmS+Z5iNzrNyaD1WgFlL
         8sEhKOTkekPyX7Iuw8QNJCGNQVWfOZj0hgC3bVK7S7Qf1Uy7zlKaxrwz4hMDG6EyZdxl
         MbngQAlXgC7FlbQ0ThCy2TOLPWJNspWUxLUp2EbRWd77dveYwrnPPSKkaPky9c0cHZYK
         1+Ls9zOBi3drXGdP1tE39+XPfqHNvIWtgDc3Hjn0fA1quPX9zCxKZdYBZGzmPiNCBS1T
         ITsR1a2h9cm72xFiYKNRvTuYPAbiVs09TNOn67osM4oQOCWfXT82xGtHKO7NdnQNBnZP
         UvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746558197; x=1747162997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7q2D+DX8gUEt0LGQO16zlU47C6emYh/iTsjzICyS8DQ=;
        b=lNucQXkmAAEgBoGbmRSLmOoVf5aMsh84/imC2EIn/T1E4i9Ga/tI8dY99t+SJBn3tK
         q5XaO89C8HDlivFSDbmk8ubv003O0ICcqQ7e0+dMGtPe6oVF13kJiE/8IAPfA2FAK3DM
         Jrq6f7kAeDVb/3dEGLrwTOX1jktAn7POiMeVZnp31m/itVI1gwmQqI/NBvXV7hyXFEsq
         icunMXF2Ymc/NqCi0/9XMI+WkgkvuYDnEnOrEeUmP7zE3UcHM6KaKAJtKTefW9IdRHxF
         6ZLFyB1VUxJ49Zqgn41Nu4soenaq2BDvvfLDJwzlrb3lB7NMBDzfX8P5iubA93BaaHv8
         fdhA==
X-Forwarded-Encrypted: i=1; AJvYcCV9iO7CF/cNqLxnOja5NC8DytZDuHOKv4GWURP800Yw0tbKIibeo3OK6mImQ4LOVFQJZTIndl1sm/WrEM7P7JZt@lists.infradead.org
X-Gm-Message-State: AOJu0YxybgD/JtRHBCI9IDo08jI/UN2oFn3hr0Qw3PrrFJ0Cj2Jjei3d
	lE/COLneEFwejXP/gneDo94ggz9N3OLFeSo9pjISRBni4SklK2GH
X-Gm-Gg: ASbGncvFeSS6rF8eWloh4MXlFSOYxlJCNyk86GfBgZGVIz16eEbmHrRaaqXfmZW2FWG
	KvkRGj8oZFCTkpzDG9AaFHeRFD9iE/UUKzT/lpNc2p+c0PXNsJ+aIcfQoMYKU+TmNPKRIl80+t/
	Cv39eL5O/wrxGo4AbP9xvTHB9pqHx7r4jFcn7Q9IcAMBvQx6b2h4IsVq/H7gCjPn36G+cJuPJTT
	Eik47VN2jTqXNhTyLK41XBbxvn7ogrMluKTCaj5gbPhM+ESH6emgvSGuKjN9K8QkppxrJE5ZsRd
	G8rjWHW3PS3qfKKT17A2eJC/Kg77WXE3gy+APaotrn3A7pBaT/5xGgpXRrfzJRhjkaw0OsnYvR5
	QG7PGG9xpn8CGTgA=
X-Google-Smtp-Source: AGHT+IGAIk6XhkOv4qY9hEVwQZjfW5uzWwoDsjl7pOXvlYuWalU+g9Aa0ZsyZk2gb/vxryl7lxtCng==
X-Received: by 2002:a17:907:a70a:b0:aca:cc55:fd35 with SMTP id a640c23a62f3a-ad1e8d2cbf8mr54940966b.56.1746558196869;
        Tue, 06 May 2025 12:03:16 -0700 (PDT)
Received: from [192.168.50.244] (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895090f6sm753734566b.136.2025.05.06.12.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 12:03:16 -0700 (PDT)
Message-ID: <7eeaa7b4-b76d-4658-ac78-705a5f8e54df@gmail.com>
Date: Tue, 6 May 2025 21:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/9] mfd: bcm590xx: Add PMU ID/revision parsing
 function
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
 <aBo0qzqHOkfFxaXs@standask-GA-A55M-S2HP>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <aBo0qzqHOkfFxaXs@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_120319_322619_5837F123 
X-CRM114-Status: GOOD (  18.72  )
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

On 5/6/25 18:11, Stanislav Jakubek wrote:
> Hi Artur,
> one note below.
> 
> On Wed, Apr 30, 2025 at 09:07:09AM +0200, Artur Weber wrote:
>> The BCM590xx PMUs have two I2C registers for reading the PMU ID
>> and revision. The revision is useful for subdevice drivers, since
>> different revisions may have slight differences in behavior (for
>> example - BCM59054 has different regulator configurations for
>> revision A0 and A1).
>>
>> Check the PMU ID register and make sure it matches the DT compatible.
>> Fetch the digital and analog revision from the PMUREV register
>> so that it can be used in subdevice drivers.
>>
>> Also add some known revision values to bcm590xx.h, for convenience
>> when writing subdevice drivers.
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>> ---
> 
> [snip]
> 
>> diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
>> index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
>> --- a/include/linux/mfd/bcm590xx.h
>> +++ b/include/linux/mfd/bcm590xx.h
>> @@ -17,6 +17,16 @@
>>   #define BCM590XX_PMUID_BCM59054		0x54
>>   #define BCM590XX_PMUID_BCM59056		0x56
>>   
>> +/* Known chip revision IDs */
>> +#define BCM59054_REV_DIGITAL_A1		1
> 
> 1 seems to be the digital revision ID for A0 (couldn't find the analog
> revision ID), see [1].
> 
> Other values seems to match downstream (as far as I can tell anyway).
> 
> [1] https://github.com/Samsung-KYLEPROXX/android_kernel_samsung_kyleproxx/blob/cm-13.0/include/linux/mfd/bcmpmu59xxx.h#L82
 From my testing on a device with the BCM59054A1 (BCM23550-based Samsung 
Galaxy Grand Neo), the digital value is also 1 on this model:

   bcm590xx 0-0008: PMU ID 0x54 (BCM59054), revision: dig 1 ana 2

(This constant is not actually used anywhere in code yet - I just
included it for the sake of completeness, since the BCM59056 headers
in downstream listed both values...)

Best regards
Artur


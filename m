Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6583D35669
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 04:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VklwEd5dwuBjikrAPpEFP/UQPzhOaAWoIKJ/0tvPqOU=; b=qyujYwUwAIcXw9Iqypjgy63xu7
	IRKS3BVvvt2RUZbmp1q94s5XEO6tL4eugCwA7xciTafeKCGtKo2WbVrjMf2CUUKXYJH/Cj4+kXiiL
	Xlj5pNuHKBANTujnmiGubL0wS7q53LNp/ghJ8uuTNpu8eZWcRkLuCI5t1lQPrCeIr3SVseWX+wgPp
	CNzimT2rY5WcomSZ3GEZ4JjmcPaX+EG1GeS+UI1a/SPwp3imGCjOxusbnJ25aacf5bJtJtvoklyxY
	UeJBGZ4F5XSlQmTIkEburmwJJ0VIA8Qnotwu48Rg0KjWZgT7IbPnHV/NerjrSnq9T04wXMwUuqD60
	XwoN2GLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkwyg-0000000FPQj-3RVI;
	Wed, 28 Jan 2026 04:16:26 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkwyd-0000000FPQM-1PzD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 04:16:24 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-45efe81556fso717235b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 20:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769573782; x=1770178582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VklwEd5dwuBjikrAPpEFP/UQPzhOaAWoIKJ/0tvPqOU=;
        b=EhA0HZSFzHQmaRlV3U3Z44C+NyhSczE4x1eMoGmbs94v7PWfQVJ6Hb9JkOj8DL+9aY
         Fx2394L/s0gIzP0i8p76bI2gkdndUiT3wTu3L2GI5ZYCIuHDjgfJDKzWWhy75vRACn9h
         VTDyMEAoDcYkwDuJJ9fPNZZOkB6aKYdq7qpxmMNjDWviS6Bi6VZ2mIVGibTtgKOEtrl0
         lYfDQyH+UVrjfKV/F968aesjVuHM5KD8qBewN0yeY3Of1TNd5DuOW0CU2YBt63dkTipo
         CVRTpE8CuX90XekPIn4tDCxlZKB2gcTipKrAjTKUPhGSHEtf9827/9NP79H3tkiPpI0j
         4N5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769573782; x=1770178582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VklwEd5dwuBjikrAPpEFP/UQPzhOaAWoIKJ/0tvPqOU=;
        b=oE3r7VEA/Ca6E59mpnOCtU5own95CYu6DucUxxBUVGTAqTYQ+0W9384mQaa9DEuJpW
         IGsK+X8ufJf4MRan8BCI6AeioqM/069BmAe8/JrVSyaFebaXTs23a/0O5ogXpliW6l14
         NypwmDPE6/yx9R4JjETTci9PgBmCr7T/TASe7zFdnCaBXpiwTf1AnnxzdpyJ1eb8u5Xh
         Qv/rw/MKqX0yBa6UknBB8AWyaxaYIL6/O4fSGhmLt/zP9imjCu4yu1KH//aQ2wC8MVok
         zS6K3BwBnhcer5RoNmcsQW0G4X+p/1AAL6d7er2917CRZHQiHy3nzWCvkOoU15zlcN5m
         1xfg==
X-Forwarded-Encrypted: i=1; AJvYcCUOSck1tEC/R9fpFb6iQonsbqyu8kl+kms70miN7jBmuSdbrZnnCzZ+kJrnTwkrU0OwCo9B+C4CvV1lOOn6SzQ9@lists.infradead.org
X-Gm-Message-State: AOJu0YzNRjSGIJENMr1INyclUfasoqSJzODhoBEbs6ZsszFcqk7+4dio
	glRl0nFMPN1DgDPRqucnTgw7bYwXuTtU+cG25nrnYQtjaBz6YmyUbq+V6p1pkw==
X-Gm-Gg: AZuq6aLyGmvMQkv+S8zs/2YPK90jC6rPVFnCn/NRgrZlGeqsDNSuQ4Tk84VHiLir1WQ
	dpWNyOrU9Ucq0qSQOwfoTsyYJwWmL93ECp6Ohs5pXyhZHZbBgEcwKYiklNA9vBo2AMXHfclZWeg
	ymVBp+QnoN45SUPW3eS0XjZrhaBFv4o9Aiztq0N1mP4MjTKBeVDsonnzKONerXZfZgyWoACuu9F
	3pozk2Kzo+3N/v5yfVUqMhvSJ7mTM/j3KVo4qlCRz5lQYp0xU29JBbtf3Dr/UgQ8tIyfVWwNvW/
	nPrZEYJeX8HP1Wb/8ajDZbD/t4bDhBCnnoYwzhfSqIrCgwqo79eOdIePX4S2YWSXFXMUTBcIle+
	jYCBkZdye5ey2wN5LiWBXw9makbpjP7ZZupTnigq5ht//XZqUab9eVr5DC+pNQFFamm6++uFal3
	CPKHIN5DsSByZYkAlbsCI8uT0lSBRHtM0wEyk9nCF08iulXA==
X-Received: by 2002:a05:7022:1099:b0:123:3488:89a3 with SMTP id a92af1059eb24-124a00bd734mr1918278c88.24.1769567650952;
        Tue, 27 Jan 2026 18:34:10 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1addafesm780825eec.25.2026.01.27.18.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 18:34:10 -0800 (PST)
Message-ID: <973f2b4b-bf8d-4a77-a27a-47495bc21ff8@gmail.com>
Date: Tue, 27 Jan 2026 18:38:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
To: Min Lin <linmin@eswincomputing.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
 devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 weishangjuan@eswincomputing.com
References: <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
 <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
 <73ea5619.2b71.19bf847c80d.Coremail.linmin@eswincomputing.com>
 <aXeydXuWEMDz-yVM@shell.armlinux.org.uk>
 <32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <32a1f814.2c79.19bfe173225.Coremail.linmin@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_201623_444761_AE99A30A 
X-CRM114-Status: GOOD (  20.83  )
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

Hi Min, Russell, Krzysztof,

On 1/26/26 22:14, Min Lin wrote:
> Hi Russell,
> 
> 
>> -----Original Messages-----
>> From: "Russell King (Oracle)" <linux@armlinux.org.uk>
>> Send time:Tuesday, 27/01/2026 02:29:09
>> To: "Min Lin" <linmin@eswincomputing.com>
>> Cc: "Bo Gan" <ganboing@gmail.com>, "Andrew Lunn" <andrew@lunn.ch>, "Krzysztof Kozlowski" <krzk@kernel.org>, 李志 <lizhi2@eswincomputing.com>, devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
>> Subject: Re: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling control
>>
>> On Mon, Jan 26, 2026 at 11:10:12AM +0800, Min Lin wrote:
>>> Due to chip backend reasons, there is already a ~4-5ns skew between the RX
>>> clock and data of the eth1 MAC controller inside the silicon.
>>
>> Let's analyse this.
>>
>> 	TXC / RXC	TXC / RXC
>> Speed	Clock rate	Clock period
>> 1G	125MHz		8ns
>> 100M	25MHz		40ns
>> 10M	2.5MHz		400ns
>>
>> The required skew for TXC and RXC at the receiver is specified to be
>> between 1 and 2.6ns irrespective of the speed. The edge of the clock
>> is also important: the rising edge indicates the lower 4 bits, and
>> the falling edge indicates the upper 4 bits.
>>
>> At 1G speed, with a "4 to 5ns" skew in the chip. If this is accurate,
>> then inverting the clock and adding 1ns of additional skew by some
>> means (PCB trace, or at the MAC or PHY) will give the required clock
>> at the receiver.
>>
> 
> Yes, that's exactly the case.
> 
>> The timing table in the RGMII standard (3.3) allows for Tcyc (the
>> clock rate) to be scaled, but there is no allowance for scaling
>> TskewR (the required 1 to 2.6ns skew.) This skew parameter is
>> fixed.
>>
>> So, at the other speeds, you are completely unable to meet the timing
>> specification, whether irrespective of the clock inversion. In effect,
>> the only speed that you can meet the specification is 1G.
>>
> 
> The timing table in the RGMII standard(3.3) says the max value of Tskew
> for 10/100 is unspecified.
> Quotation:"note1: ...,For 10/100 the Max value is unspecified."
> 
> I think for 10/100, the "4 to 5ns" skew in the chip doesn't break the
> standard. At 10/100 speeds, it meets the timing specification without
> having to to add clock inversion.
> In practice, it works at 10/100 speeds in the rgmii-id phy mode.
> 
>> Thus, I think this is something that needs a lot more than just "do
>> we need to invert the clock". You also need to prevent 10M and 100M
>> being supported IMHO.
>>
> 
> Regards,
> Lin Min

I had an offline discussion with Yao Zi and others regarding this. We feel
like the proper way for ESWIN to deal with this broken eth1 is to have a
different compatible string just for eth1, where it can be associated with
platform data with quirks to do eswin,rx-clk-invert at 1G. The property is
therefore not required to be exposed in DT. (Pretend it conforms to spec
for 1G). Need confirmation for 10M/100M, though. I double checked Lin Min's
claim, and indeed the spec says "For 10/100 the Max value is unspecified":
https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/imx-processors/20655/1/RGMIIv2_0_final_hp.pdf

Thoughts?

Bo


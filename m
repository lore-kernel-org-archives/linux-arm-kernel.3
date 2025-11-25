Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63962D0EE18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 20:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfK2UtCRp3qKogO3H5nzh+puMsdKQP2QnVSL7A2UN44=; b=H4jJOO1up0AEIfc8xeVcLhn8pJ
	0X6NMcZPdm3eLi7O+Z4S7cl8tI+6ype0sjCOPaNmBKxcOynb0N7HC3jt0vfl50QBm9spO+PN+W38h
	oqMPZ1tsdHAmnx2QBM24WKVxYHSKNPkVBYmvZczUmGBrq+1vDKGiKko4odsV0u+mDFqPb0y7KBYrh
	BqX+yDY1jpAGmqG1Ak6lGgafJDzipcfM2oFHpo2ErF5JuuMbwXFcfckDuNobqrFg6pJjgZMnUkpvR
	FjF/fBXpLVY+dDdSRPqcMtNTjNiF2y8lbakInLMqPy68mdjl0ldhCMQeHcwtG65812xHH6flRf9++
	cmT/Wx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzPv-0000000Dt6D-1iqw;
	Tue, 25 Nov 2025 20:13:39 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzPs-0000000Dt5m-3zJa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 20:13:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29853ec5b8cso72463965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764101615; x=1764706415; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RfK2UtCRp3qKogO3H5nzh+puMsdKQP2QnVSL7A2UN44=;
        b=W93O6AR1KE9qqQMpvHCyAEoRKSH7GPp1WdmNzdbT1TcISIceNVfomCEn6tyfMKHhaM
         N9/F9LOSUK8T7ZtZVVjBA1/MgBSdxBKbBVehYrv+qe/JL0vA4gqMrWPQ+psupPVNCbKA
         B6UV5/XXQU/5BxJiL+AvF2N7AgBsoEQneGJzusbGW8MEOynn4/1Aej0PeqqD4kuQIL1b
         C2LQ8Q3+y/19ZWRgtmDjOQsTboJNoZQQcmJGsvGkRdBJyq/JV3r0ZIhV/1Zm/ph3ERQw
         bH9JfwS1tWIvXHUpjP4f9uufSJwL7tFo5ermYKPn3/iYx+CEMoa1xDvZs5995eEdwdET
         uMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764101615; x=1764706415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfK2UtCRp3qKogO3H5nzh+puMsdKQP2QnVSL7A2UN44=;
        b=n0Q2OKxXibyETuOn0ob9/zTVyp14MzxPJI9GYsHWWkTJBWJnli1YKnMGk+9BjJdS4s
         cpGJ/jz5o8gfobtOrXwVN2Ed5MPPWT7OozpApcHiHbHeE75bZxKbJMzcej5lauV6Uucm
         m9SEoRHcDCorVjY5Lhcmy64Q5rDnDL5n9RoA6yP3uzYV0Joh0Uqva27qSnvmFRGPYlK1
         sQ/yvaK2RB181zJWqpwAGjgkl08CiPphUfF6fT426KHmgOqUEPAIVwBYG8jVkqXlKeST
         RE7iQMwfxngfo4wEdK3e2yEcg3SsP543HUb5Qm/5RVA4CNOjj1Sdcm12NsBHf0IILrEU
         t9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWyn8OLwJhaqS4oApNMZibN4DEy5DeRL1Poz2dRWFPB59HtfC7xk2sLAoVhBKFPT9uFjL61OQ7NvQNX8/89VjD@lists.infradead.org
X-Gm-Message-State: AOJu0YwYiceR0QmErBgBAE92MCabyRTJUG53sK6oh9G44gZVH3Lh0G1y
	7C68nn690blNn3GO3bUT4dxQpwt4FKdqQo9J5OuvtEwiPnrEd6U3894JhEBC/hhXtg==
X-Gm-Gg: ASbGncurF+4nVel12SroEsqzXqpWOsoNNiJ6ir+hzCwF4WI9I8o45pomPoDHOT6nr+5
	RhFmzbhzjoNqaVoXechl620XZFjzgZ7pYuqx5K5tLU5zAAQtgxGkzQYRYRd1JWaFrGyotL0KCZi
	xlF8JhXbps535vq1AEekAtV8bsfqbCmuD8KaBk6oa7oouFkFg4ktkrAsh87NsNOVpSKBANGVJTd
	p33mFyHbP6m0myKZYp5U8S/pdawyMhswNtr780IRI0t3BETWlwYje8wdEQ5Sbkjk6H8I5ASNRF7
	z5U/4FmayG/UFEPI/Ru4jb8F5NT7Y2WsVeFPK2BGvBPrAjjhNDDRLgS2tyBzuT5XDA7rjKP4rZJ
	dR1/GlxJehFuqnuhrkT/imtComtU/PJorcUshtjef5lAUi7NK/pfp92ybprA3js7hAbTZ0Zghuh
	CX7A4a3244Dzu+rPJgZT9oHiPLMyi218HVHS3zjpq9mk15yClQqAvh9H6x6C3erGjVEv6SN1pQ1
	9QgJ4KxF8W17g==
X-Google-Smtp-Source: AGHT+IG9kG01ZIUmMJzmeQwMlH61r7mcmKmX15F17Yg0ycZqophUcVw0eG5SWVAXcyDMCqwBRpETuA==
X-Received: by 2002:a17:902:e545:b0:295:8c80:fb94 with SMTP id d9443c01a7336-29b6c6f1516mr170593005ad.59.1764101615123;
        Tue, 25 Nov 2025 12:13:35 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:744c:4262:57e5:31a7? ([2a00:79e0:2e7c:8:744c:4262:57e5:31a7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075c6sm175965955ad.17.2025.11.25.12.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 12:13:34 -0800 (PST)
Message-ID: <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
Date: Tue, 25 Nov 2025 12:13:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply property
 for VBUS in OTG mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
 Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-0-6b2e4b8f7f54@google.com>
 <20251123-max77759-charger-v1-3-6b2e4b8f7f54@google.com>
 <20251124-rook-of-exotic-innovation-fedcc5@kuoka>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20251124-rook-of-exotic-innovation-fedcc5@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_121337_014619_FCB2B3FB 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Krzysztof,

On 11/23/25 11:53 PM, Krzysztof Kozlowski wrote:
> On Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne wrote:
>> Add a regulator supply property for VBUS when usb is in OTG mode.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>> ---
>>   Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> index 3de4dc40b791..a529f18c4918 100644
>> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> @@ -32,6 +32,9 @@ properties:
>>       description:
>>         Properties for usb c connector.
>>   
>> +  otg-vbus-supply:
> How is the pin or supply called in the datasheet?

The pin that supplies the VBUS power in OTG is referred to as Vchgin in 
the datasheet.

>
> Best regards,
> Krzysztof
>


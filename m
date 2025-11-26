Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C207D11196
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5r3za4Hd/VcLzmDqeRuo9GjhPbaMT68/WQ/4wPSlvg=; b=K051V+eW6OLVaFMmzr03F8ZZUM
	xIOqmQjmGLyB07QCwPyGyuOLXmbaVU1d9zu/O+demulktrg8ordg2mv4V2LpT0gxjKwfegptsAVzC
	rpP0rC81LKclRyf3xZwJu9IDXZt74dr6NYeXBwCVihtTqQIGqz9x+bpIFEEIO4VQzEBlJmPWv0VRV
	aKhHIawTOXb1SSrjV9j+qa2uMGAkm1nZ8HRKfGTW4cF2Zsgte3NCBCXWBYczzL9BxakaRm+qYqWKN
	w2YXQDtYu9qb15OzvWcXFcj/9X+RvR2FbDeiyQpHXkFAoFBk3n6H8+McJ3sqMEMGyGD/oBSD3rJt7
	7rlB0vpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOM6k-0000000FcF7-1AIZ;
	Wed, 26 Nov 2025 20:27:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOM6h-0000000FcEg-250L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 20:27:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-298144fb9bcso1905265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 12:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764188838; x=1764793638; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5r3za4Hd/VcLzmDqeRuo9GjhPbaMT68/WQ/4wPSlvg=;
        b=vWelMAPQi4GF9leM4RhtJQbHaeM6rqPVb0Rc7F9/3J2b/jVr04GR18DTI7eGrvMAXI
         ENMtn+km4qhDcTYLBlR9LxkUmiPpQMmwQtRbZRKbI7zTRFtAMSRV8byAlnpgNbR9wz+s
         9VEWZ68cr2jxRqPpdq0aecDc+2fw1i//4ZUZa0QY0AiFQh+IXKlYRuwSsAxfzJImdSs3
         c1QKLdJZgljCfvZ4WjMKV2GzLM6RWJprw+7i7y8ZjsyblIJaRRL5luedQUBKekWnpStX
         +c7ORtDSGA7ia1wFyo03HeOWcC7bG/1vX4ATyzQWOe8/G3pY3CXsF5m6IqiDuQazgyxt
         kwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764188838; x=1764793638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5r3za4Hd/VcLzmDqeRuo9GjhPbaMT68/WQ/4wPSlvg=;
        b=wSTnbqV86CwkP/hmu66ScANP2prLsaAYqAWEQJJ1JTz2PDFedQ5bSzNIXle7T4TWHl
         4ix+2hAPsqvXFUtC60NZq5nZlohDuowWk+LMBCtKK96XYW/NAg9A4JgJUk+xcLIjBAE2
         8+S3y2XbfjmOyQjpfQGHpyHrRX9fD57T0P7oUHuUJhFGvGeBMkVUaXVZKthyM3ovp0hh
         Q9RCAm1gCmn+EjpJqJEDWzvBDBYug07Eh2lSaFZeSGSHG29YOLOeMZa3psRfjDAT7o+7
         079FjCUi8rwV+1wq/m9D4A+1hWl4D12zDL46KbwbIgkrpqkjguho8aFp10OhUngv0fyv
         tPWA==
X-Forwarded-Encrypted: i=1; AJvYcCUG813dbIcygHybXfeVzggqnJH6pCGxpvgSNK70qoGS4ur/hzDInnwNw4Q5ZTdaiJAzaKPnf0Bjvy/S5zo6F6ID@lists.infradead.org
X-Gm-Message-State: AOJu0YxReD7eLBLs02EKqO/LexjnFW5CwQW51bjbnfwTGNzShBUXbwIv
	eQXBAvttd0Axyfi+KQg/0bguNzvwDwpjh64Q6isjWq3SIniIzmC2DxAqK2K+uApSyw==
X-Gm-Gg: ASbGncsIb+eIs90Js26qc5t7rJwClEALmR8s90SQQqff58ZaLoMmWAumiTKNfh15Z5K
	i0BxzPiUJg67nkKjh97EE7Mrtvs+qZ7/QGjgMfBecZHy++H0RnEJI6gxe+5ay4HA+0oYAbjGXOJ
	1hL97JDKG8R+gI03g8v+V1gxArZM66IdVe39p9OtFydr3L2NqDyDKG313ODeynLTyI3E9K8jtLi
	Cgs/RJwYDSRD4VjX/CA7PRA411HCOqJPHbcomiWA1tXfBkHVP+z2cw+4UrE0seQIjUGhdkS1r6A
	T/L7kCeOK8x7Z9PLW0AW+0+AJkFSSFoo1Nglx8/hqBp60l5lFSA2OyaLR6vYAdkwiyqTIqNS/6K
	IME69qASrUcom/5igIbxPX9whGVmJd3rOO1vwcAfSPNTaRlCn8Gf1fOOYq8Utn6Xsm/D+6NVVsw
	snIqTpdn4PEx4QQ5lBQ7p2H0/QpLXEVk99uCXjahabhDJmZL6LdJ3dvnEghbJo5VfKWHk5uUk+8
	SbDz7A5vg3bCg==
X-Google-Smtp-Source: AGHT+IGs7j+rISQURjI4KHJiRtxo72A6EAIFd8qUy73nZRmTVJ6HUMi3Fk8FYXZXKGlB3rSWFkwohg==
X-Received: by 2002:a17:902:d58c:b0:294:fcae:826 with SMTP id d9443c01a7336-29bab2fa50bmr92368305ad.59.1764188837611;
        Wed, 26 Nov 2025 12:27:17 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b274752sm205771575ad.75.2025.11.26.12.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:27:17 -0800 (PST)
Message-ID: <1be015d7-201b-4e3a-a71a-130162205e5e@google.com>
Date: Wed, 26 Nov 2025 12:27:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: usb: maxim,max33359: Add supply property
 for VBUS in OTG mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
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
 <adc2d6ec-e666-4dd0-aaad-7ef014efafb6@google.com>
 <8d8201de13b4694b26812722356a3a55637406c4.camel@linaro.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <8d8201de13b4694b26812722356a3a55637406c4.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_122719_559058_DACE1881 
X-CRM114-Status: GOOD (  14.56  )
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


On 11/26/25 8:18 AM, André Draszik wrote:
> On Tue, 2025-11-25 at 12:13 -0800, Amit Sunil Dhamne wrote:
>> Hi Krzysztof,
>>
>> On 11/23/25 11:53 PM, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 23, 2025 at 08:35:50AM +0000, Amit Sunil Dhamne wrote:
>>>> Add a regulator supply property for VBUS when usb is in OTG mode.
>>>>
>>>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>>>> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> index 3de4dc40b791..a529f18c4918 100644
>>>> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>>>> @@ -32,6 +32,9 @@ properties:
>>>>        description:
>>>>          Properties for usb c connector.
>>>>    
>>>> +  otg-vbus-supply:
>>> How is the pin or supply called in the datasheet?
>> The pin that supplies the VBUS power in OTG is referred to as Vchgin in
> I think that should be chgin (without V prefix)

Right, it's just CHGIN. These CHGIN pins source the USB VBUS power in 
OTG mode.

>
>> the datasheet.
> Cheers,
> Andre'


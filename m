Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19E9CF6A88
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5S8zQ9e2sGnfnBt19hJ4W6t0YOug0PEiUPvQAC/cPY=; b=BZ+PWONLn0h7rvca3xWin0XQMy
	WJ7EuES1npFdLdhvztqerorujw/RmN5H5XxSZyeUTKwURKtykcp9ow7P1w2Oo82469DuIIwfV6Bb/
	VVFOB5awT8PHj7N6FP41A71uH3CUmHSn6bVuJBUA75sWPZedJdO9Rb5ICqUoCtVQT5eUiHGz3dKgk
	5Ul0m3vQZIL1RvweSwJpYfd2U0OMhXYsJOVN3NRqEc+kWqqqHGtls/Zzh6GV/FtUKOzsOGfvydwWa
	opjs9iBq6c5x+yIMmtz/EFl5dox0IG/RrEsCErD2GPt31O12nsCyiexhXq3B/u7KmOMfyJ0kA+YXL
	NM96rlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdm8x-0000000GPnb-3cdF;
	Thu, 08 Jan 2026 09:17:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdm8v-0000000GPmM-0gHS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 09:17:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4775ae77516so32577815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 01:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767863839; x=1768468639; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R5S8zQ9e2sGnfnBt19hJ4W6t0YOug0PEiUPvQAC/cPY=;
        b=EXmNKDPG95MP0FwpZMoyq4u0+m6BIR6Zh1+ot87f4kTyPGJxc1UAWTgydTgSxbdon1
         L5VWl/fsgekt8wpzHR/TFg0qqpnDOVkNKhoKRekcXiq0spaWebutrij2Gu6uiKmCI159
         O7i+nAZ1dp4tUtS2dDOR0CDkf7ZnoXy77pX3gWnAOmJifsOCqhwZS1iR4n/Dl6j/Mvu3
         NUGvrvGlqeOVRnEXQbSAblMLEspFksaaf05eJvQzKmJ1UB9hrprpPSuZ2U2jrVBwlgw2
         wa5cTXUr2h89/s3O9z9UNZQvU88EZzTQ+s47fegyFLUdXdeI8bEA5rM2waJ7WfMQzNAb
         P6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863839; x=1768468639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5S8zQ9e2sGnfnBt19hJ4W6t0YOug0PEiUPvQAC/cPY=;
        b=FMpypUuIWBVab3PvR836FHbN0XgTxRZUfNTVtKLhLI7aur0rl/WSlArBAXlTCQU8G9
         EaRV+oAuhsz/t9on0/JBMQzYJZcqzE9wUhmLh+Rj2QAj0jY+Xxmc54COrdLQ7KsR5+9C
         Nxhem1UX3lWzPam6C1++SS6c5OQ6OKW4ZoiQjYgSQtOzpC1eqet9912FS4MqOVZOL9nd
         cOxQSpvHgBHpFgFJs1WQ0gj4fwZxgrekajzzzISfWPTAjH9nFuqKIKC1vxTYpMFCg5Ia
         QJ8ROiXZVRgp2fjVKhde5v7TGAgBnLG/+E6LTmJteyvrY+KnsjARZG2IyHTXEpnZnb/S
         19qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf8WjEchGCz9R4NDpFF1iReNlJajjUa8D8zJ9l3hfg3HBoS4j5h0hklwt2yAzyH0zRxurt1KXU5DME7+quAw9E@lists.infradead.org
X-Gm-Message-State: AOJu0YzTrxUpla+X2sdiY3Y2ce6EwNr6Y3iEKJ9gS4SZ6fs0lAKmkRSk
	IB8h8kciCszognwMH+rOXKAnwHLkKnkMoGEBc5lGOCk9Z68m0aTfxsXtrjuux9qDjF0=
X-Gm-Gg: AY/fxX4TBvfdCPQhZHqCzKFKut69knQ+ea5KpZsgDcABwV4MuhQc2Gg0Dd7X6MV8Lm1
	EIUUjMpgvoOWnYnL9NKsnm3hK4rzLSuuu0qThTrYjRoGr5sG0W0Epw089CxZWKBzOir1x6xgUTp
	NaLxQrc5jd/v9alsuJvJGKm2mcXLPiLNq+0L3IAVMS00TJnuPOBl9PWy2AFch9daPcJtnncpJo8
	vI3X5Tel8wjebV0t3KCH6kLnxhLotzzahhOTqLaHzKUptmnLvOdKVsxP9+h63XTqGDq5zTINdjy
	92NrtaFEqlmcGxmmmeYcgPXucO9aepFvF0FvM5Zq96ewrHKrn4OT1sX0kTrxUc1ZMGtJul9iJTj
	EcuVaYPtTFP1D3lORWH15yMtCia8cWneXqhda10rG0FMPr1qgtDbIp6YEoSzZ0TxYe7qaE9SH7Q
	7WHuon/X4RjonaSN2mWQ==
X-Google-Smtp-Source: AGHT+IEhTW+XL3PZlPk8egAcp2/D9p50DS7jTT6A1e+Oq9/3ughseVDLhZT1N7KDmEogh4RRmDNh7w==
X-Received: by 2002:a05:600c:c4a5:b0:477:95a0:fe95 with SMTP id 5b1f17b1804b1-47d84b347ebmr74042375e9.24.1767863838937;
        Thu, 08 Jan 2026 01:17:18 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6ef868sm140085435e9.11.2026.01.08.01.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:17:18 -0800 (PST)
Message-ID: <eccf0609-562c-426d-b72e-97673a97f069@tuxon.dev>
Date: Thu, 8 Jan 2026 11:17:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: timer: microchip,sam9x60-pit64b: convert
 to yaml
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, conor@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org
References: <20230525125602.640855-1-claudiu.beznea@microchip.com>
 <20230525125602.640855-4-claudiu.beznea@microchip.com>
 <20230525-straw-fidgeting-4c1099aa16fe@spud>
 <5edf3d3b-6f59-0af3-6414-940a278962bf@microchip.com>
 <20230526-knickers-aim-e01220e6a7cd@wendy>
 <5a5d25a2-e6b5-fd69-f615-cd3d6ed33b9f@microchip.com>
 <20230526-unsubtle-chowtime-ce329d7e5627@wendy>
 <20230608201707.GA3359628-robh@kernel.org>
 <276e53d3-46ae-46c6-ba64-f3337bb963d9@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <276e53d3-46ae-46c6-ba64-f3337bb963d9@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_011721_219712_018F980F 
X-CRM114-Status: GOOD (  19.13  )
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

Hi, Nicolas,

On 1/2/26 18:03, Nicolas Ferre wrote:
> Hi,
> 
> On 08/06/2023 at 22:17, Rob Herring wrote:
>> On Fri, May 26, 2023 at 08:55:39AM +0100, Conor Dooley wrote:
>>> On Fri, May 26, 2023 at 06:41:39AM +0000, 
>>> Claudiu.Beznea@microchip.com wrote:
>>>> On 26.05.2023 09:23, Conor Dooley wrote:
>>>>> On Fri, May 26, 2023 at 04:47:28AM +0000, 
>>>>> Claudiu.Beznea@microchip.com wrote:
>>>>>> On 25.05.2023 20:14, Conor Dooley wrote:
>>>>>>>> Convert Microchip PIT64B to YAML. Along with it clock-names 
>>>>>>>> binding has
>>>>>>>> been added as the driver needs it to get PIT64B clocks.
>>>>>>> I don't think both of these PIT things need to have different 
>>>>>>> binding
>>>>>>> files. 90% of it is the same, just the clock-names/number - so 
>>>>>>> you can
>>>>>>
>>>>>> But these are different hardware blocks with different 
>>>>>> functionalities and
>>>>>> different drivers.
>>>>>
>>>>> Having different drivers doesn't preclude having them in the same
>>>>> binding provided the function/description etc are more or less
>>>>> identical. I was confused by:
>>>>>
>>>>> +description:
>>>>> +  The 64-bit periodic interval timer provides the operating system 
>>>>> scheduler
>>>>> +  interrupt. It is designed to offer maximum accuracy and 
>>>>> efficient management,
>>>>> +  even for systems with long response times.
>>>>>
>>>>> +description:
>>>>> +  Atmel periodic interval timer provides the operating system’s 
>>>>> scheduler
>>>>> +  interrupt. It is designed to offer maximum accuracy and 
>>>>> efficient management,
>>>>> +  even for systems with long response time.
>>>>>
>>>>> Those seemed like they do the same thing to me!
>>>>
>>>> They do the same thing, they are timers... But the way they do it (from
>>>> hardware perspective) is totally different. With this would you still
>>>> prefer to have them merged?
>>>
>>> Yeah, one binding would be my preference.
>>
>> I'd probably just leave them separate if they're pretty much unrelated.
>>
>> Rob
> 
> I'd love to see this (old) thread revived and I'm ready to help.
> In particular this pit64b or WDT pending conversion to yaml which 
> generate some errors while running dtbs_check on recent Microchip 
> board .dts.
> 
> I tend to think like Claudiu and Rob here, hardware are so different 
> from so different era, that... well... I would keep them separated for 
> the sake of simplicity and future proof.
> 
> Claudiu, tell me if I need to help with this?

Unfortunately, I don't have the bandwidth to look at this in the next 
weeks. Any help would be appreciated.

Thank you,
Claudiu


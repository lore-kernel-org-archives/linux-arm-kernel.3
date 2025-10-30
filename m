Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0043CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 11:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8MLj8j7e7YQRcZlE+KIJJ5vGAzqn6SgU3Y1AxaodS0=; b=QlF0oGfrX2W+MnaZm2xF+IwKsy
	PhK5OJqOHVckOZsH8QKTZRHhcxbR2oVY/BlzH8Fsz7GmTm+B9JpyIdAOzeKRvzNKeZBSz63isMHtL
	bl/GSzK2jyxEvEMWftnqoZLfZeiXZgvDACeYeE/LzD1UZ1X6exUHzhlp1iCr65NYzOT4RE6hTBrSP
	4LNxt3/JpVafrWkUff0UHfTmTTw2E9n4ruuItyZoTNUsI6OCglAgAXqOsCC/SLAbZFw7I/ONF5DT4
	aCAGzw+Xqw8QWWSkQhh0OPt5B+yHYNaW8MmgvpgdwUVYwQwxYGAoxqn4xgr/b5Vo2VO5bA/L5NglZ
	ONzFZGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQPm-000000042Em-3l3Y;
	Thu, 30 Oct 2025 11:01:58 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEQPl-000000042EP-06g6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 11:01:58 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-592f600acb3so1271703e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761822115; x=1762426915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8MLj8j7e7YQRcZlE+KIJJ5vGAzqn6SgU3Y1AxaodS0=;
        b=XqZlGW//ErZnt60P7ukC5GfH9YB4m4Bf+VEVctp5zsamXo/0kAPAqDBgX2o9Lp98a3
         vqgFW8mkhXSx1oOUWY0L44/z7oN2vRiVuupVHCDR8IA/rbl9iClldI9F4OkVslDtD1tO
         OMypCTPSZkLLYWNBLa4NCg9/q5UC/073L8725Hp6ilDQvnCO5RKI0VkXbyGvgxBOs1iR
         EyCI7D5PlJKxgptdy+i5rJ9r6Yq+vhxDXFeES1A8hxPWTXlRR1pcTOHTfzKYpVj34D7v
         7AJpoDh2cTNEjRQSeaLENIxMk8Bo6r1X5OsordHFZ9pcS/rCUgfhLt+SdUyJ+rPR6ixC
         iJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822115; x=1762426915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8MLj8j7e7YQRcZlE+KIJJ5vGAzqn6SgU3Y1AxaodS0=;
        b=D62Sg4eeUyNkNt4Pdfnuvs/tll8tsZo4ldJ+kjApqTp/YoVmiOk6MZKVnNs3rUIwuy
         6mhjLVA+PgDMzyv9qkICaJm+YQhKJOsKvsONMk6VO1ct5n8EDmP1kKt5Ycn7ioPB70/k
         U+ALPiXus4ekFmSk9IrdiAAf/OFSEDzjtWW8hCpUyOItqKuYgWHMdm5rHNpu2Kj4HFp2
         E/sqiNF8LFFWgqRrfnP4SKheZcd+bSGO1CtK40H1ryfh1V/es0k0rNrnNiKqkXTAWg7R
         5gsw7WmyZ90rVIkQ+Aka+LCxKGjWAGIunr9DL7+pWHxi1r54CLVmnHggYLfBsRkf2XUX
         N7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUp/X4z9AYMriZoSuvjYscOh7oAgkCN4uwwY7EDg+phiuEwFjAEP+xgLRuJaMMyr9gxv6NJrk+OOJusmCJDqV3a@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4C4uoPrZAARuqwKYGie3kGIycLKfDBwYCLb5EJc0u+V4xHPf7
	LMi/cVF9K481K90awq+9RRV8fRyPwoeVnh+8FbYVeaKI5lVc+bo9sZNw
X-Gm-Gg: ASbGncvTCO2ZqhMtFLQOfZLrSEUuOUhJJ+6WX3UhF0Wq+Jwg3npp5Vj/xSBFRYTxu39
	9eLIeFjgZlpXD7iccKk5KrMHnuO4FA4cp5iaBb4GQDzUuHdBFVeSdBiwu6kvgN5YhtQSRp9P2ev
	q5mkm+nCrKzWzaQGRN+ur1yThm0/LimoS+3tv7kf5wzjCKusuu56IDlTc6JJb1Sbpti1qOkIb7E
	2+ln9g1Rw3PWpZeBLoqdvqg+2BqL4SxQ6xcDVhIY1ztbT/gPnTDP83p45IEHXDeNAA8uZ99H9EF
	gnHc/ow/NerhB7oAdU7hO3r9oWqSG+so4NfIyAFhfrM72goRJZtJrO/RXuzfeY/dm3UJ9UX8w2C
	Xt8bLrpwUG79GM1ufJkU82Ku0L4EW1RV9f36gdrDq1dMqrYOuO7HT3fiPJcTANUaOB92nplsVlz
	MK8Lc6wTsc45x4hw7toq8l9bPbZnuqRNJuNauOuSJg6Wiov3Jk552KSkFWWQ==
X-Google-Smtp-Source: AGHT+IFVbeOcG1ymZvuui/950bfgz6qYiN2j/R5NM5+LVOvsYbyPSuDJ4V+PPpYZdgVHGMjGt2TR7Q==
X-Received: by 2002:a05:6512:4007:b0:585:5cb5:590 with SMTP id 2adb3069b0e04-59412a3654amr2238284e87.11.1761822113991;
        Thu, 30 Oct 2025 04:01:53 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f68e9fsm4592248e87.71.2025.10.30.04.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:01:53 -0700 (PDT)
Message-ID: <26fc62bb-3484-4812-b576-6640eef72c49@gmail.com>
Date: Thu, 30 Oct 2025 13:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
 Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
 <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
 <a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
 <65202d1f-6c4f-4d4e-9fef-85cfb74ec768@gocontroll.com>
 <938f85b0-4c9b-463a-960a-f5f4e4092480@gocontroll.com>
 <20251029081138.2161a92a@karo-electronics.de>
 <4a47b9b5-f482-41b6-a441-7728572c5a0c@gmail.com>
 <20251029104838.44c5adcf@karo-electronics.de>
 <d05c62c9-7ed7-46e4-aa4d-27172741b5ee@gmail.com>
 <0667e026-99f3-4233-b3f6-e38273961d49@gocontroll.com>
 <20251030095434.1dc06df2@karo-electronics.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251030095434.1dc06df2@karo-electronics.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_040157_112536_FE9C1737 
X-CRM114-Status: GOOD (  29.43  )
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

On 30/10/2025 10:54, Lothar Waßmann wrote:
> Hi,
> 
> On Wed, 29 Oct 2025 16:35:25 +0100 Maud Spierings wrote:
>> Hi Matti,
>>
>> On 10/29/25 11:05, Matti Vaittinen wrote:
>>> On 29/10/2025 11:48, Lothar Waßmann wrote:
>>>> Hi,
>>>>
>>>> On Wed, 29 Oct 2025 10:42:17 +0200 Matti Vaittinen wrote:
>>>>> On 29/10/2025 09:11, Lothar Waßmann wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote:
>>>>>>> On 10/28/25 13:42, Maud Spierings wrote:
>>>>>>>> On 10/28/25 13:15, Matti Vaittinen wrote:
>>>>>> [...]
>>>>>>>>> Could/Should this be described using the:
>>>>>>>>> 'rohm,feedback-pull-up-r1-ohms' and
>>>>>>>>> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment
>>>>>>>>> correctly, that might allow the driver to be able to use correctly
>>>>>>>>> scaled voltages.
>>>>>>>>>
>>>>>>>>> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/
>>>>>>>>> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108
>>>>>>>>

// snip

>>>>>
>>>>> If real voltages aren't matching what is calculated by the driver, then
>>>>> the voltages requested by regulator consumers will cause wrong voltages
>>>>> to be applied. Debug interfaces will also show wrong voltages, and the
>>>>> safety limits set in the device-tree will not be really respected.
>>>>>
>>>>> I think this would be well worth fixing.
>>>>>   
>>>> Before doing the real-life test I did the same calculation that's done
>>>> in the driver to be sure that it will generate the correct values:
>>>> bc 1.07.1
>>>> Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017
>>>> Free Software Foundation, Inc.
>>>> This is free software with ABSOLUTELY NO WARRANTY.
>>>> For details type `warranty'.
>>>> fb_uv=0
>>>> r1=2200
>>>> r2=499
>>>> min=800000
>>>> step=10000
>>>> # default voltage without divider
>>>> min+30*step
>>>> 1100000
>>>> min=min-(fb_uv-min)*r2/r1
>>>> step=step*(r1+r2)/r1
>>>> min
>>>> 981454
>>>> step
>>>> 12268
>>>> # default voltage with divider
>>>> min+30*step
>>>> 1349494
>>>>
>>>> Probably we need to use this value rather than the nominal 135000 as
>>>> the target voltage in the DTB.
>>>
>>> Yes. When the driver calculates the voltages which match the actual
>>> voltages, then you should also use the actual voltages in the device-tree.
>>>    
>>

// snip

>>
>> Then setting 1349494 as the actual voltage makes it fully work.
>> Otherwise it complains:
>> buck6: failed to apply 1350000-1350000uV constraint: -EINVAL
>>
>> Final debug output now:
>> [    0.327807] rohm-bd718x7 0-004b: buck6: old range min 800000, step 10000
>> [    0.327813] rohm-bd718x7 0-004b: new range min 981454, step 12268
>> [    0.327819] rohm-bd718x7 0-004b: regulator 'buck6' has FB pull-up
>> configured
>>
>> I will add this fix to the next version of this patchset and include
>> your requested change in the dts.
>>
> Does it also work with min/max settings in the DTS that are taken from
> the designated value +/- 5% tolerance margin, so that the DTS contains
> reasonable values determined by the HW requirements, rather than some
> artificial number that is enforced by the SW behaviour?

I am unsure what you mean by "artificial number that is enforced by the 
SW behaviour"?

As far as I understand, the PMIC operation is altered by modifying the 
feedback-pin voltage, right? So, the HW _really_ outputs something else 
but the 'PMIC nominal voltage'? When this hardware connection to the 
feedback-pin is done, the nominal voltage is never really seen anywhere 
else but the PMIC data-sheet, right?

> E.g.:
> 	regulator-min-microvolts = <(135000 - 6750)>;
> 	regulator-min-microvolts = <(135000 + 6750)>;
> Thus, the nominal value of the voltage is explicitly shown in the DTS
> file.

I don't know why there should be two different min values? Assuming the 
latter should be max - I have no problem seeing a range of allowed 
voltages in constrains - if the hardware can tolerate voltages within 
the range.

In my opinion, the values used should however reflect the _actual_ 
output voltage, taking the effect of the feedback-pin modification into 
account. This is also what using the:
'rohm,feedback-pull-up-r1-ohms'
'rohm,feedback-pull-up-r2-ohms'
and the pull-up voltage property allows one to use.

In general, regulator consumers expect to get the _actual_ voltage the 
regulator outputs, via regulator APIs. Think for example of an ADC 
getting reference voltage from a regulator. If it asks for used voltage 
and gets 1350000uV from the regulator subsystem it will use that to 
calculate the scale. If voltage really is something else, altered by a 
feedback-pin connection, the ADC will be having offset. I don't know if 
voltages reported by the framework matter in your specific use-case - 
but it doesn't mean letting the regulator subsystem use bogus voltages 
is right.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


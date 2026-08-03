Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B598BC55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWhNVuNUeWmdXxG9AxDJ/JJjMmObR+VfZMlaxit4KDY=; b=Gl/IuK2Ndu2fmzLra+qbVSh8NC
	p2YSN0XViXK1Bfjoc71D1iraWnWldWw/AeCKn5rM2itSu46TCfAhotKnNy33NrHn+t51XmfnVlGCz
	V/T/uN8U8TWkTyywnThrZqIEqY4usRpRaQ1vWuPbsnCOkbs6XJ1QfFZlR9+m4bij81pOCpXYvp5qd
	hNnCYeR+VCuqVGupDLxsSR2GN/nsOFBTIMzNhx37O3zOjc7SH+rFIY9XEo7cfTc+Tm/jqDufKd3Vj
	QAKSVFhiU/rmgf9U7RVNu9KL9oTIZBF+7YDwCI8KYtkyZGtX90YYF7+Ra7bsIuyxJfD/JbWh+VKiD
	a67FHVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyBn-00000000Qa7-0ZQf;
	Mon, 03 Aug 2026 19:19:07 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqyBi-00000000QZn-3r3u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 19:19:05 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso4243558a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785784741; x=1786389541; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWhNVuNUeWmdXxG9AxDJ/JJjMmObR+VfZMlaxit4KDY=;
        b=Z13wK+bO9lpf/Nc9TawBNVbEDqvGBHIfm78GLaQktVaj9qqbV/rHpjCIACBSKZhxHr
         1IDUEobmA7X7TTFEMCo5hNdmtaqd3tIqJb8q3Hqn2Uj/Y3EWhmIShpDN45bn9PhUA73L
         2TvTD7vpSF80QV2aDrbqa1oLSxpL2y2sTG4OnxsC9QQpKdXPaQVs2DS07gW5l3L3bt2N
         sSMNOtqfg77P5Qspw+OVztF7AGGjXpLI2hjolKN1EwlpLIiSETXnSbH9omYl3M4ndXD+
         Vr31+khfh1QBM/Ywe0GMwoSBLJuk9DEtsZ41A+OWWgJNmWLxbLCvD/RMsvsaimd+dXO3
         vVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784741; x=1786389541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWhNVuNUeWmdXxG9AxDJ/JJjMmObR+VfZMlaxit4KDY=;
        b=DJm6MAQZNJIT6+6bprPIgWBvdvkKGu8NWLHqjNbE8e5uhi/LC55zYHx25dFObyJVv9
         QysHNMAb0IvSZ0IfK7xYxENdCTzywbZMSFkK0APXr0zTSkTmMpA1ib/ohBCFPDY3WONk
         TisTQlc0rX2h0JNWiq6sBamaMMmLMNhVEn3/IoFhRdI45tV/+/+Vsm3PuRmK31hEX6M7
         ZB4tnIE6mhaYk4evz7LNLQ9v83fqrKbUHjspVHE1ggpSHxdAjPHPBp0puCms4vOWTKMG
         uhygbHRj7TIk1wWO4XDgWw1FBD1h+InxvwQNrvqS+qotb+zyeUjzia6ZVvs/EqZGBc5k
         DqTw==
X-Forwarded-Encrypted: i=1; AHgh+Rqaboj3qsfh/cWU46VhTDiJclGQTtajvhZQFzzxVgeTENPGraFbQ48ioq8J92aFYrqhIy7GRXS0vKwHZ/zrrqxR@lists.infradead.org
X-Gm-Message-State: AOJu0YwsVPdBpa0UaJFyfXSAWTZyDwDhm1fV/6+XYiXf3GNpiYVkb22f
	ggAh9iLVK16AlXr2i4rHFe8FTmTAsAbMwUkCgNeJ9ow6d6/ZBwKGH9cBckOK0WhRMKg=
X-Gm-Gg: AR+sD10Uf9BipZ4/mC4vM8LbigmFeD/qPy7xtlPkndsSd1xUvLhFqeyWs70z41OAFOz
	SUiyjqX2DWCiJUIYQo761tzFZG/Tgek9yVBpOuiRv5B88qsKVR15XSFrDitAHzvVGtR8mJJ0WhW
	o2+pS6TuzRDZBn5LvUomqECToYwdFCn1/cCdMsSwjtzq+aD0PYAps/hGx5/cCaslc+FbPPyEXbU
	ihbtng4rzrXOx8WveUAJkS5vVUCvqnXlBikz/MqsoyqEBzhrvrl7HJesaH/ejXD97aDbRTMZRwR
	DUi9dLtQTPT/nYuxUGEVSlr2z45Ku2qjtVqLlzgW9SJ8Voya5fz2xidCn8M4SuCZ2EgKSW+G1bB
	DJ83pNnDCy2ekhQ67LOzAhSmduBWmeDUqyBvTZ2S3jUjZcADPxFzA1PFDZs0YgXpo6w875Vo8H+
	W4RgNvacC6TQ6p4PUnn0kcK/Qu0IyYOpEHTyz7OXxFnyYg/WysmzKSMDg4KFRFoBTWIgNCerLtH
	UCd+e+43jHEKGRmrmp6vpVHaDIbj1FR7w==
X-Received: by 2002:a05:6830:6413:b0:7e9:d082:3b87 with SMTP id 46e09a7af769-7f196b61346mr16269729a34.1.1785784741332;
        Mon, 03 Aug 2026 12:19:01 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b8f7:1f5e:7c:a7d1? ([2600:8803:e7e4:500:b8f7:1f5e:7c:a7d1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f11e522sm8029109a34.25.2026.08.03.12.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 12:19:00 -0700 (PDT)
Message-ID: <43059ed9-2ff8-4bf3-846a-53a4c7cd72bd@baylibre.com>
Date: Mon, 3 Aug 2026 14:18:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20260731-gp2ap070s-v3-0-d1f5cecf9fe7@disroot.org>
 <20260731-gp2ap070s-v3-2-d1f5cecf9fe7@disroot.org>
 <380b864f-6266-40fb-87a4-027afb422885@baylibre.com>
 <DKFHI80E1741.3L5TMU6D3P9OC@disroot.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DKFHI80E1741.3L5TMU6D3P9OC@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_121902_964753_857A6E41 
X-CRM114-Status: GOOD (  13.53  )
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

On 8/3/26 12:28 PM, Kaustabh Chakraborty wrote:
> On 2026-08-01 11:41 -05:00, David Lechner wrote:
>> On 7/30/26 3:07 PM, Kaustabh Chakraborty wrote:
>>> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
>>> Corporation. This sensor is used in mobile devices, including, but not
>>> limited to - the Samsung Galaxy J6.
>>>
>>> The driver has been adopted from Samsung's downstream kernel
>>> implementation [1]. Due to the lack of public documentation about the
>>> schematics of this device. The downstream driver acts as the secondary
>>> source of information. Driver clarity has also been improved with the
>>> help of the GP2AP* drivers in iio/light.
>>>
>>> Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870/blob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]
>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> ---
> 
> [...]
> 
>>> +static void gp2ap070s_reset_action(void *private)
>>> +{
>>> +	struct gp2ap070s_drvdata *drvdata = private;
>>
>> Usually, we don't bother with a cast/local variable in these.
>> The void* can be passed directly as an arg.
> 
> Yeah, but CFI will not be happy about that.

How so? We do this all the time and no one has reported any
issues with it.


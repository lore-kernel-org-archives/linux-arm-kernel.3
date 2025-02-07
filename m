Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82439C02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAIDUvMqJF3HsOg5RQnZHEKgK80JM34bXGrZoZu2NKg=; b=01PtprEqPx+ZuE/nTUXPDJNNzT
	8JBb57Tx2A9y+t5oBq/2s+8b20th/W03O+6GouGIE/jylNpeAkkSzvgqPg5FNBof1jQy04F5bu+Mv
	QmUedYF+guTBgb5xheaDsSw4RWV/QIp/mMWQwhuXYwvz/yKFo8dGDvVrHjEwPWEpkkBV1AK8Bkjfw
	IMwstcIEMxChjK8aHM1o7yEe528tO8Z5+URWXrR270Ygmj1FfV2KF+E3VQ4bag67eKBf7x+9PRAD8
	ZBVktSXWncLPLh7Xw0EKmkFDCSC2+A9wvuCnvBIMFA2rNh3OrNif0+ybPyobL82jxOBldtZyijFUv
	4Fh5WR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgO5N-00000009bU7-18AR;
	Fri, 07 Feb 2025 13:07:57 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgO3z-00000009bH7-1vMM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:06:32 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab795eba9a3so6164266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 05:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738933589; x=1739538389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UAIDUvMqJF3HsOg5RQnZHEKgK80JM34bXGrZoZu2NKg=;
        b=CWhDlwuwOxO1TCi+l2fhIlXIt69knvWXP0mdNuN19Rsyx0jhlgZ/kEYNzod7DxbxpF
         c8HLdBoxXv8SBoZZnJY//6LVTnrKHsBTqKxShbISu2lzN+Z0PBj9+mK226VdiMSJ+vDW
         iv53u/49DTYwjriMm9UifImBAdbyvWFOpytM2zY2Nyyg6PSJxMUVQ20ElNhHhbmo3LP+
         lsR08rZ2fZkuBiiDu3kKEaqAu5FB1E3EzymcAxc3PYGEz1RhmLQtK8s1Yhh+SxCx6Q13
         ZKPVlWbvovazJkf+vT5M/miYwV7AVTfLNVyrWoPQgIHloAZzqLSC9IGMV2VU7k+ykGs4
         oudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738933589; x=1739538389;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAIDUvMqJF3HsOg5RQnZHEKgK80JM34bXGrZoZu2NKg=;
        b=tu+CyNGkwpgNBDEnkQOvBm9NOicQWNSpvHMZoJuY5UPwoWgJ8fLI5+RVfL4qGlnfbS
         PZFhL19CyzsbyDlxq1TDL+FMWo+Trrf9EaW1ar4+l+OCTXb/R+fg760nhBLe9cZEjqTW
         AQuvSW6UWDkYQ0SsmER5QaqtoRejU5NcWJEeroImJE+X4KAX88feiKgxoVagmH5e2HCq
         gQP+3ApX5NoYmIgHrkBdZ5EoqNl26VZHN/rzxPoeyXB1AlUYBCpEt8Oicga8Dzy5pgDi
         DN91lJyhxc+4GI7LNaOv1Y4ESuqAtGF4lRJIjTuTXzA3cP+Leh1UNrrrF4VG1DzEx7v8
         k6UA==
X-Forwarded-Encrypted: i=1; AJvYcCXq3aSRaFEPzVq93qtA9aHbJMhg7E1D+22jE/XtzmB1PvxJnmOcLwTjmA18XMkg9Chd+SIpyRx7qLQjYwStHIfl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwz9muCD5UwKAmt+TL4yTwFq+/5Wt0vL76UGggAycg9Vl3J+Oq
	HhhM84z3yP/AOasTQhkN294p0sQqpA1dHqWBrWegxlLd4IRjH/Ym
X-Gm-Gg: ASbGnctPRQdt88h7q/RCRZXak86254aMRHF6DaAfZqUEMmoIbKRsO9b5C5jWP5adldH
	9ggNxmKLGUQCxG1k2KG56ewvY2SnCp3YzG/SgydAbpx7WYrAbYj3Q+NlFrB1reGzlPBnbkKvJFw
	uLFowGQiJzX19cYEm1gjozGIPos5/N1ADzHxPw/FVHGxxhh0rsvq3588rh5RUMWppTj9Q3RbUGm
	CGU05fZdYeh/8Fs7H9A3jF/1FkLtLInYzPTYeT1lWxLLBMl204jhYELgcnriv4R6oUFF/jWlz24
	juVMcaMl2m5RP49RHh1i/8GnfQ2mJiDDbrrXz+/eTTLruI6Agf1aNFBcycIm
X-Google-Smtp-Source: AGHT+IF23i+bLVu6xQLagQY0iQsPCDtzqSfKx065HMgxZ1ucv21ADcRH7FJoEMrvnNJprAQJAMH5TA==
X-Received: by 2002:a17:907:6d23:b0:ab7:5fcd:d4de with SMTP id a640c23a62f3a-ab789c50af4mr308195866b.50.1738933588917;
        Fri, 07 Feb 2025 05:06:28 -0800 (PST)
Received: from [192.168.50.244] (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f893e9sm267815066b.65.2025.02.07.05.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 05:06:28 -0800 (PST)
Message-ID: <bc9df0fe-ff2b-439b-a434-b6b88ee8e25c@gmail.com>
Date: Fri, 7 Feb 2025 14:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] mfd: bcm590xx: Add compatible for BCM59054
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>
 <20250207084852.GC7593@google.com>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250207084852.GC7593@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_050631_501266_81E7E129 
X-CRM114-Status: GOOD (  19.78  )
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

On 7.02.2025 09:48, Lee Jones wrote:
> On Fri, 31 Jan 2025, Artur Weber wrote:
> 
>> The BCM59056 supported by the bcm590xx driver is similar to the
>> BCM59054 MFD. Add a compatible for it in the driver, in preparation
>> for extending support of this chip in the bcm590xx regulator driver.
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>> ---
>> Changes in v3:
>> - Fix compilation warning about device_type pointer cast type
>> - Name the device types enum and use it as the type in the MFD struct
>> ---
>>   drivers/mfd/bcm590xx.c       | 6 +++++-
>>   include/linux/mfd/bcm590xx.h | 7 +++++++
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
>> index 8b56786d85d0182acf91da203b5f943556c08422..23036157480e0116301bfa93932c92f5a80010ea 100644
>> --- a/drivers/mfd/bcm590xx.c
>> +++ b/drivers/mfd/bcm590xx.c
>> @@ -50,6 +50,9 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>>   	bcm590xx->dev = &i2c_pri->dev;
>>   	bcm590xx->i2c_pri = i2c_pri;
>>   
>> +	bcm590xx->device_type = \
>> +			  (uintptr_t) of_device_get_match_data(bcm590xx->dev);
> 
> Why are you dividing pointers with each other?

That's not division, it's a line continuation (note the space before
"\") - had to insert it for the line to fit in 80 characters. Though
admittedly, there's probably a better way to do this than to force it
with "\"...

I will clean this up in the next version.

Best regards
Artur


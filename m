Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38592C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mcn9xoOYu8W8aqg79TZi7MJEchbnlTtS4s5gSCJbvAQ=; b=vW/yn0G5rD+xxWWuffAOFChEaz
	W+uwCvZ1V4knup4s0mfPY7DcbbJhPqJQI34Wqs7SaOApLgocSFR8Y7Wpx+4eWrYW8vlvBbAcC1EBF
	QTi27DtRE0jWeS+nOBJYCxungURsX79D7RTIofEzn+etLqFXnAjl+M3Zb7JJIp7S3ILbGE3fK2oZS
	SynDSDc3Ej6BCdtmUEICyp+8dPQ6km+mGeQb/08xIPUtHHbH/c52wsuiQmkkq7YRN3uv99Bx7WO+X
	JT2PlKtgx10Y49tT5LeGVXoxbCcmWYLZz/AH6eWrOQvScIJsmXBKDfp5pF3RTZfp8TxzFt7Il94wl
	g2t6JElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGtL-00000004eMG-1SqC;
	Mon, 13 Jan 2025 09:37:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGpy-00000004dNo-09Mk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 09:34:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361f796586so41375235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 01:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736760860; x=1737365660; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mcn9xoOYu8W8aqg79TZi7MJEchbnlTtS4s5gSCJbvAQ=;
        b=a3wsw0afHQvp+be1JwmC8hunXnuM2vM7V6I4jbKblMIpIj0kMrpiUucqBfNUT1U8R4
         InZb7Nza36INCYKv/HPiNqIZRgQOTJdl7rs9McB2CJRNVZ1uoPTNJR6ttFsqeQIUn8dz
         rXtAO1FeBWyLFuMSKlnyf7DSXUz6aGuVq4NDyft3g0nhQ5R6kUjI1RCH3Ck5498+EgAF
         JCLV0N/MYwPJ16iPIChVsIucCoMINnTdqD4TiqMHMzAUtB5Jantwq0Ez0Je3t3kc+Xza
         WbuGL5OIrX0iTLIAyXl83Mz39wCIpdeeDD8gbTs0viHNwAA653hd0DYpC0SCda5fbJul
         urhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760860; x=1737365660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mcn9xoOYu8W8aqg79TZi7MJEchbnlTtS4s5gSCJbvAQ=;
        b=VTdGb0xzed1ZkxGLqhVHGSCHPBWcfrLYJpROay743l/aUWRmu0Vy8u06JznKGkH1r+
         lIn0p66O4inRrCd7w+Hp+JP+mgNEqZkn+a1nTTDPMxIxOvuKp41s64Jph1qNzmfb7YOW
         0k0kN85dcCOqPXtEWa9mR3n7i9h6PB7y3SmE3pwvrLUm8syNDrmoY2UYF3qeavj8xoCq
         vs45zqoIW3tRu/W2Ie8ZWxTtdQ9RYJOxQk8Dpe/1t5/Xl3r4JG6Ariy3Wp9yvLxFWMB0
         tGdE3DaoFioAzkbT3qVO9WNEXqCE/fK73EyG3W5RCUyazdfnAbonCAh5UG7myKXyl4Gi
         Fc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFVJU3ZHKUL/EA6yyPNcnfwPVIT+gqPLncYCQ5bULP8UYExrNPKzks0aqplFLomHU6YRHc9BWqsRF5kyAx82l1@lists.infradead.org
X-Gm-Message-State: AOJu0YyziYf0LkKRg/8vbqngdr4D+jLTA256rvo2zrIS4z9CswNEVMFr
	PLOMDFVvyBDhZzUtkekqI3toCyj0gn9LX/c1Zj+OqtRXwvBcfmqafK6fNu79JyI=
X-Gm-Gg: ASbGncv9lLnQEfbPX7raifHoFuQSR0M12+iJiC61p+8cFUEMsXosEQ6QtM4X0tCAMDb
	ApSbujbbjAeqqXmXOb7z2xDo5bouyeOdcXxN/UeZ4yZiwb2WY+xFpGp3yc7yZLJu8HS1rgps1NV
	5E4Mw/glbBMV0ZU6/w7jA0XtNF/pPY/LahAMlkVSZTfs3FdYkJUGyIhACR4rh73RfP77C5NBt8D
	ghNKIRdlz7PK+bqBsoDwNjXKCWtqHStZwr1r8xY7NfKlD3gGcsBFu2pInHQ/IjiIg==
X-Google-Smtp-Source: AGHT+IGFH+x4nfdStxwZGkAyFCJvnk1LXrp25GiWHQEWRueM3fKqk/Y3Ijad7YFj8i45jHfeLn4/VQ==
X-Received: by 2002:a05:600c:1c8b:b0:434:a852:ba77 with SMTP id 5b1f17b1804b1-436e26a7e1emr197156785e9.15.1736760859971;
        Mon, 13 Jan 2025 01:34:19 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d69sm136986415e9.30.2025.01.13.01.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 01:34:19 -0800 (PST)
Message-ID: <7dc02926-905e-430d-91f5-e1ad7af7135e@linaro.org>
Date: Mon, 13 Jan 2025 09:34:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
 <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
 <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
 <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org>
 <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
 <CABb+yY0JMZfwR9xQ8s80Kmg0gE1DRDJ9bHB=eMnw70uw5nBshw@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY0JMZfwR9xQ8s80Kmg0gE1DRDJ9bHB=eMnw70uw5nBshw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_013422_098177_4E7C182F 
X-CRM114-Status: GOOD (  14.91  )
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



On 1/12/25 4:59 PM, Jassi Brar wrote:

>>>>> Then I updated the mailbox core to allow clients to request channels by
>>>>> passing some args containing channel identifiers to the controllers,
>>>>> that the controllers xlate() using their own method.
>>>>>
>>>> This is unnecessary.
>>>> If you don't pass the doorbell number from DT, each channel populated
>>>> by the driver is just a s/w construct or a 'virtual' channel. Make use
>>>> of 'void *data'  in send_data() to specify the doorbell.
>>>>
>>> I think this introduces concurrency problems if the channel identifiers
>>> passed by 'void *data' don't match the virtual channel used for sending
>>> the messages. Do we want to allow this?
>>>
>>> Also, if we use 'void *data' to pass channel identifiers, the channel
>>> checks will have to be made at send_data() time. Thus if passing wrong
>>> channel type for example, the mailbox client will eventually get a
>>> -ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I find
>>> misleading.
>>
>> Shall I still use 'void *data' to pass channel identifiers through
>> send_data()? I'd like to respin everything.
>>
> Yes, please do.
> 

What shall I do in driver's of_xlate method, always return
&mbox->chans[0], as bcm2835 does? All 14 doorbels will be serialized
with mobox->chans[0].lock.

I could use a list of channels in the controller and provide some
get/put channel methods, but the virtual channel ID will not match the
actual channel ID that's used for communication. I'll also need to
introduce channel ops, to put the channel that was acquired via of_xlate
from the list of available channels.

Aren't we better off with the mbox_request_channel_by_args() that I
introduced in v6? Or if you think there's better option I'll be happy to
implement it. I need an agreement on the overall idea.

Thanks,
ta


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF5ECEE336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJbSaVfQsu8Be7gi3N3Qdz/1czwLOuz34Pc1Hp3AGq4=; b=BkqO2sb4h7+jWj+SoV+Eak+G3v
	5Yd+U7mPpcOu0xPZttesuVB8k/Vr86O84kyfMAVC+KkeENLB4tVWOSWU6p6XMbRoB39UbnJ6nnn2p
	FrqwoqHGv5c3Ia//dEc3A8isdg2QwKLpEPT3RzKsLJRrHyjXYjFoL86yBO8gjKbjqbMOSMYuQJYv4
	qhe4MdcLiGD6JwYJDf3uVg5KZ5H+EwmzOk384XlsPYxljP/zXmTB9fDDWc4BQBdpor2fP7yrXMt/6
	zn4+KefppVDIOkABpCPfb+pnGliMUu3GzpJz4151tLMa9rWoH96cRwHFqZqa6l5pCIbfDWdPTmsbw
	5EG6JRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOMl-00000000hMR-0hnW;
	Tue, 18 Nov 2025 16:15:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOMi-00000000hLt-3R1A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:15:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47790b080e4so23651565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763482535; x=1764087335; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJbSaVfQsu8Be7gi3N3Qdz/1czwLOuz34Pc1Hp3AGq4=;
        b=AlDuXPaWkJZI9VYWjQ8YvD8mGUiOA7QjMGZFz20a3++xroIQ3rktLVmRkWoHJ9jTCZ
         8PwF2/WLIfa267vbmz85mMExQdrTI3jcyMLyGFfOVwThvlvdeFr/DgwggZHzTJt41svz
         CYmdR+w9MjjZ6YXvdoX4SN+jzwNruepbgfSTDakp4nO9oU5pgMMi3+15P0sx7RvJqKKE
         1A09IoTwdWmw+YAACrMaa9/php1PLme4bUDWDYpgVdofRiHPiBQ8r5VZkoyA3chMxq67
         S43bdkEYtB72TSXoSn7/GHSb8EsqDDv9/MhhNzhN3beUcT49jJRDx9RRnFicRFWwIRMy
         R96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763482535; x=1764087335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJbSaVfQsu8Be7gi3N3Qdz/1czwLOuz34Pc1Hp3AGq4=;
        b=Kx4UdWcdLlpEcCj48PRtNi1r0tLzpiqSrfjmbjS5qNZPpxRhHmiJ3n99jX/pYQu2K2
         XGUHSfMdBG5kPFY1Wna06vSMwp+fzkByCbUUjI4tvEjJcY9nTw4o7JQyaChd9cBkIrj9
         XQxlwM2lfUeXQhCD7ZpoY4a6oKeMSa3VnyEbxswMhHHR5RPHmWNabyTY1rXRovnimfJi
         DysnCChrO4bbp5WwmT+/oYnLe/7z9Jbf32TMzhseycFHGrakh20seFw0esTToYJCwBHQ
         SA9vSS1t/oDNevjRfZqyt4esmpDhDuV23Hk6zuHrLg+Ubq+SOaFTpoCAc62WYyS0FKZu
         mWZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuKfsNLhdGrU9dtv/8auiS7txobfTElhGse0csXc8/78f0Ay9OGz4OWDDsjAET0v253K1GxDE1ePs21FWx/rH5@lists.infradead.org
X-Gm-Message-State: AOJu0YzU+9kemDO6PR7zR4b51LCPsRvIGuZRJcgDuQ5P7fcuiiE1vcrC
	jo4qnrPgUOTE6DWAchlCOUi349xp3K6v45lOMEKy47Glg8JVFCBGjnuUsjyCCz8usuE=
X-Gm-Gg: ASbGnctN4rfdBaYgeyRfLC8biNollr2Go09knpr3LFZiA7xtjjE9VxI6vpQyLhMypLJ
	1vTXk6Da4D5M2uX8owqWvvwhe8yLo1ngIv1ReOSDxVW7YJAGoJUFjV0b5gkXsOv7Q7DQ9yS1QGG
	N2IsGG0gLoN+gjgWRxbIU2REJs/h9eVwXPsv3CbnKKzFwBn2SW4AYo2rQf/fKSvIGc+VnNhIUZU
	AV8fiT1FJK34hAcm0yvqamz2CZnt+HQCNBPgJDLbG0lRNou5bfwTBHqeeUuq0MfFmjaz4ufRgvh
	FMGyXQAlmH0DvMGGKMYZTttmnoNExiDcr25K0gzStfevYwLTk9lBrNjD6oHl8Cs0eMxY4tDzE9y
	6+RAURFq4VGcgK9Gh75CvTpTGz23IP3V/BaC0kcMO4kATR36L8w3CnPdwnzKvqfB1/9a5VF1+5P
	Jnf87vYAj9oMPAS/Gi
X-Google-Smtp-Source: AGHT+IFNyjTOc2O+E2kBBP4fBbkcbWJS9AWlQK7jCUXfXz1xZUJdgxvuleAKgQPv4ma+ub1UTOpP7g==
X-Received: by 2002:a05:600c:a43:b0:477:3543:3a3b with SMTP id 5b1f17b1804b1-4778fe59f2amr146578905e9.6.1763482534892;
        Tue, 18 Nov 2025 08:15:34 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a974cdc8sm22479365e9.2.2025.11.18.08.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 08:15:33 -0800 (PST)
Message-ID: <4003a48f-73e0-4296-bcdc-6a975807c2d5@linaro.org>
Date: Tue, 18 Nov 2025 16:15:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
 <20251114180503.GM3568724@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251114180503.GM3568724@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_081536_886361_64F6908A 
X-CRM114-Status: GOOD (  25.66  )
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



On 14/11/2025 6:05 pm, Leo Yan wrote:
> On Wed, Nov 12, 2025 at 03:22:19PM +0000, James Clark wrote:
>> Document how the new field is used, maximum value and the interaction
>> with SYNC timestamps.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/trace/coresight/coresight.rst | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
>> index 806699871b80..80b5ed09d69b 100644
>> --- a/Documentation/trace/coresight/coresight.rst
>> +++ b/Documentation/trace/coresight/coresight.rst
>> @@ -613,8 +613,19 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>>        - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
>>          <coresight-return-stack>`
>>      * - timestamp
>> -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
>> -       <coresight-timestamp>`
>> +     - Controls generation and interval of timestamps.
>> +
>> +       0 = off, 1 = maximum interval .. 15 = minimum interval.
> 
> I am struggling to understand the "maximum" and "minimum" usage here.
> 
> Seems to me, you are saying:
> 
>      1 = maximum frequency .. 15 = minimum frequency
> 

Yes the documentation was the wrong way around. Will flip it.

>> +
>> +       Values 1 - 14 use a counter that decrements every cycle to generate a
>> +       timestamp on underflow. The reload value for the counter is 2 raised to
>> +       the power of timestamp interval - 1. If the value is 1 then the reload
>> +       value is 1, if the value is 11 then the reload value is 1024 etc.
> 
> I saw your replying to Randy, yeah, the formula would be much clear.
> 
>> +
>> +       Setting the minimum interval (15) will disable the counter generated
>> +       timestamps, freeing the counter resource, leaving only ones emitted when
>> +       a SYNC packet is generated for every 4096 bytes of trace.
> 
> "every 4096 bytes" is not always true.
> 
> Isn't this defined in TRCSYNCPR.PERIOD?  Maybe just say "... for every
> period of trace defined in TRCSYNCPR.PERIOD", or even more general
> "... for every period of trace".
> 
> Thanks,
> Leo
> 

It would only not be true when using a custom config. I can say that 
it's TRCSYNCPR.PERIOD but that the default is 4096 bytes.

>> +
>>      * - cc_threshold
>>        - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
>>          default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
>>
>> -- 
>> 2.34.1
>>



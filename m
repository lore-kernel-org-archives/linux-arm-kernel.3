Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA75D2C11B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GylzRZAw80Z1YP9ykCKe0zWAimOryNrUB5zoTN5UfS8=; b=zvdghaA2MTBMO06MO6CtvcToai
	0roRki8dkPcfcEF3FTHtkiqNcETFeJW+/r1BygVGE6dxAWyjIRudiZc0MXj9HsqktEDf8CdwVLpbY
	hHjEzv/tPlwEPhdnVCLIomyLiIpokCybSKaXNnWztFLgFHEMzcIt/6vz6ms+N6qUkJCPDf7H3v/5b
	Zd7ndVdkPo4y83Zj0z/jltgpqt5zLErTq0eIjKDz4gKc+f85cUXd9k4ds112i+7qfyPytcdLYgbIA
	0eSa3W8040yC9aNgVZoKXqSyLbw6t4TbnSYAUGN9t5CNz0S+zAi9rKJk9P84FcBqI52+rowMl5joS
	xfQchzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L6c-0000000HN21-3Su0;
	Tue, 05 Nov 2024 15:04:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L4u-0000000HMoa-2BsC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:02:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20caccadbeeso60461765ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 07:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730818963; x=1731423763; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GylzRZAw80Z1YP9ykCKe0zWAimOryNrUB5zoTN5UfS8=;
        b=HOPlIHXumKwDFL/H9/3jJ5OLlm0pffwOjjgd44MwCIUJifoagawi7ieY3tTECdqDhC
         FrmaYrfPVXDXyxv3OoCbpvmeBlxFVfumboGS2fkzl4cwqpMvFInG71ZnAOCz9Fb/LPuv
         jVLUixKmm3M5+yFf5/CNQs8b9xJ8wobn893V861/OEO+dbI2EmyysG3OBwKxJQ01GpI9
         +Q38goP649Sf89aH5IPszalZrTltC4nA1SrwUTuAbq/mGNrHxTVy0lXwRpFYIFs5aHDn
         blxRXxl4xr2Zgs1Dp21Yl5kD80LTrKLcWnKTxdtMJiRE1E/AvyKqy2suSeoU+wmVV0aU
         7CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730818963; x=1731423763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GylzRZAw80Z1YP9ykCKe0zWAimOryNrUB5zoTN5UfS8=;
        b=WgtdNtBCQxkHrh5JyacrqqDFV0dRR9jZLdd135+UQ2NT53ak3BHgx770UVjUyuBOvq
         1KSEi3RpzJj0MXpsnD7dWj5SyPuZkAvDmPy1aMcisBJI5PMNeAJa2Jl8a81tz5gzZHzF
         I6IoZMh2gSWdCJXbx/bKLj3CJwDFZxh86l89wHXAUhqib5ecv7g7keWmLIRf4aBRkuth
         vpJIUMATYv8rwkW5Ue57UeCS1ghUH0sx9hDLhqfQL/xOiAThOQY6nNKq5tjyLXL65rzd
         DODfnCnXts+jaA1yfspFHq4AzeVTRZ5gyfzt6a5twWJlVlAKnTIRfRvMzVWn1zHhBCk5
         aqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoqiaoGSUu8BWhOSsEujTkuwBncQB+pUgcpxynONiGimWBg//ihTdAYGVx41CFyT2/Q98++saGWMtQQJXQC/fh@lists.infradead.org
X-Gm-Message-State: AOJu0YxpEGuaFSHMz+uIOsOAFamiEj7EEvliFOuqTZE8UobMTqo74euv
	AoBiG2jkMcYsyq2UX6XeHf6A6LRF68ugP1L5Eb9qxvzCeD1fRtq0
X-Google-Smtp-Source: AGHT+IF/eUZKDzQsRxKzTlua0VGkAg3XHFmVRb6DFSZ+1VJsC1hbumlf8z0CTzQo9N2NGxWAK6QLWQ==
X-Received: by 2002:a17:902:ce89:b0:207:1675:6709 with SMTP id d9443c01a7336-211039ed04fmr280580415ad.0.1730818963193;
        Tue, 05 Nov 2024 07:02:43 -0800 (PST)
Received: from [192.168.1.7] ([27.7.141.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459f927dsm9131881a12.75.2024.11.05.07.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 07:02:42 -0800 (PST)
Message-ID: <2946c37e-d46d-46a3-a965-4932d5fc34bf@gmail.com>
Date: Tue, 5 Nov 2024 20:32:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Typo: Fix typo in atmel_serial.c
To: Richard GENOUD <richard.genoud@bootlin.com>, Hari.PrasathGE@microchip.com
Cc: alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 claudiu.beznea@tuxon.dev, jirislaby@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241024172300.968015-1-cvam0000@gmail.com>
 <5933bb3c-3b1e-4579-88c6-b9bbbed93a4f@microchip.com>
 <94726cb7-7cd5-48cf-b158-a66e6b279058@bootlin.com>
Content-Language: en-US
From: Shivam Chaudhary <cvam0000@gmail.com>
In-Reply-To: <94726cb7-7cd5-48cf-b158-a66e6b279058@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_070244_580873_A570829C 
X-CRM114-Status: GOOD (  13.78  )
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


On 05/11/24 6:40 PM, Richard GENOUD wrote:
> Le 05/11/2024 à 13:18, Hari.PrasathGE@microchip.com a écrit :
>> Hi,
>>
>> On 10/24/24 10:53 PM, Shivam Chaudhary wrote:
>>> [You don't often get email from cvam0000@gmail.com. Learn why this 
>>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>> know the content is safe
>>>
>>> Corrected minor typo in atmel_serial.c
>>> - Fixed "retreives" to "retrieves"
>>>
>>
>> Pls fix the subject line. Refer to the previous commits from the git log
>> of the same file. Also,the commit message should be in imperative mood.
>> Send a v2 with the above comments addressed. Some useful links below:
>>
>> https://kernelnewbies.org/FirstKernelPatch
>> https://kernelnewbies.org/PatchPhilosophy
>
> And for this kind of patches, I think it should go through the 
> kernel-janitors ML.
>
Thanks for responding , i think kernel-janitors is not active 
anymore(IMK). Ill address the

review comments and send the V2.


thanks

--Shivam



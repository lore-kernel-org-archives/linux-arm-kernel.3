Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67955C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bi/l3ud7Bd1Vu8GC02tc5orfdCo7D2QgRurFTd5r8ic=; b=Hk1PDRM27iM6QhPqPMQqReXJhY
	+zYENi32N82NkN4/bSFiY9XmUTxWxcy6CChpS/bOXZvk3r9CkcyaS5FKvueiZwoAyYzadMBbp0G7R
	8YKCEYa8O2VA75+Kk8mP8g7BjbYPJW3WE/bziJhPXcPRdZf/bq6oUehQfNuJy696i9IdU5y7m1U9V
	kPt6O0x6/JxiR5hH5YQH39yL6klad0nSvHqPK9N9TOUgJnFbbLhzAqdUKVhOoe0MHhK7c2xOHXxxM
	cO9GUCojJltXoF+bm6+krOa4Lod6FOobuCMyTO5h4FtNbVCikSXjDQ6hmg2mL+M5n0Xt+wGjh5Rw2
	7bmesYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRxt-00000008IM2-1goW;
	Wed, 09 Jul 2025 10:23:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQB9-00000007yB9-1WZZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:29:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso152593366b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752049761; x=1752654561; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bi/l3ud7Bd1Vu8GC02tc5orfdCo7D2QgRurFTd5r8ic=;
        b=bI6IujcMgUMgqfLYyPobaCKic3+1y2OH4k/Sm78zOwIa2CH/CdRBcTUyB1UGyznzrV
         XSsUB97iw+y8cQsI6bVnZeKzzmckxeMe2ikyGX4D+tX7gTj28OfefZmjBTjIVI/lQhWX
         TCQO4c0pPkAj6xv3ZaDPzb5ikaW3luA2R4QX3VkjHf3NzH293rWjPDvzPjFXDP78FSyH
         EqLYP0B3zKsFpweDV8/wU0MFBMAiks12wkCbMJBP2CXFxLpUz4gsy8Y+cDQDXmlM5eDl
         Tts6ldcvPe69HVHz1i155goWMaOZr+uCayICHwfwHTHNvDhaNyojg2sjWhWjyre+BMA1
         3PLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752049761; x=1752654561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi/l3ud7Bd1Vu8GC02tc5orfdCo7D2QgRurFTd5r8ic=;
        b=jbdlr+lksdX3K6KwSw/0r09TnDCxn+QJobHDvuxWRPp8BlFaEMWbr8V5mF1VMgxpX5
         wwCUTUM6SUzkjN+hed76iAx3cKQHXbgn8JWzX4d/3pgHqVVMgyRIKpW35I9SRoQoJUKP
         rxDPVY1W+ehtZmUx9lhrV5aKBtLie23wSm+U/S6fwdQOBETnJJplPpmG1oouzxbUkFb0
         ZLcHGUjR8eh7F12J7kz2JYQkHBqy/L05nGtL1/jmEgSpLZqpuYAa+9RGYo572iVfhvbc
         3g/e3cw4tiY4jJpG1Klr+vjVaLfr988PyycamM8G4rCZKsQlxqBFGjbmrv9x6q+IdfkE
         LhXw==
X-Forwarded-Encrypted: i=1; AJvYcCUhcXcbh7cGFJag3yj/lc8ZGNr24hBFIZRvncGRv4PsOrNskl5qv/mDnb68KGXAMWjFII5W050WeScUTPkhkBp0@lists.infradead.org
X-Gm-Message-State: AOJu0YxL6QcD37togx52xbpuO3fTdrOrYkPGdUXs3cXokgzbgNOIy+mL
	tUoUBMMusyEIiY1sCVUwg+KniOsvU18WAIC4kJuQzLd8GRG6+HG3M/3n
X-Gm-Gg: ASbGnct4uNAljQGh4OwkrEGOGqw74ga2OqA2rhQLNkEalrGGqlNww055gMknvR3HPWA
	wulVS1h8QgtDIdPBeYkvneaUyzsyzfPPM91m+lDZ97gtkU/IB7cHj800dK09cp29rz+wl8d3Zj6
	4suP25d1uLumyrHbZ2r7jNbuRwHJoxrxx+UV0rd1bJ3N4cabLxQ2QG2V3rwxVV8fM0EFpzCMSnu
	HgZeYc6HKqtxngZjGM9/eyGdzJb+ZxUbEVAD4wbvFM7dnypXdGJC7+Hm/Ie9j4nJ3jaJ1nuhHX0
	RqVvo73fpvA6Dv5PBTO0QV6rNM06bULIMUhAjPVb/Zm0Q6U8fwH2+oXnIYjtBywL0E+YrQRCf3o
	Kgy3AUqNdeQ==
X-Google-Smtp-Source: AGHT+IG7Froez94aK00sHDKtRfqK1t5pvOLh2GahZldwvh4yUsreoBwkPjrJr30QJyEe79WxSjfLsA==
X-Received: by 2002:a17:907:3c88:b0:ae3:ee3a:56ee with SMTP id a640c23a62f3a-ae6d1266a1bmr156027366b.3.1752049760977;
        Wed, 09 Jul 2025 01:29:20 -0700 (PDT)
Received: from [192.168.5.87] ([92.120.5.6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692d101sm1073719866b.54.2025.07.09.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 01:29:20 -0700 (PDT)
Message-ID: <907a40d6-7d55-4bdf-b16b-01c71b5f4104@gmail.com>
Date: Wed, 9 Jul 2025 11:29:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
References: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
 <vwozlwajisjw5qomwtmnfdklmucevyxncsxl2cdmixn2yixxrk@x6j3r2lrl5qz>
 <a1b6039e-7020-4d17-8186-d40ac17ba730@gmail.com>
 <xo56zato6pgqqttdriskfgh4kdt2g6q5eg5jxte56uddkdfr63@sa7coeifbsmy>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <xo56zato6pgqqttdriskfgh4kdt2g6q5eg5jxte56uddkdfr63@sa7coeifbsmy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_012923_400972_B61A1657 
X-CRM114-Status: GOOD (  16.52  )
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



On 7/9/2025 9:05 AM, Uwe Kleine-König wrote:
> Hello Laurentiu,
>
> On Wed, Jul 02, 2025 at 11:31:28AM +0300, Laurentiu Mihalcea wrote:
>> On 7/2/2025 8:51 AM, Uwe Kleine-König wrote:
>>> On Tue, Jul 01, 2025 at 06:01:47PM -0400, Laurentiu Mihalcea wrote:
>>>> +		 * MOD will NOT reset the value of the TPM counter.
>>>> +		 *
>>>> +		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
>>>> +		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
>>>> +		 * incorrect.
>>>> +		 *
>>>> +		 * To avoid this, we need to force a reset of the
>>>> +		 * counter before writing the new MOD value.
>>>> +		 */
>>> Without the reference manual at hand or a deeper understanding of the
>>> hardware this isn't understandable. What is MOD? What is CMOD?
>> so, MOD is the reference value for the counter. The counter needs to
>> count until this value is reached, at which point the counter value
>> gets reset to 0 and the output signal is driven HIGH or LOW (depends
>> on the configured polarity). This value is used to define the period
>> of the PWM.
>>
>> CMOD, on the other hand, is a clocking-related configuration option.
>> I'd say what we're most interested in here is the fact that if CMOD is
>> 0 then the counter will be disabled. Otherwise, it will be enabled.
> JFTR: I marked your patch as "changes requested" now in patchwork and my
> inbox and expect an updated patch, but without holding my breath :-)

Sorry for the long delay! Got this on my TODO list. Busy week :(


Thanks,
Laurentiu


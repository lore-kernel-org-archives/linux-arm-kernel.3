Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E7BC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIxztczHXc41fel9IglxhmyI0/h9ABG9HIR/l5dGVtg=; b=2Le9N54+uHauQzPBgvklGI+Pwk
	4xyQNnCwYFaUALUh1ldnsXF39o6VlXFAwvhRkfYeWBwoq8hd953HCyxz3zYNQX2gWxb3C6jG+ieFo
	veWlWUximNqeIGIDgC/SiRgl8IcyeZgEZe0AprfxUWN0N50e56LZU/SytgvzxiOaffAbX6LxtAMQt
	eGSLs4blLsQZuZTe7JjvZkOnzAUUmQt0fx+Adm9OV5pTTxeWCSdCWuOGTdYFOQsy7YBDbJ3X/Su8N
	7PI40Mg1EsAf6I9bcIo4EoV+6BoXUkla5+USybEtAQENB5XhnPxfkhS1JxkfjQr+T3yR+yyNNqyjp
	6f0t6Cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5IB-0000000E6RU-0pR8;
	Fri, 27 Jun 2025 09:22:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5Ea-0000000E5hu-2Si9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 09:19:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so10302775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 02:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751015939; x=1751620739; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIxztczHXc41fel9IglxhmyI0/h9ABG9HIR/l5dGVtg=;
        b=EycFqcU/TcGSxuYdTk8wcyRPDSN7vHIZapLe0AXCHTH3hPPoCDTJKnxeG9X7PYGG3Q
         hM7UMUd2hFAZGLk2NaYVuOs1XCT0r1krQK9EwLm5EDfLBXZUHrUy9SjF9DToXv9SJqdW
         iDWrB43OZiKiFc6tdowleoUo+bGlrm7ILowJBlXZ5LbZaRueHShM01kimLRigVN6VBeB
         XAY1BG0xS1YTz16QfaSZpQgNnu0bjdvAxal6Eol8N6DOIwLKUt4srzxi8nlRC4xQLYp4
         XqZtsg3xjulvtFacnNN6aPmJ53g64TLdc9swDDQs5Fu1z8vSmxyNoy20uMitkZOw9nZo
         KffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015939; x=1751620739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xIxztczHXc41fel9IglxhmyI0/h9ABG9HIR/l5dGVtg=;
        b=ImavKabjYQ0RioAX0YRAOyrFlBhPY6/xXF5ebteeBjkG+6w3ksN2JK7tILC8fx8QNV
         tXxEhu5CIJKf17xnUcUjzQChzpb2zRVStWQQR2/xh8vL09aBx9QJ+GHs5odVqem3Ku52
         8NMsO6vg+5EX3XyCivESGNMsfSRjrK36O+5eU3IKFSjAig6F5I+AzAoD6bcKQ78G7gTw
         PC8gxs/VbSb7E1UL5RJktXHS5rh0LrtBixt27KNTBqpEhTFcBJZJ2Gp4uhSX8KemWj7o
         zhs5vOd1AFVTnwWbuf5/Nf1+hh3UFAPO1xxorSY4RBSP2MiEB36exIXqce060vEOeTzE
         OU9w==
X-Forwarded-Encrypted: i=1; AJvYcCVFeJrrQljCck9fmAM80Spl9TRfCOJ5qFSWf04WUZy3uCZ6vtjYYYP0ni3U0TJScKZk8tR17YtPSxMl9o5RSeMa@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh53mbI9Wn3LBhYwyDqcheNpwTXP6t0p6y68S3kDm7CvMnb+zL
	4rak/rBSO5zLeN46g9Sekhng/caOiRV+RlMFmm4XLClBPYK4myKttN7p9PPpFpS3krA=
X-Gm-Gg: ASbGncvEt8jzoDTWLgi28v13i0xeiD0dPu1G/M8vrZFolSwq08ilSO/i19tGQ1L6xq+
	xBguf+Uv0x10IiqAD5wLyWrzs50gDLL1R24hKUW+ntotVg8+aYwQF4UUARvEQqYFG3ivHBc36F/
	MybNPFwEZtRdUhJ6Obz2PMqjGS66RbAWzQvOXK+8b1+KKTzr28HvD7972+Ba+48CrrGwCuBgy8e
	//kCZmDFzzLaXrPtGyP4ZWU4bzEf4BV7UMEX5WoCeST7FuieHa1zKUgRkxrqLiTvJWrxUvwchHD
	m1k6bBfhTgQkHkks1LiZCJzp6USRv/8F17RaX3Rp6mCeQpaIA4ZbhYpaC3Tb7uoWjtU=
X-Google-Smtp-Source: AGHT+IFKDATdTSicVyAsm5O95Gq04eWdeCdziB2/TLTqQhbYmQIh9aj9LxW0vtYh4OG++poViTaZpQ==
X-Received: by 2002:a05:600c:19cb:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-4538ee71251mr22039765e9.28.1751015938639;
        Fri, 27 Jun 2025 02:18:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380d0f15esm67622605e9.1.2025.06.27.02.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 02:18:58 -0700 (PDT)
Message-ID: <f3552c8a-d8c2-4c0d-9286-20ad95c5937a@linaro.org>
Date: Fri, 27 Jun 2025 10:18:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: coresight: Finish removal of Coresight support in
 arch/arm/kernel
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Cc: Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250210112927.623872-1-james.clark@linaro.org>
 <15720521-7ee3-4945-a0bd-2b166682d4c9@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <15720521-7ee3-4945-a0bd-2b166682d4c9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_021900_630464_7B032587 
X-CRM114-Status: GOOD (  17.83  )
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



On 18/03/2025 10:48 am, Suzuki K Poulose wrote:
> On 10/02/2025 11:29, James Clark wrote:
>> Commit 184901a06a36 ("ARM: removing support for etb/etm in
>> "arch/arm/kernel/"") removed asm/hardware/coresight.h which is included
>> by this file. Therefore this is dead code so delete it.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Gentle ping. Or maybe you can take this in the Coresight tree Suzuki?

> 
>> ---
>>   arch/arm/include/asm/cti.h | 160 -------------------------------------
>>   1 file changed, 160 deletions(-)
>>   delete mode 100644 arch/arm/include/asm/cti.h
>>
>> diff --git a/arch/arm/include/asm/cti.h b/arch/arm/include/asm/cti.h
>> deleted file mode 100644
>> index f8500e5d6ea8..000000000000
>> --- a/arch/arm/include/asm/cti.h
>> +++ /dev/null
>> @@ -1,160 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> -#ifndef __ASMARM_CTI_H
>> -#define __ASMARM_CTI_H
>> -
>> -#include    <asm/io.h>
>> -#include    <asm/hardware/coresight.h>
>> -
>> -/* The registers' definition is from section 3.2 of
>> - * Embedded Cross Trigger Revision: r0p0
>> - */
>> -#define        CTICONTROL        0x000
>> -#define        CTISTATUS        0x004
>> -#define        CTILOCK            0x008
>> -#define        CTIPROTECTION        0x00C
>> -#define        CTIINTACK        0x010
>> -#define        CTIAPPSET        0x014
>> -#define        CTIAPPCLEAR        0x018
>> -#define        CTIAPPPULSE        0x01c
>> -#define        CTIINEN            0x020
>> -#define        CTIOUTEN        0x0A0
>> -#define        CTITRIGINSTATUS        0x130
>> -#define        CTITRIGOUTSTATUS    0x134
>> -#define        CTICHINSTATUS        0x138
>> -#define        CTICHOUTSTATUS        0x13c
>> -#define        CTIPERIPHID0        0xFE0
>> -#define        CTIPERIPHID1        0xFE4
>> -#define        CTIPERIPHID2        0xFE8
>> -#define        CTIPERIPHID3        0xFEC
>> -#define        CTIPCELLID0        0xFF0
>> -#define        CTIPCELLID1        0xFF4
>> -#define        CTIPCELLID2        0xFF8
>> -#define        CTIPCELLID3        0xFFC
>> -
>> -/* The below are from section 3.6.4 of
>> - * CoreSight v1.0 Architecture Specification
>> - */
>> -#define        LOCKACCESS        0xFB0
>> -#define        LOCKSTATUS        0xFB4
>> -
>> -/**
>> - * struct cti - cross trigger interface struct
>> - * @base: mapped virtual address for the cti base
>> - * @irq: irq number for the cti
>> - * @trig_out_for_irq: triger out number which will cause
>> - *    the @irq happen
>> - *
>> - * cti struct used to operate cti registers.
>> - */
>> -struct cti {
>> -    void __iomem *base;
>> -    int irq;
>> -    int trig_out_for_irq;
>> -};
>> -
>> -/**
>> - * cti_init - initialize the cti instance
>> - * @cti: cti instance
>> - * @base: mapped virtual address for the cti base
>> - * @irq: irq number for the cti
>> - * @trig_out: triger out number which will cause
>> - *    the @irq happen
>> - *
>> - * called by machine code to pass the board dependent
>> - * @base, @irq and @trig_out to cti.
>> - */
>> -static inline void cti_init(struct cti *cti,
>> -    void __iomem *base, int irq, int trig_out)
>> -{
>> -    cti->base = base;
>> -    cti->irq  = irq;
>> -    cti->trig_out_for_irq = trig_out;
>> -}
>> -
>> -/**
>> - * cti_map_trigger - use the @chan to map @trig_in to @trig_out
>> - * @cti: cti instance
>> - * @trig_in: trigger in number
>> - * @trig_out: trigger out number
>> - * @channel: channel number
>> - *
>> - * This function maps one trigger in of @trig_in to one trigger
>> - * out of @trig_out using the channel @chan.
>> - */
>> -static inline void cti_map_trigger(struct cti *cti,
>> -    int trig_in, int trig_out, int chan)
>> -{
>> -    void __iomem *base = cti->base;
>> -    unsigned long val;
>> -
>> -    val = __raw_readl(base + CTIINEN + trig_in * 4);
>> -    val |= BIT(chan);
>> -    __raw_writel(val, base + CTIINEN + trig_in * 4);
>> -
>> -    val = __raw_readl(base + CTIOUTEN + trig_out * 4);
>> -    val |= BIT(chan);
>> -    __raw_writel(val, base + CTIOUTEN + trig_out * 4);
>> -}
>> -
>> -/**
>> - * cti_enable - enable the cti module
>> - * @cti: cti instance
>> - *
>> - * enable the cti module
>> - */
>> -static inline void cti_enable(struct cti *cti)
>> -{
>> -    __raw_writel(0x1, cti->base + CTICONTROL);
>> -}
>> -
>> -/**
>> - * cti_disable - disable the cti module
>> - * @cti: cti instance
>> - *
>> - * enable the cti module
>> - */
>> -static inline void cti_disable(struct cti *cti)
>> -{
>> -    __raw_writel(0, cti->base + CTICONTROL);
>> -}
>> -
>> -/**
>> - * cti_irq_ack - clear the cti irq
>> - * @cti: cti instance
>> - *
>> - * clear the cti irq
>> - */
>> -static inline void cti_irq_ack(struct cti *cti)
>> -{
>> -    void __iomem *base = cti->base;
>> -    unsigned long val;
>> -
>> -    val = __raw_readl(base + CTIINTACK);
>> -    val |= BIT(cti->trig_out_for_irq);
>> -    __raw_writel(val, base + CTIINTACK);
>> -}
>> -
>> -/**
>> - * cti_unlock - unlock cti module
>> - * @cti: cti instance
>> - *
>> - * unlock the cti module, or else any writes to the cti
>> - * module is not allowed.
>> - */
>> -static inline void cti_unlock(struct cti *cti)
>> -{
>> -    __raw_writel(CS_LAR_KEY, cti->base + LOCKACCESS);
>> -}
>> -
>> -/**
>> - * cti_lock - lock cti module
>> - * @cti: cti instance
>> - *
>> - * lock the cti module, so any writes to the cti
>> - * module will be not allowed.
>> - */
>> -static inline void cti_lock(struct cti *cti)
>> -{
>> -    __raw_writel(~CS_LAR_KEY, cti->base + LOCKACCESS);
>> -}
>> -#endif
> 



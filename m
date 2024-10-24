Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9443BCE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkOz8Jxgm0wsoBoSFzJGcolz7R2ukckRTZ05Koqm5kU=; b=nUXtCMrzutxzcu7JtimGov+ufG
	pv0CN0VyflTFGu6mSUJM7MJCoYsyk83ioZxWNkRziLPLRZUfU8a/HHG8ojDRCpVJng6Rsgu3RvWgL
	mOfo4bWEz43b/jZrdvYzaDFAaimME3dTOeE3rUdvdPFa0irzvC2BmX4dyiXxirOtVlOjOxBqtUpK6
	udulM2kT3gVMRfWPtjhcgt/tVFS72dqZ9CQOoJsyObVkSiTCA2d4SB5QRxxGaXlYrhf/GqE/PJZmZ
	EJztpOU28a2s/qJWWMWPER6xPjYxp0pjOH66DJoq4mxgz3+Q6B5diBvz5l8UboHommkNgbHlUbG0X
	T/3fv5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40WO-000000013nK-1wLw;
	Thu, 24 Oct 2024 16:17:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40Uo-000000013Vl-1tqs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:15:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-207115e3056so9053765ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729786534; x=1730391334; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DkOz8Jxgm0wsoBoSFzJGcolz7R2ukckRTZ05Koqm5kU=;
        b=cDFX4eMG6Z4PVMSHEqiupLzlLtJnQYWt049uIshEuZBeS8DR69BQfQHq0zGl7ng+Ah
         nGnk7PqptGWF/iPssb55TRVegiMopiswTl96MY605hiqZTP0ZPq5I34bXqJEBE9HJDlZ
         VgZC7TuvVw9P4uvQsl35IBi/nFPh1eWsdHE2ZSCUPF5tyokh65uFSkaY0Gh3OQWqqu+T
         hCOXTf9W6OTggoBKH5MtQNGvN8r4bMpCUmAInsc/ML0u7RQ+awiJH8pYbAucyZKkNCqA
         9deDg0jtrYrnEOwNjq4T4PPtXyLaVBFKC5Flebi22ddH5GfH4Xs9j6RZrI0AJANe8Twt
         dqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729786534; x=1730391334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkOz8Jxgm0wsoBoSFzJGcolz7R2ukckRTZ05Koqm5kU=;
        b=aoeZFUWpDuyq4jn7bQRJOHOepmAf1QD9R3iC17IfDEEbgZgCwxkiIR83TOB5K2fx1q
         Ms38egEpsvvRxMtoh6xV1u3IlVaNy8voaaJMqaiTgNJaWZeClmsy+O1acsvY10bVgKta
         50H0MHcGQGn0GSnCPWl42RQhZoIWXJVjdt2I01vqRe3pZma5ZELZGLwHxmLi3G9xfjCH
         ifrY6cSpX0v/b331bMZhJUD6utkHkwBdkSz874SoGpkD5R2yd8aiT11crWm9T1qvywH9
         dDpF4w6O+P7qMiYOUhk2cdshtEUqUhnTaF2McklEzv8D93OCMvE5Hkm4I3r5gzH4bj7+
         q8lA==
X-Forwarded-Encrypted: i=1; AJvYcCVoO8IZ0oNkUhVuwMTWou+SUVYxPUJMT7lIFrNOqP6lekBuakC+tZAGmH/aCveHcGJBJ5DzngJVeEhXWMXmx/0a@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg1axaXiRYerp2QEzDVoeOQPZt+Ag/PYXqulGWuWslpioo5w/i
	FtdHhVShnGMgywW0EIx6nGJWKkSf09xrOQa+X1ClGH8BhOhFfGlh
X-Google-Smtp-Source: AGHT+IFheouIyfOd1dj6PbeUjc9r7YCvmEYlqOWLvj8MFqWN9hKdgbbc84zpm/qdNBMTt9Oi9KJuyg==
X-Received: by 2002:a17:903:18b:b0:20c:7a0b:74a5 with SMTP id d9443c01a7336-20fb9aa1f88mr25585195ad.39.1729786532844;
        Thu, 24 Oct 2024 09:15:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee62c2sm74239025ad.20.2024.10.24.09.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 09:15:32 -0700 (PDT)
Message-ID: <61a622bd-7597-45e2-96d9-9cba02fba407@roeck-us.net>
Date: Thu, 24 Oct 2024 09:15:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Ivan Epifanov <isage.dna@gmail.com>
Cc: torvalds@linux-foundation.org, aospan@netup.ru,
 conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com,
 geert@linux-m68k.org, gregkh@linuxfoundation.org,
 hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, jeffbai@aosc.io,
 kexybiscuit@aosc.io, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, mattst88@gmail.com,
 netdev@vger.kernel.org, nikita@trvn.ru, ntb@lists.linux.dev,
 patches@lists.linux.dev, richard.henderson@linaro.org, s.shtylyov@omp.ru,
 serjk@netup.ru, shc_work@mail.ru, torvic9@mailbox.org,
 tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, wangyuli@uniontech.com,
 wsa+renesas@sang-engineering.com, xeb@mail.ru
References: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <20241024095708.189649-1-isage.dna@gmail.com>
 <Zxpqnf1M8rPTB4DN@black.fi.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Zxpqnf1M8rPTB4DN@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_091534_625804_E6BE700F 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

On 10/24/24 08:41, Andy Shevchenko wrote:
> On Thu, Oct 24, 2024 at 12:57:08PM +0300, Ivan Epifanov wrote:
>>
>>> I'm Finnish. Did you think I'd be *supporting* Russian
>>> aggression? Apparently it's not just lack of real news, it's lack of
>>> history knowledge too.
>>
>> As an avid history lover, you've seem to forgot, that Finland fought on Nazi side.
>> So yeah, we're well aware you don't like Russians, unless they're in concentration camps.
>> Which is exactly what you do now: segragate, based on nationality. Strip of credits and names.
>> Once a nazi - always a nazi. So, fuck you.
> 
> $ git log --author="isage.dna@gmail.com"
> (no results given)
> 

I really don't want to get involved, but this misinformation really goes too far.

https://en.wikipedia.org/wiki/Finland_in_World_War_II

provides context. And it does sound familiar. Turns out the Finnish defended
themselves against invasion from the Soviet Union. Sounds familiar ? Guess it's
the same as those alleged Nazis in Ukraine nowadays.

Guenter



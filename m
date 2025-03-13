Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB454C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 21:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBuMvSWKrj6vDaWbSVnQynse1bN77KOct+TmAZuqGnQ=; b=J7ACRGWnAQSzXVNCfUA8oTI3nD
	7SmOpZZYGDttGFHCOnoCrLgWiK9uV3/YPVKqIrUe7nk1Kg/eVk/BYBBGouRaYacIO9HOVX87oE93V
	cfgP3Ja3x/W52xM307Sd9pVfaEpyLw+5NMQBunGY/MfFSRg65aS1R444Lgf1igSwf4L1zBSFilEXr
	6MvPw+98QLBC6l7XBqIQSf+lJRhul4yOfalITJM37Rf5ZWRmH2pMZDu3sNJSJMkRMbxpsP6jmb8QY
	oGQ7kG5EseoUCS+7C+RPcCPXYsETe2HB1YgADi7oJ+g54QsKaG6zLaHoEmV0yuGCWAlmRQ6FGjmLN
	8+4/sk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tspxm-0000000CW17-3XWu;
	Thu, 13 Mar 2025 21:19:34 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tspw6-0000000CVqs-3Dfx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 21:17:52 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-72726025fa5so379268a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 14:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741900669; x=1742505469; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBuMvSWKrj6vDaWbSVnQynse1bN77KOct+TmAZuqGnQ=;
        b=KFPm0EGc/cLs1mj2xQuiaDe/sKG7azwYhW9lGgFiH0h7SnnJn2Uwc9NYhD/PVOJebI
         hHP3lWqkm1tsau5aIIuQDrajhvazhbcpQFt51E996bRJ2m9hiArp24gibcyo7sjSbM7a
         99GjOuo8jIg0eLBYppGihwrPKRMGY1bDp3NbH8drgWq4vdxT6k4ZVf8jal9AN9NvSstP
         3ZQ3bDQpha2W9GdUQUBoPqJHFsXNbZziuRAk/6S1NtUQPQbsf7QUcIwkpzg9uBtrz7mf
         OqUaXNPyiTsVJLETrc8wSZs9z6ZywAQujZJ8iLfd5JDSLbqE6638kJVWLBG3FFheTUen
         a1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741900669; x=1742505469;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBuMvSWKrj6vDaWbSVnQynse1bN77KOct+TmAZuqGnQ=;
        b=QKgl/kHCdSN0lYBL3tYfIz59eFUGYw6TjRrV2Nba1E+CwFo27TSfCUce9LNlxvl3C5
         CNA+j3X1Sc8yotNgpUXrOBiS8kVpm9n/KLDQqxk4epfLujVRufhy7ppJxPKxuVSeaNzk
         wsymL5yZfWONRS63P2a356Ma2g1eHe1lNPG85WDd3WVzmIgr65h2DYv6y8+yfy+AF1Rm
         I1/nkQnPnVb31byx+m7U19VddTFeGFmoPOYZC/lh6RPRsaGF819pvIw2EztDFioBV97X
         +ZpmEZylXGd8yyZN+jAhj8gxKiSNU5Gwt0o/SUXn1q7WfPxVt6UseqWh3X93MiMrUjKI
         YSDA==
X-Forwarded-Encrypted: i=1; AJvYcCVmkKkZLzNrDGa7yVs5ctXEulBfid1r0ztSHjtljuCpJVm32K1iWnuJPZnZXuMNFkxv40WDkjbGT16r+R97HvQX@lists.infradead.org
X-Gm-Message-State: AOJu0YwRNO2xV4x2wrwYOErXVuSUtTV34YT+RKyhlLmMZjPBaNsJbvda
	HXhQVFNa6BIOUpXKq71MIyhDIyDNnfDHVgSn3ycyKekW8PY1AXuojyi7/r2447Q=
X-Gm-Gg: ASbGnctWxKRvmSWnKr37i58rnC4TgpbxM7n0kMQvmO0F5HgfCe/69pJ5ISR1rvZhbsC
	ftsE/ZVf4IFAK5+ao4YomqLXm7t13EKJ+UGs54852425jUJTRB+TpbGJDKEugQfIVNujIYS3SzK
	wF2PxHxZ3QqoRyR/Y2yMqeO7/BkS5TlaV5NEUA5TvvtgF8wlf8gHVTacN2onWkY/JSpi1nEOBDi
	QjJZHqb1bXzOslBFxEu8cDBmxjePDPC2tBhJ1MK+4l06dHZtEdDKam7b8+EQMwTz0HG6By4oD+P
	cI+RakFUeiIVIPzi/GeZy3vQUDw3zhivd+HlLu3ajl+K300RWGe+nlCXUajqSK8z7QEWZzj5rJu
	gAMC+Rw==
X-Google-Smtp-Source: AGHT+IFXmac6Zno1e8gIT1+e4oFU8bsJfG4bD93al3kFBt3DuzLabzwqDobbA9nezeqb4ONGDiWQcA==
X-Received: by 2002:a05:6830:64c7:b0:72a:1ecc:d23a with SMTP id 46e09a7af769-72bb95ef063mr821303a34.15.1741900668987;
        Thu, 13 Mar 2025 14:17:48 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c670f77a5bsm479504fac.9.2025.03.13.14.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 14:17:47 -0700 (PDT)
Message-ID: <4866908a-2e93-4d19-aef3-5203e002a8cf@baylibre.com>
Date: Thu, 13 Mar 2025 16:17:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: davinci: da850: fix selecting ARCH_DAVINCI_DA8XX
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240401-da850-fix-select-da8xx-v1-1-a348ab91448f@baylibre.com>
 <CAMRc=Mc7Xa58J55_kenkr2OA=ho6YH_gENOFEvAiA+q+p54dDQ@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAMRc=Mc7Xa58J55_kenkr2OA=ho6YH_gENOFEvAiA+q+p54dDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_141751_000412_E0EB84C4 
X-CRM114-Status: GOOD (  13.46  )
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

On 4/2/24 3:47 AM, Bartosz Golaszewski wrote:
> On Mon, Apr 1, 2024 at 5:10 PM David Lechner <dlechner@baylibre.com> wrote:
>>
>> Chips in the DA850 family need to have ARCH_DAVINCI_DA8XX to be selected
>> in order to enable some peripheral drivers.
>>
>> This was accidentally removed in a previous commit.
>>
>> Fixes: dec85a95167a ("ARM: davinci: clean up platform support")
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  arch/arm/mach-davinci/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfig
>> index 2a8a9fe46586..3fa15f342240 100644
>> --- a/arch/arm/mach-davinci/Kconfig
>> +++ b/arch/arm/mach-davinci/Kconfig
>> @@ -27,6 +27,7 @@ config ARCH_DAVINCI_DA830
>>
>>  config ARCH_DAVINCI_DA850
>>         bool "DA850/OMAP-L138/AM18x based system"
>> +       select ARCH_DAVINCI_DA8XX
>>         select DAVINCI_CP_INTC
>>
>>  config ARCH_DAVINCI_DA8XX
>>
>> ---
>> base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
>> change-id: 20240401-da850-fix-select-da8xx-989725eec11f
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Bartosz, here's an old one that never got picked up and I never got around
to resending. Can you pick it up along with the other davinci stuff you are
doing this cycle?


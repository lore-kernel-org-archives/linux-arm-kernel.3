Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7212C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArCMIs8cHMmaU6eRMIXZBua41omBX5hUlQZNBFR+A9w=; b=IDN6irrsn3UKV+Ost0WUUJ0Fcn
	3iYLf/95MiUEo3rQNQIEujnNF1TtTc7cOwsC/6Y129kz2bzQOOhN6KxX6/70qvjrAfk1giPHxU3xp
	YMQ4A5+ZwiIzD3hCQ+ytaKJhXJVONrUw8MXi2ZY38tR12rdz8ygWJACnBMEetyp6z/+9FLHOE89M2
	G2LlrMGeXvJO/K9esTytBcIsAuQbvXN8VB5Pi5qdbb9EzUHYzq7XQFGYhqBd12ZY9p0ZBSk8BlEj7
	FNJ8l0d5QHuvblJ47QkG9BV28b9bJxdGyBXEd6rXfgPjPvz3uXhviCQr9X09AD/03Sdq94YiiNZU+
	+F3pMzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvi3-00000000S27-0m45;
	Mon, 21 Jul 2025 18:57:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduvU-00000000OOd-139p;
	Mon, 21 Jul 2025 18:07:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45610582d07so36502505e9.0;
        Mon, 21 Jul 2025 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121266; x=1753726066; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArCMIs8cHMmaU6eRMIXZBua41omBX5hUlQZNBFR+A9w=;
        b=ARjzpdUsp9Ur4PG6J5saKIl4T6gzL2tI/AAPLtemMxsYMjgUpAPf0ULiWj/bk8phck
         vQzjEfs8dISX2GWlZP+0D1BBxvAf9RisttEcYLa75mKnbz2MW92YvQ2ksQ6XdH+orm6m
         EK6EGDKo3Fhb6cOCZmeqJRYogEXX9xgyg8RjPmdpi1bnOSXZfjuMVMbTkTBVDCdH/CTO
         Nw32yte5ZcLCkH4O/jVC1WZBF8EReXwFFWe0YLnCqedQk0c2K3EHPwwuN5ogmjAjCBdO
         L+zGPfCli+T3KOhSRdgm63rY2CbdyUr3rWpSd+6EnASptDODigid0Bo2cRfe5oSgG5hU
         BEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121266; x=1753726066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArCMIs8cHMmaU6eRMIXZBua41omBX5hUlQZNBFR+A9w=;
        b=BW/WHwr1axqPvjb3uc2HMvAqQ+PqiwvaFdvouqVot+fxkuGPfR0HetNU/NXGDJrm2E
         EPcUZDvAzkEgfB0GCmt+AwLESKPWebPggmPMnkDKACnhn/+KGelIZLXrm2N+xoRjpt5y
         rd2YwMjJmI7WoU38R4VWXEYWduuZUyXbe5ohaf9ObL+SgUwSGrwgsRE2l2hDMZQE+Kcb
         7QHjIsfB9dIBxwvT+mLOUg/Hjf/bH/ZyZAFoXop6CQ7wmZHCXTyi4wrpr9yhpxZ6Kz01
         3HtwMIuptwFK2Gr5E4ms+tWqugkm3y+6BCJGoKBMspnWcmms2jzUOh5YNFV0KXYJvM02
         YOPg==
X-Forwarded-Encrypted: i=1; AJvYcCWXNS3m3jNfbmQ+H/copCP1xdhM/jtYR5Ycr1f5yYNd0GbeMxY6Ft2kg1lEGdf9Q5iZJ/IWYkJnpeDPpsuyYck=@lists.infradead.org, AJvYcCWhu7zMTasZptfyiWoA1sY1PBMigFt3DDJ0pWDLmAyZbxe5GN+Tm6Ii4Pxl0ZFO7yk3mbyfwHSZ+QxIvqxX5BXa@lists.infradead.org
X-Gm-Message-State: AOJu0YyI0aYJj6V8ZkGLqUhN8DVhgmP46qr4QGhcsU3pDcRZ19Ki++J+
	j6NR01g+5QymN0A6nBSQtuzYpkFNctRkY5K3qfVSPTBVy5NeGh8wcPU=
X-Gm-Gg: ASbGncvg4zgaJjB6Pxxn9HasAuQYu8qryckrIaZUgXoTAv7Pz/h2+/znJwSBDwnBDO+
	mnqwGpMldOPXwqEmSGWrI5Dnb22mOfquLYOt1F3xUTNOdxnpaSJQxqmud61Zch4W64lCifcjNei
	SDPQz/mIUr1sjAdovXXjkaJcPGHNY0fqGNqg3K4TU8eX7KHvawWgSv/G2iEl18tstPkvYSknBEp
	GOU3d1GWoNotHFfC1c/1YvOi1gr88NmgnIDRGbKIV95M5k8wW0cWcIUqQQ+USVT3TkdyDbemT3V
	aE0zP7RflQVMdiS3HhJ58g+NoT1zR9s3eeBiQot06YFdPDCXnJNQi4wPmEQx+D95jARn484LZhB
	j2Py4TFg8U2McEVirB0/Sz+v1766dsxGqORyo4I29thn/h5UdSAizvMxRWUcjx+s=
X-Google-Smtp-Source: AGHT+IGcDPzV6KQjobcMBQcBoKbIIcGU6ckQH+xCZ1tWbwJRYmX8A1xwQRCZIhBoNEVRk2XrDOitug==
X-Received: by 2002:a05:6000:481a:b0:3a4:e2d8:75e2 with SMTP id ffacd0b85a97d-3b613eaae20mr11933859f8f.50.1753121266097;
        Mon, 21 Jul 2025 11:07:46 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:e3:9af7:6c0e:f2a1? ([2a02:810b:f13:8500:e3:9af7:6c0e:f2a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e886286sm171024705e9.26.2025.07.21.11.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 11:07:45 -0700 (PDT)
Message-ID: <6d93c92d-2bba-4247-960d-5f2e5e12b594@gmail.com>
Date: Mon, 21 Jul 2025 20:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, ziyao@disroot.org
References: <3c83e8cc-9ef0-4560-b6d7-127abab50541@gmail.com>
 <20250721140016.308800-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250721140016.308800-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_110748_292496_0A0E22EC 
X-CRM114-Status: GOOD (  17.19  )
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


Am 21.07.25 um 16:00 schrieb Chukun Pan:
> Hi,
>
>> I'm not sure where you are getting your information from, but as I told
>> before I actually *own* this board in the non-development version and it
>> has an RK3528 SoC/silkscreen - I just was too lazy to photograph it my own
>> but I did now [0]
> I have the MangoPi M28S, M28K and M28C boards.
> The M28K board does have a silkscreen of RK3528A. [2]
Nope.

Are you really questioning my picture? Ridiculous ... see [0]
> Regardless of whether the silkscreen is RK3528 or RK3528A,
> U-Boot reports that the SoC on these boards is RK3528A. (via OTP [1])
> So one possibility is that Rockchip forgot to update the silkscreen.
>
> Comparison chip block diagram:
> 1. Earlier version: https://docs.armsom.org/img/sige/rk3528.png
> 2. Final   version: https://docs.radxa.com/img/e/e20c/radxa-e20c-chip-diagram.webp
>
> The difference seems to be that RK3528 uses I2S while RK3528A uses SAI.
> But from the updated diagram here [3], RK3528 also uses the SAI interface.
>
> Rockchip BSP does not make any distinction between RK3528 and RK3528A,
> so it is meaningless to continue to worry about non-A versions.
I'm sort of impressed on with which conviction you continue to claim plain
wrong things: [1], [2], [3].
I'm fine if upstream decides not to care. But it is and remains wrong to
claim that the other version does not exist - otherwise I doubt Rockchip
would have gone to the trouble of building the distinction into their SDK
AND publishing different datasheets.

[0] https://wikidevi.wi-cat.ru/MangoPi_M28K

[1] https://github.com/HermanChen/mpp/blob/develop/osal/mpp_soc.c#L957-L982

[2] 
https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/soc/rockchip/rockchip-cpuinfo.c#L212-L218

[3] 
https://github.com/rockchip-linux/u-boot/commit/89e1f532de7747d2e962644330666fb1b465926b

> [1] https://github.com/u-boot/u-boot/blob/master/arch/arm/mach-rockchip/rk3528/rk3528.c#L131
> [2] https://x.com/mangopi_sbc/status/1847851624804602316?t=5hwScxgwCAAid0eCJgrP5w&s=19
> [3] https://x.com/mangopi_sbc/status/1785115827437760769?t=H5PXRDwbjOfBYa7QotjIZw&s=19
>
> --
> 2.25.1
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDC8C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u7TJ9tgwm2KnuZFSYIca8LwnX5gbxqDtxG2LPSH6i0=; b=yl3kby2xmU7nMQfMaOtCSuMhSe
	MacfpDIb44BhZ5GYiKcw6saUuIM3xnVzT//cXqP2djoDPi0k6uAvv/gIYT/EjjAO4VSc3krQo4xnq
	2XKXH0nMMrjS3FnZzUpzpWfah6u9wEqW7YZFXMdj53WnnqEy9hcYxWuxmdzHPG8DhqVEezj/hcits
	xrrE8oqw1xTEMD14w8LINzY8j/5qUqIrvimYBCIdL/flhRlboY7hvNcH+XbvKxiGSOgx32XbCvo0u
	1MPQeyiQPm3yk93gfXgcG4W2mJu+DI2w0CxzeZMPWtSrrL7m5d6IwTRm5RMSqz0+oIlQiQVSkh5Hl
	1zZENkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jf3-0000000FAD0-3ump;
	Thu, 10 Sep 2026 18:38:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jf2-0000000FACt-2gO3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 18:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9u7TJ9tgwm2KnuZFSYIca8LwnX5gbxqDtxG2LPSH6i0=; b=AqRtpd7DfUPWkGiOm5EHTOveCv
	epsuOuX2aOqg55/PsEKXJrQmRmJE7RugeC6sUnOwXfzZg5nRCpTXiY6g2VOnVlgkSTHR1RhBU9YwV
	w5G802L5x7uM1kck1PcjWt1lTzS6LfEA2lyhYV+xQMNhN/NfAlM7vApDShUPGrqNC1r6s7kXmIBRx
	dPy2z/4z5ytovGjdCMcdS99hUrGhm5MUXYZtwPHR2YEirQEeU9FE1/3poTNNgIkDNSpaT24yQC8Ef
	fFF1q5fJyZ+BkLPzVZ9yFjDb/nzAu7swN73oWepYb0pdArmI9OXDGL/VcWKL++X/mAxgXLiqDueZ0
	Ea1v/juA==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4jez-00000002rdA-0pbV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:38:11 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-381b831d535so102534a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065487; x=1789670287; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9u7TJ9tgwm2KnuZFSYIca8LwnX5gbxqDtxG2LPSH6i0=;
        b=EslifGTcRDjjfavrZeX8GKfGTPmAK5qrLDTFHdMko89WqH0RaekBF4Nxr7vkUdb21X
         CnT8ovebG5xiK7B/Np4O1P2s9v09VOULg7NGd7dQsepCIka6ti5O/h40hvLhSfbItGdF
         l24SDfemCoYoo/lYRjtQvwVTj9VUynCtQmaTLd4p53lZ+2qfZ8hcvluQqgPHOJ3UtDtM
         2DKVGBqugdQ+X+FcheNpoP6veL/XQ5ScpskC7jDTLqIeU1ffsqUWUkXIiinE1L9vQMHy
         n3KQkcZ6K7YzUDfr2453BX3Bih/YHRCPxrrCU9cKWeKbgq2nx7569XErGxjwTjF8YB8M
         VnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065487; x=1789670287;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9u7TJ9tgwm2KnuZFSYIca8LwnX5gbxqDtxG2LPSH6i0=;
        b=ZtCxEnIDwWBNdynB0FdoGfhTlKuhU+XRqKJqNO7UY0JeubcAp+zfw+UFDecPrLtuni
         oku2zQDANXSNgWPiNyyQyp1GevQICFgWgwjDI//uk55qOVBJrkFeFVo+tzOWmlIFRVut
         dB38I5CKXZePwxKRfU4SF43/OdEr16Z4/ipKs5Rg3Mr31oyTWZoGpoPHrTvn2e22Pc8H
         F2FZP9q2OixMShF5vfdHrHj/HWGNee0ZleTW9KQtXPVTQPRNcueatc5ZzY6Mq8XQXSNg
         2sWbBhKUcIo0hWaXRAS5umZ9gO0vFZ5aWpmach4TGua1w4QKKOjKKgWfBsKlaNkiDoLj
         QsTA==
X-Forwarded-Encrypted: i=1; AKwUvBwcvEDGOZUR+45y0dSm2U/oyHo+gD68CD/4kIuQOByFNTlCpMEiXrechbs5ifUr3Re90Ftpk6bcK27XTt0O0q/w@lists.infradead.org
X-Gm-Message-State: AFuF++mw2et/qwCGU5zw0a1pef0aJCDTy2f5dCEcSJ/z9XG8iR2h/4Cg
	qXLdqmnSc4c7sNKGspYclYyAqIEg9IoDrg0CWZ1cJ19fb1TBvPFUUCd8
X-Gm-Gg: AYBFou1RTthmP5wM6IFCyAM5YCb3JxRv7/MTKHts2BauQ5HsR5Da+OXbZ/kRHqbel1H
	OPaB5WRoWeCty/Pnz+it5CP4X2UiTLUgwS7nLlpHbz9AshUdvsMw4JOuYNKkzCH6hmzJ/mCQn3u
	/qJpv/vUrar8Y/pfga4Hj5TzWrH7DV4xBk1Ix4NYxyiyYuY51OgmR9kxrpu23JPrFYf+BWGXB5X
	JnEirb1n9/VQmqPdU8LETyR/AsSrZyzmkjd/W96QiwTbvfM9KZFaZK28fSNg8ay2UhgosuuvmJh
	M6hfolECyWZ6SC+WhlyUFi2Y6S7GbMzZqC9vg0ZyV6su8DxgDibYrTdX3C8L/I9XbR29qKmGTgz
	WtLGfbrwYvrit1TR2imi4/letVWy2Tq0ZQ8N1UqLovGpLmxmX47bwdTOp0NYqtgZ4yH/v4pXDBp
	3OWSngMDZS+eIaFgId78Vs9+5/GCj4VoktTjuC6fwp3nxVdqKLHXgQPAA644x3jqTAdgWFfhCSr
	syC1l70YO68xkft/1Tx8ZnHSnBDfsm4VJ4O390N7bJBY9Dk
X-Received: by 2002:a17:90b:35d2:b0:39d:8d38:8b04 with SMTP id 98e67ed59e1d1-39d9bbea1d3mr52593a91.1.1789065486698;
        Thu, 10 Sep 2026 11:38:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95752809sm851731a91.13.2026.09.10.11.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 11:38:06 -0700 (PDT)
Message-ID: <7a92a79e-e22a-4e34-9f11-4086b88f62cc@roeck-us.net>
Date: Thu, 10 Sep 2026 11:38:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] mfd: remove unused aat2870 driver
To: Arnd Bergmann <arnd@arndb.de>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Helge Deller <deller@gmx.de>, devicetree@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 dri-devel@lists.freedesktop.org, Jonathan Cameron <jic23@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab@kernel.org>, mfd@lists.linux.dev,
 Michael Hennerich <michael.hennerich@analog.com>,
 patches@opensource.cirrus.com, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>
References: <CAPVz0n0ryOns2sCJE_jFana9MVzwEj1QZuPEa8FNhGbHXnMB+A@mail.gmail.com>
 <11652e5e-053e-45b0-98a0-0c1cb2aeedc4@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <11652e5e-053e-45b0-98a0-0c1cb2aeedc4@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_193809_391069_4938C3C3 
X-CRM114-Status: GOOD (  21.51  )
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

On 9/10/26 11:14, Arnd Bergmann wrote:
> On Thu, Sep 10, 2026, at 18:40, Svyatoslav Ryhel wrote:
>> __
>> Hello Arnd! May you please spare AAT2870 from being removed? I have a
>> device which uses aat2870 (LG Optimus 2X P990 Tegra 2, not upstreamed
>> yet, but in process as well) and atm I am working on converting this
>> driver to use OF. Thank you!
> 
> Sure, I have removed this patch from my series now.
> 
>> P. S. If you are planning to remove more old drivers, please CC me in
>> since I may be interested in some additional driver upgrades for
>> devices I own.
> 
> Please have a look at
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove-7.3
> 
> I tried to be careful about figuring out exactly which drivers are
> unused, but I'm sure there are still a few false positive and false
> negative ones in there. I've added the current list of driver files below,
> let me know if you see something that shouldn't be there.
> 
>       Arnd
> 
...
> drivers/hwmon/ds620.c
> drivers/hwmon/f75375s.c
> drivers/hwmon/max1111.c
> drivers/hwmon/max197.c

I missed the rationale for removing those, but then I don't really
mind either. I guess we'll hear if someone still uses any of those
drivers/chips.

Guenter



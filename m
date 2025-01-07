Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC3AE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 00:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13VUHaFiuc4bXuLa2863YA1rYhMMosunQcKMEn7ZyfQ=; b=JFM7/SJBDkiBNYvhcMRH6x0H8+
	zaKYCXOa1J+cIr51JrK6exXywkvKRDPpQ2H1AzxPASCAGfW6KzU3VNld5TEVNWeSSsiCcAgq9tHJk
	Xvobl0u+zP4rc0RszMD6tkDxgLcZvy0oMy/w7GXjbhYBoZvAh/admbrKy4/TTaa52AnaWH3No6oYk
	CtnU+/Ko9qGWT65YosyFO0ttLzlJPQDSWs9j+rkcOxz0IbV1Sb5h6E+ymmAmFXTYLMtg/8EM/b5zG
	BOZh6wjaAfxSMc+AgXqxDrOdyixNk75r6o9jemgRWvE0KS2sz6RXICIqlz3IgK35sv8I9G42j7tzL
	jV+rR7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxXD-0000000332e-35vy;
	Tue, 07 Jan 2025 00:33:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxUy-000000032kT-1jIG;
	Tue, 07 Jan 2025 00:31:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436249df846so103628095e9.3;
        Mon, 06 Jan 2025 16:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736209866; x=1736814666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13VUHaFiuc4bXuLa2863YA1rYhMMosunQcKMEn7ZyfQ=;
        b=TvEpb2KRvIZgY1UhM7oXhK5d0KjpRvp2LHFjUAg5PlLFn4WYj9+gCG/t/Y0sNbbE7q
         eSnZ2wJUp0/vSklihvBeXM4hzk4AfvKXUye8CW3SyU6YKL6obWpYKoluYMS7WHNifZor
         reDstMiAo3qXEvr3bC6Hqn/Sv0cWw+ugXKkTr24dE6bPL4rIKJ424tgvBggXgwP3TQJ+
         KfYdo5aoj9gRmUeFpIdwlm68l9380RUrPuy+wXc1BX6UARmTFtBUz4Xk2DRCsOLt5k6x
         K9HS6Twt9puoRVGaQuA7IvNY6bmAxLtd3WyQvbmzoPCykksrE/otnhTHKHr9PUVm67FL
         gj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736209866; x=1736814666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13VUHaFiuc4bXuLa2863YA1rYhMMosunQcKMEn7ZyfQ=;
        b=rcjW14O8DqBjO8wF+TCaMiS95pMYZvRtP5i5QaYSCWio2nOwaoFvNl1zEA27o7xGh4
         KE97YP0qYLBvwWi7+0sNz9om77g4e4jwYVYirNHK6EgPvE45abJZdo+4toKSiuyI3EFe
         ssr2kWl6Ti39YYMM/KkhVxVqUrWTlBB4ltEg0t5hDL/zVJUzomxd31ey5d+qCebmavfZ
         FrBt0PkSpsi4+KBw8bIfBEtMDr/OOKv36Es17Ygd44HAzbxBvrNn3SinBTyXy0kIRxVi
         15DbMfZ8Wi+ytZTAHQUVnmNbhW8lA7mr6U+W3aHbBjrqRRR99vgJhQcjgczYgtYSj+F1
         umwA==
X-Forwarded-Encrypted: i=1; AJvYcCWMyNSZBB1xGeRrY4Q3h3AybPJfxqhyGoB1JXCHR4erJCjLWztCs1vrvwfv7FdG+NSRx6VHZrIEvkny@lists.infradead.org, AJvYcCXa+8lZTcCgw2Urpz5PscKO8ZH4HJwU1rmo0/SbqJCLU/bTlXMFQkl7cw1DFUgbJFFw4j6mNSss1hwsft+kkA72@lists.infradead.org
X-Gm-Message-State: AOJu0YwOdSTpPlfrC0CV33h7KflbvmCO1aM5zOQ2DpP3s+hJe+3fLxyC
	3C+3enRB4HIvsv2Gz7R0INJFUHSqpIjw+gkQAVJqCD1TR8rUwmo1
X-Gm-Gg: ASbGncuMtrx8hFT4zM7urinf8UC3qfZntWs7znYKHbw0AxSbokNiDMBXZUKhLl9DnBW
	SfJ+HW0jrQQxDNRdq3dIxvuuyYhhFKJ6DLEFV8mrmgeYqxPkNgVDB3QlA4buTowOOmqbuSOLCUu
	hYN5cGbgAgz0LkBHGpfv0u/6Jll/wiEQA6BJdRy2Zv8F+9BebD/WBP3Qr09x6AGl/e3oQTbFzmH
	x5i/NyBWd1EZY1vdcql30eZa20g3IXxCoqYV2RvJGsZ579DTsXCWGaOOAfDOVsJULppDUI/vCwO
	O8p7d+5afuxo8CJrWC+FQq4Acw==
X-Google-Smtp-Source: AGHT+IEjONcU9x6JlzHrNOCRfapdijI2K0K3jjBIXQvsC6vlMArfJXHA/sc0RSHKNgKkvauw85ENXQ==
X-Received: by 2002:a5d:6da1:0:b0:386:4a0c:fe17 with SMTP id ffacd0b85a97d-38a2220039fmr49166964f8f.27.1736209865801;
        Mon, 06 Jan 2025 16:31:05 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194? ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8471dcsm49320901f8f.48.2025.01.06.16.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 16:31:05 -0800 (PST)
Message-ID: <810af0b9-aa21-4f11-9708-92c870615cc8@gmail.com>
Date: Tue, 7 Jan 2025 01:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
To: Mark Brown <broonie@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
 <eec9caa0-0029-4774-842e-af1d1290ad97@sirena.org.uk>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <eec9caa0-0029-4774-842e-af1d1290ad97@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_163108_450176_0559692F 
X-CRM114-Status: GOOD (  11.78  )
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



Le 06/01/2025 à 14:08, Mark Brown a écrit :
> On Sun, Dec 29, 2024 at 12:32:39AM +0100, Raphael Gallais-Pou wrote:
>> Prevent the use of macros, and rely instead on kernel configuration for
>> power management.
>>
>> This series makes the same change over six different drivers:
>> usb-st-dwc3, sdhci-st, st-spi-fsm, ahci_st, sti-dwmac, spi-st.
> 
> Is there any actual interaction between these changes?  In general you
> shouldn't combine patches for multiple subsystems into a single series
> unless there's some dependency or other interaction since it just
> complicates management of the patches.

Hi,

No, there isn't apart from the fact that those are stm32 drivers. As 
Miquel also stated a few days ago, is was wrong for me to sent all of 
this in a whole serie. I will just resend them separately as a v2, 
taking into account Miquel's review[1] and the kernel robot.

Regards,
Raphaël


[1] https://lore.kernel.org/lkml/877c7ha77n.fsf@bootlin.com/


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E534FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANhml7M+MMMD3LKkNci+JpTEfPstAMQQQpY+9UHoOXg=; b=QSU+3ce+KF0qHKZ74dZICBueHL
	TPPKHY0ZcYRJy1BSzQUqJo/G1rkPA7v1ujdO0zRJ3C/JaflIf+t3q801QUpOYeaiOn0UPc7e4p5WK
	1kCpdiwgkrwFMuDz8U2HXwg0t7kaeG7+lmt+/KaV/o/P0LlvuEqhXMHoG7sYrQDuDguL/BvFGkIaV
	4tmV+fpkibcXjjkMFFcmlimIPsvqLjRgmJ7kDTFx47ZAw6HYcGcxMmLd1TCXXG8TN73ye/AIp5o5z
	bug0YpEVkNcLBwqpVJvB2mzAPM/5f2TVNqtbsYmbDewy0SeHEz3rxrOP6gFDfe8cT57tC0xhFNi36
	6ozseVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQYD-00000008Trv-1HGY;
	Thu, 30 Jan 2025 09:09:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQWt-00000008Tn9-3iHM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 09:08:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so260545f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 01:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738228086; x=1738832886; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ANhml7M+MMMD3LKkNci+JpTEfPstAMQQQpY+9UHoOXg=;
        b=buCYdTZb4H+P72pgYmhuAyanYsJx4Cf4afMO9rmzXsewMWpEzpbyxvOlWep4DT0rkm
         IzLWXWIgHLsePDdVRhBf/qjX75Ii0yqA8zikDXQHJKT4zhg0kFI36ypka0h+jiLIBwtN
         tF4TzIgL577XUM9b23KWS77zWJzbvELD+Wxy2tOXuis8dtLozim6kP1A81LHT4uwm0vH
         Xx0qvqq0ffrGw1MuMoyh5IhhwFkTRBzfRs6U+B5WSwr7MMML4JABDD3ZDt+ELxWCzyDe
         nhMm/ckqFzBzD4URrAp/NzGpCI4S4qK55bQ1u6hPW0m3o/LjkotZeY61WQqzH+xV6vTe
         bpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738228086; x=1738832886;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANhml7M+MMMD3LKkNci+JpTEfPstAMQQQpY+9UHoOXg=;
        b=Quppq6IPgolz5FPR7uLI8oQY7Ds6Do5YVY+TAb7dcKNJjpgRwGYs+fI9XyRSqPx0oL
         iFCnTucqFtM+AJW673oxpZFiWkr0Ej9WofrmAoJIEENG0Mr19dVVdhh97haTGKNjo/zF
         RCM1kPwS5h0v3evFzLZAgdpDuOF/Wa95ul7DntBJNb1SvvY/qK14yanSpRJPKdP78i2r
         X+iFzIuQQExcK2zJsACc/gqdTAIhXrlZ1dCYRzNnYv5zzGfEDsD6QPUufhL/hc3Z29D7
         5ofKMd67HWANfhTRqRKQucljnVx/sDfqchJ+rLWPNFtJtAHWPL9MubEZxmwM3GwZ572c
         EOKg==
X-Forwarded-Encrypted: i=1; AJvYcCWJpKMoAOMxcNMnyTBIok3ZpkqGN5j24L/elex85QjrIeu2gQy/b+EV2qLqxsZouY8h7suMqW4mJnDp6V1jx0lf@lists.infradead.org
X-Gm-Message-State: AOJu0YwBtdlte9FjYqLSZ9T3IbtfjZ3ibhIuX5g/O2wGZYywpF9YsF6/
	ABDvnH6qa+MdsWaEShGzKzFCkDUha08h9JlZ8bd0yW4DG5jf/1iuWlgrh6eAJ24=
X-Gm-Gg: ASbGncuqjSzc7PUv68h5yU0EaiTOTyx52iz7MaGfUe91UUCNJ/V3MxMttJxQNdWIKUS
	aIm8wIIeVbAekEOYaCmexGPICLOyvrL4YVzDN5/W5goJzAR8cy86jydEMQ99Iow6nSnEUxgbCPM
	QAWstYtw2Mi8UXQpQlwIK1xYk9/WIfxXCsJjCvZ1chQUtC9w2a3kJf/FPk8EGobOOBC1ioYHNSw
	s2ntNQx3f57A1pFERd6+87Ol6L/+DIsIZxi43W5UKDK9JKrmzVQn1BD15TLtxCFP4xbSax5elP9
	A1hES5P63ph5OqZYzNk9s+NO
X-Google-Smtp-Source: AGHT+IEjxgi6T0u+WBslXxqIsPByCV1IEbwLcjNUUJAJZf9hq5VGIBAWjwewMxDvT3YhfK7VwFb5eQ==
X-Received: by 2002:a5d:5f4c:0:b0:38a:4184:151c with SMTP id ffacd0b85a97d-38c519602e8mr4907671f8f.27.1738228085612;
        Thu, 30 Jan 2025 01:08:05 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102d2esm1368334f8f.33.2025.01.30.01.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:08:05 -0800 (PST)
Message-ID: <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
Date: Thu, 30 Jan 2025 11:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <Z5pkUNNvsWPjRQvy@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_010808_107040_0AF2BE76 
X-CRM114-Status: GOOD (  26.71  )
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

Hi, Daniel,

On 29.01.2025 19:24, Daniel Lezcano wrote:
> Hi Claudiu,
> 
> On Fri, Jan 03, 2025 at 06:38:01PM +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
>> clocks are managed through PM domains. These PM domains, registered on
>> behalf of the clock controller driver, are configured with
>> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
>> clocks are enabled/disabled using runtime PM APIs.
>>
>> During probe, devices are attached to the PM domain controlling their
>> clocks. Similarly, during removal, devices are detached from the PM domain.
>>
>> The detachment call stack is as follows:
>>
>> device_driver_detach() ->
>>   device_release_driver_internal() ->
>>     __device_release_driver() ->
>>       device_remove() ->
>>         platform_remove() ->
>> 	  dev_pm_domain_detach()
>>
>> In the upcoming Renesas RZ/G3S thermal driver, the
>> struct thermal_zone_device_ops::change_mode API is implemented to
>> start/stop the thermal sensor unit. Register settings are updated within
>> the change_mode API.
>>
>> In case devres helpers are used for thermal zone register/unregister the
>> struct thermal_zone_device_ops::change_mode API is invoked when the
>> driver is unbound. The identified call stack is as follows:
>>
>> device_driver_detach() ->
>>   device_release_driver_internal() ->
>>     device_unbind_cleanup() ->
>>       devres_release_all() ->
>>         devm_thermal_of_zone_release() ->
>> 	  thermal_zone_device_disable() ->
>> 	    thermal_zone_device_set_mode() ->
>> 	      rzg3s_thermal_change_mode()
>>
>> The device_unbind_cleanup() function is called after the thermal device is
>> detached from the PM domain (via dev_pm_domain_detach()).
>>
>> The rzg3s_thermal_change_mode() implementation calls
>> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
>> accessing the registers. However, during the unbind scenario, the
>> devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
>> Consequently, the clocks are not enabled, as the device is removed from
>> the PM domain at this time, leading to an Asynchronous SError Interrupt.
>> The system cannot be used after this.
> 
> I've been through the driver before responding to this change. What is the
> benefit of powering down / up (or clock off / on) the thermal sensor when
> reading the temperature ?
> 
> I can understand for disable / enable but I don't get for the classic usage
> where a governor will be reading the temperature regularly.

I tried to be as power saving as possible both at runtime and after the IP
is not used anymore as the HW manual doesn't mentioned anything about
accuracy or implications of disabling the IP clock at runtime. We use
similar approach (of disabling clocks at runtime) for other IPs in the
RZ/G3S SoC as well.

> 
> Would the IP need some cycles to capture the temperature accurately after the
> clock is enabled ?

There is nothing about this mentioned about this in the HW manual of the
RZ/G3S SoC. The only points mentioned are as described in the driver code:
- wait at least 3us after each IIO channel read
- wait at least 30us after enabling the sensor
- wait at least 50us after setting OE bit in TSU_SM

For this I chose to have it implemented as proposed.

If any, the HW manual is available here
https://www.renesas.com/en/document/mah/rzg3s-group-users-manual-hardware?r=25458591
(an archive is here; the manual is in Deliverables/r01uh1014ej0110-rzg3s.pdf)

Thank you for your review,
Claudiu

> 
>> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
>> be used in the upcomming RZ/G3S thermal driver.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>



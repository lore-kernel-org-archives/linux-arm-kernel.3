Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ADBE64A81
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pnArlX2bydGAe9JBj0W2EkNJm96HMGuKHkhrpz/xxnU=; b=seFSxfSUy1D2f1l5BMArHM6jZr
	CHoNPJ81O+Tds1hCLQsWzcHstzCYWHRGVk/VnOXDvoF0IE0nm5jt1v+F6YzGVN5xcKLKm5U/6whsW
	O8I39rR67EfWLgp+RAeV2KiGxtrNr1IpjiVvSChBkyEYTaRXULYHQtyQ3JskJCf8r1ije95xg09WZ
	EopF9fE2CXE0eGRW5VIZ+2VDrohUPqPZg6PnKrJmhVUgpiNSIe9shjfsx26jLIz6f6QCUoSP5iUfC
	UNr/urqdMzPo9H8vkVl5zvUe+qCMTcOcAfKrp3qejvAYtCqtiiH8BZ+fTGxJmmhqwDxg8CCE75rHK
	DAIl0hZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQuz-00000009G64-3vMM;
	Tue, 03 Dec 2024 11:18:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQsa-00000009ErF-1wHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 11:15:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4349fb56260so46985715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 03:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733224542; x=1733829342; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pnArlX2bydGAe9JBj0W2EkNJm96HMGuKHkhrpz/xxnU=;
        b=LQZk5DEpjvmQtIGiS49uwOVB6/f89SgM0iZ8daJyxv1c5GU5LwndCSba+4d2A4ve+9
         RPVQVVxbgTft6k5qvk1j2LTOoYHezSMb/jCsSmuZgRmzfNCUs0beqAjzDd9V06li3fXS
         +4/ruB1JZroVg1zw+Ucb4wPqJSiaSZ0CII3Ma4xrc7Zy0tMs/7neycmZPEEd3e6v6au5
         x9n6pLhqH9SQr6uc8+Wt0kreIGV/YVODFHUYIzC05kTpooPaJHofFUb24EBqIQmBLrmZ
         kn99Z1+gCsI8UVq3+qLKZajDf3h8j5rMsBNj2mBi4RFzE3WJFEcdANU7bYx6psiRyuLh
         yagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224542; x=1733829342;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnArlX2bydGAe9JBj0W2EkNJm96HMGuKHkhrpz/xxnU=;
        b=srTWHzJjlYLSr/PmmJS44x3owrw5OLLiI7ZzJLUdQ7hZQFLasgnZQ6nJnjaASmAEU+
         Wjh6MDcvV3iGuhlupOTmQ6E6o17k8xXOULhJGlrH1gQMLENoCJ9mDoIIKtzl23d2NPR7
         JThHu/fsrdPUKRK7P95ZR2M1yoFR7PWbysxH9GPxHmFTrDhACbsQQ3H10ldHvN8PkYQp
         FTkiyESMraMR7k0tyWXd1NRCfPb2i3F9Dae7BxTw70icoEpNQxudBdkLqX+hTl/6AqZO
         EtkT9k5X2OovHdGY0frrCPUkceChkwgziPXt/yhS9XXZvqHr7gmSeEQn3ggR9ZT3Av1f
         uHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3d/vFzk2Dgz9eTEzwTGran7ccQ4D4ddGQnYgUJ3lVB0ibLv7cwcIRxarUFekKXsnty8cYuSOfjpBOhAnUCvsa@lists.infradead.org
X-Gm-Message-State: AOJu0YwffWnS8yaA/f4Z8ExGA2p1PkZ/NCx+3l6RgXSXIVpKvFeaJ69K
	OTz3I8mvSoG53jAFs8xW6eTo40oYs9CyJdeIWzNNyU6xLwhkYUw8vgZ6ATVPIt4=
X-Gm-Gg: ASbGncsohgfq02gbIBNDgU5LA5O3De9Q2FwKktouw3qPb0cd4vXhuGcCR4LMi4V4avF
	QXEh6bWkCskKQrjzecFnhxlWmuqW/ukItmJY6Ti7yy2+bzA5ezwaNMCqyzy76Sb7fiF8sL/wyR/
	am7F/tVchSWRj4JYwDxqMr+k4OiayfNonNWO6V0zB3XovoT/EsUjcF3EEEOyalbKBzcMTZ5N8ln
	iZ/Mrf3feDS0WDJ0BFOZm1HNWGqAn8DruxDNWKkWAoXxi12Yg==
X-Google-Smtp-Source: AGHT+IGLi/Q8mLP5TxaLwquvOT8BJfU6gorpDiNg0XMpRNl3txBjcplK3PZhkhWKuplXxiUTh5hsVw==
X-Received: by 2002:a05:600c:4fc3:b0:434:a805:1939 with SMTP id 5b1f17b1804b1-434d0a1f0d9mr15164335e9.33.1733224542524;
        Tue, 03 Dec 2024 03:15:42 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:7f8d:3a10:1eea:52e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e86f5dd2sm9131526f8f.18.2024.12.03.03.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:15:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org> (Stephen
	Boyd's message of "Mon, 02 Dec 2024 18:53:30 -0800")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
	<1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
	<c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
	<1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
	<ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
	<df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 03 Dec 2024 12:15:41 +0100
Message-ID: <1jr06pkof6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_031544_520742_454E7AC6 
X-CRM114-Status: GOOD (  38.34  )
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

On Mon 02 Dec 2024 at 18:53, Stephen Boyd <sboyd@kernel.org> wrote:

> Happy Thanksgiving!
>
> Quoting Arnd Bergmann (2024-11-28 07:34:46)
>> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:
>> > On Thu 28 Nov 2024 at 15:51, "Arnd Bergmann" <arnd@arndb.de> wrote:
>> >> On Thu, Nov 28, 2024, at 15:39, Jerome Brunet wrote:
>> >>> On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:
>> >>> Eventually that will happen for the rest of the reset implemented
>> >>> under drivers/clk/meson.
>> >>>
>> >>> It allows to make some code common between the platform reset
>> >>> drivers and the aux ones. It also ease maintainance for both
>> >>> Stephen and Philipp.
>> >>
>> >> I don't understand how this helps: the entire point of using
>> >> an auxiliary device is to separate the lifetime rules of
>> >> the different bits, but by doing the creation of the device
>> >> in the same file as the implementation, you are not taking
>> >> advantage of that at all, but instead get the complexity of
>> >> a link-time dependency in addition to a lot of extra code
>> >> for dealing with the additional device.
>> >
>> > My initial rework had the creation in clock (note: that is why I
>> > initially used 'imply', and forgot to update when the creation moved to
>> > reset).
>> >
>> > I was asked to move the creation in reset:
>> > https://lore.kernel.org/r/217a785212d7c1a5b504c6040b3636e6.sboyd@kernel.org
>> >
>> > We are deviating a bit from the initial regression reported by Mark.
>> > Is Ok with you to proceed with that fix and then continue this discussion
>> > ?
>> 
>> I really don't want to see those stray 'select' statements
>> in there, as that leave very little incentive for anyone to
>> fix it properly.
>> 
>> It sounds like Stephen gave you bad advice for how it should
>> be structured, so my best suggestion would be to move the
>> the problem (and the reset driver) back into his subsystem
>> and leave only a simple 'select RESET_CONTROLLER'.
>> 
>> From the message you cited, I think Stephen had the right
>> intentions ("so that the clk and reset drivers are decoupled"),
>> but the end result did not actually do what he intended
>> even if you did what he asked for.
>> 
>> Stephen, can you please take a look here and see if you
>> have a better idea for either decoupling the two drivers
>> enough to avoid the link time dependency, or to reintegrate
>> the reset controller code into the clk driver and avoid
>> the complexity?
>
> I think the best approach is to add the reset auxilary device with a
> function that creates the auxiliary device directly by string name and
> does nothing else. Maybe we can have some helper in the auxiliary
> layer that does that all for us, because it's quite a bit of boiler
> plate that we need to write over and over again. Something like:
>
>   int devm_auxiliary_device_create(struct device *parent, const char *name)
>
> that does the whole kzalloc() + ida dance that
> devm_meson_rst_aux_register() is doing today and wraps it all up so that
> the device is removed when the parent driver unbinds. Then this clk
> driver can register the reset device with a single call and not need to
> do anything besides select AUXILIARY_BUS.

I think this is fairly close to what I proposed in the inital RFC, but
generic instead of specific.

I suspect the the generic path is likely to trigger more discussion.
I'd like to be able to finish this migration, instead of leaving half
finished like it is now.

May I add back the boiler plate code in drivers/clk/meson, similar to
what was proposed in the RFC [1] and propose the generic implementation
in parallel ? It will just be a matter of switching when/if it is approved.

[1] https://lore.kernel.org/r/20240516150842.705844-9-jbrunet@baylibre.com

> The regmap can be acquired
> from the parent device in the auxiliary driver probe with
> dev_get_regmap(adev->parent).

Did not think about that, I'll check, Thanks

-- 
Jerome


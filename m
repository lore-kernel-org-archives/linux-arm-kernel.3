Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD4ED69114
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cd3HIAbz5teig6mZhMhVwVj28VKONXEVKeEO3RfXUec=; b=i5u/EVs2Na/efAgeUACDtshOih
	a6CFbCVLgkU0ZbTHihRvkVYJedzIVEbom7l7dzoxCoSNeeNJir01UwW+eXQ6vk8o49ijqwKFEsBpG
	iuLY+N4uyzLENhUIn5D7Rk73x1vJDVprFunnLc6OAgcDnB4KRCHvTcvq3dnB9mMuWVVhFJdCWwLbl
	jnn4o1z/eDFcS0vjcOJ+b7swe8b+OUrZ72zQ2CDOgexCAPAJ5rr/G8sStmqIWBgPsI5Pabivk5yjM
	+rc1WVNLCyeIjb8ZyK4yUuvGCdHc2q8PWNSowOvPHFq+QYA4c928wDeVMStjaIAM2Upia9fp2bM/7
	DlpUnPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgzh-0000000Fxij-2T8Y;
	Thu, 28 Nov 2024 16:03:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgyi-0000000Fxb4-1tMd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 16:02:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434a10588f3so6264645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 08:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732809771; x=1733414571; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd3HIAbz5teig6mZhMhVwVj28VKONXEVKeEO3RfXUec=;
        b=aG91cmVe4y7EwaI4sBuRZTf87UaV8O3LVc2DJ5GSCFcmVbSA4E3CB53g9L8FqMM1pT
         hv8uyuti4PyWiywIQWGghHlwWToO6kui/XUWOKLDQJfrkhhdRhXAHVKyl1cEHYHLk/xf
         ojr3OpF/kg8dQPMO13Ktx5y/zLnWl8A0Z/IcjFmMVd2txIJ9GM3s6OzI4qNKC0ejBpww
         aCt9F/50JwWuk6OVh7PYYK8vn2vzF4bqJbbZsB2jJ8fc5Q8sWeR0k9Sn67+g9Dzchafk
         7iyGzU+mHPgwSW5jSG9zvwi3ItU3DyRCecQhLo4JgIxCHyiFcrvyYae/aoOjLFsPB2DX
         TAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732809771; x=1733414571;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd3HIAbz5teig6mZhMhVwVj28VKONXEVKeEO3RfXUec=;
        b=KHDJBQIrpz7KQ333wjbznbVvBLSfuQTW1bEHHEHA8abUorNoq6ebfX86oj9mmMmKnQ
         pFX2t80y45Mb99f+k/mvfLDyMCxf/csS+tYWc9VH+LDqDW2S55LsfBFIJS6e3MUST5L/
         U+u4MuqrOwr93FJUepnWNsPxDyLFdXb5rPI5giAKA3npgqtKdp+pMmCAEfvEK5l14KSy
         d3BEryFcKfhCOWEunttXmXX1Zs0gO37/aqzppjeXp52qhnt/qJmTjm3QN8+YSA1uGg/m
         SgKpRk3Fv8CF7a0y6uXJsBX64MlOVzTWQBrHJJmq84Mt89UELdqLJHgplSAH0WKUNRi2
         8hLw==
X-Forwarded-Encrypted: i=1; AJvYcCWQbQjooxwDLZQ6QjpPFGy2pc5uSTQZPGhGX46BqTa+SVK44h7CoqTqrvawGiVbWYMkE/uFdpKvpDJwO7oyCtuO@lists.infradead.org
X-Gm-Message-State: AOJu0YzgQxHn7YKBDiWReYkpEV25O/u6NkgaF3k5Wuv98mzycDrDXm+u
	UiXJgng7QQUkkx10IV70QfqNmZpHZMpn0M18HBx4MYxwz92CK4jQa1Z0/Eq5uJs=
X-Gm-Gg: ASbGnctAGa412ZleWy4bUdiOx9cGMfIhxO111qjuqZY3CDPcIL9lAUt6WJd17hkNb65
	iPkIMkiaU3yIKnLvlr891r120Z8lA+uUzLq3PLAw3tTZjeDgrtLLhKzuyNKyY0yP6JwdhhVZITi
	Ld+6IYwZUKjJrrWZtB9SeWL6sUapL27wIBd0rfVXr/Wph8i2oQwDezP4dsGzWTzTPVh3nHBR/gF
	qA8zUu2B/v9Oc0INysCsFjf4jWb5in44ElrsXDCcG8h8aSuJw==
X-Google-Smtp-Source: AGHT+IF8jksfRql7w6do+0ni/UEA23LaMmjUdkNNHCmXy6TaBrSlXrzm1NoY8e4VxzZ9r/opidqFLg==
X-Received: by 2002:a05:600c:1e24:b0:434:a1d3:a30f with SMTP id 5b1f17b1804b1-434a9dbb946mr72027945e9.6.1732809769260;
        Thu, 28 Nov 2024 08:02:49 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e5285sm57355845e9.40.2024.11.28.08.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:02:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Mark Brown" <broonie@kernel.org>,  "Neil Armstrong"
 <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <22f0ec0b-889f-4588-91fe-764a45870f25@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 28 Nov 2024 16:57:05 +0100")
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
	<30cd9a80-e9d8-4387-ad28-451f7f95637d@sirena.org.uk>
	<22f0ec0b-889f-4588-91fe-764a45870f25@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 17:02:48 +0100
Message-ID: <1jbjxz1h3r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_080252_485681_14825225 
X-CRM114-Status: GOOD (  15.44  )
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

On Thu 28 Nov 2024 at 16:57, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Thu, Nov 28, 2024, at 16:52, Mark Brown wrote:
>> On Thu, Nov 28, 2024 at 04:34:46PM +0100, Arnd Bergmann wrote:
>>> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:
>>> > We are deviating a bit from the initial regression reported by Mark.
>>> > Is Ok with you to proceed with that fix and then continue this discussion
>>> > ?
>>
>>> I really don't want to see those stray 'select' statements
>>> in there, as that leave very little incentive for anyone to
>>> fix it properly.
>>
>> One option would be to get a change in defconfig for -rc1 and then deal
>> with moving things about later.  I would very much like to have these
>
> That sounds ok to me.

With a change in the defconfig, the reset aux driver that needs fixing will
start being used, whereas it won't be if a revert is applied

Fixing the driver will be a lot simpler if it is not used yet.


>
>        Arnd

-- 
Jerome


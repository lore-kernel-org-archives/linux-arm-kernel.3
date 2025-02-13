Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=; b=Gxw9z49gt7HqWxxCYUVxs+H4gI
	RL/7XxCPtJeCSFKpu1k+9+zbi71+T4pBScRMGbR+XGxjLmcGRPnhtKsOWB0uC/GObvg9nJDk1Z7tW
	Sp4PwW5ZyK7LV7R1WzRrhse5sj8fU4OcrMSFWML4vISAhiWygJh7l+1X3E6ene00vyNpB4K8hXHMO
	gYDMhZ5+Vcv5pDBBCfvQVykkltNy1zMOXd5jIe4H3RGsoeBNtN5C6FCyNe1K9IA9agIzDssTV6X54
	KieYT9LKPK8nbycuxvf5hRD0jwyD6FxiOATZaa7x2Tp7Zy9mo89v46IBX6O+eW/uRMwVy9S3j3Gh3
	UsR0oV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibL4-0000000BZxq-0EqZ;
	Thu, 13 Feb 2025 15:41:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZNs-0000000BAoJ-2sQy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 13:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=; b=hhZn+aeSJ4pSVQlHcuqULpeAsT
	kjHlQxelE1s0sl0y7WCDtPzoAA0RCX9H8hJ2f3jH8hj7HzQDeniiC2cW/8vgK+CrtkL9o1OQsQ4Bo
	14p3Py3zq86OSAC8jomvZMbh6irbhBJl/pUbDb8C+rpSE2kVW/8W1Mbp33AD7zS9D/iKxKs+KwqOC
	NFCLWgKgrlvzq8xqPj21dw2aQsziOudeoXkP8hF8MXw0Wbx2eb2cu2GK9MbhP7ABPMWMokZXnSaX/
	y96jH/sKT3Fdf1FZLZYH9QQAAXC1VMnx3TvHHQ1/lFjGfjIFlmPFVhDjUlBCave2x8bEf1zG/YjqW
	zOuMAyUQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZNp-000000010Op-1yzO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:36:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4395f81db4dso5337175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 05:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739453759; x=1740058559; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=pCJ4iEXS5joeF2Or9EqZRJ6vS57XWxqme9Zwgau6MR85+SzNlAYBtghDGJXjs9qIam
         N6hGBvaLmcVr7BHw+H0ADIHk0H7he+2RYkKPU00uwdjXwGY0NAXDR1xYnvA7gQurKE84
         vqZAAMyBFKxB0XJ2umhzes3ExgqM8tR0yh8TCGGzju4P7YP0ARu566z1FEUVvSf8SCwb
         GlwP32OaL92hUS1klQfSQ/cm3Vg1YFEKvGzJK4JL4qffrXGHMXNGVe6sQE0eSBcrDpXU
         lczSzGCTEyjMNznpCkCAxg1tdyDzlXmTaApMHpQc7FYC5na0jRgIU8K/sZsev7e87x2o
         snhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739453759; x=1740058559;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=JGccayzbLCiGHIaaHLaquCRrgsbNBjqljH8X0nP9CzpjAFXmMdkFSZ8RqbMnxiud0k
         sL13jSsJcaiH90qp927w2kCpBNcgjHUlUgQZjVHaYxvghCZEj26iIsrNaBAwwFwR640x
         H/lIy0LOgYUDYL7hxDDda3Zk+9eF652khMrVEDSiba9wClnCM0QG5nyoZCUDfDNzkWJO
         Y5pIjR2rDI4lDDKMZ3LLsVjcOybki6WPYWrLVi5mEoYyBmjs99i3wrVv/39PmvKoGW1v
         3rnpJ1drQt8vZwJx3suUN7/+sV7LkyRFCVT+n2otNkz8M4kMK1//9sBLjdVnjzclNVMi
         hOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1/i0tuGUlnUiK/SWiiE9HgpfOhyTTEJIcgtaY8VIDhbRwnaAfaIx28ZoGn8xU2EeJdmVpGbpc5OJ80SJkaGhT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5BRRgHe7bhKhXbl3PL6892e/6EAjcHb2OZezZ0EmE65jDhrx5
	64IF20Iq1N5gQXEo6oX6O6C7WuOCWBAkv5m9T39hLeWXA5C8s8w6bjiUwlLr7DQ=
X-Gm-Gg: ASbGncsRXOkhOMK1fybU4w5mZC8Yfa9WPru8Qm7oiG0W+tULWDLFpG3Zi0fs/KR/AJh
	Kizc9XTGFTt7IWkdF91lLg8YHeT+pyBE0eMliQfQBC2Og3ndCqdGmOS/AuEg1gLValUtWyjlFd6
	roljL1nHGrsOnD1d6cIpxXCEthoeabc/5ESzk4aVaiYnaepWN8UIDhKobPGF7gVzt+bijdV/8Pb
	4xDEORJ9SHrg5g0DzZvReVrhD8Hfu3yJ89eAq8go2oGPbIdu92+PdgPiNVKQNGoTQn+MeS9k5r+
	Wkjnb1sQGJ+R3A==
X-Google-Smtp-Source: AGHT+IFlyyROQN/jp5N25OPHAwGGncnJ/FLwqH6qkR/P/8dmal2Zk5G/l0wZieziiMnBJNT5H1Y22g==
X-Received: by 2002:a05:600c:a0c:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-43960e81b92mr29235125e9.6.1739453758160;
        Thu, 13 Feb 2025 05:35:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a056151sm49618825e9.16.2025.02.13.05.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:35:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael J
 . Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Conor.Dooley"
 <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Doug Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "laurent.pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "Dave
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory Clement"
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  "Michael Turquette" <mturquette@baylibre.com>,  "Abel Vesa"
 <abelvesa@kernel.org>,  "Peng Fan" <peng.fan@nxp.com>,  "Shawn Guo"
 <shawnguo@kernel.org>,  "Sascha Hauer" <s.hauer@pengutronix.de>,
  "Pengutronix Kernel Team" <kernel@pengutronix.de>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Kevin Hilman" <khilman@baylibre.com>,  "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 13 Feb 2025 13:26:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 14:35:56 +0100
Message-ID: <1j1pw20xxf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_133601_665422_C9889114 
X-CRM114-Status: GOOD (  19.96  )
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

On Thu 13 Feb 2025 at 13:26, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Feb 11, 2025, at 18:28, Jerome Brunet wrote:
>>
>>  I also think this is more readeable and maintainable than a bunch of
>>  'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
>>  also would have several pitfall, such as picking the value of the first config
>>  set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
>>  with menuconfig.
>
> I still think you should just drop the 'imply' line, all it does it
> force reviewers to double-check that you didn't make a mistake
> here, so it's a waste of time.

Arnd, you've made you preference clear and this note has been added
specifically for this reason, and transparency. 

I've exposed a technical reason for my choice. Going with the 'default'
approach makes things more difficult in the long run for those
maintaining this platform, me included.

The trouble of having to coordinate changes in 2 different subsystems to
have an appropriate configuration and the pitfalls of using 'default'
outweigh the extra review trouble of using 'imply' ... especially when
the pitfall mentioned in documentation is explicitly addressed in the
description.

If there something wrong with 'imply' existing and being used, maybe the
Documentation should be updated to reflect this, or the support be
removed entirely.

ATM, it exists and it makes things a lot easier for me to support and
maintain this device.

This all started with a maintainer request to move some resets away
from clock. More requests have been added along the way, making things
more generic. I'm more than happy to have contributed my effort and
time on this and I don't think anybody's time has been wasted so far.

>
>     Arnd

-- 
Jerome


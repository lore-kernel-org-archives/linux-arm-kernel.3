Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575B6C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=; b=0loOSDpqmwJ9wcIJVZVGM/EujO
	nhOVmPfJReUc+SEIHy2qssJKIMX7lL5UX6XozRf3xI4P42Sz5b4SBccGBbyhzC2rN+tX7Z7AuGJ1T
	uX9gGJGyUfKGW1pWEfNVg3dUdTgOiAt8sILq4WH05XAuuwPhuW9aY/LR1PNGEpKNdUcGgsZxUktkx
	qE2sLoSb20oSQWz1e1FJhuMNsvJbMKZY2N8kS9aloREbTTqfdP4gKHSfYZA2Vt5yL0/z1KBa4nR+k
	XlJgL9NFqEkjV3vor4c46AdEuzYUsNu2oPwT6Z1AQF5TJaZv5+bqipQCcVq6Lmm1JEIdg5tzGJmRe
	H2s95wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWVw-0000000AgIu-1CYp;
	Thu, 13 Feb 2025 10:32:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWGj-0000000AcxG-0TwV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:16:31 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso353475f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441787; x=1740046587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=W6jcUaL4tLcP3DB3ly4cT5HhvhTGOIPotbWrNH9sV8eg4MjkD4TzmuaMRhzd9sn7GB
         QfZDcDMQuSSZ8wv9D8tRGZKLcqrcKKt6q5w13pbHAGCAbelvb5YgmFoAvRO4hnJcTOLt
         lYp22zGkp6ioPShW+GrwpDkfF/ES9YbVCrJMwz2jPnjosyTZ5dJKtqEKeIaOtUHPsF5o
         j/gTWr0lJIKiivDeHKbD1ZmjIuXyPmqyYRvIXtjSz425Ueaw/LE3/EavCblAmfNznGD0
         Y2D0pvJ0Xe7EXsOVMWskpYRrAoDx/BT5/5F2Y3Yv7ukAnA7yfZ2Ys8mPHMkQkVxdZBbO
         7AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441787; x=1740046587;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=C1x3BXvEiCv5FRNNO79dTqroqaLsdze7H6i0Jnn9hCQ7AV5iO4Qv3Z88YwjDLNZfqT
         KRKIG4JA+Dm6S+H8Mz2/v4gF9joY5bpUOsUjPol2+kIFVHYfRrBKpbAhRCmMj7IndQwj
         ylHNarV9udEJvyudAZSA2+fEMw6kGmYvb/qjv3HLGf/KBTAQG7MLcfEP2bCQfiaf09Li
         yBa+5RYZNphvQzY1rhFMPwTmWxzN4lYFO8eRQzncnh88d8Thpm6I9MNlv0D5F7/wVo+Z
         am6/aJjcReLQc2ztItpv66WaN+omFT1FXB7FeTZjCGixSxDC01ROjE5SCwQ8lni9klsM
         4BDA==
X-Forwarded-Encrypted: i=1; AJvYcCWbn99eskGb43iKry2rIMCAfOYh79m+OZbR4WPoyf0KJTABFst5BYtHL7Q89zDonIVTF6Y7yPjbDyQ0Wsj0NhyO@lists.infradead.org
X-Gm-Message-State: AOJu0YxX7iheCmb6DRDX0M0ULn16qUBexWrRn2mpGS6HaQ1vDia/aNy/
	B1rRoM9OeeoABBC6bnbQH8tAemmfdEf9Ps+rs1X1jmLAs0bSjJWY/ha0+j3LZ5Y=
X-Gm-Gg: ASbGncsR9s8wXp/+JQgz2amzZ91kfeE0irD0NJd0Y1lZKVDwNZuIzLxAGPA2IHnOs3m
	dyOqHGsFM4RmqmDu6tpvHGBVBRos071QfjPOZA70wYKrHlRo/FGScyiMKmhhS5Kh5+rzd4l9eXd
	u5nV5f7Psq04SnYHWx7Czqj/QfLVXZO6w43xRBOVkJQXqpvoCUt/uYCKBkAc6uYvTYHbt8x5/on
	lwhQhgwU3h7yNgcjc5SMyxq6ckOaJE4po7lHp7j5QZcv6gS2c5gSBp67SgyTnWor8abyQDqchJP
	erfFvSXc1AnqTg==
X-Google-Smtp-Source: AGHT+IEffmNN4Pb9+ARCo3GKUiuLAJbsEVpvuLGQpUwyPZc6Fg0ln2kIswpBpy9K/UypDXBJlkii1A==
X-Received: by 2002:a05:6000:1884:b0:38d:d8d1:a4e1 with SMTP id ffacd0b85a97d-38dea3c42dcmr5386478f8f.4.1739441787185;
        Thu, 13 Feb 2025 02:16:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm1451341f8f.94.2025.02.13.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:16:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael
 J. Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Arnd Bergmann" <arnd@arndb.de>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Conor Dooley" <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Douglas Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory CLEMENT"
 <gregory.clement@bootlin.com>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Abel Vesa" <abelvesa@kernel.org>,  "Peng Fan"
 <peng.fan@nxp.com>,  "Shawn Guo" <shawnguo@kernel.org>,  "Sascha Hauer"
 <s.hauer@pengutronix.de>,  "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,  "Fabio Estevam" <festevam@gmail.com>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  <linux-kernel@vger.kernel.org>,
  <linux-riscv@lists.infradead.org>,  <dri-devel@lists.freedesktop.org>,
  <platform-driver-x86@vger.kernel.org>,  <linux-mips@vger.kernel.org>,
  <linux-clk@vger.kernel.org>,  <imx@lists.linux.dev>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com> (=?utf-8?Q?=22Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun"'s message
	of "Wed, 12 Feb 2025 15:53:38 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:16:26 +0100
Message-ID: <1ja5aq175x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_021629_171608_08A1B2BF 
X-CRM114-Status: UNSURE (   8.34  )
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

On Wed 12 Feb 2025 at 15:53, Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wro=
te:

> Hello Jerome,
>
> Why the " - take 2" in the commit first line?

Because, at the origin of the dicussion for this patchet, there was
another change doing the same thing [1]. The change was reverted do
perform some rework and now it is back. It was another series entirely
so v2, v3, etc ... did not really apply well.

Just giving a change to people using google or lore to distinguish the
two, that's all.

[1]: https://lore.kernel.org/lkml/f9fc8247-331e-4cdb-992e-bc2f196aa12c@lina=
ro.org/T/#m9ab35b541a31b25bdd812082ed70f9dac087096e

>
> Thanks,

--=20
Jerome


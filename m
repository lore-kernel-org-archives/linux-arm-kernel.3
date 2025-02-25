Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D53C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=; b=kE2ivlXwUTV9w3clo8HTNy/k5V
	HzRBMAPXyDsCxmy3UiMSXVxypYrlOP+TwKsbfobXdswiRSoGUoSZz5DAIJ3qNZXO7cZ92v1r0yTWq
	mLxSY6eO6uv5SCIayXwrzYI5zCJcQrpXOXCytq1YqS+sMqm/7OrjYKUv8F0Xc4kigRB34rBU8IoS9
	rWdV0R6m2q1nu0qBxBFfPnUPAkMRAzm+os0eFldiK8rS9EqV54mOx3mZlqTd1SMieXqaakJ8NnsQw
	ZpNIi0z7RWOU1czD6w8A9HR7o+6WBsXLAUDesmQUF64/nfe9X8QZM/BVZVOc5QeGdRL6BI/Uaf+UZ
	h1azIZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3b-00000000PaU-09fg;
	Tue, 25 Feb 2025 16:45:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxXR-00000000AVB-2Xfy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:12:06 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e0516e7a77so8921889a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740499924; x=1741104724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=Sc1iyic942X/Q5Uy5rpc6qLL3/8eqlMicjAg+p1uF+lg/75SFsfpRbk4xJkiyOBy4K
         NPmAjw05ZSUu6UpcPmzmQySsVzpArxB2l/TwrBt79NM9UJOmPaBH3LxNop8uhQf3guz3
         svCUcKW8zfgSSOJAjrGwg+EjzRj2MW2TzVYgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499924; x=1741104724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=q4unIGWAVGZ+MQ20GebxvCdu62CqsiFdK11j7G24cz1Hd4deBHAMOExLs3oSm+F6q4
         xus+3NnKkrElz7oMLWJZ6QGKKBUJrmmhkxtqGPMkGvr4Fo4yT5+Mr2sOkk1ngtsCUMNL
         9xyEuIMhzXvCavckOwkX7VHbO4rTDeP1mpapOrkdhmDaie0Iy3kzBqv2T24XkmJLboYh
         23CdWq3J6gS+UGTGlOiNyaD6aMngaH9lfTUwj6+rQXuSgHZNSjwpdYVtrKRzyM/0JtVV
         UJIawTgPLSqg9e76NLwAf6amZFfc7vb21uO60fQu1L+WdmwQvSnSPwc8/Em6QQ/pP5En
         51qw==
X-Forwarded-Encrypted: i=1; AJvYcCV+M2Y18oBnsyHphalNeZkrzX/PorC9aAwZAYklApUGjKo0pcL3zdMUKXaY7ICJlKtj4T3X1LlpAXglr2sHGwvr@lists.infradead.org
X-Gm-Message-State: AOJu0YxIcx2m+bSXtMZBh/LbB0njVmWDmYi55arVLDQsNj8I1WQgXK0b
	0Cmu8uB7FjGYppiJU4sEvTHY3jbeCTniADwPIKRfUSuwI/U0CDb69z/4k/3/sk2f3R7wXkBYuq/
	HgXHI
X-Gm-Gg: ASbGncs2QJUQxMlIiZykTNCHDl2+f94KQnazxOcOwMwhzPM1VgmIgipTC7wrkE5htI4
	7sP1RepQEPHEdaRfkgDUSCvNkccIjhufhXCsHdAHx2zfBfpDfDvg4SX/3MLWfz3+p4o7F2dJdW9
	uAIPN8oLwbcWgogM3nScFKRG6MQrU+nvGdNDCvp+ZCT8W892P9FvJWNeRLFXmcjxI02QjiO660F
	3tkqB87NPAUy4OfskgCJiV818SAwPwTgayfAxGVWecpT3tgft1JZulPSeejfTFGt3viXQ8tcUpH
	Dh/tNlxcNbvUgLNL7gyVdOP4Pz0BuBRa6zaQyEaF5kZ0bpnX27NZL0edjn9zAuYJ0Q==
X-Google-Smtp-Source: AGHT+IFq7vlTdHWOSih2lgbnCmSQWWunt0sTUJtpuN71wf6ZqdfS+Pd3M8jwP1aXxEMROD01cWKOag==
X-Received: by 2002:a05:6402:3818:b0:5e0:4408:6bcf with SMTP id 4fb4d7f45d1cf-5e0b70e6a0emr19253365a12.10.1740499923687;
        Tue, 25 Feb 2025 08:12:03 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e462032c6dsm1435785a12.73.2025.02.25.08.12.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:12:03 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso993786366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 08:12:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6dnf3spiSvogM5v1eynY6Ch4Vg0IgLkTFrHJZ83H3B5W4APtrU+W5uR9QT0IkA95TZuzNfgKl3BQq00tPk6Iv@lists.infradead.org
X-Received: by 2002:a05:6512:1241:b0:547:6723:93b6 with SMTP id
 2adb3069b0e04-5483909d1d1mr6678553e87.0.1740499509419; Tue, 25 Feb 2025
 08:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com> <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2025 08:04:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
X-Gm-Features: AWEUYZm3vRrajChqqVao9eJTA9wadMF2aiVVZGdKkNeW96YTlQauMsPFnVVKvC0
Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_081205_636581_6EB2FCF0 
X-CRM114-Status: GOOD (  14.80  )
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

Hi,

On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++------------------------=
------
>  1 file changed, 7 insertions(+), 42 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll snooze this for a bunch of weeks and check back to see if this
can be landed in drm-misc-next every once in a while. If you notice
that drm-misc-next has the necessary patches before I do then feel
free to poke me and I'll commit it.

-Doug


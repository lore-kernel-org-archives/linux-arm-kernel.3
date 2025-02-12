Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB23C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=; b=Kt2qjMzX/R3iV1Bls4jzPUlowL
	VvfMLRA7J26jGbfNYLO1rK8iPBTeXuZETRRHHYn60Q/IaYhi8nweBsd8U5tPsI6S6pgvJjACU95EB
	Kc+Iv2KoVMUNMlnhCZ2hRw2d+riaJwtDZ/5LsifsnnCdKS0RpmPjxXJB4yPYSO6p7/pVhWkbvery2
	rVdr8294X7r9dtaeJQYT4dSqrkaSYzcbhf3WRzunTCM+92/myGj0h0KUFL7xDpvxvpwqlLC1vAsUm
	AbJlJ7GQmA/qbWrZJQfsSHT1Q+0VSWznJ2Rb2uoMudqr+NuDxNSYcO58OABF2hhebl4iM2kq5M7b2
	i2tgpNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGT-00000008Ewr-2Mhr;
	Wed, 12 Feb 2025 17:11:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFl7-000000087kB-0EPC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:38:46 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54504f29000so4468836e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739378320; x=1739983120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=BOmhAQyRQLzO8rT1SG6x67DQ8ViIXLTJCjMw1zENjIzcrn3eXZxlI8/gsyX8mORolE
         FLNcAOfsoNO3ANhxqmWY3a86i+R7lzZkYAM93jsebHN/MERlsWbOloUB8iexTnoViSV+
         RyoVcBiWeS67/tvR0pUlH2ZT5dvyHJh6VFZ1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378320; x=1739983120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=Jk8yj1sY+qvBVjYiEyELRan85BvXpUfE4koQJFxc/qaImZ8i4QDwRE5k2zGFfwHLH4
         5grso32/w0zkykUdPjjOSBa030VQanWzQMUVJPEShiVBzW/CcGDDl9R7wSkMEUMExuG0
         G0vHpnS3qqk731y5wNiWGMaiCGGURaY/TjkzHzHo8bw/hr08TeDUEFZxOMIusqYMl0Sq
         ErLL4iS8PXTIdmLo7L1ISHWHofIMRpOi3+38xpBa/xzIbnC8OaJ7F3KOs4Dtk6ic/uBH
         EQBlbjiCSsOQlz9Q+DH6I7dAIUKObUtFIzDKDgfQMDHyAxHi9OtCgm8nlQ3eKG7plsFu
         7rVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJunSy21vswnvoYvB0koOdSfWzdN8WT1Y9O+vCxo/jyA2ejkZBA4mI8pn1sSRL3Yj/IH4ZH+oaegz+spAv/ykk@lists.infradead.org
X-Gm-Message-State: AOJu0YzhDOUErxBsBl4plNucz+5JckHoKejohyjflv0+lC+5DZb1NAjy
	lRfRldSZ9MhDfZq8OPY2zmJwGmbOZI0La1m4iS01k1dcQYwKqgnAQHBewriUP8YDva76bDQSbGh
	qA72O
X-Gm-Gg: ASbGnctWJUzFIg5+5qav4JkCj5A3keXtPeP2JKBVo2vX0Vf9jnR+yr0yYgzwjuKhPYy
	k6/N1zIAKwjkH/8dr9fKHT3Oia+Smp/CnPwWj+u+p8Nzo/YgI/1dhTWROc2MebCcuPQjPQYB0Li
	lBOJxWZvdsusgVZby29NtuWwzvhZ8R7c9utGn6ZXw9mwrubAsgi4TDKeHVKqkKCZquhfrKaDDSJ
	ecIcZzQNaCuxmZN4jZz4bZ5m1/zMCaz5n665/K8XK3qjOvptBTvjeve94lu283gzGozspMZukBX
	msUqVcJ6HLK/KKkcAUsKaCeDfS4yUI3Q8hcmGMc6PfS5fHxAgx2ayQw=
X-Google-Smtp-Source: AGHT+IFb/6yulWyEywOAtzFcwJ7qzF0j6fLsjuBEw6IJiAQ+yT5QJ9mjnLE2X6APD+4ll4qCNk7TaA==
X-Received: by 2002:a05:6512:3f27:b0:545:cd5:84d9 with SMTP id 2adb3069b0e04-545182827aamr1156204e87.12.1739378320193;
        Wed, 12 Feb 2025 08:38:40 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450227bf3fsm1518168e87.68.2025.02.12.08.38.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:38:37 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5450abbdce0so3689830e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 08:38:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6m4wOIdrj3UlObbq0AfleNjKdwrfHSB/tbW/MYtx2G1jJ2QsJMlY1Uomc5VoogFT17gZ5jvdAjcdEMeN6HVFF@lists.infradead.org
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr1571346e87.48.1739378317154; Wed, 12 Feb 2025
 08:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com> <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 08:38:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
X-Gm-Features: AWEUYZnEAQCx0nU_sk8MYOvtfC7Gu1h5Zsl0lbrfbQPnQTV4y2laVQqsVCR6NTE
Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device
 creation helper
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
X-CRM114-CacheID: sfid-20250212_083845_087675_78DE2B39 
X-CRM114-Status: GOOD (  18.02  )
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

On Tue, Feb 11, 2025 at 9:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++--------------------=
------
>  1 file changed, 20 insertions(+), 64 deletions(-)

Thanks for creating the helpers and getting rid of some boilerplate!
This conflicts with commit 574f5ee2c85a ("drm/bridge: ti-sn65dsi86:
Fix multiple instances") which is in drm-next, though. Please resolve.

Since nothing here is urgent, I would assume patch #1 would land and
then we'd just wait until it made it to mainline before landing the
other patches in their respective trees?


> -static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
> -                                      struct auxiliary_device **aux_out,
> -                                      const char *name)
> -{
> -       struct device *dev =3D pdata->dev;
> -       struct auxiliary_device *aux;
> -       int ret;
> -
> -       aux =3D kzalloc(sizeof(*aux), GFP_KERNEL);
> -       if (!aux)
> -               return -ENOMEM;
> -
> -       aux->name =3D name;
> -       aux->dev.parent =3D dev;
> -       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
> -       device_set_of_node_from_dev(&aux->dev, dev);
> -       ret =3D auxiliary_device_init(aux);
> -       if (ret) {
> -               kfree(aux);
> -               return ret;
> -       }
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, au=
x);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D auxiliary_device_add(aux);
> -       if (ret)
> -               return ret;
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, au=
x);
> -       if (!ret)
> -               *aux_out =3D aux;

I notice that your new code has one fewer devm_add_action_or_reset()
than the code here which you're replacing. That means it needs to call
"uninit" explicitly in one extra place. It still seems clean enough,
though, so I don't have any real objections to the way you're doing it
there. ;-)

-Doug


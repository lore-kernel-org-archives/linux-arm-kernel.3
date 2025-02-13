Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BA6C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb9z6DcnNl0g9HoZcHoRWOLXyD9UxXMHyf9eNtzv3So=; b=zvO4Y1WW5aw6llRc2YZ8baarRe
	s3JcdeZxqB5reW+kMJGQIRPOUWcCh9ouXMxs++N+iehbXkq5ZDnIhO8QP1oEVaJiHDVDRkfSk34N3
	rduOLnNOtMUExqfcPR9N0TZbMnmRWsNQB1p1QLTnUzky0hK3YiprZZ3+QHh/5vCkzdFSf/+tKiEbc
	jw4skyZijodmFdFUPJ05seed4o5+rIVNXQ6EbaJJq3tOu9MVdf0pE4esCDg46iWB8574w4XRvhwEG
	4hYaJtap2kyaDkpaSJTJ1bI0kSAq0WbEHu1fVQNuXqO1hoBdaP2EUXZNM6YrHXOTKfyQ6g0LeqK9H
	WfH/sQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWDk-0000000Ac83-1GQF;
	Thu, 13 Feb 2025 10:13:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWAu-0000000AbV4-1fpx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:10:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38ddc36b81dso385120f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441426; x=1740046226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb9z6DcnNl0g9HoZcHoRWOLXyD9UxXMHyf9eNtzv3So=;
        b=qXnbBwEFbEill3grBHILptzuJNGVKjrhfj/YZ6ZhML1r7RXoOUwU1u11GtJMaKlQm4
         jHVaLDcKhgZZb/JqhEw+et/Xr/kqUvFmwHWtnaxDDV4Gz6e0xWERegOI46s2Q6PHo571
         ntBJQ8MykziPW9wySLGhUi8Iv2+Y0HEsFk2dgQMJzvQ66xrmBaeZcIXoS08CK7EUtCgT
         7APmBXEZtrSyFTfqW4NoVoVYIXokuMrEZUujICxu4VshbUB+MBuZhAJbSMNVokcuo9MB
         lTABQ8Qw9TTRyknHv1m44LUWJB1GVHMlrYTrL3Nbq019XgDXiAarWMSxn3hKCIGe3chD
         kHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441426; x=1740046226;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cb9z6DcnNl0g9HoZcHoRWOLXyD9UxXMHyf9eNtzv3So=;
        b=MdATWr5GyOfXk5IORD3ebCTMT8MQutvC0xUkwCekq9wPNGKg5mSSYoZU32NJcyw1xW
         /b5rVoeXCJgf2clSbfIGPuELzi6EDjypyMI+ZwJGJlme91ujSpdMA+GEJFvGg9LIVUxa
         1ZTdf+NjhXl9gQj7yfsKcFA8q6yxm1T8+jUPce9M9kK6ycVN/o2QfrDtsU1looNmWWtG
         mg0nx9lqE8Y6L23jXoxbbUOiVdAanLpFl1Is3ytk2NNCIdSWr31fjbWEz8mZtACwKuGO
         vJcBgEL7l8oGBVm6uUC3LR1MWvsSXcOQqzRciRgP4ULSeN543JZjRn7FhZ3ClFfJgTm4
         y82A==
X-Forwarded-Encrypted: i=1; AJvYcCX6UhgvnRQunpPS/i/4h1Wsw4AFgDi6VPXCH/ZczWIPaqz+I7qzL3Quky/69b0wRZG3pKUivnMpSxXAJG/0rDuG@lists.infradead.org
X-Gm-Message-State: AOJu0YxHh+XCqYck+4YEnVX0AZAJfcEJAmo7cQlDba4I+4H8o05NNh0F
	oZVS+qdYcnqdtO9ih7CSoIlGI0xgoWyNIsrqBitPMs6yjOlbHdvLg+huFtA2yEc=
X-Gm-Gg: ASbGncsSlyh4ObAnEqkt0nocZ/fTGJ6PO7sEK4RP6IRWv35mw9+QCCDZgn0Wzf4EMMH
	ES+tgRf6UvPHS4pMorepAgdF4HfWGlWHK+0pf0fgY6gYM53jwEUy/9U5uN9ZIOIhU+DVHC0HExJ
	Wf1D6l2xr5EhrRQGq/L0KdsK4jsUsjptFYkqp+X/1+4xJVXxu3mdDnv/FG4GJ9DaYad7aeRtlyU
	dWF0osygreNT9qmdD4JdAAFrJ6DuFQhbYkrl81ZHivOrJlg2lnL5Il+E3hyfAF55A6FL1dBWtmb
	BYh2tmTB0ttJZw==
X-Google-Smtp-Source: AGHT+IFnAzzmsoX/LnTlYKfUwdNafAjQwt9ZvkB3qt0FKjzX4kx3PyzgxFabDyvJ+Y073z4cgUVqUg==
X-Received: by 2002:a5d:648b:0:b0:386:3327:4f21 with SMTP id ffacd0b85a97d-38f24f9cc70mr1962954f8f.27.1739441426065;
        Thu, 13 Feb 2025 02:10:26 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5c36sm1435555f8f.67.2025.02.13.02.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:10:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary
 device creation helper
In-Reply-To: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
	(Doug Anderson's message of "Wed, 12 Feb 2025 08:38:25 -0800")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
	<CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:10:24 +0100
Message-ID: <1jfrki17fz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_021028_644401_1699DBE3 
X-CRM114-Status: GOOD (  21.94  )
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

On Wed 12 Feb 2025 at 08:38, Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Tue, Feb 11, 2025 at 9:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.c=
om> wrote:
>>
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++-------------------=
-------
>>  1 file changed, 20 insertions(+), 64 deletions(-)
>
> Thanks for creating the helpers and getting rid of some boilerplate!
> This conflicts with commit 574f5ee2c85a ("drm/bridge: ti-sn65dsi86:
> Fix multiple instances") which is in drm-next, though. Please resolve.

Noted. this is based on v6.14-rc1 ATM

>
> Since nothing here is urgent, I would assume patch #1 would land and
> then we'd just wait until it made it to mainline before landing the
> other patches in their respective trees?

That would simplest way to handle it I think. No rush.
I'll rebase when the time comes.

>
>
>> -static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
>> -                                      struct auxiliary_device **aux_out,
>> -                                      const char *name)
>> -{
>> -       struct device *dev =3D pdata->dev;
>> -       struct auxiliary_device *aux;
>> -       int ret;
>> -
>> -       aux =3D kzalloc(sizeof(*aux), GFP_KERNEL);
>> -       if (!aux)
>> -               return -ENOMEM;
>> -
>> -       aux->name =3D name;
>> -       aux->dev.parent =3D dev;
>> -       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
>> -       device_set_of_node_from_dev(&aux->dev, dev);
>> -       ret =3D auxiliary_device_init(aux);
>> -       if (ret) {
>> -               kfree(aux);
>> -               return ret;
>> -       }
>> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, a=
ux);
>> -       if (ret)
>> -               return ret;
>> -
>> -       ret =3D auxiliary_device_add(aux);
>> -       if (ret)
>> -               return ret;
>> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, a=
ux);
>> -       if (!ret)
>> -               *aux_out =3D aux;
>
> I notice that your new code has one fewer devm_add_action_or_reset()
> than the code here which you're replacing. That means it needs to call
> "uninit" explicitly in one extra place.

... but it needs one memory allocation less ;)

> It still seems clean enough,
> though, so I don't have any real objections to the way you're doing it
> there. ;-)

Both ways are valid indeed. Just a matter of personal taste I guess.

>
> -Doug

--=20
Jerome


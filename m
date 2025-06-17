Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C9EC71159
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=; b=xdJJXY8GB8ZXI/vr8p5YjiIbOC
	D3Kd9yUYcshzLlsCMAjq+tHDpgB0iO/qyEsHs+IyBVOrZ8uikoTWogfWcLp1+Wc9CWtGd+vG/XnPO
	OBbnvP2W3qsjep81bYwJqBnV9vEdrEwbsgkNhJUIfOgyNYFuaNolKBARdBtTA2vw2NbDyxbC2NkiH
	d7UwJCNteTr9CU0eKFI5sLugh/EUCmHEVm2qqxHjYHoSjjSyvVOpukppJYQEIrmRyQfeVupX8iJsj
	xdNIQBeWsd/54Vk8wrhmQ5qoaAVu4uzMKBxvaNkY5V1SL5C/jFfXOLKspt9HXR8xDWiaG7dHgqvtH
	isqvXMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRKBc-00000005tSL-2V3T;
	Tue, 17 Jun 2025 00:28:24 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJxk-00000005rxE-3Tbi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:14:07 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7482377b086so3010778b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750119243; x=1750724043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=EPIa2oTyGwKGjQdw/ugysVyPW5g5xRLBlNnrnSzdhQ2anV4B2SuPO11hSEv2AvwYjJ
         nxT8OrOhWrDIVNgrg84pJs8NS+NSjWYqOx7B5ciqUieJbM64xU71Mkd1MuG/gM9Cwkzi
         3M5oZF1YUpKcpaZ5i65OmE1EwHKY3Y47fC0Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119243; x=1750724043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=l0PDZvcq+MeUB9GK0pN+Dpa7G2Q+S9ZtVNJ4dK8+4bEZtiJ6pN/SKemyas9xUHzMl3
         sxOmyiYArMvdc6Nnzit1cXouoT7lXq7ibl9f5B5pnrZvZ6Kohbinduaxs2clPtLToMHI
         aLAY1JpUMfPIsZ5UcoaU6xjRuKLq0nl9bpBf7PMyqgX1Tu/DLHRdRjadzRt8JdNLnpHF
         vNeWwYnsbx20YrDcmheffcRvUawRkttAmo4/RUH7i3/MeYAp14CLFFgg7bz3vBaLKVOW
         EvIFeBWQNbTJN9OOtFUdyJyQz8HyiFqiwYyNlcZttcHS6qpHcNzRwo29qOjAdF8M0CKp
         HtQw==
X-Forwarded-Encrypted: i=1; AJvYcCXsaknb4+MudK9bh1M8E3HLJBWNYwRLIK7qpjRWqWTfZ7k24VTV71GnNH/1JCH9LszZK8GtgLpRIoHXq1YU0Sb8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9LCpWEobfqvt+JQMMNUO7RcYhmqEc6lTxwi99zsry3tCKvv8/
	y55b05AY4Wn0Cr9CewP4Is6KfX8F6f9W2Ns/Ifz3ZkpQKpP9sA37jWxaCeq31YRxoXSLwBjKXuT
	fQDw=
X-Gm-Gg: ASbGncugnULTC1wzDP9Y2D5S4fJkH6Yp4IYpGm5dmqMb6vcxQAxA4LdHeieBIQLv09A
	sz0gJZISJQcg3OWGFmN6Don/Dzf2ilvdsqNbqnEym0A/DjRMp3qCZu3oMu7XbLX7oFvZAEVv9HP
	xCXHW+8UMWWoiUgfIDTlNOGug+oORbinz5Y7TRb/57J8PDwbzmIMqC5JRDs39/SQuAiCcFyFDUC
	39knvnHFf+yNxgiWPDhe+3F/CyB87KG9kg7eKXf0hHHfzWRmoMFCOHcPlUfNW5VbMJT6IxQtUgT
	pUcXEHktdUKxbliQi6xRLRI8UPGuBq1lDlAqS8ThzFNLVbCXiTfa8DXiYO9VJ7cf6yLkcvopLPB
	kj2Sj6bI4UGESpM4mfa0/GbiaZQ==
X-Google-Smtp-Source: AGHT+IF5uL6f1QjugB5vI9g/o7nNYAV9l4rX1taZ+iAvdnd6a+m8j8LquInF/0ghjcezToLsHk2wfA==
X-Received: by 2002:a05:6a00:2381:b0:742:a0c8:b5cd with SMTP id d2e1a72fcca58-7489d039b81mr15507579b3a.19.1750119243152;
        Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890005f7fsm7797442b3a.54.2025.06.16.17.14.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso4033594a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnobsyp87eeyZqgkJE04Ks4tl6K7QYjDYjptHQ++oMZ/co34bzv9VdVW1p8hQ5FWUMpNy9uVPRXq7WoCNUY/D3@lists.infradead.org
X-Received: by 2002:a17:90a:da8f:b0:311:ae39:3dad with SMTP id
 98e67ed59e1d1-313f1d05b32mr18262369a91.30.1750119242065; Mon, 16 Jun 2025
 17:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
 <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com> <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
In-Reply-To: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:13:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
X-Gm-Features: AX0GCFs2ZyAAIENHNjz3BASVq2N7KuTDsUG8ACNS6wvc-Dx4zSZzUpIgLa-Czmw
Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250616_171404_890436_2DAC5B34 
X-CRM114-Status: GOOD (  28.47  )
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

On Mon, Jun 9, 2025 at 8:43=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
> >
> > On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrot=
e:
> >
> > > Hi,
> > >
> > > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@bayli=
bre.com> wrote:
> > >>
> > >> The auxiliary device creation of this driver is simple enough to
> > >> use the available auxiliary device creation helper.
> > >>
> > >> Use it and remove some boilerplate code.
> > >>
> > >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > >> ---
> > >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-------------------=
-----------
> > >>  1 file changed, 7 insertions(+), 42 deletions(-)
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'll snooze this for a bunch of weeks and check back to see if this
> > > can be landed in drm-misc-next every once in a while. If you notice
> > > that drm-misc-next has the necessary patches before I do then feel
> > > free to poke me and I'll commit it.
> >
> > Hi Doug,
> >
> > FYI, this is safe to take with v6.16-rc1.
> > Please let know in case you prefer a resend.
>
> Thanks for the reminder. Unfortunately, I still need to wait. This
> patch will need to land through drm-misc-next and that doesn't have
> v6.16-rc1 yet.
>
> https://cgit.freedesktop.org/drm/drm-misc/
>
> ...presumably v6.16-rc1 will get merged in before too much longer.
> I'll try to keep an eye on it.

Pushed to drm-misc-next:

[3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
      commit: 6526b02e10209608464f2645af59b2cc955b5a19


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E073AE65D34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAZGdYy0kLNz/HWKiT5Wenkd6deM0b7lB87bgXf3/+U=; b=cm2dbddcP3wHwyt7Kot03W2IpG
	lAdPgQQUHvaC51lgs72c3ByWThMku8r3rENwLwGZffi1uMV74gBOtLOA/ct0pCXGnaJuFJ4LidVUs
	32YMn7S5SKpk1nmgFJveuTHGiz7U+rG4eY7qFntZ3YjmDUQCpUpiczy+4WCkee9mgAguU3wqxIvP8
	7VJLHMA9ZdNm/5CXuA6T5/Pr0HzOrhQOKVQPfbSZ106gEHcjL3zLblqz/5bJcOXYpLMOpUWZsuu46
	JCFJLJ0qJMkEHqTYFsBRq2v44NV1F2YVTd8ti2L8HnbLmPylaDwp06nMxboXuNWYDsoVUEm0WR6TP
	zn5RZqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPAS-00000001wS4-3IU6;
	Fri, 22 Nov 2024 08:37:32 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEP9W-00000001wJQ-0Mvu;
	Fri, 22 Nov 2024 08:36:35 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ee745e3b2bso22258757b3.0;
        Fri, 22 Nov 2024 00:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264591; x=1732869391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAZGdYy0kLNz/HWKiT5Wenkd6deM0b7lB87bgXf3/+U=;
        b=TILB2CEkt46HMSL7Zp+7zrUlcOGUIoQjjRVKJaBybyibl6Cj279CVsVmYxwk72In+J
         Um+9AJF/YhZuE5tSioGFajEqtvPHpqmbTZ/Z6KvqpEufknT/z01y/b02HdS43Ey9+6ZY
         u/2z7X7ndVPmI2PPqioHeZwc/F9HtL8xUHzqQXcI0HiiVOlkTHW64Qz/ClcgYefaw6nm
         WyacEtlE7tk8t9bR/9Zu58aGG+/OBjYPvSv3SQFBxZjzIo26mte94sCcOJ1Cv97uWju4
         /H6P9h+Nd5u5re4KuuoQfuR65aRVOG8bhInaV9OwEbt/bohZnPCFv7bqegkAtVoqqlRj
         Z9jw==
X-Forwarded-Encrypted: i=1; AJvYcCVgYdcnv3Nl7eTBWzIHvQ+3c/YlahTCc91d4YVMZ/hZr2KN1NhXC6qOMyEgppoaUw+bsSArgJXN+/syJIDzrJ6Z@lists.infradead.org, AJvYcCXHAvO+/Ke7AYanvfTieFWFY+wanJh9tZsN6lg5I0EY3hMRXx/OVl81peV+G/zUFpWOZg0vylbAMY4hBIi+jWk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMEu5eo9FInLgcV8lfpgmZ23aceOQYfy6aHRL41wDgfUIqNs5a
	/f7jrT8iJ6jdIHpKbxokNvZXh/SjJ9P+KKxltvVqGYFpIkbT07Yu2P4arHnI
X-Gm-Gg: ASbGncv38qxJUuGhWO/PzU2R1KIM30apmW2rdaFVBIURhO+q+8HRIpa2axZQyasyG6D
	pC7UsxhCPP5AbSVlXaRwjmkLllqcOJKqbP5TuOQB7dZqoKe5V+WqRtrvNCH01lYuTaW/USykO+1
	63W0PJ8JuyxRUFJ7H5D0i0NovCZlBn7V2s8MZ05b3nEhepo/sY/vLkWLWkYgjif/5oOeqT1IF2k
	0qfUFFexWFRHyaCR/rK4LufQUzDkgylmzBx/nnBgWOYDGvVuLMvwleuOf8LlHiYDjvg5YZsVXy8
	08UtfjJ18+IUfXTg
X-Google-Smtp-Source: AGHT+IGUtyxA6bHM3Tk/VbkIoPAjYzFnDu6Efq4waRa4NIr9slwpWucFtUdSLQ82l5dVwW17jfViSQ==
X-Received: by 2002:a05:690c:4804:b0:6dd:f81a:80fb with SMTP id 00721157ae682-6eee08a9753mr17000657b3.1.1732264590909;
        Fri, 22 Nov 2024 00:36:30 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eee008cd94sm3543707b3.95.2024.11.22.00.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 00:36:29 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ee745e3b2bso22258487b3.0;
        Fri, 22 Nov 2024 00:36:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMtqI1c2VWzB4IEQIDtVZ9NUN2Zik0bgtI9p2TgFA3oBu+eE30jh8imv+KPxHDVAWJWakz/vQ+DD9AQUx7RNs=@lists.infradead.org, AJvYcCXBcRHUqScAxfnPQB0f5ktuuMgwqXS8jLsc+edDKGB7hUZbp/SI3hPGdhlfpWVzsEG1X/T+1GOj7ZBefJLdHC8G@lists.infradead.org
X-Received: by 2002:a05:690c:7084:b0:6e2:2684:7f62 with SMTP id
 00721157ae682-6eecd25bc15mr55712747b3.8.1732264588474; Fri, 22 Nov 2024
 00:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20241018151016.3496613-1-arnd@kernel.org> <20241104172950.GA741087@thelio-3990X>
In-Reply-To: <20241104172950.GA741087@thelio-3990X>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Nov 2024 09:36:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrrCiLm2sQmpegtVHV8X5AUp-8E5BejDxRpMbeAfHhvQ@mail.gmail.com>
Message-ID: <CAMuHMdXrrCiLm2sQmpegtVHV8X5AUp-8E5BejDxRpMbeAfHhvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: avoid 64-bit division
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Algea Cao <algea.cao@rock-chips.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_003634_125305_976BAFED 
X-CRM114-Status: GOOD (  27.02  )
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

On Mon, Nov 4, 2024 at 6:30=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
> On Fri, Oct 18, 2024 at 03:10:10PM +0000, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Dividing a 64-bit integer prevents building this for 32-bit targets:
> >
> > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/rockchip/rockchipdr=
m.ko] undefined!
> >
> > As this function is not performance criticial, just Use the div_u64() h=
elper.
> >
> > Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output suppor=
t")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Can someone please pick this up? It is still broken in next-20241104...
>
> https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integratio=
n2/builds/2oNvJFRj8tkDieb6VfrMf4rh1Kn/build.log
>
> > ---
> >  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/g=
pu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > index 9c796ee4c303..c8b362cc2b95 100644
> > --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > @@ -82,7 +82,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct=
 drm_encoder *encoder)
> >                * comment in rk_hdptx_phy_power_on() from
> >                * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> >                */
> > -             phy_set_bus_width(hdmi->phy, rate / 100);
> > +             phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
> >       }
> >  }

noreply@ellerman.id.au has just told me this build issue is now upstream:

    FAILED linus/m68k-allmodconfig/m68k-gcc8.1 Fri Nov 22, 05:34
    http://kisskb.ellerman.id.au/kisskb/buildresult/15277242/

    Commit:   Merge tag 'drm-next-2024-11-21' of
https://gitlab.freedesktop.org/drm/kernel
              28eb75e178d389d325f1666e422bc13bbbb9804c
    Compiler: m68k-linux-gcc (GCC) 8.1.0 / GNU ld (GNU Binutils) 2.30

    ERROR: modpost: "__udivdi3"
[drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!

Applying this patch fixes it, so
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Do we really need +5 weeks to apply a fix for a reported build issue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


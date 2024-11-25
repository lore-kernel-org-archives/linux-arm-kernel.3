Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E80D3B7FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8d+g8WKkfE6s6pK+JrY3tSWdNLGevwdYmgstGGTm524=; b=sQKLvgq3i6PlxjLA6/i+PUpPWt
	/mng1WFmJjzmDRIAQn1aHjtvaa80RlcT3CmOLUQofKLVh3icxj/bx0y9wYwoQ0Rsvd9RdW1HY3m7t
	bA4yK8d86IvrjjEom/yKbfCtnENDCZkCkhMaIhQEHwPytIOZncco3o9ERQcFag2PWP9nPGYGwitIo
	+mlsjFeGk5bzluM2oTLQhxBBEOs/l+1xhOKX/RPl223t5iql4hbPoAw7lqOw3TVy/ev04rD+tdbff
	cufvY76zhdNjw15zorjOuzczV/bbNWBNOkJDVuKA0ifsKcR/LI0X96k6N3Sw2jt0L5weeYA1/Fi2V
	gbIwf6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWSy-00000007mJd-0fq4;
	Mon, 25 Nov 2024 10:37:16 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWS1-00000007mAU-18PG;
	Mon, 25 Nov 2024 10:36:18 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6eeb3741880so37955297b3.1;
        Mon, 25 Nov 2024 02:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732530973; x=1733135773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8d+g8WKkfE6s6pK+JrY3tSWdNLGevwdYmgstGGTm524=;
        b=ikipQxeqpOqyhHb6rRi0ZV5YtsRviVX1afHnSOlf8KFJ5117hnLspEFdUwBMPzgox8
         9G2G2QXL7lpDr0SLneVzl42UQlZPlSKcjnOVhP7qBSeYWmm8ti0LMcCrSNIVZ7Soqfr/
         Ao6xHfq6LZU0v3u+2Auq6ab7L7iPoJ1ffSKNhkvrS1n4A6P39snWHFCegGnY/3DJAJEW
         FdkmDweemPEI+dZGHaPmzkILqIeGL6gjIPoPGB3peg2+5XKP0Wkj4u4JXEvr+SBUex7d
         FD7RIzydw933TD/swB5W6DesiFuVDJ2j7hclde+W9aOVWePp0F9R8j9AddHMMvIM49G+
         soGA==
X-Forwarded-Encrypted: i=1; AJvYcCUVsF9roFiFw8SOsWXRRbPlwap1GTm8Mlb+MDUSaRShoQR3+fcxLH2pu10HkATxBKx9gRh+8omb/mhggcdOt7/T@lists.infradead.org, AJvYcCW538FgNeCPC/keFtuKJJaABcPUNPg0eCpwv7IIfBppB8qZWLhZM51t1n/43V9NT/MVFGMNmyrXQcssVtlxNyA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5gZuhqWp6unzlF0Ry1z7wweIpcqo2d/YI2db3yyldoixY6Uxm
	hFNrbRW5XVhwjWARST0SR7nQaipssA+vZemRPtX55+rherqOGxJd+/CsOL5m
X-Gm-Gg: ASbGncu+GMhahOwy8VwKSCqQnhSjqXBhyQdhZR/hEw8WvDMkf1r0+vbW4rTqx0Qmo4A
	ENrS48IH9XMvmZN/jIvFT1rA/7GvkXlY35BIj5pCR01Ec6kRC4lwyUPSCBSbSVGuYmLeAGOTHkm
	OezAhMwRdvPv5r67vMjWWjOEUY2XnIOLJI/hBxDdz/DkXdUitE4littcGrFVEV9fh/Q59+bNs6T
	bZlaE57G4bwVdcxD3ZISMI+krhuE8GFXWtui8IETUNaxYl8rCFDVN4CtbYqp/GQdWGdV0iheBl9
	mSLIjeTGpOXwDgrs
X-Google-Smtp-Source: AGHT+IG76IhWOKIFxX4gAwpubnHZ8WHn1cnNUiND6pnTIb9c/TwhN8Q1oWDZ/8Mt7Y0rIRUYy5lJ9Q==
X-Received: by 2002:a05:690c:6007:b0:64b:5cc7:bcbc with SMTP id 00721157ae682-6eee0a25186mr122773477b3.32.1732530973066;
        Mon, 25 Nov 2024 02:36:13 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe153e3sm17416777b3.22.2024.11.25.02.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 02:36:11 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ef0ef11aafso7207887b3.2;
        Mon, 25 Nov 2024 02:36:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUajcawARBH60ZCW8yjKCM2AvrLXtKGfscMe8hN5qedVG8iLYLOP0aLKHSsgDSwImRyFkeimg1tqSM5C6SrxHU=@lists.infradead.org, AJvYcCXwFfJhTwVO9YTSi/s+TN5kVawkKa6H0uwqbE14E11aGysHNoemd0y+kbH48UTs71zsw0cbEVmBPID+dxCWD7+b@lists.infradead.org
X-Received: by 2002:a05:690c:4a13:b0:6ee:cf8b:c6c1 with SMTP id
 00721157ae682-6eee0a24b1cmr108161527b3.29.1732530970890; Mon, 25 Nov 2024
 02:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20241018151016.3496613-1-arnd@kernel.org> <20241104172950.GA741087@thelio-3990X>
 <CAMuHMdXrrCiLm2sQmpegtVHV8X5AUp-8E5BejDxRpMbeAfHhvQ@mail.gmail.com> <20241122-rebel-donkey-of-atheism-a0b8b6@houat>
In-Reply-To: <20241122-rebel-donkey-of-atheism-a0b8b6@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Nov 2024 11:35:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUC6cq+ybVzOC9n3XaT-x3oy+7tpA+Z=e8a4yd3B6Ykng@mail.gmail.com>
Message-ID: <CAMuHMdUC6cq+ybVzOC9n3XaT-x3oy+7tpA+Z=e8a4yd3B6Ykng@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: avoid 64-bit division
To: Maxime Ripard <mripard@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Algea Cao <algea.cao@rock-chips.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_023617_302039_A2857ABD 
X-CRM114-Status: GOOD (  35.24  )
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

Hi Maxime,

On Fri, Nov 22, 2024 at 10:15=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Fri, Nov 22, 2024 at 09:36:16AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Nov 4, 2024 at 6:30=E2=80=AFPM Nathan Chancellor <nathan@kernel=
.org> wrote:
> > > On Fri, Oct 18, 2024 at 03:10:10PM +0000, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > Dividing a 64-bit integer prevents building this for 32-bit targets=
:
> > > >
> > > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/rockchip/rockch=
ipdrm.ko] undefined!
> > > >
> > > > As this function is not performance criticial, just Use the div_u64=
() helper.
> > > >
> > > > Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output su=
pport")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > Can someone please pick this up? It is still broken in next-20241104.=
..
> > >
> > > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integr=
ation2/builds/2oNvJFRj8tkDieb6VfrMf4rh1Kn/build.log
> > >
> > > > ---
> > > >  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drive=
rs/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > > > index 9c796ee4c303..c8b362cc2b95 100644
> > > > --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > > > +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > > > @@ -82,7 +82,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(st=
ruct drm_encoder *encoder)
> > > >                * comment in rk_hdptx_phy_power_on() from
> > > >                * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> > > >                */
> > > > -             phy_set_bus_width(hdmi->phy, rate / 100);
> > > > +             phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
> > > >       }
> > > >  }
> >
> > noreply@ellerman.id.au has just told me this build issue is now upstrea=
m:
> >
> >     FAILED linus/m68k-allmodconfig/m68k-gcc8.1 Fri Nov 22, 05:34
> >     http://kisskb.ellerman.id.au/kisskb/buildresult/15277242/
> >
> >     Commit:   Merge tag 'drm-next-2024-11-21' of
> > https://gitlab.freedesktop.org/drm/kernel
> >               28eb75e178d389d325f1666e422bc13bbbb9804c
> >     Compiler: m68k-linux-gcc (GCC) 8.1.0 / GNU ld (GNU Binutils) 2.30
> >
> >     ERROR: modpost: "__udivdi3"
> > [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!
> >
> > Applying this patch fixes it, so
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Do we really need +5 weeks to apply a fix for a reported build issue?
>
> Do we really need that kind of comments?
>
> It was applied already, I made sure it's part of the next PR we send to
> Linus. And it should be in linux-next tomorrow.

Thank you, I can confirm it is now commit 818956c76517e127
("drm/rockchip: avoid 64-bit division") in drm-misc/for-linux-next
and next-20241125.

Interestingly, the commit description contains:

    (cherry picked from commit 4b64b4a81fcd51f570c046cf904aef19ec756d45)

which is not in any tree on git.kernel.org, but the github collective
does know about it:
https://github.com/torvalds/linux/commit/4b64b4a81fcd51f570c046cf904aef19ec=
756d45

Probably you want to drop that line.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


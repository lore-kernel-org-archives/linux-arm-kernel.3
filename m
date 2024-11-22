Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A88E65D3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xM8g64sET8hw7b+gyg+vsiEnmYLC8RSZn0rXhR5lgBE=; b=gsHk4m4fdsN/BN0WSP0zkMxzBU
	t5xDnGIe/HB8QnajTd3MrGeZbbQ7z72w/tMmCW8uwUra0PULOWPa9jPIolGOMBxB+Fyzs8wFjFIen
	D7bEbCj0slKgekvvFebpowK0S8L74D/wwBIiPO4DS4h7YhlQbBevJqjxq1P1KIy+7XDRJume8qHpH
	p++65911L9BODmpnGffMY126810LWmGAX0Nb6AgroZpxIGqXThWVz94oJYxCVOnlu0zTQOLzz5JVh
	J/bGOcNi7LfD6MdxWNgr7wQ7OIJhHki7KHqDxqdfCXeLJKIsDxS9WTUF9guQ23joLpeaAhZZGlEj5
	vGZ3v5bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQ3Q-000000026xN-0KyJ;
	Fri, 22 Nov 2024 09:34:20 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQ2S-000000026qF-1XtQ;
	Fri, 22 Nov 2024 09:33:21 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6eebc318242so18627737b3.3;
        Fri, 22 Nov 2024 01:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732267997; x=1732872797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xM8g64sET8hw7b+gyg+vsiEnmYLC8RSZn0rXhR5lgBE=;
        b=DtPDUbJrtoNO/7YoX2u3AiSOGO1L1X9sH5FXcx8PbqWVDGPgwthjPql4ruEFhV/+he
         xv339P6FovUM1KowYO5aJdSSDqKPDUw/opVbdTOG06y6g134RpfQr+W+jnKLgKPa9sOA
         KGvKAJJHBq30UG/MGwsdkwBn8bySTR185CBr9zseOijuga2+ZUM1cjji1K6C5QXuskRD
         nmB/GsDvhvYMX1o52S/XHpRNvVjURL028BCeJviu77c3cwpvWiyt/BmAPVkyjYKxrcSk
         5DRs7qVUGRexJS/WUOqcwX21sim3aKC7zB1cOLVGXXkTWncEKUbIlz7EpNUxi9yoOEA2
         ibcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzFuDWbxW2UqKYTxjwnM1dFU/O3UULolJMoEfnjMJiXNjY1ZgbpWTom0EZ7aCqqGQq9YTfKLBvpVcd6ku4xbRQ@lists.infradead.org, AJvYcCVmdCASjinJ4Fm7LrQ+NP7a0pe5TUi11V1MEEmnKt+MF2Gk1YDiWryluFHE9diUXObQtYPCnIyO720/yz1OKaU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHcgmMn9YUj1O8Pk9dvkqRZ19VukCwuGU7tTnxj7G6GernayIj
	yVwd8Q6Id459mO7tO4VscphxQWZChFaOOM+q0dGPSK/SAWmTzwup7uq5JBOX
X-Gm-Gg: ASbGnctznNrm0PvYTpIRHc45PqjsaKeynEkMcngwjhA2vxDlHTQCC6UZql7onNpZd1q
	vddqPkU2BTqAucnIGJy3LkNKP+4+PW01uambi1qAsyagi72Xy4RLTDvChEJmUQqbrjCCQl1o9M8
	yfsxck/jAVDXccyoSGnT15dsX8YlhNVUSI4KDlmRWlDBHIPgAc2kE0UOyLVfYleshWKUyJcJ+Xj
	ARI07445hBVRqCouyms78W9u7BnucXJ13bmOjH4GpbGVtRUYODCU07TjmhjxdwPtSMFI2oFCHor
	uZUf/otPnDCUIroq
X-Google-Smtp-Source: AGHT+IEkCZTnG1llqHidAq0UfunXnyVRvm2qf53CjY50+lzRXQ7sDIy8UkF9yFtEdXuHUHYfMyBNTg==
X-Received: by 2002:a05:690c:6801:b0:6ea:86b6:f703 with SMTP id 00721157ae682-6eee08b6a17mr27051027b3.1.1732267997384;
        Fri, 22 Nov 2024 01:33:17 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe15636sm3717147b3.19.2024.11.22.01.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 01:33:16 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6eee6874ef8so3134327b3.2;
        Fri, 22 Nov 2024 01:33:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEZBgrvCSQVFQ5FLNcokRKTQ7d05t3mbOnziVPZZUgqBYMHzD4MFIR/BqI2jVzi39CWXEceDeSCyToSAVHZWp4@lists.infradead.org, AJvYcCUuxhSRXNoa0jM5a1v3iDoDDHgxjbfxE2SvfiNUWo1DnTl7vZix4GOyvfJYxnkSt2Nl6mXhBhx8B47BnHomdoo=@lists.infradead.org
X-Received: by 2002:a05:690c:6e09:b0:6ee:9cb7:dc31 with SMTP id
 00721157ae682-6eee08b5abemr26651957b3.3.1732267996019; Fri, 22 Nov 2024
 01:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20241018151016.3496613-1-arnd@kernel.org> <20241104172950.GA741087@thelio-3990X>
 <CAMuHMdXrrCiLm2sQmpegtVHV8X5AUp-8E5BejDxRpMbeAfHhvQ@mail.gmail.com> <20241122-rebel-donkey-of-atheism-a0b8b6@houat>
In-Reply-To: <20241122-rebel-donkey-of-atheism-a0b8b6@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Nov 2024 10:33:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGfCWyFHnAKeg4YViErzX5BReb2A-8gtqECstUMn2Oeg@mail.gmail.com>
Message-ID: <CAMuHMdUGfCWyFHnAKeg4YViErzX5BReb2A-8gtqECstUMn2Oeg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241122_013320_414481_22BF5D68 
X-CRM114-Status: GOOD (  36.09  )
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

Perhaps not...

> It was applied already,

Where was it applied?
How would I know that, when the fix is not in linux-next?

> I made sure it's part of the next PR we send to
> Linus. And it should be in linux-next tomorrow.

Thank you!

The issue is that the reported build issue was not fixed in linux-next,
despite the fix having been available for 5 weeks, thus reducing
(build) test coverage for all affected architectures, possibly hiding
other issues.
In addition, a PR including the build issue was sent to Linus, so now
the above applies to Linus' tree, too.

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


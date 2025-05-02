Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223D4C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTBU8KDuaw0MZ5mo3TpQxjrSQh6hNnlJMMU6puM7atA=; b=Mm/mEmZfnX1WDS+dcXqKfOGcPg
	cCjaqrlWvUF4wwt44pTlyDHMEUQQYJPYl4a5AB31DjXm2a11Tc2349Yjky6/q14NNwhmgkyXn+7l6
	pl7hfJxlRv4qMCxJWTgiJ18a9kdtuurMDVqNS3MZzFCADuC5fQ2TmOkMVOJCqJg2UTOoXc7bbD7hB
	RII5bw/BH55Of32l/O1rweEK4jAdfEx/gVjrjh5nNOxam3K9mdXUGWkNyb7fJnYHzfrXi+EuLiUvS
	BX9104+2TVFMK2ZUblX7FkKTZfv92kdkp/n95Tnrqvx7rcZ0ofRFlOqJARPjMubknvr+8JG7Zuwdp
	cUzg6inA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuLE-00000002hRO-0xG2;
	Fri, 02 May 2025 17:38:28 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuJG-00000002hE3-3MlL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:36:27 +0000
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4c4e1f16833so629190137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 10:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746207383; x=1746812183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTBU8KDuaw0MZ5mo3TpQxjrSQh6hNnlJMMU6puM7atA=;
        b=X8n3UdYiGLe34qSWZ6hO8A4D7nlEesQfMPQOSYsJYYjryAA+l01Y3uexZ8RkuBm2Eg
         XcOwpfTX0jIgbXUjh6g+fYyvh09TGt6PxHakq/jM3PiQ5kp3BLndsLCptjREKP8i5Y1D
         foaNqjDm4o3dlMQBHg2Ybiw5BA//kYuKcSlB3cO4J5og0EQ2Pug4bPu3+IplZNMrUdW1
         57JWMI51rZYakcbYWTcB9ALFEl+DYwtgcbKFJEeUdGTyEZN55drwb/KceFxDwiklEPeO
         Qs3kCLCap80bh7+lzXwUP7CxIlyNsoQtzTSc6WNOmCTgnEafWz9Q0up5kj2ZQAldRVyN
         035A==
X-Forwarded-Encrypted: i=1; AJvYcCXr7tsSsxSIVOykwu+QIOdwVP6Q0zCUEfDJkKLI5MnLT11x47WdDzaOwhLlyoayLjFl0ljSVfQnwMHI9jUAUrOC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/RdNxkD7XYJjJBm7C834Lka8yaBLFFHipCzQq9ZO2hAcNHVOW
	dMDEbM1eu35bkNIH98d1C6Xzmvp8CL5CJs2S2rhOqTMex+LA83cFMXGBE+II
X-Gm-Gg: ASbGncsTQsBwEdf7Fp3Xc+ilGN5NxphFdx0JIsUxnNo86GPks6gIB0xfz4dfmMz+dg9
	g0BlbFNpSERo5s/mVMG063Fj8mLLgLc1QBW7afe4nnpSgxEl+gNRWCeYrpOIxXVPR2lhLEL8pfJ
	MiUajWdZW8fd3Ti5wwDY/ol1AnhbcWt/QxB9DBJrxoYd/kmHZdXnUtsvJpmiMRP3LFYcO6Wo8wa
	Nui5+V/SHxjQRzU5X5J+VvCtWC9VsEJlmtsohKYwO9FRxzJycvNQMcPjTcNcRV8UyYylsasRZMQ
	TSqj9ZK4VwDpokiqJzUaYRka+13OsYQA1LNk8n4u3uWlnSK9CC1YSfV+REMQheElNMh439uwQXB
	hdhU=
X-Google-Smtp-Source: AGHT+IH8Xrll7YUyofFJvF3dFqzKnOMOdqjYzJyJUXkmtlHaaMkHuB3pJSD9jcXZE6K2f/z6znIsnw==
X-Received: by 2002:a05:6102:554b:b0:4c5:8d52:af3 with SMTP id ada2fe7eead31-4dafb68d068mr2657495137.20.1746207382905;
        Fri, 02 May 2025 10:36:22 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780b02018fsm338808241.18.2025.05.02.10.36.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 10:36:22 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86feb848764so561073241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 10:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpQhBiuSqo1orGM9mam0bfOImegrI7qkV6MpfHNW4qFtLzvJ3ucPd2UXBVfnjIxOMWvW9uWW+VQn9oZLtrJHmv@lists.infradead.org
X-Received: by 2002:a05:6102:14a0:b0:4c1:8928:cefb with SMTP id
 ada2fe7eead31-4dafb568c8fmr2928071137.12.1746207382273; Fri, 02 May 2025
 10:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com> <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
In-Reply-To: <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 19:36:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
X-Gm-Features: ATxdqUFl-CkBYyUk_oNIA07GJwlne1SaC3Up0FBSpuVt_Yz_D6ZlhAvA_mVeIEQ
Message-ID: <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe
 for all ARM64 SoCs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_103626_840158_2AD16029 
X-CRM114-Status: GOOD (  34.58  )
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

Hi Prabhakar,

On Fri, 2 May 2025 at 18:10, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Fri, May 2, 2025 at 3:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Fri, 2 May 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Change the OSTM driver's probe condition to `CONFIG_ARM64` so that th=
e
> > > platform driver will defer and reprobe on any ARM64 Renesas SoC once =
its
> > > reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
> > > were covered.
> > >
> > > By matching on `CONFIG_ARM64`, this avoids adding a new config entry
> > > for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM3=
2)
> > > are unaffected-they still use OSTM but do not define a resets propert=
y,
> > > so the deferred reprobe mechanism is unnecessary.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Hi Geert,
> > > I've restored the Reviewed-by tag from v1 with your suggestions appli=
ed.
> > > I hope you're okay with this.
> > > Cheers, Prabhakar
> > >
> > > v1->v2:
> > > - Instead of adding config for new SoC, changed the probe condition t=
o
> > >   `CONFIG_ARM64`.
> > > - Updated commit message
> > > - Added a Reviewed-by tag from Geert.
> > > ---
> > >  drivers/clocksource/renesas-ostm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource=
/renesas-ostm.c
> > > index 3fcbd02b2483..6a5785f9c9c1 100644
> > > --- a/drivers/clocksource/renesas-ostm.c
> > > +++ b/drivers/clocksource/renesas-ostm.c
> > > @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *n=
p)
> > >
> > >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > >
> > > -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> > > +#if defined(CONFIG_ARM64)
> >
> > Sorry, I've just realized RZ/Five also wants this.
> >
> Ouch, I missed that too.
>
> > "#ifndef CONFIG_ARM"?
> >
> Im wondering will it harm if we have it enabled for ARM too (I dont
> have RZ/Ax to test it)?

ISTR it caused issues on RZ/Ax.

Oh right, and those got fixed by commit 37385c0772a4fc6b
("clocksource/drivers/renesas-ostm: Avoid reprobe after successful
early probe") in v6.10. So I think it is safe to drop the #ifdef
check instead of extending it.

FTR, with the platform probe enabled, and 37385c0772a4fc6b reverted:

    /soc/timer@e803b000: used for clock events
    genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs.
00215201 (timer@e803c000)
    Failed to request irq 16 for /soc/timer@e803c000
    renesas_ostm e803c000.timer: probe with driver renesas_ostm failed
with error -16

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


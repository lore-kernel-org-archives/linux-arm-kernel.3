Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEE0C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIvPqFh1bSmMO8wWItITLD+unYaVgvsJbSEKAGTEleY=; b=zGsOJVB1cKl3Urhn0azSJzUDZj
	4Z6QR0wRHrGJs1TLyO+jF/wHMViIb6YDjBVq59AKRoX1pQ4kqLjDOT3VTjjDgvfWATddlU5yvd8CF
	lkVc/9U+5s/FmPyMZBFH27i2xlA+LuEeVotL006ZE/6CL1estwW2AFjNFWqNnH0OoO0oGMpHf1VKS
	vSEST+MR7rxX4yqD4DAWPKn8gnl+pg5gwWdRcAv01dqFIEwOKmJnzZ0f5oKUJhNnTrwFuDcfChUIR
	3qUJCsyzAhGJhq5h+Ssuuhgg0oVFpYOpLFuvh8waBRic7U1dt6HBI5lq5/sV0Wa2D7kWyVkIfDymJ
	t43YpROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyOZ-000000037HF-0XX9;
	Fri, 02 May 2025 21:58:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAyMe-000000037Ax-1wCR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 21:56:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2592141f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 14:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746222971; x=1746827771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIvPqFh1bSmMO8wWItITLD+unYaVgvsJbSEKAGTEleY=;
        b=B/tvdECevy/Y/0KWStepfjXNSrcGKsvxCK0VRNUb9te6H1iB/pt7f1fZ9nT3M7UATm
         BZQv2FgTauycTRFENpnLChQwis6Pirp/WnGQFpli+zZgT9nGs8pS6LpezSFV1HBzj/oE
         AhLX1cJSEbXV5kCegnPTtR3yi0CmkGwb3dIhPjY1CyvfNomeBj+hPptUW7Zk593BhTAG
         z+ZODhi0gnpUXF0cCU0/2oEgIlVhsrnqVqjBBugTKpAEcBPgP6qVme0yJ3xyis71LoCX
         tJrabEDTE8nb4Oi6oW6LEunatGm3E0IrdpdDfflEKZdJ2Ud5AqAadUGjzbTCp6//w0eQ
         UjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746222971; x=1746827771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIvPqFh1bSmMO8wWItITLD+unYaVgvsJbSEKAGTEleY=;
        b=IzlKGXlvrCoH/1Xt/VIcyJa3pOZKGl37Y1JLz4RnIYqkhGTWbAc+CJ7zu9vzGJzZLm
         8/xeQS/cM4+MrfgLayF47Hhth+xwGnz1dQmD+IAzr0Bm0gYqJ+DJmVa2YjrLUak8kj8X
         kJQ9I4zZBcly/rn3BsT3xChwIapj5myMJryI957tn9Y3972qfgOXVVEUpENqS5f/sPgv
         JnHjptIFshB8A9kF8UM57uGtqSXVNHlRim2vlIUx5I72YIkFZF26kJInhsWVG8h7QkG1
         0Crre+pw7tnTCkqtM+ot57s0WrWPsKGXk3tWRzj3BQyHvN7jM3/slMJcqrHaKz+sBfJP
         r/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKAfUv4l8EbQU+q3nmJxwvXUxxlJGqlXNFkF2x39eQ1qy4mAuz1WEfJdHE2ib6ADQMYBkIQrEXlbyL591Z0OGS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1r0CpEYlefW1viQRapmQYH6492qSQXQCuLFMpcRKuWfH68mgM
	C98TMz1d/pxS9Ri0AMyWWXceQ+LGzsN64nQGtPcIhsd1L4bXNzFfflFdq+qoNaZqXgE1DYukrA0
	KnceKB/2B3guP97GPQfX2qreq26k=
X-Gm-Gg: ASbGncvLi0JlFICtHqAVRH+FHgXN8vMGhs3qpyZl0Cy97nAJI1lJ9Pt5GrZ88aw8CTf
	7HI4ur2e9eIsx2RB1KfeeZ8s0nJFcmpg5FCekmspvIeagYmuBBzVTsBgQlZtFXwmki8BnAqgMH6
	2FdxUEc65wgOOKx65e7uua2EY/o8yKrEvz6g==
X-Google-Smtp-Source: AGHT+IFl+MRsV9J9nUptoXNbXZiIMrW6eP7y6f3wW7mfpaU2h2XmONvIp5/7UcNAkL9ozkcXMiTtg4dCMT3oBCA84EE=
X-Received: by 2002:a5d:47a6:0:b0:39f:b604:4691 with SMTP id
 ffacd0b85a97d-3a09cf6af9emr452963f8f.58.1746222970638; Fri, 02 May 2025
 14:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
 <CA+V-a8v5HHZUfhKhy-jasC5vKdL6MYBCnnVZ71rdtQOv5Tn-Sw@mail.gmail.com> <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWJ+Qcmj3aCEsd5Ydr9qn4hsr013w_ffjzj=jhtS9YFtQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 22:55:44 +0100
X-Gm-Features: ATxdqUE8T1Mu-5AOrIjt5lex4I3-3FPgX7a_P5_IZCEHoJrMGwqdxjz8WFgR-To
Message-ID: <CA+V-a8tsjXVirSK8_Jnx6MQpkSPbxfiri_8b4-gU8hoKfVBZgw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe
 for all ARM64 SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20250502_145612_498601_C56F10E4 
X-CRM114-Status: GOOD (  32.34  )
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

Hi Geert,

On Fri, May 2, 2025 at 6:36=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 2 May 2025 at 18:10, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Fri, May 2, 2025 at 3:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Fri, 2 May 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Change the OSTM driver's probe condition to `CONFIG_ARM64` so that =
the
> > > > platform driver will defer and reprobe on any ARM64 Renesas SoC onc=
e its
> > > > reset controller is available. Previously, only RZ/G2L and RZ/V2H(P=
)
> > > > were covered.
> > > >
> > > > By matching on `CONFIG_ARM64`, this avoids adding a new config entr=
y
> > > > for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (AR=
M32)
> > > > are unaffected-they still use OSTM but do not define a resets prope=
rty,
> > > > so the deferred reprobe mechanism is unnecessary.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > Hi Geert,
> > > > I've restored the Reviewed-by tag from v1 with your suggestions app=
lied.
> > > > I hope you're okay with this.
> > > > Cheers, Prabhakar
> > > >
> > > > v1->v2:
> > > > - Instead of adding config for new SoC, changed the probe condition=
 to
> > > >   `CONFIG_ARM64`.
> > > > - Updated commit message
> > > > - Added a Reviewed-by tag from Geert.
> > > > ---
> > > >  drivers/clocksource/renesas-ostm.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksour=
ce/renesas-ostm.c
> > > > index 3fcbd02b2483..6a5785f9c9c1 100644
> > > > --- a/drivers/clocksource/renesas-ostm.c
> > > > +++ b/drivers/clocksource/renesas-ostm.c
> > > > @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node =
*np)
> > > >
> > > >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > > >
> > > > -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> > > > +#if defined(CONFIG_ARM64)
> > >
> > > Sorry, I've just realized RZ/Five also wants this.
> > >
> > Ouch, I missed that too.
> >
> > > "#ifndef CONFIG_ARM"?
> > >
> > Im wondering will it harm if we have it enabled for ARM too (I dont
> > have RZ/Ax to test it)?
>
> ISTR it caused issues on RZ/Ax.
>
> Oh right, and those got fixed by commit 37385c0772a4fc6b
> ("clocksource/drivers/renesas-ostm: Avoid reprobe after successful
> early probe") in v6.10. So I think it is safe to drop the #ifdef
> check instead of extending it.
>
Thanks for the confirmation. I'll drop the ifdef checks and send a v3 for t=
his.

> FTR, with the platform probe enabled, and 37385c0772a4fc6b reverted:
>
>     /soc/timer@e803b000: used for clock events
>     genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs.
> 00215201 (timer@e803c000)
>     Failed to request irq 16 for /soc/timer@e803c000
>     renesas_ostm e803c000.timer: probe with driver renesas_ostm failed
> with error -16
>
Cheers,
Prabhakar


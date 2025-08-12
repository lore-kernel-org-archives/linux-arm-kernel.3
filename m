Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB4FCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+fE4qi+RcEuypAjW0Bd5U93e0N2So4i7NT1OnYWUSk=; b=LDyTSLRZtXqXZTmQDELFo9kcY0
	BshqGgd1UYeYeM4FjneWQOAC3TCIOW3izJy4XzMGBgYtaE0CxNY6o6d2+/6irF5/QBhSxm3gK/WXx
	jrrMELd0xj0IwYWghcuMObvQcqzMIqxodC1n4Y69OfQvw2hdCwIVwY+cyK5c12SohQCKSJUk1A8NH
	KyWkv8cUg4DXPeeiIIc31qb/bnTvxS/NexwoZLGdi/MSt/Qw/i/oVP//o1UKAlfQ+RPA5lCOuenm8
	TD6Q/smqxG8EAjA2aLuey7Zrez79abqLIdFec+/fOwQfePYqJA3RgDuR7TtOiswfdf8iqT2mcAxPD
	aW1eirhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgf-0000000Bx6a-1D6y;
	Tue, 12 Aug 2025 20:33:37 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulteN-0000000Bhib-1nq8;
	Tue, 12 Aug 2025 18:23:08 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b4245235a77so4896465a12.1;
        Tue, 12 Aug 2025 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755022986; x=1755627786; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+fE4qi+RcEuypAjW0Bd5U93e0N2So4i7NT1OnYWUSk=;
        b=koTO13zkM7aJpO3e7vqt+D5NFOKXCTENP6OeLpPGmhYm8Js+yR8Vvl40dtTSnBluea
         VbESN3YVCRJbMBrFE/TipYK7ChK3CFHsfdYdn9jjoc9z3GjI/Mcd2YF9NOWgyfA64tNh
         MbRT+gqOVjp9NExf+N6sx+yCrH154GCIKk8tE2ZKIMMQjoK8TpG33gEQWm9ZS24Ta0zI
         GDczN2Yi4mvQZEgzOrsIDmdAocEGWppQham2GGH7/BJXyBGzNFWd8hNI95P/G2r/2Pzj
         8JNJb8x3sGKns6Q+XDo0gwdjv1CdUrEDSAofpgR9qMz9h3GIHfnFbxx3REs7tyihwFGT
         IuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755022986; x=1755627786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+fE4qi+RcEuypAjW0Bd5U93e0N2So4i7NT1OnYWUSk=;
        b=NnZ/e6BbsUIYxqHcN1ORRoaAf291lLzNLfMXjXU2R5wHEuLhBUchGhnJqbjL0KWBpb
         OD6OGMmJxggo+FKH4vVFhDpqjUXOOeNgICiOWPfewFpWgvsL3JTCkan7FkpoNe35TZ96
         0SMLxBofeaXReMwQSHpAMOUjJmq22OKjZAJnZlY6uS2TRqOiO461E23osx7H0d/WpxwY
         kMS9+5NhrddQF8d96nuZOvH9WA1EEBg6jqAdTJ6lS3fMl+1lf0zXCjj0dQPUMVZ1YsJT
         m0TrncvLwVl/TbDOTZWy2VVVPWMG1fm+A7BHdDETI+FOP4T8GGOZ9snfJMgdLxENWHtS
         CExQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFy2OE0/8+tjqsrO5JXDVq1p6emIqxWXUKV10FMi1OYpVtChz20vokGE8jyNpAoEKxZ6DSOZy0pZtvBdTQqkTz@lists.infradead.org, AJvYcCXioMc7MOXoGflaC2cwYsXttgZyfyE9yNbVCtiTJHkgkYT8MmXN1yY4IaXbSQ5Ogk5Uyaq85AP64sOMYSggx9g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHTObkaO3uNTznAE8IvkoqpZpfb2agjcUdMz1AtAaeUziDdult
	0qrPrHZZk9s4bkcyVDmfq/50JafJ9AleUjRBTm+9syfAn/fXh+w/Amh2D10551QVg/9xra018W9
	pcPLGlP80Bettq1VT9pEKt6jEMwtwc3I=
X-Gm-Gg: ASbGncsI6WEViHE+q0L2koR4GbOaZZUcyPHtKzo4BlB5pjp3YiUYctVMoBrG2biUSeU
	k/HKFYNWNgX9xleRxAkjU4Q10j5DJJo3/PZAn7B0YHeOu2bFaeZLZROUvjRu2uAswHKUqIKoUec
	SZMaMscBydG2ze/rpG/ci/mWpfZj3SK8hhuIgNek/XiqclueOnQoQXZ2onCOV5OVUe3pWPm3ard
	AJ/O+4=
X-Google-Smtp-Source: AGHT+IF1A81h6PBEtWt1slLi737ERxn8vSMYRw2gKSj0MQoOmspT2W2SwpWW3xVupvi6KHU+18JPG2LtGK88eiUCFBY=
X-Received: by 2002:a17:902:f612:b0:240:10dc:b795 with SMTP id
 d9443c01a7336-2430d08b468mr3464675ad.1.1755022986134; Tue, 12 Aug 2025
 11:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <175308758352.3134829.9472501038683860006@localhost>
 <175326599663.2811177.16620980968274114885@localhost> <m3h5z2vw12.fsf@t19.piap.pl>
 <175344176070.2811177.10693943493658922992@localhost> <m3qzxyug1s.fsf@t19.piap.pl>
 <m3cy9futcj.fsf@t19.piap.pl> <m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl>
 <m3a545t789.fsf@t19.piap.pl> <20250812103243.GK30054@pendragon.ideasonboard.com>
 <175501095338.74722.11604545949710100799@localhost>
In-Reply-To: <175501095338.74722.11604545949710100799@localhost>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 12 Aug 2025 13:22:54 -0500
X-Gm-Features: Ac12FXwjCPlZoDfcVHADfdJKsSiklxExi-nNGmkRvmvpKutlc9OII1WL40p-4DM
Message-ID: <CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_112307_469670_D05DFF7A 
X-CRM114-Status: GOOD (  36.40  )
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

On Tue, Aug 12, 2025 at 10:07=E2=80=AFAM Stefan Klug
<stefan.klug@ideasonboard.com> wrote:
>
> Hi Krzysztof, hi Laurent,
>
> Quoting Laurent Pinchart (2025-08-12 12:32:43)
> > Hi Krzysztof,
> >
> > On Tue, Aug 12, 2025 at 07:54:46AM +0200, Krzysztof Ha=C5=82asa wrote:
> > > Hi Stefan et al,
> > >
> > > BTW I've added Lucas Stach and Shawn Guo to "Cc" list.
> > >
> > > The problem is the CPU core power supply voltage :-)
> >
> > Ah, the dreadful overdrive mode.
> >
> > > - while the reference manual specifies the max ISP and MEDIA clocks a=
t
> > >   500 MHz, the datasheets show this requires the "overdrive" mode =3D
> > >   increased CPU power supply voltage. In "normal" mode the ISPs are
> > >   limited to 400 MHz (there are other limits, too).
> > >
> > > - I've tried lowering the clock rate after booting the systems (with
> > >   a CCM register write), but it didn't fix the problem. I guess some
> > >   reset logic is affected here, and the (lower) clock rate must be se=
t
> > >   right from the start, in the DT.
> >
> > That's interesting. I wouldn't have expected that.
> >
> > > - anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
> > >   the ISP2 MI corruption. I'm currently investigating PMIC settings
> > >   (both my Compulab and SolidRun modules use PCA9450C PMICs), so perh=
aps
> > >   I'll be able to use the higher 500 MHz clocks. It doesn't matter mu=
ch,
> > >   though.

I was reading through the data sheet (not the reference manual), and
it lists a few limitations for the clocks:

For single Camera, MIPI CSI 1 can support up to 400/500 MHz pixel
clock in the Nominal/Overdrive mode.
For single Camera, MIPI CSI 2 can support up to 277 MHz pixel clock.
For dual Camera, both MIPI CSI can support up to 266 MHz pixel clock.

If you're running dual cameras, it sounds like you're capped at 266
MHz regardless of whether or not you're in overdrive or nominal.



> > >
> > > - the question is if we should lower the clocks in the main imx8mp.dt=
si
> > >   DT file, or the overdrive mode should stay there, and the changes
> > >   should be made to the individual board files, or maybe the U-Boot
> > >   configs (PMIC output voltages) should be changed etc.
> >
> > I think it would make sense to lower the default clock frequencies, and
> > provide an overlay to enable overdrive mode.
> >
> > It's also interesting that the issue only affected the second ISP, as
> > the first one should also be limited to 400 MHz in normal mode.
>
> I support that. As a side note, there is already imx8mp-nominal.dtsi
> which is only used by one board. That dtsi also uses the
> fsl,operating-mode property which enables additional clock checks. So I
> ask myself if the default imx8mp.dtsi should specify overdrive mode, or
> if we should add a imx8mp-overdrive.dtsi (then we should possibly rename
> them to imx8mp-mode-xxx.dtsi so that they sit side by side) to make it
> easier to create overlays for both cases.

My understanding is that the imx8mp.dtsi is pre-configured for
overdrive mode, so if you need to run the ISP in nominal, the clock
updates should go into imx8mp-nominial.dtsi.

adam
>
> Best regards,
> Stefan
>
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>


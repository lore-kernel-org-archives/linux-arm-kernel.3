Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8211C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JdJMsLzfDGeRvx+Emk46r8xhmMRITfWllQfaK4Duwk=; b=LqkuiPF7MF3ZtJ0wakTu5fv0ED
	xz6xw+kICuT9k0SkF1qJ4Yg/zuXpcecBiREYGqKxVqaaxTqukSHtcgo4ZupgFF9UZom9LIFoikq+p
	aBTal5lqzZFBBGcW7z4TZs983viw6tv/12nFK/lH4PMDb4p89XXfxx8u2j+R1/34Y09N228I01dVN
	47hc8yG2KsycxjsJ/UDEGS2OaCzUn7hC7bSDmM9SAfuT8b+PB677E3Dejxfjd6Xjbc2zj9wrZ5at5
	TpeaAr9aTNBsa+83Lm0T75HlaXArmrtESbDhZkEGcbcZ3Bl4LO+nfUTa50KAaSOdoI+9uIqkk1hnA
	UHYvYcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXgS-0000000EIxN-0sUi;
	Wed, 07 May 2025 05:51:08 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXeR-0000000EIiY-3rX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 05:49:08 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4769aef457bso88173831cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 22:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746596942; x=1747201742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JdJMsLzfDGeRvx+Emk46r8xhmMRITfWllQfaK4Duwk=;
        b=Jfe4F/taGXUMJW3R5Pnvgb0mhmYbBHRk5o6UWWCqNB2UcHKD1+Ccd4CUMw+crWtNIg
         AH3v0EuRkRBRDWh0tb3Nhl+BTASdjvJD3BxXivEaTsXNrKuVPJZ0KSYMiQJbyJHwv7d8
         MKoEU5ZR9WCK6FYYMdoTJafW6ZkBiPmkuKX539rQGcwPW74nTNWSr4DCDGcVWI62OjFm
         IFP/E+LNQ+ATM8No6MYvs9jZvzxIDZrY3fxZdu0Aqm+g5MtUCkDzr4CzM8jrEg0GH4oT
         LPn2S1l7JctQOaEDPlaBWRb0nF3Pd1hzDjvJoQ3AqLjjEaNIfaF9J1uz2vQSCfTUl51z
         jAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746596942; x=1747201742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JdJMsLzfDGeRvx+Emk46r8xhmMRITfWllQfaK4Duwk=;
        b=RrmgYn7JyrKGMn6JVcZoRs+WV9mfkfOxv6UeMakdbAPc9fhR137ec4aFq3H3uYkuJp
         JPZk6R6fu1PwR6dA97LIL/SF/S8rxzDxPfYzObwx/iy7t6mF9jDKVlyKsmXBPZJjOfNq
         t1Mwwl1ugL4KQ+BRR2BfIrtqsSX6K/1sXnugEoR0A3H7Pi9eex5fGDlSvtdqr4tmutz9
         uCbt1iZYh8flgcx2Y/5TGJQQtOpQ3JnK+VxY82Pg1TzitWnrjR9oSp2hzUew5PV1tzpy
         2CHRkBMxN+NfJ8sEvZ02Y+l7/ICaagW4XbsgIgU4ElEvx03xJ+1OdMDl+ZOoMMuRRIL4
         7tqg==
X-Forwarded-Encrypted: i=1; AJvYcCU1jugQQAKCWsWVpRfDaASk28jVmRedhhYj+nhZvZdIRic7G0iMOwdxxIkuodd3x4lx7icm7AkNejE25efcmtMx@lists.infradead.org
X-Gm-Message-State: AOJu0YwrdT0mJX+zv/wz1+7EBiLXe84KDYEcVeJPvVZQyelIVpkxDVAW
	f3/0EnigrqAYEB//flMt28X8lb5OifihIb0Ouw0RIPtOjL7I7syvVz6t8zUHN32ivR6lZlHrFzx
	Uu2lPEc6ytjvS5lUY71+pyZmT3Xc=
X-Gm-Gg: ASbGncuirkIu5EsJ3hbnl3xd3Zh75iL3RBBIz9WrdPMyNlMEVqWwhaMIjCvHs4WN7QC
	pmOAMgRFk8xjbtBd+kkTgYwSDmzzIY8e1niUG83Rn10UeRSBSFt/RayxqmNLdjCkSOc2lqfTNjv
	KGvu20hqzJFGnzwlqpIw3Q64iVsIFKuNY=
X-Google-Smtp-Source: AGHT+IF7vvrjUXrQ8Ma7pGYyWlbfTrxCvT38VXq6TtbN5SNAo7OxWdmxVFlZHyYkepkkFVBGOS2HmDQU3+iLDdcpFsM=
X-Received: by 2002:a05:622a:5588:b0:477:41c3:3c59 with SMTP id
 d75a77b69052e-492278663f1mr28654201cf.40.1746596942669; Tue, 06 May 2025
 22:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
 <20250507-vt8500-timer-updates-v1-3-6b76f7f340a6@gmail.com> <8d3c2ab5-dfc0-4a65-94c8-48a94c850aba@kernel.org>
In-Reply-To: <8d3c2ab5-dfc0-4a65-94c8-48a94c850aba@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 7 May 2025 09:48:51 +0400
X-Gm-Features: ATxdqUFKht2xkkVskEfWLYN789ACQMJmDtBSHahlN1jQVzEb-f__uuxu03cTVZ8
Message-ID: <CABjd4YxjC13H9G+ZpQO7EcmA4quu-9OMYjc5z6W5z+f=pwkTbw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: vt8500: list all four timer interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_224903_955685_E503AE79 
X-CRM114-Status: GOOD (  19.49  )
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

On Wed, May 7, 2025 at 8:32=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/05/2025 22:06, Alexey Charkov wrote:
> > VIA/WonderMedia SoC timer can generate up to four interrupts correspond=
ing
> > to four timer match registers (firing when the 32-bit freerunning clock
> > source counter matches either of the match registers, respectively).
> >
> > List all four interrupts in device trees.
> >
> > This also enables the system event timer to use a match register other
> > than 0, which can then in turn be used as a system watchdog (watchdog
> > function is not available on other channels)
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
> >  arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
> >  arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
> >  arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
> >  arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/v=
t8500/vt8500.dtsi
> > index 2ba021585d4889f29777a12473964c29f999f3a0..d1dd37220d41becece5d24f=
bb19aa71b01723e35 100644
> > --- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
> > +++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
> > @@ -111,7 +111,7 @@ clkuart3: uart3 {
> >               timer@d8130100 {
> >                       compatible =3D "via,vt8500-timer";
> >                       reg =3D <0xd8130100 0x28>;
> > -                     interrupts =3D <36>;
> > +                     interrupts =3D <36>, <37>, <38>, <39>;
>
> You need to update the binding, preferably first convert it to DT schema.

The binding change [1] has been reviewed by Rob and is pending merge.
Shall I fold it into this series when I send v2?

[1] https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-8845=
0907503f@gmail.com/

Best regards,
Alexey


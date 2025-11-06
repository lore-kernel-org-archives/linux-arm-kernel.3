Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDD9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eNR0gXNmIUmw89GQXgujHZG/9SWMVHpsfLzK4O6o7I=; b=2ZwhlFDrnzN5Vs89n4QxoQoaGu
	hEkj9xEP5sbHuw82YWOpx212X1r01omssBQlyrG83fRyXqa7UWjrrzsgxla1ifhM6l3hKdS8BwKOX
	0DDaeMVxjc4B3UMOptmPxPqu1BvGV6rMFfc+IP1U75rmr1+em2WVLZHhRvF1ycHpYe484ZoKELeps
	fZV5ZvBNk/vbYC5hL2L4oeW4+Uq/7Df1MlAlKX/ReEozi6CO0GtegeaJq0udAEi0XIKNDvpHOhJxo
	/z0WTsMevd7mByknlhiH0lUHWUS6mIXrjhMVUy3hYccYMqhPdaZ5vyapwlskW+qIAYZnmYJx6dB3c
	mf3hgpVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpuV-0000000Em1O-2gZx;
	Thu, 06 Nov 2025 02:39:39 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpuR-0000000Em0g-2pvW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:39:37 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-78f30dac856so6030326d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 18:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762396773; x=1763001573; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eNR0gXNmIUmw89GQXgujHZG/9SWMVHpsfLzK4O6o7I=;
        b=sWnaOhEtlDu9gGSD+7UIvEedv6fkijHOmHabOq+qQ5phEXrLIqY82vST1V+KMcF6jU
         Hr276p7lT5eGGD3xHpLxaeP0wKI3TbmiZ52jUhp6H0cxVVzvnGFeX96df0hJwjGt9Yer
         Dd6o1F0bYDhEtrdzqYdcbkAcdXazBmDctL5lUDNTuu2xd4byUJlpLnTpRKA88LZ+R/YI
         QqWsoTy6BPh1TcG4IWVAfkY8BzjpmSIVW9IFMq//5cD0q1y44/kg5G23ZcOfj7nMFupO
         DUJplKLrA+hDp/qqp2GOAsZLREd9Eqc1MOZ2ok6NlO+JTW25RRqLhTjYiVMqChI7SQLl
         +9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762396773; x=1763001573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eNR0gXNmIUmw89GQXgujHZG/9SWMVHpsfLzK4O6o7I=;
        b=X7WcQ2PSoDpY9lqLmgvuRiXoDQGrTakFw5/Wcf9Ovng4yoDZTG13BY/6QMemfZ01Zw
         CCo6xDGg2IlUioaoLNzzjRlqY/rN67RhuIdcATyuSH6bu/lQWWNGOBG9FypzbhL5ofNj
         skwjItTTifDFkOylGU5XRIvZdCgq6+KSp3IORWWh/XyQSTzI4vLw0RQy0ulxRGtKpDV4
         PG4Ba0rj6dzQUj3Kdn3Uf37KvJXH9sTeTK1yrJhe2eZXSwJw+OgRZJC6RITE8Ypo+6Rb
         1LGqyWUN2gKkrB5RHuRu2f1e1nfy8IffOkrDxyRFX7lDNofldwlg3McsJJBfUPGnoQTq
         SVyA==
X-Forwarded-Encrypted: i=1; AJvYcCWZu5lywOIQSB/gz7FtcHKa+L+Ekke3WcqziHJYIW2XTV9tOZ4t2RetpeVoR7t27wK4owS0ZN689ummir49f7FW@lists.infradead.org
X-Gm-Message-State: AOJu0YxnTbR/Wr8CJa8HCP+7I3pq0N8RcK16bB9HIuinYFLpxVH3/2oZ
	rUlphfgN4nKdnomJwd+aL5obLDrQbFE8Wi+5GASN4pHDoJriP5VW77aqHR06zemPIMsRIS3+T14
	1JdGXYlZdAaa2CT/fVfgRrFHS91e0T3qSCW4WtX+Z
X-Gm-Gg: ASbGncuzTw8vz3qW30wZlCqnzSvGqhec08m+OIKPR2akuxQyRkHw1wCWWB77eZqq1ip
	OScTITAkpfzn3kTA7OF8RJ9TX3K5zd4fMe2lkyZstor77URW4bREpxvkcknNhkO3r176rNn2WvO
	3fOKHcONswHPM2dQPF62tHcF2bavz8yoHeal0O/mnLPOwioKEtTw09pb1Qq/Mz1g/FeEhuUJih1
	TCa3uidRDxGU/DVznfbh6+tsbCHEPILkoTBmqgqFayQpiTl9sCNIGpGpCuz
X-Google-Smtp-Source: AGHT+IGJuTr7VhSikUdL+mJyzKmkBgWLGxAfoFqQyzKGSsZmlf2Gkc/1quZmoJrqJlupKDcyB0Th/ppvrz0DqNyO9kE=
X-Received: by 2002:a05:6214:1312:b0:880:2f75:c525 with SMTP id
 6a1803df08f44-88071197e64mr79530726d6.25.1762396773064; Wed, 05 Nov 2025
 18:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com> <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <20251104020713.orax7rk6qhko5p4m@synopsys.com> <CA+zupgy4qO9X=R7KqEru5kr7tYhgdw=9Z70sLNKj5DTS_J7KZw@mail.gmail.com>
 <20251106003830.v22dnomurtqmqc2y@synopsys.com>
In-Reply-To: <20251106003830.v22dnomurtqmqc2y@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Thu, 6 Nov 2025 10:38:56 +0800
X-Gm-Features: AWmQ_bkphrNIx4CfxBiTp-P4PkFughKyJrDHinuM5icObzFEnLxeXlpmyW-7ie4
Message-ID: <CA+zupgzNRG3vAukQe89bTJ_EaC2A=o+_pY6QoVOdRfXu8BJOAg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_183935_726947_0DA18310 
X-CRM114-Status: GOOD (  35.95  )
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

On Thu, Nov 6, 2025 at 8:38=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Tue, Nov 04, 2025, Roy Luo wrote:
> > On Tue, Nov 4, 2025 at 10:07=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Fri, Oct 31, 2025, Roy Luo wrote:
> > > > On Wed, Oct 29, 2025 at 6:35=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@=
synopsys.com> wrote:
> > >
> > > In dwc3_google_suspend(), looks like is_hibernation is set after you
> > > enable pme irq, probably very unlikely, but can the interrupt be
> > > asserted then? If so, will there be another interrupt asserted?
> > > Otherwise the current logic may think it was spurious interrupt a mis=
s
> > > an event.
> >
> > The pme interrupt can only be asserted after controller is in
> > hibernation, that is, after the usb psw dom is turned off and
> > the dwc3_google_usb_psw_pd_notifier() callback is
> > completed. So no, the interrupt won't fire before is_hibernation
> > is set.
>
> Thanks for the confirmation.
>
>
> <snip>
>
>
> > > > >
> > > > > I'm still trying to wrap my head around how usb_top_pd, usb_psw_p=
d, and
> > > > > the google->dev are working together in the glue here, particular=
ly why
> > > > > usb_top_pd is needed. It seems usb_top_pd shouldn't be handled by=
 this
> > > > > glued? Do you do anything except setting wakeup-capable?
> > > > >
> > > > > BR,
> > > > > Thinh
> > > >
> > > > To provide more context, the underlying usb power domain has 3 powe=
r
> > > > states: Full Power, Power Gated, Off. The usb_top_pd and usb_psw_pd
> > > > are the logical power domains to represent the 3 power states.
> > > > - Full Power:     usb_psw_pd ON,   usb_top_p ON.
> > > > - Power Gated: usb_psw_pd OFF, usb_top_p ON.
> > > > - Off:                 usb_psw_pd OFF, usb_top_p OFF.
> > > >
> > > > To enter hibernation, the usb power domain must enter Power Gated
> > > > state. To achieve this, this glue driver holds a handle to usb_top_=
pd
> > > > and would cast a vote to keep it ON when attempting to enter
> > > > hibernation. In addition, the usb_psw_pd runtime PM is directly tie=
d
> > > > to google->dev so that usb_psw_pd would be OFF when google->dev
> > > > suspends. Together, the usb power domain would reach Power Gated
> > > > state when device suspends.
> > > >
> > > > I hope this information helps.
> > > >
> > >
> > > Yes. This is very helpful.
> > >
> > > So, while the glue driver is bound, usb_top_pd is always ON? Even whe=
n
> > > xhci driver is not bound or when in device mode?
> >
> > Since usb_top_pd is the parent power domain of usb_psw_pd, and
> > usb_psw_pd RPM is directly tied to glue device, usb_top_pd would
> > be ON when glue device is active (because usb_psw_pd is ON)
> > and would be OFF when glue device suspends in non-hibernation
> > scenarios (because usb_psw_pd is OFF). In hibernation scenario,
> > a vote is casted for usb_top_pd to keep it on even when the
> > glue device is suspended and usb_psw_pd is OFF.
> >
> > To your question, usb_top_pd is not always ON because it would be
> > turned off when the glue device suspends in non-hibernation scenario.
> > When in device mode and provided dwc3 dev is active, usb_top_pd
> > would be ON because its child usb_psw_pd is ON.
> >
>
> Thanks for the clarification and bearing with my questions.
>
> If there's no device connected, do you role-switch back to default mode?
> Often I see that the role-switch is defaulted to peripheral and switch
> to default mode if there's no connection.

Yes, the default mode would be peripheral and it would switch
to peripheral mode if there's no connection.

>
> I want to check the case where the device may wakeup by connection but
> cannot because it is not in host mode. Do you have a separate
> TCPC/connector that can wakeup the system on attachment?

Yes, there's a separate TCPC/connector to trigger a role
switch when there's an incoming connection.

Regards,
Roy Luo

>
> BR,
> Thinh


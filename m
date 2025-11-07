Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E80CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5b+M3zzopCvof55wzjaKXg+MrS7xrBcOB8Vyij7yJyg=; b=JlZj84NbtMBiD0XVHONquYJizN
	F1nQLoJOLTix8r99ZHhV9plzedLjjPHHBhBhl7uTaTxK1rz72cdbcy3eLXRdQiKYhCA40lhGRgtjC
	NmCje8coSkTsJ2f3vJR5whjaiWVP4mUOc6wIO4vJfNgxfpHasaiGLU6kHXr1NTO/SCuxUsNisoWu/
	ZIbpbLebNwTKp/kP5fOTmEKPfiLcYnEnjJKYDwyDKvZKKf9CAJhlSSs6QE4C/19UlBv2TYqJQYjxe
	1dbQOzq1hKTp/hO6hN8TRUow45VvzN/VZtfg7jnEemHwdPq0sasAo2GMzdzcUJTOyjFfos7CuJdNW
	OoyJ4fVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIVz-0000000GwR0-3WL1;
	Fri, 07 Nov 2025 09:12:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIVx-0000000GwQ5-0Sy5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:12:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2958db8ae4fso4614025ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762506732; x=1763111532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5b+M3zzopCvof55wzjaKXg+MrS7xrBcOB8Vyij7yJyg=;
        b=1OikR2UOuNBaNeHXD3LAxOJ261PaOVP/Lcm/7gm74KrMKOimMei32jO51hGPxOILmN
         ulRtk/K+9WlVUuzJLLtqRVqcqFDXsT4wCNfvPvm1o3aGfhlEOv0S5C0GLu9h79HrMTOJ
         uNkZsGC9n90oZ4FgQBDdP6GeUTrflukT20Dq8160zeLopJ5z8isfi0B7/h8fwA4KEIkR
         V0NZniwt5JZ0HKb7W4p04q/5Rc9J5DUa+ARzDs920zlkDvc4Vp0GEFSicKZ97ydnnO3T
         Fs2lImHashHE3fVEAGd2FsX+qrr34xFWTle+nWjsOecUnzv3FT0yZGdnFeq2BmGLTfP8
         jCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762506732; x=1763111532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5b+M3zzopCvof55wzjaKXg+MrS7xrBcOB8Vyij7yJyg=;
        b=A3loJwzOUYdkB7EmDPO0YKudqnbUwNmGn3tP6fDqBP55OBtzHvz1BprO08oa3VMn3z
         9wz9pMXQXJA+KHcJcHwbB1C8L+HZmfCeVeXYC+RIYqWh1JRzyG7GDv/dvyBJCF6hSGn5
         zegfft9DzXFHMY62417hgODh7u3/wILVMf+bGSrmEBxB6R4xwZ/5oX4sM6N1Y26d2lkt
         4PDjya9wrr3rZVEXLhecjiDyWKsDCM9j4gSq+Lv4+uKVMiAan6Y+Msn6anB1xVlyV7jL
         wV8ZIcSztt6FkBM7CRPhhKn38aHwZ1L4XSuiNICPsPcmqZqash2Quj3catsFsi7BZOjP
         s6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVSCXCSfjlpcmwqzgVs7Wh0thmTHiRf465iIcr44xlG3XyTrfT7IQs8QMsK/KCjaoYBV66qgmdGNX1hac6OqQxe@lists.infradead.org
X-Gm-Message-State: AOJu0YwovHfBq+BRtfR3YZprYcdDr3EB72u+nsJmamLDRCJmrFIi0K3C
	nDFl2xUbyif3vkAEv2Oouli0CY0PxZe6Wn9hdol3SmE3OEhexbRSJ17N8xQyxQyEGK8HnLpg100
	YlsiVqrbDnvB2QXdFOPmPNQS8ULDETPbKKJ4FuG4G
X-Gm-Gg: ASbGncu6oeEl5DKLc6azbIfP+VRo0RfMVUDng6/V7uwffQCSD12NVWt0+MgpwSIfxv+
	rNnhQ1kL55uXxSbM5exqoMX8NyW7oe6X8yd2Ytm00XXlBotjFRBd87TONxZPk8HcNQIxaK68plI
	j3Oe/aC8nSpwxIzcpfMDNtNr4MbbJBLnH7y5esIKkunqVG25Mge9F1L7E34H8RXNgXMymR+l6i6
	CpFIS84VB4XBFAt0eTJKKtB/uywcvwHjodwo/o91/OAufkXIZdE76jNJb+a89lUzSek+Fk=
X-Google-Smtp-Source: AGHT+IHWENirlvcfA41rvumMc/AZyRmx9tfkjQkwROpRjDKeutH5HgnBVz2Cj4Uw9rrJPEek8xG2BFZODl9IVdlK3Gc=
X-Received: by 2002:a17:903:388b:b0:28e:ccd7:dd61 with SMTP id
 d9443c01a7336-297c04a11e6mr33698895ad.57.1762506731353; Fri, 07 Nov 2025
 01:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20251017233459.2409975-1-royluo@google.com> <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com> <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
 <20251104020713.orax7rk6qhko5p4m@synopsys.com> <CA+zupgy4qO9X=R7KqEru5kr7tYhgdw=9Z70sLNKj5DTS_J7KZw@mail.gmail.com>
 <20251106003830.v22dnomurtqmqc2y@synopsys.com> <CA+zupgzNRG3vAukQe89bTJ_EaC2A=o+_pY6QoVOdRfXu8BJOAg@mail.gmail.com>
 <20251106234839.kezpk2okjhkajqp3@synopsys.com>
In-Reply-To: <20251106234839.kezpk2okjhkajqp3@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Fri, 7 Nov 2025 17:11:34 +0800
X-Gm-Features: AWmQ_blqfpqntmKv9_TI2d4T2dFjIvyvpvXv_YU9eXLSRtz2Ua5X5nKU0YFMoFo
Message-ID: <CA+zupgzxjEXJaVJLj=O1MirV6Y-o5uSWPQyQ26kjXO=gfv+W0g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251107_011213_162956_5D381388 
X-CRM114-Status: GOOD (  41.37  )
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

On Fri, Nov 7, 2025 at 7:48=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Thu, Nov 06, 2025, Roy Luo wrote:
> > On Thu, Nov 6, 2025 at 8:38=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synop=
sys.com> wrote:
> > >
> > > On Tue, Nov 04, 2025, Roy Luo wrote:
> > > > On Tue, Nov 4, 2025 at 10:07=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@=
synopsys.com> wrote:
> > > > >
> > > > > On Fri, Oct 31, 2025, Roy Luo wrote:
> > > > > > On Wed, Oct 29, 2025 at 6:35=E2=80=AFPM Thinh Nguyen <Thinh.Ngu=
yen@synopsys.com> wrote:
> > > > >
> > > > > In dwc3_google_suspend(), looks like is_hibernation is set after =
you
> > > > > enable pme irq, probably very unlikely, but can the interrupt be
> > > > > asserted then? If so, will there be another interrupt asserted?
> > > > > Otherwise the current logic may think it was spurious interrupt a=
 miss
> > > > > an event.
> > > >
> > > > The pme interrupt can only be asserted after controller is in
> > > > hibernation, that is, after the usb psw dom is turned off and
> > > > the dwc3_google_usb_psw_pd_notifier() callback is
> > > > completed. So no, the interrupt won't fire before is_hibernation
> > > > is set.
> > >
> > > Thanks for the confirmation.
> > >
> > >
> > > <snip>
> > >
> > >
> > > > > > >
> > > > > > > I'm still trying to wrap my head around how usb_top_pd, usb_p=
sw_pd, and
> > > > > > > the google->dev are working together in the glue here, partic=
ularly why
> > > > > > > usb_top_pd is needed. It seems usb_top_pd shouldn't be handle=
d by this
> > > > > > > glued? Do you do anything except setting wakeup-capable?
> > > > > > >
> > > > > > > BR,
> > > > > > > Thinh
> > > > > >
> > > > > > To provide more context, the underlying usb power domain has 3 =
power
> > > > > > states: Full Power, Power Gated, Off. The usb_top_pd and usb_ps=
w_pd
> > > > > > are the logical power domains to represent the 3 power states.
> > > > > > - Full Power:     usb_psw_pd ON,   usb_top_p ON.
> > > > > > - Power Gated: usb_psw_pd OFF, usb_top_p ON.
> > > > > > - Off:                 usb_psw_pd OFF, usb_top_p OFF.
> > > > > >
> > > > > > To enter hibernation, the usb power domain must enter Power Gat=
ed
> > > > > > state. To achieve this, this glue driver holds a handle to usb_=
top_pd
> > > > > > and would cast a vote to keep it ON when attempting to enter
> > > > > > hibernation. In addition, the usb_psw_pd runtime PM is directly=
 tied
> > > > > > to google->dev so that usb_psw_pd would be OFF when google->dev
> > > > > > suspends. Together, the usb power domain would reach Power Gate=
d
> > > > > > state when device suspends.
> > > > > >
> > > > > > I hope this information helps.
> > > > > >
> > > > >
> > > > > Yes. This is very helpful.
> > > > >
> > > > > So, while the glue driver is bound, usb_top_pd is always ON? Even=
 when
> > > > > xhci driver is not bound or when in device mode?
> > > >
> > > > Since usb_top_pd is the parent power domain of usb_psw_pd, and
> > > > usb_psw_pd RPM is directly tied to glue device, usb_top_pd would
> > > > be ON when glue device is active (because usb_psw_pd is ON)
> > > > and would be OFF when glue device suspends in non-hibernation
> > > > scenarios (because usb_psw_pd is OFF). In hibernation scenario,
> > > > a vote is casted for usb_top_pd to keep it on even when the
> > > > glue device is suspended and usb_psw_pd is OFF.
> > > >
> > > > To your question, usb_top_pd is not always ON because it would be
> > > > turned off when the glue device suspends in non-hibernation scenari=
o.
> > > > When in device mode and provided dwc3 dev is active, usb_top_pd
> > > > would be ON because its child usb_psw_pd is ON.
> > > >
> > >
> > > Thanks for the clarification and bearing with my questions.
> > >
> > > If there's no device connected, do you role-switch back to default mo=
de?
> > > Often I see that the role-switch is defaulted to peripheral and switc=
h
> > > to default mode if there's no connection.
> >
> > Yes, the default mode would be peripheral and it would switch
> > to peripheral mode if there's no connection.
> >
> > >
> > > I want to check the case where the device may wakeup by connection bu=
t
> > > cannot because it is not in host mode. Do you have a separate
> > > TCPC/connector that can wakeup the system on attachment?
> >
> > Yes, there's a separate TCPC/connector to trigger a role
> > switch when there's an incoming connection.
> >
>
> This addressed my concerns. My other comments are minor nits.
>
> You can include this on your next submission:
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>
> Thanks,
> Thinh

Thinh,

Thanks for the review, appreciate it!
I'd like to give you a heads up on a change I'm going to make
in the next version. Per Krzysztof's suggestion in [1], I'm making
a register region that's shared between the controller and the
PHY a syscon node. The impact to this patch is that mmio
space "host_cfg" and "usbint_cfg" would be accessed through
syscon API instead, but there won't be any functional change.

[1] https://lore.kernel.org/linux-phy/89733ddf-8af3-42d0-b6e5-20b7a4ef588c@=
kernel.org/

Regards,
Roy Luo


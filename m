Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3D4CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMZ5uVQSeKp4nOSIgfrXw005H4ImnDWLFAokwE5MQpA=; b=N77PXPCcF2FLHiE001h1h42bJJ
	d6vfhh4Gwnnv54g06Jk67eQ8k8Qpghub93kKhUsQ92xMPCxXFhfaXIhGZTMH4RqPANOkUlFiVaQNM
	SaHNlT4pzjfvIh9Ji7ZkoNmStDx2+r1TO9jIq6SDT6UmyiUurWGw/K+6ogcUQZ7i6xb5zICJoOtA4
	dTfMWM8RpCdArZzqEjSOkm2XJqQu17M6xA1OjzhCo2L/Ggu6nnjMpPSldmRyfR2DL85DicX+GKFgI
	rR5YLd4a9TztJlPSeRWG80XNzkGrcbOcDUSt9kuAp1Qt4R19gaLRr2UtQaHWR816o8GZ10zXwQX2p
	DHYCPV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLsQ-0000000AHNB-0Zo9;
	Fri, 22 May 2026 09:09:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLsN-0000000AHM3-3dcs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:09:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05687445B0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1AA1F0155E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779440942;
	bh=qMZ5uVQSeKp4nOSIgfrXw005H4ImnDWLFAokwE5MQpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UfQC5GRtWnQPmUg0AmUxRIkQOuc3vkhRN9AcATjB7sw2h57gqM+kJI6n+PHoxSx9d
	 CLSeT2tTlA29zpxhcE4VoRsJlmVveXq2wlaY4XogC8kpwwp8khpPfGKtMUMPCe+gwg
	 OPs7MnK0oVJveKBLCQxO/iUKMck1X9WTwbQPS33ZE1O69NcdcEuQYiU/6cCv1mVj9g
	 vjOndfpXH7cMIYd1EYyM4MRK7pzgKBF/WWAEC5GXOnj5iqBLMGLLXj/+59Hj7pJqyl
	 ssHWMo8g3raUTGnKk/kczr0rCZqr4xkqQi39r/8gyCdwbG1IR8IuRhNQ746wG25Ia7
	 L3IYIIvK5/I9g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39396f873adso104810571fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:09:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+0UBvHaZZ75oMNYm/q7nYzpuoK5jrWjfoLhOrcGAKMAmKeAMDpogtp6MDuDRWrb7Zn9XB0BxSD0admwvKUCXBx@lists.infradead.org
X-Gm-Message-State: AOJu0YxzCh+uQaOn1iajOo3B13eH2QRRz5C3H8bjZNOR/1+Xe5W1dX/R
	ha0g9Wq2kV4ZKLcOUhN1Q/r0ywzELaajSDHGx7n1ipPKV5W8wUktdcVZqHg73WNqWheC169EcQo
	xzLB0Fq3N6Rs3GU5FAvTu7Mzz3AvirZAGyfZeUn1LWg==
X-Received: by 2002:a05:651c:150f:b0:393:b0c7:db0d with SMTP id
 38308e7fff4ca-395d8d66af7mr9077111fa.30.1779440941340; Fri, 22 May 2026
 02:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com> <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com> <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
In-Reply-To: <20260521162705.GH3591266@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 22 May 2026 11:08:49 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
X-Gm-Features: AVHnY4KEjtS5lwmgChTK038L9jNVBXcpGXq73PwgIc9ndboYTrc3guSx2Szrq4o
Message-ID: <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD cells
To: Lee Jones <lee@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_020903_949360_4DF9D02A 
X-CRM114-Status: GOOD (  23.07  )
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

On Thu, May 21, 2026 at 6:27=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>
> > On Thu, May 21, 2026 at 3:24=E2=80=AFPM Lee Jones <lee@kernel.org> wrot=
e:
> > >
> > > >
> > > > I suggested it because of its flexibility. The alternative I had in
> > > > mind is something like a new field in mfd_cell:
> > > >
> > > >     const char *cell_node_name;
> > > >
> > > > Which - if set - would tell MFD to look up an fwnode that's a child=
 of
> > > > the parent device's node by name - as it may not have a compatible.
> > >
> > > Remind me why the chlid device can't look-up its own fwnode?
> > >
> >
> > Oh sure it can, but should it? I'm not sure it's logically sound to
> > have the child device reach into the parent, look up the fwnode and
> > then assign it to itself after it's already attached to the driver.
> > This should be done at the subsystem level before the device is
> > registered.
>
> Leaf drivers reach back into the parent all the time.
>

But drivers don't generally assign firmware nodes to devices they are
already bound to. This is racy as in probe() the device is already
visible to the system. There's no synchronization of device property
access - properties are assumed to be read-only for a registered
device.

Bartosz


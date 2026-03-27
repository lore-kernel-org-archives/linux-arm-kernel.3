Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DEB10ED67F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1eKvqR2jm8j79I/laEc5/eGaX0VLDdRHXg8u2WAXu8=; b=kjnn3W5xLPzum2+xNDD5f4V27P
	4J/Pr/pf3oCft3m3oVy+vu6NjGqdq5a3WRxWUN5lpb4bKOBNMnPvXLKzGyT37J6Xt88xlw2Qf+Hkm
	Z5TFOYjE1vCDSuQOcaajr+RlpecR1C4Qvavj72YLU6wInO9Ij2/0AmZxQL57bHs5O5M99NleXEiLx
	Ftj/Q8LpISU2MMSOizE5fRXGVqUwY56OVUg1G47uSPPFlGR8NG3pY9t8Dv42Xng8/laAXiknA5Dkk
	PvFZ96wfxLFiAhFHfjc0dUctHzfudXPjBye2ayjzqCZ5U0PuXzOK4vl9/n5BgfceSDgEy1iY2QMJB
	XfzU/vyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67sc-00000007ZYX-2Xxf;
	Fri, 27 Mar 2026 14:09:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67sb-00000007ZYQ-2pgK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C18A60145
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 14:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B52C2BCC6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620580;
	bh=d1eKvqR2jm8j79I/laEc5/eGaX0VLDdRHXg8u2WAXu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O86m/URyRCtyar8s4uTy8/83jn/4yQEXIpOHGo3Wpvgq+3uAAkegEjZcoiuPnYR+l
	 NAMeeCYBfgNjFQm3URHDqgT/laQxtQgukgm25lm/vlBXy3G5mF7OVk+LmIDIwOKXsw
	 evF0kMknaGEDqwZUmKqnWqJRjDKSkb0ooOE2+uq4F3C5jhl1rfcT8n9qTdUKpPNre4
	 VDR7q2FZbsFJNubuY403XRGwZLP0/37bOnIMkXR8MwjoPYL+m9LpNuVquY5/iC6bKH
	 f7flB0Ymgl8WCcXseDAU88dDGPGT1mdsquyqg0Ub0QBITAavCC2xWg7YlBre5sHNxb
	 o2/ypZ0DN06zQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a1443780c4so2727612e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 07:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmIvd4V4yCWzSC3W6of6xrZB5Vk6Y5tsqcK1wDcQixu1Yhi0JTBrgpmllhvDptUC+i1DwW8Rpb91a9+hg3WBc9@lists.infradead.org
X-Gm-Message-State: AOJu0YyqEJLjt3cZOYvKXZP5YF7C9t686fCPbYREsczH3iJ/fS4X3N2L
	wl+kEJyE8h1axKX2iBXJovtgywumQonHNnUOZR8QvL43AshVJkU8b06ReBLHfWhH2mnUWfrR0sO
	hjmq3v0eq0f1WJoQdiFHR5cCDSSsRa0BucWj53qgkhg==
X-Received: by 2002:a05:6512:3983:b0:5a1:1de6:bc66 with SMTP id
 2adb3069b0e04-5a2abd50231mr704477e87.18.1774620579288; Fri, 27 Mar 2026
 07:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com>
 <1f75b250-c3b5-45da-bc82-aeadf44dfea4@oss.qualcomm.com> <CAMRc=McUdboG0ziWmUf+h9mUiuGesaFk2v27z_Opbw-AF33C0g@mail.gmail.com>
 <acaPSW6VeYceoMnO@lpieralisi>
In-Reply-To: <acaPSW6VeYceoMnO@lpieralisi>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Mar 2026 15:09:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdT9CR-nFdg5Oaj-Kz_0+wSYjszV7VXgMPubtyBhgFsXQ@mail.gmail.com>
X-Gm-Features: AQROBzAeK-ifh_eB2c9LxTiqer-4pFaaDK_H1nIMxWkpvl_eX-PbHfPGxDMGKOA
Message-ID: <CAMRc=MdT9CR-nFdg5Oaj-Kz_0+wSYjszV7VXgMPubtyBhgFsXQ@mail.gmail.com>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 27, 2026 at 3:08=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> On Fri, Mar 06, 2026 at 02:32:46PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Mar 5, 2026 at 6:07=E2=80=AFPM Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> wrote:
> > >
> > > >
> > > > You should pass the address of this function in faux_device_ops ins=
tead of
> > > > calling it directly.
> > >
> > > In last patch, we were using a probe function. As faux_device_create,
> > > calls the probe from its internal operations, "of_node" can only be
> > > assigned from inside of faux device probe.
> > >
> > > As our primary requirement is to assign reboot-mode of_node to the fa=
ux
> > > device, thought to make it this way. (As we did not want to assign it
> > > inside the faux device probe).
> > >
> >
> > TBH This sounds like a limitation of the faux device API. I'll Cc you
> > on a patch proposing to extend it with the ability of using a firmware
> > node to describe the device. If it works for you, you can integrate it
> > into your series and use it.
>
> What's the status on this matter ?
>

I looked around and didn't find any good reason for adding this after
all so I dropped it.

Bart


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E76CCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voImLt9U33hBPjIQg8QhUUlnxhHKHG4IMiIMQPxp1a4=; b=UNDNp/GSpuiEDvbuabwUFMFkjA
	0mun1E2WIkFX/GMbutqnE+fdVQzUOFSg/kOMW2RU/XqW2/4o29W34LrLmru0dIKQP0X7zxiIeSzWN
	+umUoZSNiESJP5vpBIufRGB7AUV4bEDqcPIBXEGDaNzS91lqxKmafMIJ+ZFdoRwFEWHqABmg79u8R
	lSZZD0W/D7y2eQkRxSGI+2CeMY/TfW7xW8JWgKPdYCV/jKP/WNvFpkELuTqjYKNYitXzaTInJ1kDB
	H0dql8s0NOMU94L1HTiP3W+k3x+Sp7/R8Qrx3WySbWj/Q+m86n0HkX8lZVcs8Il3G+dM3ryguRH1v
	uCvSWnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3aN-00000007uxV-0Qnh;
	Thu, 21 May 2026 13:37:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3aL-00000007uxB-3XLJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:37:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17021601F4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 13:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42201F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779370632;
	bh=voImLt9U33hBPjIQg8QhUUlnxhHKHG4IMiIMQPxp1a4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O7jyF3CNcHD5Uw5yJ4jbg1G/e9pJk4K2bWFFoIZZCxRZfA6Nz5S0wXGJBOfO+AHO2
	 OS8/bOdGR97Ko5sIfyt0xYEtew1+H7VzQAs/WqF/JYrn3qAHZNxvHHqyY4mmAOl3Dn
	 8XnoQCD1bsR7bq8k1F4T6SORWHdWE4ekCw9MKnYahu/STE6u1VXDhgVeC9PL7cR4/9
	 zQ07PxzYInbFhsh/QZ2zbPG69mxYosfFYhIddt+En06GbQouDZO+Xz02O78mAaXqv1
	 XjQYwaOQ1GzBMe1AdjcUT7mP0dOeuaum6Uyy71oWWaogqaMp2kZ588RwEUMYpjyDkd
	 Lhft3rRwmKy/Q==
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1309f4ee97fso6982032c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 06:37:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+d9H7lHVQacyxJrwfQEZuVz/UZMyhzSZkvLB5f6Uqjl/yBfd6cOgo8ZSLhpTwnbXLZjvnoevDYE0uVQ2BKYEXK@lists.infradead.org
X-Gm-Message-State: AOJu0YzoLAvjdK+JkO+Hp53Cbx2OzHe6+c1z8SWdVdK0uUMH4DT2JXWM
	DqF0FDQq3ueIJhJUI9yuyKgx2Kx0VZZWY2xrGAM5O8MupvNdVe79GsYoV8raNxj1tToVZuRfr6I
	oJoRF7SiNEGTl4D4ncXM8aR8iOy2XbeukXzuqHPM2Ww==
X-Received: by 2002:a05:7022:e997:b0:12d:de3e:be88 with SMTP id
 a92af1059eb24-13632f5dea9mr1288887c88.36.1779370632106; Thu, 21 May 2026
 06:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com> <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
In-Reply-To: <20260521132419.GA3591266@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 21 May 2026 15:36:56 +0200
X-Gmail-Original-Message-ID: <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
X-Gm-Features: AVHnY4LFH9UCgONPbT3gC0_YdCdFnqhHf3b94YzGu6vwiF1lpLEOG3Bm7uxIaYE
Message-ID: <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
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

On Thu, May 21, 2026 at 3:24=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> >
> > I suggested it because of its flexibility. The alternative I had in
> > mind is something like a new field in mfd_cell:
> >
> >     const char *cell_node_name;
> >
> > Which - if set - would tell MFD to look up an fwnode that's a child of
> > the parent device's node by name - as it may not have a compatible.
>
> Remind me why the chlid device can't look-up its own fwnode?
>

Oh sure it can, but should it? I'm not sure it's logically sound to
have the child device reach into the parent, look up the fwnode and
then assign it to itself after it's already attached to the driver.
This should be done at the subsystem level before the device is
registered.

Bart


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9DFC02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 01:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7IAX40SIwOCKUJKjDGDjSIt4+fAEfgGp/BRmQSe+AM=; b=IfI9sn0hf4IU1+uguXoqWJi+Fp
	pV/oDIKPqfySgGY4EmsaSKkpZ45gX6R8XWT9fbgCgjp3PyDxEyUYLLHqCMQkPAdHG/u+Fvc3cAVwJ
	xUWnvqkU/BqwpRWAjFPJzJu8wLXGKqkzZSJON8PnIfrJLA5IQ6Janxailvjr79/skrV3nbal+GasC
	TmSysjFaQwMXE8bfugF95jaWq8+Cnk7mibgMLwcm8PwhqeRa9Y6Kbrkm6rGpr58MblRrTa7u5Kh0h
	l2/mh3BoZXl3+UTLrExNNsFdxECbtv58eYs3WCTKtIpgmsAqiHt2vQ21T956uiQjUg661eAxY+rHR
	K/gq6DTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfUVb-000000025Fo-3IpZ;
	Wed, 05 Feb 2025 01:47:19 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfUUG-000000025CE-2lZH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 01:45:58 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2a8690dcb35so2015826fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 17:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738719952; x=1739324752; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7IAX40SIwOCKUJKjDGDjSIt4+fAEfgGp/BRmQSe+AM=;
        b=F31/3K7EgbC2+nXv/+Icpcusmls4nssabQjACtqBRl5Bsh7R7R/6eIAqbkPHbfmxqt
         VN9lZlDE9MG6HuW+n15jHnmAk26LIICAPEB/WZtLoCU50V/CVd1lAGOtgjongTNPa+f7
         Xf2oQavLzrAdo5zZ0wWL5KOpdRya9Wwq1dza/Yg+LpL453KTN4CR7SdluF3ZZQAyVl+H
         I1CA/FO6totgovWVgbE0EsarGJCtYdEn0yuvfzyO/ghysELQDjKjldNTztCKaBRMPryX
         FbU4OQGynIA6lhnyz3uB4jAzoHUb4DiCEJ1z2QgLrxvrcwlC+RMza6zPf/LV2dsEMJ65
         OPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738719952; x=1739324752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7IAX40SIwOCKUJKjDGDjSIt4+fAEfgGp/BRmQSe+AM=;
        b=E/eAGtEb6IhA43c8jEJYrIOc7SMNMjEsrygk3NSxxouj9IpIGxoBLDN9pbcJ3rDNLH
         UB37dlYAVegbbD69wwsNvewYeoP5RIAMLQC1J3uY+MC8vEJOstLxDLL/4h42UGP9WVpj
         HaqobgRprsPXwNo8RxT8gpCTw+CskwZwUGlFZEmKy4E0XgqS7ElzpFvPBmaHTZrVCH7I
         Qg9s84zffirXDzEPNXg3HhM0RN01axcx5ksOgKs5V6UZOw8vtwe5IP2kBtynXHUp9Jdp
         K4SYlmkdzxIawk9yF9pMYEtsPF+NVU345E9v/8UboKVi6tYGHbbMxyWJN96Wa3AU40X3
         jsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLOEi7DiSxcwbM9ncCHNLKcKvtSozEv2cP6gXWTDuBi6Vp4ITWcvmZq2FH/j70vDGzamm4RpwOvO5zva5MLtNj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa4iFo0NJQRGXCK9osgAI20RxcsOUEle1RlPnxK/lngJdojUt1
	ATfqqYqYO1jGDVchLC5e0w8KPAsPxpKNjMayg2j7hhBdMjGGm48nWdSA+7WAWoVbKXr8tUuTqey
	5jJHpEBSXf4GaIYP/pF1GGTxdk0apP9uoAmrBCA==
X-Gm-Gg: ASbGnct92Dr+kMoLtV7F2ebrtKDRbcsW5oUtpprl26D8Nf8F1urtP/goKAz8xnsx1W6
	3EPx9YmqVG7as33xNjqORI6p7KiYkh3QLOjlLgjceHtFW4mXCjTUWQ3zweta4HC3f175yydJXH4
	Y=
X-Google-Smtp-Source: AGHT+IEEJSiApgxtxkGvC1xkEun8OovYoTlWGkz+UQfZ8HucQFQwWaCsmxUZdvb+jMWhRMNgUFoinaHR5BnA3MfwaiE=
X-Received: by 2002:a05:6870:5491:b0:29e:43ce:a172 with SMTP id
 586e51a60fabf-2b805126ddbmr804659fac.28.1738719951653; Tue, 04 Feb 2025
 17:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20250123074830.90923-1-cuiyunhui@bytedance.com>
 <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com> <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
 <31e00081-8695-4ca6-a1ef-af5a007a7565@linux.alibaba.com> <CAEEQ3wm+f_SM7evwL=YrGy8gPLS5YdJm=qhJNT8bbMH7QBOzEA@mail.gmail.com>
 <20250124122952.GB23438@willie-the-truck> <CAEEQ3wnTMfWSZRhTax3N60W=m3a=zxnJF6dOfiGnqJzBQs8WEg@mail.gmail.com>
 <20250127165156.GE25757@willie-the-truck> <CAEEQ3wkj=6WPNFpet=A9JppiO52agw6HZArwhfWsWS9JOY6Dng@mail.gmail.com>
 <20250204123111.GC1063@willie-the-truck>
In-Reply-To: <20250204123111.GC1063@willie-the-truck>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 5 Feb 2025 09:45:40 +0800
X-Gm-Features: AWEUYZllMpq2zJ1npesrHO1aKImtAqIVbLmJaSG6r67qE0xNiTPEAJWsfWgmnw4
Message-ID: <CAEEQ3wm4_oeBbVqsVrZ373j1SFBo6-DegL6ojH-ZCMwcw_-jVg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev devices
To: Will Deacon <will@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, renyu.zj@linux.alibaba.com, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_174557_034902_99D73A68 
X-CRM114-Status: GOOD (  29.39  )
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

Hi Will,

On Tue, Feb 4, 2025 at 8:31=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
>
> On Sat, Feb 01, 2025 at 05:51:21PM +0800, yunhui cui wrote:
> > On Tue, Jan 28, 2025 at 12:52=E2=80=AFAM Will Deacon <will@kernel.org> =
wrote:
> > > On Sun, Jan 26, 2025 at 09:54:35AM +0800, yunhui cui wrote:
> > > > On Fri, Jan 24, 2025 at 8:30=E2=80=AFPM Will Deacon <will@kernel.or=
g> wrote:
> > > > >
> > > > > On Fri, Jan 24, 2025 at 05:11:05PM +0800, yunhui cui wrote:
> > > > > > > >>>        vsec =3D dwc_pcie_des_cap(pdev);
> > > > > > > >>>        if (!vsec)
> > > > > > > >>>                return -ENODEV;
> > > > > > > >>>
> > > > > > > >>>        sbdf =3D plat_dev->id;
> > > > > > > >>> -     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL,=
 "dwc_rootport_%x", sbdf);
> > > > > > > >>> +     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL,=
 "dwc_rootport_%d_pmu", sbdf);
> > > > > > > >>
> > > > > > > >> A new name will break previous user tools.
> > > > > > > > This name isn't suitable. It can't clearly show which is th=
e PMU
> > > > > > > > device. Userspace tools don't have binding relationships, l=
ike perf.
> > > > > > > > Tools must traverse PMU devices before use.
> > > > > > >
> > > > > > > The device is under /sys/bus/event_source/ which indates it i=
s PMU device.
> > > > > > > As far as I know, most of PMU devices do not endup with a '_p=
mu' prefix.
> > > > > >
> > > > > > The point is the name "dwc_rootport_" is misleading, suggesting=
 an
> > > > > > extra PCIE RP in the system. Best to change the name to intuiti=
ve
> > > > > > "xx_pmu".
> > > > >
> > > > > As pointed out above, changing the name will break userspace. So =
it's
> > > > > simply not an option, sorry.
> > > >
> > > > Could you specify what in the userspace is broken and give an examp=
le?
> > >
> > > Can't I just take the documented example from dwc_pcie_pmu.rst:
> > >
> > > $# perf stat -a -e dwc_rootport_13018/Rx_PCIe_TLP_Data_Payload/
> > >
> > > If I have a script that uses that command on a machine today, then
> > > applying your kernel patch will break the script, no?
> >
> > Well, this is just a usage guide for the PCIe PMU and has no binding
> > with perf. In user space, the existing PCIe PMUs in the system should
> > be traversed first, and then perf stat/record ... can be executed.
>
> "should be". ha! You know we can't rely on userspace doing whatever we
> think it "should" do.
>
> > It's okay not to change the name, but it's better to change
> > dwc_rootport_%x to dwc_rootport_%d to correspond with
> > platform_device_register_data(NULL, "dwc_pcie_pmu", ...). It'll be
> > more intuitive. What do you think?
>
> No, as I said earlier, we cannot break userspace like this. Please stop
> trying to rename things that cannot be changed.
>

All right, I'll update it to v2.

> Will

Thanks,
Yunhui


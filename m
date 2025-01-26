Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848C8C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 01:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlwAWxWxHq9jBioa+OPFge+D1FchZhTsMwVSUxdLRyw=; b=RhuMF+i28DCM9rmQc44iRY98+F
	w+UWOiYIFtgGO7YI7V4kzcu3Bq6ROC81OY3AfYX6HU5rWqt410M5BKHOheE0pl6qIy6aUr3e64nyX
	1TECGi4cI3hf8IvcudhR/4XmX+8/v6q2k3Jn5rSVsabH6ePJ2HdwkIHvf87gjh7ARuNqKzuXP7y21
	DtJXzBMHpfISO5aAZNAtVBsutd5Zcr+ecUKVzVK4NYXxf/NTHGB9lMV9Ht7+p6BDt8IBIzetfy2JD
	n/sl5cxOxTtST922iygqiX2hi8B59QgV0RH+JpsbN79p0Sn267V0Pm5onEvmWCTER4U92BfTL3X++
	P4BbHkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbrtL-0000000H3KC-2lbh;
	Sun, 26 Jan 2025 01:56:51 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbrrQ-0000000H3G4-1qdd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 01:54:54 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2aa17010cbcso1467436fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 17:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737856487; x=1738461287; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlwAWxWxHq9jBioa+OPFge+D1FchZhTsMwVSUxdLRyw=;
        b=ccm17t/uG6343DkcyFm4C/sMPvnhpt967hX+1FDq/il1L+DYvjYUGNpa2yDW+WRhoa
         4J7wIs8y2LcJJRM5vzA5uVRbe1GbGpNXNGUAyErzkBRzaHC6rZh0czJI3WQyyynxcLU0
         Hb0ew0SEGaF6kFFL0HLcoiBkWXeTNboI+UYtWm9Y0HWFvo7ZHRiFXYTbYrFhhfpE3JtR
         hULjA4ztvEnCRNA9qC5PPjV3xVJ7m2DGAFYr1B3aQQcV8DEjWlqQ/SyTUxXgBOPeeyaw
         KppYEDIX1uMCqO4TSkLIAOR5Xd8G7USgoT5nZ8WFbx2nX+kds6dllk+KCmN1yPtLG9Z/
         KLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737856487; x=1738461287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlwAWxWxHq9jBioa+OPFge+D1FchZhTsMwVSUxdLRyw=;
        b=pCfqZwnhGBh1XFCVBmIR+zWU26/+grtQV7miHQ7WMzimP3z/3A58m6bk+Sr2HCSAuy
         lsHvySSMN/08Km8B9CaznCEY4Px8YLTbArFqGsTJt8mr3fCJq6wRWf4OWqm0h/c/OXt5
         7j+bS07fBzH2nF2lPo7fTf5OtVJr2Y08dOI/b6H5ZqkQro+HH06KKIqTUxnYn20VJccR
         4yC5/FF4SyXI8KgPUWk6uZW4WyFmdM6xyJRUF8+8D8NBYNrZFn392PPeR7qP3rxzGgty
         gq18VgSOptRhSXrm0wPYB7nfUii5DjCAfsJFKy1ZX9a90wNFatxXE8/OfGGS4YZBtP9f
         mRiA==
X-Forwarded-Encrypted: i=1; AJvYcCWeK86FjtRlUlos1kRoIHiIrSkFrPm8G3SngfeK3k9aYvq/TQJn4cfwo5wtXtJPvgR5Fg4I8XMvsTz80DA/MqSo@lists.infradead.org
X-Gm-Message-State: AOJu0YwlLv83h+Ez4DcvyPd8wz3OLXssngnrmjGaJGFOssq8ymCmj/Fi
	yGWRwEn/ePVf9WP1MQDs1+U+ahBf5g89MsLwIsd2MrASOhYBaXZirGLiGcAvs+C5KTvuLXz6P5Y
	cFaGuYw5ye6R6KoXvKym+2I5reYfyU3/Fk8b2rA==
X-Gm-Gg: ASbGncv8hK3ds511skB8N99vUMTOQtt8jS9C+H0CCbNw06EtkR0J1z79gkpaSJrNoGP
	UJyudJjCMg7i6JOIH3G9/SEC366GeBcD/OH1P3mtQNSVaSOhcj5pJ10HNPxBYewcq
X-Google-Smtp-Source: AGHT+IEXOf1ihKfapU13xYBIhLv4gy8wQGEe7hCvBOcSSCO0IvhngnY90gf7S+TP4D+yRKoMLT+l8Ks62C3W/Etv9bk=
X-Received: by 2002:a05:6871:630e:b0:2a0:1162:425a with SMTP id
 586e51a60fabf-2b1c0c55429mr19339653fac.26.1737856487102; Sat, 25 Jan 2025
 17:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20250123074830.90923-1-cuiyunhui@bytedance.com>
 <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com> <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
 <31e00081-8695-4ca6-a1ef-af5a007a7565@linux.alibaba.com> <CAEEQ3wm+f_SM7evwL=YrGy8gPLS5YdJm=qhJNT8bbMH7QBOzEA@mail.gmail.com>
 <20250124122952.GB23438@willie-the-truck>
In-Reply-To: <20250124122952.GB23438@willie-the-truck>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sun, 26 Jan 2025 09:54:35 +0800
X-Gm-Features: AWEUYZnjTNudJLKYBjStW-XVXHtOfqxKQ5nXUCNPH1jPKAdahkJrAo65xHG4-aw
Message-ID: <CAEEQ3wnTMfWSZRhTax3N60W=m3a=zxnJF6dOfiGnqJzBQs8WEg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev devices
To: Will Deacon <will@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, renyu.zj@linux.alibaba.com, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_175452_816440_09E8AFE6 
X-CRM114-Status: GOOD (  15.46  )
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

On Fri, Jan 24, 2025 at 8:30=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Jan 24, 2025 at 05:11:05PM +0800, yunhui cui wrote:
> > > >>>        vsec =3D dwc_pcie_des_cap(pdev);
> > > >>>        if (!vsec)
> > > >>>                return -ENODEV;
> > > >>>
> > > >>>        sbdf =3D plat_dev->id;
> > > >>> -     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_ro=
otport_%x", sbdf);
> > > >>> +     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_ro=
otport_%d_pmu", sbdf);
> > > >>
> > > >> A new name will break previous user tools.
> > > > This name isn't suitable. It can't clearly show which is the PMU
> > > > device. Userspace tools don't have binding relationships, like perf=
.
> > > > Tools must traverse PMU devices before use.
> > >
> > > The device is under /sys/bus/event_source/ which indates it is PMU de=
vice.
> > > As far as I know, most of PMU devices do not endup with a '_pmu' pref=
ix.
> >
> > The point is the name "dwc_rootport_" is misleading, suggesting an
> > extra PCIE RP in the system. Best to change the name to intuitive
> > "xx_pmu".
>
> As pointed out above, changing the name will break userspace. So it's
> simply not an option, sorry.

Could you specify what in the userspace is broken and give an example?

>
> Will

Thanks,
Yunhui


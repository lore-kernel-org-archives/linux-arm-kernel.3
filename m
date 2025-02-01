Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE71C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+AAdkcmZc4lSXsMOcapYBhFqOepj7d/gBINmIU6crc=; b=ob5c27Ic1gN2C2wdz48mCURkDS
	Xv6lvJTrV7oUIXEZzc/P2t/AdTzEtUl2iKRR/+DN9fla0VcT1zemgrOfYGXAFzXyFYkwYLs4wlFkP
	Wp/0VTCNwv7lnChY4ra/3l9b51bvYHhU7bWV/pr/02DlnxbQ6oo40/AESPTGScBjmLvlH+VTS4oBb
	1ju8wGeJjz1VIVU9aanbspvN1YhQuN9GTjQ2spZKDSvzVGvj+J2D4KAqOtE56zYyItU4EUf1mI+Cj
	qmdw6+b1/zVhbGXXpMeWOxIOZn15u8m2a9cU9HuYB9yVfcN/dtP2l5xO9dRik6TbUvYM0/0RPPJX1
	MzHvCD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teABS-0000000C6n5-0McM;
	Sat, 01 Feb 2025 09:53:02 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teAA7-0000000C6hT-35Nu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 09:51:41 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5f2dee7d218so1262719eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 01:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738403494; x=1739008294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+AAdkcmZc4lSXsMOcapYBhFqOepj7d/gBINmIU6crc=;
        b=BwQgHCx6v6PQwrP1/972Wz1d4Y9pslxtb+U6kEScr9/+HXZH6FMi6XJVFaZ0Z9guOg
         99mdASgmAPBNxDMFqLnLXH5cNvZRbZWeogO9V1WVWe7SRdgpobP9meQWXxlNH0ugx87J
         17ms5JmwLmuyYP2BHywXEMuSferSjqUWaB1iGNROYuL9cMFX9Z5TUq2UTa7BtvtrPEA4
         D9efwzM1QIQg1kuPc2OP3mxzVFRYA8sMLUujAkHwvCWYLD6/dJQEBKHV+fDU62J5lpVo
         t5tF/G1C2IjsRD+NHM/Obbm4/2irCE9LcVZagVpQ1J/GlHWG1vIHp91oEQ5zQMfZWTFP
         U2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738403494; x=1739008294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+AAdkcmZc4lSXsMOcapYBhFqOepj7d/gBINmIU6crc=;
        b=Xud0p6kd8H7stRnwGC9KlZ3av+M6WGTDZsdm9QzWppi+viYIFKo6URK/ZFthgnbAhe
         0MBUdWevO0jUDL1PSIidzfwWonwxt04xv0aWiWRxE6ipoYm3kfBfx6XhsYwhN1CaSOnF
         /8LRkPmfwBkmzYDtoXiUEvPdJzsd3pqom0JeZCI6hmCOgtNKAit70HShKnrtSaitDeU0
         iv4X0baFUpl096hvvc+ictXoADt4gF+cjnIz9c3pKjqc3yHh4fm7oCK7UOJMqKXbjVcl
         iRD1rAwuKW2mFXPvRVKQ9pR+tozvpo4v68xkKcIMjKHtl55gZ0C5uMQycB7oNevF8n6G
         pouw==
X-Forwarded-Encrypted: i=1; AJvYcCU1iQ9yeX+6axE1LWzrXmY9cmeWOhQvp7u01jiLIbgcP+67zwWHaPOUIoM081hH8jHrDoQ0ChrZTuAadY5yxlIn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsr8ewbkv2BI5oxtS1vxVwCnp01OYF+XfU3/MG+tlO2BM3W3yu
	9Xsdox1cdX4PTFmpIqnjs5F9hM7sZK5QxDAwE8K7t6uGwitbTQgEbPt05UdwlTMApAuVCZstrso
	IMGpc4A4g5xxvdVaP+1xpotJcAVtEEP9ZnYwWZA==
X-Gm-Gg: ASbGncu7peaFLzyfxklITmSKvX7ALRmUZeFEJbUYMh9mTlaWLN2qfgTECFECodSPtL6
	qb4F3iDAYB7KLe7wyq7RQIXUPqSpaGYonMA35hDDb2+gMw4rMEDJSUKDf5mIHi2z+879s5GRxy6
	M=
X-Google-Smtp-Source: AGHT+IEIIfBdNVn8LDpeA6rFY2D9do+Hyc1wDJ+qpODyAMtmiFvSiXtuvbFiuEmS1fHjZJ/7xlgvm9YLi2f51OwMYUg=
X-Received: by 2002:a05:6871:8802:b0:29e:563c:2dbf with SMTP id
 586e51a60fabf-2b32f286144mr9462267fac.26.1738403494288; Sat, 01 Feb 2025
 01:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20250123074830.90923-1-cuiyunhui@bytedance.com>
 <344c53cd-d856-4c03-9deb-743b65acd8aa@linux.alibaba.com> <CAEEQ3wmDej9bbPUmkx-ZrD4FG9Z7gTHMeCrVszx64g90O0RyiQ@mail.gmail.com>
 <31e00081-8695-4ca6-a1ef-af5a007a7565@linux.alibaba.com> <CAEEQ3wm+f_SM7evwL=YrGy8gPLS5YdJm=qhJNT8bbMH7QBOzEA@mail.gmail.com>
 <20250124122952.GB23438@willie-the-truck> <CAEEQ3wnTMfWSZRhTax3N60W=m3a=zxnJF6dOfiGnqJzBQs8WEg@mail.gmail.com>
 <20250127165156.GE25757@willie-the-truck>
In-Reply-To: <20250127165156.GE25757@willie-the-truck>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 1 Feb 2025 17:51:21 +0800
X-Gm-Features: AWEUYZmAdXUmi37d66_VLF0H-K_x7oGaiWsf00mIojMN1X-oiLjeCpkGsMu0T7E
Message-ID: <CAEEQ3wkj=6WPNFpet=A9JppiO52agw6HZArwhfWsWS9JOY6Dng@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] perf/dwc_pcie: fix duplicate pci_dev devices
To: Will Deacon <will@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, renyu.zj@linux.alibaba.com, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_015139_782674_BE0AAD6C 
X-CRM114-Status: GOOD (  23.45  )
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

On Tue, Jan 28, 2025 at 12:52=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> On Sun, Jan 26, 2025 at 09:54:35AM +0800, yunhui cui wrote:
> > Hi Will,
> >
> > On Fri, Jan 24, 2025 at 8:30=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Fri, Jan 24, 2025 at 05:11:05PM +0800, yunhui cui wrote:
> > > > > >>>        vsec =3D dwc_pcie_des_cap(pdev);
> > > > > >>>        if (!vsec)
> > > > > >>>                return -ENODEV;
> > > > > >>>
> > > > > >>>        sbdf =3D plat_dev->id;
> > > > > >>> -     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dw=
c_rootport_%x", sbdf);
> > > > > >>> +     name =3D devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dw=
c_rootport_%d_pmu", sbdf);
> > > > > >>
> > > > > >> A new name will break previous user tools.
> > > > > > This name isn't suitable. It can't clearly show which is the PM=
U
> > > > > > device. Userspace tools don't have binding relationships, like =
perf.
> > > > > > Tools must traverse PMU devices before use.
> > > > >
> > > > > The device is under /sys/bus/event_source/ which indates it is PM=
U device.
> > > > > As far as I know, most of PMU devices do not endup with a '_pmu' =
prefix.
> > > >
> > > > The point is the name "dwc_rootport_" is misleading, suggesting an
> > > > extra PCIE RP in the system. Best to change the name to intuitive
> > > > "xx_pmu".
> > >
> > > As pointed out above, changing the name will break userspace. So it's
> > > simply not an option, sorry.
> >
> > Could you specify what in the userspace is broken and give an example?
>
> Can't I just take the documented example from dwc_pcie_pmu.rst:
>
> $# perf stat -a -e dwc_rootport_13018/Rx_PCIe_TLP_Data_Payload/
>
> If I have a script that uses that command on a machine today, then
> applying your kernel patch will break the script, no?

Well, this is just a usage guide for the PCIe PMU and has no binding
with perf. In user space, the existing PCIe PMUs in the system should
be traversed first, and then perf stat/record ... can be executed.

It's okay not to change the name, but it's better to change
dwc_rootport_%x to dwc_rootport_%d to correspond with
platform_device_register_data(NULL, "dwc_pcie_pmu", ...). It'll be
more intuitive. What do you think?

>
> Will

Thanks,
Yunhui


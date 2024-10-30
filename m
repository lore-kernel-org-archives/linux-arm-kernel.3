Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC833D5CC91
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 23:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xITKeeCQTPMHTwhjLrB4rhB00Y72QJELP5T2ItEbVI=; b=k+8FwQnTap/W2ukN+WY+tvL9Tx
	yXL4fDg+M2fiWNHWz1+EqYJumSZH+TEzmnDBmOCkYXupfvbt4RK8jBpGfkMFldNxnb/D8PLoZMJbq
	P93Xh2zAzH+MrMul+Lx4NL9SBBpXDbqAi81HoM7qPX8lyn05xUZxqiWIx9J9hhr9Y2LaR2mnDVdMG
	CSQUxDo+ifYdIXIiSjrS0jyL6wfV4jJbAAzeFFEunaxDAr4g5KssOJMM/ks6aEwIZfeLkCNaIHuEQ
	bbAG5RVrACvGMN6TVxs9ZtycmiTJIJfo76FhICZuhKiqJh4kplnP3ncwGwLZh3YwtNovfz0WLeiOx
	RDYj7TnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ITh-000000025y8-01pC;
	Wed, 30 Oct 2024 23:51:53 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6IS2-000000025oM-1y51
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 23:50:11 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7db54269325so323154a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730332209; x=1730937009; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xITKeeCQTPMHTwhjLrB4rhB00Y72QJELP5T2ItEbVI=;
        b=OccL1vzvlY8syvDwLvnitziXdpGRurcbPK62MM+w6J00xlgFu1X+nsdNqw7Bav0yL+
         HNMVBdQSpZGYT0ZkqWyICXLMcVn4ujP8N4J6+X33SepZIPvdQUfTNyp2aG4v0N8Uluk8
         9aSUsLo6TIWzAr4uLZrNYAtUY2yvH+UECpt6NUrBt/Gy201cDhzmYuoJVjss82qHHc6L
         zcVuSnGuZmo3lBXIIRwRb566nP6JEb5knifdizD8piO3T2OMPhy1v+qZNw/a9Ujh1n+C
         Lg6Y8diQDwQ+f3O5P01YM4MzMQmAeaSiSEHxWQmYTkB7PomVj27srAF33KwFKdooPYuB
         I8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730332209; x=1730937009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xITKeeCQTPMHTwhjLrB4rhB00Y72QJELP5T2ItEbVI=;
        b=osu6ypOKH+Qx57wvcPPqnMTbkJ8N42PmCOged6X7ne7kfOrisfGV4VLvZYn3XHgoMC
         IfBbmHoaF8R7RRUXhmxXsMCx3L+fj6bhhZsIj29TL2d+fcxWp1ydu4CUBY6S6gk16rEe
         EPmc7Ze8c6X46SK6spiGH9JYznBBScbAJ3Of8lJltTfDgolhBsgu7KcOvk9a02QJN2Y+
         dzsoMlJDrT3gJOmNPnEoauBBacWzhHv5sdPqCfIlIvGeoHduAVqr76Y/8ja+FvXoKjDM
         /AoQQzgWvhjA4xj0MgP1fwCZdjfgqbwSHPXHRlZSm15I2ZTieiQpjRVTJeKuF83ntM/k
         vFig==
X-Forwarded-Encrypted: i=1; AJvYcCVn3PMR1RNAyULI0K4nGZvhV+wKB2XzxQ1iGN/ZtOhTzZjeEC/+YKt5rTLpK6MkgZs9729S3V1l5zsy6OSG+WF+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4sGd1eKX66O3j/jTqLPkS+y9ar/E840qRPLxSjh1h6TBIxj3D
	3TlgFN2MUmeeDn1/bpAN52V6Me++nXMK0KbofpArrsxK9dx/0yBY11MCR5xmSjDboPARqAySpVC
	TxFKl0WqzmD9JjZIB8Ss8duUgWrM=
X-Google-Smtp-Source: AGHT+IEGZomZ5kJjb+R1NLfXagX6H4tJArwRpGGFHsIJUp3TX6AYCJgn71SzvrzS+RXVFHlSMLywNa+CNyNDqhllWuo=
X-Received: by 2002:a05:6a20:c854:b0:1d9:c615:944f with SMTP id
 adf61e73a8af0-1d9c615a145mr12413848637.11.1730332209274; Wed, 30 Oct 2024
 16:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1730136799.git.robin.murphy@arm.com> <ZyIClriScBy4s6LX@8bytes.org>
 <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com> <ZyIos2Gm1nf5rejI@8bytes.org>
 <ZyI0baBMPHVZ29-k@tp440p.steeds.sam>
In-Reply-To: <ZyI0baBMPHVZ29-k@tp440p.steeds.sam>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 30 Oct 2024 18:49:58 -0500
Message-ID: <CAHCN7x+M1tfmJYhp0+qovhedMiMG=fdyaf-CnPz_hUi7abuDCQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
To: Sicelo <absicsz@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
	Robin Murphy <robin.murphy@arm.com>, will@kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, 
	Beleswar Padhi <b-padhi@ti.com>, Andreas Kemnade <andreas@kemnade.info>, iommu@lists.linux.dev, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-media@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_165010_539254_C06350A3 
X-CRM114-Status: GOOD (  25.26  )
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

On Wed, Oct 30, 2024 at 8:28=E2=80=AFAM Sicelo <absicsz@gmail.com> wrote:
>
> Hi
>
> On Wed, Oct 30, 2024 at 01:38:11PM +0100, Joerg Roedel wrote:
> > On Wed, Oct 30, 2024 at 12:20:31PM +0100, H. Nikolaus Schaller wrote:
> > > Why that? There was a discussion and everyone agreed to remove omap2,
> > > but not omap3 and later.
> >
> > I raised this question to make sure the things we maintain are still
> > relevant. Developer and maintainers time is limited and we should not
> > spend it on stuff that nobody uses.
> >
> > > There are some devices besides the PandaBoard. I am aware of these wh=
ere
> > > this is relevant: Epson BT200, Samsung Galaxy Tab 2, Pyra Handheld
> > > (in production) and we are currently thinking about producing a tiny =
series
> > > of the DM3730 based GTA04A5 with spare parts.
> > >
> > > And of course we want to participate from the latest and greatest ups=
tream changes.
> >
> > Okay, if there are still real users for latest mainline kernels on this
> > hardware, then the effort is justified.
> >
> > Regards,
> >
> >       Joerg
>
> There is also the Nokia N900 phone (OMAP3) still seeing mainline
> activity, as well as the Motorola Droid 4 (OMAP4), to name a few. I will
> also be testing on the N900 around the weekend.

The Beacon Embedded / LogicPD Torpedo and SOM-LV families (OMA35 and
DM37) are still being sold and I still run various tests on them
periodically. There is also an AM3517 that I still periodically test.

Once Micron kills off the RAM and they run out of supply and Beacon
cannot sell them anymore, I'll submit a patch to remove the
unsupported / EOL boards.

>
> Thanks to everyone for the amazing work.

Thank you for all this.  I haven't been as active lately, but I have
been following this.

adam
>
> Sincerely
> Sicelo
>


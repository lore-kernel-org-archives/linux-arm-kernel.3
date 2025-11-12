Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2727CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLBafia/PKtEtA26Adnrbq1J4wPUztP9+12xCkx0pVM=; b=SGQwTAPM+KqyGN0vs5Bv7LJKg0
	XqEshZOPMjYGQOWra8arUlVLSldEVW67j4w6/iMjiSBqmkI5J5PNTZ+URqALPad3/KrCizK+H+eYI
	KPmwdb3i+mZY/b5+DXryhH1UBla21urANhDxoo9knwLri/zrpkOisH5Kzb6eynNhhprC1UmdWGDjK
	XraZ4TqF6rAlLZ1UP72FDGJ3vQ2qwIMm/Hp41Mr0C4ZX4sqvA6EGXEJ3OAwRhWguuAgePCLwTVTKT
	jp/V+N5QL3DzRogfIGn5c6BpOAzoO6xadL3NST1Gt7Vy87Vz/ePMowvvKIOPswzaeM/nLIECYtEwr
	o165rZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ5yv-00000008Jpl-2QHm;
	Wed, 12 Nov 2025 08:13:33 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ5ys-00000008Jou-2A6A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:13:32 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-bbac8ed0614so439601a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762935210; x=1763540010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLBafia/PKtEtA26Adnrbq1J4wPUztP9+12xCkx0pVM=;
        b=BwFdNgbjLSOR1IucrJyDwHM8LY4aR/B3PpEBjJNPVKzhx0ArjMXstkWPoCTFBbjAhU
         QU7tMMH15zCXQK+5lO/1Lxua3XFNcSFVoCqHIU6k8bZH3kGohfPbxBASt0itF1Q+bc7l
         ankUtn7CSZPD37jVthQ353aQPac/pMfvD1Vn8eBdmx1HiPZU73fhL8myKJCXdpaAc2YF
         MS5IGWZRQSzk7oIMCy7Kc2s37ugqjbIlxiPSQYz+UDom7g6kSAnz8rgtTWMSfSv1lZFW
         Ow9qkfyWAayW5xzUlFg7hOhOGwxAik/J1obpIAOvq2sK7/+eVxaw0gqsvqNe2TZLfigT
         DUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762935210; x=1763540010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLBafia/PKtEtA26Adnrbq1J4wPUztP9+12xCkx0pVM=;
        b=hEBDSduqKw0+m6otkP3pOUStdzPtbfs8hRNV6+yM0atRhibQAQ2JxFhw3rEwA1eu86
         H90EoqyDG5T9v8ZUM81itPgsV9c792MrPCI9MCvIect8ysaMdDh3rcd+kZN7XPx8fv9y
         0HIr2qaUUXMj0lapkxG96T25+ZGcbrVJIAWKotgcTZ80G/J4AMR3DWRr2k0x+Sdmm8Qn
         n55NgjIf7CwCIC33AyRirBVkTRdZ4rwrA6TczHjMrAOm5q5EkIm3sIPE74Ys5IsfJkPy
         ODWFI+ek2axkIhHDHa40x90ewf8+gWfRZd2UfD7oirbbryR0SUv81GuGb+4EUvVdYyxU
         QgPA==
X-Forwarded-Encrypted: i=1; AJvYcCW269kl5RJLW1I4Ef7pMga1jausYJ7YFTsP4IV4OkjUfJRun6OyhWoLg+90FOChYh6y34wU/EkuiJ7CcYQMpcEZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxkzoO6lUGl2kswUQjQSS2e1p3p/Iefph9eWuzfMdaRvs/I7f9o
	l2OEvLiVex8wadi1z72hm25OhVlD2GruFIxaSRC7HoMhA2JZMYRhoVO7ZtLMIJ20uV4uh5aOnai
	SiGVaW+ruBKQ9SCW3sxR/PlaOhBwphZM=
X-Gm-Gg: ASbGncu8oAWWT10UJv+tWBmmPuXysAI/49vMctyIKQ9YRivmLWPWZFw0H6E6ZYVa6iQ
	/d19w1IZqj7dBchmOVTlooOM9UjxRuehiym/1BR9tEJxbdRSljdr2w/JN6gBXlLpWrV2KG0sxq/
	dxUValgFHX5AV1yJsaWLJtgIy86c2nQC6DacGVOJEUm4Zu34VI7eLs548nwO+VnW9+DjAG0spQc
	GFBWed4lSI3y/zW5wSAQ0bArt3QjsMu/fxSvLIwAfW7F0lSBHIFu89FUw==
X-Google-Smtp-Source: AGHT+IFnRin4gbmaFXUeI1BQiFdRCsNStgXxem0kbVw96MxrNLtIH0I6wkHre4CD95K+KCuFYtCNaztTRJvt/f8NODg=
X-Received: by 2002:a17:902:ef48:b0:295:6d30:e263 with SMTP id
 d9443c01a7336-2984ee02133mr29024415ad.40.1762935209636; Wed, 12 Nov 2025
 00:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
 <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com> <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
In-Reply-To: <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Nov 2025 10:15:53 +0200
X-Gm-Features: AWmQ_blLufo9e8_weYIhkdYf5Y61ajIvynO_fKPgAnclvKt8xEjxER44mrl124g
Message-ID: <CAEnQRZBBJ4PGDOk7hBP_qsk7bBiec8pHb0DYKs2mhOAahNyKww@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Joseph Guo <qijian.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_001330_560588_B896E0EE 
X-CRM114-Status: GOOD (  13.18  )
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

On Tue, Nov 11, 2025 at 2:49=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Tue, Nov 11, 2025 at 1:50=E2=80=AFPM Fabio Estevam <festevam@gmail.com=
> wrote:
> >
> > Hi Daniel,
> >
> > On Tue, Nov 11, 2025 at 5:45=E2=80=AFAM Daniel Baluta <daniel.baluta@gm=
ail.com> wrote:
> >
> > > In addition to that, Rogerio please read:
> > >
> > > https://docs.kernel.org/process/submitting-patches.html
> > >
> > > At this moment I think you should keep the original author of the
> > > patch.
> >
> > Right, but NXP makes a total mess with authorship.
>
> I cannot disagree with you on this, let me clarify it internally with
> NXP colleagues
> and sort everything out.

Hi Fabio & Rogerio,

Checked internally and to track the correct authorship and development work
here is how NXP would prefer to get credit.

#Use git commit --amend --author=3D"Xiaofeng Wei <xiaofeng.wei@nxp.com>"
Author: Xiaofeng Wei <xiaofeng.wei@nxp.com>

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>

Co-developed-by: Joseph Guo <qijian.guo@nxp.com>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>

Co-developed-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Steven Yang <steven.yang@nxp.com>

Co-developed-by: Lei Xu <lei.xu@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>

Then you can add your own C-d-b and S-o-b.

Thanks,
Daniel.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B605CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5IgqMB/v3xeO5BgQjIq0XWQN2JeRWzsu5Px5Hi7zIAE=; b=B5hKWbUUiPbCRf5R/aUgAEQbfu
	1cq1zAyETqf1ILVnRgxxOJzPKEobcqsbp/zSIvp4B9IyRsoku4QDMyLIcTFKBgr+gwKmt6pWaw5V6
	MN/mekRGxOu3aAOQk00QPnnIppE7u9V1oC93jfyaOjTqI+5qnQIl06crYSTvDzjB3uwkvGMqu+19G
	7PmOQPMzV6YK7Sj4wFwhXFDwGjkt8JRFC1/USgPeT+19m5aNVZF4VKlpRcb5wqHuU5O+0A3KuT/BI
	6BJoocF9fxy3rpEo3rbZcNUhkUedhMCJ1n5Enu9ssdOntZB1x64VVon/03/4Uxk4FTCYNePsP2Lxx
	8ndNjLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBTP-00000008u2o-29Ac;
	Wed, 12 Nov 2025 14:05:23 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBTN-00000008u2U-3iC3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:05:23 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-340ba29d518so637536a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 06:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762956321; x=1763561121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IgqMB/v3xeO5BgQjIq0XWQN2JeRWzsu5Px5Hi7zIAE=;
        b=LgwxxhNJauIYkebi3JU+O2aSK50NclUaOsNtnNGUYmfM/tsD6pN2TktMxZCRx1qeUu
         oGdTuuS6ZGaHXsJFwVgJDjz1aG+DL7E/8jk0wAOr3a7fOrLXrMdPkvFneEnmvS6WsMgm
         nbsjYCanUBg/idZtiG4t51UfBZh+Pt0RWJtbFv8AEKIYJFcp4gzGy2N1tFXimqK6gaBV
         8pmQl1U4cfb5U3NlvrV9rdc6UG7QHsccoxcAYkN2KbWAgGIbDj5ItBIiWRxeJSGsltfJ
         qCobPvoCWxZjWc5k+yKRAqbUSmzXMQtx4NKlW+j27nngsVwPXNewHm/U+XalQQh9Rcw+
         jCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956321; x=1763561121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5IgqMB/v3xeO5BgQjIq0XWQN2JeRWzsu5Px5Hi7zIAE=;
        b=mzkopo0GyuimGGI3HaTOe/bC9gV82IDl2iCDB6h9lVB8T4lzkYqCKEEN0GslmEQijN
         PImXIHy9GWbDn1A2713vIksTvS1nZzlS/BBn7R7OmHRnIoQTUAfrEiN4m2SJvBPZxgNW
         6WOWW8SGBWUik4KnCe7V/vYPQSyO7v24ZYhaOav940TpNO9fCxQ8c7PoQD2mV/dw/PYM
         uKIPnElKQvlZLXwqxIaz3QycI+kvg6OXTa+ptWaRsj4I+DFL0oFMyMlnyNyESinhSGvD
         /4Tl68SF28uP9apus2X3hyVyedTmH//kliGEoenycQvihygKTgbjr0oqXALQTdaWYI4L
         awCw==
X-Forwarded-Encrypted: i=1; AJvYcCUqa/xZK1Wj16Br5iYzr5FQyFbBq5+4iIL/DWwiw6inpQ5ooq9SYk8iUS4GUpZ99tY/dkkpzMTvQIBZp9iRY6va@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4Rol5hCut85ikjb0deiyW2J6GQ8ZfSVpUJDP6b32D1/RYpaMZ
	HsMYt99nnEs4dxZ081MxNJxkOBdtXG+SJ+Ojo60CLQcXProYipa3qjz+PAHzRy1fNLqMNBouP0A
	RabxCiSyQ7uSohAZBdLZxqbx5/sGST4lSFGt7mtPumw==
X-Gm-Gg: ASbGncvI7mz32xS7/QBzNqqBN74iJaefrvw3pOxNzcWt4eR0F1aDn8adKyOox1ZeID6
	8EoJaKFFUhvpYjIMk89ocUD/6utUBn1Rn/CQ+AQYMSYVg+8PRnD7r1JAVIFPqxwDcrwaP6DRQXd
	177gHnemgbZt46lDLuT3NpmxbHNG+p3VKuow+GhcavTL8l6rQFGkr6Mhu7Z0RaiXPXU+d70dHTg
	myTka7CemVwAjiv8SDLAPhADY2jfLRDQFZjXTUmJclJAUWriMeNEotSNjv2
X-Google-Smtp-Source: AGHT+IGGE4/VL1DEyxNrJ9gXhy58i37XginUx1Z79nbxZV1zaeXJiHFTS6UKxC5C1DeQKZdokBPv7izFiH2R6Na0d44=
X-Received: by 2002:a17:90b:3f88:b0:33e:2934:6e11 with SMTP id
 98e67ed59e1d1-343dde1328emr4083273a91.11.1762956320459; Wed, 12 Nov 2025
 06:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
 <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
 <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
 <CAEnQRZBBJ4PGDOk7hBP_qsk7bBiec8pHb0DYKs2mhOAahNyKww@mail.gmail.com>
 <baafb460-fb65-4cd2-9911-89d828199d9b@kernel.org> <2e160fe1-bcb2-41cf-817e-ac2a36959b16@kernel.org>
 <CAEnQRZDg0yAjR-a-4J2ZKAjh3mm8NeQCA=o2kyNJtXMAFCMLAA@mail.gmail.com>
 <56530f64-6ddf-4d2a-a079-0578db260449@kernel.org> <CAEnQRZD=h5qOC445U3_+HPh7aCE8TohSpZmg9hgkRE7mg5HUpA@mail.gmail.com>
In-Reply-To: <CAEnQRZD=h5qOC445U3_+HPh7aCE8TohSpZmg9hgkRE7mg5HUpA@mail.gmail.com>
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
Date: Wed, 12 Nov 2025 09:04:26 -0500
X-Gm-Features: AWmQ_bkE3E5kBt-au_w0tdPJgXF5KUKjHFMKLDQ12VqLfiSClucWeakQI7DwekA
Message-ID: <CAOkaPuX7YeUJJj15dY0vD8mngg5MS5uBwU_UfrFRFjrghR7NDw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Fabio Estevam <festevam@gmail.com>, robh@kernel.org, 
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
X-CRM114-CacheID: sfid-20251112_060521_946972_CC4CC330 
X-CRM114-Status: GOOD (  19.02  )
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

On Wed, Nov 12, 2025 at 7:33=E2=80=AFAM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> <snip>
>
> > > We (NXP) immensely  appreciate individual contributions from everyone=
.
> > >
> > > We need to be fair, the v1 of this patchset was taken from NXP
> > > downstream without
> > > respecting the Developer Certificate of Origin.
> >
> > No, it wasn't. Please read carefully DCO. The chain here was not
> > correct, but that's the only thing.
> >
>
> Indeed carefully reading the DCO Clause b) you are right.
>
> > >
> > > E.g there were commits pulled in from our internal tree without
> > > keeping the S-o-B tags.
> >
> > Read DCO, please. It is not mandatory to keep 3rd party SoB. It is
> > perfectly fine to skip it, if needed according to (b) of DCO certifying=
.
> >
>
> True. In my understanding though if one bases their work on others work
> they should at least keep the S-o-b tag as a common courtesy.
>
> Commit messages explicitly says that the work is based on NXP internal
> tree patches.
>
> At this point I leave to Rogerio's appreciation on which S-o-B flags
> to pull and how much
> of his work is based on NXP tree.
>
> Thanks a lot Rogerio and Krzysztof for helping move this forward.

Thanks Daniel, Krzysztof and Fabio for the review and discussion.
I understand and agree with Krzysztof's point, but if there are no problems=
,
I would like to keep all the names suggested by Daniel:

Author: Xiaofeng Wei <xiaofeng.wei@nxp.com>

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>

Co-developed-by: Joseph Guo <qijian.guo@nxp.com>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>

Co-developed-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Steven Yang <steven.yang@nxp.com>

Co-developed-by: Lei Xu <lei.xu@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>

Co-developed-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>


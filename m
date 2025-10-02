Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA06CCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b4jK+m/8RWobuO0NphPEVc1dDtXHYNNnhWnKlc2Ffk=; b=SvpapSbJd6NywlyFjSNy97+fkW
	KIxqWeIaLvJ0agoSJ4UdwkHpjRsWa8vBM9iZVDZTZnKRTv88heqSFHYBNUPOu38rW99wo2qFZcxDF
	3hDXX6jNvauVFMVHpzDAgCmC0ehXYTzG76rz86HUjJYiUdpzomwPkiwcuN/eEtCOPqXThYLffgSs3
	nWfT/Y4mjH27ri+6rOlslMqujCLLB70r92sC8Up2We6cf4gkD3XFKyJEJvnkNxjfHrd0nR4vdfMPa
	d3lloMu7lHIIgEHblb+BofzxC2VPE4SV3OSYl8Rvv3l9Yp5mUXsVJvREHhu/gjX+vol/yQEZ5xIpw
	nhz7KC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M7K-0000000ApGF-2NKt;
	Thu, 02 Oct 2025 16:25:18 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M7I-0000000ApFF-0Uej
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:25:17 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso1254522b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422315; x=1760027115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b4jK+m/8RWobuO0NphPEVc1dDtXHYNNnhWnKlc2Ffk=;
        b=F53GKCJO0VROT0N8U+vW+djrvCu6NV2I9J7lmD2uXnB0gU4BEy5rwOr5KVIMuRK0gn
         pm2X+hE0V/UmUjXTZG/QPpt/iwl4EZ4oEDf2vv9tfwYytIgcbGA98rEovPKFz1/55CR+
         3B/IcL2bMSCfhCdZgw09vum3Ak4AvOdUsNbaCJzQ4sUFfSuKTM4Yi17KLY6dOrfuPp8E
         rG2I+fS1HPAcD5YW8kN9RLwBp46GELg9PTdocKDhWVetceyM6M7FPoKcGGhE56FtmuGU
         3oWnMUVlbpCGD+h50y6RXyOOALmlD5HYTLhjl4dZ2VsFEo2jeRQaGLY8OOior/e7M0Dq
         Z3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422315; x=1760027115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3b4jK+m/8RWobuO0NphPEVc1dDtXHYNNnhWnKlc2Ffk=;
        b=GTF+k4G060VZsmL7mNUKA0iIKzPxGBhmMdSn52yM1yji54mdkSCxUJ8LynJmaB7jHN
         7G8P2/VbGVyO3OvacRTlUwf3TEzFgpvjZ0zpAtSpgpX5HLRvhrPnDO4BAR4UqWWx2vF5
         CXVxp1HBuzXROuHuwqnNIkgMl4NaMXZAoAmO/nLR/p7UPG7/JL9I72jDiM+TyeFnMyj+
         ZhRTm1USOrwMKAtbFjxlr9b2iGTWemGFsieL/l5PuW3nnzR6qIeD7Q2jzwzCjsdutTGl
         rjYm8MXGFaA05hnkqPxGMbnBiuIhFpwvCWUJTeI0Xvqh9aZdMsi/KZuU1XN+UXhJqJp5
         Y4cA==
X-Forwarded-Encrypted: i=1; AJvYcCW0pUZ/cdvjy963JL9Z+XDCP0ILy4KZEyzH1KzpJUwSxCOV0H7czxc+RpauZ83L95i/EQAJBNeaeHRMO7bO4pkb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywthb/R3Yb58Mti4rg3p7NGg+1Zumh4jnQCLHLc/NiR61pG6Ykt
	keu0WJWeejcs7tXZxv5I8lCTCTL/RdFzc2RCpDShOjlYnVdG2vMZZ2Jp0RkS7EWLiKZXCtBy4R5
	dTl6kF+mpWomPcUALgFpK5/tBn2Bnq7U=
X-Gm-Gg: ASbGncvp/zg6Q8Nil6xEus9oTx4h+DO12AOIwYiv7Ehou+fFE+eBBbMMn7bQlvs3IWT
	3i7/xrhnJpfUGc/Mawo4o7SF0HZ+31FF+szHM554/QJ635nNWOwAwR65j3zw7YhixdqtYqXsd+z
	L9s3Q+t6avF0/gRwBzgEPHppNhdThA7dmsBzzn7Z7t4A5l5qctlGEGs50TgvvlWbNUXWBY8yLWn
	puZFn/z829/EaxUxGkl2bN8BRbDx1g=
X-Google-Smtp-Source: AGHT+IHE/zk/UTkg8cQuQgjzmknU1P4NQ77O2Frb3S1sd6aKc/XPDhOrrz+zfZ4f19CBYGkA2+apVfUO9bhD8Hpgsxo=
X-Received: by 2002:a17:90b:4d08:b0:335:2b86:f319 with SMTP id
 98e67ed59e1d1-339a6f76fdcmr9571286a91.35.1759422315195; Thu, 02 Oct 2025
 09:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250818-imx8_isi-v1-1-e9cfe994c435@gocontroll.com>
 <20250820140154.GB6190@pendragon.ideasonboard.com> <a9283349-c58d-47e6-ac33-77b5a6b893fe@gocontroll.com>
 <20250820141439.GA10547@pendragon.ideasonboard.com>
In-Reply-To: <20250820141439.GA10547@pendragon.ideasonboard.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:30:12 -0400
X-Gm-Features: AS18NWDGHOBDrSguIYms66P-zFEY8uoL7wGfB2jgVSBuHpouvKYa_JLzhedGeUA
Message-ID: <CALC8CXf2RTYz2YjbFHsbdjDSSAt3Jdv1NBbBQs4jRPmwkuUuXA@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: Check whether pad is non-NULL
 before access
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maud Spierings <maudspierings@gocontroll.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Riedmueller <s.riedmueller@phytec.de>, 
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_092516_158760_0EEB4AD6 
X-CRM114-Status: GOOD (  28.86  )
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

Maud... Laurent
Yea you a Mad Lad.

On Wed, Aug 20, 2025 at 10:19=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Aug 20, 2025 at 04:07:55PM +0200, Maud Spierings wrote:
> > On 8/20/25 16:01, Laurent Pinchart wrote:
> > > On Mon, Aug 18, 2025 at 02:31:43PM +0200, Maud Spierings via B4 Relay=
 wrote:
> > >> From: Maud Spierings <maudspierings@gocontroll.com>
> > >>
> > >> media_pad_remote_pad_first() can return NULL if no valid link is fou=
nd.
> > >> Check for this possibility before dereferencing it in the next line.
> > >>
> > >> Reported/investigated in [1]:
> > >>
> > >> Link: https://lore.kernel.org/all/1536a61b-b405-4762-9fb4-7e257f95e4=
9e@gocontroll.com/ [1]
> > >> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > >> ---
> > >> I'm not sure if this should be a dev_dbg(), just following the patte=
rn
> > >> around it for now, also not sure if EPIPE is the correct error.
> > >
> > > I've submitted
> > > https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pin=
chart@ideasonboard.com,
> > > which should fix this issue in a more generic way.
> >
> > Saw it, but I think my patch technically is still correct as the
> > function documentation states it can potentially return NULL right? [1]
>
> The function documentation states
>
> "returns a pointer to the pad at the remote end of the first found
> enabled link, or NULL if no enabled link has been found."
>
> The MUST_CONNECT flag ensures that there is an enabled link, so the
> function can't return NULL.
>
> > Link:
> > https://www.kernel.org/doc/html/latest/driver-api/media/mc-core.html [1=
]
> >
> > I will test you patches tomorrow.
> >
> > >> ---
> > >>   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 7 ++++++=
+
> > >>   1 file changed, 7 insertions(+)
> > >>
> > >> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c=
 b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >> index ede6cc74c0234049fa225ad82aaddaad64aa53d7..1ed8b031178b7d934b04=
a8752747f556bd1fc5a9 100644
> > >> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >> @@ -160,6 +160,13 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_c=
rossbar *xbar,
> > >>    }
> > >>
> > >>    pad =3D media_pad_remote_pad_first(&xbar->pads[sink_pad]);
> > >> +
> > >> +  if (pad =3D=3D NULL) {
> > >> +          dev_dbg(xbar->isi->dev, "no valid link found to pad %u\n"=
,
> > >> +                  sink_pad);
> > >> +          return ERR_PTR(-EPIPE);
> > >> +  }
> > >> +
> > >>    sd =3D media_entity_to_v4l2_subdev(pad->entity);
> > >>    if (!sd) {
> > >>            dev_dbg(xbar->isi->dev,
> > >>
> > >> ---
> > >> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> > >> change-id: 20250818-imx8_isi-954898628bb6
>
> --
> Regards,
>
> Laurent Pinchart
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8E5C5AD69
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=; b=m5/Z6Bc5v68qsQcLOmnqJxV42I
	AUPnTm4Kdk1DHjPq0YO0UdnVB2H40hRoceWvwXnFBuJek3XoOPceo1IIcdKE/OaMbJl37u7Actk4C
	OPlOfQGGKBgsXPqKFEnjT1JAvQdVWCKOx8CQLCd5x7qKoSifDUhv1QUQTb7ca6YyI/PFnxPeOMOkZ
	LcddmaIdyB99fbsSMK3mme3bk6hFSfw+r7kYN98mt2MFX6/rAzdI1Lov1jJPIdsVW6Z+BfCM/GR4y
	nGfh1+Nozp+dKN3vP8zKBUaLwwdsdOcXNAQPhx5WvOHbCY82BzHbBF6K/TuvSqe75mbllcLjBysKY
	51oVOBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtX0K-0000000FYny-2kpl;
	Fri, 20 Feb 2026 20:21:36 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtX0H-0000000FYna-2D25
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 20:21:34 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-65c01595276so3747583a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 12:21:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771618891; cv=none;
        d=google.com; s=arc-20240605;
        b=Om3d4uwqJ3CG33G3r+EdgI7PMdBR4vRRbFagbfBRUxaOd/woErBIzTIRnKw5iWfyEq
         7rU9aB92ONkOCn4wUVCtkNdSy+bU96XofTBa4YGYJrsyEHjrcIK4lDLsUVGMRUSQ/NBm
         HNwjrmu68KnbYuqncw0MOASUyx7iFC14KdOxlF+Kz5eMvs/Jbc+Z3NmV6UAzmKQVKQVB
         AFt5q/rDUlf7ObZEPKVqqzqEo+5dKbaKsX+mQnh50rS3M9YaWwj9axS+SqbFuwpy6PA+
         xvuNOeWDASw6jqAVZJnD/pVHtQhwNYrqPGg/L5L6dWk6ZLX6hec/96JQshXZ7eHDHQVb
         91ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        fh=M+jz/rfUNe7vlzmyTLc1uM+znTfAf9GMHyYCbnpp+48=;
        b=hDihTGRdi3a+Ft2trYwDHkEpOyR43S5v2bKPf/s0omqTK6teTL62JXx5L48PDPd7Cj
         eDgn4alG3fI2jTLYozqCQo9zfirPahT+a/ROyOEhlxvVNqVuP+1aZfr0DSMNx51koXF3
         EnL1hNExjpJHBAu6Lb1VrY5767C5XsuUXsq72XtEzbx8w5Kw54QsUO/9F9YPg2JjMWWS
         Ds2rE1rgnWlul4JkzVr1TU8NBqK0z0uAf+2/ZWupGg/MsDMC9kSRMda42BLQZxixuVhv
         VxvTkjYjEJpklqQ9gmiwZeogFH6GlfiHatSxJzZhE+5v89FoPw7nWR8MZisSBUw9+IpT
         6pLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771618891; x=1772223691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=RLTkCWD9mu/3J/1dDmvY1dpr/RTAbCClo782yiD1BPnLMFRPLzgxKYB79DY9EqVGL3
         j3RZ6u0lkc6e8BUvz59Nt/OvNCsFUUs6E3oVq/2MDxyH5h4VOWG8eSrpqVWBg8lvmLkT
         8c/xdMwo88q/85wUS2O8LnWidzb6iIoR2VOrqvQvq+d5du2GUMtT4YEo5leCE1c+K8IK
         7NMm+hFMqTCy01tB9/VWSQavhm6o1p7CPtQwmPJhHfWlOFjRErloVDYLBctt5iL4e7hZ
         2GaPxeSCV/j5R0vpOiPrSAriWw+m3IgJsvPvmuP+KaHDpe5dTMazzv/Dy4tP0S835ZSh
         H4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771618891; x=1772223691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=EAM3H7r03W10bgJhhm4zk1fkbDH/2or6bkpmQUD4Up2bivqhDsfuHyVJWC8Vhkk7co
         RT9P7+m7sQlTzNsurz45qNFTIBKqa+z3cPZqjQzmwnvYh+yB14z7iyum+dUIVEByo40B
         2M0rvDh/hG3SQK0LXuGfQENswroG2n7xciL2zE2eLqzCCCzbtFAhSGQ7wh6VCBPMc1wD
         nL8Gv1JcTggs/zHL1nMPGDCAMwN1E5SKUFNJYh+1KBAu4emiVBsiLvgV6CM/U7JBC5hW
         +jqoUjpyq3YE02nSiMuiFY4BMPYLDQ5oUnSFQKiKzHKmw2BgKIW9mWuQcxKpgMnTbxSY
         PRmg==
X-Forwarded-Encrypted: i=1; AJvYcCXZhFTNsQx7pNdqXPADsU5jD+TRWEV9T8IwLkvwW19qkxI2qPAMYSQyLmacJ009iROLroW1kqwy1dvts1MomJGT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv0p5RNODRBIapzKMOHuuuFuXFFl/+TUeE/u2MEmyqEk3ats6R
	80D5+cZncy40xD0icXmXUOa4HYxIzftOyyjvkEKrvZjlC1Cw6L7M6tKwYVL1gqZy04srjbfqY/q
	n8nq96Y8GvBq5nDBlhuExyN7T/9NbA7ujEIXOJZ3XeA==
X-Gm-Gg: AZuq6aKM4m22lXmuj4Y+tIXczTd8zlFTuVsULOCG3gml1+Ps6eIzrAFi7vnT+4s4Vci
	vMXgTyJp+vWABe5g6Fe0fFzaQI8oHyonWcJSauWQjWOw0LQrC62QXJImhiIpS7rH/mOgSAyzLn9
	UtwcPdaRkPr+hFOmnZmDGGOMxeOWj59WpPJzqXZ/f8lWKzFmTZU62rM08YoyhAym8VJ4yL8djNF
	Fxi4WZ7o3Kx/sfBgYPviMDDKi1VrpFQI5yOcKPRoZ2xEIfZHsKPqpOuLN40S6UvjDYza2yYk/Te
	sr+hQl/IJ0PoXzZJgSuOM0vla675jy+3yO+6oMl2Og==
X-Received: by 2002:a05:6402:3547:b0:64b:83cb:d943 with SMTP id
 4fb4d7f45d1cf-65ea4ebf346mr552702a12.6.1771618890856; Fri, 20 Feb 2026
 12:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20260212213656.662437-1-shenwei.wang@nxp.com> <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com> <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com> <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 20 Feb 2026 13:21:19 -0700
X-Gm-Features: AaiRm50Kkz1w5MRtvgIyG-wO2YfHNIXg4Tb2fsX628-LWgxPRUtWFjuasLWIuqk
Message-ID: <CANLsYkx0Wubx0FiV8ypEnHcstXc2shfEc+87Jn_p=RDe8ib1xg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_122133_602816_17A31FBE 
X-CRM114-Status: GOOD (  20.77  )
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

On Fri, 20 Feb 2026 at 11:57, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Friday, February 20, 2026 11:45 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Co=
rbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Anderss=
on
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; F=
rank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > > If there are concerns about specific design elements within the
> > > driver, I=E2=80=99m happy to address those, but redesigning the hardw=
are/firmware
> > interface is not something this series can solve.
> >
> > Then i think you are limited to using the out of tree driver.
> >
>
> Thanks for the feedback.
>
> To clarify: is Linux moving toward supporting only fully open hardware pl=
atforms? I=E2=80=99m
> not aware of any rule that prevents a company from upstreaming a driver t=
hat implements
> support for an existing hardware/firmware interface.
>
> Given that, I=E2=80=99d like to hear from the GPIO subsystem maintainers =
=E2=80=94 @Linus Walleij and
> @Bartosz Golaszewski =E2=80=94 on whether a driver that works with the cu=
rrent hardware/firmware
> design could still be acceptable for upstream inclusion. My understanding=
 is that upstream
> generally supports existing, real-world hardware as long as the driver me=
ets subsystem standards.
>

The HW can't be changed but firmware can.  It is not realistic to
think upstream can accommodate all the quirks happening in downstream
trees - this approach simply doesn't scale.

As if I wasn't clear enough already (along with many others), the
current implementation will not be merged upstream for reasons that
have been amply discussed.  You either comply with the comments we
provided or use the existing out of tree driver.

> Regards,
> Shenwei
>
> > Sorry.
> >
> >         Andrew


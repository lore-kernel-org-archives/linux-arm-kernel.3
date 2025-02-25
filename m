Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C063C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyOopy8tN2qVORYzVG5T+W7YiTWMkF64OU8YybIupHw=; b=FoO9JGQeKUk8W5Tf+sC1t5n5/t
	kLIBkxDuci5L+H2OLugjQ8tZtVVWbRLzJ//sfkcRm3JuEX2HXkWGVGiMoX1asbHNkb6aJeSRz4O2d
	r3KR20LUsh1KA8+cJv9PRKgWGyIHmZrxOZ96q2PETHXJ907T1L/YqoM/QXuIZw8fBJQWbWl6qLU4u
	FkXHeBQSYTpT29Z6/3L1K2q/rBw2ohQsqbJ7A8VocfSCyxiw0Vz31R6E2xJzC3f//CGz32g3G78Jq
	hIMBXn5c3RXYepAFx0xOIWORPS2sV7Oj36XNPnMHTYHzfWNjpZOc/dyHBmCCEbheY8AxuaejX79Pm
	XFQDXNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxx5-00000000Fhb-32XB;
	Tue, 25 Feb 2025 16:38:35 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmv41-0000000HOBc-1rJS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 13:33:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so9019027a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 05:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490412; x=1741095212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyOopy8tN2qVORYzVG5T+W7YiTWMkF64OU8YybIupHw=;
        b=F4nSaTKDeHNj0mgW3xY6vr+dFCb7J3Cr9vVIXmkQZWP+nzOK44y44f//rE8Zr4h/VR
         CAHPnhxi453faCRf4L0fSCXifzTpPwwg3CYnzzm5IV0qA9yQdzELRr+eOrAWpApN45gI
         A4i5KsNAeWUpCfkKaUmfFVVLQDEAPo1AS8wrj3MOj0mislWW9URQS97ut2w8GUA9iA5v
         q4GZYHlOIkrcmMGG/3/ssQHnQUKKHmWgnV8KEd3ipbuKd678u1cGVzprAaAq1rgnrOmv
         xvk5o7eiwnlovS0Ri5rAtVjjE8//gnc3hYLjGNlf2j98dsrHjwbIO9GNUYzBEGXXb4HT
         2R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490412; x=1741095212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyOopy8tN2qVORYzVG5T+W7YiTWMkF64OU8YybIupHw=;
        b=pWlLsDStNb91u7CGPZVayu9rtOaVPYtPxIZKhof+W7QVdUpnzx6hbR7f0nScBzd0aP
         FpdFx8WME1rtErD5aH4dCI7pXnfK5GXS1ju6/Gboyw8oYmPs47sYZw0aqphMTBy4hdci
         YF7vSCITLLlAXn/wLDnWRYVLdGeQZJHLM3Nb+ieLVsafumJ1pN3EBGWqHi9dLBdGxtay
         iNl36htHc4IGfOW8kIB7g4UstvxFn+aT8tPfSMpd/vvZGCkIV2UjBxPxRgvk0RTY9zyK
         ZbTONW5NqEG3b/tHJmu/v/Apk7iRYHywq0Re4TAXkdpvWJz3qUsOpB2nP8CPCCwezTx0
         6zIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGUfyaxGftfaFDZ4/Hw7AKfls4ffAPQWL2RTYhjRwmCkzlo/+PRuyyUleoTaPROyR/pn2aEk56eCuvI7/LVz8k@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6A/r2MhCt3A+EKhB8WaijpR6mKdnaQe9VLtFuuYz3CDOwqxv6
	IDcZctzUE9W20Wqo3nZud6V+Eyqq7CoYq0nqE8PVagSvXLfZU8LD7J+3LV0L7+BmGl0Wrxkrqp7
	+qCz1vxCH09OjDrzuXhinCoGDR6U=
X-Gm-Gg: ASbGncvq1DAA5RVnLbnPTA+nASyJ/kyPG0Ykc2HGKbX4h2gVXjfNi5PRywh6cAjWf6m
	HlJwgYLGRZ4K7kxaT2AIiYb2ypcCx+wJuUhC8bmp/po/hK9WHsdInJIZMsoop6sV2ysYnFboBzf
	lw4Qf9
X-Google-Smtp-Source: AGHT+IFumrADYMZTbshcR/jQQQzsoDviUuD373A59nqtY8JJ4DVQv9+RznKhnhkMPzfDVQnWCYD8iJq2w2f2vqoh2zk=
X-Received: by 2002:a17:90b:544f:b0:2f9:cf97:56ac with SMTP id
 98e67ed59e1d1-2fe68a2e72dmr6336504a91.0.1740490412464; Tue, 25 Feb 2025
 05:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
 <20250225102005.408773-2-daniel.baluta@nxp.com> <f4466c280bfef24be5d998299df450aa02ff2973.camel@pengutronix.de>
In-Reply-To: <f4466c280bfef24be5d998299df450aa02ff2973.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Feb 2025 15:35:08 +0200
X-Gm-Features: AWEUYZkXV-v2aTP1kBRTGqqig6c6PuH1hUgPphPti5oZf8llKAM919qLE-PCQwU
Message-ID: <CAEnQRZDrC4KEmOBM+LupCRSvNRxpBO0qnPaqG7HBRNeNOzO9sQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: audiomix: Add reset ids for
 EARC and DSP
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	shawnguo@kernel.org, mathieu.poirier@linaro.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_053333_490195_560A54E4 
X-CRM114-Status: GOOD (  18.56  )
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

On Tue, Feb 25, 2025 at 3:18=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Di, 2025-02-25 at 12:19 +0200, Daniel Baluta wrote:
> > Add reset ids used for EARC and DSP on i.MX8MP platform.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  include/dt-bindings/reset/imx8mp-reset-audiomix.h | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h
> >
> > diff --git a/include/dt-bindings/reset/imx8mp-reset-audiomix.h b/includ=
e/dt-bindings/reset/imx8mp-reset-audiomix.h
> > new file mode 100644
> > index 000000000000..3349bf311764
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/imx8mp-reset-audiomix.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#ifndef DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
> > +#define DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
> > +
> > +#define IMX8MP_AUDIOMIX_EARC         0
> > +#define IMX8MP_AUDIOMIX_EARC_PHY     1
> > +#define IMX8MP_AUDIOMIX_DSP          2
>
> How about calling these IMX8MP_AUDIOMIX_EARC_RESET,
> IMX8MP_AUDIOMIX_EARC_PHY_RESET, and IMX8MP_AUDIOMIX_DSP_STALL instead?

That's fine with me, makes more sense.

Will make the change in v4. Will wait for a while for more comments.

Thanks Philipp!


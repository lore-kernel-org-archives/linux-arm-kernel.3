Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202A7C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 16:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udtwR14oubKebFu5rW6k4e0weoZf4m2R815HfEK738g=; b=n887vszpb6QYl7Zd+ge+HeHUOQ
	5nxyd2PvfQq0QjJ+iZFN1EuwVArLXxei+YtHQXyF3C64sL+Ia6YM18GRpEXP5JEnU1IMfQjTX2bAw
	igMxxTO5j4NYUxUfFR+h+9eEBQBn25xIF3jUIheHJ01W4w11rTGdwQggPCAgoYVI/Ocpu0JLQ8BNH
	9t4Z1PZXzYcV5F+1j9aOB7nJUwrK7CBmIjt9RvH/hAKi/BeJhfn1aIPFjnw/ANmD44mXtqQc0Nkmc
	KxDuaya2HfvLheQzsWDoY8+uua1h06MHj71ca6wTfwfLY4460ro2gQS1AjCIHEz1VrdGgsWW/txal
	UMIivZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4N8q-00000002rad-2EPW;
	Mon, 14 Apr 2025 16:58:40 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4N6w-00000002rGT-3cxY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 16:56:44 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-523eb86b31aso1988668e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744649802; x=1745254602; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udtwR14oubKebFu5rW6k4e0weoZf4m2R815HfEK738g=;
        b=gZvJQDFhJUQ0CnU2i5scSdEQVc1iD2K5U68pRs+pv3PWEQrhqeiMBwqmZ3EDsm0+Dx
         bcJoLtnwej5yRUC6VYu8wiRz4LSW3zT64pPUnqXV9DlF2DQrhECdAbVAVjPlSpAWo3Mn
         Pv86VBSQjFi1p4COFW38QsAPHtTRdaaKKBJF62DNf3hOo8y8fv7gMx/8PPn/2NlvW3lF
         8i3Co8owVO+qYRjVemq4MnVKiweaNin5GeNz52VKa96X6N6k3tpjv3Z5EwZrCi0tGDBy
         I5dhSMEL4PeaneCcoCGsyKQZUGmglYOR3sdAHFEerpM0trwq8nD9ufbJapv79v9zvn1y
         aFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744649802; x=1745254602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udtwR14oubKebFu5rW6k4e0weoZf4m2R815HfEK738g=;
        b=aJUKsYdOLguPb4mO7AL3Rgp2Bh23qFfa2YYfhAiZ1mu1MECplFVBs+CCsh/phUI9GJ
         Ij1i5XBjVSADUiSrPGYrJYZbTdQIYmRdAQnpHd7CMxTtuNZiEFuMlDtsLgPUFAyAWFZS
         le8EWZ7byEnFiO5VvI+ROSTTB4Crln4Ue5QDVfzW+mpu45bmd/OdCxp+VRXcIM9LtS6b
         EURFZCgZerTlsnERbaNl4Ah4whPL8PvRNESo1eVZyNLqBGe0sxFWCV0QIpxpXpkVBEaL
         5/Cb+mFRG0I/7N+deCsbQYJWsBJqhpRpXO0CpRx8z5AYCByv543hBnIYpWt+tUFYeFEg
         p7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVzWxkrwFlQ+cCdeR/PwexmXGt9QqxsMO68IO32Cx3bpn9UxCHfsMC2+8BxFH3jCb7dKH92Qq9y9jKcC8S70AWJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyKcueoMz5XRBwOPzd9x3tyiA6ZFEJTTBQKMXPe2HQH7Dv3qIZV
	0RhI7rcJKFpHirFA38AfagaD6pyiQd0Yv4JkBWzGgfy0JJuahSqVqpbUEJ4JXv+ewUuodp6+ddw
	Dn7pO5nXapUhNFPeCrPvs6e5jrtc=
X-Gm-Gg: ASbGncuWK54d52WFFMt4Tvsq/xM1SQ67Ia5mD84EXdvVRdqSs5NoyZyDrsjx9gcd2Me
	JjXoVqBEuxES0XIkkwkzWcca6kcwZs9f0fM+iHyQljf1Tv62QZA2qkcOE2cd4l/4Xnf04DDRMye
	ZWD+VuZVvfdaNfHSyMXFZDy8QfBO7Qh8byJj8tUqtszRE/ClUZ8CvGWw==
X-Google-Smtp-Source: AGHT+IFQpsz/ji8MKcAuYh+qFnh6pm7Cs4klNHHbzk4kp5149hgyDeoWHHM5lEKz3qpRzffoQj33KxW8IfZk7jM+Cro=
X-Received: by 2002:a05:6122:209f:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-527c35ae10cmr8117351e0c.9.1744649801573; Mon, 14 Apr 2025
 09:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <f20e6589-37d9-458b-af82-92fb1ed0db18@bp.renesas.com>
In-Reply-To: <f20e6589-37d9-458b-af82-92fb1ed0db18@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 17:56:15 +0100
X-Gm-Features: ATxdqUHsvC58AXJcSX9DHfg067ybVtkBeQg9WB3LjBGtUZ7gtnbYUDxCu53XU_M
Message-ID: <CA+V-a8uho8xKikEmSQeDM4Qe5y0jaZfYE3vNc8qehb_NLHGJ6g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_095642_904682_4D399056 
X-CRM114-Status: GOOD (  20.08  )
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

Hi Paul,

On Mon, Apr 14, 2025 at 2:13=E2=80=AFPM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
>
> Hi Prabhakar,
>
> On 07/04/2025 13:03, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P=
)
> > SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> [snip]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c =
b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > new file mode 100644
> > index 000000000000..a0f7cacea810
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > @@ -0,0 +1,165 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
> > + *
> > + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> > + *
> > + *                         Rx / Tx
> > + *   -------+------------- on / off -------
> > + *          |
> > + *          |            Rx-180 / Tx-180
> > + *          +---- not ---- on / off -------
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corporation
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +
> > +#include "dwmac4.h"
>
> I'm looking at this while working on RZ/T2H Ethernet support, clangd
> says inclusion of dwmac4.h is not needed here and compilation succeeds
> with the include removed.
>
Agreed, I will drop this.

Cheers,
Prabhakar


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38ECE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGyWve3qbblUYqOCxPmmeOlnAyP7jD3mNyNAuZHZkX8=; b=DxuYhKa/Ws8pr3IvvDoW2xKJxu
	1lnSomWko5humeAKii4FfQboLfuwlpr7mQwZsdI0GBFEU+OpgHP/Pw5d62YSqzUgAznTmVSsmXyTq
	8ExdFm0QiwtrYJ/uDjiHwJ+TA2UnmP/cX8xEx53tvzdMnSDvJTpEJPowtbOKLxW/jIjAauogc/X2j
	rfVVPeZBpTMjRZUYjo69z0ih9NGRFAcQj+wz7M15ggDxdhSOAotW2AM5aWaRE+PBAcEvRX9NR5roK
	8rEk6YKvVx4mn+6x3+qqCOV2vudnTGoyLLX7z/VgoPAiUaJ/fjt01SeFbKswr47iGdeMyHXcQgC0v
	lLz791Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3tb-0000000Bvzw-3U9n;
	Tue, 24 Dec 2024 12:20:19 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3sQ-0000000BvtK-1vW6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 12:19:08 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e537d9e3d75so4535147276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 04:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735042745; x=1735647545; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGyWve3qbblUYqOCxPmmeOlnAyP7jD3mNyNAuZHZkX8=;
        b=j50DdWApTCPpiw7DmJulC1VFoR2pw53ir/acTCOfPeGLl4QU219MBnyH0ZZjVjICpp
         3ijEbJnImazN8VErI+aLagAx6ch7D1BQ1EI7j7SPDR+AiBA72cJ6JHwBGjgGMXqdv7vx
         JrKPPHRv6vz0Jlcy2R9Fv12PwVKi7J3fHW2NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735042745; x=1735647545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGyWve3qbblUYqOCxPmmeOlnAyP7jD3mNyNAuZHZkX8=;
        b=a2OagTkfgrU+D8s2nOsp+658MGQTt220Mjv3HKpSc3KGWXVHCgYFQUEj6VjWsNFsow
         6DU7C7sF8nOJcjOrjYjmbunUpkJALtcrHx3FFP85po6coVvHb7gXCgR6UoYtvudzkMN2
         XoVlpT1eBEhdkUT3DRoLNc5VmsA3UsyEv1j984JW6uTFiHUkvpLBKHlMV8n7oiLtrsV4
         3awp36/JpRepxZ9DdkrRWdLnVj0A9xrhEd6MkZvRNysa0jFH941EPcoKOxHcTrfk0hNP
         Q9mzNc1/IjMCbuXDPwpEP6flxWdqeAgYQ1dADx8FXXhXcU0X77JQN94V3lbbSl+Yin1q
         EKhA==
X-Forwarded-Encrypted: i=1; AJvYcCUlXiSzkY89wk+ZMBTCgJZSWpdcKkaJwbte4H+0T9vAhiYhpsCwj5783mtaPMy1Ufr9idqMlj+UPDyQevt19/l0@lists.infradead.org
X-Gm-Message-State: AOJu0YxVjOU0WQOzqTAxYmW1y/R6X3k9r+UBZa2Uj1P+S//a4Cq63UCc
	LMuCQfvhV1cVfdFZJ37vFHFThAosea/AF7SdNBtZN5rXbOM0WJSUh/ShUCkGN/Za1oOjhK2b3vu
	R3+8xyzflWgWZA0UXp7bcJE+4aYYOoTpecKcOxA==
X-Gm-Gg: ASbGncsNevZhuRV/D6/GmA82a8SHnYvVyzLpwKoUK0TMtcnFMuaYPa45bRUJlZurSQ1
	3TJl6LxXq/igi0DmVImDRg8uNI9ETviAgPCo=
X-Google-Smtp-Source: AGHT+IH0riz8i408V1go9BqRjnhl3rg4DSK4AgKGCx/MVPvbG6Ayq1HxKA9H10UEg0e3O98yC0fCqBHSM4WINMwLeDg=
X-Received: by 2002:a05:690c:6188:b0:6ec:b10a:22a4 with SMTP id
 00721157ae682-6f3f814987fmr118816497b3.25.1735042744731; Tue, 24 Dec 2024
 04:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-11-dario.binacchi@amarulasolutions.com> <20241224032223.GC20573@localhost.localdomain>
In-Reply-To: <20241224032223.GC20573@localhost.localdomain>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 24 Dec 2024 13:18:54 +0100
Message-ID: <CABGWkvrdMF-sUsHt4Af+Wn-OUgwbjpOpUq-yzMfOYo334_BTjA@mail.gmail.com>
Subject: Re: [PATCH v6 10/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_041907_362607_6CB92A1A 
X-CRM114-Status: GOOD (  20.50  )
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

Hi Peng,

On Tue, Dec 24, 2024 at 3:17=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Sun, Dec 22, 2024 at 06:04:25PM +0100, Dario Binacchi wrote:
> >Get the hw of a clock registered by the anatop module. This function is
> >preparatory for future developments.
> >
> >Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> >---
> >
> >(no changes since v5)
> >
> >Changes in v5:
> >- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors
> >
> >Changes in v4:
> >- New
> >
> > drivers/clk/imx/clk.c | 28 ++++++++++++++++++++++++++++
> > drivers/clk/imx/clk.h |  7 +++++++
> > 2 files changed, 35 insertions(+)
> >
> >diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> >index df83bd939492..9a21f233e105 100644
> >--- a/drivers/clk/imx/clk.c
> >+++ b/drivers/clk/imx/clk.c
> >@@ -128,6 +128,34 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device=
_node *np, const char *name)
> > }
> > EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
> >
> >+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MM_MODULE) || =
\
> >+      defined(CONFIG_CLK_IMX8MN) || defined(CONFIG_CLK_IMX8MN_MODULE) |=
| \
> >+      defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MP_MODULE) |=
| \
> >+      defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
>
> drop the guarding macros, then this could be reused by i.MX9.
>
> >+struct clk_hw *imx8m_anatop_get_clk_hw(int id)
>
> how about change to
> struct clk_hw *imx_anatop_get_clk_hw(int id, struct device_node *np)?

I designed this function so that the caller, i.e., the CCM driver,
would no longer need to
reference the anatop compatible in any way, but I agree with you that
it would be better
 to add the np parameter. Do you think it would then make sense to add
a phandle to the
 anatop node in the clk node?

clk: clock-controller@30380000 {
    compatible =3D "fsl,imx8mn-ccm";
    ...
    fsl,anatop =3D <&anatop>
}

So that we can call
anatop_np =3D of_parse_phandle(np, "fsl,anatop", 0);
instead of
anatop_np =3D of_find_compatible_node(NULL, NULL, "fsl,imx8mn-anatop");
This would require an additional patch to
Documentation/devicetree/bindings/clock/imx8m-clock.yaml,
but it would make the CCM driver code more generic.

What do you think? I=E2=80=99m waiting for your response before sending ver=
sion 7.

Thanks and regards,
Dario





>
> >+{
> >+#if defined(CONFIG_CLK_IMX8MQ) || defined(CONFIG_CLK_IMX8MQ_MODULE)
> >+      const char *compatible =3D "fsl,imx8mq-anatop";
> >+#else
> >+      const char *compatible =3D "fsl,imx8mm-anatop";
> >+#endif
> >+      struct device_node *np;
> >+      struct of_phandle_args args;
> >+      struct clk_hw *hw;
> >+
> >+      np =3D of_find_compatible_node(NULL, NULL, compatible);
>
> Then no need to find the compatible for every function call.
>
> >+      args.np =3D np;
> >+      args.args_count =3D 1;
> >+      args.args[0] =3D id;
> >+      of_node_put(np);
> >+
>
> Thanks,
> Peng



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com


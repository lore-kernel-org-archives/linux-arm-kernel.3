Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9581CC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=el7iGP7OFYeR4PWe14A1/v42PBL2cJsaz3V9X1queIk=; b=U7Iq3VGcbU7fhwSi8IARTE3dzQ
	mENQi0cvUfnQWPCN3NHKZDvNcCPi6n3tOyMQQEoR1J3wZ/e3jdmQQHKK94EwReb0mPhS/oIcTA/1Z
	et/1QTG0BSmDQz0JjQiTn45tUIsGwDX2K7bnQOQG7olwBkkPLfGZB8Uvmiwf6l97TeSt29tvYSe3x
	+dVSLJwLg1lAp5TtLnp4RLDb+NzlAOusT6MtFNrNFRZjQokJ4LDEiADkx8Ejo1Gz5TJy01zBaWkkC
	Gq2qdIbC7LK4r7pSMvXNi64qM65K8P2ZPBnEcQ9RD8VBAcqChj5AxYs1nN+PTmKOlQ5Gjj/Y+eH/B
	bTEpAVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbflc-0000000GPrC-3pL2;
	Sat, 25 Jan 2025 13:00:04 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbfkI-0000000GPl9-43bU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 12:58:44 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e573136107bso5066430276.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737809921; x=1738414721; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=el7iGP7OFYeR4PWe14A1/v42PBL2cJsaz3V9X1queIk=;
        b=lCudljmMVuO5+tnrL+MpafFkka3tkMVCiZm9/zqObUBijqvcy2CzscLpPZsx2TiDvJ
         2McT/UZt9tnJZzaW8DM829vRukScbr3pWxCdRpcmUJbtQ0g4VtOmbUyaZdDu0FgF5Dj9
         DVs18JeCcMv1uJo87zbXZ0i8IUrVpd89vD5F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809921; x=1738414721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=el7iGP7OFYeR4PWe14A1/v42PBL2cJsaz3V9X1queIk=;
        b=tOKkd+HjlbORXg2HhtxqgvpNWA86PI0FFhsZoEKhX+g20nsWkz+EEcJE/ntm9kv1la
         lrkkXQN9CVa7GHok9cYBwvvG3CLuP9yTwpFS+AMQa/67M3d8hKM42TZ0zjx5uIjOos6T
         KEXJHTgASdUxmBYJfcnYSX5gZOeMrZlDAyTHMlvwMwQx2kt8Py0NLjepwguZV/zk2nh+
         ot0LOLe19jgDH+1mkkoqjxubTG1iMruoW6XQbDvNbHrfG1ucVnFyNzG9VPAG8aEDpyDu
         3YxKaKz9zLgRLdxugXnANAHIU8BHfxr8VVu5ux/eVuSq0EwRcIrd6GXQLRABlpLy9Z1J
         V02g==
X-Forwarded-Encrypted: i=1; AJvYcCXNGyqFEHWQ6pK4ICagDaesigCkdaO86wgP64c87xlgn+aUyaNaB5WEP7F+Ci0rGqfBIRJe37uiIquJ6at2GD72@lists.infradead.org
X-Gm-Message-State: AOJu0YzJGsBwsnckkEVVC+8VAypifbMrb3QrvNYyisWYads6fyDAvJiz
	xGsHp6rwZ97avKAFnb5lAS0Ok/OI957MkjMaikKEYWM+agzslqd7oqNhTtuFKRN9JKozfIRpFSj
	9vgP1t0beApGN2037JIKNFTEG7F3NLUk+IkHj3A==
X-Gm-Gg: ASbGncv0Fovwfw3XtmWZfkQ+3lrodPXFq6az18ajsFX6GJ2vBTff/mG72LyKgNf294Q
	VFQPipqRkC9lBR1jvAHvI8ZKVREa5VN66zM6DrOElrw/pkWzYKJKYmlfPcYqR
X-Google-Smtp-Source: AGHT+IEEKpiikrUJ57qyfcCRA/e0fon58biS6P+zSfMgH8jo4xDtyN7iJdHR7Or74nDGVOsMp3enzXojTs8OVWanswA=
X-Received: by 2002:a25:ae54:0:b0:e57:cc1e:2ab4 with SMTP id
 3f1490d57ef6-e57cc1e2c6cmr17264809276.28.1737809921258; Sat, 25 Jan 2025
 04:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
In-Reply-To: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 25 Jan 2025 13:58:30 +0100
X-Gm-Features: AWEUYZnNxDwCk6NAMaoEBBJdy6_TRGTFA2dlWGHDjrD3fTX9PYVK1omwdpabvIA
Message-ID: <CABGWkvpj2bYyqiOp4D9Ss2aWOnoR7BxqDOGpXdRusq=aWu9BEA@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: Support spread spectrum and use it in clk-scmi
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_045843_022050_977532A9 
X-CRM114-Status: GOOD (  19.74  )
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

On Fri, Jan 24, 2025 at 2:19=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> - Introduce clk_set_spread_spectrum to set the parameters for enabling
>   spread spectrum of a clock.
> - Parse 'assigned-clock-sscs' and configure it by default before using th=
e
>   clock. The pull request for this property is at [1]
>   This property is parsed before parsing clock rate.
>
> - Enable this feature for clk-scmi on i.MX95.
>   This may not the best, since checking machine compatibles.
>   I am thinking to provide an API scmi_get_vendor_info, then driver
>   could use it for OEM stuff, such as
>   if (scmi_get_vendor_info returns NXP_IMX)
>       ops->set_spread_spectrum =3D scmi_clk_set_spread_spectrum_imx;
>

I wonder if your solution is truly generic or merely a generalization
of your use case, which seems significantly simpler compared to what
happens on the i.MX8M platform, as discussed in thread
https://lore.kernel.org/lkml/PAXPR04MB8459537D7D2A49221D0E890D88E32@PAXPR04=
MB8459.eurprd04.prod.outlook.com/,
or on the STM32F platform, where parameters are not written directly
to registers but are instead used in calculations involving the
parent_rate and the PLL divider, for example.

I am the author of the patches that introduced spread spectrum
management for the AM33x and STM32Fx platforms, as well as the
series, still pending acceptance, for the i.MX8M.
From my perspective, this functionality varies significantly
from platform to platform, with key differences that must be
considered.

Thanks and regards,
Dario

> [1] https://github.com/devicetree-org/dt-schema/pull/154
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (3):
>       clk: Introduce clk_set_spread_spectrum
>       clk: conf: Support assigned-clock-sscs
>       clk: scmi: Support spread spectrum
>
>  drivers/clk/clk-conf.c        | 68 +++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/clk-scmi.c        | 37 +++++++++++++++++++++++
>  drivers/clk/clk.c             | 39 +++++++++++++++++++++++++
>  include/linux/clk-provider.h  | 22 ++++++++++++++
>  include/linux/clk.h           | 22 ++++++++++++++
>  include/linux/scmi_protocol.h |  5 ++++
>  6 files changed, 193 insertions(+)
> ---
> base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
> change-id: 20250124-clk-ssc-fccd4f60d7e5
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>


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


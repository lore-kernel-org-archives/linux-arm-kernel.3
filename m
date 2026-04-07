Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAB5FB5179
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 06:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOPSEw3R1gGvjN/MfDinYnvmZ1hMaPvnabE6NrRw3X4=; b=cretvxoEyei1MEhUh5iKs3fWbq
	affYoiOQ+wfMqUd4UdGnk3mJM2vDxmwFKZOOhi5AQa7Fug1NylaTQMNXJEn2+xTgjyqpKaXSX1ef4
	50pGFVKcichzzXMbEnSxMMg7IgTeojvbQWD3G3bwTyD5Vb1zB5lqfuB+ipgPEtPbW9cL7zTb8kssD
	jxQ8pV7aiwh54mxGrHEEqUJdcDBRF9v/b/k2US6LFEmg5b9aPoUZIBScEz+9Kwbgu8BpZbrn+ShJ9
	df8R3HY0dWYV6zxEtNyOCiJnyBtUQF7mEcvMHhjtQPQKktT+H/VMD3K5sJO6ZhofKYxRD3PwDIztZ
	6AYLCWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA09I-000000060gk-3wmm;
	Tue, 07 Apr 2026 06:42:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA09G-000000060gO-2CCD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 06:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75BD443F37
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 06:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D5BC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Apr 2026 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544173;
	bh=qDAfbiHSnbyMDi0ClqOiUyToXUmimQ+jOZYqbUEb90Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N5Z0GGV7cAApHOSLXuu6iFuu3DGA/kTNUs8eL0zAKYCyKEBcLs2pHv/IkpKf6KpBr
	 SKWngl5zGZkVYpSSn7jC7gdeUlqNaIMm3gBVbUdwAIOCvCD2A/g5RGfDPa12VXG/vX
	 qMplnLINusUn+MRtdkmIllfvsR5Cq/8sStkNDX0TjHNYsBG6AI7+2opcrvBKYeNwlY
	 kRhTMghwIM/wC2tjrE6cjof3iwwWOcUY+dsgE3DAZqotA0a1o6cBqJw2qGWY4ijFCQ
	 VCTNZlDe36kFlkX01SlsoMHw3rZKyEkx2oOwe+tr7ItfcGW/ub47JP56iERx83NQpO
	 Fd8Dh4uFfik7A==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79ab3e26cceso40257257b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 23:42:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZzVgEjWTwdvrwlnidOA3DMb3YCFCR3NkMu3A8rEyZKqW/V6moVbmAZpZ9UIVzo/WuI87deVzdGB/MYij6q394@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2TOHOdQlSkvir2R5JPCyYHC9t8B9jK37hqEu1qTA2YEAhvYtF
	F4FMT8f02PKDqYYq0lHdyPhigEYi5PwpjQxuMe0SaROhvdPZEhP0R1rYx+SjFWi14Pl0ZnlNjmN
	/Vm+vSYO3Z/NmK2xgWWcKmhYrtlFY1/c=
X-Received: by 2002:a05:690c:39b:b0:79c:c51c:7f41 with SMTP id
 00721157ae682-7a4d556e135mr152089327b3.29.1775544172742; Mon, 06 Apr 2026
 23:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
In-Reply-To: <20260327-pinctrl-mux-v5-0-d4aec9d62c62@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 08:42:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLmoHiJWV3J8f3TtpmQWLpUFD24icQEv2cbO3+x7775zxw@mail.gmail.com>
X-Gm-Features: AQROBzBpYwAeEU57mNfPmCh5f-XPkak3_u6jmK4j3TgdDlcVW1C-tWvRlAIpdbI
Message-ID: <CAD++jLmoHiJWV3J8f3TtpmQWLpUFD24icQEv2cbO3+x7775zxw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>, Peter Rosin <peda@axentia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_234254_600642_BE6D7161 
X-CRM114-Status: GOOD (  11.65  )
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

Hi Frank,

OK let's apply it!

On Fri, Mar 27, 2026 at 10:34=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

>       mux: add devm_mux_control_get_from_np() to get mux from child node

Didn't get an ACK from the mux maintainer for this but this has been going
on for long now so I applied it.

Peter: protest if you don't like this and I will back it out.

>       dt-bindings: pinctrl: Add generic pinctrl for board-level mux chips
>       pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins=
_function_dt_node_to_map()
>       pinctrl: add optional .release_mux() callback
>       pinctrl: add generic board-level pinctrl driver using mux framework

Those applied.

>       arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
>       arm64: dts: imx8mp-evk: add flexcan2 overlay file

Please funnel these through the SoC tree!

Yours,
Linus Walleij


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25451CCF2F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHtPJU0DUMKO1F2sqGZCMsKmvXgpAwApi+pqfSny0WY=; b=LQJ1kKQfGMPcmbteG5NSsuZ/a7
	1AEPBoGEwU+0XdSRfTJcRSAetG+bhDiVv8JVFMbjm7j9GQ91swFKLZ5UW39+XTbykodynmm/K8S2f
	iUy9jEQJ1lZvKZx7NEnlj9gKCLUoZVZKM03oYABzdfuKo78zcfBrsrDlHDA30m7Yz3TYkRNaTq/z0
	08ngt6PsmTHA7c0w6tWBCSCuiB1YXzZw96QmWrimPpZIjFTYqtXIggX/kYPi5oVkFF9a48kpTObVn
	UP5R3IsBVOY75/sgsly8UvB3KIhtELD7mzj2HE5ARs6M1JoxG017krhLsBkke6nUiPWHeVS9fk8HB
	J711cnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhobb-000000022We-1DTA;
	Mon, 19 Jan 2026 12:43:41 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhobV-000000022Sz-4BzY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:43:35 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-12332910300so5540788c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768826613; x=1769431413; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHtPJU0DUMKO1F2sqGZCMsKmvXgpAwApi+pqfSny0WY=;
        b=TIGcRJSCqTRp1kE8RfYAwh21MXw25KGYRS5PbipcFaN5FSB2FYcHx/uQWeTaSz+zhG
         MEyfX4TDxdzDC3dtDu3Z0qu0ycNbC91Ap4E8Ju7lH/yWi3Q6iD+HTVjlV6URK8mU3Fer
         bm+KaHYVpYabigSNHZNf3ueobChgYntaiolHgAMc3r653oxoZwkk4dZiwq6/E/qtYhgq
         COouwLTL6Q3ba80X+DlMH154TS8ywt38hdu0SPMfsoSoNhiFiHdNRviaxfjgY7SsNYFB
         0DYtoRKzZQfu2x87/cB6lRdp5pxheX7EAfETaqbJqldAfoIOu09VQ0zaAf2bgFmxGfvh
         +ndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826613; x=1769431413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OHtPJU0DUMKO1F2sqGZCMsKmvXgpAwApi+pqfSny0WY=;
        b=E6Ug2a+4+6QvMd8f6nKwIa0o4K20LR/EBzHammti3yKLWlaUWiMWgVx6iu3AR+OcWm
         MWweGXq9hGWH9aTBam6e7H97rs+ggg7YAcJmzc5nLgM4aFzRvcZPZOV2zCA5bkyFnCiO
         8TXqgciQae4nQ+Pqlpz6il8AqxEN+fx/Z5sV7mK5aR9h4doZdYgC4BszAV6qRxPEblv3
         TlRxJyvYGQeeNfavNuEPI40stRYwbOX9mYSDcxUxT/HDotd7bENNpcf7wp+aUc5KtbQa
         Q/YvVzqHuW2U4JwrK9EWQw7VeWNSLRW7tYD/dZpucHjdpud+1kRGogHGHME8U0BhJARH
         EKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyf/wBu+uUyb5Np3OyTfC+X4l9D3hAeXX1OxX7pTB7YFDT5ukSdcI2nwmrUtRe96rOKxlXFZzXwltp533Kd1PT@lists.infradead.org
X-Gm-Message-State: AOJu0Yze0OxpuJ6omLgxuR9MgSYX8z85ikrqs7mbnX135xeaC9v5lGPJ
	1AGZDb6b/61bL6G/Q3IDzax2tFqvoSrO+iz1zM8R7csUOUkd42Py+iJ6nVZZpu8hFH+KiVwRhfQ
	hpO3V4MPOAdQoj35tyLOYF3NI1H+U7ro=
X-Gm-Gg: AY/fxX72F/uLW93r7qytHyWZ0h8XYX9GIpGYuMNokOkJKZRP342RYV8HA6pehdbAuwE
	C4RA+fVjqr/zWXdRlqdztRnOynxpxOHJs7c7Ri72Xm6VrPihSdQpYLibj0vnffhNDjmUbZKAXwq
	EbVgrVPnihCGdmmMhbV0MueClMJtTtzD6lXRX3uPn3Rj6B0x5y94VnwsUDcvdu3SSoxLsc4TsfJ
	kmEK2nGjxz6iGSPVhMNYPLUmAN+npqZSCCsCa5mddHaypWXw5bzg6BBjlIOZBLWzwuVaRiP6IV4
	UU60gNPXCK7+mWY5ZHzRlreJkDY0LsrHeXTbeXaUXcqnLHZbj7pFa95+kkfySNA+60+8UBTPYfC
	r/8U8/DzAjA==
X-Received: by 2002:a05:7022:222:b0:11b:ade6:45bd with SMTP id
 a92af1059eb24-1244a6fa90amr8867693c88.8.1768826613054; Mon, 19 Jan 2026
 04:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20260119103411.50397-1-francesco@dolcini.it>
In-Reply-To: <20260119103411.50397-1-francesco@dolcini.it>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 14:46:13 +0200
X-Gm-Features: AZwV_QjtNyiBHeLdUkjbl18_ROfadpDkB4z74sf-P-WeirXN-mnvQRL6Snmf3Zw
Message-ID: <CAEnQRZA9yHGs4xodNZrYP2oto2QhOJXtiX4BFkgNM7RydkJ4YQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Fix LEDs name collision
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044334_071660_4D938593 
X-CRM114-Status: GOOD (  10.34  )
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

On Mon, Jan 19, 2026 at 12:35=E2=80=AFPM Francesco Dolcini <francesco@dolci=
ni.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Ixora boards have multiple instances of status leds, to avoid a name
> collision add the function-enumerator property.
>
> This fixes the following Linux kernel warnings:
>
>   leds-gpio leds: Led green:status renamed to green:status_1 due to name =
collision
>   leds-gpio leds: Led red:status renamed to red:status_1 due to name coll=
ision
>
> Fixes: c083131c9021 ("arm64: dts: freescale: add apalis imx8 aka quadmax =
carrier board support")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D2CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWNH5eCqyP/FjxukcloV1DRoOBCv8QarpVQi1BOYK0s=; b=JLSNupwal3gGmkOS0pRrF46yKH
	yGSHaNdMPr9r6qx2bsn1K61JHFMnpPZ9Mx+iVVW0LYgGOa6QqAE/3ssclndwnpIV1eov3gXyXU2jo
	GntX5+N1ZRP/kH3u+lFJWgpQ09osDpyBjORRNX3VxEhicxzEiAtbWG8+Xt8tULHISTMmqhDboLGMR
	YHwlMhcLE5LGbYTqnQUFP/TG24otOugkLbOSZg0+CC4JpV7CC5xNT17gkJHH40mvr/El4TulJ09VP
	Hl+c1ZiQKR9aDaq214SbFUPso7qJ1jkPxCJp9Z2sSdsh1npwS1D7Q8/TL8m+dbPCwzyew2SeKdsq7
	jsWUNV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCzv-0000000C9tz-2bnT;
	Tue, 05 Aug 2025 08:26:15 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCQh-0000000C4VD-3bsW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 07:49:53 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-31ece02ad92so4300069a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754380191; x=1754984991; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWNH5eCqyP/FjxukcloV1DRoOBCv8QarpVQi1BOYK0s=;
        b=mZpNbhpvYdl7vyjCv4XNA6wsbgG2/BrH8DNcdORTxfyokzycFZAGtsu8meo1x5ZjF1
         W6IrwqneuneeEpfWHHHmk1ykkzeAOZOhtI2W9G9zF2GcI2kIuw967CMJp/iHyWnFB0Zj
         MEdP8Oo8yF1phB2yx/fZANx60u6HSoQ3V0RxiAoK3QkO8nGz9ZxtjIINHjAEvPp5/2gf
         XiWdhBPZ+q59UVJB9IAVvnt+mR6p+bXaac4drLamwzSOWuV/6Ga5lhAndGylKCqyIRFk
         QBC4y30CU+qIIL/TlFFmxJRtGCg/AYQoqJh89WY9uRrUT0wDBGTQJs3MooBjciIx82Vx
         K9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754380191; x=1754984991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWNH5eCqyP/FjxukcloV1DRoOBCv8QarpVQi1BOYK0s=;
        b=pnHp/4xRuyJNT3OeClpjgDBmmeRkuOrJyAPQoIV6Cs0dNJNtFb6fEoWZ+7fc39xW+9
         Il7XVYOUJz5sbMOj9WyWqcY6baWM8E1kk3byi4NrJbREyyvO2H92tlbndZmorZvnG8gG
         56XGuq1+XY5Q1vyGX1B4+cE7MaSBmMqaPDdtUspcgUKla9nZD9EjkwxgW93Yb1XzhLw3
         lSHnZDv5kOYFhX7MnoLO1EGSABI5v6s0VlB28rk8pyApw41HfagkxE1Ih7YFtOdpgmRX
         3gna6tok8El/Ds8BE5+XG4a9u4ucRGSMgl1g2u5/D+lERJpxbvz1Bu5c1/w5H4ss7XN5
         YTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsLP2KYUkd2JJM2xk/bYMHklCtpUUvPRhZe4emb0WwHner4XzEY6Qecv/ybZ0naap65UNckfyzrdHFDNNv/CSn@lists.infradead.org
X-Gm-Message-State: AOJu0YzXXKrje9d+yXY7cmgxgwp6feGkBsrJml3/LtQS29c4NX1NXekq
	W+clcUNnO9XUVf3oKRjghK4Xb6h2PE3Ls4RHl5xSViWj01T76XOJs6oREluhdk9w5tgYRJ5h6HR
	IhZb6WPsejyQaXlokMoQD0Bi2DUDohWs=
X-Gm-Gg: ASbGncveOO73elyxhGcfLQLng7OlI0VMeb1O3/XXPzOxvHWViemYTkmHoHiw45WdhF0
	4gxqT74Ul8yDd6O+5ZVD4ts80rdcRIIRtxSW4gUTl0kHKRgCLM49blIjcZXFrhd2P4K0wUHDBOS
	eLpw6heaKZXiuT+v5Oh1ndso8jAu40zHm0ZN6qNeec47eU1rKGjNfWhgV5xjUoD3zIZTCWbtOeb
	KcE
X-Google-Smtp-Source: AGHT+IGzN/lG60iP8C5y42/6GZHUdwFTfQPnirMANk8NvV5b0No4/sTpu/QFLlH7OULW0Qi45yw+Mon+tegHBGVKjCQ=
X-Received: by 2002:a17:90b:3e84:b0:321:1df6:97d3 with SMTP id
 98e67ed59e1d1-3211df698c4mr12468336a91.4.1754380190738; Tue, 05 Aug 2025
 00:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com> <20250804155407.285353-6-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250804155407.285353-6-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 5 Aug 2025 10:51:56 +0300
X-Gm-Features: Ac12FXz_yTxmGlhhGe-fi7WMSXizT1iAGAYfFnkICkWhi-5XkkI01xGLjDZkakI
Message-ID: <CAEnQRZAAwmivz-uu2Z88Ky71eJ=5oRjdSJqqSQ2S4JT2cwQpOA@mail.gmail.com>
Subject: Re: [PATCH 5/7] reset: imx8mp-audiomix: Extend the driver usage
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_004951_913601_B0075AAB 
X-CRM114-Status: GOOD (  15.89  )
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

On Mon, Aug 4, 2025 at 6:57=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
> which allow users to control the assertion and de-assertion of the
> reset lines tied to some peripherals present in said subsystems. Some
> examples of such SoCs include i.MX8MP with AUDIOMIX block control and
> i.MX8ULP with SIM LPAV.
>
> Some of the aformentioned block control IPs exhibit a common pattern with
> respect to the assertion and de-assertion of the reset lines. Namely, the
> user is able to control the state of the reset line by toggling a bit fro=
m
> one of the IP's registers.
>
> Linux can take advantage of this pattern and, instead of having one drive=
r
> for each block control IP, a single, more generic driver could be used.
>
> To allow this to happen, the previous approach, in which a single reset
> map is used, is replaced by a per-driver approach, in which each auxiliar=
y
> device driver holds a reference to a certain reset map.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


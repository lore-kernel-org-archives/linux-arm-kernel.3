Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFF0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 20:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qOGU9lSGU7clY77Ut7Cvj8lEKcDAuiG7L+BWvjj5ig=; b=lEe2LH3RfavpKGaEUdvhrOfAOC
	e/WZ3N37aYdwzGm5e0ESEe+VlCaZ1m/sCmasI3M4K6kIFGJoslFWtJyjQVT4DB3JsIfysrwdOzB9E
	srlDnE2sg2DdJ9OQ6i1yExGKIuF9H3qSV2od4CkNp8bfZVtOLICrmbCkgDiExISsSja7TBrAlCF0g
	kNCuRyB3ZyPLILGyVKddN62Xcgsvh0U8XfJgEjD//C+a1pIaIEq1DNVKAUToolbfbfnESRuK7WnHd
	oeZNRbQE0dM1g7wGH3AgcTQ4tVgs5M+yspneCN+3eLPY19E8/LZIj+Jh68eYqjz0lZctO3OJnpAx4
	UowKpYbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUB5A-0000000FaFF-2U0N;
	Sat, 04 Jan 2025 20:49:16 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUB40-0000000Fa53-0ppp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:48:05 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-29f7c3bcf45so6799225fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736023683; x=1736628483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qOGU9lSGU7clY77Ut7Cvj8lEKcDAuiG7L+BWvjj5ig=;
        b=EtW5JFkl2f7YrSHMMg+betFeHASlu5TcEBeWUtp6+M6u+f3UanekuRkij9VncFrCqV
         qK5tLU5w0vC62dZt4aP8twVlNwv5Ja4YxmR1DGcYjfAV92VXUEB3w3iPlVqNQT/W7ImC
         bPcdqr07y77kDtqZ7F388zg3f2MQ0JgqimACk8eXxhp/Wg/q4byUWdT2Agq91kckO9SN
         WdYcxcSzWD79MmdZr48s73gw5wU6/7I2C0UhED090U3QsXt09tH1ZFOnZc5JW2hz33f7
         REsyuW7b5F5SounNN31+gXEW1d8VKZzyHtmxsg9Elj56+XMCL/EkjF4r63R5UxHsvE5G
         Q2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736023683; x=1736628483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qOGU9lSGU7clY77Ut7Cvj8lEKcDAuiG7L+BWvjj5ig=;
        b=OZqfqqKAcVz48/jRLH3i31mAqWJgFweC+qkqcD7Sz4VrcuwKH3iS10bSQ2oNVkA6U4
         9aDvIFuMdbEYnb2QzkWQrglcEmDs01Hfi1RwhbHLDMA9uhNojPR/WeEaUIExq1eKP5UR
         QL78WSHR319uPnviyqfT1aEB1efMfFmI8EOs7Ft6RM+5ZUjagpmA3zia/T3nECD17dUk
         WVTyYFKnK+uZ36o3ZAFolsfjSha58jXZUeEeCE1YJJIyeIw3rp75VY9pxAs3T5wysC14
         9NuVjClfH/VZH9CVtNR9chYUjhvyNMbiZFlGCi8LiMsF8MI6POJxX6yHAJMGd/YlUxrh
         YcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZfsrlTAg0Y8f19jh2wYHag4pDCTJ06ARF2g1RoXasZjlxiOu2ayhH36JnwDjMRnxx4l2/QRzx84iVhoOCjQ7@lists.infradead.org
X-Gm-Message-State: AOJu0YwrQJO0/aW+BhMAhY+IAJrOtv5H7kaN/23qUBw3Y4pYslmo6JCQ
	fQMUpymFxXg20UOZ2PwL+aXulP4iqw55fWnDlZ5sW5Ak+tP6/5r0MqtnxIsDNnHBRP+X72YXB0A
	rmdcaM9/1wX/iiTnwOrxH8jgBiYM=
X-Gm-Gg: ASbGnctytXjZEhGhN2sLMQ907N+cOkpneqzmY8gFPHhplnZeUqTSxt/+wN9s4IAeRfp
	SwvQdrUlhSFDX8chKBve10EP8BYZVnJK3iLKHgSF0Ct5Myxz/7S88
X-Google-Smtp-Source: AGHT+IFqdpx5RJdOsRI9uR/s22I3j6REd5BbLNXwPDGQxQawZM2Yl0ffyE3R+tpVxSAwvtmyO4+f1b43CRGilnVUCkA=
X-Received: by 2002:a05:6870:2f09:b0:29e:3d0b:834 with SMTP id
 586e51a60fabf-2a7fb00b511mr31315329fac.5.1736023683128; Sat, 04 Jan 2025
 12:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
 <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
 <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org> <20250104120256.65511a28@minigeek.lan>
 <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
In-Reply-To: <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 4 Jan 2025 12:47:37 -0800
Message-ID: <CA+E=qVdm5gf2+TL6ThaTdBy_3jPTSYdU6hj9Om9jPS=iyv8wMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: wens@csie.org
Cc: Andre Przywara <andre.przywara@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dragan Simic <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_124804_240190_F77391CB 
X-CRM114-Status: GOOD (  11.52  )
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

On Sat, Jan 4, 2025 at 4:14=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:

> > Yes, IIRC the C standard allows repeated definitions with the same
> > value. And I definitely tested this before (and hence recommended this
> > approach to Vasily) and it compiled without any warnings here.
>
> Hmm. Didn't know that. Good to know, and I just tried it on my end.

Yeah, I don't like it either. It's an artefact of pretending that the
device tree directory(ies) is a separate tree.

> Thanks
> ChenYu


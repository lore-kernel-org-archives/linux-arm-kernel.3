Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5DAD6D232
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXHlTDVJTF5vvWPU3rkwyK6a19VuMS7dqDcJr9Xe7V4=; b=VQWELnIjQotzIO6DER/ZEpG4Tg
	Dg8jDPgrwQuty6KdCboAP4FkrLmOI3g9MZJ8XMN7wGmocHd3THNIdmeRTRLv2dQ7h/u2hIczn3QFo
	i5InUfARqHaLcz1ksNaImX0dQrKIUBPQQh+u4CB8N4TpX/Gg93b3Gn1t1vZYijUYet42Dg//AT4cP
	sWwlTGUID2ZEB3yp+JvzxI60zg5C2ZP+n1wqwgadMVZpu4uxs54tG3p6crJKAVTrkJItj6k7A6AAq
	BOBzbhP8ku0oVZeL+1d975tk1DHENWRLR745MToJSjniSbRwFszMm0VgtOQBBmpkCmbFgvtYWQ+ZE
	sfOi4MUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFw0-00000008h8X-1a1B;
	Thu, 18 Dec 2025 15:28:56 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFvw-00000008h88-350B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:28:54 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55982d04792so512062e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 07:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071731; x=1766676531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXHlTDVJTF5vvWPU3rkwyK6a19VuMS7dqDcJr9Xe7V4=;
        b=ewN7YBaFFP1q0dy/oO9JKMf21OiQ7yH/h/N3d59z+h3bGkO4ef0vfBUHStva4Ujggf
         Q/z7Nlog3Knb8YND7cuLVZEr2iaka49dpPXFcOnTIhQ82np0mxDQ3zJMlkISJvgu5Oej
         //8x3HaOoEB6srQF5QR8D7NIpe5pA0XQ4Bkblg2MKVvq6ZV3KjdosuzMjxI3gumzSlib
         lLezBTRYyUw6+5giUka8lZLZBrlQhnQKzl4/yHa7fmUoHMCGL9DvOrhFG93aZw1u8yJR
         anCB29Y6ruwMv8tmvY6/TM3ti97OfsA6Hle/1ACLQRDSlBwLjz7QKRx//s7zA07qxagW
         cwdg==
X-Forwarded-Encrypted: i=1; AJvYcCUtlIkQwEd2aN1BQzBZmSmTZjLJLgtlnyHVr743KWZm13ooRKAe+9r8BndO5mzlM86t9AWSsslrJOpVyPoFcWdJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh6aPCNLWKP2evEjqNeQBy7DUVx22NaTX4RYY0wZvZioH80jcg
	fHWksqs0pZmVjIkyOnfG0Ft7DokG7zq4liyPA+aivNYBy0cN/QgH8lxEkDFD53lI
X-Gm-Gg: AY/fxX7X1/mt2dEanP12K5uR3b5KBbqEZfmtj/BA2ppU8SogEbob99M+7A/GVahN8jZ
	hkdXK2qbQ8m2AnmIQdvopvjWFmotnt9eXTEWZ/Oh99PUz4CDOb67C+2zcXaldw1PkbMXzih5Slx
	LzTUCieeDp+UPEqmlg0JPfQscvCttXCr/JNBzUntFyyts3ZHM98P9IsOYDc3yx/rmbrJ1BCOXn+
	7Qs/0SD9WJWg0n3Fq/5+tYSevlyxUlVL5ODDro0Lc9Brrf7OSXzL3WCIkYMa6d7s9e0WA3poweQ
	XX8p8vHPiYaSLPhnOjO3eigCXTIiIa3RVDSWzs+QrcfJlhRmjdYALqZnYnx6FBNz4bA8oeHmZbf
	mn39wDgFBCw15iY0f5xAH2RLq1ty8a0g6+NGzTKknCwpU0gO8fFqUWFd8qOlJ2bYthSVXAqU4DW
	FitDUdqSkzJQQvt8c1WMcU/EIQTpvlAwe3xxa8Zmr2dG44Qc+iAbL7Gnr99hY=
X-Google-Smtp-Source: AGHT+IGXVFsH9+s70dx39q3yK8NttR9Hfvjee0i39vGohsF1ciUAyKUCbO+NpKx58Hhu6apy0qCrSA==
X-Received: by 2002:a05:6122:330a:b0:537:3e57:6bdc with SMTP id 71dfb90a1353d-55fed62664emr6850042e0c.12.1766071731322;
        Thu, 18 Dec 2025 07:28:51 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9433123dacasm1000016241.6.2025.12.18.07.28.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:28:50 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-941063da73eso473225241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 07:28:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzt/TZ69mTZPZGo/vOeZeJpt/iUK95WMmGDuwWaKvKaGSITesx9sxRL2TDyHecvVV11DYlL9gN3+nFvLC6586g@lists.infradead.org
X-Received: by 2002:a05:6102:14a1:b0:5df:af0f:308c with SMTP id
 ada2fe7eead31-5e827854ca8mr8511390137.38.1766071730637; Thu, 18 Dec 2025
 07:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:28:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
X-Gm-Features: AQt7F2qLc82Kbfmr6BXfh2mc72SoQ2IFZ770WV9-Gsf5ezj4RJc3ZYutw9_Yvk4
Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Support TQMa8QM
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_072852_796277_35588CDF 
X-CRM114-Status: GOOD (  18.06  )
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

Hi Alexander,

On Thu, 18 Dec 2025 at 16:22, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
> 1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
> as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
> property on the parent clock.

Hmm, clock consumers should have no business with the names used by
clock providers, even less so whether those names are specified in DT
or not.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


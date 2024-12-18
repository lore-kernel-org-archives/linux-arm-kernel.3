Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E01E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 06:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tg+exyt2bEd/acPRMVaty3D/uVegz4OUg+5qQVFiOTE=; b=AvS2vvOdn2ajZGCGnaaAYBVTS2
	/kC6TrA3gWBP1aCnbFDkeC6upMzfRqon+UiDqe0abXlWNnsz3mrhn9Z6DUctES+kcOg+gUyUCrmvl
	xCZPUToZMOTrQYCJtOGZgA9Ly9st8nmZTyu1ysm66Wkk0+OmlsTnXX1To5kcVPB5qETa0o1bvN30Z
	Mk+uaHJ9NwWppAtDMGw7jFFjsQPsa/Ui/4rxDMpHtRN4GfdayHlWuPUPf/Si1Yzqrd3xV4MzTNI2C
	mGNAeIcj6TEVooksqB7gCz1a4NP0uKD8ZqHZD5hDGp48/kxFqoS2IbwKGK5gOXCcf3J4uLUKKnLZI
	I7YlfoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnh6-0000000FkCo-0h1K;
	Wed, 18 Dec 2024 06:38:04 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnfQ-0000000FjsA-1El2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 06:36:21 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-294ec8e1d8aso4428110fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 22:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734503779; x=1735108579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tg+exyt2bEd/acPRMVaty3D/uVegz4OUg+5qQVFiOTE=;
        b=HhJOsz9bDaw2ARWfST2FXXOU93Nq1ChytH8eBQtw05UVZfXI/aK20F3R3t/tDIJu3m
         vCaq8Dk4DKR57DQKFIBDrnRDfCFc90VMmLHORmnpmakCFdlEsYaK1o2UHsxDNE3LivQI
         PtU6J43g5vS+PM211G+o4/+aNjAm2WM1kO5jsOWJMVldhnK99bO6/cDQQAJ0AcA4VxgF
         Ari/kkZL1hA3HrpOgCKmbZ0a3p3GtHRk+0f2edZMM9ybVKCvZPSBBlBD/zMyUnTvqQml
         gaH4+Csg7ANoM8BJu1ihSGpll7JZUgWkpk/N1s/OJJitoRST6fH983VMfPaerZhjjkec
         4+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734503779; x=1735108579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tg+exyt2bEd/acPRMVaty3D/uVegz4OUg+5qQVFiOTE=;
        b=G9Kc5p4OHQ2C/pfxQlxzm9ozbr/geZ6of1Q6PuZ8Q+An0PV7j9HAsHgVynrPaLMdJt
         VEmhAzAHybvj4M7yaZGgH7a2V1UUF53JAVzRekgWlBJSGQ+g6J81DehS91UqDhJQPfLF
         3yNHyDZj50e8GxhO11zTuPj16swCczbIK5q6mcSuA1Qoy4DloqDTP9sgQ4X2RjGIaULd
         A9zJKSeC0RbtEv9YC3CbLyzxT/q46zzxzvqfvX6SUTiqlKDOqDBtgbT+sBBFCJkc3VTf
         ZuVE0PbDVHO3WPdnPoD0Cd66c6gEUw7niwrlHjxbv9JsiWqJCLZtF071tA8gX1OP6saX
         7eaA==
X-Forwarded-Encrypted: i=1; AJvYcCU3uezpdKY0OQfiTaNdQ9KeofxRbHTGbyurVdHDMNPU8Z5OqmaZMmLYL89Q9i68MJKkuBTSTRznAi2P9Ewam654@lists.infradead.org
X-Gm-Message-State: AOJu0Yygx9VKYeOTCHBsvj9BMXfO4R8GEyA5N4K7YxLcrC3GdI+SpEyF
	O7HR+uSze+7LyxU4abM8/tkGz70S9+ZUuaUXtRZOLJMOheqwe90CwFdrY7mSpANESDsOjqxm6Rd
	IpsN1mCEwWGtsYbWOYjB6yhdVahM=
X-Gm-Gg: ASbGnctvTJ8qw6qcA3UC1BGiivRpn2tucbCwpWoxM5OtWIZDaunDNan4MCcPhTHUHGS
	pYQLJCzvX0wBogr57Arbw4VgCQ/ctfyOqkeS0NkPmwwMNICdJWAUt2ZIazoihEFymgS29Bzdj
X-Google-Smtp-Source: AGHT+IGDZx1A4lzjevZaetM3q0p0F9NGqZ4KJyg/ET7Jin7l5ozux8ML2xLClyaZEmXGWB3tap3fvdMwxeQKOyK0U2E=
X-Received: by 2002:a05:6870:340c:b0:29e:2345:c656 with SMTP id
 586e51a60fabf-2a7b3435b4cmr635905fac.43.1734503778886; Tue, 17 Dec 2024
 22:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20241215053639.738890-1-anarsoul@gmail.com> <20241215053639.738890-2-anarsoul@gmail.com>
 <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
 <CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com> <20241217211505.7f9c9e4e@minigeek.lan>
In-Reply-To: <20241217211505.7f9c9e4e@minigeek.lan>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 17 Dec 2024 22:35:53 -0800
Message-ID: <CA+E=qVcU9V+8LZ0Xnh+oDROVf8H99t_kiku7iSdXTHP43d9E_A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_223620_332614_D061EE5F 
X-CRM114-Status: GOOD (  20.41  )
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

On Tue, Dec 17, 2024 at 1:15=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue, 17 Dec 2024 10:00:45 -0800
> Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> Hi,
>
> > On Mon, Dec 16, 2024 at 11:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >
> > > On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote:
> > > > These will be used to explicitly select TCON0 clock parent in dts
> > > >
> > > > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in =
TCON0 mux")
> > > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > > > ---
> > > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
> > > >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +
> >
> > Hi Krzysztof,
> >
> > > You cannot combine these changes.
> >
> > The patch basically moves defines out from ccu-sun50i-a64.h to
> > sun50i-a64-ccu.h. How do I split the change without introducing
> > compilation failure?
>
> You can just have the binding part first, adding the (same) definition
> to the binding headers. As long as the #define's are not conflicting,
> this is fine.
> Then remove the now redundant definitions in the kernel headers, with a
> subsequent patch.

Thanks for the suggestion! I'll address it in v2.


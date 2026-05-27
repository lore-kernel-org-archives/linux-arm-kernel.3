Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB58CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy2hrrBG21BdHck1YdIk1SaSJwWCDlg+jpuiQs79vfM=; b=O7xKzKVUInWBS7QserSRUU7y9b
	8nDjNvOHMcRq+LfVVsFvsV/MPLGN1YQA7TJ1yWG9axhAqh/v1XjmA/hwO0hhPNLiWTuRYYWo4co0u
	Ja4jkubKMjVzI1kTDGSuS1t25ILFBjgKTZo+y3pIBUEVJIvwVYI/UGj4ZRudP+/9Cpq0RYvqdtU0a
	m4uQmGsOlD3tp+88pTzj80PDKFAxx9EivGJJbrCkgeqCbRisdWOc2DvHJLEmKGdqAHW1qKnyvowDo
	aTvNgOsNZ/pVjQwCU2zFZ1i+I6nF0dG/hmBhfJUwBVVlzoxwAGw8I+U+5SSSFqEJm0i2hD+artSu1
	QUfn9oRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8Wy-00000003S5Q-3gi6;
	Wed, 27 May 2026 07:18:20 +0000
Received: from mail-vs1-f51.google.com ([209.85.217.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8Ww-00000003S50-2md9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 07:18:20 +0000
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-63329e1c77aso3599691137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 00:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779866297; x=1780471097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sy2hrrBG21BdHck1YdIk1SaSJwWCDlg+jpuiQs79vfM=;
        b=o4RwPqEs8wBZVdfUNCPZLETcIydLFWDgtMoihkiyW2TLTKVPBZE9IEs6VGj0R8ov7I
         5kPiClq1t8tU/wWqhOFENyFMQL6zCX/cpUvZjFFmoK2nLiG7xwwQDpJCu1KG7OHTQnqs
         BKtWakwnLeRWyTt+V0hjiDfJF5pSoTkJej1ClSovImk6VEzqtibi3RaEvJrIYEQxDwBZ
         Z8GDX9k8Y94OD8QGxtJ7lw5MLhUuN2nVjKBnvus4vRrxcSolM5uTf0c0kNEXTR3XQyvg
         n3BsGTr9orn7yYHWYclrZbRF1Wfc+AuVDAzkZo3vvyAzXNRKAGKbBCrzg6QzpkLgfEb5
         FE7Q==
X-Gm-Message-State: AOJu0YzSbUOnwm9CuHFy+/xWbbHeirBuVuJck67rqgmTs8OzLXGrW3kb
	IpX1cWsUB/gzxMlXLhOSV4m19s/uZmYWguosip2RpScEh/M9QjU8UXegbwMwWZigNIc=
X-Gm-Gg: Acq92OGZcKWvmhfDP7+FO/3/NPUuSf3R/j9oIvkSK/GWws/R5Wcbc5yxPwnd3Sz3p5k
	Oe4MguWphH2DRICph3ccqy6yyxeGxy0mhGYelGA6zJ8DKrZaI/vYEFPj8Yp5kqbbiO25lly8hIx
	94xPQlASgAjI0t6izcawr754A+Wb97S3CiW34o0UeI//S9DwZJWgLmKtmqZBru6zJRBF7QYnmxw
	f1FdRTx2frA335FxefmWmGqpOfMxUdJCSOkYb3p0AxKJMlL7fnIbheV5DdOw9vMJ9KB21pwEyvF
	pEI3BpReJ69yWn+eiUgkXB9L5AJzkPBosabitsDzRaZmEuHJBuAG99DKeZLzRQRgPDulh0DL1v5
	O/V2Ml6WyAk/r+PNzAp5Cn4B4zeCHQ6C0ByLwKwf5kAgQJIPdWsch6J6UZXCAxg4fyGfU99Dmto
	b1urvOgh91T4Zf6V5jd5/T/DiH4z7Q0iUz5L/W0VYcysXbwDk7f+ArDjon4wc4r38g
X-Received: by 2002:a05:6102:3ec6:b0:631:4580:6a3f with SMTP id ada2fe7eead31-67c767cb843mr10103606137.7.1779866297122;
        Wed, 27 May 2026 00:18:17 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff3e499bbsm16021939137.7.2026.05.27.00.18.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:18:16 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5752b279662so4077066e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 00:18:16 -0700 (PDT)
X-Received: by 2002:a05:6122:4581:b0:575:a5b5:3233 with SMTP id
 71dfb90a1353d-5865f154435mr10929054e0c.4.1779866296537; Wed, 27 May 2026
 00:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:18:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhk2rf9+1mvdoUbd2T=vNC0L5UXeiEzwDPvfMOT==+mA@mail.gmail.com>
X-Gm-Features: AVHnY4IRt8fLyNfU8YOCQpYkCYZ9ntliUcjglmYbKUGrrnuUFeY-Av16LJkvBmg
Message-ID: <CAMuHMdXhk2rf9+1mvdoUbd2T=vNC0L5UXeiEzwDPvfMOT==+mA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1
 Redistributor description
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_001818_713267_1E1F3F8B 
X-CRM114-Status: GOOD (  26.58  )
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

On Thu, 14 May 2026 at 14:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The Renesas R-Car X5H (R8A78000) SoC contains Arm CoreLink GIC-720AE
> Generic Interrupt Controller with Multi View capability. Firmware has
> access to configuration View 0, Linux kernel has access to View 1.
>
> The Arm CoreLink GIC-720AE Generic Interrupt Controller Technical
> Reference Manual, currently latest r2p1 [1], chapter "5. Programmers
> model for GIC-720AE", subchapter "5.4 Redistributor registers
> for control and physical LPIs summary", part "5.4.3 GICR_TYPER,
> Redistributor Type Register", "Table 5-50: GICR_TYPER bit descriptions"
> on page 200, clarifies register "GICR_TYPER" bit 4 "Last" behavior
> in Multi View setup as follows:
>
> "
> Last
> Last Redistributor:
>
> 0 ... This Redistributor is not the last Redistributor on the chip.
> 1 ... This Redistributor is the last Redistributor on the chip.
>       When GICD_CFGID.VIEW =3D=3D 1, for views 1, 2, or 3 this bit
>       always returns 1.
> "
>
> On this SoC, GICD_CFGID.VIEW is 1 and the Linux kernel has access to
> View 1, therefore Linux kernel GICv3 driver will interpret register
> "GICR_TYPER" bit 4 "Last" =3D 1 in the first Redistributor in continuous
> Redistributor page as that first Redistributor being the one and only
> Redistributor and will stop processing the continuous Redistributor
> page further. This will prevent the other Redistributors from being
> recognized by the system and used for other PEs.
>
> Because the hardware indicates that the continuous Redistributor page
> is not continuous for View 1, 2, or 3, describe every Redistributor
> separately in the DT. This makes all Redistributors for all cores
> accessible in Linux.
>
> [1] https://documentation-service.arm.com/static/69ef3c1cd35efd294e335c43
>     Arm=C2=AE CoreLink=E2=84=A2 GIC-720AE Generic Interrupt Controller
>     Revision: r2p1 / Issue 12 / 102666_0201_12_en
>
> Fixes: 63500d12cf76 ("arm64: dts: renesas: Add R8A78000 SoC support")
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Update GIC-700AE documentation link to generated PDF
>     - Update commit message to match the PDF
>     - Add AB from Marc

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


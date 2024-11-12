Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9271AD41D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDwP6y4apLuPSJNyta68tT9HUAyd8428Aaq7TNs9y8M=; b=QodSRbgdDfk+UnQUitgG0kdeTg
	Dm/mcmrrFmdVMDOQQ/fkVoL0o4sARKhioK9WRZa7l6ZxL5uBKouYKOuwhNQP+mPoiwwt4TenvwAd5
	EpL0TvUug4P13w3KpJAI5xuC/I/dsOdFLSCpQCGNEYy+0ZQqDgtRGzxp2dMBN8iELRgriQjmlEKCO
	SBlAYpRvpVD9slofdDQ6j2tBW6Bgp31E9S0DVxe3n3Dd0d8Q9UH5lCcg+mDWs/BgVLD6N9bQtHqz4
	hVMZqcf5INsy8OBmrqQlJTjfF6PBD4t8MxuSmVO1mn7/IZvyOE8AUJKySzZUq8T1RSh41i1R9zEVI
	IXsWlNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmBF-00000002cVd-2XlL;
	Tue, 12 Nov 2024 08:23:21 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAm9R-00000002cDX-0P22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:21:30 +0000
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2974743675so4909063276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731399687; x=1732004487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDwP6y4apLuPSJNyta68tT9HUAyd8428Aaq7TNs9y8M=;
        b=u48b+UP7KCqxic/Uzf+ASJG5QcTa5C/W9hcIZKDIa7xOudodxEqRzVviSOGhIsBCkg
         sQtxgtY/r21e3p9zVROxfHl9dfbiZ0wZoKutz0O4MhvGABLbOaeqUi/C3W6OKP+DSMWV
         jIBmH+CZvj1/YQR8nRjLeun5j48B+z2B27Y0gx6VipthqmsVjGgOvjv+EYi2Q9JsxTUY
         6vDsEIsa6+Qf5lzmCqYK8guS+b1iLun7QZyXc+jgUEgb0BMj8LfkQAYwprjOtKwYwQF2
         FdqFQc9PAdZTJ0pyqMn8y4VPEny25+TM7/j/nDYXAIqSXCVoeOwksupCU4NSj47CwKAN
         fTDw==
X-Forwarded-Encrypted: i=1; AJvYcCVil0JQd/a513Imx4guFyC0h4Hv+NISFOqJFiQ1DGlBiA7jgdzou8JXOd94WA6yKUATShmiNc3XcyAzpOCK5l/2@lists.infradead.org
X-Gm-Message-State: AOJu0YwoKwPxqJEJ7KPYUEVqDY9omfre/F/4odr6YY90+Cq1DY0x8brM
	Fyr1Ga3CN71xVh0SZSV6bTh4Aoyrmo7MODjtt6WIRfoRL3CP4Hqb8sqcguDY
X-Google-Smtp-Source: AGHT+IEcg2qh4nDQCKm50U6qZUhK41OonINRfq8mFqUlW5VXKo5kFwUzAwfgyk1SP/yGcQ7fa5xmAQ==
X-Received: by 2002:a05:6902:170a:b0:e30:d89f:1342 with SMTP id 3f1490d57ef6-e337f881d09mr13140314276.24.1731399686792;
        Tue, 12 Nov 2024 00:21:26 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e336ee155f1sm2737394276.11.2024.11.12.00.21.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 00:21:25 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea339a41f1so44962317b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 00:21:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVx79REEC+S46EdjNE57G4AWvTUkxFDIg5VRVvMpqkIjAm605jCDQFuJMpVQVAmIxbpVW4KmevbFCPy5riFMl3w@lists.infradead.org
X-Received: by 2002:a05:690c:670b:b0:6e7:f940:fe81 with SMTP id
 00721157ae682-6eaddd75bdamr148538287b3.6.1731399685525; Tue, 12 Nov 2024
 00:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20241101-am64-hb-fix-overlay-v1-1-080b98b057b6@solid-run.com> <32c1f44c-6bc7-4722-9f73-743ea15cdcbd@solid-run.com>
In-Reply-To: <32c1f44c-6bc7-4722-9f73-743ea15cdcbd@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Nov 2024 09:21:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZB1iiM5K1VWch5HrohRz+HYu2z1KBXDh2e01TTPgOWQ@mail.gmail.com>
Message-ID: <CAMuHMdVZB1iiM5K1VWch5HrohRz+HYu2z1KBXDh2e01TTPgOWQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-hummingboard-t: convert overlay
 to board dts
To: Josua Mayer <josua@solid-run.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_002129_156417_19159664 
X-CRM114-Status: GOOD (  28.21  )
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

Hi Josua,

On Tue, Nov 12, 2024 at 6:05=E2=80=AFAM Josua Mayer <josua@solid-run.com> w=
rote:
> Am 01.11.24 um 15:16 schrieb Josua Mayer:
> > SolidRun HummingBoard-T has two options for M.2 connector, supporting
> > either PCI-E or USB-3.1 Gen 1 - depending on configuration of a mux
> > on the serdes lane.
> > The required configurations in device-tree were modeled as overlays.
> >
> > The USB-3.1 overlay uses /delete-property/ to unset a boolean property
> > on the usb controller limiting it to USB-2.0 by default.
> > Overlays can not delete a property from the base dtb, therefore this
> > overlay is at this time useless.
> >
> > Convert both overlays into full dts by including the base board dts.
> > While the pcie overlay was functional, both are converted for a
> > consistent user experience when selecting between the two mutually
> > exclusive configurations.
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Closes: https://lore.kernel.org/linux-devicetree/CAMuHMdXTgpTnJ9U7egC2X=
jFXXNZ5uiY1O+WxNd6LPJW5Rs5KTw@mail.gmail.com
> > Fixes: bbef42084cc1 ("arm64: dts: ti: hummingboard-t: add overlays for =
m.2 pci-e and usb-3")
> > Signed-off-by: Josua Mayer <josua@solid-run.com>
> > ---
> >   arch/arm64/boot/dts/ti/Makefile                            |  4 ----
> >   ...gboard-t-pcie.dtso =3D> k3-am642-hummingboard-t-pcie.dts} | 14 +++=
+++++------
> >   ...gboard-t-usb3.dtso =3D> k3-am642-hummingboard-t-usb3.dts} | 13 +++=
+++++-----
> >   3 files changed, 16 insertions(+), 15 deletions(-)
> >
> Please hold off on this patch for the moment,
> Thanks to some comments from Geert I wish to submit an alternative
> solution via separate patch-set, for further discussion.

As you state in the other patch set  "I do not consider it ready for
current merge window",  it may be worthwhile to not hold off?
It can always be reverted whenif the alternative solution is accepted.

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


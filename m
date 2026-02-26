Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17D4FCEEBD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 06:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZr1Ou6tY3TudV/DCBYFuPdgoLpFgmS9h0sv4mAVKrk=; b=LqItwvAnKLBNQVCq4w3f/zQ7DR
	EvTjsDzibwk74FzKQheH+UB2CiAjVVnYmNXSfmFvq5HZUZj18pDiysGePNEESMU+clmOfhyfV92gZ
	aHIph/c74zeKusS5UdP76Kih1Hq5osbrJNbyetZsBkDgL/tloKec+F38D4rhNSp3VtsgkdNXJtSbN
	eiThJbwFZ6p2n9fGfNcG4bkc9otlQAoJZPmHzzwOv51TPbdqXZetW1VNg55UHuGSX7tKxntnEOtvm
	EOINMEvWi+qMFlMkPgpMrhBiWO6cspTSVaxKEXNt1ALcCYo2OABMc9YcpAJAYnsRznOdT86TfweAa
	iZ38ZITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUc0-00000005TVL-14co;
	Thu, 26 Feb 2026 06:12:36 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUbw-00000005TU8-2pNV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 06:12:34 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59e5eaa491cso598235e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 22:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772086351; cv=none;
        d=google.com; s=arc-20240605;
        b=a4bW9ViSrwMp3ymVsNscGJBvPLVtTrVWdspTx2QC/sDEKLV/hIO+hNff+9Cp0lvKsz
         kAnbSugWBSc/AqQ0dm4ZsnQMEpE0HESJvJnlYW1lTUxzcIfoNWgM2wwQTQcnDE+pTghU
         +oVB1dyh+BWpFE5cJyhEcf2e9PstRS+MAHZlOylEtaw8v6WhcIbQS2yH6fHSKiijn4GS
         sgZyr8ttd12X9FndYltXmNds/Zg2czubT4KFlD2lmjlZq7kHt6u4hHrFi+UCEMU4v43k
         1lKvZM7syjqFUHmbkiWhKqW91NkQVJ87pEaGS2MuvyLJjAHqv3LRgMCkf6+1fYJkgSgX
         QSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SZr1Ou6tY3TudV/DCBYFuPdgoLpFgmS9h0sv4mAVKrk=;
        fh=djrjQMCAhS5+T4wCFf/k/Z3jJJj+lnEfAfv2vW2x5dg=;
        b=X4NMJXFbHlKK3ROspcl7lOkv8YruqRy7WKohgLRpFoucTlBtm+XkAQmvgrg30ba7Vr
         OEGQsmlGayKjRhzc6Lal/edmBbl/WHaLQuuJb+m/bsPG1Msb+pSmDB7KxjHoql7dy89n
         TzUzRr86dCbLdBlmeiOYQeyLBqW7zgsHgwKLmN3XD24xy6s0lbbf40/iEHWTSmFqsTMM
         BTkVOkjL/rdiMcjrVoI1G4BVFXbvCcFUQ6uAHAfaUAR9IeayQUNWyf14hRdHu5WH6H1v
         SMab2Akl5hUx9fiQ8o2CqKxZywODn295LQMvBkw7qn32iyU+Pus5fGnY+VnDuv9zzpnS
         u0Pw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772086351; x=1772691151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZr1Ou6tY3TudV/DCBYFuPdgoLpFgmS9h0sv4mAVKrk=;
        b=Nyv5LIkvG/63neqAsxNULN80Be262RYNQKad3sJQi3dt+fV4JNUJAe30P9LOUMRZw/
         jpE8g4Sf7Xf3UUwJxuTCMazUAUBCQ2oqeLn3Be/VNbQBZAES2tp7bp4Eic2xAwsewS+v
         M+dmxgQ561TtnXbZeuL3W/IGnd55bQQhBs4KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086351; x=1772691151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZr1Ou6tY3TudV/DCBYFuPdgoLpFgmS9h0sv4mAVKrk=;
        b=XGNbwlpmqDH7bZyU3UDCV2EadP5LWmpknBnRvtjrjExbEF90l0C+xtwh0bgG1X+HRU
         FfLhBdA6lFC1Mgup71HqTNPcHQDnQuYKgoqKqCnXnrNuI0d4gZBYG5h0R64toTJN7M5L
         pYzblFEC0AWgXXpRRpDdbSjH2KbA/BXUlOy9GWA1vVzy/PtupMcn6brgY2vjLGJP7Bt5
         lh6HI+yPuJW+CNoP+bUB+PpjFjDLNCTQLQ2CHI43eg8zkX2EXMo2+jd3yn+Nx0wK1RlF
         +rUNE+3MuZt7AkEmu0zbqeZXoqwkIqqH34WUsRSJQmHgAUc2N1geG/sZGnzwRXY+Hgk/
         TwsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR091Ik6wZsQEFywGuFHSLIvR+nmODRXmznT5jDXZ2z/PnVHIFBZAqLp5j3u0ECvtoYcyY4QiY+Itns3qQ89aM@lists.infradead.org
X-Gm-Message-State: AOJu0YwUzfdSWD+vukPkw9rEX6usvj00UOcZRVyOuDB3Vw8Me40nZW1y
	Gq8MUsezbnFXb+lHElpO8/C6UeCgfj7ivDbZT79Fqw1D8bXsvCptIgfzPnf6E1QGc4lNV/K7AWQ
	mD9rYQJhKmKK54OBYS0fSJ+EFbNAqQcq6Omx3Xzrv
X-Gm-Gg: ATEYQzzGKWw+hkOu+L5TE8BDfD3mM/R9JD/Uk/AGXX8Zv5lCmyOBpMnEGMViV0R6Cuh
	2bqmdWVDPLjpA4HxGbScikgV5Y60UHNcabTjuounNXjAPUJyMx9TvwiotlFiafj4W+tp3qSiTHt
	i0WbaKLVEsLH9q+OG1DhsUpMtjsk6sBkoUgFMFx5kzqELH/MNALOU8cDvbd4y1MN21jV3ldZoAW
	GFRAo23fBPMkRZMAZEveRQGToG7CLDC1ROfL/azakCZFb0dJsCzM0rxFhOxFe5xO2K3lvn2hJQq
	nyCfpf/MAmGFszI5mGY9MK/xnwuGpxVyMzM7fw==
X-Received: by 2002:a05:6512:3c9f:b0:59e:1a32:376f with SMTP id
 2adb3069b0e04-5a0ed88c5a1mr6027586e87.22.1772086350568; Wed, 25 Feb 2026
 22:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <knddbvl6qti4pyaphudrmhbx7jm245tsmpa37snk4frtphcuz2@am6aatvc6hbr>
In-Reply-To: <knddbvl6qti4pyaphudrmhbx7jm245tsmpa37snk4frtphcuz2@am6aatvc6hbr>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Feb 2026 14:12:19 +0800
X-Gm-Features: AaiRm51hju21fa_yFDX4K_BlO1UHUo4C27fJmxo88iheU3vUI_evoR4nfNhfQUA
Message-ID: <CAGXv+5FXZPviNSVmrM7-CEkwCQOsYy9PkguBgnzzTrk4wwCqnw@mail.gmail.com>
Subject: Re: [PATCH 0/7] PCI: mediatek-gen3: add power control support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_221232_903853_15E906D2 
X-CRM114-Status: GOOD (  30.02  )
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

On Wed, Feb 25, 2026 at 9:25=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Feb 25, 2026 at 03:22:17PM +0800, Chen-Yu Tsai wrote:
> > Hi folks,
> >
> > This series adds power control support to the MediaTek PCIe gen3
> > controller driver. This allows proper modeling of WiFi and NVMe
> > adapters in the device tree and control over their power supplies.
> >
> > Patch 1 through 4 are cleanups and minor improvements to the driver.
> >
> > Patch 5 adds power control support using the new pwrctrl API to the
> > PCIe controller driver.
> >
> > Patch 6 adds the WiFi and BT power supplies for the MT8195 Cherry desig=
n.
> > This is actually a M.2 E-key slot, but support for that is still WIP [1=
].
> > And even with it merged, support for the USB side still needs to be
> > figured out.
> >
> > We can either merge this as is for now, and do another conversion later=
,
> > or just keep this one out. However this is still an improvement over
> > the current device tree, in which the power for the slot is always on
> > using a pinctrl setting.
> >
> > Patch 7 adds the M.2 M-key NVMe slot found on MT8195 Dojo Chromebooks.
> > This change actually makes use of the M.2 pwrseq driver.
> >
>
> Thanks a lot for doing this! I'll also try to get the Key E support for v=
7.1.

Ack. I'll try to look into how to hook up USB for Key E.

> For the whole series,
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>
> - Mani
>
> >
> > Please have a look.
> >
> >
> > Thanks
> > ChenYu
> >
> > [1] https://lore.kernel.org/linux-pci/20260224-pci-m2-e-v5-0-dd9b9501d3=
3c@oss.qualcomm.com/
> >
> > Chen-Yu Tsai (7):
> >   PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with
> >     dev_err_probe()
> >   PCI: mediatek-gen3: Add error path for probe and resume driver
> >     callbacks
> >   PCI: mediatek-gen3: Split out device power helpers
> >   PCI: mediatek-gen3: Disable device if further setup fails
> >   PCI: mediatek-gen3: Integrate new pwrctrl API
> >   arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power
> >     supplies
> >   arm64: dts: mediatek: mt8195-cherry-dojo: Describe M.2 M-key NVMe slo=
t
> >
> >  .../dts/mediatek/mt8195-cherry-dojo-r1.dts    |  38 ++++
> >  .../boot/dts/mediatek/mt8195-cherry.dtsi      |  47 +++--
> >  drivers/pci/controller/pcie-mediatek-gen3.c   | 185 +++++++++++-------
> >  3 files changed, 183 insertions(+), 87 deletions(-)
> >
> > --
> > 2.53.0.414.gf7e9f6c205-goog
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D


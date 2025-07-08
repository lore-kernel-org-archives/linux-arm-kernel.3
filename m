Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E98C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 03:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6qI+uivx+bnd0zwfJl1YVkWkeyiKKg4Fij4wbpWozY=; b=eRiccgxIOPZTu8
	RrQU5n8LwbhpBH72Z5oE5up8Iy8YItlezeqFHFeLHUY9029GNY4NHhEcamDrPMWnsMJMXsW1foluY
	gjADuYa03FYm1KFcgHIllzZsQBtiWYxRYp6Zi1SCwuK90X9g7LFNwNWuOUwrZMnUwD1CLf1Nb2e1S
	D1ot2VWc6wVjaJmg+FsKvBbBTaNz+5tfSpnIFQCxBmm2hvfM4xzNMz9O6zRbas9BnY8797cqbX7Yh
	JCE8aP2cqefwoVLFLvMVnJBRsKwe9F52ePhReeW7ehG+geAU2DiIv+fh8XN/fR0UfrppICIDw6U68
	W8JWPWtHMLZur9hkssrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzHj-00000004CUi-0lA1;
	Tue, 08 Jul 2025 03:46:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzFN-00000004CHp-0jLw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Jul 2025 03:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=t6qI+uivx+bnd0zwfJl1YVkWkeyiKKg4Fij4wbpWozY=; b=PmhXueY+xU7Qt2zoQVHc03N8Hy
	CWt2xRlqiP+LnI95GocnM0LPyXxHd/EhhGh2nRTilTQSK6j8HZ6LwCGh26eDeMyW3LOzgs1Ymgvrj
	ZQY0U8nT/V/3Rc5wTwEt9dPeJzU6zHukP6LnYohUTDgkw+aQfAcfGace6wvX+b4Mn0LHqRwAg7BFw
	XwedE5MZ7I+fPmKpDmP44f7AxffodsOEFmbE+870LZEZZrQmHcmLMZfR2Q7me/v8IfEXg1BE7PlEP
	kBL41QtVWE7ny7WcHVInBKsKDNcPN7+sQK8ZEeK+BTHEx8oP77yu3RQ+dcJWb3NCayZOlKLSMZNqm
	4px5iVqw==;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzFI-00000008aUQ-3QMQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 03:43:55 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b60de463so3920814e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 20:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751946229; x=1752551029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6qI+uivx+bnd0zwfJl1YVkWkeyiKKg4Fij4wbpWozY=;
        b=R8cSYqkbrRQkTlnUp44f/XSHVhTMtU4oSgK2x//czCgf2lL4B7jZxxGZ5qjUm5OUWJ
         2Kvdkqt6pTOgt4oVLUn+vsc4yaWrT8ARO9Lite6rVC0V/6urk7+86Mb6BxCuG2UvyF4A
         5hzYhmV5Z3EBH6vpvG6ODANDR2CrRy8xJjtxPJv/iAauaEDLNVGbJ4YYX0kqr0coUdlV
         1WAOdorqFVucf8WeB626ujkfcL7SwXGmudQJAcPmkW+SOQ2NLhvRISYMNSauUFdX8kSA
         TZU5JFsYwaId6azs670LuZBNg10LPcZBpeNVU9fHjRQ7I7tKgZkkpxIAtqQqClmO82uG
         kAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5rA/zmhSB1Wv7sxcK3fbKQqP7EOr+S2HZBFRj/E54gtw2yyw+SZvQDtxmvigT32sha95NzUJ4WJo7/Z0Sz7jZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq9gBF7lB4VFfR3nY9ILqPFjKtEH6EhXI5sGRn4d54BO4vHYn/
	M7EDRp10AVU7K7KLSQD68B2iAd7BeFnS6fAvm9EC0/t3Hh6DF7YlHOSqYomMVItX
X-Gm-Gg: ASbGncvbxZNkV7JM0INjCUW01XxvU9Hbnv+DN/XOX5tDH2SYwXnInshG3N9GZ09X8HR
	ecYMfWrn0DcpcoEA2+S9PPwpB3ob1+TauJpbaoYhaiiO9yyfrLEiTyTL0YaMTzyTfnZjA/fShpi
	rE1LN+V5jYuzOprbGrpDwLtRhRUilxBI8Fec6PTva73rXcxg9EGl4f1mQ97TJqnc+jyLUVOWTrj
	ndqSk10rK7V79P037Qe6K06N8e0CnNRAg4qXwsqA0JTG94GzXTHX5DENrD/bJwgC/dN28YnH6bK
	Z3Lim8Fx7cdLh5Ty70mprKP5MBluOTU0w0HimAXOOVxi3biCsNS+L8cvzFKdwt1xukXiSDVG5M6
	bVsiPgXdqi9rvadBNPHE=
X-Google-Smtp-Source: AGHT+IGxSgwlQHJ3Q+pTkNnu9VsOZsJzTAY/It47n5GSXcizuUXg7wxNJ3YITCmb2ChQZz8I2SyiSA==
X-Received: by 2002:a05:6512:691:b0:553:659c:53fa with SMTP id 2adb3069b0e04-556e656a2b4mr3703847e87.5.1751946228680;
        Mon, 07 Jul 2025 20:43:48 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb5b1sm1538058e87.48.2025.07.07.20.43.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 20:43:48 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32e14cf205cso31361991fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 20:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWSmTwkvMSLvs5lRSd5uFWvJDK95sWNdsdnT6Agifq2rw5qIsBOQxlolcMmr+n7WXbBeqye3EZE26o4RdMeH02@lists.infradead.org
X-Received: by 2002:a2e:a7ca:0:b0:32c:102a:f02d with SMTP id
 38308e7fff4ca-32e5f61e89emr40266751fa.30.1751946228111; Mon, 07 Jul 2025
 20:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250706025625.2707073-1-iuncuim@gmail.com> <20250708004458.15a2feae@minigeek.lan>
In-Reply-To: <20250708004458.15a2feae@minigeek.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 11:43:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Pu7CTJx3K=3CVSbQ9mNB-4Vrq+iaA+hUWtxdwS2aD0Q@mail.gmail.com>
X-Gm-Features: Ac12FXyZmm99FipGMPnPhGzlT7tlbKyfxwlUr8RD3z4V1vxu7PoX_X4yAfDEgUg
Message-ID: <CAGb2v67Pu7CTJx3K=3CVSbQ9mNB-4Vrq+iaA+hUWtxdwS2aD0Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: sunxi: a523: Enable Mali GPU
To: Andre Przywara <andre.przywara@arm.com>
Cc: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_044353_159424_6C89D4D9 
X-CRM114-Status: GOOD (  22.12  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 8, 2025 at 7:46=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Sun,  6 Jul 2025 10:56:21 +0800
> iuncuim <iuncuim@gmail.com> wrote:
>
> > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> >
> > This patch adds gpu support on devices with a523 processor. Since there=
 is
> > no support for image output yet, the gpu is disabled after boot up.
> >
> > $ dmesg | grep panfrost
> > [    3.826968] panfrost 1800000.gpu: clock rate =3D 432000000
> > [    3.832305] panfrost 1800000.gpu: bus_clock rate =3D 200000000
> > [    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor=
 0x1
> >                status 0x0
> > [    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issue=
s:
> >                00000001,80000400
> > [    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x0=
0000000
> >                Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> > [    3.866011] panfrost 1800000.gpu: shader_present=3D0x1 l2_present=3D=
0x1
> > [    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on mino=
r 0
>
> So what confidence do we have that this really works, apart from these
> successful initialisation messages? Has this been shown to work with
> some (yet-out-of-tree) DRM patches, to produce 3D rendered output? I
> wonder if we should wait with upstreaming until we can really test this
> on some kind of screen.

I ran glmark2-es2-drm using vkms, and it seemed to run correctly.
The GPU job interrupt was triggering frequently, and the GPU mmu
interrupt was triggered twice for each run. This was with Mesa
25.0.2 from Debian bookworm backports.

So this is sort of

Tested-by: Chen-Yu Tsai <wens@csie.org>

If anyone has some idea about how to capture the output, I can give that
a try.

> Cheers,
> Andre
>
> >
> > Tested on x96qproplus and walnutpi 2b devices.
> >
> > Based on v6.16-rc4 with patches:
> > https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org
> > https://lore.kernel.org/linux-sunxi/20250628161608.3072968-1-wens@kerne=
l.org
> > https://lore.kernel.org/linux-sunxi/20250627152918.2606728-1-wens@kerne=
l.org/
> >
> >
> > iuncuim (2):
> >   arm64: dts: allwinner: a523: add Mali GPU node
> >   arm64: dts: allwinner: a523: enable Mali GPU for all boards
> >
> >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi    | 15 +++++++++++++++
> >  .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  |  5 +++++
> >  .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts   |  5 +++++
> >  .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  |  5 +++++
> >  .../dts/allwinner/sun55i-t527-orangepi-4a.dts     |  5 +++++
> >  5 files changed, 35 insertions(+)
> >
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A13C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dFhZqVXlPw7AKqdGyCXcF9/T5J+z7jeRJ0PFE89kgg=; b=zgmTH/Apdrdw2KrVJyuPTSt7u4
	+hS+z0xf6ZmRJoCXT1/Az7XWqvxcK9sJmW8kUbednIPBaS2p8Y/OYIFRXBmM3kTqc3SedgdDIzbmq
	bkl1eXJX5LrDmX2cA7y77zH4zN8Owxb7jE0Wvtftau1pDmlOxPDuN0gmSGDDkYIzXFCSOc068LeXz
	MVT2LBXHc8G+b03cS8F6nhZ8aBzBl603+HX4a3ap5gt3cxEq2ksg2FvSdVM6T8zOKfGkK3SLtwJML
	LZsq4301I6z7y2xM2SRA/1Iae8jiMn2lD1XEIIRHXoIAmR1BWmlfSJreewxGw86MfkoBYQWxrC0ET
	4ayT7FkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesZx-00000001N6v-3BAT;
	Wed, 01 Jul 2026 10:54:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesZw-00000001N6G-3ASo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:54:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BF9E44051
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 10:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4011F01561
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 10:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903244;
	bh=3dFhZqVXlPw7AKqdGyCXcF9/T5J+z7jeRJ0PFE89kgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jj9yNpcE4V6NcdQD4g05CJvWOH6GRskIlx3Mmm69xy5BxwxpnrT5BqC0gHnRaUFyt
	 O23edhYADsdZPU+HZKUrz/oCTTvue+X/Sp2hJmpFu2roFbszryTFSeR5HMka7v15M0
	 piz/7BCnE+I5rarI7mx8TRbeX572MZy+4DIlZ/RUU66TBUrN+Iq/kEMOXU8miLkKR/
	 QaT0LjyVP4y6A2O8sI1q6SOw1xZHoV69d7p4H5xqnwLeHBVh4QgicvGaOohR+OLjXv
	 72+VPyRgVlGIGtnMYgbqhMcUS4kG1TMB0E3Vyt8d/L1Qp43iVzWVF/2cfTSmxugvBM
	 17ZM8I8DSAy/A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aebfa21c62so511432e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 03:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrvv042JM2vYXynfmD4UBP3AtdlAvLjQ7tIs4jdb4dGNZtFZiCSKI41RkBTzp/sT9ShBIG13DXwLxhKKrx5P5ah@lists.infradead.org
X-Gm-Message-State: AOJu0YxQjW7gyjjSTtGJ3XQU6fxr4Uo3z1jISiFD0puOO42muFKYOBqE
	cE3u40boO3fqmumyIjnLykz4VAnj0bkFhsUlSJACU3lSKoKzHpTwr/dbKJNObPnVGCuCA42E6in
	59zQENQTz4jIhWuo39wJ2WjC7WGLTZkw=
X-Received: by 2002:a05:6512:1043:b0:5ad:67d6:a2d9 with SMTP id
 2adb3069b0e04-5aec68b453fmr281719e87.39.1782903242946; Wed, 01 Jul 2026
 03:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-2-manikandan.m@microchip.com> <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
 <DJN3HIIAY4LE.3MXU9Q2YFSCJJ@walle.cc>
In-Reply-To: <DJN3HIIAY4LE.3MXU9Q2YFSCJJ@walle.cc>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 12:53:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLntmnwU3gAQfDn2nd4CQ_7HY6S_kBguVtZvVT1PktFCPw@mail.gmail.com>
X-Gm-Features: AVVi8Ce_77SqNNQU5uO1pZpVOGBbpgsRt39tcDkp1nPUZH97o9So0gRgVCLSXDs
Message-ID: <CAD++jLntmnwU3gAQfDn2nd4CQ_7HY6S_kBguVtZvVT1PktFCPw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP to
 be exposed via NVMEM
To: Michael Walle <michael@walle.cc>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, 
	takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 1, 2026 at 10:34=E2=80=AFAM Michael Walle <michael@walle.cc> wr=
ote:

> If I'm correct, this is the old style, see commit bd912c991d2e
> ("dt-bindings: nvmem: layouts: add fixed-layout"). So it should
> eventually look like:
>
> sfdp {
>      compatible =3D "jedec,sfdp";
(...)
> Also I'm not sure if we really need to add the "nvmem-cells" here.
> IIRC in MTD it was there to tell a driver to add an nvmem device to
> an already existing compatible/node.
>
> Apart from the MTD case, I've just found qcom,smem-part,yaml which
> has compatible =3D "nvmem-cells".

You're right, I was using old information, discard my comments...
Reviewed-by: Linus Walleij <linusw@kernel.org>

I think my comment in the driver to check for the compatible
instead of the node name is still valid though.

Yours,
Linus Walleij


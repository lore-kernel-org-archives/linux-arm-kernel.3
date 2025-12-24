Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A40DE7848C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 20:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reVInIdMduwvsNqyxsFsQCEAkTMQMHRaJrNWnF9+57g=; b=BUlzpnF6czTAZz4YTHy4ZSf4Uj
	robl8H9vhoSFkwTbwY/cnuNDR2L58AhImqqHEoMVRSa9Z3hKCWoyuYnwiyI4tQbrZosYZDIkUYMdw
	GdEpNuV//1Nd+AjYpMoeAkbWlSnNBBpyHiKPefoeg92UwphYswn+F81uO0p9NyIRLjhlTTW9A2Znc
	STEGpaTKLMNyXKZtdCUSjSOM9zE4xFL0oGOayzv3KsOJummgEOVGrjAHL7312TMPNC56yTgsj4Ccc
	3MhXMRG4OGgtBYQ9Jrkeefo70pDdhtw5iAugGok5c+0wv2klZH5JG8YvMrq++nK8fOM528QDCUP3D
	QS7da/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYVv3-0000000HPAe-07Ic;
	Wed, 24 Dec 2025 20:57:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYVv2-0000000HPAU-02Vd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 20:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BDCC60010
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 20:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B3FC19422
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766609834;
	bh=rR+IqKZV2+yEt+beuh5Eb/n8EB8pgnm3N+CFdB1tJLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B74IU/gSHmJH1Hmz057c/bhb4otoef4wtVCACPubrkCkgNDQzf5trsmEIM9UBYFyV
	 4Ub75f5XorN/9zHbW3BWGl1H6ghaFfsIrVjcCpmFOqaw6Tw7PwsESmqKZCBnS0waIW
	 5j2wbwGJMa0XeOLcO+OyUWQhKedRwCquv56WsdTKq9ORQXoG33N0AV7qD67hlKaSBu
	 WWPV+qdw7ny8M6s3dLClw+tEn8jHVA0MvrY33up1m7RudinlqRobaG3/SKAtGLtwNX
	 AKlnp4BVwQEO9M0DzRN18I+5zn0+svenyYazmNS0Y7v/o8Kgbp1Q5rGZud+F03BeWW
	 kRsg+5R9f+4iw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fb6c7874cso52343397b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:57:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrIoFCwxdp4gqGF+79RC9pkvH2LIXgiYnJP9pd0yvJOJ0rElRR0zsFNeQbwFSKeZsPJ+Tp6qHfMSiCRpzhZoCR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw47r4ClNTHb3lCic1zNAf/06HjcSVmo5oEoxrOYOuCbA/CSjku
	e/v35l2D0RfWfk0CPW2PwXg+B/X9RxzW7/JiTe3tE3kphVtJGz5lYJLhIBc3zoHkDDlfIAXXIb0
	A9zLN+cJ0GOubMRJsvPRLQTr+DGsuimY=
X-Google-Smtp-Source: AGHT+IHEpiYtEfh5uCgFo5PCRn5oYZ4PTGqB7Q7v0KfaxIHEA9IkOH/CVczmtklVCspfrNJwswMetaEUvQ9VmbcEId4=
X-Received: by 2002:a05:690c:3613:b0:78f:f329:db93 with SMTP id
 00721157ae682-790077109cdmr18280407b3.41.1766609833858; Wed, 24 Dec 2025
 12:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20251204164228.113587-1-visitorckw@gmail.com>
In-Reply-To: <20251204164228.113587-1-visitorckw@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 24 Dec 2025 21:57:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLneTBUyMDod_fbJbuy2Y4errGQpWM3H8uVdYbKZeUNEAw@mail.gmail.com>
X-Gm-Features: AQt7F2qA9XRNnTNTTvbjP3rZWDA-LIjuIfAQFySfGMJgCMAL1iMtQNPxxzDQBZg
Message-ID: <CAD++jLneTBUyMDod_fbJbuy2Y4errGQpWM3H8uVdYbKZeUNEAw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: integrator: Fix DMA ranges mismatch warning on IM-PD1
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, arnd@arndb.de, jserv@ccns.ncku.edu.tw, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Thu, Dec 4, 2025 at 5:42=E2=80=AFPM Kuan-Wei Chiu <visitorckw@gmail.com>=
 wrote:

> When compiling the device tree for the Integrator/AP with IM-PD1, the
> following warning is observed regarding the display controller node:
>
> arch/arm/boot/dts/arm/integratorap-im-pd1.dts:251.3-14: Warning
> (dma_ranges_format):
> /bus@c0000000/bus@c0000000/display@1000000:dma-ranges: empty
> "dma-ranges" property but its #address-cells (2) differs from
> /bus@c0000000/bus@c0000000 (1)
>
> The display node specifies an empty "dma-ranges" property, intended to
> describe a 1:1 identity mapping. However, the node lacks explicit
> "#address-cells" and "#size-cells" properties.

(...)
> +++ b/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
> @@ -248,6 +248,8 @@ display@1000000 {
>                 /* 640x480 16bpp @ 25.175MHz is 36827428 bytes/s */
>                 max-memory-bandwidth =3D <40000000>;
>                 memory-region =3D <&impd1_ram>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
>                 dma-ranges;
>
>                 port@0 {

This is for the *port* node and not for the
stuff mentioned in the commit message, but the port is:

                port@0 {
                        #address-cells =3D <1>;
                        #size-cells =3D <0>;

                        clcd_pads_vga_dac: endpoint@0 {
                                reg =3D <0>;
                                remote-endpoint =3D <&vga_bridge_in>;
                                arm,pl11x,tft-r0g0b0-pads =3D <0 8 16>;
                        };
                };

Devoid of any reg, so who cares?

Probably the empty dma-ranges should just be deleted again, it is
pointless for the port.

Yours,
Linus Walleij


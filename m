Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F7CCF45C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7W1FZWjhLboCJua5R2zixCW0/UQr3ue6UubZA55l0CI=; b=xKDqhsuF1ywgjSS7eDnR8DE+Ch
	q50vNNi3uxgpKE1Z/NfKQXsXjWkZTk6scSUX5TfgwuR+kKE5s0a/LQkoOxOQRVHo7Z+FCVanG3UBB
	q94pQwGFJCV0ZJo8U2K3YLXv9pG2G1XSty8DVLdtVwHmLnZL4GTtxYmnCiRxe11XT03PP5Ghc+DuW
	Q4Nc6oLGDrZ+ImEDwP99nMHUdYBRGIMf615kfgpM4pqYDqOXGV+llmzJ4PFw0B4sCEz6RfNMX+66e
	abTkSxYZ03njvSmOQLdip2gIX/LBZkYfgLOew64oUSdXknHafqlQkgJ5w0shxrH0vCuTZp5xv5ftO
	vsnRzR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMM8-00000005uiG-2eKL;
	Mon, 12 Jan 2026 18:09:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMM5-00000005uhF-1AyN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 18:09:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E0FB42BA1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 18:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD3CC16AAE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 18:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768241368;
	bh=mhixNK8lHUjegBa385fwvTFBsDtFeR8hvKlCRxJ9cMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IsHC/MNw5Kbwk7exiZ8wgOqCZo+QuDBew9GugLZR5L/4fw9UPRm8p2WIVs1QjYt7N
	 DZU2+JAvqXdifGwlpEUAIok8U89yAL69c+NWtBXvA6JpgEWerYG2qdRp9McRoFvrNY
	 hxNjG2eF7FTw47/LiEsPLgNSP7l1cQFTNYGfwGOiB170VMJZf14BnfJv5DcKr+P5w6
	 QCePoTvsFBoVhZ3jeGTn6KJlkaVTWouuNatxs5WVrCEBmArGLy5Y5dzyhlb7Gzyj7s
	 cHCdgTE6GcAbJdfvvZBIciWmIoC0MU1ypwNR6dWUmWbKRM5ESj6TROAv1G28eHoz7b
	 MEEdoNdb+6A8Q==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so13111375a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 10:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXtGll949ehX/FXR5fFgWxDnHwlRpUNRf5mM59kwHfroRw2nAZ8itQvk3PT51qQBQ0Zn4UpT8EMg8eprqm5YPD@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz4jLjdCihaq4Luin2pmIjOfFVq0X1LOtsClQr6auJt3vV/D4t
	JykFJBACIPGzUmZZdZEd8EzKm61KX1PPXS9fwRUvS7a8ofNr+qRtqRscyNo53ayonjwTBj/OjOw
	xxSf4NHp1EC4gfgN6pLVeqc0P39R0wA==
X-Google-Smtp-Source: AGHT+IG5xcKR7v4cX8GZZCxRqqj4tQDG/nJdB3WUDW/MrkeY66RSUIccQFsDV7uCNUFFhk++0NMnKzp1y2ffQS7au7Q=
X-Received: by 2002:a17:906:ef0d:b0:b80:3346:496 with SMTP id
 a640c23a62f3a-b8444f61b72mr1837030866b.42.1768241366844; Mon, 12 Jan 2026
 10:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
 <CGME20260109120137eucas1p221b9dd341c2319c0f9d0da1fbd48d1b3@eucas1p2.samsung.com>
 <20260106-dt-dtbs-broadcom-fixes-v1-2-ba45874e4553@kernel.org> <e98ad883-7ba2-417b-8cd3-19f5f863b03d@samsung.com>
In-Reply-To: <e98ad883-7ba2-417b-8cd3-19f5f863b03d@samsung.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 Jan 2026 12:09:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKNKCOWj_eSTtDwsex3pUhgc+7QwAwLZn4MWVzOkOOHcg@mail.gmail.com>
X-Gm-Features: AZwV_QjocnkRXAoPVNdU9kvYmv1w2H2D-xJ5BkaNLSfLGbUqcsTJiUivNFh6LKc
Message-ID: <CAL_JsqKNKCOWj_eSTtDwsex3pUhgc+7QwAwLZn4MWVzOkOOHcg@mail.gmail.com>
Subject: Re: [PATCH 02/13] ARM: dts: broadcom: bcm2835-rpi: Move non
 simple-bus nodes to root level
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_100929_350411_DB3094EA 
X-CRM114-Status: GOOD (  21.29  )
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

On Fri, Jan 9, 2026 at 6:01=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 07.01.2026 03:09, Rob Herring (Arm) wrote:
> > The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not=
 be
> > under a 'simple-bus'. Additionally, the "raspberrypi,bcm2835-power" nod=
e
> > is part of the firmware, so move it under the /firmware node.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> This breaks operation of all drivers under the firmware node. I'm not
> exactly sure why, but they are not properly instantiated. It must be
> something specific to "firmware" name, but I didn't dig enough to find
> exactly where and why.
>
> After changing the "/firmware" node name "xfirmware" everything works aga=
in:
>
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
> b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
> index 9ab70b519a63..464f032ccb71 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
> @@ -1,7 +1,7 @@
>   #include <dt-bindings/power/raspberrypi-power.h>
>
>   / {
> -       firmware: firmware {
> +       firmware: xfirmware {
>                  compatible =3D "raspberrypi,bcm2835-firmware", "simple-m=
fd";
>                  mboxes =3D <&mailbox>;
>
>
> Same issue occurs with bcm2712 change (patch 3/13).

The issue is how /firmware is handled in drivers/of/platform.c and it
doesn't create a device for the /firmware node. I think the fix here
is /firmware needs to be just a container node and move
"raspberrypi,bcm2835-firmware" down a level. That also allows for
different types of firmware such as a TEE or SCMI should those or
something similar ever be needed.

I'll see if I can get kernelci to test that change. I don't think my
branch boots all boards though...

Rob


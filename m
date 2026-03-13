Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8C1105F785
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlE92pMBDxcqf7pEJi1EWDiZ3PurhMMxo1VeKrJwWqs=; b=N+c2mzGltRs3nRFP7NF58/Ljpa
	SUavu51u3XtiH6Q3eRZORdWzUJNBRUVyooKpl8eOgBJFuBB9By201mYww+k5Tk+XhY+hC4bTWC3og
	YKmFz/L9Oj14QQF5bsALabJuG8M6xSZvpqQwM7Js6Oj8+eKxWz+eJ27lGxC6jG8UQ6WqhceP3/2DD
	vfvB11Ae390IrmN78WMFkl8DFpCoFShJDrLpEUq4aQ+f7dWSehH0ptsvXxxzpwUUsOI3t8tJNVEbh
	QI8YHDNL9J8mx5fvzpv9UwhW7XO5IR7vAoblRTEmhxaPKWnxXf0ewFUJ7wHeCaWgToF5QqJpldN8M
	sY9zgKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z06-0000000HPKn-30OC;
	Fri, 13 Mar 2026 09:40:10 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z04-0000000HPJs-0mei
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:40:09 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8cd751a4e93so108118185a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773394806; cv=none;
        d=google.com; s=arc-20240605;
        b=D97KpykyDsBCil33H0/A/Jet1ls6vv69qblpX+5GsnFixo6e+ikUe/vGSmF5wHkt6l
         0KN0jB1CDhgBIuvjxJclgvxTLi6Rv/Bs3RsD/6Q/VypLjqBLUhd8J1H3Kd0GlcO3wC/c
         le44glHuv1SF4KOdYoGlUmtepd2G+App7tBXvrSBDrPpyXGstpUAyIJZ+P27YDQ0evpd
         lvOWAiLC37MwhVTOvOD3lV8dOscq9hXbBPUVjwn/3r53tFQpVj7OXxMnz/Z2Pq0nGQGw
         wLWPYZtSrwskY29HnSZBfMDAr+Cq4/Yu6WRoOaeqK0uMweQjpROySdQZlXFozBtM7wZN
         SGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dlE92pMBDxcqf7pEJi1EWDiZ3PurhMMxo1VeKrJwWqs=;
        fh=d10mc/bSBxkodGWT3PAHjIW4JZEBEQoQrFp6K/XQDv4=;
        b=lZXIQiGWq/A9UyWGxDKNiWhxm3jbh8JIHehjUoP+4wc4aswdhMDPpEI9SF53C1uVkq
         h1DQZWGcgl4g5y9az7KtRs3G2J18B9BDvYEos41f20mahterFXCNhawbOULdS+aGIYwP
         5WPhpeD3Kc1/z6ewacPRTV7jjGPlMSH/glK/ZzY1YrRpHNyeFJp5OQDOQ3AQLGvaEbvx
         iv16JFUr53FS1kTyeQnba7SkDzUPRU9opwOq2cim+MPXOOD2PXug0JYQwVS5q2E4clkA
         JAszOthdMcaSmA6CNJhnOsKqoDZplf2qtysW86bJhiAOaAjCNYCjecmCwOgbrtGr7OBC
         K5FQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773394806; x=1773999606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlE92pMBDxcqf7pEJi1EWDiZ3PurhMMxo1VeKrJwWqs=;
        b=T6k00z/lYMWFW0AVnwAceEWvNmDFDRfZmdMhgl4yMDnv/H5MgeAEj0caO7uy3KB1UW
         Fd+5KPLRP2yTDbzk0Q+saiczVS+zxW/M+jURB++ZqOaJcd3M5s54yhXoXqdSHTnQzRof
         thpqOrs83zMztNaMBUsm/b8WzEf38zydyhYKxPHYECUWvyyeMFRgwf3ssrlEf7Sn2eoZ
         FCUWhhALxERh+vrkRFFokXgXdfxGS0zqPFL2g8H1pl7Aw0twZtBETA7cfAOx1Vk4TQmz
         FegPFMg+w3209aur1mAEjXHAfnGt/hPLrysWJlg1i/siCUguarWqE9jMEGO9vmNd8m2n
         WgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394806; x=1773999606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dlE92pMBDxcqf7pEJi1EWDiZ3PurhMMxo1VeKrJwWqs=;
        b=W0PuyzJomTq730Ftyz58w4xn4bejpeEDCL6qh/E/arqJvF/tAHbt8OEdYVQYEtM5zM
         GNZ8UsA/2DqDelHl9TpdGKmsxRi6rcs+IFqv7pff/531ZmEV2FRQh8tqzpv+LH+aDLZN
         QiXY5e60Cxt0oERzeCN2ya9/HGS2Jy02NVDwygicu15lkRo6pUuj3KZtUQQ+S1w7gA6u
         CDanFhWxSEMG2da/CMVeYgskCJjSlwsNCq7LCAYdbYvh2Xw4QpMMZPvdrWX2yKwBxquY
         Hfn7xTbH0hVRz6fglqxGClx/GTK411k+4FBdQ16C6vBFSzu2TbDZXUfM+zRwv455OPlj
         5wMg==
X-Forwarded-Encrypted: i=1; AJvYcCVjN/3rgHKWfTh1Tz8nEjMsA/7GeBZ2/+fcY6ScnGuOUqCH1n5M5CVvTMHQCRLX3pk/txGlI6ZS47HSgJWqqPdM@lists.infradead.org
X-Gm-Message-State: AOJu0YwJkhnWfVpRkUiCbDeg9e3AE11CLCVety23NhlqX/Xv/9tjJJqJ
	OagTR0v5nJ5RbuHSLGDnvA/RwyTHa/gKFaEd/m1eXaLZHsm71KrF/qza1MKV3hael4u3RCHckac
	McVNDmlClOhtbn6uTzGcBrA3LnUvWmV/GcY6d
X-Gm-Gg: ATEYQzzOvj73VuOnICrwVyYPHcd9N9pPm4NoYvbyJSXonY8PiW7hCdqZa/CIQzxH/JK
	pQLXu9Q9Uxsx51YZz8qmoFjvSLjIjIo9/ifMRydvu04XQjeWwvcfn1q0L+YJrbse3MPsDLlVacA
	XonrMFoYHE+KP5u8Wg6r2Sr77M8y1tjQlnxakRB6saDXOAhBz7KVy8DkeZSIdUmZXLmiwxg+qs+
	ZNWljFScrlrtP45RsANIfjuMPRWctnTs7Oo/s1d+BDFBhQ1mtbszTlrhrsw/Z+iSklhDZ26F4bE
	RvTgmbbRbVj86bAIwsJyJRQiJXpdmgzPjw==
X-Received: by 2002:a05:620a:690d:b0:8cd:8f18:d1c4 with SMTP id
 af79cd13be357-8cdb5b3203amr295554085a.56.1773394806425; Fri, 13 Mar 2026
 02:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260305185116.781184-1-akkun11.open@gmail.com> <20260305185116.781184-3-akkun11.open@gmail.com>
In-Reply-To: <20260305185116.781184-3-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 13 Mar 2026 18:39:54 +0900
X-Gm-Features: AaiRm513Z0tfTZUa8grZ-svVd-KIsw6SByNnlN-BN7-Nvit_VHPm6CosTcm2fXM
Message-ID: <CAKr_iV7GRaiXp8VFVEAo8VHoPQzcD6Z=Av38R6_fAs5t7aQkDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: mediatek: mt6589: add basic support for
 Lenovo B8000-F
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_024008_245309_F9A8B06F 
X-CRM114-Status: GOOD (  21.34  )
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

On Fri, Mar 6, 2026 at 3:51=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail.=
com> wrote:
>
> Lenovo YOGA Tablet 10 (Wi-Fi) - B8000-F is a tablet which belongs
> to the "blade" product family. It is powered by MT8125 SoC,
> which is the tablet version of MediaTek MT6589, and has 1GB RAM.
>
> Like other devices in the "blade" family, it uses a framebuffer
> initialized by the bootloader at a consistent memory address and size.
> This patch adds basic support including UART and simple-framebuffer.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  arch/arm/boot/dts/mediatek/Makefile           |  1 +
>  .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 15 ++++++++
>  .../dts/mediatek/mt6589-lenovo-blade.dtsi     | 37 +++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
>  create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
>
> diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/medi=
atek/Makefile
> index 37c4cded0eae..b67b94b7cbd0 100644
> --- a/arch/arm/boot/dts/mediatek/Makefile
> +++ b/arch/arm/boot/dts/mediatek/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D \
>         mt6582-prestigio-pmt5008-3g.dtb \
>         mt6589-aquaris5.dtb \
>         mt6589-fairphone-fp1.dtb \
> +       mt6589-lenovo-b8000-f.dtb \
>         mt6592-evb.dtb \
>         mt7623a-rfb-emmc.dtb \
>         mt7623a-rfb-nand.dtb \
> diff --git a/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts b/arch/=
arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
> new file mode 100644
> index 000000000000..47bb6ab1fe72
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
> + */
> +
> +#include "mt6589-lenovo-blade.dtsi"
> +
> +/ {
> +       model =3D "Lenovo YOGA Tablet 10 (Wi-Fi)";
> +       compatible =3D "lenovo,b8000-f", "mediatek,mt6589";
> +};
> +
> +&uart0 {
> +       status =3D "okay";
> +};
> diff --git a/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi b/arch/a=
rm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
> new file mode 100644
> index 000000000000..3a6e0d8c8a64
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "mt6589.dtsi"
> +
> +/ {
> +       chosen {
> +               framebuffer0: framebuffer@bf600000 {
> +                       compatible =3D "simple-framebuffer";
> +                       memory-region =3D <&framebuffer_reserved>;
> +                       width =3D <1280>;
> +                       height =3D <800>;
> +                       stride =3D <(1280 * 2)>;
> +                       format =3D "r5g6b5";
> +               };
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x40000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +
> +               ranges;
> +
> +               framebuffer_reserved: memory@bf600000{
> +                       reg =3D <0xbf600000 0xa00000>;
> +                       no-map;
> +               };
> +       };
> +};
> --
> 2.52.0
>

Hi,

Please ignore this patch for now.

I found that the panel on the Lenovo YOGA Tablet 8 is 800x1200,
which is incompatible with the current simple-framebuffer configuration.

I will fix the Device Tree in v3.

Best regards,
Akari Tsuyukusa


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FDFD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 17:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUy9/tMpZEG+dMBQoKUGEIkUyG26fQzLzLoG5fd72og=; b=yx1LyRJ9KYt9eEEet3zJEXVU8N
	kp48ApPkbFWM86kyIVO11j/dodlTqI80phHbyIiog5/Z0B7xwX9GSaTznGsm72GJJYzbdFH8KT+pf
	F3re01mLjxoJXU+FpRJUUfbLVqQaMTgQtAlG/VvAZROyx9ozGmTeuoqKmNzAZlnNXKcZ2mE/ZJk+A
	6VAMFQfGKo3hLdDVuFpAFUNRJlaFeuMIAswiwBH2B6cEgSfQ3Rp2fW9BF9gGJEjpCQlJ7JIY3rbEo
	9zmw52QKQlL+qtxtLpp3o/VSPdWvpJHzKQ7C6Hdp8wQdDAMYHYMliGw4qLAfCHQ3W2q09q4hOPTli
	K9b6A8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7o3-00000004Mea-0PHX;
	Mon, 01 Dec 2025 17:35:23 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7nz-00000004Mdh-39VV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 17:35:21 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b2f2c5ec36so449575885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764610518; x=1765215318; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUy9/tMpZEG+dMBQoKUGEIkUyG26fQzLzLoG5fd72og=;
        b=czPi0kAaJZh70/R+gx8/sBoB/B2mBxDIa+YguRX5nCPJMqTq0ndpc0+qrLnJVtKjG1
         LrNd6YejSI2gxHsAAS2jbuWs9a2f0xWhLuJDQ2qLgEv7H5bj5Ch9mQ/o1RKm02PgeVSL
         AcdtuxtLFgiXa/P3/XQjer5I5RZPwAcfZrzLd2wL2IBzjqWJ0KhNR/GC/kwh+uCj+ZTK
         Pszi2v11fpwweu7DFZirYI4rwkQ+AdaRJpwtKUyh9kiYpELTqVP/ysFTQQes1mAMPKh3
         TOhwTQnJegx/3SKpNK7kU580wA86i/YuAdHTw5NQJZUPeSye2BZIAszCy/WY4rbe6Kv+
         zv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764610518; x=1765215318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HUy9/tMpZEG+dMBQoKUGEIkUyG26fQzLzLoG5fd72og=;
        b=GK2OdcZA6xdPUVmzNCccxUCIY0AUbvjGNocGJosHKtk/GaklJUU7Mopl+aFDJaLfIE
         xESFwcST6eSj8vsKXKL4PPpijs/xNGtVf/5ETFsdSkGFovI+yoLzYTU5sMX6isKJiTWb
         E8tM/exfMccYe2KLCXWsCr2J+G7m3ItpdWc7qYEEmEHP0RQr+/b0ELwqmfBQjL5nuhbN
         944ziLkl1USzJSeytiUO1gHrN+f7yJuS2nomyD8+jbmA9Rka+IKII9dXSpsZ/QYEY7Mh
         uAFpet3004/Sx31QIxm0oIoGRQNNgvlGhw9onNqhVZvkkwMqtrHIPmY0kO63radVpwoT
         bIHg==
X-Forwarded-Encrypted: i=1; AJvYcCX6lcmHpO15Kzz7p4YiGFnR7Xv04lx/zIvYPa57lpCRUGSQGcAYU1geSCqW67ofINj/0Y/fOvKSzWKgvV6JAbGl@lists.infradead.org
X-Gm-Message-State: AOJu0YziM6fDi977uOZtiCeQgcdjUGuQrt5xVILocAc5UupVWan4t9HD
	17R6nFIYAenainZg8u2Hy8oLnkX0OiuVP8PUOoc1VJ9TRuup9VZc+v/ObvIFdGGx27zRMNnPygn
	goaxL5Tyh222hwB86NVTV4m7mgvaKjzc=
X-Gm-Gg: ASbGncu42gS+X/n65YSEkxtILOTcB6PSyWAU67p3pBQTBlDmW507Ddfv7S+PA52I+/6
	P4UtZyJ/SmFhzrwmFwRFZT7BWM5qZft7Io3Hq72/OdF08CJiekmCPTSGlyX2AowTAtrM4QKD7l2
	nezGJtKJyp9wg+UYxl0ca9tNAtX9Am5ikzhSdKW25EmC1ODI4J6rWgkQyNDBVcrh9e+GYYbbHi/
	g2jABr3Uaak7A6cgbjlj8z0bXXD/5ZZ+cKgpFs59QF0sTgD9w92S9UHcCbIuA3lnX1ksh42CkWP
	SESfG2aaSlC8DJaSAVR3JVo9iWKHnThfgcyuTWs=
X-Google-Smtp-Source: AGHT+IG9z48YMtq1Hoc/6GZ1Q2125xNYsRwXEceD8NyRrDRi12uj4aXH0Nvq70m/GP3MOT/fvQpHE0zCpZJfWXVma+M=
X-Received: by 2002:a05:620a:1a25:b0:8b1:f2cd:76ad with SMTP id
 af79cd13be357-8b33d5ffadamr5603990885a.89.1764610518305; Mon, 01 Dec 2025
 09:35:18 -0800 (PST)
MIME-Version: 1.0
References: <20251201-evb1-pcie1-v1-1-c62bba5c1167@gmail.com>
In-Reply-To: <20251201-evb1-pcie1-v1-1-c62bba5c1167@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 1 Dec 2025 21:35:07 +0400
X-Gm-Features: AWmQ_bkh-_4MrBD8Z1igFWdl8lWvuEpvTQY628KgzrJmFFeIaNlOE_zlYPP9A-Y
Message-ID: <CABjd4YxiOsw0_vR=igLhGkXUp4kSfx_eWv6j=FrsX-qo5sR2hw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add overlay for the PCIe slot on
 RK3576 EVB1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_093519_804066_9582014C 
X-CRM114-Status: GOOD (  18.25  )
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

On Mon, Dec 1, 2025 at 4:37=E2=80=AFPM Alexey Charkov <alchark@gmail.com> w=
rote:
>
> Rockchip RK3576 EVB1 has an onboard PCIe slot (PCIe 2.1, x4 mechanically,
> x1 electrically), but it shares pins and PHY with the only USB3 Type-A
> port.
>
> There is a physical switch next to the slot to transfer respective pins
> connection from the USB3 port to the PCIe slot, but apart from flipping
> the switch one must also disable the USB3 host controller to prevent it
> from claiming the PHY before the PCIe slot can become usable.
>
> Add an overlay to disable the USB3 host port and instead enable the
> PCIe slot, along with its pin configs. The physical switch must still be
> flipped to the "ON - PCIe1" position for this to work.
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |  4 +++
>  .../boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso   | 31 ++++++++++++++++=
++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index ad684e3831bc..63198a618a2b 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -252,6 +252,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-armsom-sige5=
-v1.2-wifibt.dtb
>  rk3576-armsom-sige5-v1.2-wifibt-dtbs :=3D rk3576-armsom-sige5.dtb \
>         rk3576-armsom-sige5-v1.2-wifibt.dtbo
>
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb1-v10-pcie1.dtb
> +rk3576-evb1-v10-pcie1-dtbs :=3D rk3576-evb1-v10.dtb \
> +       rk3576-evb1-v10-pcie1.dtbo

Missed the separate .dtbo target. Will amend in v2. Should have
something like this further up in the Makefile:
dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-evb1-v10-pcie1.dtbo

Best regards,
Alexey


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91713C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2H82D3ceyz7r5Ot6awJCahu6BBXmvQb/jfXpvl9UcwY=; b=SJPvEgXVdbDzaX1ithegHLH4+v
	A9LdhYffAlE+EoC+vzTZXotD6WgX+orJShByVybqmoxGaRPeLXk9S6y5Lfuw5LZRz+yv11EnQBBWV
	JS218eluhsPSZk0lqTAfjRSwr5hi5jtw4kEowDexh/m8lGPvc67BFfAKmy9+/w5MOFdGv9o8en0YY
	QakUB2fI2nqQsY84wfOVVcmkk5QPKF1Gi0q1WHTxrJ19qfzywQVV31KVKIEbwl5GGyGyw8chWVSTH
	Z6vRRMSodTmJqywX74L0eW4gaUNY9mDdFh9g3A2wifjISogArOTEsCM6I3H3DZ9A3N20jcKzCd8cy
	QBvZSRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fHK-0000000BYNS-3pZx;
	Fri, 04 Apr 2025 11:32:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fBC-0000000BXWJ-3c0I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:25:48 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-301c4850194so1512069a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743765946; x=1744370746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2H82D3ceyz7r5Ot6awJCahu6BBXmvQb/jfXpvl9UcwY=;
        b=bWRvIKeaL5Q/XwhtlDe/zdVGl0uN+OtFflq1qfflgEqyDUKWIL09vOgoUiGYIVgt6X
         wl+U5SBD5Wxz8ACZf7jgX886LaOUtuQYmAML1VRzYg1+iV80vnfICUowgY0vdjYEqaNL
         ayAFpJU0h8P8kJfTSciB9436Yvp2/P2r9trCksUHXooGRuUpT3KLelq4ZY6R2b7OrtNX
         3zoN95jXxNg3lfB1bwa3Sd1JvnBvNuBQ4erBEoTgN45GMMbLV2x4JzOig5UAmxAYRbKO
         pdghOV5n6gQWAGH3iARzaBkNqCeFhLnGrPohM7HrQlAgEu7bFoZQGZmBK3xOSaaT3qsS
         I4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765946; x=1744370746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2H82D3ceyz7r5Ot6awJCahu6BBXmvQb/jfXpvl9UcwY=;
        b=fYKeyuBOo5dhrb8ntHfuS9WKFCsCd3dQ4DYRqwH+bSNzHoDDCAlJmN76U0I+t78UvJ
         A2BIQGverUexeOEJhUtJmP9e/RcvTpEpzZip9g5PWA0J/4fDq2qB4XFCl4O2tl4eRx1E
         0vnDKI4M3X5zLXQlmbiqUDkRJQDDQP5yxO2F33EsK/4QhwRt0j5X2fzzXPhy8Ug2d8JR
         EhIeu+ijLXj+395c/fxqV1VLRRn116A5Zei+/+vKNzQ5LbtrM83HQwfShqyZbEuZhAfq
         X/xP4+HwEwYupMv7e6L5XVUiYH4YDFj4nYFhT/pr0QMPzwBZkMp4CLVYh8HZDiXBtMaY
         f8dw==
X-Forwarded-Encrypted: i=1; AJvYcCWekQwUb4V0snYuCfN3vS2uBL+73As7x4PTXxkuLvhMy6TdJWJGmFI/725FNzEhgg7NqtXBvKfS6Iyj99q+s2Nb@lists.infradead.org
X-Gm-Message-State: AOJu0YxFaouI/P9D9FRm0Q9JYWlu87zYmayHQb/sMA1p9ZU21OwJmKYx
	pGvq8TMA5CoigeUul25mHHg3R0JknUvRvv4oiYofOnkK350ZWhJI+88z9/B7vjqqq9bgkyykxyE
	gbxqyOc86zbr2qoGnxmYWknMl3fg=
X-Gm-Gg: ASbGncu3FENkKx9Hko5uj6MC7sFkXpV2VBiHbU+ustr4K3s4y+Z7ZO5TR4EU2qABXp5
	cUst2ncBdFjnFssfAmeAli7CJiCGdzZomfupmsCwQQ/p9Ee4DdHJnS/CxnPAX2/X/oT8taePkpI
	j91WJAfvojDFws9mWKxunZ8aw=
X-Google-Smtp-Source: AGHT+IHzfIJRZpdeONCKC1hscbpEHgL+eOok3ABpVp7t0jI5xsF+h571shGT73MMq7pH/ucoJCkY3wGkF1YG+WPKcMw=
X-Received: by 2002:a17:90b:5443:b0:2ff:796b:4d05 with SMTP id
 98e67ed59e1d1-306a485edb0mr4690761a91.11.1743765945929; Fri, 04 Apr 2025
 04:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250404105359.18632-1-ivitro@gmail.com> <20250404105359.18632-2-ivitro@gmail.com>
In-Reply-To: <20250404105359.18632-2-ivitro@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 4 Apr 2025 14:27:31 +0300
X-Gm-Features: AQ5f1Jo_vwVCsJBIV6IqomEQgPPhk2OrizKxFzdzrwjdmKaE32nMnNYDWv9ZEsk
Message-ID: <CAEnQRZAkPJJRit7qrxHc4KtaR8Xej9qBZYgYTukWtKM6fwTSnw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: freescale: add Toradex SMARC iMX8MP
To: Vitor Soares <ivitro@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vitor Soares <vitor.soares@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_042546_902376_3A5EECF9 
X-CRM114-Status: GOOD (  13.66  )
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

On Fri, Apr 4, 2025 at 1:56=E2=80=AFPM Vitor Soares <ivitro@gmail.com> wrot=
e:
>
> From: Vitor Soares <vitor.soares@toradex.com>
>
> Add DT support for Toradex SMARC iMX8MP SoM and Toradex SMARC Development
> carrier board.
>
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-im=
x-8m-plus
> Link: https://www.toradex.com/products/carrier-board/smarc-development-bo=
ard-kit
> Co-developed-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |    1 +
>  .../freescale/imx8mp-toradex-smarc-dev.dts    |  297 ++++
>  .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 1288 +++++++++++++++++
>  3 files changed, 1586 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-de=
v.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dt=
si
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index b6d3fe26d621..8106dbeffd3e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -221,6 +221,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw73xx-2x.d=
tb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw74xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw75xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw82xx-2x.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-toradex-smarc-dev.dtb

I think here we should go in alphabetical order. So move this in the
proper place.

>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-verdin-nonwifi-dahlia.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-verdin-nonwifi-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-verdin-nonwifi-ivy.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b=
/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts


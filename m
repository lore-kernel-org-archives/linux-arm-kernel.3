Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8F4CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mmkWJGwagknwnUne8cC0tYcuAk1LVOC00056C6MPbA=; b=2s5W2nqxfxfJQi8l4ZhM06y41l
	fmXqNsWisEF1G08wkO1A84iQem5tVgwqoxF7R5cUPp0rwEp+X6kYu6UrQ/gwU3RcV9IJ3JMVeJf2o
	8Xwc/0HT3x5ShWwkW/7efG736fwfItpmUXkQbHymBqGk8sTDdehrI8VIakx0lRWMSgNKb+B3RsVpT
	lkOT9HCx3Xf2lnI8tRvA/8LvG4S+iTinzNr/Fm8hq5fzqyJax/+5B9esMF32ADqhcNeZGTWrviY7O
	ZGI1nw4pgpA1y5lpv2qe77vzhDAPAP3t/iSJUfQxMEqRkWNRiuKd2pCVIlmFKXvL3Exb7TOynQKtH
	Rq4y48Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYQC-00000004gk4-10Jq;
	Thu, 30 Oct 2025 19:34:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYQA-00000004gjf-03XP;
	Thu, 30 Oct 2025 19:34:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7F234406D;
	Thu, 30 Oct 2025 19:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CFEC4CEF8;
	Thu, 30 Oct 2025 19:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761852893;
	bh=u7izXQ3wPPcYbabEIwH3XaJBThWvY/6UuY2aNLFSoE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYGe84ji/aEwlKP8FLkWS1kZYQr7XE97WFRNJv9vlGVl4+4M/+ZOuUCoSjom2P/Ak
	 QpCKPfFqgqg3Eo0AaQlbYdqQGCpGnO5bCaTFzr6P1Sgcvz+Oz+iFOstzZmMbdckWOZ
	 IHlYw/ZELzO3CyVktJ78dHH/FaRRpSb8UZNo+Y5KYIrAukFGyr214E7bTliAiVC2Xh
	 FEUii2idoB6XqXmzHxRAa2jsNBdRj7FW8zNTFGqsYkZUZ+CHEAPFOFTAxGneQ6hbH9
	 whkMDkhNp0LY1K2QbX4L6hI4fopn5SQw9K4mFgl8ERdE80RMVJkwFx97vOgTbI/+gJ
	 1proj76yVVo1g==
Date: Thu, 30 Oct 2025 19:34:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, srini@kernel.org,
	ukleinek@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org,
	linux@roeck-us.net, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 09/11] arm64: dts: mediatek: Add MT6319 PMIC Support
Message-ID: <20251030-koala-junkie-70fb384ea8fa@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-10-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o9A33WtK87+9N+BC"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-10-jh.hsu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_123454_077894_ACE9229D 
X-CRM114-Status: GOOD (  14.98  )
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


--o9A33WtK87+9N+BC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 09:44:41PM +0800, Jack Hsu wrote:
> Add support for MediaTek MT6319 PMIC IC
>=20
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6319.dtsi | 66 ++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6319.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/mediatek/mt6319.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6319.dtsi
> new file mode 100644
> index 000000000000..8b2386547508
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6319.dtsi
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi {
> +	mt6319_7: mt6319@7 {

Shouldn't this be something like "pmic@" or "regulator@"? mt6319 is not
a type of device. The binding example uses pmic.

--o9A33WtK87+9N+BC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO91QAKCRB4tDGHoIJi
0t6NAP9IS23k9Qe99Xvmhv4pliASX5+mZhV0LmOOxTyFVhscSwD8CfJtc+em4iHf
aav/lefrQodh6kOrOzcbTtDk5DZbEAg=
=V4Y+
-----END PGP SIGNATURE-----

--o9A33WtK87+9N+BC--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA80DCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDdX5ZdoQpabqswvrnbEIPYltl7wajQZHQM9r4I5pkY=; b=t4SrNO17sork461kz/Eoms3asH
	IOBOvV6W0o7VL6x4hMvPkHmjY+3wuBOYyQ5/NCzmnBdvQ/lG9yD/+ptvinh++no721CVkgztyXNnn
	LXJTL4YDwLsyibs03Re8SuVC7WlLzB0vnhEXRFHgn5KSVfqcKsUfBiJmL4j6xOcAflhz9E1rm9wiq
	YihY8D4YZh0BqWHunSuAWvHLH0Hmjt7nmbFlXevnLNIHuBxoOdD18Pnzj3XwAjjHLc5X4RF+Q3DkF
	3NAYbM1JBQ/0G9Pz12XsVSUjqgA+3PdMvT2MLuz2L/wHsOcN8++CHv1lNb4uukJBMgmko9FpeqsgI
	0r1r6kbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYe5-00000004hww-2R1w;
	Thu, 30 Oct 2025 19:49:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYe3-00000004hwM-14JI;
	Thu, 30 Oct 2025 19:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD60C43E1B;
	Thu, 30 Oct 2025 19:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084B2C4CEF8;
	Thu, 30 Oct 2025 19:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761853754;
	bh=lgyDLafQE8DiQDUiJtyJ9+bt7JmcvlRaYp0Kn6urakc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lu/eBFP5oLDumMFhEBp06aze9McYEFE1zeHtLyHf/sA/wPzcnlWHWr09lV/qIkPX+
	 qxMfJ+aT4WdooF22hWKVeSJDTJV6i6+YSHaGVbFY5JHMOo6NHj+iHKqq5W/iibB16l
	 mEoKxOuSC5iS1FlIvtkIDOHLWKl7agqhk3pGa6rzO9pHeNO7cSfhkZvtjJVd1Dr4il
	 LPLVA/244xMmWW93aRCOtXxClp2npsrzYGq1QhADfpsS1Zy60rOiWYHkHWFHOyvZZ7
	 dHpqz/YoHkoaGWp4aMuK6O2/ahC2M4Jtd8mifw4McZg4uUv2C44rNMKg729jbC7gNq
	 aFKX3OVv10sew==
Date: Thu, 30 Oct 2025 19:49:07 +0000
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
Subject: Re: [PATCH v6 00/11] Add mt8189 dts evaluation board and Makefile
Message-ID: <20251030-deodorant-unglazed-190cbfb4a69b@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yaNJtXhYGM5K609h"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-1-jh.hsu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_124915_310955_BAA7B50E 
X-CRM114-Status: GOOD (  13.14  )
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


--yaNJtXhYGM5K609h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 09:44:32PM +0800, Jack Hsu wrote:
> In this patch series,=20
> we add Mediatek MT8189 evaluation board dts, dtsi and Makefile,
> and also related dt-binding documents.
> Jack Hsu (11):
>   dt-bindings: arm: Add compatible for MediaTek MT8189
>   dt-bindings: iio: adc: Support MediaTek MT8189 evb board auxadc
>   dt-bindings: nvmem: Support MediaTek MT8189 evb board efuse
>   dt-bindings: pwm: Support MediaTek MT8189 evb board disp-pwm
>   dt-bindings: serial: Support MediaTek MT8189 evb board uart
>   dt-bindings: timer: Support MediaTek MT8189 evb board timer
>   dt-bindings: usb: Support MediaTek MT8189 evb board xhci
>   dt-bindings: watchdog: Support MediaTek MT8189 evb board wdt

Please drop mention of the evb from all of these commit messages. The
compatible has nothing to do with the evb board, it's going to be common
across all boards using an mt8189.

>   arm64: dts: mediatek: Add MT6319 PMIC Support
>   arm64: dts: mediatek: add properties for MT6359

Wait a minute, what are these two patches even doing in this series in
the first place, when it is otherwise about the mt8189?

>   arm64: dts: mediatek: Add mt8189 evaluation board dts


--yaNJtXhYGM5K609h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQPBMgAKCRB4tDGHoIJi
0lPkAQCRU09Z6yjkHdytWu2mAy2u6tRSvE2qwbIcuk80eZ/k7wD/UgxmnNEGR8HM
8eS3jGJAmBHKHjZ6iiVHXynJ+4bEdwg=
=YIMa
-----END PGP SIGNATURE-----

--yaNJtXhYGM5K609h--


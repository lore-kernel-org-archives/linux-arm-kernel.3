Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713DACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4n7sme1iF4g2hhvf9X/e7qQUJ4ibim25muvzqWoOG3o=; b=1/+fH/WXsFDi0lk0SmUiw/68vE
	eMBmhRNRqP5bU+Zgew7YJKIZq+zqVcw8XUQx7wJB/XCP5dfWITUpK1F3sp7R7HrzFfLdEL59HwLvX
	AET9k5bZJJBKA1+Nk55qQAM4UyXSNB7WHUmbY2h4rfkkSbpt3i9PSv9rMKiWdUtvCgK0BioV2RXpw
	qSYyaWWbKsFP9uivWv3ubS39RQ1s6ZL7hktxcaL/u2E6FkuH7dO31Llu8ifdZ/EoLhHOQe9sbmNkm
	GZbvL8WmTOLWJ8xLuk943G9VuVKwrbOoCT10rlzde2+Xsfsw62H6PJY5OFxr2YMBdGUCSuWQIvB8j
	wTBl27Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYOE-00000004gZO-2QS9;
	Thu, 30 Oct 2025 19:32:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYOD-00000004gZ6-15Sl;
	Thu, 30 Oct 2025 19:32:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABED9602CB;
	Thu, 30 Oct 2025 19:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5859C4CEF8;
	Thu, 30 Oct 2025 19:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761852772;
	bh=4n7sme1iF4g2hhvf9X/e7qQUJ4ibim25muvzqWoOG3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4l5oyeqUD5T97Qpn1bYW3dJuG2Uici5Gl99AZwrNc0fYj6UeU3BBtxHeyn/VNgtz
	 RbdAprQvXmULrCJZzetDZ+hLEyqCW+P2eR8seRlddYctcnrcmD7CDu5fc+XZvZMdHE
	 a7vpwbRQXhjMTdtTdlXOQw3hPgKWjoNodB1Frsc/AJeZRhC2e1MHvuAqltTL9VCrqX
	 XKdg+IcIKYWi09erboLp3P96eOu0plibQvbWLoJuZQeApd0YkheCdk9K2sfBYzqHhh
	 A3CR/scgcdkJ4UjbLHuv/jLWLCQ84HjF/o17wp1MbeysgWETFoVk7QdUzQ2/S7omNl
	 PmF0d9lvgFxLQ==
Date: Thu, 30 Oct 2025 19:32:44 +0000
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
Subject: Re: [PATCH v6 08/11] dt-bindings: watchdog: Support MediaTek MT8189
 evb board wdt
Message-ID: <20251030-nineteen-borax-3af2d0992a6c@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-9-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jEAHuqhaXpLF8bhH"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-9-jh.hsu@mediatek.com>
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


--jEAHuqhaXpLF8bhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 09:44:40PM +0800, Jack Hsu wrote:
> modify dt-binding for support mt8189 evb board dts node of wdt
>=20
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jEAHuqhaXpLF8bhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO9XAAKCRB4tDGHoIJi
0qHRAQDCFtCgcqZHWVGl5YvVbluDGPKQ4cXF+4HIiF+utD1OYwEAw0ZIC7Gzj+SU
4Jjl6hGbPuD3ZBPBTv1ZYvtGOUUN4go=
=hW2I
-----END PGP SIGNATURE-----

--jEAHuqhaXpLF8bhH--


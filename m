Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB533CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYGjhJwEqmxzcSFikUVbtFMd/p8IUSgYcJ+tdQK27QY=; b=nfJEX4LHH2qJzQlaK2LsxpujxR
	m6ZfJ8cKEjZKRet3ZgH1GNqrTVzpiYlVbCBOqFBwwivRNZ2ASxj9aOEzrvQ88YetB7Xg2f8OGAnPs
	rEmtnfOXi+ct4ptwGUcnhVtr/JPcaVRkefY1zVFqJ+f4Q09PrtOLyEU4FAXLRtW5iObMOxtrg23mi
	iCK2qV74Ow7qwN0l1so+36i/+w0ttxNFuKFmNs46lkh/bLk3U3obXP/043tmDYl24KgNdpKqsvAh0
	O01TM1nfEC8BEIrzjDK8IDIVjJlTu1GDB9tQOkgztmas/MnB5M9K3MzpgJr/tBcBe6jayYINhP/wt
	Nw0nl62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYLy-00000004g9x-2ERX;
	Thu, 30 Oct 2025 19:30:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYLv-00000004g9G-0c26;
	Thu, 30 Oct 2025 19:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C1EC45021;
	Thu, 30 Oct 2025 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0193C4CEF1;
	Thu, 30 Oct 2025 19:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761852630;
	bh=nYGjhJwEqmxzcSFikUVbtFMd/p8IUSgYcJ+tdQK27QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gAKjHX5O8ABQzM+cbFJGRu3y+jMKCB9XR2FMAJIaDe+oz9RnOfaN1sjlO4zXV6kVj
	 VsjXGuwa5NPe5cODsKJzQW1ApJ0WKgKd2Q29iTk1ZayF/zp1oEBqVJKpmLTiNxSegR
	 iL4lcP8PskdJnxn+DAk5kG/tCMgRDxQ+uxMaL+BId3jclthsJk1kIMck2djOqiJKBQ
	 6+6qgSw3AfP1wbqCFyEe9w3yNC92mn0mx+VwCY9BE8TvMsm5tttG+8XXUFWOGguOCD
	 Hds4Wa/pSyXEGW5oSVXaPeD6rUVvb8J0WbkqFT8F6NKCopRXDTLDU/1BODRQOWCgLH
	 p/v6GoQUqyjgA==
Date: Thu, 30 Oct 2025 19:30:22 +0000
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
Subject: Re: [PATCH v6 06/11] dt-bindings: timer: Support MediaTek MT8189 evb
 board timer
Message-ID: <20251030-dumpster-sister-9d42b3c2321f@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-7-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lSql5Dbd6t0I6d4Y"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-7-jh.hsu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_123031_207608_CFA9AE82 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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


--lSql5Dbd6t0I6d4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 09:44:38PM +0800, Jack Hsu wrote:
> add compatible string for mt8189 evb board dts node of timer
>=20
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lSql5Dbd6t0I6d4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO8zgAKCRB4tDGHoIJi
0jXjAQDA+75TI4KHzqt7u0J0FuY4d5XRYH8bZz9Os1JW1zjBfgEA9No7V3Q7tT/A
8ontfDIfylzdLSCBQd9DeKbMg/lTHAM=
=eiVu
-----END PGP SIGNATURE-----

--lSql5Dbd6t0I6d4Y--


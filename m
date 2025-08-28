Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E901CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1V2dgEATYXD7sLHkpBfeFtMXcoUFuQpVI/5dmTO6fOI=; b=BA/ox5PpBfr39lHM6ef8unZzD0
	Nt8u4xAjxjdmkBqYTLNr29Xr/bWVZo6Zing3L3Z2l+KZkyHT2O3dIyRoDw7u8LVdcY0Zdt92Um3hF
	lmhhxPly4u9C4Cf7aA3btwbyrDuedpadyTWS62Y+jY9ZlFJb1YIqpvmm23jMXWn9k1Nclp99DhXa/
	r/m/e0jd7wfU4l72zCY3aQOElvykDVMrQ1JPUB/8T6W9gLQiqRGJrPiVWIwq0clq/uq49lSsloCb8
	VAWXyO2U8VCtaU3UZFMFn2hhyzX8NHuXjWCj7cgqvYjWMG0yotsxKgIi0CWnFWmmg36+Q7ackv0XX
	NfJNaW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWS-00000002oLq-0AN5;
	Thu, 28 Aug 2025 18:38:56 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdHq-00000001qwC-2wyz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756390054; x=1787926054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1V2dgEATYXD7sLHkpBfeFtMXcoUFuQpVI/5dmTO6fOI=;
  b=mbPJ1Yx++nAwWLWtwwGo6FprX0O0n72ANLWIS8FRBInzYM4he2Jb9+Nh
   V+CY+gzL9u9gvUN8SARsmBspjDMztUFHbDstKtZVBHlu/wfhQhEnIQOya
   Nxjv6ApacQyenkUUaDWKGjDV43nxMwlKALxBDNGSzF2Ok+VCAT7jD0pgk
   Ma3iZvAabWSGeMxkpoVqNlCN6quE2jf1+a+0sEG7b43eXqGcxd3yz7Ibr
   LfSrOeOjYnKJgeER/eIqtNO4xSZfdmr1fCjO9rHmHC3z435rXCcscK56p
   /OAcgoQmWAu84BMzPOzI5EeSAvpm1khjDRwnEAzkmjE/cI3t4Va3DaiYx
   Q==;
X-CSE-ConnectionGUID: pHIbrKnbSsKPwmnNNZy+LA==
X-CSE-MsgGUID: +kq5miZWSmG0hV68Kjnfvw==
X-IronPort-AV: E=Sophos;i="6.18,217,1751234400"; 
   d="scan'208";a="45959276"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Aug 2025 16:07:27 +0200
X-CheckPoint: {68B0629F-1-299FBAB0-EF52EDE7}
X-MAIL-CPID: D8BC9AACF274DEF507CE904D865E66A7_5
X-Control-Analysis: str=0001.0A002112.68B0629F.0093,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 239DA16140B;
	Thu, 28 Aug 2025 16:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756390042;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1V2dgEATYXD7sLHkpBfeFtMXcoUFuQpVI/5dmTO6fOI=;
	b=PBc8L4n2+UqzRt0GCBaXASsqPkdRKWAw1BS9bjZHK8maHprA+naG8rD4liFKZN3LoVQ8e4
	2W9JkWdY3ebNt5VCFFAoS/MhKYNwlRnWe8nd+0UkmP1AI+XAJEIqYb+XCVLXgfNkOFQpV6
	dIBulO6lUgH0LT1kDMr2cSzBvPnW9KHr6N9F5fB1vR9kUuzaS9lY/hj3pnFKm7AxV/GYWG
	YAcdNWEzdz/WZPYn9xdqCnOAXdmeDcZAxKqU+TDFZ/p7w/xjmQN5wPL6HohuTziKIUnWS1
	83AHlTctXZMjB1UbDSYo/mZTxPgDZTQ3DIOT2wrozk8JL9Awfeh7+dRxKSAQ4A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: clean up most ls1021a CHECK_DTB warning
Date: Thu, 28 Aug 2025 16:07:20 +0200
Message-ID: <3571725.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
References: <20250822-ls1021a_dts_warning-v3-0-6b611a2f23a4@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_070735_228997_B7386C3E 
X-CRM114-Status: GOOD (  12.00  )
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

Hi,

Am Freitag, 22. August 2025, 16:49:57 CEST schrieb Frank Li:
> clean up most ls1021a CHECK_DTB warning.
>=20
> Old uboot check esdhc@1560000. The new uboot already switch to check both
> esdhc@1560000 and mmc@1560000. So we can rename it now.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

=46or the whole series:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Changes in v3:
> - rebase guoshawn/imx/dt tree. Remove patches that were already merged.
> - Link to v2: https://lore.kernel.org/r/20250820-ls1021a_dts_warning-v2-0=
=2D2e39648a32b7@nxp.com
>=20
> Changes in v2:
> - squash rename to flash patches
> - remove duplicate patches already post in
> https://lore.kernel.org/linux-devicetree/20250725061339.266125-1-alexande=
r.stein@ew.tq-group.com/
> - Link to v1: https://lore.kernel.org/r/20250818-ls1021a_dts_warning-v1-0=
=2D7a79b6b4a0e2@nxp.com
>=20
> ---
> Frank Li (4):
>       ARM: dts: ls1021a: Rename node name nor to flash
>       ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
>       ARM: dts: ls1021a: Rename esdhc@1560000 to mmc@1560000
>       ARM: dts: ls1021a-tsn: Remove redundant #address-cells for ethernet=
=2Dswitch@1
>=20
>  arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts | 8 ++++----
>  arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts | 2 --
>  arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts | 2 +-
>  arch/arm/boot/dts/nxp/ls/ls1021a.dtsi    | 2 +-
>  4 files changed, 6 insertions(+), 8 deletions(-)
> ---
> base-commit: 75ad5f47c58aee30248d294a58c8ee52e079a8e3
> change-id: 20250818-ls1021a_dts_warning-fff933bd83da
>=20
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




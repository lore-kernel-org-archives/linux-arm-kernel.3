Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABBAD44D75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	References:CC:To:From:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSqnZgLZFmjR/zI09hPj35lExE9DozM7LRLSXNYuBeQ=; b=SWW9Vxfvq12bvFw/Tm5d4ftUDw
	/nf4Dgbs5Ob+DOI9bf/jkpiRhLte7N8HBPY9+padgI3FSOjfztucLrg0TI7AvBexavCU0Vzv1n1tH
	n1aTYlEjZKmaHoGgCkCywC2X3NNQd3PicvxWVLE2Yt1G/hszAERhsiiBQyhGjni1ijY7QGFVRG/M4
	xKr7l+1UklaCbSdTLjpPp8xpz4Si2GwByYoYYH/6j5jpl8S4UxoAImPiF/AtO7v+THB+LnuM9b30i
	+38xh1BFZ0H6HTEta0If5cO+6YOe9Ea5tueKKU6k1GBurCGeYA2j8H7eMFoy6EM5ftsw9ayXUE9Ag
	d7IhgNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gr0-00000003ZZA-3Fbm;
	Wed, 06 Nov 2024 14:17:50 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gXY-00000003Vwr-3xay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 13:57:47 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6Dvced099950;
	Wed, 6 Nov 2024 07:57:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730901459;
	bh=DSqnZgLZFmjR/zI09hPj35lExE9DozM7LRLSXNYuBeQ=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=TesP+4rKGnJ6jtqqLzP9Yqm7ZsdGP4CH/HkGIMrdU7rORd+CDqLAdBQPBByR0pt9h
	 wKcpnT7GG0WfBuolJIb4Ql/ADKwPuxA0QQZzdbYQySqDtt/g8Ql85pOVxuWKb/CgoS
	 SZbL38q62GI1j1jAUcYp20FiVjtzyNuMcCCrNhLM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A6DvcYS002611
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 07:57:38 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 07:57:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 07:57:38 -0600
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6DvZWm062961;
	Wed, 6 Nov 2024 07:57:36 -0600
Message-ID: <b13eabeb-48dd-493e-a7c7-fd247c971ae8@ti.com>
Date: Wed, 6 Nov 2024 19:27:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [GIT PULL 2/2] arm64: defconfig: Updates for v6.13 for TI K3
 platforms
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc
	<arm@kernel.org>, SoC <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>
References: <3ded4795-2186-4e06-bda6-9c9a65a3fdb9@ti.com>
Content-Language: en-US
In-Reply-To: <3ded4795-2186-4e06-bda6-9c9a65a3fdb9@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------0BYMO8heXxr4akuBJs0wGJ5K"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_055745_099733_FA73E7A4 
X-CRM114-Status: UNSURE (   8.68  )
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

--------------0BYMO8heXxr4akuBJs0wGJ5K
Content-Type: multipart/mixed; boundary="------------Wti14dmmowaCZOnaHPCZPIia";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>
Message-ID: <b13eabeb-48dd-493e-a7c7-fd247c971ae8@ti.com>
Subject: [GIT PULL 2/2] arm64: defconfig: Updates for v6.13 for TI K3
 platforms
References: <3ded4795-2186-4e06-bda6-9c9a65a3fdb9@ti.com>
In-Reply-To: <3ded4795-2186-4e06-bda6-9c9a65a3fdb9@ti.com>

--------------Wti14dmmowaCZOnaHPCZPIia
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-config-for-v6.13

for you to fetch changes up to 8461bcf0a3d9d39ff9d858c06c2c820f711a8182:

  arm64: defconfig: Enable PCF857X GPIO expander (2024-10-28 20:42:47 +05=
30)

----------------------------------------------------------------
TI K3 defconfig updates for v6.13

Enable driver for GPIO PCF857x I2C GPIO expander present on multiple TI
boards

----------------------------------------------------------------
Wadim Egorov (1):
      arm64: defconfig: Enable PCF857X GPIO expander

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

--------------Wti14dmmowaCZOnaHPCZPIia--

--------------0BYMO8heXxr4akuBJs0wGJ5K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEyRC2zAhGcGjrhiNExEYeRXyRFuMFAmcrdc8FAwAAAAAACgkQxEYeRXyRFuM9
sQgArcKMxrJqwx6+LcLpHZ3B8pOnVUXjfvva32PE059xUWqB636BxhMl/kGVlrxtUpPayNBTLniY
QpQ/Fr/NnCDwuv0nhUEA+SQcChb8onDT0/hBAj5Y37vnQPQuywHRIrv9smXjsuFiM8gPt/ybi8+f
V2XK6jrf9gFRpLBq/+mxqYt5/zbNeg5/oUge53EoT9v7MogH/ek3bI2zDu66jW+nwETGjyxk77F5
eUEWSK/4M1vzfiapnmxW6h3jezQzlDAMqdjk2ezCMBUfQjYIPyOdDwGgB3iU5rH0SdVvC7fbV73I
viUwcJ81+a9224s3MXWPiPWpyc3+riaEf+nRAPQGfw==
=LJ9D
-----END PGP SIGNATURE-----

--------------0BYMO8heXxr4akuBJs0wGJ5K--


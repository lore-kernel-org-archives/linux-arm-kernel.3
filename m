Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEDFCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sTwvMaOD2KlqMJn2cmd2U+t/IC6uSpDaPUIgltSHNY=; b=EE9JvDAdtYAFNzac/PgMJ3SV44
	B+mTCMLmE1cWeiN9wfKHa3oCxK7B3vTjvduuNTMjKpaAwl1Gd9bIPQj+rmlHblgy7enQMwsO6T+76
	vuoKA0caXkoACvYxXmLxLMU5sgCdN7WwuqT4dmU//B1o2KP8BH0ccCwrDjOXbtzPpTiv3DKHVFvSB
	StgZUCCOvjYE3ioQziP9y3QR87jCfQ5mBN/kemQVcHAkbHZEiMVfJTpyQdWODxjGQDrrqMzZKjG0v
	M5eCiAdYHO1Bz3JFCVQlwx4GWUYuwQyvZrr55E83QGWTqNjChtkoBuGKr9jtee/+uAAfW0vnugjLQ
	eK0V+Y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvwH-00000006WSt-0zyd;
	Thu, 23 Oct 2025 14:05:13 +0000
Received: from mx-relay87-hz1.antispameurope.com ([94.100.132.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvwA-00000006WRr-0yeb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:05:12 +0000
ARC-Authentication-Results: i=1; mx-gate87-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=3sTwvMaOD2KlqMJn2cmd2U+t/IC6uSpDaPUIgltSHNY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761228230;
 b=nMLWBtAW45P8W7FFgMKLal4MqztIB6jlrcE78SUeWqX+F7EfjrpwhRgaBTWA2TMJ9m2kBhlm
 gb2C3hyV/GbLEce34AJgFTXz0EUVF9TZtJJy3gRu0JFFBr/xi+GIVv874VzBZHKvO/ErBlrj5rO
 HoktbNVqC7jupK0JbO5cHZ1lgOwEuJo5qdODddyr5jwnmuJuJrZGl2RcL+XMglOZ+XqId/lu77Y
 Oj/WETn6XzDse1SCFiOVnF3f/5ukxmHcNb68f7dlK8Y+/hLyMkpBe3wwTSRilCb4TkrejMir4q8
 5cfFgZVMefVmda3REvX/ggjVq/K69JQfF+jDq/1sZRCdw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761228230;
 b=s/MT+2iQkxVgO0CDBx/xlS75ptuNbAvChwy/pp31qsN4/y4Sthj7RIRmc5fsq9m2UPc20Cph
 q50A9F4eKkMdLGSmYEKEnC/3RX0wgk3FBWDLa4C+AdPBr/TXWFi2z3yTy2gSDS6nTNbJnzTOc+o
 XzHdMlBpqlv+LffXhnd0fNOzmD+PJadu8VBmvtIqQzKscUxLDtclfzqr4COzQCWgOSNtGjQznYU
 RlpudkoZHB9sXvrBDJi1eFMNmu2fbP+sviN73TLFl1YjgyEfORHzTIClAhxAVLrXXFfo4wqWiZk
 FvBGTxVrqn2HoFk6mS6O0P6gJCI9QHksxVzqqvqPIDJ5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay87-hz1.antispameurope.com;
 Thu, 23 Oct 2025 16:03:50 +0200
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 81F9BCC0CC1;
	Thu, 23 Oct 2025 16:03:37 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev,
 =?ISO-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
 =?ISO-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Subject: Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting and
 Ethernet
Date: Thu, 23 Oct 2025 16:03:37 +0200
Message-ID: <3381308.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
References: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay87-hz1.antispameurope.com with 4csnnQ15tNz29l9Q
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: a7de4b4405587fa83fe7bed496fa611d
X-cloud-security: scantime:1.783
DKIM-Signature: a=rsa-sha256;
 bh=3sTwvMaOD2KlqMJn2cmd2U+t/IC6uSpDaPUIgltSHNY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761228230; v=1;
 b=PUby7rrK8Lvc1tn+p/kyKEh8kxixDEqTIrzDlSbwPLvMG4jCvBiDcn9OfSNlj32dxTW3RtDG
 oScTCg/gDo8Muq+5SDyyN30isZd0qMDoTGDQMY19vuUwMJuN128k0KIxGsVDhISU0B3rZd4z59A
 uMVYqYzvYxw2jKcHHjrCnqxEA0I9GZQID2TrU7u3G7P4xd/MM6nHXu3PzDquYcgExrK+1J/jeG1
 /6PCit7ESFFnRVbV8XY6ve/S4QVZ9NTL6GOGWzaCZkKBmP4Sz90ieDaKjP6BRfKOQuBycNbSOoL
 jyoj+uxW8HwDL0Fs9fUf+YmkBaf/mHg4TKkQO6FAuUBdw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_070506_757596_AE7D17E5 
X-CRM114-Status: GOOD (  15.29  )
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

Am Donnerstag, 23. Oktober 2025, 14:19:15 CEST schrieb Jo=E3o Paulo Gon=E7a=
lves:
> From: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>
>=20
> Enable the necessary missing configs for the i.MX95 to boot and also
> have Ethernet working:
>=20
> * CONFIG_NXP_ENETC4 for the network controller driver
> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
> * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver
> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller
>=20
> Signed-off-by: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e09=
43e7b0e1dcee3a9 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=3Dy
>  CONFIG_FSL_DPAA_ETH=3Dy
>  CONFIG_FSL_DPAA2_ETH=3Dy
>  CONFIG_FSL_ENETC=3Dy
> +CONFIG_NXP_ENETC4=3Dm
>  CONFIG_FSL_ENETC_VF=3Dy
>  CONFIG_FSL_ENETC_QOS=3Dy
> +CONFIG_NXP_NETC_BLK_CTRL=3Dm

Are you sure this should be module? Shouldn't NFS boot be supported by
default? I might be wring here though.

Best regards
Alexander

>  CONFIG_HIX5HD2_GMAC=3Dy
>  CONFIG_HNS_DSAF=3Dy
>  CONFIG_HNS_ENET=3Dy
> @@ -615,6 +617,7 @@ CONFIG_PINCTRL_IMX8DXL=3Dy
>  CONFIG_PINCTRL_IMX8ULP=3Dy
>  CONFIG_PINCTRL_IMX91=3Dy
>  CONFIG_PINCTRL_IMX93=3Dy
> +CONFIG_PINCTRL_IMX_SCMI=3Dy
>  CONFIG_PINCTRL_MSM=3Dy
>  CONFIG_PINCTRL_IPQ5018=3Dy
>  CONFIG_PINCTRL_IPQ5332=3Dy
> @@ -1349,6 +1352,7 @@ CONFIG_CLK_IMX8MQ=3Dy
>  CONFIG_CLK_IMX8QXP=3Dy
>  CONFIG_CLK_IMX8ULP=3Dy
>  CONFIG_CLK_IMX93=3Dy
> +CONFIG_CLK_IMX95_BLK_CTL=3Dy
>  CONFIG_TI_SCI_CLK=3Dy
>  CONFIG_COMMON_CLK_MT8192_AUDSYS=3Dy
>  CONFIG_COMMON_CLK_MT8192_CAMSYS=3Dy
>=20
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251023-upstream-imx95-smarc-defconfig-8972db535918
>=20
> Best regards,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




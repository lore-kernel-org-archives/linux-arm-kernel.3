Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA49C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDGoSBlFCIpch8D5WWesNDVa8fVNgGYShrsmZtG4Y84=; b=m0VOY6omyq261VhKFSYyr7oCDV
	VMlcwL4v0x5RxwlLXO1U0oExjlpPGQCavRGm/4+7dfGZBOLTsUT7yGqal04ZwCqVTCVpIQS8Sv9pP
	fhyf71UfF9cfItn9gqsGcoz9abJyuyk9vHYEZc93zL6Y+KKNtpJpKn4xrKD4m+yOttwvm4b69ak+6
	wajfJCpaGTvrvfumMKc84Mer390JHZOSCTXTaL66FBYx7FUvDAPJnjDzcjjKz2238OnbZ9BJml2QC
	Cw9nKlF4BXGzmhgwWyDSH1qTlcQ0DPMPYchv7An0BCB8Q7tkxiak0PBiYrTrUyAlKDWsLBHE4aO0Y
	nAgMHUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXbX-00000004dsr-2vBJ;
	Tue, 01 Jul 2025 09:48:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXIP-00000004bOn-1psn
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 09:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jDGoSBlFCIpch8D5WWesNDVa8fVNgGYShrsmZtG4Y84=; b=oBAP4ZCE4E0kqPfetbp/i33i74
	CmP7U8mocAxSGcZtcpDixuploNzhOOPbNYzDRqM9kV7wt7ZropiNmLxWd6hgC+V+q7DtJ5861OjJT
	BrExaY/F1VaaxofgV9gW4DN6c095qAW0lE9NHaiLLxFbEKsyTkdddJjeY133VMKozPBtThTEHumV5
	MLektufPtDLZoCmF/xE33kF6JmLffLIxQ9kCIxTT1DlFgPJVNz9fohpHkh92uvObQ6DnVskf0VpCv
	TFB1iu4f2+tjmk0NNpSgTQHbyJXN7Mnj5FDyH3x1sp/HpxKREqCL9GpMx/3+j8h1ifoAEo0Gx4zR0
	Bz5n9irQ==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXIM-000000072bm-1166
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 09:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751362134; x=1782898134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jDGoSBlFCIpch8D5WWesNDVa8fVNgGYShrsmZtG4Y84=;
  b=DzTSgD5ZZvIfuuE8Y1P5IP2cTe9/2deKfzEW8pVV1WT1jeytICIDgmjS
   nISVr2Qq7ldzKr0hEwn9YkmCgUzskP27vxIuSkHlvMN76U1OktGIXjYF8
   1WIi3CNx3roUiZEdGDojlfLSArkJprXwKwZOgnpNgqEkaaVzXgqSGhCSu
   e5IVh+IRklsJzwH3ZDS+rOfErJRibKii4Cnyn4jUnTlnxjoevakFrvRHB
   8m1e0th8aWwVzOq0D9ikg2GqyyAvdsoWpQ0AwybvVwcEcCzOir2RysfgK
   LfQVyRZXy8hyBUvsgxGq/A1Zmuk030/gJwqqR4jLZYmoJDfsN8in5rZ5f
   g==;
X-CSE-ConnectionGUID: WiRnyJtIQlKd8eYAiIkgkw==
X-CSE-MsgGUID: KEvumEGjQeW5ktFmMDa8TQ==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44950481"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 11:28:52 +0200
X-CheckPoint: {6863AA54-44-468F1319-EAD2FB43}
X-MAIL-CPID: F252A9CB289518CC4256D487AD399445_0
X-Control-Analysis: str=0001.0A006398.6863AA84.000E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27EA316ADA1;
	Tue,  1 Jul 2025 11:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751362128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDGoSBlFCIpch8D5WWesNDVa8fVNgGYShrsmZtG4Y84=;
	b=GEm6n63V9oVKKMGrYiNQ87+e3gq75QL7U9Dsu4EUkBLe7AziTzswNqWWP5drp8WY+i6Has
	osFbvp5LRsU0hRAoxnU5T6U5QNHfGw0wIzBpoBlT2lXrMqrnK3i8zF+kyneY2zEMVn0BOZ
	I6zLKNdNtnKZrGR603x3cT94pRxYNdCTzQp2HkAztHJzDnkWabZZV9U2Hy04vXVRqHeoSt
	AvZhuC5NX9X4dJdSt2Pa1QYjxOITrN2OyBTUgMfVfrFjyLd3sh2Ui7SODaWgGgTXUzqW3x
	oKh3eyePHjmL96j3KQV77xBsEGAntjQtDeDiN8evayfNedMny+/TS9pZmMGcNA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <frank.li@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
Date: Tue, 01 Jul 2025 11:28:47 +0200
Message-ID: <6173943.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-imx95-blk-ctl-7-1-v1-1-00db23bd8876@nxp.com>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-1-00db23bd8876@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_102854_577613_A950D2C4 
X-CRM114-Status: GOOD (  14.40  )
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

thanks for the patch.

Am Dienstag, 1. Juli 2025, 09:04:37 CEST schrieb Peng Fan:
> Add i.MX94 LVDS/DISPLAY CSR compatible string.
>=20
> Add clock index for the two CSRs.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml        |  2 ++
>  include/dt-bindings/clock/nxp,imx94-clock.h                 | 13 +++++++=
++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.ya=
ml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index d0291bfff23a27cb55683880fe3a1f8b3e2ada5a..4e20e8c8663b3b6665ff91ae6=
3e1539aa8e9cc9b 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -19,6 +19,8 @@ properties:
>            - nxp,imx95-lvds-csr
>            - nxp,imx95-netcmix-blk-ctrl
>            - nxp,imx95-vpu-csr
> +          - nxp,imx94-display-csr
> +          - nxp,imx94-lvds-csr

Please sort them properly

Best regards,
Alexander

>        - const: syscon
> =20
>    reg:
> diff --git a/include/dt-bindings/clock/nxp,imx94-clock.h b/include/dt-bin=
dings/clock/nxp,imx94-clock.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b47f74f00f119ff1c1e6dad88=
5b5b1e3b1f248a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/nxp,imx94-clock.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_IMX94_H
> +#define __DT_BINDINGS_CLOCK_IMX94_H
> +
> +#define IMX94_CLK_DISPMIX_CLK_SEL	0
> +
> +#define IMX94_CLK_DISPMIX_LVDS_CLK_GATE	0
> +
> +#endif /* __DT_BINDINGS_CLOCK_IMX94_H */
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




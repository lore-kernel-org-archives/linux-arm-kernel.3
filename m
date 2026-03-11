Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE641125847
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dknpLbwPC6M9r55ZzYVfKb09gY6bN4LTaa3m33L/TiY=; b=HbGIJpqXOo+x81ZyqktaTbFhnm
	QZpcNPr4hMxBlSMVD1kSrCSOSNBkE+YW0OBEFEAUmi2tpnb95QVeQqxbJET8IPLxn977aUXoSMB2v
	mxl3r4aFKsqmmUzxiJ01Slls+HE2WhjYfLmeL2V8n+dTGv77cX67PYe6vFG1mGbWiHS9+wgfIFz43
	5s58yGHPJw9HEf9VEgkkKIRsfk4YsfqzmN9Gmrymj26l5J5Fx9RU9rV2AfVDkgKovq38pp4TEcBN6
	0LYLYmt1OM/5a3LuLRUE1Z+ZTv26HdRkiTF65ib4R/oDmLPQMqF531+Lq5V3teygxRYnGo9Zo4yuM
	tWh96t3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LOQ-0000000Bnfh-3zmd;
	Wed, 11 Mar 2026 15:22:38 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LOO-0000000BneT-2FtP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dknpLbwPC6M9r55ZzYVfKb09gY6bN4LTaa3m33L/TiY=; b=L8jzkFdrQk/c7X8SpYZS95Pc42
	xgsy/wKAVxGuLTLf8VwXoKSfRnjFcQ3NuB2svPosKPdvwrXMjVhkBembMnx3oMP6OdjZmCK163EKd
	2JmUjqlvYKXw3JAIOM5yOfAsM/3EYzf5rifM6Ss7M7fcYHY6pextIR264ATw9VhMZ/gTJG1BCXeGz
	3XwDpYGprzsgTIF4Wa2mXi3qG3H4eNwOds23xzVP7Y0wYubRQGRw7BRUcXGEJXbxDXyezeWmCA6jl
	pdrKpRMYh5qjd+oOZI6ezD5KuRoIiB9Qcs+xYTzo9LT0yu+2YKe5rHavDpQaw0taTF6iqlky0ALv8
	0A0cHf/A==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KkM-0000PO-1D;
	Wed, 11 Mar 2026 15:41:14 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0KkL-0002q6-2d;
	Wed, 11 Mar 2026 15:41:13 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: imx93-tqma9131-mba91xxca: Add LVDS display
 overlay
Date: Wed, 11 Mar 2026 15:41:12 +0100
Message-ID: <4338185.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260311143217.1700704-8-alexander.stein@ew.tq-group.com>
References: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
 <20260311143217.1700704-8-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27937/Wed Mar 11 07:24:53 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_082236_572285_B40AE1C5 
X-CRM114-Status: GOOD (  11.59  )
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

Am Mittwoch, 11. M=E4rz 2026, 15:32:10 CET schrieb Alexander Stein:
> This adds support for Tianma TM070JVHG33 LVDS display on interface X11/X12
> on MBa91xxCA.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Please disregard this patch. I accidentally sent this obsolete one, which h=
as
a typo in the subject.

Thanks and best regards,
Alexander

> ---
>  arch/arm64/boot/dts/freescale/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 64fe9487b1003..60aafadce0725 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -418,7 +418,9 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx91-11x11-frdm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx91-phyboard-segin.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx91-tqma9131-mba91xxca.dtb
> =20
> +imx91-tqma9131-mba91xxca-lvds-tm070jvhg33-dtbs :=3D imx91-tqma9131-mba91=
xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
>  imx91-tqma9131-mba91xxca-rgb-cdtech-dc44-dtbs :=3D imx91-tqma9131-mba91x=
xca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb
> =20
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb.dtb
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AF7FC5913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZA7AsIzdwCY7ab6l8jLMqVVu0K3dmUt9FW8oclhVyw=; b=essu6nb/Tvmw41BjOIBvUkKrD5
	BpIrWRv6a3OjLZX/n/bRX9am0I/OMAlvtus0w1bAZeOi8XP/xn6XKbJJse5wuvQoaF/S2BotXPBvX
	14xhDiFtThGc5aM3KqmOtdsBMi0nxjdv3Bq4RCJmtYUG1l4yz0WomLt8n8/ueTtMAF+QIHijF1vzP
	Pet1YA5ifSrUGY5gdhnYsWkoHAs+1Dd5/5nt4sHV/NArXtNvu8VsnnlT4eKKjWtoH0R1TrNOG0r7w
	JybVWzYtzjrJJMeNOutm+7D9q8GDfQnx8+GyUizIFguCGAy6hBjjXn0qTi8wfwMuAqBCf/t34JTUa
	CzxlazpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX73-00000005i7W-1HFO;
	Thu, 26 Feb 2026 08:52:49 +0000
Received: from mx-relay60-hz1.antispameurope.com ([94.100.133.230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX6w-00000005i6Z-1SOi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:52:48 +0000
ARC-Authentication-Results: i=1; mx-gate60-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pZA7AsIzdwCY7ab6l8jLMqVVu0K3dmUt9FW8oclhVyw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772095954;
 b=B6npiQJQz6VdCVGu+yfPSUYCSvyJSg4A0noHsSDO4GLoQAsaVwk/xViNi7m+N7C7XQm72+/J
 nPQzE7Vvt0t71RFoeBKqUMHqJOll1ELN2/ex3RtvvxuHGrWixTVHo3oXV9cxdUzbeaDMBVKJ5jw
 N1pmu6BxbEe52PUXbUmIXIq8wzXaJPZy2zZ1hDUUQBOxOxBXCLJvBJdjmCnO5Wx8LJ6ObOgSbDx
 8EZlqxCwHBOTLOoU8VuUCH8+Zk/FjefL+pDmCPOR/15OncvOT8QNX5a6coejR2y8VCJbevK4r29
 2Uh+Xtfna2fcCFjtEUxpLCSJJoxfa2AnlFjciIoeyEe5Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772095954;
 b=CitlVqTHgqIoIQh5XeEGRu48uxnCHMiFERymqB8u4pNtIz97tEqsgKun1RnZyE9Oy4Oc9ysU
 gYKa1Itrz0Nmp1lIZZ5knrXaER8P1wH0OqJOnWBkYOLJLyvMse/f2ju3QEzojLelfDVniet4cJY
 fpm1nY2nT9suaIhYIH9XD7x0VUigb21tgkDymhjQKfu7+HBijLd8lE8AJ617/N4bmDxGVUCV3fb
 V5uBrv3SW1LSBqRf1WAXqoSaGOgmXHKGT0LCRdWbTwIFkW2cUvSqPke8hkNzEFqWRQvQQ8QAMJA
 9mWjRCyqGuTgftpxCLroBX2ZevK2r3vtGU0zbt9zkf1tg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay60-hz1.antispameurope.com;
 Thu, 26 Feb 2026 09:52:34 +0100
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: nora.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 419F65A0F0A;
	Thu, 26 Feb 2026 09:52:23 +0100 (CET)
Message-ID: <ccc6e9665ec8d432a5729fb18a757bb76cd95d9e.camel@ew.tq-group.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314:
 fix UART1 RTS/CTS muxing
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,  linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux@ew.tq-group.com,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Feb 2026 09:52:22 +0100
In-Reply-To: <aZ8YFYbRIHlcmWk3@lizhi-Precision-Tower-5810>
References: <20260225083419.5639-1-nora.schiffer@ew.tq-group.com>
	 <aZ8YFYbRIHlcmWk3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-cloud-security-sender: nora.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: nora.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay60-hz1.antispameurope.com with 4fM4w80B2Yz28yMP
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: daeffe5ef58851175bcfb2fcf892fa20
X-cloud-security: scantime:1.389
DKIM-Signature: a=rsa-sha256;
 bh=pZA7AsIzdwCY7ab6l8jLMqVVu0K3dmUt9FW8oclhVyw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772095953; v=1;
 b=DurOm/+Er4jU2ko1MCfUiv17l+yDjaa2BvcerwlCzQRcywk+eNxpXUOAve8VTzBF5LNqUTXv
 Io8O/azKNVzY/86vm9Ob7O2M8pVa4S06SChkXyXKb7J0ps9KI/8sH1KOUMEKSL66Pbvstv5xwwS
 TIuJJpV2OLOmaQ3k8bTw6TNArFE/Lzo1Vg+re3eSyDTkmczbLRRISfFEzJJ1nAMWa3BcC6sQd+h
 WlITKxCg405cBx3IWABZH0WSe+6a5+AZYTclV2FbuDkFhX6zigVmPOlKoxRw+ds1C9Bd+rfiiEB
 IytgMV6Sq8EMZmT022hgGWi+F/8eDwQ97e+2pMa9jp8+A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_005242_647412_1187896B 
X-CRM114-Status: GOOD (  20.19  )
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

On Wed, 2026-02-25 at 10:41 -0500, Frank Li wrote:
> On Wed, Feb 25, 2026 at 09:34:18AM +0100, Nora Schiffer wrote:
> > The pinmuxing for UART1 was mixing DCE and DTE modes, which cannot work=
.
> > Consistently use DCE mode.
> >=20
> > This switches the RTS and CTS pins, which is fine for this board, as
> > UART1 is routed to a pin header.
>=20
> Is below commit better?
>=20
> UART1 operates in DCE mode, but the RTS/CTS pins were incorrectly
> configured using the DTE pinmux setting.
>=20
> Correct the pinmux to match DCE mode, which does not affect existing
> functionality because UART1 signals are routed to a pin header.

Hi Frank,

your commit message sounds better, do you want me to send a v2?

Best,
Nora



>=20
> Frank
> >=20
> > Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RA=
S314")
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras3=
14.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> > index b7f69c92b7748..1665a5030b993 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> > @@ -848,8 +848,8 @@ pinctrl_tlv320aic3x04: tlv320aic3x04grp {
> >  	pinctrl_uart1: uart1grp {
> >  		fsl,pins =3D <MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX	0x14>,
> >  			   <MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x14>,
> > -			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DTE_CTS	0x14>,
> > -			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DTE_RTS	0x14>;
> > +			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS	0x14>,
> > +			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS	0x14>;
> >  	};
> >=20
> >  	pinctrl_uart1_gpio: uart1gpiogrp {
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/


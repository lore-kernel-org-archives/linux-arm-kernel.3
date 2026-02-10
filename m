Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C417EA3F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b56rULzaQmeMuoYAaEU4xGBS2qJkvIqeuKLdirVgvFA=; b=bRNF2bR0HIQBI9oll61125/zPM
	WbUHadYST/iuh+SC0wNUAb6s9EraqLiwBE/2p/6oR5FaSS1gtzSxlAmxykjRuqlgoZ/L0f1Z792Jv
	v8l9gaa06lyO5GHPqaEQTvugUmVAwljNgt1DfitTlRp+/+cJrxU7pCsesI4P0XumBJDQZJ43mQHpP
	AuAFowJJIH7mJELuuT004/vom42P4keA5Mh99bmLZ3XDSLQAjq/9nKjRmjGZ5pKA4ixZ9ksHVXZZm
	hphwH8cAUQ8M3wnjdAAff3Nz3NnuHm8WT75LAuefvK/teHlx7Z05+XE9Vav5B55suG4Q1Gfd8nKW5
	fWLPNrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphTJ-0000000GY7e-1Cg6;
	Tue, 10 Feb 2026 06:43:41 +0000
Received: from mx-relay36-hz1.antispameurope.com ([94.100.133.212])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphTC-0000000GY6b-3Ovy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 06:43:39 +0000
ARC-Authentication-Results: i=1; mx-gate36-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=b56rULzaQmeMuoYAaEU4xGBS2qJkvIqeuKLdirVgvFA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770705801;
 b=o2k4qI4dDjiPKzlbub6Vi0QdQ0wEwCXE7TmZQ9hf4KNvbVe91NAWHRYGE52apuDcoqKHiQ2W
 n5+tlFLbbw94AgsnlO2XIn8N9tOMIjTFkrXKtvb4/O7cf+qCFEl6vhZV2hwmcoBj3UiqsG3kPbC
 /I01IdndFiWwxrEWJe6Qcj/KQ3aXefVA0xixkdNdDF8SB82/NE/Nbh/bPPDLKrwn3USL6004sYr
 eP38SYf2SwwOacxACvoWcW4BKRp21OjSc+1n37Tk7zd4uxNN7+BHLUq07sMIWDQHsy28KfNdKhq
 9Vq6NawjaKDrrQZFkJ2/OBWYE6SNvShTjeISOr9F61UbQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770705801;
 b=n8Pme5ayOvJHfJua598lxPk38KZDpkW883ArGr7i/w1rvF3D6U4OJmxMuvavUsFwVz3yOE7y
 45cMDCALqnDpWQEMkOyOWP5FkxAtAKYg80hxye7T04jRU91UWLCknA2fSo8Zjz/E6KoUUc5sNcs
 hGhd4+UF/Q5FDIhChh9flzw/4+0jWfh7e7TvcHO8t3O6c64KoTf8WLSW32BmRABqdQ2RRUsNqJB
 nb4YWJT7nKa5bz9PrFnlFHCu0+gcxWQE0LSC9AwYbUdw/JCDpMHeTWXDvSA6LZiz/1Cq89cCfuz
 2nuoXqX16hNBTF5uAqZoKOW34FIc3d/vMouz+u/aujhLA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz1.antispameurope.com;
 Tue, 10 Feb 2026 07:43:21 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 907185A3005;
	Tue, 10 Feb 2026 07:43:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Shawn Guo <shawnguo@kernel.org>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx93-tqma9352: improve eMMC pad configuration
Date: Tue, 10 Feb 2026 07:43:05 +0100
Message-ID: <5085410.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aYozeOpdHo21D8v8@lizhi-Precision-Tower-5810>
References: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
 <20260209155015.267008-2-alexander.stein@ew.tq-group.com>
 <aYozeOpdHo21D8v8@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz1.antispameurope.com with 4f9BpL2LgXz2HYn9
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 99e422220242feeb3b158eff7f537415
X-cloud-security: scantime:2.145
DKIM-Signature: a=rsa-sha256;
 bh=b56rULzaQmeMuoYAaEU4xGBS2qJkvIqeuKLdirVgvFA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770705800; v=1;
 b=LIVNZ3E7JG5PCTSn5A5XelSStyxUBT00giZeM8WzzGoEa70a6Wif+3fGESgqCzt2aPRhwuX0
 nK1aog3P8JKlkLSE60Z8nM6tNw/CtSotcqKi62G1okvYTxsU+z8WaW3fqOQ5Fjn7iVs0AOIVtTo
 Gp6fCA/b2IkryGvn1yJZDB6SrVXpVimNHBBRWisKOtVH9SETLjm/kDBfC0xXx8jasg94xxv5bu7
 dHvrxNL5A6Y3W7ptLUxC3SbUBvLbxrSYFQu5hS1fyCKyaCefd50xGhl3XNYOab71PFLAZ5tnS7a
 nKeqXmhrI+c13Sfivmu5r1RJYyUENB5lFR9g6Nb1Nux4g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_224335_101173_D9AECA61 
X-CRM114-Status: GOOD (  20.62  )
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

Hi Frank,

Am Montag, 9. Februar 2026, 20:20:24 CET schrieb Frank Li:
> On Mon, Feb 09, 2026 at 04:50:14PM +0100, Alexander Stein wrote:
> > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >
> > Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK.
> > This improves stability and detection at low temperatures under -25=B0C.
>=20
> Nit:
>=20
> Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK to impro=
ve
> stability and detection at low temperatures under -25=B0C.
>=20
> If you think it is okay, I can update it when apply it.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thanks, this sounds even better. Feel free to amend it when applying.

Best regards,
Alexander

> >
> > Fixes: 0b5fdfaa8e45 ("arm64: dts: freescale: imx93-tqma9352: set SION f=
or cmd and data pad of USDHC")
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  .../boot/dts/freescale/imx93-tqma9352.dtsi    | 26 +++++++++----------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/a=
rm64/boot/dts/freescale/imx93-tqma9352.dtsi
> > index 3a23e2eb9febe..ce34a296495c4 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> > @@ -271,21 +271,21 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x106
> >  	/* enable SION for data and cmd pad due to ERR052021 */
> >  	pinctrl_usdhc1: usdhc1grp {
> >  		fsl,pins =3D <
> > -			/* PD | FSEL 3 | DSE X5 */
> > -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x5be
> > +			/* PD | FSEL 3 | DSE X4 */
> > +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x59e
> >  			/* HYS | FSEL 0 | no drive */
> >  			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1000
> > -			/* HYS | FSEL 3 | X5 */
> > -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400011be
> > -			/* HYS | FSEL 3 | X4 */
> > -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000119e
> > -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000119e
> > -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000119e
> > -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000119e
> > -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000119e
> > -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000119e
> > -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000119e
> > -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000119e
> > +			/* HYS | PU | FSEL 3 | DSE X4 */
> > +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
> > +			/* HYS | PU | FSEL 3 | DSE X4 */
> > +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
> > +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
> > +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000139e
> > +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
> > +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
> > +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
> > +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
> > +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
> >  		>;
> >  	};
> >
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD0ACC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRE9TYKLF/tjZX5aLFVe0iHhVl7KukoN/rYEWXfPZ7Y=; b=YWfLAkJZkDB3+heXs3+BS0M1W5
	CQenz5AY01SF/nYxkcrYPtebS9LuKicU47hph2H/DKBR1XbyiXH2x4+us1FCHIveGmpsng4M5NEoY
	qbNJDINu5Oc6NdBk90Y6lsud5o550OuoRgpnWlITNU2vj88Z/y8BfJgwvst47KsQF2yTepK4Xsvsn
	HhOGhet7Ejc3yCxM2+5TuWDHdPS0q+FwLkY63PQV6et0J1WmtUMt0I8a8VeaiGSLWoILBq9UGbI+I
	Lr7FKdivHHm9+ODuZoK6Prsj/ZZPSC5zYKhcqaRoUK2fzm1kXrQdWe0hvIn3RzIa0aNOf0oI7Buq1
	Gd/88/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGlx-0000000H8qV-1lW6;
	Thu, 15 Oct 2026 08:25:09 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGlu-0000000H8pu-1p78
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZRE9TYKLF/tjZX5aLFVe0iHhVl7KukoN/rYEWXfPZ7Y=; b=MZ3+x7VP1t2K7cPkbBmet9IWgX
	XXbss1UeBss3IrZXh6UXVrJoJXBDTGUloSVuJ70WfmoFm5LMxxuKbRNIAEZ24TRfAOm5wGTw3Hp3a
	V88fQKZazCehrIOlN+N3LDOl+HHP2t45BWnP4yuf0j9anSs3DiM63obW6E6vOOh2AH69O33RY6ByH
	0vo8T+PB+mX+dupqpFdUDUq7vT7UC9l3vwxEpE7IhZH0ewvt7SnmoPzHIAyMw35hpgnFKy2YnvMME
	FkmTyUyot1Qrz6Qbo9Wr8gvsPYqiFWhhOtzsm4Hv3XyDwQ41R2UXFqiZXFPmm3FjNax6momT3lC0o
	1HMB07bg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xHGlr-000Ici-2T;
	Thu, 15 Oct 2026 10:25:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xHGlr-000NCR-0T;
	Thu, 15 Oct 2026 10:25:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@oss.nxp.com>, Liu Ying <victor.liu@nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller subsystem
Date: Thu, 15 Oct 2026 10:25:01 +0200
Message-ID: <5661700.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261015063105.GA5720@francesco-nb>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <as-JyQG5vgaPYLeH@SMW015318> <20261015063105.GA5720@francesco-nb>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28154/Thu Oct 15 08:24:22 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_012506_606954_D13845AB 
X-CRM114-Status: GOOD (  14.33  )
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

Am Donnerstag, 15. Oktober 2026, 08:31:05 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Francesco Dolcini:
> Hello Liu,
>=20
> On Wed, Oct 14, 2026 at 08:55:21AM -0500, Frank Li wrote:
> > On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:
>=20
> [...]
>=20
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8-ss-dc0.dtsi
> > > new file mode 100644
> > > index 0000000000000..e94fbc6eae07d
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
> > ...
> > > +
> > > +	dc0_pc: pixel-combiner@56020000 {
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <0>;
> > > +		reg =3D <0x56020000 0x10000>;
> >=20
> > reg should be first property, check others, you can use

You are right. I'll fix.

> >=20
> > https://github.com/lznuaa/dt-format/
>=20
> We have a tool in the Linux tree, ./scripts/dtc/dt-check-style,
> I would advise to use it and improve it if needed.
>=20
> Documentation/devicetree/bindings/dts-coding-style.rst is the reference
> document.

Oh nice, I wasn't aware of that. Thanks for the hint.

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/




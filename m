Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2807F94CC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 05:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lY/hgFBno9RfdYpXPt9j6UEb8sKZ4/mklIZ8F7pl0vM=; b=OJiuK9HuHAUrgnLZd6CUpnBm5I
	3a2EUKCiQaGiB9FnqcyYyfjISlDvH2eab3BFqxFjHKKJB2TQQ1rLaeBzgXOr4PIpYlMd3HRin/oQ1
	2IkrfeQd9BhgtPZswYfw7x4UQvKv6QD1sM3P+Kbv/28h4eHGRlPyywmNjhuvUR0H3dhu2q8VN/dBi
	smxrZ/XFhVyz8Y8GSa7EaV0DDP0dJftRvQFiN+irrmvKSFdDRRcknh1DE4wku+aMRrOkBJ9WCcFhC
	880F+DnCqm50GiHnu6iMsqvbRqxfbryu7jBlFl/jeuWrXpz4g1YfkhC+Fz3kFKWPQmkeLQmmtLjiS
	AsASNwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQbT-00000009dGW-0wwD;
	Wed, 22 Apr 2026 05:58:27 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQbQ-00000009dFe-235E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 05:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lY/hgFBno9RfdYpXPt9j6UEb8sKZ4/mklIZ8F7pl0vM=; b=HXLCoyB+DDPSKlJJ3Boim+K+Al
	rIESKF3BZiqSWEeF9naIuwgDEmrEnO4nD+xWLLokehnTu+fJEjeqpmT5vdXlMlrtaTgAIaC2tYJzY
	b5APdYSaLl57W/2Z18OmHKDUJv/BNlQTxQ6vAY/UA4JXzywlhyBSYJoK5VXNjhvBioTpH+VEDfks7
	XSjtJPD4qXuo/NYxyPrwWr0WGdC/iFVSfdaRj/71uWzG5eZeIQrOX2HcCiSGQmAK6mJ6NO0YMtnFw
	jXqbZLteEFgYE7unJ5SL0fbyROzQSvQwV9siF48xzWx0Ri0TN9qr1Nymw80+gbLcDCaldNfbU69O4
	IikISMtw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wFQbF-000GKu-0q;
	Wed, 22 Apr 2026 07:58:13 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wFQbE-0006jK-2r;
	Wed, 22 Apr 2026 07:58:12 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 linux-renesas-soc@vger.kernel.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Date: Wed, 22 Apr 2026 07:58:11 +0200
Message-ID: <5988897.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
References: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
 <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27978/Tue Apr 21 08:26:17 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_225824_636984_075A28C3 
X-CRM114-Status: UNSURE (   7.76  )
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

Am Dienstag, 21. April 2026, 16:48:25 CEST schrieb Daniel Baluta:
> [..]
>=20
> > +
> > +	reserved-memory {
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		ranges;
> > +
> > +		linux_cma: linux,cma {
> > +			compatible =3D "shared-dma-pool";
> > +			reusable;
> > +			size =3D <0 0x28000000>;
> > +			alloc-ranges =3D <0 0x80000000 0 0x80000000>;
> > +			linux,cma-default;
> > +		};
> > +
> > +		vpu_boot: vpu_boot@a0000000 {
>=20
> Should this be memory@a0000000 ?

According to schema in dt-schema repository [1] the node name should
describe the purpose, so I would keep that. But despite that it should be
vpu-boot@a0000000 (without underscore). But as this is unused for now,
I will remove it.

Thanks and best regards,
Alexander

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/=
reserved-memory/reserved-memory.yaml#L25-L28
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




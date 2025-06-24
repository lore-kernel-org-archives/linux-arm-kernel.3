Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F017C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMGvq5izqaCufxhRiVPujUUpUHBSgsiKUBqKnX7JNlQ=; b=QFSMdTr8zp5FfVxqUjmEdgEkXU
	qFShLOvUB3gWxAIJ06F2LIfaZgLX9uQsCys8KJMeHzU2WV66jrC9UsGxRLTmiC9TC8F3TxcdWRc5W
	zuF1i0gPdnbSF/qjKb68C+nClOUSpT/MCnSZVHBtVbftAVaVs1U20FMDjfGgy4iGH8EeaigDUYEhO
	WAakH7A9fG/Y5mKmPUKYcb+BNd6Z0/zV7Sei5Mi8o/CPU4Rg098g6RJ+l4DGzWlnGxG0F6wFXHRuc
	UkrqRSY+PLBfQS7eHVaa+Z0iAXOEorsAnTYgUNenyjkSUF+1+E/objiZHaU6eK55NArFL3gDK2Sde
	fb5viEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0MI-00000005EKg-10ol;
	Tue, 24 Jun 2025 09:54:30 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0Ij-00000005DfU-13xU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750758649; x=1782294649;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LMGvq5izqaCufxhRiVPujUUpUHBSgsiKUBqKnX7JNlQ=;
  b=lxUxsL1+vqYqlbjnAM8PM9F5tGrjIayAnrqPPbRsFDVin6bdB3SuDPg2
   2U6lv+9T8yFppFrUU4kO3hfW01hHKPkybYdMTf83hLe6zP4xKyedxZcGa
   k8LQ3b9l2wTXlMK9jvn8Q2L5t6iI+93Mv3jkcTDDG8XSl/HezhJ4GANug
   2WLJQScoia2GB6OLzEZCLLWtFejiPnx4Sa2Pl6McIStQqLMLiMsrPFh5H
   Rr8F+v3nTZQOIyPsfEd0YreC7xBzsuSOBLIaSSl18d4XSh191W7YF7o7Z
   a8sXo4PH/AJgl6fV367lvIPa55oCYK4fS5/l0c1CgRIGIVUHTCndXd8Je
   Q==;
X-CSE-ConnectionGUID: KICRVeP3QlulX/kotH1+Xg==
X-CSE-MsgGUID: ezbuiKoOR1GHGp04JT8P3w==
X-IronPort-AV: E=Sophos;i="6.16,261,1744063200"; 
   d="scan'208";a="44815220"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jun 2025 11:50:44 +0200
X-CheckPoint: {685A74F4-1B-497D558D-EBA6F5A1}
X-MAIL-CPID: AC4B4CD97CD6F92F69E614E9AA2668BB_3
X-Control-Analysis: str=0001.0A006371.685A750A.0024,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01D4F160CB8;
	Tue, 24 Jun 2025 11:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750758640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMGvq5izqaCufxhRiVPujUUpUHBSgsiKUBqKnX7JNlQ=;
	b=UW9BFEojEvhcAZFnETze/5ThQTbY1gX9IZ4v9Ih5NDKtzX864wBUtU+4nJceSZ2NEgOh66
	XTfqzpvZDNav3qidBA6Xpfb36ZDO49P5Oc5bYAn84Y+AJXD4rGLsf5ATUVIthkx5zz65WY
	KUqZVolQDhb5ve8iTSSkPTjX2VBklFgwm3Q6/djjDiJZAoVuW5Uyxna+qKebtMq2PqOD/f
	nF0ZgV9FvjQ0IIhJyPlVJGMcWIIAoQhRj7mQqYY8h1ovgJFoA9Ltsk95yNK0O4uJhY2zUP
	YBRvVWkDIVQ3+VJJPz0nPVP3r0uvANNQEdpiW4dX+9+WP90hKtCzHyic7VEeug==
Message-ID: <ba1fba45aef0264d1215c3abac1d74e3ad2c33f2.camel@ew.tq-group.com>
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andy
 Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>, Nishanth Menon <nm@ti.com>,  Vignesh
 Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
 linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Tue, 24 Jun 2025 11:50:35 +0200
In-Reply-To: <a0904f35-8f26-4278-9090-9bbeef905ef7@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <20250415131548.0ae3b66f@fedora.home>
	 <a0904f35-8f26-4278-9090-9bbeef905ef7@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_025049_642258_72C2A226 
X-CRM114-Status: GOOD (  14.67  )
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

On Tue, 2025-04-15 at 15:12 +0200, Andrew Lunn wrote:
>=20
> > My Perl-fu isn't good enough for me to review this properly... I think
> > though that Andrew mentioned something along the lines of 'Comment
> > should include PCB somewhere', but I don't know if this is easily
> > doable with checkpatch though.
>=20
> Maybe make it into a patchset, and change a few DTS files to match the
> condition. e.g.
>=20
> arm/boot/dts/nxp/ls/ls1021a-tsn.dts:/* RGMII delays added via PCB traces =
*/
> arm/boot/dts/nxp/ls/ls1021a-tsn.dts-&enet2 {
> arm/boot/dts/nxp/ls/ls1021a-tsn.dts-    phy-mode =3D "rgmii";
> arm/boot/dts/nxp/ls/ls1021a-tsn.dts-    status =3D "okay";
>=20
> This example is not great, but...
> arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi-                         p=
hy-mode =3D "rgmii";
> arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi:                         /=
* 2ns RX delay is implemented on PCB */
> arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi-                         t=
x-internal-delay-ps =3D <2000>;
> arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi-                         r=
x-internal-delay-ps =3D <0>;
>=20
> There is one more i know of somewhere which i cannot find at the
> moment which uses rgmii-rxid or rgmii-txid, an has a comment about
> delay.
>=20
> 	Andrew

FWIW, I've decided against including the comment changes in this series for=
 now
(going to send a v2 in a moment), as non-functional changes just to improve
style or make checkpatch happy are often frowned upon as unnecessary churn.

Best,
Matthias



--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/


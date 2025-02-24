Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF2CC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjylcePXrVUnF6ZSzcm/lAR7+n7JhJ5A0QnbNiuRMSg=; b=zxZlUtz2jDQNRbB8huICwvwNRo
	NoYZbmS7R/SBih1kRrtz+muC8NiL8gFEwow9f3WNxmmGWSFQp1AamC3VPI0ZeD6ZQNnq3H6mNmUze
	5rmWqteQLwVPR2aZ1C9BMuniFjZHGBMMQhfAtfvD743t/D4GuESlUvTEq6T53r55Vx6IiCkfO7Q66
	y61Fjv8SwvvBB0wVhWMOaWRS+jG0CToGAj8VGpVU1PHVpPvE168euhrhvcJyTkWowToUhHzmyjy9+
	SVZi6PryJbQRVV7d6aZpGt8Y/ZMFwNcy2KkAVGDor5X6TYEFKjVBlehz2qAsdW/pbS39ku9lsYLy9
	gyooSFNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUu8-0000000Cwsb-1rNZ;
	Mon, 24 Feb 2025 09:37:36 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUWb-0000000Cqyh-013T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740388397; x=1771924397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AjylcePXrVUnF6ZSzcm/lAR7+n7JhJ5A0QnbNiuRMSg=;
  b=aSvUiErfd7QuKKaU5pAbic1DGtqS24z0kvmV7/ws84uNNGvQU+6AcYMS
   mttEk6Ws2JVROQwCDzWtsM2u1KqiJVCbqru+3WluRf7OFyAfXnu1zOgko
   i4WkoMaQIRPRhHTu0vdUf0JOG+yZMIrNK/vTkcOBg22pc2E5NDpl5kvxE
   Yp2rbCnsZGFfWTJV4u4kfUevcivcvaTc/j+rjjK1voqV6WiOtCHZd+qAG
   sLaYQeoRFeqYCSt/rBAgk4qT75SYIcrVbyqjcymJhKbmKlLFW5husd+H3
   0fnqJpGtHY2Uqpm1xcYL9eavLrXKA8K0I7Jf83MjRbXTyN1IF5XvlUeVh
   g==;
X-CSE-ConnectionGUID: wmngbpdqQX6ZkS3h2ZUSfQ==
X-CSE-MsgGUID: zx5xB7opSoqf208iCoSzfw==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42032430"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 10:13:11 +0100
X-CheckPoint: {67BC3827-E-B8541F8F-E50F9B0E}
X-MAIL-CPID: 01CE408A85210DB28F086B4BC67B11FE_2
X-Control-Analysis: str=0001.0A002114.67BC3827.0039,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69C04166011;
	Mon, 24 Feb 2025 10:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740388387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AjylcePXrVUnF6ZSzcm/lAR7+n7JhJ5A0QnbNiuRMSg=;
	b=sY9nQ0VwRxGqUaoFjGRj6FzsosJtQC16bPK16Ap9UL9cM8M8UnE8gZpdRZehylkaXF+Zmj
	Wi8jm8/SXD2CtEALuHfqxEAXxm2liYsbu92O8vzfEdDvUJQNQ4HMJeWnU/DQTCT/hp5tXu
	Gfe3/rD+RUur5byTub/NTrriVjI5OKwmMTFI4L0tsmMYiZGzdZ4hJiOqcaum4Su0L0Xvpm
	YAkQixnZQYO+6F0/iXHzhtpQn34GFHr+GN1KkNOiqlMDLQOy76taIvFT1emdkWMbJDieoE
	b+hFvSdyGmort3xMhaoAdna3igoWUohVTZXyNJHEthLwrtxA5whI8b2FmiWGAg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx53-mba53: Fix the PCA9554 compatible
Date: Mon, 24 Feb 2025 10:13:05 +0100
Message-ID: <12615755.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250220133153.2380248-1-festevam@gmail.com>
References: <20250220133153.2380248-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_011317_534151_C4B44DDB 
X-CRM114-Status: GOOD (  15.32  )
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

Am Donnerstag, 20. Februar 2025, 14:31:53 CET schrieb Fabio Estevam:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten =
Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> From: Fabio Estevam <festevam@denx.de>
>=20
> gpio-pca95xx.yaml documents 'nxp,pca9554', so use this compatible
> to fix the following dt-schema warning:
>=20
> failed to match any schema with compatible: ['pca9554']
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm/boot/dts/nxp/imx/imx53-mba53.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/dt=
s/nxp/imx/imx53-mba53.dts
> index c14eb7280f09..3cdb87ac1d7c 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
> @@ -162,7 +162,7 @@ codec: sgtl5000@a {
>  	};
> =20
>  	expander: pca9554@20 {
> -		compatible =3D "pca9554";
> +		compatible =3D "nxp,pca9554";
>  		reg =3D <0x20>;
>  		interrupts =3D <109>;
>  		#gpio-cells =3D <2>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




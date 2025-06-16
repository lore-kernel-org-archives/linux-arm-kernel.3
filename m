Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C50C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxALRRYScDYKnexuf1UxNeEFBeVRTJqf7bEilvpn8nY=; b=dOHNjIfJV78kfZRtfzHcM0xJDZ
	hBIWi7ou8Zrx+bbp8xPKqOmjnQ1qdJeG+wvOwkHlf0es2PKwL8bEYITKFZKMfsQceTCCbPqUKvLVz
	lJFDQh1+LTSK2usmhRozKcfvG/9S1jIR0FyRwKNSxTjv1UrKsuJPfd5E+q56or9uqErXsby2Up4ad
	Y9+5qtX2GHzR8LN1DCxZHKwfgrjaGkxoFcgtmUXgAj/Iff2VfuZ3V+40thkCbiFRteWjc/UjJuCc5
	XqvxlIY8qFqq3KY7V9UT94RkF86xBBEjtoZ+Npa7Qyku6lGWu47Ku3RB8WyF3OLk4vM103gCGgOcR
	/3VFGs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBie-00000004p1D-182g;
	Mon, 16 Jun 2025 15:25:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9Si-00000004SvM-10PQ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Jun 2025 13:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yxALRRYScDYKnexuf1UxNeEFBeVRTJqf7bEilvpn8nY=; b=FQxTAHwjSsY0fp6f88Blya3ol+
	Ogx/g/vIuAUo2gm/SpG6GXDJhveBDOki1hQpTFB2k2LQVdVkBn9TuvzPTP1ERgzGSn6dRljnwMBgn
	glWKhN2FxcbWhl+rxwv/uMQqFty33+5/3P0Vb8RbL57LwWI1CpwS633Fmw1HN5e3A8qIvmEny/oEW
	hAVeKwoDEEVb9bxGOFyAvD3yK51bPOPBefjAWTwDjAaYv6bjsH+aPtuCpG4+bJ5skDO571O90+ruD
	1whoE3s0sdbJGsEeVjZ1IlCgJuDMik59BzdSsOQWcLzJOcxEj9HPB2h8QJhsVHyOweKNsaKeqIMuj
	YTh+clrw==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9Se-00000003Zyr-32yX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750078875; x=1781614875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yxALRRYScDYKnexuf1UxNeEFBeVRTJqf7bEilvpn8nY=;
  b=EjIepi9UGOg91U91kxttqE/hMteCn9bfSkxkGen52m+aT+ZGKtsS0da0
   56k5I+3QEQqIhoknapLBK1QMrL0Mvth5BAoti0YtCsnCMBOw1uaIp0/nc
   AtYuGAh2Mjr25lJTUucatUIvtjmPSUGxm+RALBdjwpisPtvs487sXQ65i
   2MAKnjoMCiEb0eywLkMehyC3jmcHlBDfRfwq2pDZRP24wf2nbKYHhC7fZ
   hlaZCSUPohCcR35gLoAqMeKyS4raLY5IH6FWkRmXvAjlh8fTz8quVghCY
   KaU+3Ssqr+ReZmVfcO9kXjTbM2aXpRAqwipQiqezU5AKm3edmlPL1dfPh
   g==;
X-CSE-ConnectionGUID: ykC0lJx2QwyDuee7QurJag==
X-CSE-MsgGUID: nCf91h3nQ7y4VxRRpe5wIw==
X-IronPort-AV: E=Sophos;i="6.16,241,1744063200"; 
   d="scan'208";a="44660120"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Jun 2025 15:01:12 +0200
X-CheckPoint: {68501597-32-28ACC837-DD1065DB}
X-MAIL-CPID: 0D78A9916BC46A124D0B2A24D9C3DCEA_2
X-Control-Analysis: str=0001.0A006378.685015AD.0055,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07815169520;
	Mon, 16 Jun 2025 15:01:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750078867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxALRRYScDYKnexuf1UxNeEFBeVRTJqf7bEilvpn8nY=;
	b=kjZ68fhUvFFeJkU6SrbOnINd8NZvl1oPW17GzZaKqV8t57ObVZqmWjlbhy5Z8fxOBaFHt2
	3rLF+RdsJkvr3IlFTV2uuhX4DFVS/ComS89kCpMSCwjnEE9Ey5NEOQgypbD68oqQk54VQs
	DM+h8ILls0CNse9+f3FJWp74gY0qtnppLVdo8zy8mJDHZws0sUdu9fkLAgGE6YsQXpr1jv
	Kp3NowvMt3shYe5hRzm16klR8pgp4KtYuvv5+iw5QDsMrl5wZFfGYVQUceysgxroT2dfWS
	169P/nFSXo/SwqYAW9ROBkPvwzUnMoyVfAd2tMZE8qsH4U2gJZHimViXvKsWzA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com
Subject: Re: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to
 include display name
Date: Mon, 16 Jun 2025 15:01:06 +0200
Message-ID: <2788842.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
References: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_140117_083841_B44930E5 
X-CRM114-Status: GOOD (  12.83  )
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

Am Dienstag, 8. April 2025, 16:08:55 CEST schrieb Alexander Stein:
> This platform supports several displays, so rename the overlay to reflect
> the actual display being used. This also aligns the name to the other
> TQMa8M* modules.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile                        | 4 ++--
>  ...s.dtso =3D> imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/arm64/boot/dts/freescale/{imx8mp-tqma8mpql-mba8mpxl-lvds.dts=
o =3D> imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} (100%)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 93cbd8d5081b3..38ce3d1c41c10 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -263,7 +263,7 @@ imx8mp-tqma8mpql-mba8mpxl-imx327-isp1-dtbs +=3D imx8m=
p-tqma8mpql-mba8mpxl.dtb imx8
>  imx8mp-tqma8mpql-mba8mpxl-imx327-isp2-dtbs +=3D imx8mp-tqma8mpql-mba8mpx=
l.dtb imx8mp-isp2.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-imx327-isi1-dtbs +=3D imx8mp-tqma8mpql-mba8mpx=
l.dtb imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-imx415-isp1-dtbs +=3D imx8mp-tqma8mpql-mba8mpx=
l.dtb imx8mp-isp1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx415.dtbo
> -imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs +=3D imx8mp-tqma8mpql-mba8mpxl.dtb i=
mx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
> +imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs +=3D imx8mp-tqma8mpql-mb=
a8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs +=3D imx8mp-tqma8mpql-mba8=
mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8-dtbs +=3D imx8mp-tqma8mpql-mba8m=
pxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtbo
>  imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1-dtbs +=3D imx8mp-tqma8mpql-mba8mpx=
l.dtb  imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-ov9281.dtbo
> @@ -277,7 +277,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl=
=2Dimx327-isp1.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-imx327-isp2.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-imx327-isi1.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-imx415-isp1.dtb
> -dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.d=
tb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds=
=2Edtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm07=
0jvhg33.dtso
> similarity index 100%
> rename from arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.=
dtso
> rename to arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm=
070jvhg33.dtso
>=20

any other feedback on this patch?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFDAD3A66B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xnnhu6qFH7VFwsOlKt17qfnRuMYYX2PS9PBpQlWCIPI=; b=lan4pM8rLNzQ9iGdNX/dm07fDK
	9twfctuTylz+zcdrgLAsfZObPXuwelA2l3SDbG4SupsYw7tKwWO31qMM03pILy3C4i5BNqjd8HmTf
	wDrGBxX2vrFJ4mR/1iPqoKFoQdK9OScUtkMS38rXDbeL4wjVnu0u+aFSyHSDsL+tlIV9BSoceJg+A
	40QocdXdm/jJ7l0CKN/auVMTRCrk5kctAGNXIPk6UnPPg4OOe/suyPHMC1UJ1K+vI7JQGCbY9cZyk
	u0FCbz4aNOUeuFT4fK+xVLbRC5nr2GzHjOh6eeVEOmF9uoZLJvwbPu+VJHyzon9fVnJ2SZHZrjEoO
	oAYXXeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o1n-0000000Et6Q-2KCQ;
	Tue, 29 Oct 2024 15:21:03 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nwx-0000000Erw1-03bW;
	Tue, 29 Oct 2024 15:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730214963; x=1761750963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xnnhu6qFH7VFwsOlKt17qfnRuMYYX2PS9PBpQlWCIPI=;
  b=mfQiXpcZmglvWHkcMQLXf39jJaWqJ5UGM1lJ1WY9P7/iJK924Z0YuI7d
   UQzeRuv4xTcIVCwxWDAV1kjpTkiW6XBBvOjoC0nBg7pTcfLZ/V1FtMPuw
   /PvqKcxD7nuDWPINDMQIKvwMrIBJWiX/LptskA2lT3geUemmIv5TjBbka
   OGhpO+2ZKyBx/9LmUnihXvD+/2GsUzwTfG6VZ1PBmWcdYcuMzVv6TmQqP
   7EdBjTbGKPBmzTgEjRMG8INgdNCLkI9UUspKrfvyNRU9fKrTj3ro6UnE0
   4yl0+UfuaVRloNt70QXC91dvcGwdJ8ncuoxgukKpFggmIdLuZkI1vS5wL
   g==;
X-CSE-ConnectionGUID: PlA3dqpiQhaNVhgQyoJqPQ==
X-CSE-MsgGUID: JmlQCz2uRPK2dCFOZprfYQ==
X-IronPort-AV: E=Sophos;i="6.11,241,1725314400"; 
   d="scan'208";a="39740542"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Oct 2024 16:16:00 +0100
X-CheckPoint: {6720FC30-B-86C05612-CA75E1CA}
X-MAIL-CPID: 1CB2DB3660D5383FF40F679AE29068E5_1
X-Control-Analysis: str=0001.0A682F2A.6720FC30.006D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD503168B60;
	Tue, 29 Oct 2024 16:15:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730214955;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xnnhu6qFH7VFwsOlKt17qfnRuMYYX2PS9PBpQlWCIPI=;
	b=MDnpa8n3IBHUOrIcd+jECea1KhhY6bp+B2dALBwARYqkeHJOrWutlx+gYBZLOlPY9cXyy9
	y6+XUfjIoQOyd/aTFFedW1ym7GbNogHvTPJ9nmGA8SfOCDS9YStKYXqmUaQ3h5Kk3CwXcJ
	ZlUbORR9urvdR+DNMrfGS5PhZoUd8iPCOgPZy2gIqhymGfUsh6IViued5A7U/CYzXNOesB
	NESV1WsNiv2kBamH/C6nUF41hr5zUSYKt5/3MRspDr/OJ40GiB+YUjTUBJ4QzWKHZjelNX
	nMSzeMf+GBB3qyUoRtbysfyz8JuPdst+uRww5M8yBk8aII7EweswwpFAHU/Iyw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, Xu Yang <xu.yang_2@nxp.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] dtbs_check warning clean up against fsl,mxs-usbphy.yaml
Date: Tue, 29 Oct 2024 16:15:54 +0100
Message-ID: <6099458.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <172917937246.288841.15901592420939223719.b4-ty@kernel.org>
References: <20240926073951.783869-1-xu.yang_2@nxp.com> <172917937246.288841.15901592420939223719.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_081603_377864_15A13714 
X-CRM114-Status: GOOD (  12.01  )
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

Hi Vinod,

Am Donnerstag, 17. Oktober 2024, 17:36:12 CET schrieb Vinod Koul:
>=20
> On Thu, 26 Sep 2024 15:39:46 +0800, Xu Yang wrote:
> > Some changes to clean up dtbs_check warning against fsl,mxs-usbphy.yaml.
> >=20
> > The first 4 patches are used to fix below warning, "nxp,sim" is only
> > needed by i.MX7ULP:
> >  - 'nxp,sim' is a required property
> >=20
> > The last patch is used to fix below warning:
> >  - fsl,tx-d-cal: 5 is less than the minimum of 79
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/5] dt-bindings: phy: mxs-usb-phy: add imx8qxp compatible
>       commit: 76b4f2a5cec59e842de4b5989eb990a2ee8cedf3
> [2/5] arm64: dts: imx8dxl-ss-conn: change usbphy1 compatible
>       (no commit info)
> [3/5] arm64: dts: imx8qm: change usbphy1 compatible
>       (no commit info)
> [4/5] arm64: dts: imx8qxp: change usbphy1 compatible
>       (no commit info)
> [5/5] ARM: dts: imx6qdl: convert fsl,tx-d-cal to correct value
>       (no commit info)

Did maybe something go wrong while merging? Only patch 1 has a commit SHA1
in this mail.
Also only patch 1 is available in linux-next

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E785C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IA7dsIXLKv7cmvpo+Mybfca1vUSev2LFZHY5ABbB46A=; b=TXuz+CSl8bKW3Sh0XQ75xfmDQh
	IBySv9i5nwkVjfAdyqysa1ax3t/i8UHvQxl3cNTstG6166+O5cdx4YN7KDrGixkxfYGIQ8Jnsk19S
	26ouH4t63X6rKVuObeB/pre+7YDH0FC6kcmoOCOIt/ud5QvXLK+cLgdW5rUG5pj5tmd3Op6FB6WAJ
	86TQUDYxcFf2SoiyE2Tysfzg21avNskkOm3gTDgsaJwu4+j9im7mG5ZS6DY/JMgGDCJhhKF640fyo
	AsCgdGdF2R4APfGOrL2+P3r3qhA7pYwRwWuO1OUThY7HacjZVwKKGxkzrYSGe7d4E1VUD0cumYZGQ
	ybdYFKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtC6-000000060By-34Bs;
	Tue, 10 Jun 2025 07:14:50 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOt9x-0000000604e-2Dm3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 07:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749539557; x=1781075557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IA7dsIXLKv7cmvpo+Mybfca1vUSev2LFZHY5ABbB46A=;
  b=VE7ufg688TLv2+Gimt/2CbmqpSuSfbgRKWeuwuNu+QTnUoeJCWKY2GvT
   EvZIM/lBJ+xlukLMkfr3/nU00wFD3iLmNYp8KlS5vS020Sx4VuIlbCpiM
   cqwebitfxBdlOxnPWb2+clc1efSBTA3v3+SA/DbQt+zzN5zbnPpDUBrTW
   XORpIDTNroS3w+gxRQSVAx55HZ8vymBnQnfmtKH9210KXc2GSD57rXSqy
   ZVA9bUj3QEoj0c0kzvO9yXzsr6ZvbfkYoOa5ZgXoZiRcOct4F/GBE8GRF
   EaltvwzC8xgbpSzus9MZPYvl8mzLZbbrLF6HxRRcTyl5RP9SFvR2Ooy1p
   A==;
X-CSE-ConnectionGUID: fA3TVHqiRBOxqf/Q+mGaRw==
X-CSE-MsgGUID: rGinyqaER6WoZUKPcnwIwg==
X-IronPort-AV: E=Sophos;i="6.16,224,1744063200"; 
   d="scan'208";a="44535023"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Jun 2025 09:12:32 +0200
X-CheckPoint: {6847DAE0-18-476CAA88-C60F6DCB}
X-MAIL-CPID: 1FD1400D779E047ACCE98C823177DC56_1
X-Control-Analysis: str=0001.0A00639C.6847DB01.000A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EBD51644F0;
	Tue, 10 Jun 2025 09:12:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749539548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IA7dsIXLKv7cmvpo+Mybfca1vUSev2LFZHY5ABbB46A=;
	b=LMsECaz/6WqFjW9c9hSzKZqdCwCDa7iRyEGktjb4aXxAdE5PcO/HeMC4dPHYHX7JQPA1El
	vXGolpoMVPdD7IQJnJ6KwBqcC4k45BGMW7vwqyQ/YmC67Uv4eRwEXUiGINXBn+Uy+4NMn2
	bPwnSoUdO8j+Xd/1/t2eGCBNBiEW1sCC8cA7ra3vAoRVQZlSZ0z20Zn7ebMuDCSEMhrxqD
	i9HSyP3CGV7a67V/4HtqEUdfrYbINCxTkuxz09QQBjiCqaVbClP/Sx6mWEIcLHEiNvzYyn
	Uju+GLjSwjvb33OwFT7TTbhiulKoA85W4XOkn3JVfHYfAqKi/CNvKCPPMEWLHA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] media: imx-mipi-csis: Fix field alignment in register dump
Date: Tue, 10 Jun 2025 09:12:26 +0200
Message-ID: <12685072.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250608235840.23871-3-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
 <20250608235840.23871-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_001238_100250_ADDC0680 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Laurent,

thanks for the patch.

Am Montag, 9. Juni 2025, 01:58:34 CEST schrieb Laurent Pinchart:
> Commit 95a1379004cb ("media: staging: media: imx: imx7-mipi-csis: Dump
> MIPI_CSIS_FRAME_COUNTER_CH0 register") forgot to increase the maximum
> register name length, resulting in misalignment of names printed in the
> kernel log. Fix it.

Does this warrant a Fixes tag? Anyway
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/p=
latform/nxp/imx-mipi-csis.c
> index d59666ef7545..b652d59851c2 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -895,7 +895,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_devic=
e *csis)
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(registers); i++) {
>  		cfg =3D mipi_csis_read(csis, registers[i].offset);
> -		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
> +		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
>  	}
> =20
>  	pm_runtime_put(csis->dev);
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




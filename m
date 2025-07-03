Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39043C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04qYGKXctFAZ3e5+Qm8FZ6hK/vJxUFD2rK/A5VS3svY=; b=PLvA31ja99XSY/BxtaRw5W3yjV
	rYnPAQr6USIYNXr9Plh3rHHMxYA514zKZHPqtCERrxPUu+zUgoP01bgSkO1MWIt+MujNDd/STCyO8
	ECjzahVIMC/12MKmr6G4+MMZSqE7Dq7R1Y5z8MozlVZKYxkA77H8lBUOMd5US9UEr1E1hcxzNEdcQ
	xNqBY3VEwvEK96pP9UhL3rqRbPXl9UnIiK6Ov1UPIF6Y6SAGdHU0KytQC0cgxRHMtNnH1MzUkMQTB
	ECmVWrwnNek8Sm/dUN58ZBgZWhro1s230IGaciyZpVUPNCyRaRrtXcCkyLxM86lHm7EG281zrWhuy
	zM54nu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM0i-0000000Br5q-0az9;
	Thu, 03 Jul 2025 15:38:04 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKCF-0000000BX0B-27tY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751550111; x=1783086111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=04qYGKXctFAZ3e5+Qm8FZ6hK/vJxUFD2rK/A5VS3svY=;
  b=g5de0ijEbtFDoZnDxubZVuQoZiHZ6+h3i4NKD0X5z6z8rzXb0tae2jeI
   lx+O9IxOLxAOm5qs2ZYhjJiczfA6M5pKmqSJ/ajE+dYFYYw6PL2vmN1nV
   rHzf0kF/Dyp15jrAd1mDZAF+1NBLAZvuj6XYJ0M/aFS11fXh1dtrdLf2Q
   8QK84pv1l7iXSsdRawDotsnCea3rwFZarpP567N5l128skSxqtgsGssoB
   /qZGCrBc6iZ/kZiLXbAG4FKu8LrPa+p5DMXXeHoVA4HZfHM8zn3paTc3b
   18zEHSD6CJxLJXdTnlfKli68BBGQrWZSZwNLN5HWroQo7cgJXP+0PrXu9
   A==;
X-CSE-ConnectionGUID: QoxKM4g1RseAF++DkGCgAA==
X-CSE-MsgGUID: 8fICYet0SzWZ3FWt/bzHeA==
X-IronPort-AV: E=Sophos;i="6.16,284,1744063200"; 
   d="scan'208";a="45010991"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 03 Jul 2025 15:41:46 +0200
X-CheckPoint: {6866889A-12-4FC15ADB-CD71293B}
X-MAIL-CPID: 7E9CD1FEF2A5839123F58A657BCB8A76_0
X-Control-Analysis: str=0001.0A006399.686688BF.0033,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03A1A161869;
	Thu,  3 Jul 2025 15:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751550102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04qYGKXctFAZ3e5+Qm8FZ6hK/vJxUFD2rK/A5VS3svY=;
	b=NptWg52abfzeSToTSQmYoKJAZLV7kwBaXq3ncy0XzG1W8xulY2lg+0zDoqDA8i+oLRGleu
	pRYCZXRM5vHbg7v8eY6wvQtbspgfaGErcrMRFh+Z/ip2Hk6iQUjPocf9EDIaYyY0xIbpEO
	IphiGndW4kAJARGsCNLzkh5hQiAvi80Pnm77KXkZmGLy484EKfy1oTrE7/KuC3ovBfq1HY
	PNnDimssMw3skITQynyc7QIqtjt5B+TkSl1K2ceeifjgAfrGTYcyFimopMV4YCIlSUX86z
	LJNC7d4RILfaegRXAnida3ad7CASpi9e+YQU8tdATIqHgNgXr0UgyLLrde6L6g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Steffen =?ISO-8859-1?Q?B=E4tz?= <steffen@innosonix.de>,
 stable@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Steffen =?ISO-8859-1?Q?B=E4tz?= <steffen@innosonix.de>
Subject: Re: [PATCH v3] nvmem: imx-ocotp: fix MAC address byte length
Date: Thu, 03 Jul 2025 15:41:40 +0200
Message-ID: <2665065.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250623171003.1875027-1-steffen@innosonix.de>
References: <20250623171003.1875027-1-steffen@innosonix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_064152_037178_5049D063 
X-CRM114-Status: GOOD (  18.50  )
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

Am Montag, 23. Juni 2025, 19:09:55 CEST schrieb Steffen B=E4tz:
> The commit "13bcd440f2ff nvmem: core: verify cell's raw_len" caused an
> extension of the "mac-address" cell from 6 to 8 bytes due to word_size
> of 4 bytes.
>=20
> Thus, the required byte swap for the mac-address of the full buffer lengt=
h,
> caused an trucation of the read mac-address.
> From the original address 70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14
>=20
> After swapping only the first 6 bytes, the mac-address is correctly passed
> to the upper layers.
>=20
> Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
> Cc: stable@vger.kernel.org
> Signed-off-by: Steffen B=E4tz <steffen@innosonix.de>

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks

> ---
> v3:
> - replace magic number 6 with ETH_ALEN
> - Fix misleading indentation and properly group 'mac-address' statements
> v2:
> - Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
>  drivers/nvmem/imx-ocotp-ele.c | 6 +++++-
>  drivers/nvmem/imx-ocotp.c     | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index ca6dd71d8a2e..9ef01c91dfa6 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -12,6 +12,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/if_ether.h>	/* ETH_ALEN */
> =20
>  enum fuse_type {
>  	FUSE_FSB =3D BIT(0),
> @@ -118,9 +119,12 @@ static int imx_ocotp_cell_pp(void *context, const ch=
ar *id, int index,
>  	int i;
> =20
>  	/* Deal with some post processing of nvmem cell data */
> -	if (id && !strcmp(id, "mac-address"))
> +	if (id && !strcmp(id, "mac-address")) {
> +		if (bytes > ETH_ALEN)
> +			bytes =3D ETH_ALEN;
>  		for (i =3D 0; i < bytes / 2; i++)
>  			swap(buf[i], buf[bytes - i - 1]);
> +	}
> =20
>  	return 0;
>  }
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index 79dd4fda0329..1343cafc37cc 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -23,6 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/delay.h>
> +#include <linux/if_ether.h>	/* ETH_ALEN */
> =20
>  #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
>  					       * OTP Bank0 Word0
> @@ -227,9 +228,12 @@ static int imx_ocotp_cell_pp(void *context, const ch=
ar *id, int index,
>  	int i;
> =20
>  	/* Deal with some post processing of nvmem cell data */
> -	if (id && !strcmp(id, "mac-address"))
> +	if (id && !strcmp(id, "mac-address")) {
> +		if (bytes > ETH_ALEN)
> +			bytes =3D ETH_ALEN;
>  		for (i =3D 0; i < bytes / 2; i++)
>  			swap(buf[i], buf[bytes - i - 1]);
> +	}
> =20
>  	return 0;
>  }
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




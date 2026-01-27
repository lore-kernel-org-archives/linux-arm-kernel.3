Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8583FC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUH6gbSg3S533iqWlZ7raLgIM4/kSDOyTLmPhW+hpEg=; b=rLXoJFInoBXM+l6FP87KbZ1/DN
	8vdLIyNafp/CcjU5qeutDX+QsGAkdN/Eq6ztNR8jZ+gTmdB4EwKTH3JrCdFRwSx079q3Q3UgAl1Yx
	Zy80N1yBtKpxNXksxTPkmsv88qxSvzoHXqrKWr2/werxunetZ8Vd4zWJ0yroyRbzJ7YoRepFWahs2
	pR/Am5qeu86Unze2p3pgH8qcJxJjACRsV5gd2wPICc0Z46lRukVhxm/q/8qhD/muJ7ZxOBVI7+i+Y
	ssgpykv/Y+f/YKKOFpuVrHAkNTlYMaY1vZjjaveBcXmf9DVVrwnIzuxvOJHArmrXTtvkIY96CZfCM
	k7ACSjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfQW-0000000DwSY-08eX;
	Tue, 27 Jan 2026 09:32:00 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfQS-0000000DwR9-0TI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:31:58 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FUH6gbSg3S533iqWlZ7raLgIM4/kSDOyTLmPhW+hpEg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769506300;
 b=SlFXWZU0BGZteOLer2NYh+VYTeNHl8TvDVr5Fd1JuWC7eu/Q8nTYlmkx5eIRLRISoL56hmFP
 B4wHe44/vGMcN27wNnPKa5aIkbQLwqeOL3gty8thGpy+8clz1c5vQQ/jpYsL1H39EHcBwpfMwNm
 jeKX+WIP7Rds3KrXTxXrRa6IcjSoWRyOsg7pZmgKEN9T06GMSQ8JjPQnfVMD3GMaz5yrbQNRkZU
 FzyjxJ6UMCMCMIovqxuZTR07BJUErzW/5/jB75Z/AvifMgrst4VAQKM+i2IJUVIqkLBWWzoW/kb
 aMEjFBM7l0MugEd/bTapd1+cR1aaoHclB5Ev50biaw6XA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769506300;
 b=UlFMV0hU/M82LgFjTOc1hfn6D1xXzg6eXO4gR1OV1J4NaB6WFXM5bEBW5jrh4RRcslOvovKW
 9GIQoZ1K/pqHp7/LKd1Zg1QP82lBYlbmV5MP2tQaF6DnmsVIAT7GvZcRh2V/TVsiNERzUltZKeZ
 7z2I7SOenrNpIgF8FBxtHr0A6XDZQ2YDKmfYMuMO9kRYDWq/wh8Di8tkL/BeU0rcyDzpSPjhwCM
 mC3HRAo2VNwEJNEN5HLVQi3GudDE7fL4SXbjm6qVn4rcIHrepgGO/St5NGH2SRlfhtfy0u17CAu
 Fh1ZHmbrAWxVuxQnReZxjxe3LAJzy/cyp6XRMQYkOX9AQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 27 Jan 2026 10:31:40 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3718EA41055;
	Tue, 27 Jan 2026 10:31:30 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH] arm64: dts: freescale: fsl-ls1028a-tqmls1028a-mbls1028a: switch
 mmc aliases
Date: Tue, 27 Jan 2026 10:30:54 +0100
Message-ID: <2821824.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260127085533.9738-1-matthias.schiffer@ew.tq-group.com>
References: <20260127085533.9738-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f0gC65xhnz3ybCn
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 6af234dfb0c07f78d372f7b2c3975209
X-cloud-security: scantime:2.803
DKIM-Signature: a=rsa-sha256;
 bh=FUH6gbSg3S533iqWlZ7raLgIM4/kSDOyTLmPhW+hpEg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769506300; v=1;
 b=dj5tREM6wWs04af7lfu0tBBjN8HD72gQWqD5WyBfENEBL1ODp+jPZPdb0ud8yGSAQO7HOqx9
 iEvHenS5bLTwIIfqP16IB+KpOlyFVKfP3nUaoXffQyiI9qUe7VZPAeipsCyImXNzjytQwDVLJP5
 glI4GKL2koizNLuDZeCExaMCiBaXnvFQfGZW8dBe4mrpVR+KTipzHISGx1nD/wzOaxQE9Dt4lvG
 6QuoSN7bzyVvqoBFFeGILuyGTJBhKersMTpcDLxun3E4nXZ01NpyZbIlakdXFYnbfoCXqIWQ64q
 m2L9jhWQLRt/gClaY7hlwBtCXRaRwXZIqWPYCdNAP2UPQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013156_404621_6AC29C38 
X-CRM114-Status: GOOD (  17.04  )
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

Am Dienstag, 27. Januar 2026, 09:55:33 CET schrieb Matthias Schiffer:
> All modern TQ-Systems boards follow the convention that mmc0 is the eMMC
> and mmc1 is the SD-card when both interfaces exist, reducing differences
> between boards for both documentation and U-Boot code (which uses the
> same Device Trees). Adjust the recently added MBLS1028A Device Tree
> accordingly.
>=20
> Fixes: 0538ca1f102d ("arm64: dts: ls1028a: Add mbls1028a and mbls1028a-in=
d devicetrees")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>=20
> Notes:
>=20
> - Gregor (author of the fixed commit) is not working for TQ anymore, so
>   his mail address does not exist anymore and he is omitted from cc
> - Normally we would consider modifying the aliases a breaking change;
>   fortunately, these Device Trees are only in linux-next for now
>=20
>=20
>  .../boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls102=
8a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dt=
si
> index cf338b2e80064..426a81e1743f1 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
> @@ -17,8 +17,8 @@ aliases {
>  		gpio0 =3D &gpio1;
>  		gpio1 =3D &gpio2;
>  		gpio2 =3D &gpio3;
> -		mmc0 =3D &esdhc; /* SD-Card */
> -		mmc1 =3D &esdhc1; /* eMMC */
> +		mmc0 =3D &esdhc1; /* eMMC */
> +		mmc1 =3D &esdhc; /* SD-Card */
>  		serial0 =3D &duart0;
>  		serial1 =3D &duart1;
>  	};
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




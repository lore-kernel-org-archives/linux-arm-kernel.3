Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C9CF3380F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUJuwBPFUR/Nz9GUBUjDSAihNxJJ1UtBMGnVcsi8xBs=; b=RVuVjuedqZ28N10QK+p9Bc38ws
	jCZ1RlSPZnqt0LxA7wVyp5bhEVHuXBpH0hSlwJ9FbTJx/4VeodPAf7TOApxX/R5d3M8TCQsc05yqh
	T+R5c23poWGJ0Lry0NDjSDt0lDC5Xiys9Mzh1KmJ8vYCo2TnDMCHdu/HL9PeBp1HmCOOkjJbQ6xmT
	kvtf8Zw6YLFK3WyvuArl3TZp8eMY9XX807GLSnh/riv03GTXO6enbpxT81750auvGhidzMXD0ts8h
	W7D0KJ9TB1AB42nQUGw7cL3xDf2kakGoDi3nzjTkpzukHqV9V86lVfTDKZ6QQscSXVCyGdG40Xvah
	UJK9REWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Po7-00000005jQQ-1GbT;
	Tue, 17 Mar 2026 08:29:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Po3-00000005jQJ-3aUF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 08:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jUJuwBPFUR/Nz9GUBUjDSAihNxJJ1UtBMGnVcsi8xBs=; b=phjaCFaojuxLgBWFYxiGiU7tZl
	y32ZPQY+JZBZjkiOhYLQ8Bcc0Tz+C/L2sjrv2fShJi1HMdIc1n3//Ao9ETkZ2L2upHxZIlywQzHjQ
	lIl4gKpprkypTh83g5RvH/7E4Hdr2Araw0D/8W1n5WZAgu3wVQTE97TcO4TVABghbQQTROa/HzOk/
	y9NTQD5astXmT+xNs7lo2mbgK7VkRK47P9baeBOt6D2sQ8cZMKEY5jR23Qz1nF+rpG8GrSw8E/ZDJ
	fTAaaFoXVAE5kIKrNdwzx43XpqZ1UgzA1Y5f1ZBGx9VYqCBv6XzdGPe/atg4wD9kCXPI3FijrOWk2
	DpNvlgNg==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Po0-00000008PaS-0uEc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jUJuwBPFUR/Nz9GUBUjDSAihNxJJ1UtBMGnVcsi8xBs=; b=WSnw09+aEcy15TNNNA1Hhve6Pk
	vFi66MVEPlCq1qmkI2uKkzpk0Jm8v8eS6CA8+ayoT5Yk/WwKiWRmLh63h0l66DLHVxto0zyv8I6dj
	nlWfFRxROoAzPEyEYNW5IS1ijN477fXNu9HbyxJfeP3mXZceXrbo2Ul99t7e99bb8lKJUvPVqYhiw
	qPeGGCzdhykrT+7LPEG8NVa/w/lRrX4RYcydSZjXGxlNicpu53RU9+1x0S8KrfQ6vBwYL1kri7yCD
	ClzY7zwOiIhtoSQH5dlwubKpe3CY8rLMOuH1xfDf5vjpsbcN/ioo2moMpPw1Nmn1tHZOb53Iab6wH
	3neZIBHA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2Pnu-0003MK-0j;
	Tue, 17 Mar 2026 09:29:30 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2Pnt-000MQw-1r;
	Tue, 17 Mar 2026 09:29:29 +0100
Message-ID: <bfd19beec4ccbe296cdc1da865b15caf3ad1e5cc.camel@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: dts: freescale:
 fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Alexander Stein
 <alexander.stein@ew.tq-group.com>,  linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Mar 2026 09:29:29 +0100
In-Reply-To: <20260224152523.570057-1-nora.schiffer@ew.tq-group.com>
References: <20260224152523.570057-1-nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_082936_402911_ED422CCD 
X-CRM114-Status: GOOD (  18.54  )
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

On Tue, 2026-02-24 at 16:25 +0100, Nora Schiffer wrote:
> All modern TQ-Systems boards follow the convention that mmc0 is the eMMC
> and mmc1 is the SD-card when both interfaces exist, reducing differences
> between boards for both documentation and U-Boot code (which uses the
> same Device Trees). Adjust the recently added MBLS1028A Device Tree
> accordingly.
>=20
> Fixes: 0538ca1f102d ("arm64: dts: ls1028a: Add mbls1028a and mbls1028a-in=
d devicetrees")
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>=20
> v2:
> - updated author information after name change
> - collected review tags
>=20
> As mentioned in the v1 submission, it would be great to get this in
> before v7.0, as the TQMLS1028A/MBLS1028A was just added in the current
> development cycle, and we'd like to avoid changing the aliases after the
> DTS was part of a mainline kernel release.
>=20
> Best,
> Nora


Hi Frank,

can we get this applied, so the change makes it into v7.0?

Best,
Nora



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

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/


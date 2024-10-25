Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1F6D0C5FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7v6o4+naE0x6CItW5mEz8zlqR9bkW3D/RUmioNzQIUo=; b=Gw5Sfpv6g0eP99fmKPQeaPVCno
	qihgnumGjlLgHBNOM9CU/pA2+DtVmNJtbdqMENj1YpQdL9pzJRl9JMOL4YAjFXnsTYhn1gurLSCS8
	8IlF4WRnp16DmSzfY+eK+S7S2eAC8oN286jD2b1zoy8awze+jxLJnlH6cWhKfDeTTkrBqitaCzlB0
	w3+s7ByvwCCdTYG65qm2jzbmvYz8U5L9lcTbIN75JKorOLL+kMsVqgh99j0dMHloOg5teqceEaB5X
	LDgbYG6cjmrXkDDEwFLJ4052OqIaKPmabooQVxPsVbVaYFIjvDd277kwZJGM4GoIVZGf+N/MeKi0i
	qwLDnExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HMo-00000003L14-460s;
	Fri, 25 Oct 2024 10:16:27 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HLE-00000003Kvh-3Y4N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729851288; x=1761387288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7v6o4+naE0x6CItW5mEz8zlqR9bkW3D/RUmioNzQIUo=;
  b=ms2/+wRwcxvzpAutIzVs+8ETyu/4m/Mev4OGEoorHDUu1FI1LEr0W4W4
   yppGrrfenWObinTw+/wxekiJt3czT7CVNWIqwsHya8rM1oojQarmiIUEv
   dddXDq1o0Pe/iuLKIQsWr3yUZoyoK3JRLSNK0VX+nSNWkQoPkbijMJPBI
   i+TUtb6plpBRmIvIma1iH43tdpuf1NsjTYYOFEVe+r8JuYSqiBqvoVK46
   xxJS6/loWE/Osg5K0QOi6j8nGbNgX1E+0Ade+FpooqakHDoOaShmjkYRM
   MLCh3O9WQidH8sDYxbmTs/Pa1B64VLOpFzi8IE8772GcZJ8p9K4mvflL7
   g==;
X-CSE-ConnectionGUID: uabkpS4oTLKXMfXpxgMRow==
X-CSE-MsgGUID: ycQgDt52TAeJqqBfpZqJvw==
X-IronPort-AV: E=Sophos;i="6.11,231,1725314400"; 
   d="scan'208";a="39672755"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Oct 2024 12:14:46 +0200
X-CheckPoint: {671B6F96-9-21611FC3-DAD22B0C}
X-MAIL-CPID: 036AAD7BA8D7328E22C5439D9AECCE7F_4
X-Control-Analysis: str=0001.0A682F27.671B6F96.0096,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7ABE816809A;
	Fri, 25 Oct 2024 12:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729851282;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7v6o4+naE0x6CItW5mEz8zlqR9bkW3D/RUmioNzQIUo=;
	b=msPGqsJPFEIgsFTBz+I8O12F2odlwZDIOd6TNNY85T1ielLBw+aVMYg6rbN6+eTcxqcTcJ
	zNhdq57uUbwYWFhTcJgpkly4eQXkHk2ciiuxATlU/sTUSb62lIOJIgAVz8wGQWJSWCQEPT
	xnI2eLf1wpdjkH6QEjIp9psQitEhEQfFsROBxSO0Ezq7ADHk3sHRwLOPoLyZ7oa/AEc/Hh
	RL3YMY9D3C7VtJNIDPwLAgG5wV+9P96Fe7Z4wBTIO7Jxy+Tx042UlwZHzW1mXjCEUAJ6/V
	9pbrtvzMFkPhvrhPxB0q9XsQnRtUQqFFdFGEpwyabs4SCzQfvzIfaNDQgk1c0w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Fabio Estevam <festevam@denx.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: imx: fsl, imx-anatop: Add additional regulators
Date: Fri, 25 Oct 2024 12:14:40 +0200
Message-ID: <3594795.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241025004159.1571782-2-festevam@gmail.com>
References: <20241025004159.1571782-1-festevam@gmail.com> <20241025004159.1571782-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_031449_401040_5B633CAB 
X-CRM114-Status: GOOD (  12.66  )
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

Hi Fabio,

thanks for the patch.

Am Freitag, 25. Oktober 2024, 02:41:59 CEST schrieb Fabio Estevam:
> From: Fabio Estevam <festevam@denx.de>
>=20
> i.MX7 has the following anatop regulators: vdd1p0d and vdd1p2.
>=20
> i.MX6SX has the following anatop regulators: vddpcie.
>=20
> Add them to the allowed patternProperties.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yam=
l b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> index ae708a658d52..f40c157908aa 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> @@ -44,7 +44,7 @@ properties:
>      $ref: /schemas/thermal/imx-thermal.yaml
> =20
>  patternProperties:
> -  "regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$":
> +  "regulator-((1p1)|(2p5)|(3p0)|(vdd1p0d)|(vdd1p2)|(vddcore)|(vddpcie)|(=
vddpu)|(vddsoc))$":
>      type: object
>      unevaluatedProperties: false
>      $ref: /schemas/regulator/anatop-regulator.yaml
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




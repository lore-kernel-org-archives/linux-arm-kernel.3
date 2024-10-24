Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD2D0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMfzafKl2ILaN+gwwJJ2kgFQaW+qwP6JHJK7Tm1XA7k=; b=ZDcoklWsDb68yKhVvDQPL5xkh9
	1WDDEomu/JxyA4qBJZFX/wCK5vYDg87uoQvcCUuU5gVdv9wyeFRBEgioAlFq+LDBLUgzVMv+euKLj
	x83UyytX/2RiUFVOAdWcYqoNzrhWl2glNG9v+4lI6ftoiec3fgNn6sFczzF5UVExUp5B02LIPd3Po
	DCHSYhRhhzEoOORND0xEyqkGOh3JN2IqFvt8cs08lmoyi95y1Hn/cXM9sFoA1+wRY7sWVvW9Vn01+
	PZQRtj1nvM4B3eqAowbFlga2XGvvF0fjMr9bb/MPIBoi4Y4MRjcNuWRwoywAzVTtC3rRyik+sFJ69
	VgemGhrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rHI-0000000Gujv-1VzL;
	Thu, 24 Oct 2024 06:25:00 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rCz-0000000GtpX-3GyN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729750833; x=1761286833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pMfzafKl2ILaN+gwwJJ2kgFQaW+qwP6JHJK7Tm1XA7k=;
  b=D0pTbmNFAP10TMRJBAvMVCKY/gu681CPG7kB1cBEOsVPmeRrF3AF94hk
   upNl3owJfhIN6xyeMbVzz/vEuNQEKNpBwjHsyZdSj46MwokkusHaba5rH
   l2voc+jx1bGnjt+DYrOQlXiyxWMXClJJK2tJ7hXLvCJQcmokzGQ9JuT5O
   ubp+8rK66Y472FHA4nVW/xEnyDnM5PbTnEDwOPY9ufhuSPcURr7QWGOm9
   GoVQOGvETH+6h4m3hFP1ImlMEKjGDFws3EE+N5wXXldjCsQcCKaO8QU8C
   jxS7cIw9PVq1zaC3npoWmXnkGwT5x/YmvZj/6jcjuu4bNxlAY9fr6SBqJ
   g==;
X-CSE-ConnectionGUID: 4t7TM3LLTQOFvyqzOO/sFg==
X-CSE-MsgGUID: d+7AR5vQR0iTc9Djlj4mtQ==
X-IronPort-AV: E=Sophos;i="6.11,228,1725314400"; 
   d="scan'208";a="39639020"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Oct 2024 08:20:31 +0200
X-CheckPoint: {6719E72F-37-65F98A6A-FADAF7F3}
X-MAIL-CPID: 0FEE07E58522C4DBB3A2AD6C0E15FC33_5
X-Control-Analysis: str=0001.0A682F22.6719E730.0018,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E71C1634B9;
	Thu, 24 Oct 2024 08:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729750827;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pMfzafKl2ILaN+gwwJJ2kgFQaW+qwP6JHJK7Tm1XA7k=;
	b=tj/GtwTbL6gXVdNLJ7gPB655tbNog4tCcAeAwFEev5BSFEW/01KjHsPVrw5AurDWZSq5Nc
	J9kwhzdgsloufRxgDEHn2v8ZZTd0oTQKtmBlj5eNNneJSK7KEsq3NOX4GsGoL9Ze7xgv+I
	d2BS8HZuG6HUdT+tTyZfkmevhOkEYJJU9qDsFDQpnjZVaPwbinH5VsZF8u8QIIct580soN
	SMzM7AmMZNSpqQ8USFf9sbBbdAKIzU+YthW/U/uLRiQaVXhVS/NdmXw5MqUG2RoojSaGbC
	1uB4iT5YdDvhWRCIafEu+lajgKzXTiye8Y043ouc9VURWOApIre5e+o57c621Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Cc: daniel.lezcano@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: timer: fsl,imxgpt: Document fsl,imx35-gpt
Date: Thu, 24 Oct 2024 08:20:26 +0200
Message-ID: <2203796.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241023185841.1183706-2-festevam@gmail.com>
References: <20241023185841.1183706-1-festevam@gmail.com> <20241023185841.1183706-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_232034_149466_29762EE6 
X-CRM114-Status: GOOD (  11.98  )
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

Am Mittwoch, 23. Oktober 2024, 20:58:41 CEST schrieb Fabio Estevam:
> The i.MX35 General Purpose Timer is compatible with i.MX31.
>=20
> Document the fsl,imx35-gpt compatible.
>=20
> This fixes the following dt-schema warning:
>=20
> timer@53f90000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx35-gpt', 'fsl,imx31-gpt'] is too long
> 	'fsl,imx1-gpt' was expected
> 	'fsl,imx21-gpt' was expected
> 	'fsl,imx27-gpt' was expected
> 	'fsl,imx31-gpt' was expected
> 	'fsl,imx35-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,im=
x51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
> 	'fsl,imx6dl-gpt' was expected
> 	'fsl,imx35-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt', 'fsl,=
imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
> 	'fsl,imx35-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']
> 	'fsl,imx6sx-gpt' was expected
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Do=
cumentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> index a2fcb1e8e74e..9898dc7ea97b 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> +++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> @@ -21,6 +21,7 @@ properties:
>        - items:
>            - enum:
>                - fsl,imx25-gpt
> +              - fsl,imx35-gpt
>                - fsl,imx50-gpt
>                - fsl,imx51-gpt
>                - fsl,imx53-gpt
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




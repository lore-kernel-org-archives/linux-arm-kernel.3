Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B9AD0C5F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1itM/kyCdE0gs81rWSjrF3aXRgyfQNm1Tl9jiHBKESM=; b=UJDHT+2DzDje3Tsk7HG1gDPybZ
	Tc1JGUbI6Mjb1MzAzMJhOAiFAETRefP2wSmNVMr5tBVBFDU+oyCsL2asWEW20OJ+AQEHQkc4aNId/
	ITuh1MjsE2XTnn2JzT5Dfe/6zUMkeBnzKcFo4MV05JMlQ+6lyR3oKY8KfYk91ud/2AabrRU9SUCWH
	5t3aVP7PlhDMWYItd+kuqFi3fh8de1ez7/1STqZUgXk28UZuEp7z/3Ki+qb+doIO5d/fPRvILTKL4
	K8+XyhdDKq5NukYFsO39BkXsrLk6aVoiVR2odAvrDTQJeIk7VMxu+pYQVHzXBwI3H9L8VBzHi5CXh
	HGQtMq+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HR9-00000003LaV-0mJh;
	Fri, 25 Oct 2024 10:20:55 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HPW-00000003LKa-2apZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729851554; x=1761387554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1itM/kyCdE0gs81rWSjrF3aXRgyfQNm1Tl9jiHBKESM=;
  b=EAOM7n7W/ElkuQv9nl8vZ/g2cP/H8wk3bSa+E4aWdnxIX/hFlcI493wt
   ekFEkVzphLaXoihW9VTybU19avU5yu4RMzixC2AnhWpMlDMBWfzisn/1B
   werEmF1kGdKbbqa4s2F9G83zNdElHxlUzdE9tgn51MfllqKoyRmGzHONp
   isFsVnMK9vX38fnszppl8U7zy2hQOmGAhcfK5xgl8OKyXr3WFaOO9IYzz
   ZW5L9qhTmU7ZvkcQKTkz4C9fKyTWafTmWpl7SBAFcHfDO9pHCxGCF9Nyk
   HgKaRisQQKNf/zuDf287EQaEMd5AEXnPU0iPRy9BlPccs/fxtWspa2ABX
   g==;
X-CSE-ConnectionGUID: 2eIj9DeVQVqdqX0utdSxuQ==
X-CSE-MsgGUID: dwE/WrBaSKeaQH2e20x1LQ==
X-IronPort-AV: E=Sophos;i="6.11,231,1725314400"; 
   d="scan'208";a="39672877"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Oct 2024 12:19:12 +0200
X-CheckPoint: {671B70A0-21-69FF9A8E-EE9CEDAF}
X-MAIL-CPID: F2B36C0168125F39CE454E81CF2DD6CA_0
X-Control-Analysis: str=0001.0A682F24.671B70A0.00C9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA7441643AB;
	Fri, 25 Oct 2024 12:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729851548;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1itM/kyCdE0gs81rWSjrF3aXRgyfQNm1Tl9jiHBKESM=;
	b=HsLLxgTy3ki3jI0JfhPZ/z4sFsoX7ufdNg5Q2Cns+eqf1SF0M8emb6jQ5sfc7GNoQT8YKL
	lHKMWYdXqsHMPKMvrNu9zzfvMojX7THjWUGZBSLLX/WasP0rIyGCaaQJC0iyGDUXe6e/rQ
	3VHBGzY4dBOL2XOo/OkS5pyP4ERUIJI0qtpc57QJCyYpaEQssP39/OaYtf3gYBw3jhO8X9
	fa0GWxo264PZxVut2WnsFGKW/sFLPFQH2PChRrM7kUKMnoB/HzFpKxiX33bnIeZy1WbJfz
	IKMRJOU9YNFsqMK3tJUSV1DmzZl5mMEjpjbwPcYj71FA4+nbwk2h1wlIFwLzSQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Fabio Estevam <festevam@denx.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: imx: fsl, imx-anatop: Fix the i.MX7 irq number
Date: Fri, 25 Oct 2024 12:19:07 +0200
Message-ID: <5991537.MhkbZ0Pkbq@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241025004159.1571782-1-festevam@gmail.com>
References: <20241025004159.1571782-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_031915_011294_0D2F50D4 
X-CRM114-Status: GOOD (  13.22  )
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

Am Freitag, 25. Oktober 2024, 02:41:58 CEST schrieb Fabio Estevam:
> From: Fabio Estevam <festevam@denx.de>
>=20
> Unlike the other i.MX devices, i.MX7 has only two anatop interrupts.
>=20
> Add logic that contemplates such case to fix the following
> dt-schema warning:
>=20
> anatop@30360000: interrupts: [[0, 49, 4], [0, 51, 4]] is too short
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  .../bindings/soc/imx/fsl,imx-anatop.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yam=
l b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> index c4ae4f28422b..ae708a658d52 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
> @@ -36,6 +36,7 @@ properties:
>        - description: Temperature sensor event
>        - description: Brown-out event on either of the support regulators
>        - description: Brown-out event on either the core, gpu or soc regu=
lators
> +    minItems: 2
> =20
>    tempmon:
>      type: object
> @@ -52,6 +53,23 @@ required:
>    - compatible
>    - reg
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx7d-anatop
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 2
> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 3
> +          maxItems: 3
> +
>  additionalProperties: false
> =20
>  examples:
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




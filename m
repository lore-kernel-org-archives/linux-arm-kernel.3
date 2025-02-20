Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E81AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 10:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh9A1BD/RTEscUaPrQN3XaSi0R1/Qa7MqH53NBxklI0=; b=yB7NqfNDDCx6M999Q6qGYwDQuX
	HTjg1qyQcIJvfgAC2+WIjuUyDOA0UPoZejCXSWv6Mx11sztdlSMZgyIv7KIls5RxdZbS1I2ibVc9o
	5vZ4jLLVtgphNDDk3YSZFGU8o9SjW6CgKdwlOIQe/3MJgEEiMtGNP5oqC5d0wgt/n6LGPc0FshlH3
	woFceApNCTAb807t0AQGGu/yBxKJ8V9G1VrrZtbxirvlTWJ0LeilrSY8Zs96eU8JXVSbyuP1Vfqei
	V9r6B5AkGpB7fQv7l07OswEOSdBElyaeh+eTr3zGKitRtjT3EHt7JOxbLt/taf89QwBVDHuYEksaG
	YFKb5ydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3xC-00000000Kh5-45FC;
	Thu, 20 Feb 2025 10:38:50 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3vh-00000000KGh-10ye
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 10:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740047837; x=1771583837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wh9A1BD/RTEscUaPrQN3XaSi0R1/Qa7MqH53NBxklI0=;
  b=GZ/zcfb41m/pBcci2fRj7vgnm4IT7J1/FcwPnQFTK377shtOi8Znf4PC
   tuol/dhJOZkdFfJBO3HbSNyd0hFR8ndbuMT/iWo12jc+e6DLaPTKOuS9M
   DRH7m/KBf57QqN2df1T42Kv8sJ9nqJVlKA9FBV3cxBh3+DcTLu5538dlz
   XAVlK/ASyzygB/fnIXbRoRDp7kjMsZe3n+wcb1Epn93SarGdrXKxbgzEd
   fuMVhwNC/96ARjNfq1KHEZfVj5fOkf01yqqr6of4zvQ6PiwM2VhL/awHA
   RsvceMmUQ7O0xxK2I0sxDHLiu/g0VPReWzHshqYd/j/issLIGhzcSh2Rb
   A==;
X-CSE-ConnectionGUID: CwnbI0K+RpSL3PTir3jFFQ==
X-CSE-MsgGUID: e3NjdcT0R7yw1SDXUXlCFQ==
X-IronPort-AV: E=Sophos;i="6.13,301,1732575600"; 
   d="scan'208";a="41977185"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Feb 2025 11:37:00 +0100
X-CheckPoint: {67B705CB-2B-B8541F8F-E50F9B0E}
X-MAIL-CPID: 1B5560109A7002A5CA5F1D2F139B739C_2
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC4D6165713;
	Thu, 20 Feb 2025 11:36:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740047815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wh9A1BD/RTEscUaPrQN3XaSi0R1/Qa7MqH53NBxklI0=;
	b=e4D0OjDSA2ZA2GlPxzsqw7tkGSZo29ZHbECBq+JdmCuxym+wVv2+TZDkqLfplc5tSpTR0e
	WtTAKKvnO1SwFM+LEGSmcHVIgFzX2i69wX9Xer2DfxIy8r6H8FLj+WZ7diyyAnEBhd0bTG
	e9jb0QInU+lPP7dXVF1lC1lhyF7uEN8pn4s9p0+eCPzU1S/cqit1zvMCiHMWGwgvZvXrSU
	1QXU66t76OvYPgdFNUlps2CUj8/UhrhunsGGXfQSJ5P2ZPAMaxq29eaF1qINsLrsEi7i5x
	95O1hVVCteRHOEbAhaRi9l/sghRsYJbDlGI1fNDe+sR4sWPgTQ1VN5Z/tBXn+g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: p.zabel@pengutronix.de, robh@kernel.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org,
 shengjiu.wang@nxp.com, Frank.Li@nxp.com, peng.fan@nxp.com,
 laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
Date: Thu, 20 Feb 2025 11:36:53 +0100
Message-ID: <12614210.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250219192102.423850-3-daniel.baluta@nxp.com>
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-3-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_023717_771625_A4052B4F 
X-CRM114-Status: GOOD (  17.25  )
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

Am Mittwoch, 19. Februar 2025, 20:20:56 CET schrieb Daniel Baluta:
> On i.MX8MP we introduced support for using a reset controller
> to control DSP operation.
>=20
> This patch adds reset property which is required for i.MX8MP.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documen=
tation/devicetree/bindings/dsp/fsl,dsp.yaml
> index ab93ffd3d2e5..923e7f079f1b 100644
> --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> @@ -82,6 +82,13 @@ properties:
>      description:
>        Phandle to syscon block which provide access for processor enablem=
ent
> =20
> +  resets:
> +    description:
> +      A pair consisting of phandle to audio-blk-control and an index ref=
erencing
> +      the DSP Run/Stall bit in audiomix registers.
> +      See include/dt-bindings/reset/imx8mp-reset-audiomix.h for each ind=
ex meaning.
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -164,6 +171,16 @@ allOf:
>              - const: txdb1
>              - const: rxdb0
>              - const: rxdb1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mp-dsp
> +              - fsl,imx8mp-hifi4
> +    then:
> +      required:
> +        - "resets"
> =20
>  additionalProperties: false
> =20
> @@ -220,5 +237,5 @@ examples:
>                 <&mu2 3 0>;
>        memory-region =3D <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
>                        <&dsp_vdev0vring1>, <&dsp_reserved>;
> -      fsl,dsp-ctrl =3D <&audio_blk_ctrl>;
> +      resets =3D <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP>;

Am I missing something here? fsl,dsp-ctrl is used to get the regmap from sy=
scon.

Best regards,
Alexander

>      };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




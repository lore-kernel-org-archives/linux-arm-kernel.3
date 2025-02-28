Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5A8C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrZESIfIEMlm8bcE5XbWXGC11n9EvGXbhxL7sNZTaKg=; b=TwPtxPxDb51TnQ71s8YEs93Y16
	CDxQNfLZipJsVTORfqGxdVJXqogoqQbFfTkm2jAyqKONGf1ldyh4RWxd3IEeuHz6DFGzHKCvkYYTZ
	6Oq3Cx+azvoB42/0wg3y4pquVUFuT+TzbbL7Rpns34Ct8S/rXSxV4bJlSZ7EWaLS28GFu1hPMPuqF
	MR9yGxhCpgVNTxYYLq3OkeZ4wIKoAJBGulV1SsK04IzaiVrAG+WRo7UAruT2I6Fl3bke+r8R3MHi9
	U9AtD3u3suWfirYTkZytZi1drq+kD91RrJ1fJJZUKXMQSlqTFAfrWzm/Mb0VPoD4k7YNPxrM3wdHs
	FBA4WQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxOq-0000000AXwh-0G3x;
	Fri, 28 Feb 2025 10:15:20 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxMJ-0000000AX5o-2j8j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740737563; x=1772273563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wrZESIfIEMlm8bcE5XbWXGC11n9EvGXbhxL7sNZTaKg=;
  b=T3j1j7Gul1i+4UNUH6LNgsqzNkQZ+ZbGk/uH0DQjCGUd0cjzKl+09JG0
   Sqre+hvHHjGNAFeeT1rfYIL/mYvJLHqVOvDaZ2pUC+jw7MIyIyNUzJFwU
   N/w3Vm8Iii//gvtLA6OVzPe8QVo3Cfu+jmabkBSF7j6MNqSjhI0+SwI2p
   3MjPdXW9E7Or3XmxmzCtAMQ+IWZA8i0qWcbNou1aY0u5/my7mjEBWM8ZV
   Pe9CJUK+aEPjhyiUt3LJvYeDvldddIMPspauUI78RvVMvhm4rr1wd5Bhb
   k0b6eXf45nTGNhCP4yxBk++d6+8ebbX24qSeAn+A2uXQYjauMw0mm9npQ
   g==;
X-CSE-ConnectionGUID: pa+KqxuLQCOJlUmpZ8dqOg==
X-CSE-MsgGUID: XOcdYrqWQr2Yz50o0V+ekw==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; 
   d="scan'208";a="42171238"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2025 11:12:41 +0100
X-CheckPoint: {67C18C19-E-2895743E-CD1E7AB7}
X-MAIL-CPID: 18FEA1C7F914205254E6E81087CE3540_4
X-Control-Analysis: str=0001.0A002119.67C18C19.00E0,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6AAB168CC3;
	Fri, 28 Feb 2025 11:12:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740737557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrZESIfIEMlm8bcE5XbWXGC11n9EvGXbhxL7sNZTaKg=;
	b=RZIbN3OUvhZO996W35ymd+UmvU0Oe1s/ZIRdblX0G9pxMXjaPdqV3Si/TXhOId9nWCmi4P
	5opWJlWKMH3LggKe/bDCqJkXBP4MYy12GrGsaasQWYP3JaQGj+Zdpg2TDyEiqLPmlGVvEf
	a7oGgXhCV8ENhJXpx7RP4iwwqWQs8SRoSzLuif/iCFCSeH6pMlIWJq9p3GfmePgTt0sxGY
	ZqZl3ZHOU0e/KmiFwlp7JILTqf6x0AZN4T7OJOgTdHU8AW1lM6RQiRL+cfGOKW90hrhESa
	qOjpJvckYPsC91rSpqL/8PwGVYKWPrTMtn66RABwjrBDuv2LRT7uRf87Acr2HA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
Date: Fri, 28 Feb 2025 11:12:35 +0100
Message-ID: <4281241.1IzOArtZ34@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250227170012.124768-8-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_021244_061384_4157E31D 
X-CRM114-Status: GOOD (  14.15  )
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

Am Donnerstag, 27. Februar 2025, 17:58:07 CET schrieb Marek Vasut:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, document support for this variant.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.y=
aml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index 0efa06822a543..3ab62bd424e41 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - fsl,imx95-mali            # G310
>                - rockchip,rk3588-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revis=
ion is fully discoverable
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




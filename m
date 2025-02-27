Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F04C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQsV31BYNF5mIrgsyZoJcQ934paJ3x2n8gcDLqCWxZQ=; b=ZP8rmDNeXcMAbxHMka4KGjCDFb
	FwgRTOOpPhdHFZjy3EUYUWE7EuP3RbHUIqAaOjeKUtC9n9iV5gY3g6XCPS9Ni7GLtgxjexGsAATe1
	P54dgObTH1xplv5TuedYyiANJUFuRNGwlGLCV+PoRvQdbiBoB6UhcZOYvFoZISjg1NWhCQTSFliDO
	q4egA7q3u930D9ZEVtFXWG+b6Pc2i9tY0RPhoU7ewbDTyH0VBAAWj9ja4wTiSP4UyM0a98anTUy9y
	ufhJgtrnru2WV0bYsJbHNBgiAFRrK3kknb/03fv6R5elHdP3sx5f5QyhBe1Z4KLs5luaMjNF5awTp
	TDliqXnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmV-00000008dVg-1Pwl;
	Thu, 27 Feb 2025 19:42:51 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnimW-00000008LBU-2A8N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:38:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4821A61F45;
	Thu, 27 Feb 2025 18:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333F6C4CEDD;
	Thu, 27 Feb 2025 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740681527;
	bh=Z+caVF3WAY2knsCtcAjSC7EXLJEDrKmetnCISZqADto=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=K0dFvaV768MG9I4/TmzvJjYmxtETOpnaffL7ns6oEJdi9HKOEQhS2q1IUraAj8j01
	 0JghJJYNPVjxMmyMwljsL/Md1nqoABcOmYcB5BoCHyAfkoaXYOHycTOtiTZKXlKdav
	 /F3bwBTVyEzTIvkC16xSMH1yDWfricDLqixMLDW0b3nTxyyS11BznZMoOJ+Zu/UIgg
	 gMJ2SBNeHE+K32sVE9vQqTny0c1g2+ROndctN6sogrT4ha7JVb7HOiz3KvyKYhdS7E
	 chcUldFeBAS6npmMbclOBoILZHrMLz6TFlYRUd1F9S8LBPJqjxe0In/+s27POxoCfm
	 F6x2H4O24GVxw==
Date: Thu, 27 Feb 2025 12:38:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227170012.124768-8-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
Message-Id: <174068152164.3906545.6393185343383919273.robh@kernel.org>
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document
 i.MX95 support
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


On Thu, 27 Feb 2025 17:58:07 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, document support for this variant.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
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
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-8-marex@denx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



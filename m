Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E8F1049514
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozQIEmwMqapyHDKlldR/Oc+a4OHNxzN5ikoU5eEaJqM=; b=JRHIfBMtP4LBDN90nkSs3u/d6w
	UcoFzeDex3DNYgHBTJXwyK58DpD5/Ph/ILgv2MT0fpmzBJLKCsFnILRF4pS/u/wmpEF9oUYSYgvy2
	3n+MWFHawBrjYwMFC5pyJ6mGnRWH/w7A5LwcTKygn+Nmc1HoXSFiL2xAlESCzsVZN/jeQ63S0llKS
	3iAja27X79xj0+B0ut1TK+ieEbr1qbBP5AlmOMuLvw0e0K4uPIc+MpGyXVCCwJS46l6/rigDqyy9n
	/acf8gEDzRqREVcyRocyFJAVyHmXZ6CKzKmdyMO6FNu1aPzKa6DIwBSTYSVLuMvfKaxTFVMmKfxlu
	gyLZm9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FoF-0000000BGv8-0Vc8;
	Wed, 11 Mar 2026 09:24:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FoE-0000000BGuU-06ZI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=ozQIEmwMqapyHDKlldR/Oc+a4OHNxzN5ikoU5eEaJqM=; b=e++zMRkCocYRimrNp617iiUIEX
	78nC3LyLdFa++5dk8Qiqtv4C2rBufJitp8f4cTevnhlwBWuqWbl4qYM99j3Y8KTWXjNdl2LKlS3+m
	KP5sN90OPXyTVgYb7XMhGasSt9Yr5nadABT5Lzr6bXy7U+UVd+Bn1LKZfm0Y7iObv4w1rJnZwzAUB
	APwp4aZgzIdRxMbGcTiWdR90i6ES6ZgSiBsLa3AZChHeqLQWMLS7Q6bD3nXjZpEuXootxazhQn3Ck
	pPD5vA0nyLDaNq1kKNKEgupZTjNbyLIuPFaYIOz5BWBJrhoBYdwt5N4bqOtja47w1PC78SXSVkEuZ
	TuBmPW7g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FoA-0000000GXcG-3beG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:24:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58AF943B39;
	Wed, 11 Mar 2026 09:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1223EC4CEF7;
	Wed, 11 Mar 2026 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773221089;
	bh=sK0fiSjATxGyVujmdLFUMxxWbcCE3K/15DJI5Kl2I4U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AEShXGZlpgiBVAbSH8SaQd4/6Zs4F6J3fMFPd5JYtelQyPQRzdNhN9CFQ9CQZzsr8
	 ttE0LXjjs9wmc6IhzdywKgPMd9bqvAcb3f2JkNlSXAyFinxVDN9EQqndVJypvoABLl
	 7Ls80LYETiF0gX0eCmR3ArTB/ok0Mg3Zjc9KugvacVzyjwZcb59NHJIbLebrrifTCt
	 JW5WDKTMfIhqPz6Pd6p1otqn2k8lh0h+qY8Sl7oCqcFqhXD4dqARcD+W1AMTkOENik
	 eMMldBfoOx4PznOEUyj+ywNzgqlehTWEw3hWNACiRycXULXlxz7luUerIddkWUdqeY
	 V4RJOD0NNsQ0w==
Date: Wed, 11 Mar 2026 04:24:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: NXP S32 Linux Team <s32@nxp.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 "David S. Miller" <davem@davemloft.net>, boon.khai.ng@altera.com, 
 vladimir.oltean@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, rmk+kernel@armlinux.org.uk, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Matthias Brugger <mbrugger@suse.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>, 
 imx@lists.linux.dev
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
In-Reply-To: <20260311-dwmac_multi_irq-v9-4-f0c03ef8d01f@oss.nxp.com>
References: <20260311-dwmac_multi_irq-v9-0-f0c03ef8d01f@oss.nxp.com>
 <20260311-dwmac_multi_irq-v9-4-f0c03ef8d01f@oss.nxp.com>
Message-Id: <177322108829.2695119.13138199275449513148.robh@kernel.org>
Subject: Re: [PATCH v9 4/5] dt-bindings: net: nxp,s32-dwmac: Declare
 per-queue interrupts
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092451_268362_BFEB5BE7 
X-CRM114-Status: GOOD (  10.45  )
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


On Wed, 11 Mar 2026 08:53:59 +0100, Jan Petrous (OSS) wrote:
> The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
> set them to allow using Multi-IRQ mode.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 47 +++++++++++++++++++---
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:57:7: [error] duplication of key "items" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:57:7: found duplicate key "items" with value "[]" (original value: "[]")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts'
Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:57:7: found duplicate key "items" with value "[]" (original value: "[]")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260311-dwmac_multi_irq-v9-4-f0c03ef8d01f@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



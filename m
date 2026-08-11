Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4005CC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 21:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3oMfD0Rq+z8p5nHwNCV4j/eMEhapnPfZydoy6fPclM=; b=bR1p32zrH1b8Wiqtc31UW398LR
	WpXScwwIM1fMXW4Td0oktT/u1uYA9om0tL/IdjnAWSt12+GI9QumEpy4e8nW+hz+qWStQP0yQ4G1F
	Eltlr21+DQoVDG6kIsT22sw59+SlHfKcttVT7CYGl1NEkIfabP4JkDgG7t1M4aRTKsjttwb1T+vW9
	GwzOIMKvhVRm8n8AKftycCP0ugRRa88c8KQQtjwu+nGVSHvjo8tEVVJH6ddSvX3v/IAkzkRxPa4hg
	gXbkL75Nb21sV1lxQ0mWZVG0BH+lG4AyS5bwAuxZrorSLJzEipBRy6fccjHCPinaRRazC1osM0JTO
	7XOa4tZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuN4-0000000F0ec-1RbN;
	Tue, 11 Aug 2026 21:50:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtuN3-0000000F0eQ-2REy;
	Tue, 11 Aug 2026 21:50:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B92E5600AE;
	Tue, 11 Aug 2026 21:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499C61F000E9;
	Tue, 11 Aug 2026 21:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485052;
	bh=J3oMfD0Rq+z8p5nHwNCV4j/eMEhapnPfZydoy6fPclM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=GEMTPOnNBIUotAhleac9wYSy745kJ2AxqFIDIXoc+FVtTc9xi94ZugIIe2RMHSwwz
	 oQEz4mHuMwfN4RnGWMg04Jn//gxlY9bqxa8voe4WGjrRobAI1Bd6hHdIx9zk52PJ6s
	 S7E3QYAd6UvI2TpDt+sbhWP5BeeSjF3s7e8T6+9TRyRefGqH2xouHzcuKC0MoFMRXS
	 o7kIGL1jMSGbxn0N+svDGMBOX6U4XhdafVuZoQ8AbVo5YyFbf3ttX4wgp+ktDj04WF
	 IBGQndww5oWBWrsOSQ2whb6yTn66TAzUPgiOiNk+6D/y3e2MTtK+UqAC2irirsyPK5
	 nn+WWvMSKExGA==
Date: Tue, 11 Aug 2026 16:50:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 devicetree@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Christoph Hellwig <hch@lst.de>, Neal Gompa <neal@gompa.dev>, 
 Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, 
 Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev>
References: <20260811-apple-nvme-t8132-v1-0-865be32e42c3@cyberchaos.dev>
 <20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev>
Message-Id: <178648505154.4642.5846109337375334027.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: nvme: Add apple,t8132-nvme-ans2
 compatible
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


On Tue, 11 Aug 2026 22:49:47 +0200, Yureka Lilian wrote:
> Add a new base compatible for the ANS2 NVMe on the Apple t8132 (M4) SoC,
> which uses a separate MMIO base for its NVMMU.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  .../devicetree/bindings/nvme/apple,nvme-ans.yaml   | 77 ++++++++++++++--------
>  1 file changed, 48 insertions(+), 29 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/nvme/apple,nvme-ans.example.dtb: nvme@7bcc0000 (apple,t8103-nvme-ans2): 'reg', 'reg-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/nvme/apple,nvme-ans.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



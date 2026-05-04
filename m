Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5384FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiOOHof4Vo2I4sXwfMWcS9+HW2z4f7V2Cm0uyfPa1kA=; b=e5R9Y64cqxj2B/3TROQEvQnlOG
	mXL1UISseAUL2Qwu/NnDEnz5dW4QULkY0I13/M/9OXPNU+ASEdV5YfOqBCZN8LZVb1FlrpynFA+WS
	AnBybCN3L7P09EryiGx09Y2SwUWF/ZQ9HtmzBsXue2HwzswvV/f7Zb7RhCnY9s0hwoYv0ahxD5i0o
	uwkqy4eaLxHH4TCuPALywRcQq8vQ9hv8cW0fizmOE+chI30Glf/XAaMIwWrMjQC0rF3vUuPAGcC0l
	lv9VY2vER/gGoGA/Q2I6fhRPLc1K48r9Cc9ui7EvLuA1EoCosqUvcDiYAOjoJ5OfDPZ7pTBuwGWK8
	lEDn/8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzAk-0000000EB4E-3S9s;
	Mon, 04 May 2026 19:41:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzAj-0000000EB43-2v7I;
	Mon, 04 May 2026 19:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF25B6001A;
	Mon,  4 May 2026 19:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B22FC2BCB8;
	Mon,  4 May 2026 19:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777923700;
	bh=mgdlbKlEQOWDLqR92Whq5tURhflQ2Yr9KuyXqkV/fOc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bXDisUINjwgG9lK4I/Zqy+kk2M+5q38IGKVNjSDriMrjWELbxnJlkuM5RDqwoBYWR
	 lfAY1WaarsJU5oxnO15BRLy3rZmOWDgFmZG6eckX6eUQRbnQGDcSiLYFJcFhnAOOYA
	 Cgt/FlhKZqkjxxT3PWe1Nf81n/pYY5BW88eMoPg3GD70VoEZyh/zZ0666xWTWqhiFx
	 AHLCL5+1TzKcYpIKvZx3v9fiqkrvHd8hgrhf4ksarSL/AG7dW5PvcXnhcgwZu5/hH/
	 n1z95QK/UCsjVOpdF6t4WhT5kJnjMhy5YXZxA/aVuxabP6ViC9shu3G8Cs9M/ATX/P
	 iD6hvGg1cWrFg==
Date: Mon, 04 May 2026 14:41:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-pm@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Zhang Rui <rui.zhang@intel.com>, Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 linux-mediatek@lists.infradead.org, Andy Shevchenko <andy@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jonathan Cameron <jic23@kernel.org>, 
 Lukasz Luba <lukasz.luba@arm.com>, Srinivas Kandagatla <srini@kernel.org>, 
 linux-iio@vger.kernel.org
To: Roman Vivchar <rva333@protonmail.com>
In-Reply-To: <20260504-mt6323-v1-3-799b58b355ff@protonmail.com>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
 <20260504-mt6323-v1-3-799b58b355ff@protonmail.com>
Message-Id: <177792369830.4148180.15587020526695376827.robh@kernel.org>
Subject: Re: [PATCH 03/13] dt-bindings: thermal: add mt6323 PMIC thermal
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


On Mon, 04 May 2026 21:24:55 +0300, Roman Vivchar wrote:
> The MediaTek mt6323 PMIC temperature can be read using AUXADC channel.
> 
> Add the devicetree binding documentation for the MediaTek mt6323 thermal.
> Due similarities with newer PMICs like mt6358, which include more than
> one thermal sensor, the #thermal-sensor-cells should be set to 1, to
> avoid breaking devicetree ABI in future.
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../bindings/thermal/mediatek,mt6323-thermal.yaml  | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
	from schema $id: http://devicetree.org/schemas/net/micrel.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260504-mt6323-v1-3-799b58b355ff@protonmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



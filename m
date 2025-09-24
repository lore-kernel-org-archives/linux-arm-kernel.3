Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC8CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhMJXKYR5sGIfVQAB2NDhBBg+7hNxcQL3qnnfYNUTpU=; b=w9RCUXmKdiLiobeFZk2pphuq09
	Oa1CQVOMFrnuCE70k+TKJsiO5NZACHTtTDegcMbOsp6ObZtmTaCgkxOGHh2/A/FZMMQzS1dq6Z9R5
	m6+n6WF1ShmBRMOOzIwl84rz9PUG0t1Wa/Yg+eARqD5evjLab8sh7tdq5b0tZULwfQPorl8PZ5URB
	T0LRJzm3AzYnRWBVQDACJo3BH3Ve5r5NGKq1zYf+L0GWk4WplVFyg85d26mOCbO3b2IKoQl0cVCfp
	TGBUpPv1kXseuM1CWIQTSF9PWc6r9wVQv1XGJaegvhSLRpqwWGHEHWcbVdiOyvsWdYc/Ap4VBTGGn
	VqRSufeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Q6D-00000000Si2-0Tgc;
	Wed, 24 Sep 2025 14:04:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Q6B-00000000SgY-2UY4;
	Wed, 24 Sep 2025 14:03:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79E9160097;
	Wed, 24 Sep 2025 14:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01256C4CEF0;
	Wed, 24 Sep 2025 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758722638;
	bh=uM6uSHTCjPtmI3Vzh1PPevWg0rMMV9zNEDAVmqFGGZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJllzpq4tR6nKD3tdPKsC7Asro+AUPMGKQItIJNnFv3n8cxUL9XcM+EFV2RrItwhY
	 3nXj3OuDrF8+yWvyozb58DKmtJ47vJ4hqAUVcnIvZWfB35VE2WU4yEGXk/g9JPJHjv
	 4Rq1uZKXZve+G4awVv9ynerQnOaynp6X7wB/BBKyFhqUgn8Mou+UkEFmrW1GKjUbC3
	 vSgjyjb8V3QWi7hZ7LdxQbaL1BCRI41uZV/hMwBqR1sD/PpCUDs/0NCQ+zYAkynP9F
	 anjcYsFg8AbwWAWHb37Vaa/hysBAeX+YhWgH7FZrpvpBKfo43hGbKv4Rc8cEoar9LP
	 vo5h90Y2c7ADg==
Date: Wed, 24 Sep 2025 09:03:47 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: mediatek: Fix wrong
 compatible list for hifsys YAML
Message-ID: <20250924140347.GA1556090-robh@kernel.org>
References: <20250923201244.952-1-ansuelsmth@gmail.com>
 <20250923201244.952-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923201244.952-2-ansuelsmth@gmail.com>
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

On Tue, Sep 23, 2025 at 10:12:29PM +0200, Christian Marangi wrote:
> While converting the hifsys to YAML schema, the "syscon" compatible was
> dropped for the mt7623 and the mt2701 compatible.

Is "syscon" really needed? AFAICT, the clock and reset drivers don't 
need it.

> 
> Add back the compatible to mute DTBs warning on "make dtbs_check" and
> reflect real state of the .dtsi.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> index 9e7c725093aa..aa3345ea8283 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> @@ -16,13 +16,15 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> -      - enum:
> -          - mediatek,mt2701-hifsys
> -          - mediatek,mt7622-hifsys
> +      - items:
> +          - const: mediatek,mt2701-hifsys
> +          - const: syscon
> +      - const: mediatek,mt7622-hifsys
>        - items:
>            - enum:
>                - mediatek,mt7623-hifsys
>            - const: mediatek,mt2701-hifsys
> +          - const: syscon
>  
>    reg:
>      maxItems: 1
> -- 
> 2.51.0
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22136D35693
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4pbQczQO/V2vi2j+wymLlENbnTlsLtagplMs9AL1aE=; b=TXjrIIr6hqz1pbR8iFa6HriV6o
	e4tZxuiBEMHrZz+ZHQHaktFNgiU0yQUtidLJ0REX15wkjw+AusfdW84BFqlb4ZEH90h/Dmi7GnIYb
	yMkb6Rg6BJjGOPkDheT7CPGzDJrzV74uzd0JQMGKNPerF1t6eUQMHi6B9MNmXiLHfgmvJJ0SUOJSo
	TTri21jInW5gQn0JdHi62UshaeIqo7yMFxw2g9k8fmKvaQ11ESWr9GYKSzSq72tTb/ATRpRQ66qh1
	/UxRX7XgH25hAG3xyftNdRuERk0Mc7AMnnCfJfuW1LZZUjbRrkXS6/4DmiT7JDP83OExwyVqhocvf
	fnY0+NGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3A6-0000000Fs31-1ojt;
	Wed, 28 Jan 2026 10:52:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3A4-0000000Fs2W-2hDE;
	Wed, 28 Jan 2026 10:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y4pbQczQO/V2vi2j+wymLlENbnTlsLtagplMs9AL1aE=; b=R6CLK2tmPwzR57vEE0Oi9LFXH6
	XROW9xD8rD4IIgxjdTjgTUQfz5WwrYHqUERQ9AAeF1dFozsXPZsmv58yoN1iUXSYUY/c5Fq9VhnYg
	fMqAcM68TxpRUXW71AYhVRENYeNiuwoNqAgi1Mb+gRGGKmjfGZ5UOHgZba9JZNZJhbFWJULQQyf0L
	BBYI8No0DfcG73D/Z7jh7guAAEV8SaidS397wFJ2L70psdkpFN2ZkY+O2gKe2dcBtSP8oXisHPz+2
	+FzTd3ITpMnx4CPvq+hhvz4WeT8OSdJcdvbCk550zyeoI/Vp6ozdrCyaqornMbhJ0nyutMW3p4Hzi
	oO1icMCQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3A0-00000008LbP-3ypl;
	Wed, 28 Jan 2026 10:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D163343CD0;
	Wed, 28 Jan 2026 10:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B58EC4CEF1;
	Wed, 28 Jan 2026 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769597550;
	bh=tucQhTlV8za1lu8MMrRqeJJ31gz69ypAvVJoriihhkE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ViEGIoH8WISDNhvOrX04vjPKG2JsdeQzC++K+VPDpBjbApVieCzQdka6GCKlJJZQM
	 kJma+zcQwuo0OVZDkJ15DjXbzkJ9jCcPYFv4ZlKyk1P9KnmzLQuxjdWdoLG47nEIi/
	 zDbiLcOCm7Dj8/UDWp4qXwoh+OOdf+L3B0wjytpMZK6giYRDkSx+hHnimaxwvwfELy
	 OLDor3AvwD6N+RNTuPJXi6Y3MM9lSyGyv0Z99LeemMHZfyE7wejSGsaHHCdxLWt2ES
	 SxedeNVs95NdSTuG1A+uh5Pq9Tj0kMP2VBUO0csiNlt3bDroJsfIcRiQ3H/JGbcUtO
	 KJ8VHi9KMczbw==
Date: Wed, 28 Jan 2026 04:52:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, 
 Longbin Li <looong.bin@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
 Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
 Yixun Lan <dlan@gentoo.org>, Quentin Schulz <quentin.schulz@cherry.de>, 
 Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Paul Walmsley <pjw@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Boon Khai Ng <boon.khai.ng@altera.com>, 
 Yanteng Si <siyanteng@cqsoftware.com.cn>, spacemit@lists.linux.dev, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
 Chen-Yu Tsai <wens@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jose Abreu <joabreu@synopsys.com>, 
 "David S. Miller" <davem@davemloft.net>
To: Inochi Amaoto <inochiama@gmail.com>
In-Reply-To: <20260128072931.875041-2-inochiama@gmail.com>
References: <20260128072931.875041-1-inochiama@gmail.com>
 <20260128072931.875041-2-inochiama@gmail.com>
Message-Id: <176959754960.624625.3292309980701778789.robh@kernel.org>
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: Add support for
 Spacemit K3 dwmac
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_105233_498370_6D6317C2 
X-CRM114-Status: GOOD (  12.24  )
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


On Wed, 28 Jan 2026 15:29:27 +0800, Inochi Amaoto wrote:
> The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> MAC (version 5.40a) with some extra clock.
> 
> Add necessary compatible string for this device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
>  .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.example.dtb: ethernet@cac80000 (spacemit,k3-dwmac): compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.example.dtb: ethernet@cac80000 (spacemit,k3-dwmac): compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.example.dtb: ethernet@cac80000 (spacemit,k3-dwmac): Unevaluated properties are not allowed ('phy-handle', 'phy-mode' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260128072931.875041-2-inochiama@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



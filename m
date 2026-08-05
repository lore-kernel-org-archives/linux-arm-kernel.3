Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4616DC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 21:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOnt+mlWKgahltXJogjp3RXlb2gzBmZSb7vGUrLlr+o=; b=fAHTHBPzFRjVHhIxnY7h9ZaClM
	VyMsPhZASmnvw69J38QFKmwJz1kd68jkF7NKDaNQpCvyYb6eBSYmIfMhEE18t+DbXLSjuIo0dx1nh
	kYyX9WZ2PNGxc+oWTSbY2vlvznxUDzJ72yXlBFnuHiV2cJqINegXgdh2h4VY6ThaJgnA9mh3k9XQO
	r+aLOGuIKNE7x4+dKCC/WkyqsF4XP5op4t7nm6SD3bQciRGx8cbkdz8fnK6Q1zHStmXKTZvnop5Fx
	kXdTsi7buqX1zIWzF93bwuBXOsaeynGXN/8qHWJYJ7j+K7UWloHtvdH6cYF0IHscBNmy3hWIMguVl
	5oAGfuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1writ8-00000004Yfw-1g2B;
	Wed, 05 Aug 2026 21:10:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1writ7-00000004Yfm-048j;
	Wed, 05 Aug 2026 21:10:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A850660A5A;
	Wed,  5 Aug 2026 21:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ECD1F000E9;
	Wed,  5 Aug 2026 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785964255;
	bh=HOnt+mlWKgahltXJogjp3RXlb2gzBmZSb7vGUrLlr+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPmWNwcW/a2+GTDqsCuxybRSLYK6rygLIowK+o0tF6OmRIvWaNJFyQlgRrlA5qrGA
	 JOnog+xabydNVu+zWzJ8mYUplnfwQgNCiY+LYcVCAVh1qhGKoR21iIZ2TZbVvtHyqT
	 63kK8kw7vKw/RGInQxfznoDxEE4Tu7GyeeohwD1T5DmLgIkkR5SAYzT3SBUbYgivy2
	 iejUl19x0hiCewezJHsaPH2HmGfd1A00NmrmOhizhB2oOzr7m2bxV5/hhIYPRxqVcR
	 PRoPOd6RK7IoPLBX8B7/pZDWwT3WnifvHhx5xJQ5TY4Umf8PH2Az2E1LcTaq09IJQp
	 G760Lb+L5rFpA==
Date: Wed, 5 Aug 2026 16:10:54 -0500
From: Rob Herring <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Dmitry Osipenko <digetx@gmail.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Julien Panis <jpanis@baylibre.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Kurz <akurz@blala.de>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 00/10] dt-bindings: mfd: Use generic power-controller
 schema
Message-ID: <20260805211054.GA1783131-robh@kernel.org>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
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

On Tue, Aug 04, 2026 at 10:16:35PM +0800, Peng Fan (OSS) wrote:
> The generic power-controller.yaml schema has been added to dt-schema[1],
> providing a common definition for the `system-power-controller` boolean
> property. Convert MFD bindings that locally define this property to
> instead reference the shared schema.
> 
> The common change across all patches is:
>  - Add a $ref to /schemas/power/power-controller.yaml#
>  - Remove the local `system-power-controller` property definition
>  - Switch from additionalProperties to unevaluatedProperties
> 
> This is a pick of patches 2-11 from [2], rebased to linux-next/master,
> no changes. Patch 1 (the generic power-controller.yaml schema itself)
> is dropped since it has already been picked up by dt-schema.
> 
> [1] https://github.com/devicetree-org/dt-schema/pull/187
> [2] https://lore.kernel.org/all/177523251875.1559844.9690289848283345069.b4-ty@b4/
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (10):
>       dt-bindings: mfd: ene-kb[3]930: Use generic power-controller schema
>       dt-bindings: mfd: ti,tps65910: Use generic power-controller schema
>       dt-bindings: mfd: rockchip,rk8x: Use generic power-controller schema
>       dt-bindings: mfd: ricoh,rn5t618: Use generic power-controller schema
>       dt-bindings: mfd: netronix,ntxec: Use generic power-controller schema
>       dt-bindings: mfd: ti,twl: Use generic power-controller schema
>       dt-bindings: mfd: ti,tps6594: Use generic power-controller schema
>       dt-bindings: mfd: rohm,bd71828-pmic: Use generic power-controller schema
>       dt-bindings: mfd: fsl,mc13xxx: Use generic power-controller schema
>       dt-bindings: mfd: samsung,s2mpg10-pmic: Use generic power-controller schema

Can we hold off on this until at least the next cycle. This change 
effectively bumps the minimum version of dtschema. While 
power-controller.yaml is added to dtschema, it is not yet in a released 
version. I'm not all that sure these changes are much improvement given 
it is a single boolean.

Rob


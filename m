Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56FCC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 21:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UC3IO8cIp/jhpoXZx6fPB2Bw4heXNVKT+nG8vL5ge50=; b=sbQBF3xTltRBhIc9PWBFdFpMcx
	1SWWlzC0HTUtpy/yLWy4orABmm/X1OxZxGED5Kvf4R46nRhOKJAdknQ1RQBt5CAKfoBXuANikpzSp
	4cb4KpyYDGQtQAkqoqWGJvOFae7yFs/oKm3ygW2opiTqZDREwYPfEE9hUrYG39CG8j5yzDgM3CPTD
	ji6OiKEkFbjVmi4RKj2oVB2dFjH8v9pTaUZxZOpzJNvx8DsG996nhyzPMvm6O3DTq/mNdpHPrWXAv
	tNF3vHAahSjxhP/hzTSS1NH3K1AKN7UkYY7kdhKoUiy0YKKRUOw5K3ZBpDpo/rJ2UjFpgF9iIaPPM
	O6QNDthQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriv8-00000004YtY-2qpi;
	Wed, 05 Aug 2026 21:13:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriv7-00000004YtJ-22Mw;
	Wed, 05 Aug 2026 21:13:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8A1240ACE;
	Wed,  5 Aug 2026 21:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BE51F000E9;
	Wed,  5 Aug 2026 21:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785964380;
	bh=UC3IO8cIp/jhpoXZx6fPB2Bw4heXNVKT+nG8vL5ge50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HydHWDqmDA4oYO1lXbKSt6JxI4wlEWZr0Fnnri09qzeBwKTC+Hc14TpFgCu82ZWmM
	 USmb/p2zBO4ELQc+GUYsrzESrO98fYQf2+kknu9nPjVBnfYNMvBsofrF85WKAB33EL
	 pAfRrd/f3AcKqqGqTOesUVNxCyDWJwjlTftVzt1162VBFa5Ogdhi7SkrLHVTVepkmo
	 98mYOwhVTQaPffJuK6CG+d2cTxWS6PtN42bcr+7hYStleZjDqalk66SGsLtnZ4E1L3
	 y2K8u4MlQE/ZcmWNlgc2U45OucgC/kumrOq/Cpipf62Lrs2UJh06yZJVXrMTe9njLZ
	 HVtFVevgEBOdQ==
Date: Wed, 5 Aug 2026 16:12:59 -0500
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
Subject: Re: [PATCH 02/10] dt-bindings: mfd: ti,tps65910: Use generic
 power-controller schema
Message-ID: <20260805211259.GB1783131-robh@kernel.org>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-2-a440783c2e78@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-mfd-syspower-v1-2-a440783c2e78@nxp.com>
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

On Tue, Aug 04, 2026 at 10:16:37PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Mark the "ti,system-power-controller" as deprecated and include a reference
> to power-controller.yaml to uses the common definition.

There's little point in doing this. You can't change existing DTs and 
you'll have to support both properties in the driver forever. Maybe if 
there are new devices added and new platforms.

Rob


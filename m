Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BE5C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPrPFYojIc/FLb795oawltkydQ7L40SMeB8iTNZbDPw=; b=hswy4Rf2N0mzJ+KGKa+LcMk/x6
	3Yaxwk8lEQ0kZ579xad7mLzaknlgpDV4sFJJJQO3C6y5JEIucnIYVElGeBafc4+FlNd0mFNqJgXZs
	xl0QUi+OnDb11L6qvSFb39mH9RWC5sWNVWezffwxf9r+6VXSTsHyv9iLVb0otauK8EisdBn9e5hkO
	2SVDtRIBDi118FCZPG1vM9+fb6uTQbGIRFLcNBpEDKT95ItqrA7+PWUGjB+dM4ciExJhTvd9Sn+zo
	txt1KgGOHrAOy2McDDax+/fQAPr9KHbfRdWUVaCxxQmbewf5IfJiwiM4DyHHfkv8bzpOpU6mwkqkC
	ripil0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRoh-00000008H4S-0VCP;
	Wed, 09 Jul 2025 10:14:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQ4A-00000007x8m-1d76
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B1C2A54726;
	Wed,  9 Jul 2025 08:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B85C4CEFB;
	Wed,  9 Jul 2025 08:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752049329;
	bh=xPG52BTncWLJdHYh0LU1vnvuC53n+yvO3aaCWoTt3Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F13w1w53GQZ4lBKvPLrYV2/FLjRdBTE4rcolvEZtDmup+x2oZ72CAxDyD0A95F9sF
	 OmM/ecsXM1ofjB15NolC+vy6tyuMwxahfsKmzun6eCaI9x7jt9AjbMGGPWiAjNwmvx
	 Yb0RAl/bW85bLydLeBlUHuRdHFFoi3nI3L+Ct7TXfhaaYnyMmUOPCjR7RpKcVBeSR0
	 7nLbDClsEYUGnJhMYf98pTPBZkMJ7kVdf+19pSpg0Q+5pJ09lkmAu0kPzIuo7+TD7+
	 ndm6P/ou65oPtapCENzqvWp33YG8BtIPn/6xNit88dL9p0p3QWPMp0gz1fe/CTfTB7
	 Bqqfc6oYpgR6A==
Date: Wed, 9 Jul 2025 10:22:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: media: add i.MX parallel CPI support
Message-ID: <20250709-magic-jellyfish-of-inspiration-e78867@krzk-bin>
References: <20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com>
 <20250708-imx8qxp_pcam-v3-1-c8533e405df1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-imx8qxp_pcam-v3-1-c8533e405df1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_012210_490185_BC4A780D 
X-CRM114-Status: GOOD (  10.28  )
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

On Tue, Jul 08, 2025 at 01:48:42PM -0400, Frank Li wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> Document the binding for parallel CPI controller found in i.MX8QXP, i.MX93
> and i.MX91 SoCs.
> 
> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v3:
> - use enum at compatible string
> - add ref to video-interfaces.yaml#
> - use cpi as node name in examples.
> - replace csi (Camera Serial Interface) with CPI (Camera Parallel Interface)
> in commit message.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



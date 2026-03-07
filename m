Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D9AFC9EF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znSWkqRW15uQMOwR1bsF13m17m1rgrDzmwHSdo5tfk0=; b=yh91YLp6JH4rUM2l9QJQ4Waxha
	z+Z5uU3uIzAGJeZyxcuIxtycEpHmDqx1ubM/sYBUQofXyM64rciNugZwlDAFkm3hKUzcQE6N9nVEg
	V70Vp9AwvIfloOi8IrpMuJJMy2hkgwyoMKG3Fa/t6yWDO1cfCtQsxEoeNGAA9wbmzU/oVRT8hSZYk
	TaPpE9wKMFqqROeMjGMJIt6vYVpbx+thJPbqAZxRNJPQfoEy9aCJFZJKU6nWpMkah45ipx+VO7N4U
	26VkLhcQPK0pH7NJjBzSCELpCSg5hPkqUX7yNXSOzMazZ7c1Ertqd5/dZIx91c6dx5iZMidsZSNWe
	FR3BuqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypLM-000000057k7-08b6;
	Sat, 07 Mar 2026 10:57:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypLK-000000057jm-1ATR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86518440AF;
	Sat,  7 Mar 2026 10:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C764AC19422;
	Sat,  7 Mar 2026 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772881029;
	bh=DovIk0OvW87b8a1GeeXSGXxoenbkGtrgVNP6Cd7cLAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFO/GhYiB3zwCdTMYkhDR0OMOKq0X95Kmkch+SCzSXhuP8qQlYvkupLYQgMumW7Ui
	 s2dD7D/Qo+ILK0qaCWmI/9Ur0Mx+Bj7LDRkRmFZY/LMSXyI5ynMXXxrrZWSDPAOZ1e
	 hKQbOk8QMTxYo+kn6p1KPqKrw/CxCdZQasvB9E5rFwPIon8bregOIztgabiPtf9G+o
	 Rgxin8sHstUFmk2YSjc25cX9DPPCPXmpZZdBZlDVy3yPAZeozXNNARwOyysyMICs30
	 S7Jxu8v1+xDbLpL0JxpCJxyZ4EAB5qVzRxtPhbCIUXpicVP8h03gDwcgk1itmmRIn2
	 wn/mmOTMAbHEw==
Date: Sat, 7 Mar 2026 11:57:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, s32@nxp.com, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: interrupt-controller: fsl,irqsteer:
 add S32N79 support
Message-ID: <20260307-stimulating-parakeet-of-science-ef1b78@quoll>
References: <20260306161555.9000-1-ciprianmarian.costea@oss.nxp.com>
 <20260306161555.9000-2-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306161555.9000-2-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_025710_335621_A9DD1FBE 
X-CRM114-Status: GOOD (  12.41  )
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

On Fri, Mar 06, 2026 at 05:15:48PM +0100, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add compatible string for the interrupt steering controller used in NXP
> S32N79 SoC.
> 
> The S32N79 SoC differs from the i.MX version by not implementing the
> CHANCTRL register, but otherwise maintains the same programming model and
> register layout.
> 
> Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>

Co-developed for adding one compatible string is a bit stretch, but what
do I know...

> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../bindings/interrupt-controller/fsl,irqsteer.yaml           | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



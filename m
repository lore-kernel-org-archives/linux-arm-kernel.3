Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC1AFC5906
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mCi4ji8txGquoBnAzsh+knnpxjH6ldA+8IGID1jkQg=; b=aX5rBaQh7iklCQAi7z3gXKlKi3
	fTT+7YTJm6tUZTq57MKnitmkLyAV1yOtJAczfSZTwx6ktF/V9RBi88WQnZ2Q3qiorBSh+ftI+9rwv
	+B4n5A1BzNJEvh8Gy8hIU39q1c9/+x1IxO4eaSgCjAEuMgt/v4uTabD8RW1I2RNVAsPz+z/yQI7dH
	4fI5VIhqJkOet5FhBHYsug8i5uVOcK6RnRcYxSxcRqkKY3YFwhQJw3RjtO7qfwyL7jJYm0eF3iCq8
	mC6Q35zOK7jwUT/KbasJ7nR28bkLGCHLVXno6SzKRxrc/jj+7PJBkBdPcjI8Q88x/6GtM4/LvX+xQ
	Ha3FpFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVqK-00000005Zs0-3y3Y;
	Thu, 26 Feb 2026 07:31:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVqJ-00000005Zrf-1SxO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3FE140114;
	Thu, 26 Feb 2026 07:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FF1C19422;
	Thu, 26 Feb 2026 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772091086;
	bh=9IZ0Ru3ONraj9lwI3xmbHNYYyo2HE6QKxe5G+TySMiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSrPivD2rNDa5UBdHMii/B4FzAa6gdK8GLro+MyczmENoFUrU1u3nEFj+LaG/wAt/
	 lrZlhFl9tVVE8i8S3+PhimZK8h6WvSL1rWc4mF3mJ37NRnhUPhZiHATq7MNDCpt9ph
	 FYachLfnJE4QyWKSRYJ0AbO6hRAFTdXW3B+bE2f9C15bk7FzZeQfSE9xroXIZOYgYQ
	 Q+9e2jti294AaqS+6CabYsQGzAA++hj1OdBPdCeQfXO9oG83BOHEc0On4+2282m+Dj
	 5U5uGRRnAecRkc+r30B89PrqSILHuBZu8IZqp6XURw2VbV8haakl+U0oTXZCYAuD1e
	 9lNYZ74RzCIIg==
Date: Thu, 26 Feb 2026 08:31:24 +0100
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
Subject: Re: [PATCH v2 1/7] dt-bindings: interrupt-controller: fsl,irqsteer:
 add S32N79 support
Message-ID: <20260226-ingenious-shiny-axolotl-e0e6d2@quoll>
References: <20260225133858.8026-1-ciprianmarian.costea@oss.nxp.com>
 <20260225133858.8026-2-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225133858.8026-2-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_233127_414513_ED1D7F90 
X-CRM114-Status: GOOD (  15.46  )
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

On Wed, Feb 25, 2026 at 02:38:52PM +0100, Ciprian Costea wrote:
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
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
> index 5c768c1e159c..caf3e4a1f26f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
> @@ -22,6 +22,7 @@ properties:
>                - fsl,imx94-irqsteer
>                - fsl,imx95-irqsteer
>            - const: fsl,imx-irqsteer
> +      - const: nxp,s32n79-irqsteer

So that should be part of enum with the first entry.

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F90DE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSSesqOcqgYMRsz+ON+YiZgRZH9XbS81hSYoLDcC7PY=; b=3+o4WvD5TKvj+JVhA2kXg2D4TV
	CFVC1yLgalMT7GfU43+G2qwnPUpqNAky8yXpU2ZRSRFzHC5b2PO5CiZjMjmXgPdqLSN/8nEZJN/6W
	dxEMRo0QPjEVoJsRygp3pyCovvvPEEHwZ4hes9BLLVrnE19ZUoo7aloEiW69X2bK3c4zhdCVAjMfn
	uXPjdoSVfRaeg2dghP8B4e9LwSItHa2fb/nPHttfJK3CNZ2xrzgKbE7dOQJ9y0dnUbYMN8mQ6aS3M
	wSYoYg/vJG3rJxunAmTCH3Bb8OeHP/ysEaPYthT1a26w/BWjqkZjOUpBe+ReIzoOs0J6CHVqu/mzS
	lylhM//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7jd-0000000FGck-2ctD;
	Thu, 05 Dec 2024 09:01:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7hu-0000000FGDu-1KqD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A61815C7016;
	Thu,  5 Dec 2024 08:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D11C4CED1;
	Thu,  5 Dec 2024 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733389173;
	bh=lAD0H7r9Zo/MaMQfVUNhKvp+1r5Ka3oxbUXiz3DROB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KUQvwMNjzDcm1gAp4xoQV4yL+JEctE+SXiIkys+MqlAWFVWlMlCuc6iCfgjNYKMg1
	 fMRiClgEFcGYvk1F4fLhvUSG0LVqn3BW68epJteQtL/TtKKd8YaFtidFS+dxqlem7H
	 TsWwMrQEQ+ivRSIpaAYEJ8HoAzj5yYvbcPJqbfl1ongVvgZpgwDIW8a7IXIylm8Kh3
	 nNkdwGvLbms6P614vxyJzLWMlvCDgniJODQZK3QJ1AnlcCn5zpbQKp67ol3YiMc5/y
	 zimn+mWChaIvOwNR+Hl5mbzcyVWB9ygqluBYiUKSUcxO0Jx/IBEEU/V47RmjUCj9rF
	 6vVFNT9X9iPDw==
Date: Thu, 5 Dec 2024 09:59:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vabhav Sharma <vabhav.sharma@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, frank.li@nxp.com, 
	pankaj.gupta@nxp.com, daniel.baluta@nxp.com, silvano.dininno@nxp.com, V.Sethi@nxp.com, 
	meenakshi.aggarwal@nxp.com
Subject: Re: [PATCH v4 1/4] dt-bindings: firmware: imx: add nvmem phandle
Message-ID: <vxe5ml2zwg2kg5ui2mz4ws2mc3fj6whvnvvft3x6ezr7fhkdrd@ipghbtncp3en>
References: <20241205-secvio-v4-0-5c37cdc39573@nxp.com>
 <20241205-secvio-v4-1-5c37cdc39573@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-secvio-v4-1-5c37cdc39573@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_005934_397029_8B34DBC0 
X-CRM114-Status: GOOD (  14.39  )
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

On Thu, Dec 05, 2024 at 05:56:32AM +0100, Vabhav Sharma wrote:
> nvmem phandle is required by secvio driver to
> read fuse.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
> ---
>  Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> index 557e524786c2..c88d9c2dac24 100644
> --- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> +++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> @@ -112,6 +112,9 @@ properties:
>            - const: rx2
>            - const: rx3
>            - const: gip3

Unresolved comment. I would normally add conditional ack, but this is
second time you ignore comments, so I don't trust you on that. Sad that
such trivial things will require respin.

> +  nvmem:
> +    description:
> +      phandle of NVMEM controller provided by the SCU

Best regards,
Krzysztof



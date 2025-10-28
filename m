Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12FFCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JEKmV4lCVSDj1Z3sgw20GJ3PnuRYXeW5CQHBHJ4QJU=; b=X7sijpJ0X/EiKrcXvODQ19wazQ
	unF29zUbX26jUENm4YhDBhGAT52Bi7lY/J+umAFp3n7MrpD9t+UFKEOFuF4vJQ9bsK4MoHPAaXPQf
	pH6y6OaeFX+OjqXqzjH/AmMlN0RvCrjb9xrpfqu2b4Vdcx4ZVey0ekrr33uRqxf5oYQtFp5QBDypl
	vo+blv+CgJHDAlqW/BqiylsPz1wfIeyuiwjQmOd5eQ4+P6N3/w1BpAGWqTB/MhmhOEFEShXcH9Olr
	W2GafNzDUmeQsosjTKzf4ljb+r9JELhTR3PxjPc2urYJTeA8cpJkh3mf+8SRusbGDDOo8NZetQgRw
	AwPBqIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfbf-0000000FbQV-38tD;
	Tue, 28 Oct 2025 09:03:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfbd-0000000FbQ5-3C4u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:03:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B10A41986;
	Tue, 28 Oct 2025 09:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6594EC4CEE7;
	Tue, 28 Oct 2025 09:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761642185;
	bh=WPuS1p03nJA56MEoRrTM+Ywn8nh+8dI3UapF3Ehxvpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/qUlU0ZPopjFTMLx4zYjlF2i9nz19usJHFqW8oZoBpQsXaVLIIUPFiJtVNUGvcem
	 I6BMGesn8kLn2u8QrlcyfeImFZsBa0ksoziH8pqUYlvqfaOzbgk/ciUEd5x5ScVIiT
	 6w1qAqNZVYtyb3R0ugjvBwgciveN84SPJuqnFi034iKCf1LEBRHgfZF8W76nAMcjhp
	 Ol9yO16MLt0ZNc+N76hYogP/ewRNr1sCWlzoddDUoUOqow/VezgwJi/hkJ68iD6dHW
	 UUL3zgb6LlJjtJi6p7arEfOAdzC4OgV3L9FMXSc3xw3DRMkpmNA7iV0Lde+fivLLdF
	 hA2OqtsnlbRuA==
Date: Tue, 28 Oct 2025 10:03:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/10] dt-bindings: display: panel: ronbo,rb070d30: add
 port property
Message-ID: <20251028-premium-sunfish-of-feminism-2bc6ab@kuoka>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_020305_841139_D0C1C7B9 
X-CRM114-Status: GOOD (  13.35  )
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

On Mon, Oct 27, 2025 at 06:48:11PM +0100, Josua Mayer wrote:
> port property is used for linking dsi ports with dsi panels.
> Add port property to ronbo dsi panel binding.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> index 04f86e0cbac91..a2dc67a87fa3b 100644
> --- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      const: ronbo,rb070d30
>  
> +  port: true

Port is never the second property. Please look at other bindings.

Also, missing blank line and missing top-level ref for panel-common.

Best regards,
Krzysztof



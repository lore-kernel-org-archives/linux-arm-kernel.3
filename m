Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6450CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIBsuff9cQcOVuqIjO+KfvzYyglT7O6Zci+HTk8+BCU=; b=FqKubIvIQzC97vuYjCG0boT2OT
	vQArdNM6mOQUSnHcC53uGZO+kjloUY7TWjHpOzIFh77S2PriL8OnqtvqDoVuBZbreIUHjOU6yjfCo
	ijbRluirgXZOIsnMqcM42hQoj6K8MGAd6f8ZPrbRGmaytUxzXiyQ4qGUJZ1xJDFWOJT+GifJoF+5p
	IeUGOdDqR1QM8vp98336jczOKar0k0rnL4y6OdLkpXyMzaiLPkDHT+gowZwHpgL7qsbr0uaFV2g/L
	3plFOx+QmO/gTyjkV7HhYsmiBuU8zCJLMGLX36SBcgoW+iXDjiHsijKjgmr8W1Ld90n7a/tQSPzMq
	cHouofjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfZF-0000000FaeC-3GAG;
	Tue, 28 Oct 2025 09:00:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfZC-0000000FadQ-2nFW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1E3C443C8;
	Tue, 28 Oct 2025 09:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AD3C4CEE7;
	Tue, 28 Oct 2025 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761642033;
	bh=rZ4NQKQCLrbiX4zUi8bRocWHIWn3QwuUM+myMdN/DI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWKmH91fKqGtdl9lsayw35svBXtixc0YgYQVpuIVL9pV3DyVI4ORJsSFIQJ6+TAjL
	 mwtHeqgdSesSUYZPa8eQPhQ+WLFLpDNuRwGR8zjohAwM4FDUvR4zwfjjk5WqMkrMfP
	 /0ie3QweE1xAT7iov3Jl8fEMazj1vSI85Km1nxoi18ebyoueCbsmN+3FFRYPiDwguS
	 Es/Vka2CmLvy5ZsCb90LXqp7lTuXfy5lscQa8tnB5hkoRnt3II2VVOouuHkmVfzB0e
	 wU4QETD4dROrAf25zaUsYknU6tnD4fPGfXr03WMdBuJJlyVF4HPXCnfGPcVxDl5BX5
	 vSHxEvZG/OzvQ==
Date: Tue, 28 Oct 2025 10:00:31 +0100
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
Subject: Re: [PATCH 01/10] dt-bindings: arm: fsl: Add binding for various
 solidrun imx8 boards
Message-ID: <20251028-truthful-dexterous-hyena-d3d4c5@kuoka>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-1-683f86357818@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-1-683f86357818@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_020034_746415_C688A840 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

On Mon, Oct 27, 2025 at 06:48:10PM +0100, Josua Mayer wrote:
> Add bindings for various SolidRun boards:
> 

A nit, subject: drop second/last, redundant "binding for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> - i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
> - SolidSense N8 - single-board design with i.MX8M Nano
> - i.MX8M Mini System on Module
> - i.MX8M Mini HummingBoard Ripple
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



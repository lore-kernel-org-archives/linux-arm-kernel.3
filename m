Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FCEC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 06:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHOhb8fLvm5l9s1ySum6mhWfmDizuVTRTPmFOv/E41c=; b=B5B/mTJO+W2vfA9AXMGXgvbxom
	kjMAnLB8JEHFBpCX+HAUbzebLWKYWzbX10eNzPkmawhJsnbI/QbA2O2hhmqRohVW3y7oGInxzh9lu
	UTmuuNxJ1PBuqMInbsGsHRmsBsvsO529+Scen3EcJubyCfdwmjuaJ0IM2QCZwNplA+bOjWay74ccv
	nftyJjkPwnXvDp9qD9+RB7PYhwiT70J159djbDQ5rc/bxsatRGXRWOuNi56UWXnVDAfcTe/zNR08y
	ORwcFWzXE53DQ/dGE+jyqF7BUssg44b9/DC+5z8CQEoxvP2wCWVp3JuzggKGyZMxv6t3NXQqXub5f
	RYeWg2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBS9-0000000Bw1f-1QIn;
	Tue, 05 Aug 2025 06:47:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBHG-0000000BuWP-0CmT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 06:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01DC25C646D;
	Tue,  5 Aug 2025 06:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB18C4CEF4;
	Tue,  5 Aug 2025 06:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754375760;
	bh=sIHPITH9zG/L0PbzCUmZDWaszbXx38hkA/bHt1tkCsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vOetwG6wjPaFORrkROIrDOatq5ormVU2vdtjv/cTfRt7ABu2cGpYaG7vuXplt88PO
	 eKnp/n+o346f6/YG8oB0r+bYIfWKNkbsnmX+moad9d9FBnPPpmHy/EUXFx4NgLHNtx
	 ucu3PxmCL14qKSC1XJlI9SENNJMRxUivtYlWFKW+ongQ7WgRYC9uAtSV41x2PE8zHP
	 m/Lz5HNXUpJPaTn7ZgTHnrUFAF8qwvfwH4HGRn7Vrm+Z+7NUxXbpxVBjhaL/zzqzdc
	 IQfC4RvRWmK8w2Hq2+tZKGZ9PNcDLQCQ/t08gO4s/GcwGBq4BWIthFB+6lAEzlJ+jY
	 BGGAuyxnJFixg==
Date: Tue, 5 Aug 2025 08:35:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: imx: add HDMI PAI for
 i.MX8MP
Message-ID: <20250805-realistic-hawk-of-merriment-f84ef2@kuoka>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804104722.601440-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_233602_388440_66F9801A 
X-CRM114-Status: GOOD (  11.93  )
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

On Mon, Aug 04, 2025 at 06:47:17PM +0800, Shengjiu Wang wrote:
> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> 
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> 
> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
> Controller compose the HDMI audio pipeline.
> 
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA70DC982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0OVTGPgWTDcP7IeXfZpR+F08h8lgiCM2uhTjTHEnHM=; b=HOqr9v3Rf+ovujHJ2MdHaxAY09
	oHvQjBy9giTfswXrSo/aQdiDzXmp6Wu8jDblaU25MOkesyMm7vR2S8Ev7Gd3i+iGEKdW7qX4ZapRI
	j3EZb5VX6mjKIoJCBdBbj0BH5aiU3m4/bWbk8JNiCzKT44S/lMqFX4TvOz4rQtbZjdHaaHD2aiyuf
	NSsuLeMQDj5KR9V5ICHGGpPkBqmms6CgIScEKtv6XNZzXR0mcP+pI83gl2RuI53MQ91KMCxEVckU1
	UqKg4XYH2YrbEOhrZuwK2l+IBz9TXEL4+lHTWa/IIOuhQv0BdTFqBjQrLTcwdpTHEGSsMlYkbgCxz
	PVWal6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWs-0000000Fast-1qV8;
	Fri, 18 Sep 2026 21:53:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gWr-0000000FarY-3UiB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 21:53:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C1D0433C9;
	Fri, 18 Sep 2026 21:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E448C1F000FF;
	Fri, 18 Sep 2026 21:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789768437;
	bh=J0OVTGPgWTDcP7IeXfZpR+F08h8lgiCM2uhTjTHEnHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BOse+aHdWkqCl9jRalTVS9IY0rpnulBUFT1S4W7GGNoZgeAJnRznJGubEV2g+vSQj
	 pDORAHH08ft6C5FEFTsOqszrtyOWvG4Ty6k7pB1PT1Zk6CLDkpMjFXAY3eYstITnYI
	 MpXo+u/Ibwct5b+cBSZhLGyexOMih9EB5/jd61BkvnltjjpqXMXPQsVxquLnxzUkCz
	 xqluq/f28D2BvCyrtVE/VPdSxjB0fDyiaqUVlzKKOU8bu+B9aiSBXlh+jMt9/XUOYc
	 nwlzZonWWZJrp2qT826QptvlxOADJRlCv03kL8kfxeZk5zLScDUIQnIi0DCR5PVs0f
	 U0JAvvfi7NdfA==
Date: Fri, 18 Sep 2026 16:53:55 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 09/20] dt-bindings: arm: pmu: Allow power domains
Message-ID: <20260918215355.GA2371991-robh@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-9-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-9-9d0c17e1f816@kernel.org>
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

On Mon, Sep 14, 2026 at 01:54:37PM +0200, Linus Walleij wrote:
> Allow ARM PMU nodes to reference their power domain.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
> index f47baaefcdac..305c1a9668f4 100644
> --- a/Documentation/devicetree/bindings/arm/pmu.yaml
> +++ b/Documentation/devicetree/bindings/arm/pmu.yaml
> @@ -88,6 +88,9 @@ properties:
>      # Don't know how many CPUs, so no constraints to specify
>      description: 1 per-cpu interrupt (PPI) or 1 interrupt per core.
>  
> +  power-domains:
> +    maxItems: 1

The PMUs are per core, so you really need to support more than 1. 
However, I think the PMUs would always be part of the core domain and 
the A9 docs[1] don't show any sort of PMU domain.

We already support power-domains in the CPU nodes, wouldn't that be more 
accurate?

Rob

[1] https://support.arm.com/documentation/ddi0407/b/clocking--resets--and-power-management/iem-support/cortex-a9-mpcore-power-domains


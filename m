Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F950D10376
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 21:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knLfVfGXR/hSbV37dje+u1PyR+fFa5pBqjcHFvlnxEI=; b=tJ57L5r+Fnmt+5il5Sbf6L3Uig
	6cz/7kV9yUyHlWcayWTVgrMzFUXEMfFadtslmxMgntxQD2GYY5fIXcAs1fqk4zg1xcLVEYExH1C7k
	BQcLN/XN3mvYmIWbxcKeBLxE9VNfyAkpp2X3YYRXWiy2TjgCmDiZr23ucWr1/aukoaBiIzhiiJUku
	oMS6SAh7bhMrehjpA9N3vAA/RZcSiUrbsxtFyuQuLBXpPFON1oV/qLITMhrJ9fMScNv+sPdYV+N/d
	B+HRcowLzr/tixYE0Mpp11WJkCFKxrvtSTXcx2AzyzTrlLVCbbRnUTfzLPZ23uHOh05rZrDQMDbfy
	jykhdQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t456V-00000001pvQ-0A0r;
	Thu, 24 Oct 2024 21:10:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44dg-00000001kyS-2wDU;
	Thu, 24 Oct 2024 20:41:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70CBEA45825;
	Thu, 24 Oct 2024 20:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CF7C4CEC7;
	Thu, 24 Oct 2024 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729802459;
	bh=mMLwDduZ3xaKPZLGXPUhMR7+mEPMB7iB0xxVnV3jIAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sEJE8izBJ+cP82Efa7daFEyfmBgH8QvXEHr6eQ3e+5/ZURby2Zdg1uv4iK05E7/Zm
	 vpQboJImDbckilahc63B+vU8c75+KdIId4vZWDuFoMIoptGO5iHs/GVX3WMFCru76o
	 aNCuJVRliOZ9DDYRCfTqQwkN6s5SJhTtP0BWk0coYUxbKWgH4AN1HekU6hNZBePpUs
	 UIOMggTnoSPxtV8wLbnlPyU6JgO9QyIYK7ROez3Ng4s83KCIvVawXGn3OKEoGrOgAh
	 xVeWve4B3YNLDlD4G0J53rSmJbfdr6iFX5e7I5YniyOVWMcUmwr8CWw1HJSg9lzqz/
	 xbPoiSIRV0wFQ==
Date: Thu, 24 Oct 2024 15:40:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	linux-rpi-kernel@lists.infradead.org,
	David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	dri-devel@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 06/37] dt-bindings: display: Add BCM2712 PixelValve
 bindings
Message-ID: <172980245756.1013194.11978023436348943569.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-6-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-6-1cc2d5594907@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_134100_825153_76F3F49F 
X-CRM114-Status: GOOD (  11.45  )
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


On Wed, 23 Oct 2024 17:50:03 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 has 3 different pixelvalves that are similar to the ones
> found in the previous generations but with slightly different
> capabilities.
> 
> Express that using a new set of compatibles.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



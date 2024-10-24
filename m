Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E83D10374
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 21:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxR7ci2O8SZhHGkoeveSwpvg0QkXlkXcbp5bVRSVU7w=; b=Y7Cdvt1JuMtnhjV1b0RiqOVnks
	inPmDyHS7XvnsPf5EkRo3L8oe6XjBtvIjwfgRjT6CRUkBr3lemJKkOL1ZKetDnN1NDhsNcE/zsdG4
	ROZOjT3mmotCN4eYwkDS0hf6C/JVDfVSnqiqEwnLo5tix0PQQjSwAE7IRwvwAEnzpywFBhCFbqLRt
	jyqFy5DYeEl4TCFWX46tT8BAUOmi+STNVW0tx50XxBcTXsUwd4uS/pJw9EHygXzHu6q3E++OVkFjN
	HpF4srqw5ug61umRyJNmXWuELPu/f3edYRlPJC18Wt61kwFpWrLS5hD6bmwn835wrFM2U5iXJ8LxP
	H7d+22kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44yj-00000001oE8-2ISl;
	Thu, 24 Oct 2024 21:02:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44fr-00000001lZW-01xU;
	Thu, 24 Oct 2024 20:43:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0BDEA45820;
	Thu, 24 Oct 2024 20:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD185C4CEC7;
	Thu, 24 Oct 2024 20:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729802593;
	bh=orvEes6Fv2Qup0AW3+pyjYH5D4wzwY5+810rtsKY0lQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=srTVQ5aBOX2/rqg6m0A1ll5HXJrBk3zGKvOExnScO3mg/lp8MD3Uu/7GNare+rNI0
	 YFnATtetlZYcpBy9MUZVvBl9IJ6nDNsJo6QIEsDQeYA6CGJSNZHTWVNIVrnYOVQsSQ
	 s7vzczcpA6yXFsDYEMniUspOToVG5awASk+VHhr7JnqfwvuNqNITnC0TjdMZnRz3Bf
	 Bvu/lxuJ4etfUbCGAXsNSRI0f8dXKCSgVw52q4H3Ld9vglwLJ64RUalRfyTreeWugp
	 FiV16pcUS86F5I17ZVZZKIMGIt/WyykY89ouwtncDZ63QO/WqoQptPsAiXJLHAMv4+
	 EEUFKp110vS/A==
Date: Thu, 24 Oct 2024 15:43:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Will Deacon <will@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Maxime Ripard <mripard@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-clk@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-rpi-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Subject: Re: [PATCH 09/37] dt-bindings: display: Add BCM2712 KMS driver
 bindings
Message-ID: <172980259231.1015965.14524192141045927759.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-9-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-9-1cc2d5594907@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_134315_191705_BAB775D1 
X-CRM114-Status: UNSURE (   9.63  )
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


On Wed, 23 Oct 2024 17:50:06 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 SoC comes with a new variation of the videocore display
> pipeline. Let's create a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



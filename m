Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496FECE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkSKebNSRBQHq4Sapx+wgCZ9BZjz6h1DhGj6CVNdTec=; b=SVjLHimD204YwPDP6ZeCI6Jgum
	O6FP8NlTvPXIUtnRDpsrj+t0SCpEQ/VlXDQg2Qh38ADdkzVtR/qb7kaGVC5t/xY5tdImIrQTkCVUE
	vGxPbYjPs4gkIvkaPIsI+KFBK1ElSmhywgFoDeC0DJ26+N/GP0kFuehP/iy8SRS6p+GiXbuMPBfjd
	I0tQsPixxEAqFafEbGOyrN4INUOXhlMQrsWIECaAt/aVZQ7n1uqWy6h/JKWj9/qaBiLWYzNh83G8O
	mkiNBhV5aVV6JcsH5o5J04v0y+b2vab1fXwT13i0rpfvJ0ARSwj3ZATkMBjgssXukJtaacGnUZlNZ
	0x8sYFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zoD-00000000vEU-1TBU;
	Thu, 24 Oct 2024 15:31:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zZD-00000000smq-3duz;
	Thu, 24 Oct 2024 15:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EB1F5C601A;
	Thu, 24 Oct 2024 15:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC13C4CEC7;
	Thu, 24 Oct 2024 15:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782962;
	bh=/gnpu4B8t4IL7ynEXrUUxsgwtBS+XtHTbgdzxW9txJc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=EWjQjEylN9jN2AYF2Z+Buio7/U4Het2kbl4zvp7VcNMpe6uoxAQnKKAheRPTROr1y
	 4KXRC7fWnDWpF3EOlNWbZhf7g5pYMZrH/GOJ7zGGnEop5veigljsQuodcz56osmzJ5
	 myqrlmGwY+71MRipkTD0WB6g4wWycrRyhrgFd2ChRzAia1fuC8CZR3SvriCiaElllI
	 rBTRXObrnyhUHOEXb32JT8kEDLsDSaMEqCHVStep7+CGKa6NSuVeXQvSlqKDW1EdXV
	 puab9WgqJpvvQXLLnMUHWE05nGDShEetrFoMi9HspQhyDJfo+j8dBPImpNV5++Wcsr
	 DMxmwgT9KrjOA==
Message-ID: <499656b677fc13544f5e0e46e5e887ec@kernel.org>
Date: Thu, 24 Oct 2024 15:16:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 03/37] drm/vc4: Fix reading of frame count on GEN5 / Pi4
In-Reply-To: <20241023-drm-vc4-2712-support-v1-3-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-3-1cc2d5594907@raspberrypi.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Javier
 Martinez Canillas" <javierm@redhat.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Michael Turquette" <mturquette@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Ray Jui" <rjui@broadcom.com>, "Rob
 Herring" <robh@kernel.org>, "Scott Branden" <sbranden@broadcom.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Will Deacon" <will@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_081603_991751_7B59199C 
X-CRM114-Status: UNSURE (   5.44  )
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

On Wed, 23 Oct 2024 17:50:00 +0100, Dave Stevenson wrote:
> The frame count values moved within registers DISPSTAT1 and
> DISPSTAT2 with GEN5, so update the accessor function to
> accommodate that.
> 
> Fixes: b51cd7ad143d ("drm/vc4: hvs: Fix frame count register readout")
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


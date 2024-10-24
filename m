Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D03CE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSDWWZB/I22N4vbBcpJVNkG0BBl3g1tsch61/CZHfyM=; b=MCO/kHrTTyWuszeXkRewe+kfuv
	RYJuafz25670HnI+TKMdq7kPaLkMXQhtYEK43jny5gCvmBYR3QVvBrAHvbj5rl0Ptu+hVtEW5xGgO
	kjJ/xx0jOZed7cadhgLEVqFSwmabRlMKVk8WoOrETYL/7Pg7so8EBBQmr0mnj0TJEw3AuwDvVoZqn
	QHYMuOXYZIuRdV++XGbiV8Q5ZCFEUY/4OM2ugUc0pTeNStkCqbX5doU67ua/Hrcl0pw4Bj7j0OPsp
	IYxaXfUkDCKKjNfngsvutqoEitW/LqB6cToBuEwgm/uM+5LXcEjUpHRubAM6rzkPbH4KFctZCNJk7
	nX1QiFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zfj-00000000tji-1phT;
	Thu, 24 Oct 2024 15:22:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zTR-00000000s99-0dC7;
	Thu, 24 Oct 2024 15:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5F125C6023;
	Thu, 24 Oct 2024 15:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FE0C4CEC7;
	Thu, 24 Oct 2024 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782604;
	bh=VMFs9dmln36rULHELZnrUMSHBuywGkITllI3k0F8SzM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Z9EC93UxAcJyaTtDojfNt/Fu3i3015IzTXL6vRFRwso6gj8phUyldJ7Ekf5kjNDVT
	 4N/K+qPmyTw5fFrBwxp3kO/DPWYf3HwhLRsY4Npr7VA/UacwXiNt3QDnAxHE+vk18x
	 6KT5LkITQb5Qdgy9o8vQfU0iWMsPJ99kHFbAP5lKaAZwW7Af4GRdW6hShEjy/k0J8Q
	 yJybhfMppI7PMbJiYREK5ZOQsy0qCVzxRSLnExvemUjkVWmv0Q/Hrq3buRE7NdpGxx
	 BMIAlMUmtHwn/xfV+Ci85xYy07nFTmncxUt6RTL1Q1OxR+by2JNsJDcdp2WqzPOim1
	 jevI+VjrTD1UQ==
Message-ID: <76a344eb23149909d13ea46c25b97684@kernel.org>
Date: Thu, 24 Oct 2024 15:10:01 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 28/37] drm/vc4: Enable bg_fill if there are no planes
 enabled
In-Reply-To: <20241023-drm-vc4-2712-support-v1-28-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-28-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241024_081005_269637_F7514374 
X-CRM114-Status: UNSURE (   7.23  )
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

On Wed, 23 Oct 2024 17:50:25 +0100, Dave Stevenson wrote:
> The default was to have enable_bg_fill disabled and the first
> plane set it if it wasn't opaque and covering the whole screen.
> However that meant that if no planes were enabled, then the
> background fill wasn't enabled, and would give a striped
> output from the uninitialised output buffer.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A53D10380
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 21:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+05j5VtVYd4s6Kp0ml8O75skrt83YcXw4bilVHWNy+0=; b=2lTQt9uArXC7BYbnFOqYn0b6eG
	Q4ZA4aALY+YcrJa56fRv1leIDXXvWFAF+GTRDWfbhuN7HQ+VmJqDz2sSs74iUVHC8I6Yz2PSdaJA1
	Mlqy5LS1x0Dszxtq+Z0tr1yfXitG04v3k1lVxsW0V9uT5BJViIf3Uuc7LtV6XiWd6GAQVHyxtyWcf
	8llxIsiEzztd3vSFS8xeGqiCdGfecLanlj5tN5ExGi4IgyfU/MUl1LO+6iXu64CvA5fbEuUx2xOyh
	lKjNaCCGMw8TlOb8FuahLOXt2iwVxrH+muMewe+LjWqa/o+VMZYdYFvQznEw62ftHylfT+rLbMwgd
	QZoI5uZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t454v-00000001pVJ-2iXx;
	Thu, 24 Oct 2024 21:09:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44dL-00000001ksK-2Bmo;
	Thu, 24 Oct 2024 20:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7143DA456C1;
	Thu, 24 Oct 2024 20:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EFBC4CEC7;
	Thu, 24 Oct 2024 20:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729802438;
	bh=X5N77Rrxi4T/tH4H721m+E/6JRcxmNxBwaisxQYuV0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBZVXSmQecnpNoesTgGk48A0ZJBBDRZnqtcfGptGRPQUL5PoNy+Z/W5XIYVQIViys
	 GMIUOs3CIht4iQBKxF9qvuN40GrPbrRaewQdib1IE7H+lVyAlO6OFHi0kTxA7GjHSl
	 hwoN81yXgLgorvQj34+XffNfAOoo/e2+WAj6OwkMWwpFmnip9r+mQbH6XZypFHhme2
	 ZVa2DCcWLsPoHxKJRYoa6cUwYCx1iZV92pbcBlbciHuuvHrj68D28bfUaYMH2WTpDM
	 Z8PQUZER5Dqdf+2+8slEF80cZRllolc1HZ8ku6kTvP0eusDr6QBido6DH1QaGvdrxn
	 ohwdWQ1/yVz0Q==
Date: Thu, 24 Oct 2024 15:40:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
	linux-clk@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Will Deacon <will@kernel.org>, linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	David Airlie <airlied@gmail.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 05/37] dt-bindings: display: Add BCM2712 HVS bindings
Message-ID: <172980243679.1012695.11368075486894894542.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-5-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-5-1cc2d5594907@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_134039_651661_76E76725 
X-CRM114-Status: GOOD (  11.09  )
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


On Wed, 23 Oct 2024 17:50:02 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 has a completely different HVS than the previous
> generations, so let's add a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079E5E65D00
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 22:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6wHdyoxNUpRBpMmh2gL69b2b/+Ef17Hp0UH+78w4OU=; b=CtjilIs2lvw2IQWLBx4R1rUVOY
	qYJS0jAjvSNqen1N+bAIGC0mTQkZYfQRheS0BIXvypUL+j8H8yKEqnXci/ru2HIKHUDknyNb00ZS7
	AxVFCYwhYj/o1Rs7cq/7EJNo6Nw09AeDAuFhQ5ppH8G40QW/jUYmAis1JyFUEov2eyEo9mZ30CqXx
	OYECS4bF8zj+qjQ2OOjk+VsgRhQNiDVcoVyQNuh2Hk/kRlECHWWm+3dbySlO/3H53K+d1HmTfotvM
	wu46YYB54TpmiQYVePuemk/taoj3VYkW9Kq8DnMXYG0ziSKOZnERjOosfapLT6HxjYiYu1gRno7Gl
	DViySYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEG0k-000000016hB-1oW6;
	Thu, 21 Nov 2024 22:50:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEFy1-0000000168P-2DjU;
	Thu, 21 Nov 2024 22:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EAF4A41581;
	Thu, 21 Nov 2024 22:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48306C4CED1;
	Thu, 21 Nov 2024 22:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732229284;
	bh=C6wHdyoxNUpRBpMmh2gL69b2b/+Ef17Hp0UH+78w4OU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Mrp+ZopbIzV1tWMTzQfBqXI/6aeODAjiJxx03uR0PixV42c/T2Gdae1dC4YkYtWa4
	 q9fmXQfk3cor5CLV6P2qMPu04IPHoMUAV368u7I6mb/pj+YiWxKJsMNuQsPpgzoHBs
	 Jmf54SfKBUrFxRE0ajzePZEYMzOxQiCN0+CPdf+MPIBjD8XUq92GnQAh+duupRwNbw
	 SnB9Ngb8GvhjbNvdDAz/bfgYqEt5/5A6GZG+XlPx0xv3tqeUSltq2JC1k1WxWwkObO
	 QRgS2uZyMERL1e37gskDx1X2PJ03KtBGCWXkntcsAfykiljBcEZQAwGyXNDJ8J4Px/
	 N0vohKaaK9wBA==
Message-ID: <3c0b2c0206254bb8940bc34b3297bcbd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241023-drm-vc4-2712-support-v1-32-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com> <20241023-drm-vc4-2712-support-v1-32-1cc2d5594907@raspberrypi.com>
Subject: Re: [PATCH 32/37] clk: bcm: rpi: Enable minimize for all firmware clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>
Date: Thu, 21 Nov 2024 14:48:02 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_144805_644043_9B4A9C96 
X-CRM114-Status: UNSURE (   6.58  )
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

Quoting Dave Stevenson (2024-10-23 09:50:29)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> There isn't a reason not to minimise the clocks, and it saves
> some power.
>=20
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>


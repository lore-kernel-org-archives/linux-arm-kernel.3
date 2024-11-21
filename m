Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4202E65D03
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 22:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1fLa13P8mDRrOP8+gS00AgdX2GjJzhR8vsIwPskW5o=; b=u5Jg6aKiYI4ggwio2ccA0dyJqM
	iyznzzaeXmSN7oqtbDscPxsIB6PMxaBte4AaceP6PzWpa5i6IYG3EwAeTwIghM36voA5rR9A9bL1r
	paQArzJ41DMN5gWkKGoQQ5fwXCzZwyiw4cxilT4z3uSzzhfDWbA/meb8UEYrTyut8bgC0VY8b6u23
	gOvbaILlbShKf5F0OaT8x9nfmfyjNo/gS22S7Cilxh5uDJNa/4i3e8k9R5VsAtbON420cyVum5COG
	YphywQi66wICHVNhddQ6y5Js3Xi/A+rZ/W4MYBiq0gRVUZHW9QaU2rCzE+ydJ1+FrzOOjKuwdRDTy
	R35U9rgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEG1h-000000016pS-2S26;
	Thu, 21 Nov 2024 22:51:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEFyI-000000016Gt-1nde;
	Thu, 21 Nov 2024 22:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 053DA5C5783;
	Thu, 21 Nov 2024 22:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652FCC4CECC;
	Thu, 21 Nov 2024 22:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732229301;
	bh=T1fLa13P8mDRrOP8+gS00AgdX2GjJzhR8vsIwPskW5o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KbtcTKIuHq2k3j4iGWdl9hio2PzCgQZ2jAGMlIZrsvhB+x9GnstYr/Mjh7a4lbZyK
	 yfSfwfcBgP+goaruiHsFw6eZFKnbmDMB3P/qxK/QoYeEN2OH06trSzSIL8y0KH4hcN
	 WBYgvjeEGhJ2TxmV2wqGmws0kjEeQ/OBRRLOaK/yrnPUrzxktAK8da62qu0Bb3OCHz
	 1RDGnT1Q0fBb23ioUIRBAiE8/UkqcKxJGOAHB1h+vHZGa5XFq6xasIuytqIiTB5DJg
	 HJKT7K2RXFaSxnWDZ3vBmEoG5fiwUB9GdARnt12qMy4kFZWfHQoQXYwiBcUafMMXFP
	 wZTwIzdvOwu4Q==
Message-ID: <9c072de477d913acffa50696c426d8ff.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241023-drm-vc4-2712-support-v1-31-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com> <20241023-drm-vc4-2712-support-v1-31-1cc2d5594907@raspberrypi.com>
Subject: Re: [PATCH 31/37] clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>
Date: Thu, 21 Nov 2024 14:48:19 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_144822_512693_8B6B991B 
X-CRM114-Status: UNSURE (   7.09  )
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

Quoting Dave Stevenson (2024-10-23 09:50:28)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> For performance/power it is beneficial to adjust gpu clocks with arm cloc=
k.
> This is how the downstream cpufreq driver works
>=20
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

With Maxime's suggestion:

Acked-by: Stephen Boyd <sboyd@kernel.org>


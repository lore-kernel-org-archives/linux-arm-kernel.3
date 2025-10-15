Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC99CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4It/FexjX7Tb/YMQA8YIvotB/6NNP6gyn8HH1WX6xjs=; b=GnWYpx8/Z5bGLH0hsKTXfNSTUb
	ON167xT7EXWH/ZMknhR/0WNDRW8sUc62iWaJBDeiTVWUZtrNBHKOP4vXXj9rf9zPreFngLiDhrx+R
	ALijbynes2AwnfZNR0+qk3FGU2XlIBhgr+nBM4HyIQun3iaYjnDAXb/8QFeurtE/evUUd0RCebWYS
	B28esH4la7YLbNAF5ND5NfsDKJQ/x0yY/8f1B91uGtWJTYvj2QKH9Y4G7Fl0Zkhwkloo14FhXu0Jb
	lpXvRtqjFRfP4kockGoZflHIpR/GwAljXV3yvH5M2QSqbXqmelRDzrz3ZfNYXjX6ecae3CaTKMcDX
	MWTTI5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92wY-00000001zn8-1mZH;
	Wed, 15 Oct 2025 14:57:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92wU-00000001zhG-28bb;
	Wed, 15 Oct 2025 14:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=4It/FexjX7Tb/YMQA8YIvotB/6NNP6gyn8HH1WX6xjs=; b=d8kXpbPeGKcxnxci//8a9M5ztQ
	vagyPBmdoskh4hQpyHK1nLobeCHJaYjLP5dgOgUe7H82NdYncHDUqUX69LXBprHkiaISMkPiWYIHe
	s8ZbsXuQd4Fzb4hlOKpOYKJqYY1V3WJKNvcqeyXHyyxPuAVXqNAIvaFoawkaMDcA2YnI0XdOtZR46
	SEPsBqmwg+hNJEGZRaI24RN8KukEOjZLz/DWvrNpbecXKTWNrR/2/dbzrhqzjHJQVvxb7/OM5xXJY
	AXGhv1QxNxyf9+gKXVhXUH7omD7906pP4sNer+Bk/NWhMmn2srLtRP707XMZPnqsIe8oeG8+s5PxF
	/vnMlzDw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92vj-00000006043-2DKl;
	Wed, 15 Oct 2025 14:57:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB9A94A47B;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53596C2BD00;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760540188;
	bh=aBigsactKw446CLi8wlsqginYIn3IhRT+6NDvM9c2F8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PeufMCGh0sLCmjUXwukjGLJNJOo4q6n8bwIm1yarwcIuLYOKyv/RwcMB4NdL1+Gn3
	 3HIvlJjL+0oun2iCaKn6x1RftlFEQbC+5MSRK9wcQAHDMA8Csm3FoqhWppBsxw4liA
	 q/9bFoQIVORSci6w592x431c5b82jVOPKHsBtNSYcKqYhT2vlOOMLUj1CzE2pJBmvz
	 UhbJIXJcl5xLMxJuKxOcOegZCbV2hzk+OasoQfAm93gs4oZRW/dIKDSy5cSmJnLVR0
	 ZRK2dwP6vWtiCT5D0yHdePwxlxGcNsns4di0Lk3AUDSGyb1PWh2hpNAJKVrcODUAkM
	 PoIampDD4RtxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E73CCD194;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 15 Oct 2025 16:56:36 +0200
Subject: [PATCH v13 13/18] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v13-13-da164b4918fe@collabora.com>
References: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760540185; l=950;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=6j0p86wA9iB9QT1kpUQbcTBHNdUs79VzNYjYvLw2zV4=;
 b=9PPC9/y5d80N1ZqjJCERbm9PmamXPlS+8UZzYNiLDUQmvrw16PrOsmdpBmPlOHU3WOnNJpitW
 KkCCleit/WABoCuKxc6uu0fOPHRKHHFeb52+yyMPjMNeW0F8TZry/qt
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_155721_813431_28549600 
X-CRM114-Status: UNSURE (   9.49  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip Camera Interface (CIF) and the Rockchip MIPI CSI-2 Receiver
are featured in many Rockchip SoCs in different variations.
Enable the drivers for them in the default configuration.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..86e39240979a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -883,6 +883,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5




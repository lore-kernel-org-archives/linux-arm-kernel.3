Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B202C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jymu2XT6oGWIZ0IY0uZ36gmaUBVWn0Ji0RH7UGb2xvY=; b=jn1jMTpFrNazUJTGtKZSAu0Ktr
	4EWX451/E1DTQ+DtczGojP8rIzoNMk2r1nIVflA+UeP+b1bCKd0LRhI/OwPlLyso3ptAh9gHHJlc4
	uH+MJvmvHN2lFfTMOXJL02aps2/A6nzEd3vsHRGA7ToRZPEAhvCF5x4VhNO/rC4U4teaBRYwWi+Su
	j9T3LUWdID8X5bJQdwceyMtH0cGvmvOuhZ8hU6v/6kjTMuMSi9RBvyqeZIXKx9+LywsFUMDgIE84g
	bEUVwb94r7IqdTmPGMgqRIEp4InxZWOE3Ywjv6OKQ8ODzmxEn910FSGpv86PDRaLIRB22opKVfZlt
	p4/jd6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBa-0000000FtyQ-3Mk4;
	Wed, 14 May 2025 17:46:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEQ0-0000000FeR1-10dp;
	Wed, 14 May 2025 15:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=Jymu2XT6oGWIZ0IY0uZ36gmaUBVWn0Ji0RH7UGb2xvY=; b=W/0B4Z7WV8wVc+/sB9NMVBcvck
	f93O+9oN4Xs52DBxaJ0yjiJttM/eHKZxZvZe2UwSwhLZycMLIi1H8XwYK1iU8Ci8N9grzMSleaOUE
	7e4LPFcdIJ2ggs0FgOicYdQegNc+K82+4bW04PogT3meDD8JTUCx43AYY6P1Es7dolai/NXiDqsgu
	RJbtq/E20ol6Fcvj61FRViqa2tRZQEmcdtmVzP70yRih0oa//p1vIbs4iARaFRc0QE0LixUbif530
	iBFZ66Cy/xQKUN4HJtWaR1BE5ra/ksGwN0yG9Arw620rS0vFxLqB1RPBEao9UpCWsYzqMTvV0dSj3
	Xgf04Oow==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFEPs-0000000HF3Q-1Pk5;
	Wed, 14 May 2025 15:53:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCFE34A8A5;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DAA5C19425;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237983;
	bh=hvc8YjD+3Czi8oyUKN3U+pIlgdxqaGnu32O+P0Ce/cI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gIDGCzVylzShc2o/8DPM3YUvCyn3HgHya42+/QGISK6OarnIuIUvOhZkwuJxYymmi
	 RJV5tj9V7NgoTGwi6aMizTb7mR3fZ+JhjCP9lEbrLTmhVXNUbqCcr3MCckg+LO93Mx
	 cQuo2pHjgo+rozsL5xEJziLObpws4QJtCiQN+EBrIZ/U252e5IZlL98w3zHFZL1crn
	 seJnoRU0dsFVWtL2yzye0V/fWWzyI2igHrBJxsFVo1zohd3+Tavv5snEPN6in438G8
	 CHkHZfYXZPwdBmFweVw5OJmcEU939nHmhrFbTgJSFHA5yzjk/uNSaz4TH1kLPmtQkI
	 YBAQUIdyBjacQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EE0C54756;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 14 May 2025 17:41:11 +0200
Subject: [PATCH v7 10/14] arm64: defconfig: enable rockchip mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v7-10-7581fd96a33a@collabora.com>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747237265; l=782;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=L/KlLC17WtwsxJrk0tU9EzILCecoj5a5gEXcaOiLEks=;
 b=2jMCAGG/ajS58qyDx/LvTprPIbWWJsUpKmqgF8kQAv3bXqgShW4ygUwoZ76GWphXaAI1ECUed
 rD0DkZUYvz6CvMArfhsj1HZeTHkz+RftPRZYrvbMi7W7nHGp3/J4/iK
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_165308_743470_13FBF3A6 
X-CRM114-Status: UNSURE (   9.88  )
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

The Rockchip MIPI CSI-2 Receiver is featured in several recent
Rockchip SoCs, such as the RK3568 or the RK3588. Enable the
driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 110ff52195a6..ffef4cd024a1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -859,6 +859,7 @@ CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m

-- 
2.39.5




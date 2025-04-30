Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67680C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GibpOKw2Oeij1CARh01uy2fPKLSvtfSGjC3d7eZhmY=; b=it5W53sb528rpkSOmmYGAhmOGL
	Qi6aZ2VzNoESWiEVS+CbRikIVO8wxFJJtVRiUR3OKt9eUrvXgiCfWqUcsyuWNI2JmsI8r1q5lIAal
	P36I+iUSEU95bnSGFC+JEmXZ3Yj1gowHD8VGwKgfIplxakNFRODxi2R+iw/L71w97LGFYTryif3A5
	Ue77Fe55SKpKZzBBbgt2KKMPa+PstN6EMQ5ZILR81VPZqRpYnwmLANhk6PCjxotRdSulnXA94SLx8
	akia9clFL+wvLZxoFuM9N88DtO2uU3L91sxNcnPabxXf9G6tvi2GuITxARRHBUeDWCBbirkvLcwiR
	1p2ezaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4HD-0000000CSvl-1czP;
	Wed, 30 Apr 2025 10:02:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3jQ-0000000CMSB-3Nog;
	Wed, 30 Apr 2025 09:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=0GibpOKw2Oeij1CARh01uy2fPKLSvtfSGjC3d7eZhmY=; b=c7JYVhBBRWk2ixVNpjwcT17iof
	CSeDvVrL4bF6/QjlJKGiQPn2bTK68s+ugTlxTbdlyq3q2J/PYCbnM/ItDFRHKkXYph2M7gL0hEtbT
	nMlsTQ+nCVM4GDb1I7DbUoJvgAtnrPdvLJLy0HhTMgWij2hNyfC4BGwb5/O1yiVzhUnHpkq+30uca
	mwUB6cul2B8ll1YVj9Yg/jtdDY7WV3nfQWo9OVy3ycDv2KqR6apXmQFdXPqzvjzgiyjMZNh28QN6W
	avUgrhXV5LOnwjBz33a/UkPW6Lm4uIzYPwp4UtnquiTW5rTfS1lat8alsMF7JgnTE5JrSzCLvqWqW
	bnyJx+xg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA3jJ-0000000Dl30-43NM;
	Wed, 30 Apr 2025 09:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C57834AC42;
	Wed, 30 Apr 2025 09:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFDE1C4CEED;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746005264;
	bh=kTKppK2H79eLeACzamVwFdZ/qi0nWKnNmS/TmUsNZ3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gc3e37m3WJUOEdF5hgMEaICfdhHmpJQrr7/bfaAfrkVU0pYrz1AeB9XlU9+Gibjsm
	 F63Ww1lReNKXe5zODERVekEdMMU7CKnsCTxl1D51EdvGzzvxIgNYs8PMvVIP82LLVj
	 df6kDLSlb15quqoYDhHF/c4Igf66jA30Z9D87/FWlv68gOK1UD9VeF0Sd1ydQEHniq
	 qfAVJ6P36MSFTwF0nOCWTZg7UW46P4Vp2RjJmOVd88oNfFlOMBlRDuz5bjFo08+0Mp
	 TCREjkDxSbsymdxYP4bpUe86rURlu2LEhrkmdQn+BFgOFyZSHtu9QQf+sPxjJrEfDj
	 4y298YEwYN81Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B56C3ABAD;
	Wed, 30 Apr 2025 09:27:44 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 30 Apr 2025 11:15:51 +0200
Subject: [PATCH v6 02/13] media: dt-bindings: video-interfaces: add defines
 for sampling modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v6-2-d2f5fbee1551@collabora.com>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004564; l=1010;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=Uz74OJ3MrVHSpMmLIY3bphZ6CO+aAi3TjYd87Bbmoq0=;
 b=3pezi/eZthEJyZ3VA7cSIbm+xnaBjXhjmQJV5Ym/Xtp5znFGFi9MK4ISbR+kN20nMFWeOfLvW
 2w334p2hO0UCtFjNGpw8qa//2wB22i6hvrTR0dWWTqgYmTshGpbmenG
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_102750_434925_6C5182A0 
X-CRM114-Status: GOOD (  10.28  )
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

From: Michael Riesch <michael.riesch@wolfvision.net>

Add defines for the pixel clock sampling modes (rising edge, falling edge,
dual edge) for parallel video interfaces.
This avoids hardcoded constants in device tree sources.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 include/dt-bindings/media/video-interfaces.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 88b9d05d8075..0b19c9b2e627 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -20,4 +20,8 @@
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
 
+#define MEDIA_PCLK_SAMPLE_FALLING_EDGE		0
+#define MEDIA_PCLK_SAMPLE_RISING_EDGE		1
+#define MEDIA_PCLK_SAMPLE_DUAL_EDGE		2
+
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
2.39.5




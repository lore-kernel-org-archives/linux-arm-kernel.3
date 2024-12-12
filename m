Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A96CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijlL4rSz2njW9qWg3HQkc4dUeY9AmC6JyexQwini2AM=; b=f8vZYyA+mxNGHz9pF6pqej4vU8
	dYGRznCiPJvVhXP9ia5r6Q0cY4YEDgHLGN91eUBJkmURqhKaIbDfMCjuCtGPS8TojpbOmXVY8VlWL
	XYlWOYL3K8q7cvXOX87pc9b1L490ERg1R+SUn9yE0UyEhf4RorMpmsaD+tJZUs6ySkBgW5si30qGP
	0H+JDkOE8w4pIrAAj1A9rr7b4qC5PpMxiPlbwZ/wLGc25zgVM5gjSlgHk6I2KEIT1poGzMpKCoGF/
	lgmfYb7mCiN9ctMCelZf42oFNIIu6K3SZX1gKmxy6c1TkXz7WOKqEN/53kBkvZofkXbnTxNRKteOx
	vB0KvCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiCn-00000000MCx-0bHf;
	Thu, 12 Dec 2024 12:22:09 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLi8d-00000000LP5-0n7j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 12:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ijlL4rSz2njW9qWg3HQkc4dUeY9AmC6JyexQwini2AM=; b=azRAkan7zAyw0EQ59/AFiYSOsU
	a409kADRtbfHxpRKHelkZjTHLxA2s5+l0SV9RW6Gw7uxcFGv4sBcS+zag7qD7EOrUvi1kO9LEnztF
	xMBbC76vy99itpaPXTeG+kaevAPh9lkd6Z2hmll6Rj4OAo7y4ZI/dc0QUV3r8JX9UpRvsrgCeL/17
	bqya4g/1xhQTFUpBBjEF7aCikgLy5UI2cuH41ZQGXbiSyziu5AASj+kaxM+cGsm/EYFZmI1xuQw28
	A1nVM7Q4oMmyJSTV2OMzsyOyW+zuPvcAbPRInyryRGMq6rZHjJfdW/S5VAAnpPbMz2pSQGM8lQEKZ
	/QDFYYHw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:38802 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tLi8b-00A8t4-31;
	Thu, 12 Dec 2024 13:17:49 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v6 3/3] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing
Date: Thu, 12 Dec 2024 13:17:12 +0100
Message-Id: <20241212121712.214639-4-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212121712.214639-1-andrej.picej@norik.com>
References: <20241212121712.214639-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_041751_389003_3AE6F243 
X-CRM114-Status: UNSURE (   4.75  )
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

Set custom differential output voltage for LVDS, to fulfill requirements
of the connected display. LVDS differential voltage for data-lanes and
clock output has to be between 200 mV and 600 mV.
Driver sets 200 Ohm near-end termination by default.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v6:
- no change
Changes in v5:
- no change
Changes in v4:
- no change
Changes in v3:
- no change
Changes in v2:
- use new properties from previous patches
---
 .../boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index a9de42cf14be..8bf9cc553bea 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -186,6 +186,8 @@ port@2 {
 			reg = <2>;
 			bridge_out: endpoint {
 				remote-endpoint = <&panel_in>;
+				ti,lvds-vod-swing-clock-microvolt = <200000 600000>;
+				ti,lvds-vod-swing-data-microvolt = <200000 600000>;
 			};
 		};
 	};
-- 
2.34.1



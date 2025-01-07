Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E4BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzP2L75tY0s4FayK+dDFBr6ag0IirIKPS04LmEz6Ta8=; b=fWs9l8hRA6/hvbaAutlY++FZmx
	7Ik55XUsrp66MAJZo70eDokjNIhtiSo1NN1WRpJ4WXkvaJ0dXe0dzxzgnCLWT4MNAK+mE3JT7bKLE
	QGOHH6EtFoevn0x2As8Jo6FEkvOmvVMdr41/7vFjq4/50i7VZ09inVxBZbSPoMy3EhToKMwINA48j
	GNqfcaH9qFpXP371llbMYjtEVsEX/ubzeXyL+7QK+m4HddM2UljTAzOeAVHLpflLrbPVhV6htj6e3
	mRUadOB8ox8x3pSS06TZ1OiFrKCozZoWoHrrfkBNGzjNGiZneuAFFhU16oxeXv8iXdU9Efzn4+SIs
	MlQpUoKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6lN-00000004KFd-2MCQ;
	Tue, 07 Jan 2025 10:24:41 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6E5-00000004DGw-3nk1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736243417; x=1767779417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QzP2L75tY0s4FayK+dDFBr6ag0IirIKPS04LmEz6Ta8=;
  b=FWfCBPAZfjZ0iV6uNCICHcfegClr60ssEPjqH3sDC/ntHVSARQSUI21s
   KS+qwN04zIi75pjRcEGXKV2GGmOtfq00de4VANOwontkzNyB1GsPDZJYB
   TeRgJBhbXKlQuMo2PH9qMOnBVfmPDh8OmF8bRIb8cTHXJ7MZgYhEOmYfg
   EE6WTwEvtwDb/LhbzjZUsC8TlhLO0Lq5e+KiBFz2OXxGjAvKoHz6r9rVA
   RyGg5HrXe3RsA59fxbC2FhYOlSjPNkSnsWOr5gf3ToyOEeycsf6AD+j/g
   qHB3eDql0jrjnt7Hl23/fR0LuszklVwu3nsyhIsmOCs4c8I2vUyc5DI1p
   g==;
X-CSE-ConnectionGUID: Kew2XeO4QOOMJUerIB5xZA==
X-CSE-MsgGUID: G9WjVQx0RXG03kFOLwwcrA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40889027"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 10:50:17 +0100
X-CheckPoint: {677CF8D9-8-DDBC2A76-F469E51C}
X-MAIL-CPID: 0A25C61B0BAAEF839FD7A44E474FE128_0
X-Control-Analysis: str=0001.0A682F26.677CF8D9.007F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50C2F163CCE;
	Tue,  7 Jan 2025 10:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736243412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QzP2L75tY0s4FayK+dDFBr6ag0IirIKPS04LmEz6Ta8=;
	b=Z5smUcNpRQkb2oKHkcLoUQXNeYAtAEovHnKQNFM1HxqwL5Uw2iJvL+tBjPS2tQZ/tJpCn6
	DyIYhmaOKTo33GTAj8GacS1ig3QgACh8TcMf1uVQRWueIn3M5gCEiEUCUsTOIpGyqDqLXA
	dT1p+vO3Oz25GBoG8d/Yjb4JfEzG0tUaT71FoUYliRRdaUVkGPD3OAv+l1c4ui2LUMZaGL
	VqC1S1abM3VqDQGoDAXCFCNZ58yy9DVvtJ6QPmemR/CWJ2MeDm+YEsJ4NN5IP2094gc18b
	xb0U4tp/TDIGqCahr0gRDQ5aPKk60MdooTdkiZp6K05q0Ju2SZ/kmgbx5/ml4A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: samsung,mipi-dsim: Add imx7d specific compatible
Date: Tue,  7 Jan 2025 10:49:42 +0100
Message-Id: <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_015018_245716_9D658167 
X-CRM114-Status: GOOD (  11.15  )
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

This add a imx7(d) specific compatible which is compatible to imx8mm.
This silences the dtbs_check warning:
arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'oneOf' conditional failed, one must be fixed:
 ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 4ed7a799ba26b..e43fec5609417 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -27,7 +27,9 @@ properties:
           - fsl,imx8mm-mipi-dsim
           - fsl,imx8mp-mipi-dsim
       - items:
-          - const: fsl,imx8mn-mipi-dsim
+          - enum:
+              - fsl,imx7d-mipi-dsim
+              - fsl,imx8mn-mipi-dsim
           - const: fsl,imx8mm-mipi-dsim
 
   reg:
-- 
2.34.1



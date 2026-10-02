Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ABFCA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFNOETbNbTtMIOU6B9QL7UsZgovwmWkZI+ERbhiiZ7w=; b=1P9UMneWgKdOuFqgC2s7sIbFA8
	jZuCiP21HzgYcsfmWsvK7oB6AyHgYzc++Wg7ZdXbxwdVwLl8hWbF8F1cF1fv4HvuzGZFkODemAEBR
	qhzc3NZO3Zod2sMm//eNdnGtYZ9UhK1O5NTJhr6SHKN2CJwhIs8cDzIHo6uWKQtOPwkc5aTOEy0jw
	tuvWYF43kCJ6rpN5whsOhi3MDVJMzC/36DtUwCim1IK1fB3zalBmtSEh4YF4iTIIGxTvGWqvty8ZF
	tQMTzCWm55iiEslGNIV2lhVbxgNQkOwNm9HXFS0D2u62ysDh8D2GIrYgWZm8nDDg7BgGhq6I1iw0x
	IPUUIepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPd-0000000Ax6s-49vs;
	Fri, 02 Oct 2026 08:14:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPa-0000000Ax3v-1Zrw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 08:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pFNOETbNbTtMIOU6B9QL7UsZgovwmWkZI+ERbhiiZ7w=; b=NkuMEEkvtjK7Q7Ny4bVuq5Oy7M
	OMGTU1G8TnnSLl9CPU3jIAaA040S59zjIWk8CrfxJYBs9Qd+JsAxT74h1jBeQ5MXZXVqJ8TSIPk/Q
	5xLYA3aXUPSJESdYyO5BrUUTIx48W9Pm4e29Pr+xzj0XDExlZWXmWOIae3f6+Bs8ST28AIQNiMBe6
	z4bYMSxd17tTmljRCFCJvxTS+24pTkXgCI2RYslOOKBHWWIxcDWOtSvZ9/uKfSy4CKtGprx0BckjL
	yqSEpt7abrxXUxnbgwE674KJ0NBapKaAsl8ZzgDi/iT9cm/jdD2FvDJ+XbulUGu2B/a6YpRFr5Xb/
	wf+u/qdQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCYPW-00000005iKF-3dSG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=pFNOETbNbTtMIOU6B9QL7UsZgovwmWkZI+ERbhiiZ7w=; b=oTBNFV9ndqzZsy30hg+Xbsjvtw
	8f7txofiHum0vEFD6WxwACswwPllQHE982l508YpYD+aDXOFpHi5TARp7HcZXh/fZ2GzTRRQeTfkf
	8+KuH+CF1YkAOm7lfgVZ7lq9ltUIlD0cTcOhjVWzDMz2jVMvCXWJ1InBLkJSRTgkj+4niOnHOLQEQ
	Hx3HJeXcgZa5EJN3lI2yUuzT7kz1dBhxHahhIQyGHm18LqbpYp9wiQ044ndo6/81C6ZtuJhvC8b20
	usp8+EgcLJqt+9tOQmW+gJMAZXJTh64eRwRYxCQ6t+s5WLj6+XdV1AyV+D6UQQGaETFHN28Y91ycp
	45LK/KOw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPP-0003NU-2G;
	Fri, 02 Oct 2026 10:14:23 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPP-000FgI-1t;
	Fri, 02 Oct 2026 10:14:23 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 4/8] ARM: dts: imx6ull: Add LVDS DT overlay for TQMa6ULLxL
Date: Fri,  2 Oct 2026 10:14:05 +0200
Message-ID: <20261002081417.2092471-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
References: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_091431_366989_FDEE1215 
X-CRM114-Status: GOOD (  10.78  )
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

This simply reuses the .dtso file from TQMa6ULx.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a84026e6df0f..08d88adce2b7e 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -423,10 +423,12 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
+imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33.dtb
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
-- 
2.55.0



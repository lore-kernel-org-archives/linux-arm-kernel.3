Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15159CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lkxi//m4cQN7unhMKS2YMGJHIRGKv14XHlt5WJQgGyM=; b=dgjzoPTxsbrXdbfVogBa1aMrQK
	I1RqdQ9hMKu9W3Ph8ZyujNsDIc44K10KJ1BpP1CqU9resMz+ix6lVfngW7kPbKdxraQFwtLljIgcl
	7MOy6bYM2Cvl4nijnrwWxvGeFBEGXWa/4GOn+1EaoZXl/CDSvcIgUvkk2vMP2FFEAw1QXImaqJwcQ
	x4hQg85z+niLZPQfbpKCgSs2uXSy7OmT/lUfjyigccL0iZ1D84g1bZYoRF2dYfbnbuo348UDK5omx
	XSvEPMGLB3i2jDnyxBmBCNN0KIq55e+C0NEQxHX/tKZWkL/NFggodubiwripJfBTSYMMzYuwzwFG9
	rQzcj1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPe-0000000Ax7E-0h3K;
	Fri, 02 Oct 2026 08:14:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYPb-0000000Ax4t-3gjM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 08:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Lkxi//m4cQN7unhMKS2YMGJHIRGKv14XHlt5WJQgGyM=; b=RkmiUZPK7R4Nt6J38hRSGRtV2G
	+2zZ4LyYu4ABU+5ou0uxpnvSczM6yoz5dFGhmFOd3y25j7ApoU2HG1kuAyQvVcou1kq6lccWOs0iA
	mDwfDAz5E7cSIzLGFBibnHSGilip+46AeMdhVBIhtaLwmoBfp0NBXHGgYd5FxFg5cVDdaQKthi8yQ
	b/GzhbJ0Ucz22nDY7ijtS5EOjH+Cg1KwU40MUbdHGYPtP2HNyFiIJUVEh6tN2CySrcNhvtk/mk0wp
	PEkXdIGNIaaLRLJhwCr6MBmzsRnfue4RYMaj8t9SVLYJBgHbBiAAhUNgJv6rk3njDn6b/1zq5PlMb
	piqdcmxg==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCYPW-00000005iKJ-3ICL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Lkxi//m4cQN7unhMKS2YMGJHIRGKv14XHlt5WJQgGyM=; b=PgKVStwwv085KJ2eapRrBvmuCI
	+0EVy1wnSb4k8AwFSBBLCnoYuNM3Kfma2Mq95cAzNJom2uxVfs4S2FJxktPLy7X45QCy6Bez6Gk2j
	+7t+bD1qB/6KeaPM9m+VQWZavmfp2lmx72HitVN6/4CkoEQ9oC6PpwjGOHK1zEmb/8MnbG01mjEgn
	Kv9mtKlPtkVSOMRJyslYOuwJJjQ58qRFvDdxjMBBzJYkEqhmTlrmAC+RhHIeB2OQDsw8De+p3z7Ha
	DMAbkeNVy7mzRc7No9tQCTEztTI/E9dzp6FH8HQlqGDd4yz5ka+i8Kj2//wJLD9szsfI4FNxotCDv
	kfD3Zgkw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPR-0003PA-1S;
	Fri, 02 Oct 2026 10:14:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPR-000FgI-14;
	Fri, 02 Oct 2026 10:14:24 +0200
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
Subject: [PATCH 8/8] ARM: dts: imx6ull: Add parallel display DT overlay for TQMa6ULLxL
Date: Fri,  2 Oct 2026 10:14:09 +0200
Message-ID: <20261002081417.2092471-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
References: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_091431_460219_507B3FA3 
X-CRM114-Status: GOOD (  10.59  )
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

This simply reuses the .dtso files from TQMa6ULx.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 5f190900904ab..77b7aa9968c22 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -430,6 +430,8 @@ imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb
 imx6ull-tqma6ull2-mba6ulx-cdtech-dc44-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
 imx6ull-tqma6ull2-mba6ulx-cdtech-fc21-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
 imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
+imx6ull-tqma6ull2l-mba6ulx-cdtech-dc44-dtbs += imx6ull-tqma6ull2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
+imx6ull-tqma6ull2l-mba6ulx-cdtech-fc21-dtbs += imx6ull-tqma6ull2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtbo
 
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtb
@@ -441,6 +443,8 @@ dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-cdtech-dc44.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-cdtech-fc21.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2l-mba6ulx-cdtech-dc44.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2l-mba6ulx-cdtech-fc21.dtb
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
-- 
2.55.0



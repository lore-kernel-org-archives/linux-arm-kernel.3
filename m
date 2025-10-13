Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778C4CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdFSblBB+c7p7EwEPuHzEd2UFn5pK5CI5ZtkGJjeLYw=; b=xEMjRoxr0apSllslttQmU4dHgo
	+NZiM2DG4RZyDHC0x+faziv/EsPUjRIASsSmf62/0CPVDuPDFPV04Uxk+KbcaHKi4ojow+ILfOhFd
	s+ObldhgK7+RfxqWRXjNBbRscyMp2OchLQ3QEVtmCu5xjsj7VL2a5MjTKpXksGCawKlEaqBppJSDP
	QciJCLYvYCtp77NhTxr6NJFe+yYvL+CgnqyfP9GlAWgh3FL7Gfy/TyBQpfuO7V+K8UBtrRFXu8i2+
	pwZREOTAkGbY+yyxNPuYIy6i21gsperZhq373fxqVKQ1+A06V1GfgiXn1gXS28cdlS/jezngLq3Qh
	+ghEgbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CWo-0000000CRTw-1Ru0;
	Mon, 13 Oct 2025 06:59:30 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CWl-0000000CRRt-18kg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:59:28 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id A9011240027
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 08:59:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1760338761; bh=vdFSblBB+c7p7EwEPuHzEd2UFn5pK5CI5ZtkGJjeLYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=rVTq/r+saw25YvR8I4nYxqSrJIAt8Jwfg0NrcTm63W4Krooumov39yCewdAaffSXI
	 HX/pcK25ZRhuqZDNlbOC5Q3DA39ryuVYRXk70Qpiy538XrdRzJ/TTihYE0fcu58D4B
	 t/8je7qT0+9Ko7LVZxVROSiKjCafSojQgwQo9pkWtqG+Y5XdLfXZmFO0JUHBSDvvDJ
	 tuhBKf7isd9p/mi8wL4lobFQfWU/+hFPmZEN703FTHM+YXx2TxlBuoS8vZI2/1BSY6
	 N2vZI392CEri2ixBy8Rz/i4ijY2mh7QEX1gBI5DyanGuVEG9ZGTCM4zP8nrHadKElg
	 Iftd1IstiQ5vg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4clSrR5tZBz6v1j;
	Mon, 13 Oct 2025 08:59:19 +0200 (CEST)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH v2 2/2] arm64: dts: imx8mp: add cpuidle cooling device to the alert trip point
Date: Mon, 13 Oct 2025 06:59:20 +0000
Message-ID: <20251013065903.35216-2-martink@posteo.de>
In-Reply-To: <20251013065903.35216-1-martink@posteo.de>
References: <20251013065903.35216-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_235927_448033_2E11F697 
X-CRM114-Status: UNSURE (   8.89  )
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

Idle-inject up to 50% of all cpu's time in order to help cpufreq
to keep the temperature below the trip points.

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b59f53952d5..7ab321af9e15 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -347,7 +347,11 @@ map0 {
 						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu0_therm 0 50>,
+						<&cpu1_therm 0 50>,
+						<&cpu2_therm 0 50>,
+						<&cpu3_therm 0 50>;
 				};
 			};
 		};
@@ -380,7 +384,11 @@ map0 {
 						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu0_therm 0 50>,
+						<&cpu1_therm 0 50>,
+						<&cpu2_therm 0 50>,
+						<&cpu3_therm 0 50>;
 				};
 			};
 		};
-- 
2.47.3



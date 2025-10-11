Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09502CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 07:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cGLk9CgTjeU4UkHA/MrTSkj3+79kpEE+suq0GT0Yy4c=; b=kOORrV2i2Ht6aNiqxDzmmlZyJB
	hc4Mg1ahdJN/Q95c/GU2i+X0L0ZqUpqd+89YLLWRN8Ql1QSv+OL/56QD1TnQEnnU+pzlKPPlhbsbt
	Whs1olfZa6U9g35LSSJI7HO4drOZP1RY7IV8lXU+QuvF1ur0MbDJ9BklPzpT2FM8ghJzzORj52GOz
	0ZygWJzkR19fuZy+SQ/pgwHtDJn+C1SQt/azpdSjERxTVYI4X7q4JO5J7tLBuPAnBjPgodaRt3MOS
	cJzUHWAE2mcSPx+YzLKn52G+s86nd/6qs1SaT3D+D8e79bzFIDB4Tr1uKDPEksKj8CV9em97yxkBA
	mFw45Img==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Tpv-00000009tdC-0gbW;
	Sat, 11 Oct 2025 07:16:15 +0000
Received: from vs10.datenmanufaktur-hosting.net ([213.160.73.65] helo=vs81.iboxed.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Tpr-00000009tcq-16hq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 07:16:14 +0000
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59B7LqQK014093;
	Sat, 11 Oct 2025 07:21:52 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59B7LqoK014092;
	Sat, 11 Oct 2025 07:21:52 GMT
From: Alexander Kurz <akurz@blala.de>
To: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Cc: Alexander Kurz <akurz@blala.de>
Subject: [PATCH] ARM: dts: imx53: enable PMIC RTC on imx53-qsrb
Date: Sat, 11 Oct 2025 07:21:51 +0000
Message-Id: <20251011072151.14049-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_001611_586492_1BB4743A 
X-CRM114-Status: UNSURE (   8.42  )
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

The RTC inside mc34708 is supported by RTC_DRV_MC13XXX since v3.6-rc1.
Enable the PMIC RTC on the imx53-qsrb. Without a battery the RTC may be
powered via the micro-USB connector when main 5V power is not available.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
index 2f06ad61a766..6938ad6dbc2c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts
@@ -28,6 +28,7 @@ pmic: mc34708@8 {
 		reg = <0x08>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+		fsl,mc13xxx-uses-rtc;
 		regulators {
 			sw1_reg: sw1a {
 				regulator-name = "SW1";
-- 
2.39.5



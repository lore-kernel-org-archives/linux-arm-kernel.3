Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5585EC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uM1P7EYZw7wk7taKSV6yf3up95jn2KRr1wCZHKfs2Po=; b=jAze+TM7P7h2nxZpxJHFJouGOR
	mnkrudpf2IC/k622JCmnvy/e5/ziDy7oYgIQ3qeEdvBMj1ojhlFLoKZTWV4hcVlYHFTcfWMJriODw
	zcDE1sLJWkixvWIJRtnwOHEK/DPyDZxMfOOfFCTSdcIj+LcnaHdPgMv1wENsGce1U20QqH+Pnc8DV
	IHYmri2xln7b6U0AfVSzwvplo/sLoHwXUIc3AGqMfrVvl71VF0Aar+TqWpfBcuXm3L9DQbQeQT9wN
	vLXT+pdCOF0nqnEzxUelkTZ4VietBBa0Y3Tjneta5KusY3uz0OdIzcnejsarXI2NjuUID44fkgkiX
	YINJCiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fOy-00000002Tvy-0oga;
	Mon, 21 Sep 2026 14:53:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fOt-00000002Tq6-0NWS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:53:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D6F5C5CD64;
	Mon, 21 Sep 2026 14:54:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 577C25FFB2;
	Mon, 21 Sep 2026 14:53:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BB4610329080;
	Mon, 21 Sep 2026 16:53:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790002424; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uM1P7EYZw7wk7taKSV6yf3up95jn2KRr1wCZHKfs2Po=;
	b=WKa4hZyQXZNdc26cOxj+Ebb47oww8B6fJH2mbtoqlTdc+oEql2Kg/hoQQBsB+TqlMrIE48
	iDUgI6aK2o0ZQZgSDAj0mPsM3BJ4YKgNuSE6RuturxzgCOP4fnxWKd6nAdPRvuTfgRPfDh
	ziuFvgRnKjeCpVIgwCYto8NAn/KmfluWcmF6UQ0ktKz9BzH26vjs6zDDiWxmf//QG0vOfW
	OQK/7s2SfWBZLpS4aEsxkdaMex/IuX2VbB4JJwUc3fY/eWLkq0NhIHTG3CwyLtfNWxTK/2
	G0WN+YCya780gquYYqDSKo0GUoGLgum8dA+RkgWM+3QxAC6lJ1FcnahS8CmZMg==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v4 5/7] arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Mon, 21 Sep 2026 16:53:23 +0200
Message-ID: <20260921145325.300025-6-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921145325.300025-1-richard.genoud@bootlin.com>
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_075347_423467_D51CF4C9 
X-CRM114-Status: GOOD (  11.40  )
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

Declare a carveout memory region to store LPM metadata on J784S4.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
  R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

As this is used by U-Boot SPL, bootph-pre-ram is added and the device is
enabled.

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
index 81b508b9b05e..1c0c1533f0a3 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
@@ -17,6 +17,12 @@ c71_3_memory_region: memory@ab100000 {
 		reg = <0x00 0xab100000 0x00 0xf00000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@ac000000 {
+		reg = <0x00 0xac000000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster5 {
@@ -27,6 +33,15 @@ mbox_c71_3: mbox-c71-3 {
 	};
 };
 
+&mcu_r5fss0_core0 {
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
+	status = "okay";
+};
+
 &c71_3 {
 	mboxes = <&mailbox0_cluster5 &mbox_c71_3>;
 	memory-region = <&c71_3_dma_memory_region>,


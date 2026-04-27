Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE7BFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBTPwmmRps7fixb46EdJWX5fjWrgSn5Qg9Xm/D96I/c=; b=ah6lDj0GcXxBthP1ODP/tcQHZ3
	AGCH1sRFsteVwbV1ypjk0r30kEexlfMuIL53UqilRITrYxXeAfPW4Liam9jVKSoYpWM/206TvVrx6
	J2YK/OSpNGlmlI5q4zglQjIK+tv0MBssjZHtv/fUs7q7psdBga9Bf0r6odwVEz0Jp4ygEG4zmUWAj
	6FqHQfYKURW55exLkMS0Ru0mqdnwypdUFfTeNq4SxH66eVIqvDrcC8VDlMWsSZ/Rv0I+Oug0LBChy
	L6euwlYO7Lb9XyrSeIe4wuQ7OIlUaiVA4FdO8xCfNP7H0q25LolNOOIoMxm76EWNwBwxiid4F16TJ
	1wHHm+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMy5-0000000H6NL-10HE;
	Mon, 27 Apr 2026 14:29:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMy4-0000000H6N0-1zqV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 14:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uBTPwmmRps7fixb46EdJWX5fjWrgSn5Qg9Xm/D96I/c=; b=ZT7x5Hk8RUJbt6gWtxsgfg3MQr
	iAxEZ4y/XjkhqkT1N7Z9mT9fZfllpa1ku4PYUa7Ga64Ait//4F0Wu+ps+tuE3xaj+PsYAEC8ZOOrq
	vtOZ59w5GKdoxhkiiO382q/MqEMStUV+fvEpGUP40HTKyvR46AU6MDMBuJW0nxpvrqTS24HE3ilR1
	m5zxRNDMk7KRiP8hI9lHD0rCvF16aD7Q/M5oabWPgltBBdumDrgMkCzleog2nplVkR0IjJh2t60Cz
	l1anXf9L1z/T9i+5+XXScb/KF36q4yUd5XvUfh4xHZsZVsSgXi/zSEYd/BsqZ9phMEzvRPBepQ0Uf
	zBnlgwkA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMy1-00000000oUM-1rih
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:29:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 919631A344A;
	Mon, 27 Apr 2026 14:29:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63C0A600D1;
	Mon, 27 Apr 2026 14:29:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D9B91072823B;
	Mon, 27 Apr 2026 16:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777300175; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uBTPwmmRps7fixb46EdJWX5fjWrgSn5Qg9Xm/D96I/c=;
	b=2lrwh2x4A+veKBbp314CyZrZFUh7SwMrooMH9r8mdbNXJ7IetEblPJYYRjxJMMcDEx8Q5G
	Di0UR5iVf/kNA9cOjCXPWMfr6V/5gpka8ww8CaRRl/frKf7SRKbzQbdfwbunlCmIZvCkup
	EQ1N6u8dS/TzV/BYWpgwPAMpm9IrT25OOxaZHC2kQQBsnYrJkWbs9BdgkAqyCwtk288MBl
	/25Q1SNqGm7wrEzbcnT6on0MPEdKE0wAzQv8ZDVUexfoEFMk7MZJmWYu9Ss4D2kxImN/fY
	Cw7biZJiOWRk6qSG85lsxcXHpR47jErqCMilu6URegB4ah/e6I3EWD3x59IHww==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Richard Genoud (TI)" <richard.genoud@bootlin.com>
Subject: [PATCH v2 1/3] arm64: dts: ti: k3-j722s: Use ti,j7200-padconf compatible
Date: Mon, 27 Apr 2026 16:28:59 +0200
Message-ID: <20260427142901.341861-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427142901.341861-1-richard.genoud@bootlin.com>
References: <20260427142901.341861-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_152945_671456_95F43EFA 
X-CRM114-Status: UNSURE (   8.32  )
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

From: Abhash Kumar Jha <a-kumar2@ti.com>

The pinctrl contexts for j722s should be saved and restored during
suspend-to-ram, just like it is done for j7200 and j784s4 SoCs.

Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
suspend-to-ram.

Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index ddf20e44f0ea..d14caa9d8619 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -432,6 +432,10 @@ &main_bcdma_csi {
 
 /* MCU domain overrides */
 
+&mcu_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
+};
+
 &mcu_r5fss0_core0 {
 	firmware-name = "j722s-mcu-r5f0_0-fw";
 };
@@ -473,6 +477,10 @@ &inta_main_dmss {
 	ti,interrupt-ranges = <7 71 21>;
 };
 
+&main_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
+};
+
 &main_gpio0 {
 	gpio-ranges = <&main_pmx0 0 0 32>, <&main_pmx0 32 33 38>,
 			<&main_pmx0 70 72 17>;


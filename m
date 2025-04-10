Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DC0C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzFZaFbiyh0k4uhyLpPCRhWq94lofXi27Sh5rcKdyO0=; b=WvALWV2RisF9WQOG7Om9T4v/rh
	RH/YHtsdgZ6DzVi+geFfJoOWom+MefQxUSLw0R79V0gmm6cl3XW1F26cY5sckU4r8l3jE0yy+Ovi6
	8Yi2gX2ewiLWwxh4HHkB6EHNyUMRAnnqJ+HFEbwGul1wvmlRYXMJTqjTql8GB4QTOb32JUbB21Rxz
	mJyJGHenTlFx1uHF9O0N5tyxoZmF0hAxiWFu44mNKCF/frRLPtsxSP1tOOGDFYQ7EnnWR07/cIBzh
	+bN1P2lCIKyNfnthrU9wIfJVZWmKU86hwwcT8y+9pwcCj+x6KgRv3FCqAIJ3ayplD4Sfjd4HvbsPp
	shG3czOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2psy-0000000ABG4-3CAL;
	Thu, 10 Apr 2025 11:15:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2noT-00000009rLo-1eI8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Apr 2025 09:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RzFZaFbiyh0k4uhyLpPCRhWq94lofXi27Sh5rcKdyO0=; b=SH2mmOm8id04bvz7SzlllJ7XsB
	BEYxA9siKXFwoS8XNtWyhxHPKQs9xD1Mgse4uynyvPQdhl+GiWunE13Wgh6x3EPrDM6cgWyLXXeKd
	iIybfK7qR1VTbOjzhH/DT7pK7FqKc5ugxZHo6A/X02Tk9bdgIC1faMaFP7e3OEidQnRwUJst29/8U
	DZUtir4jbqIgPrOjsF37EgLLy+nysRpcogDWm846HXIUyD5iPeb0XixLz9AlW8CED9OJzmL4iGJiY
	/BtEKqyIsCTMoRuIBSxtUzr5LpOVrxn8gfFWtKtMU37kuv8YC1BMG2max5wMaruPA1SCxHktRzxWU
	av1gRpAA==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2noQ-00000008mfg-0UZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 09:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RzFZaFbiyh0k4uhyLpPCRhWq94lofXi27Sh5rcKdyO0=; b=p3NEftJY6ofRcgP0BK4zjSiEfi
	kKlyfE+COjX7oV3fCKjP9z8sC/fTRNA2+epIz8Hp+82o7y2AopPYvq2SFBsaMfFJRGTF+ykbnImta
	7GRgG09JD5nEqUPG5ceXYvivdM6/uzdZFo6VH725fdprqHNhhAGQsDPmfhwhxiOstzuUsCtBN01H8
	Wpo5Rk+FAXb1Qu+Qvoiho0MhTEvQZF4A3xN8IKZOnjrqJybMu14CNPqT7mquhQ0kfSJZCGSJ7RzlT
	p4Q00VU6awm1HA9sShLl5+7zUPAaudHzQZrcR69InjBLSKJiqJyYD1PqBMqHlnnyooKVf2PA607oZ
	VpEv0dMA==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noQ-000Djj-0d;
	Thu, 10 Apr 2025 11:03:05 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 11/13] arm64: dts: freescale: imx93-phyboard-segin: Add USB support
Date: Thu, 10 Apr 2025 11:02:49 +0200
Message-Id: <20250410090251.1103979-12-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410090251.1103979-1-primoz.fiser@norik.com>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_100306_516565_D48C9BB6 
X-CRM114-Status: UNSURE (   6.88  )
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

Add support for both USB controllers. Set first controller in OTG mode
(USB micro-AB connector X8) and the second one in host mode (USB type A
connector X7) by default. Note, the second controller is not OTG capable
due to HW design choice.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 027a34dbaf04..faad3c3e627c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -82,6 +82,19 @@ &lpuart1 {
 	status = "okay";
 };
 
+/* USB  */
+&usbotg1 {
+	disable-over-current;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	status = "okay";
+};
+
 /* SD-Card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-- 
2.34.1



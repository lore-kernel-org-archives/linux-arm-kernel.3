Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0E5C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydYFm/FUsFx5X9T7/U5z2I68LQJOkf4oPfk8ZkMTUdE=; b=gmwSyAmHXQNRmxpHDqHvvxn1JW
	uCg+fI8Cw9s2lsqI1qPNUSv3iJ5ns28Y227VXz2yJ/xN+woKRE66mtK51bU/UXvFqaXIWTLz16UAE
	I5ITOpKht7BGqllFNABkE4SD7kk6LQBkd88evXm1TabgHzu3wBGWyQdEw7ouy6Ts9jVgoL5G7Fh4a
	Mtp0g9M9Bb3+UUhIuIQTe5miYZS521kvpzkwmfTAiBsnh6bxNcYW48a0fX9xiZh16w7OygVPpStij
	unJux6gVcS0oMnGodI3QPm6ypGhxiDPZZoX1sRp4/ZRFnBZMaTtRpgkSQr5ocLwSJlZfJzw4iwRx7
	e50bHhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7C2U-00000006ztB-0ZWq;
	Tue, 22 Apr 2025 11:43:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BJL-00000006qlu-3eES
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ydYFm/FUsFx5X9T7/U5z2I68LQJOkf4oPfk8ZkMTUdE=; b=h4+gloS+5wFbuYktE9wAiLVNuJ
	ujUMonIPS0+SFkl0FRRvnXdvQJaXkiNWn242MrrFTOTmCAYEcYRXH3sowjVYAaKJ+hmeEh2AzWJgK
	S3T0w9vZ4DR3McnCIfXp0y/H4btC3ujsxY22Pxp7jWKAmvoMccD6koy8kBS39DrGtXjfIhbPhIHKf
	N/xLma4jm1B4rr1/wWh2ATziDl4rFA1ObWSOqJJrLdTA+yGM8tNNpGGS2PKPX1arZTBo6fc8NB8bF
	U6sb85JAcRuDu5aqd8nC+0Efq2m+gEsreACxacWM9TSw6iwlidDm5CCsjiVTx2Hn3WpmJWYJMs4UA
	6251C4zQ==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BJI-0000000BBNt-3yg2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 10:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ydYFm/FUsFx5X9T7/U5z2I68LQJOkf4oPfk8ZkMTUdE=; b=H0DcErfmkzi63zHbzFn7LE1CrN
	BqJzK0jntvcuh7f8NILx61Bthlyx68PiyKtSzzyB+U6nCwnlcHNPmq/hZZ2PB6tzIFQSj+SHfR4VD
	mG83HTTht7Dgrtq1t9yiaG4KoHszMQJrTTaiB1x7GsjBm49v7Iv2oV+VSTSMnHr6OZIv3vSCD2j61
	iWqjbTLqj81xMGbsQcCiyKKRR1gRZFxU/U2MgwIB6Z+p4vUNoryvyz1ZXtGRtzhFsIqlerhXdU6pG
	aDLh7y/5qDJPyh3QMYaHGoVKm4XQyDY5d9szHTDTaLEGERpdzPecYscSytrjWzWStx2aqz2k0Zj3F
	v/iZ8pnw==;
Received: from [89.212.21.243] (port=36562 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u7BJD-008kyr-0E;
	Tue, 22 Apr 2025 12:56:59 +0200
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
Subject: [PATCH v4 12/15] arm64: dts: freescale: imx93-phyboard-segin: Add USB support
Date: Tue, 22 Apr 2025 12:56:41 +0200
Message-Id: <20250422105644.2725168-13-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
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
X-CRM114-CacheID: sfid-20250422_115705_249932_6BF7A48B 
X-CRM114-Status: UNSURE (   6.98  )
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
connector X7) by default.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- no changes

 .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index be9c0a436734..e4f959f665b2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -80,6 +80,19 @@ &lpuart1 {
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



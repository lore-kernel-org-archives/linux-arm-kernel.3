Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741E0D3B7EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQU3zYencAw/qwBE7f29L0tLXXnnnc4bmngXZaP6VWs=; b=tPgypc0vb+3qUASxtilsRZmYnF
	8YB2vMQ3c//st/uhwKEjXniDkYh4J9H5FsA6Ksl+evHXFd1MJOer8ZypGKIaXXxBuNTDu7ZHZy2CV
	e5Z0zSWORPeKyhs7yLC1Qmysy6yJKLs8HgE1HUXXNCieUk8kWqyEK4b2AL6bi8rJkBXP88hbu2lFB
	tdELAOZyC8Ocm4szdIqCvECPpwUEz2rX8slbghMJPKAB6BiUOv923KROgTfFoEBf23nLoc+gvchq2
	QkXcmlThDXb0M79bMNkwgR4bCJUagqfKdwinPTo8nX1OO7n/YJ/8Vjwxhrm0jkC6wRoE98qicpMTk
	11nxFuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUS6-00000007NcD-3Vr4;
	Mon, 25 Nov 2024 08:28:14 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUIs-00000007M4r-4Apf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PQU3zYencAw/qwBE7f29L0tLXXnnnc4bmngXZaP6VWs=; b=ieq8Uimo6G1s3L8p+bcoGH4vJ1
	tnIav+L023XBLyz0CNuJYPC5qZSJfOiDLoIpXsChB0Kfie09WZpe2CgTX7GxRjNb1GFSMODosN5zc
	H1gU3X4gSWkmG0kuKdsMK4e3KzBCzSfkKMRWu2x8b55k2YJ125PRfF1CJjE1/I1fmOEA7CHwoPh5I
	d+HQBSqQtpG6xH29jUt5iQoeJlPwtOm/V27QvEddr+veNHMZso0Oy4txUjyLmsQwqPJtOmOS/uybu
	hyZLZHY8wlnPfXHPWtGcNKAWGmKum7SwojJhfj1lUQTs0dL9djBfCfZZqLaJlYS8Zyn2lEttMrBsa
	L4M/1i7Q==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIs-00Eq70-0F;
	Mon, 25 Nov 2024 09:18:41 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 08/15] arm64: dts: imx8mm-phygate-tauri-l: Set RTC as wakeup-source
Date: Mon, 25 Nov 2024 09:18:07 +0100
Message-Id: <20241125081814.397352-9-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
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
X-CRM114-CacheID: sfid-20241125_001843_184349_631C2AA8 
X-CRM114-Status: UNSURE (   5.44  )
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

RV-3028 RTC can be used to wakeup the system on phyGATE-Tauri-L-i.MX8MM,
mark the device as wakeup source.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
index c3835b2d860a..c9bf4ac254bb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
@@ -217,6 +217,7 @@ &pwm4 {
 &rv3028 {
 	aux-voltage-chargeable = <1>;
 	trickle-resistor-ohms = <3000>;
+	wakeup-source;
 };
 
 &uart1 {
-- 
2.34.1



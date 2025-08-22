Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04C1CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9n/naAKcBCNNY+t9a5vJJ7PI9f1fYi7nwTRgic5hZFg=; b=AcVvJ6ilXwzsxavF8DsPhcR93H
	G9v0v3FyLxJSdEymM4tkQ92P4clYDUWDfpf5K3wJe9s2GqpXDGNsqjNuk3Y08epkXM+Z8ITC4Sdcn
	aR6yeeIDQbbblam3sBP6FBQOCQ9Aj6IvLWPt5ryxZQv9vJvqqqsTkDqSoutBq1uwfHu4zCXvCdAd4
	NJllOoCQjg7RG1HNnvyiur/+M9jpkPe1c87iRNdZyhHEhDpNsgG+uCZ9UN/3uw9wjxf2n1PJtZwWO
	xciR+w9EPkPDwW+ntwsj6owfrlrV/xB+U2g4d8lw2Pg4kev5+8lvArsJmvlTjAaSH5p2TIrFkrSU4
	nIcgQjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqv-000000045uV-2DKW;
	Sat, 23 Aug 2025 06:35:49 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSGo-00000002h3X-3nws
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1755871050; x=1787407050;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9n/naAKcBCNNY+t9a5vJJ7PI9f1fYi7nwTRgic5hZFg=;
  b=B4NLZjtGRNfvcJEv4PCv/RDzTzESgaOy3Y2LVfRDUD/nkxVTIn0tS/A2
   wkxkRI76WVtwqKheYUxA61vTYWisrpSq87/o1vb5lG3o/UoPxrKWkgh4I
   EugUD7IPmUI6+u8Mjch6sGo2++nkrp8dovifTqlTfl2yAb8CFyypeO74g
   P8Cs1q8t24EIaSRe2ooa6WaEQu8O1rZB1v26SQmq7lNRN5/BmqRJmBKB9
   mIFcUPRu3CTM3TqwizhbWRvu67TTuESMAGQGZPPy1IohDsvufShlTx3Fl
   7dnhBOHHO43dZCoYu31hc548yW8JfFaNVolrhLLahjl/EHYqhuzxNE5IC
   A==;
X-CSE-ConnectionGUID: JKVv52hjTCGPr31HoOYi9A==
X-CSE-MsgGUID: 0Ixf0lb7QBKCT3RAt1aU2Q==
X-IronPort-AV: E=Sophos;i="6.17,309,1747692000"; 
   d="scan'208";a="45868445"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 22 Aug 2025 15:57:27 +0200
X-CheckPoint: {68A87747-0-820F521C-C7779E56}
X-MAIL-CPID: E1AE969BEAE425E55620FADF3E35DF18_4
X-Control-Analysis: str=0001.0A00210E.68A8769F.000E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79A8416462D;
	Fri, 22 Aug 2025 15:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1755871042; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=9n/naAKcBCNNY+t9a5vJJ7PI9f1fYi7nwTRgic5hZFg=;
	b=coZaT6+1llALA9Baw1AWaB0ssP8Dg1+xnD1pjqaOsGmdomdMEnc2PJGDmx8osO3fjR8/YQ
	e30NfqHz4kkrY1azSk9x0khEctHIFZT4K378dzK9HtVrFPROdqqAFyMh/8CIvBlQQQf46e
	uXD5WPawv1HMDHvUpE1aoMNIsInSaa/+cq++fk3G0nl9GKAc9kW9v14NpnGfD2Cv+HVw5V
	z2f6AJbb8OzsXa8v1D0ZslArziwum4jUmL/hznldevKy5TvEH4RU4uD/ymyGx4uAx0sNxl
	dDgrrny5Y6UPsxFXtk/jUxVaWyuA2vGlxMsItyOnycFLxp9IgrIYSZvIqzxs2g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB driver
Date: Fri, 22 Aug 2025 15:57:14 +0200
Message-ID: <20250822135715.3335023-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_065731_247147_550E3574 
X-CRM114-Status: UNSURE (   8.04  )
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

MBa91xxCA (imx93-tqma9352-mba91xxca.dts) features a USB attached WiFi
module. lsusb says:
 ID 1286:204e Marvell Semiconductor, Inc. Bluetooth and Wireless LAN Composite Device
Enable the corresponding driver.

To: Shawn Guo <shawnguo@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Improved commit message

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 603c9528c778d..4535a3e5a7560 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -441,6 +441,7 @@ CONFIG_IWLMVM=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_PCIE=m
+CONFIG_MWIFIEX_USB=m
 CONFIG_MT7921E=m
 CONFIG_RSI_91X=m
 CONFIG_WL18XX=m
-- 
2.43.0



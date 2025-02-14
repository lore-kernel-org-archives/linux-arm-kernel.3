Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E18C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OT08qM9/TVFvWHmotPYx781E7CyQKo6/LKy5mbr1cck=; b=ReYxdHV71QLbt5JXihmH3iLNwc
	KNbHWu/R2yl+RkNyVliM2OzP5BEVeqWSPN8aHCPFJAoWEP6oRkNVhrhmKPRhlH9sJ/bAdEXMm0m6p
	ctZH0iauncd6tAZ9kysgaa/YiBbyL6FIURGUG6GhvsukrFo8/yawLiZuOTIHqZhLVQBxw1/9HHKp5
	M8OFe8oTIJWdYb5zFsAEEMyPRcB8Jb8v/DabJ/NGTlOzNUZu1xvgBngv4qIneZQMOivHvJy710D3D
	W1IwtiLMLEYu2Jk2E9J8YRn/sG/Ee84tGnI64f/pOra26iGhdxP/g/tQl8s+mZu7UWtMy4K0tFzda
	EMUeJWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0pe-0000000FwlM-2cbu;
	Fri, 14 Feb 2025 18:54:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07V-0000000Fp5d-29Ef
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 18:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OT08qM9/TVFvWHmotPYx781E7CyQKo6/LKy5mbr1cck=; b=fxU1giWqy/AZFCvquVc7P/Y1vV
	sBXPMLB1j7xTkXp80ofrxZ7wUcIr4ZMSi03G8gsq3/FoSR4kHt1rwM4+NLrJ/KRy8Zgfpn+Jhu0ZF
	Fp+QSu9ZC5cZsApjSrRcqFL3d2VJVCzc5C6IrQoHGF0LdixS2HlTtkgqxXMXVvUGaWqHC4dLZMpN9
	7FON807hFnUaFDX8QCxDjhHmX7c6696KbKX7C35JRHTVKC5HkPnfyN9f2kFX1zdeI7HkgCCoO7AZj
	iKR7hSgoYQJLBsEU6Qej0asdIsj93X9LerO0PmEkEtUX3UITbI4u65P2AuGD6zHy8xH/pqMB5xlls
	dsmcUGYA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj07R-00000001J2v-3a7J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739556534; x=1771092534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RVSWb8fwoMmHWM5arqdcYZ9wwDPFb0IQdvCLd5ewN/0=;
  b=t9vtxqNeTiTWDTKXT6qES+EIrNpzUWxYzNGzVnetx9r+D7RjmiaCs/uo
   Y8u3RfcTIEdUDrbTpnwnJHQm7A1REDWHuYV8bMn/c6idMudQmqXs2/reP
   GbToxbzh5gCxuUVa+ulMKvYcB3JoeDAxwYdWMoStoA7oaljGyVcRlZyZ8
   U6nKBh78OocjL0+vGg5fwwOEsXuRnBpj/Rbn8lVZmJfDaxOlE/Qm9FYm9
   KPpnF12xZmWxGA7xGABTcAMV5r7dlxpi8ZKGF9V/PUOABnnnmiI1AKneh
   HXV+ligFhvBtsJKWisgpaTPBHRePrrKe1UvtQeBl0/lM93dUAuEUZHt/x
   g==;
X-CSE-ConnectionGUID: afEECSQvQkGMMmDvtHvTFg==
X-CSE-MsgGUID: gfHqDAcxTA+RqH/t2Tkv0g==
X-IronPort-AV: E=Sophos;i="6.13,286,1732604400"; 
   d="scan'208";a="37700933"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2025 11:08:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Feb 2025 11:08:26 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 14 Feb 2025 11:08:26 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <vkoul@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 8/8] ARM: dts: microchip: sama7d65: Enable DMAs
Date: Fri, 14 Feb 2025 11:08:21 -0700
Message-ID: <e233ab028123bd91b1de7b0f02eb966d719cc0af.1739555984.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_180854_338880_FCD525D7 
X-CRM114-Status: UNSURE (   7.63  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Enable DMA interface for sama7d65_curiosity board.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 0f86360fb733a..0c21e3ed3a95a 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -32,6 +32,18 @@ memory@60000000 {
 	};
 };
 
+&dma0 {
+	status = "okay";
+};
+
+&dma1 {
+	status = "okay";
+};
+
+&dma2 {
+	status = "okay";
+};
+
 &flx6 {
 	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
 	status = "okay";
-- 
2.43.0



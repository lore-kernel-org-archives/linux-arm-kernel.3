Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34555106FD92
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQLPlc4pX6kHCID5YuTma2cAdx/3tww8zcFpE1DYkiw=; b=cNVT0/PJSxWtyCIGgOwK47i/oS
	VpvjcA5jniB3061PezgDIHl7sONVxVqpc/i5qW13aVUM3jFBHMwVNP/ss7oZxrzwbmHkzmQcD81wa
	HbD2nUnM/oi1khjDu7yYPxJUoZq2YVEBjoPSp6NJ6q5yzKDzuD9Fw827MNCfeziF7wYSobW2Vv74O
	a4K8Ia8MXvUbyZiQ7+YQXtZnmtBDmPEMPjHAKXrYGZHuhJvXp1PHobT3evQpCR2nxourhNwX9Abrp
	tpBcuPwVIaSjSfz7RvQzfDuPXgs/ivX5VXgGqfS97H6MKxjEcwTJLzpiz23KrRK+tnnXj3ec8gjVl
	Qsw5hYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcm-0000000GyLY-3QW3;
	Fri, 13 Mar 2026 07:07:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcj-0000000GyJ0-3Ht9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 07:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aQLPlc4pX6kHCID5YuTma2cAdx/3tww8zcFpE1DYkiw=; b=IhsC1ZHurxj8UDMQQqGHBnu4PG
	lKJ+r6KLURw9uWUh82VLpxpnH80Vh7ARAgpW+OA6V6mkoP0aigAY2tIB+ZOMbGq0/A6VsMkQbOndO
	StePL5lyNBCDqK1qU7mZjKNHWIwu983IlI6pDcbi5s09Hi2NrsACHsyA6SotPRSu6dwfRcMp+vAT7
	y2msRZFt/uIRBkav/zg64EvlGY3eUMi8o/MHAY6iNie5C0qwquHbPOpvhQuRiasLg9CGjyhCbFqyE
	cB8bUDdXWAhmJD0VNyuEDby4ePNkklxIWw2ejy4CtU8kmIWM1IZ6DgDTJgKu0JTCfqf7T3tVzAnx5
	DKvKiuaQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wcg-00000002ipe-1W3h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=aQLPlc4pX6kHCID5YuTma2cAdx/3tww8zcFpE1DYkiw=; b=dlClI1awX/1/JYJFPFWQTL78P8
	CsBawg/0qbwbJ8cb4IIEkwloV94lANpjRWLUBANpg/ovIKw29n8sSfo0uqvgg1MU+JQK/EhT7MfjD
	8oGCfe8unJ4ASQJbZia3RN1RWRA0TB+afV0oDmCTld8MlemJlMtxjNSJA5rb3LMbEbg1CYBq85wS0
	2p+kjS5oO0dpDKabnCSQ6AyfKdkz42mYwNKROheDGoIlojKjDZhwZ3Totl5q7gGYkJ17SQUxVA5yT
	3wkAkrgueiJ1dv92Whifxlpyj7Fah8B7hln9kxcCv7w5x3LS3TXl03LS94vx8A9NjNIYRzUbejhNm
	fzxnb57Q==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcf-000CXL-2t;
	Fri, 13 Mar 2026 08:07:49 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wcf-000IYT-0r;
	Fri, 13 Mar 2026 08:07:49 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: imx91-tqma9131-mba91xxca: Add LVDS display overlay
Date: Fri, 13 Mar 2026 08:07:36 +0100
Message-ID: <20260313070740.585043-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_070750_644926_B45827BC 
X-CRM114-Status: UNSURE (   8.68  )
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

This adds support for Tianma TM070JVHG33 LVDS display on interface X11/X12
on MBa91xxCA.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm64/boot/dts/freescale/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 64fe9487b1003..60aafadce0725 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -418,7 +418,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
 
+imx91-tqma9131-mba91xxca-lvds-tm070jvhg33-dtbs := imx91-tqma9131-mba91xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
 imx91-tqma9131-mba91xxca-rgb-cdtech-dc44-dtbs := imx91-tqma9131-mba91xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5097F99C9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 06:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pu7HWhTqWQ7BHlILw0Z+vWuQ8U236tlaz1nProDAHKs=; b=YmuyqmlXMWUmDkiu0gKrFcPXUI
	8N6SEy107aoCBg7jvO4ijPbnnPedRHg4Wr9hAkPz6hd/8vqvubeRWiRQYCoSKWRSKGCqopzQHqUHD
	I2IexfAY4ErXjFm4H2k6skS4NHrh64eWPKNiz/IqdRUjRZGqvHKxFsJiWsMDa2oWlH94rP6zgfwEp
	EKj9LN5OLxhVHhEL/7as+GGUPQnQ2kWIzeWA1PgEt2nAgMM3Z0iV1LwtaBKtdaW0rAdKZXS5jDFnU
	PQZRBXb8tYZ1MIlQyHOA5yUpt1iznkBrOisiuHhTSaFSv6jxdzqOCs7dDI02lcUnHWq+dvQLHIg+m
	hJKEPtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhyd-00000006TpO-1fPo;
	Mon, 20 Apr 2026 06:19:23 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEhyY-00000006Tnh-3Cqi;
	Mon, 20 Apr 2026 06:19:20 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-7-16.uibk.ac.at [172.25.7.16])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63K6Ito71297669
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 20 Apr 2026 08:18:57 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63K6Ito71297669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1776665938;
	bh=pu7HWhTqWQ7BHlILw0Z+vWuQ8U236tlaz1nProDAHKs=;
	h=From:To:Cc:Subject:Date;
	b=cYvsKqJKSLTcwHL9tkPzvzh9V52iR2k44mmV8grFJL983e7DbzToqAJ2ecPio6WhG
	 8G4Zd8EQnW1nf4K0q5jQYRdBAtlN11cbSw0Ak3HxD5wgB5fCILlJwwN+uTbkF8TOPa
	 w47mSqGtZ0s7lUECXVgsfL5iveJYFOS5usPWGrwY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        funderscore@postmarketos.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        christian.koever-draxl@student.uibk.ac.at
Subject: [PATCH v2 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
Date: Mon, 20 Apr 2026 08:18:52 +0200
Message-ID: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0*
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_231919_626905_45B290F6 
X-CRM114-Status: GOOD (  10.06  )
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

From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>

Supported features:
- 1GB/2GB RAM (via U-Boot memory fixup)
- 10/100 Ethernet (Internal PHY)
- eMMC and SD card storage
- PWM-based CPU voltage regulation
- UART (Serial console)

Changes in v2:
- Split dt-bindings and dts changes into separate patches.
- Updated model string to match documented vendor prefix.
- Put vddio_sd states array in a single line.
- Added a clarifying comment for the unsupported Amlogic W150S1 Wi-Fi module.

Notes:
- The console uses uart_b at 921600 baud.
- Verified memory via /proc/device-tree; U-Boot patches the node to around 2GB.
- Tested on the 2GB RAM plus 16GB eMMC variant.

Christian Stefan Kövér-Draxl (2):
  dt-bindings: arm: amlogic: add X98Q compatible
  arm64: dts: amlogic: add support for X98Q

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 250 ++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts

-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62D9D32D9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhrF5q17iPIrKTocFx4yjtOjZq/C/a3HcB4B/nHzJ7g=; b=YrsoeYbqthNrrSeFkdUEHpVgJQ
	44Z0cwq160WLWVcL97SMR9OTnNHze6GWhrnapLltuV9nyHEnvbJskiYXQhYirmDiaja6p5/03GyxZ
	IsY1vb5P5PHcBJyE1ROQ5/V9gXdIAgK5N0d0ZvVEYpCBJ4FMEqL49lk2cjwmPqZ9gtKfGKS7eaiNx
	cdfNgx8T4qEBD40z3C20QEM/59IutBG7AhGJQCdwfcQ2iehvDHWKGUqcO9qgszpwEdSj3h5a26rKq
	Af2dZWM+QJFHVgHIOj9NAEz4b8iw0ATKPbeyA5ObECZVGQu9+EEgLrYu+wCPrxHL18XAoKvwrUJFp
	A248hKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAq1H-00000003Ofs-1Zzf;
	Tue, 12 Nov 2024 12:29:19 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApW6-00000003JPc-1WOw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:57:08 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ACBuw2P086224;
	Tue, 12 Nov 2024 05:56:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731412618;
	bh=MhrF5q17iPIrKTocFx4yjtOjZq/C/a3HcB4B/nHzJ7g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ynT2T03uOE1m02rLGHaRylAn+vw+wHcQpLQuEFfZeNR2NPdNVVTXRkIP0qPxLzAQe
	 g+q+jDDWBJEMVeQeA49h/+P0STO6IbGAc0dFKfH7hpeXROPAsyV78Lzwgu6ub/XKMC
	 /ZKcYK6KHtZst1F5uiCw2qCsnRIf6MOPInanFIYU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ACBuwOr016236
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Nov 2024 05:56:58 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Nov 2024 05:56:58 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Nov 2024 05:56:58 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ACBuo5T116685;
	Tue, 12 Nov 2024 05:56:55 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 1/2] arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros
Date: Tue, 12 Nov 2024 17:26:49 +0530
Message-ID: <20241112115650.988943-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241112115650.988943-1-s-vadapalli@ti.com>
References: <20241112115650.988943-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_035706_812020_2D978B9F 
X-CRM114-Status: GOOD (  10.05  )
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

The behavior of pins in deep sleep mode can be configured by programming
the corresponding bits in the respective Pad Configuration register. Add
macros to support this.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index 22b8d73cfd32..cac7cccc1112 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -12,6 +12,12 @@
 #define PULLTYPESEL_SHIFT	(17)
 #define RXACTIVE_SHIFT		(18)
 #define DEBOUNCE_SHIFT		(11)
+#define FORCE_DS_EN_SHIFT	(15)
+#define DS_EN_SHIFT		(24)
+#define DS_OUT_DIS_SHIFT	(25)
+#define DS_OUT_VAL_SHIFT	(26)
+#define DS_PULLUD_EN_SHIFT	(27)
+#define DS_PULLTYPE_SEL_SHIFT	(28)
 
 #define PULL_DISABLE		(1 << PULLUDEN_SHIFT)
 #define PULL_ENABLE		(0 << PULLUDEN_SHIFT)
@@ -38,6 +44,19 @@
 #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
 #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
 
+#define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
+#define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
+#define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
+#define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
+#define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
+#define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
+#define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)
+#define PIN_DS_OUT_VALUE_ONE		(1 << DS_OUT_VAL_SHIFT)
+#define PIN_DS_PULLUD_ENABLE		(0 << DS_PULLUD_EN_SHIFT)
+#define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
+#define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
+#define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
+
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
 
-- 
2.40.1



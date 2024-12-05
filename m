Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843A3E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aujwLeQT3HzYwdCgr/y0T0q1JE+aR67oIysdUNWWl/w=; b=MbWqRprUhY6E/J2SKitdkPCKUe
	N7cG5ImiQiE5b4gdedplf+wqajTlVn1ae6Nk/A0K5FcykwpyYn7HSh8Ppgsdh3jqv9EaHksCSauv/
	5OyKP32qWCqwkmH+qRG3C5WqD6ZnXk5pYGvu3I56K7UNu71IsRCLL1JEySpEDciOMsTZKZ6jIvw+h
	HOt3bCZjx6Ar771yVaJacqS+b8dlkrelx6dsG5sthSGCXWnW+RdjQgpuQpXcPZiOKClrcXSXry1CI
	OQ8tAO7NpL6T6WXWbDZjg/WIEDK5g4wOoRl9tPT2k7NA9zlzD/81AGSfajndXDvsSGiFuz4D3ajN1
	V9/4/cbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCqv-0000000GKWs-2k25;
	Thu, 05 Dec 2024 14:29:13 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAYF-0000000Fres-0UAm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:01:48 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5C1gFY2198093
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 06:01:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733400103;
	bh=aujwLeQT3HzYwdCgr/y0T0q1JE+aR67oIysdUNWWl/w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sb+0/sQBJmqWOA3hNiias5WYz3eCqUyeDk0dVWUtRzBnb/0ThBXNoXqhO67oi4qUF
	 /2xhPYYjYAT9Gz2gIj8QEMAwO/T4omipPjiIGJM9NE4agvhqA+x44TRKSkgWiNxXPk
	 16xPa/pCX3hqhctvKE4cR6IufXwIJrdkzJPj5xJ0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5C1gGd002276
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Dec 2024 06:01:42 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 06:01:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 06:01:42 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5C1Zp8018608;
	Thu, 5 Dec 2024 06:01:39 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros
Date: Thu, 5 Dec 2024 17:31:28 +0530
Message-ID: <20241205120134.754664-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205120134.754664-1-s-vadapalli@ti.com>
References: <20241205120134.754664-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_040147_242973_A3539DCA 
X-CRM114-Status: GOOD (  11.05  )
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

v1:
https://lore.kernel.org/r/20241112115650.988943-2-s-vadapalli@ti.com
Changes since v1:
- Rebased on next-20241204.

While Rob had suggested dropping the zero defines at:
https://lore.kernel.org/r/20241115154822.GA2954187-robh@kernel.org/
I had pointed out the inconsistency with existing convention at:
https://lore.kernel.org/r/5b35c736-74d6-4fe9-ae82-272dc2e98b82@ti.com/
asking for Rob's opinion. Since I didn't receive a reply, I assumed that
the patch is fine in terms of being consistent and hence haven't dropped
the zero defines in the current version.

Regards,
Siddharth.

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
2.43.0



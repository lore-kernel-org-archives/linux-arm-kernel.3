Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A80C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p59kS6BgnDtLm2RBmPDFSxO8EjcssSjUIbakAXnj8oY=; b=3D40VdIvy7QSOy
	mDKo82cu/OCZxGwhEIeoWI4cIOAC89WuLsBLFaJ8qb6WgIF7Cy2bzxIxwq1Fx8f/04nHPJ1ZdIdB8
	vjqKdVeCi6Vgbbg2mEbMQackpjGG1CpDXnp3BXIEt+wntfGJZT2zRZ8Try9RsJu6zMDNBnfHJmtDd
	J7Mm7dOf18K5BUIW54D2f3lTee1w3Js54i/OcYXnRGXcUxK9LMtGRh4lZt3pJnkDaBh/AA4uGY1eS
	UL9bWiGn+RHJpBUUGUek5kBBUfdVDsMgAgRcJ019e7r8Z8Krf6jffIKHROBCcyn7Rlucztbcloetl
	cVHZi7Ruy1yzUf/LUw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWxP-00000000aEm-423c;
	Mon, 10 Feb 2025 16:48:27 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWuO-00000000ZLs-0hCf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:45:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85B061480320;
	Mon, 10 Feb 2025 17:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p59kS6BgnDtLm2RBmPDFSxO8EjcssSjUIbakAXnj8oY=;
	b=M8zTLMLoc4D5DvNZU+oxhDSzqwcZ+Rt1xIPKEzcXnqo+rkk0uPE079v4tFKly210tV3/iD
	H33MAdHt0yc5PO9pF0N6qDHZ82Fy1EoUtc87ymhVhb4dtGmvG649uGqQW1G2e8bcOnZGhc
	a9zvbvC5/9vDCF97BkAW0vWqpKKFdd6OxcoCQkGL/Zh8nhvr47YG33SwgSJJCaK3ElsvMU
	qRljw57U1Av6tyHo2+/lHE0nFu6xUsQl8DKJ4eD8QT+gkXpd+zlAha/sHrBvDOUE1HzhkY
	T49pgK+ics1ztVZfA5AiMIosXyBk0NIkI5nv/DOE+JPuk5ce67lSpdd+ZzOyzw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC partially
Date: Mon, 10 Feb 2025 17:44:51 +0100
Message-Id: <20250210164506.495747-2-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_084520_522475_E7D8AD33 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Before adding even more new indexes creating more holes in the
clk at91 drivers pmc_data->chws arrays, split this up.

This is a partial split up only for SoCs affected by upcoming changes
and by that PMC_MAIN + x hack, others could follow by the same scheme.

Binding splitup was proposed for several reasons:

1) keep the driver code simple, readable, and efficient
2) avoid accidental array index duplication
3) avoid memory waste by creating more and more unused array members.

Old values are kept to not break dts, and to maintain dt ABI.

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 .../dt-bindings/clock/microchip,sam9x60-pmc.h | 19 +++++++++++
 .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 25 +++++++++++++++
 .../clock/microchip,sama7d65-pmc.h            | 32 +++++++++++++++++++
 .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 ++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h

diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
new file mode 100644
index 0000000000000..e01e867e8c4da
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sam9x60 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
+
+#include <dt-bindings/clock/at91.h>
+
+/* old from before bindings splitup */
+#define SAM9X60_PMC_MCK		PMC_MCK		/* 1 */
+#define SAM9X60_PMC_UTMI	PMC_UTMI	/* 2 */
+#define SAM9X60_PMC_MAIN	PMC_MAIN	/* 3 */
+
+#define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
new file mode 100644
index 0000000000000..2df1ff97a5b18
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sam9x7 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
+
+#include <dt-bindings/clock/at91.h>
+
+/* old from before bindings splitup */
+#define SAM9X7_PMC_MCK		PMC_MCK		/* 1 */
+#define SAM9X7_PMC_UTMI		PMC_UTMI	/* 2 */
+#define SAM9X7_PMC_MAIN		PMC_MAIN	/* 3 */
+
+#define SAM9X7_PMC_PLLACK	PMC_PLLACK	/* 7 */
+
+#define SAM9X7_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
+#define SAM9X7_PMC_AUDIOIOPLL	PMC_AUDIOIOPLL	/* 10 */
+
+#define SAM9X7_PMC_PLLADIV2	PMC_PLLADIV2	/* 14 */
+#define SAM9X7_PMC_LVDSPLL	PMC_LVDSPLL	/* 15 */
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
new file mode 100644
index 0000000000000..f5be643be9b36
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama7d65 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
+
+#include <dt-bindings/clock/at91.h>
+
+/* old from before bindings splitup */
+#define SAMA7D65_PMC_MCK0		PMC_MCK		/* 1 */
+#define SAMA7D65_PMC_UTMI		PMC_UTMI	/* 2 */
+#define SAMA7D65_PMC_MAIN		PMC_MAIN	/* 3 */
+#define SAMA7D65_PMC_CPUPLL		PMC_CPUPLL	/* 4 */
+#define SAMA7D65_PMC_SYSPLL		PMC_SYSPLL	/* 5 */
+
+#define SAMA7D65_PMC_BAUDPLL		PMC_BAUDPLL	/* 8 */
+#define SAMA7D65_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
+#define SAMA7D65_PMC_AUDIOIOPLL		PMC_AUDIOIOPLL	/* 10 */
+#define SAMA7D65_PMC_ETHPLL		PMC_ETHPLL	/* 11 */
+
+#define SAMA7D65_PMC_MCK1		PMC_MCK1	/* 13 */
+
+#define SAMA7D65_PMC_LVDSPLL		PMC_LVDSPLL	/* 15 */
+#define SAMA7D65_PMC_MCK3		PMC_MCK3	/* 16 */
+#define SAMA7D65_PMC_MCK5		PMC_MCK5	/* 17 */
+
+#define SAMA7D65_PMC_INDEX_MAX		25
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
new file mode 100644
index 0000000000000..ad69ccdf9dc78
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama7g5 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
+
+#include <dt-bindings/clock/at91.h>
+
+/* old from before bindings splitup */
+#define SAMA7G5_PMC_MCK0	PMC_MCK		/* 1 */
+#define SAMA7G5_PMC_UTMI	PMC_UTMI	/* 2 */
+#define SAMA7G5_PMC_MAIN	PMC_MAIN	/* 3 */
+#define SAMA7G5_PMC_CPUPLL	PMC_CPUPLL	/* 4 */
+#define SAMA7G5_PMC_SYSPLL	PMC_SYSPLL	/* 5 */
+
+#define SAMA7G5_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
+#define SAMA7G5_PMC_AUDIOIOPLL	PMC_AUDIOIOPLL	/* 10 */
+
+#define SAMA7G5_PMC_MCK1	PMC_MCK1	/* 13 */
+
+#endif
-- 
2.39.5



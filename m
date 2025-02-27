Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9235FC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dMTzqRKOVP6zI4y+SKJqu8AaktMKU/o6Ry3f8HrIys=; b=ddF4J/sPw8Vp6yJUR3ZK+O2Ta0
	jmfqb35x2RSREMaVGRx+L1Vsh8GZD0SElMhwP7cPgyMUEmocm2TbhvpqiDyGTclZ9ErYwUiuITiGM
	Jw2y62VHvZHKG3rSrQI61O9psCNw5h0MLQdlXeOUp2iBVBGP4xI79JALw0aE/ka8KQ1jpobBxwNje
	22KwGupc+t1BhVy+GziMdxDyf+7yFWRLEAgGidEq7POsLYpCb0XFejbuNoGvzEeO/6IUC2PVIxKVb
	tuokBDLn2Ii64jr2RAYYsjrA7HBi1PftBtfOm627TGBc+5kBttcRNLHXPnDHuT+69nCcGJsOOmylk
	UPNkcTqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfB9-00000007oRo-07T5;
	Thu, 27 Feb 2025 14:47:59 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnerl-00000007jJR-18dv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:27:58 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id F3C6EA0D06;
	Thu, 27 Feb 2025 15:27:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=2dMTzqRKOVP6zI4y+SKJ
	qu8AaktMKU/o6Ry3f8HrIys=; b=iIK4vdNzwirARn9ePnH7YdLz9jSue29GshN8
	PMBb+u8yV+/qrMmGUVni7WrsTDhIxQeNil2CdqKK3a0izxDYq0S96UnzGGuOG2X5
	6v8qyLCpiHJfJdU0Ao1eL/DJLWojsA/nA16+mxTdbpFxT/70JWvF0bfQow1HO5xu
	nN5SdtAhb+Y1YYzhs7P+ANn/I/LvmP+mRCEBrfXSZiOb8TNv+2lsFayEtVpaf64y
	95ps7r53PDjpLjmqRRQrvQkVRVmrNiXbvCoHLryAKMMhi0bhd+IlmphxGRqy+XWt
	57YnUW2fBu1XXJF0cLmwVK1wXiaD5oHTeTm9n5Q6fo2sJ12I6nEDTlABhXcGB7aI
	EsaeoxsFfSPLs5cGxOKSvGUY07soWy4vBDcRvLbYF2uydIX76/i0Et+6bYZdDexe
	hXDru6upmu5L6I1ZNeynDsu8rees5A/uWkoTatceSqkAhdV8ser27IR4a4oc2eXs
	96tDLiUUSrF18+jJSgyxtcfix4NcUiGfTzi37uE4MIpWB2pzq1HX+zRBVMEUecS/
	LWzMPJzxobzmYzhbD93nxPDRSkv0GKTWKF1LacWxfDMUqwijNpsCLZ2atPi4kaee
	hP8jsRjrVI61YmK/lomaqrERYWFy9hHhPiUHQ3hcjpPXegA09WKY0hfvqeq5xDhw
	JJKDer4=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-iio@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Kamel
 Bouhara" <kamel.bouhara@bootlin.com>
Subject: [PATCH v5 1/3] include: uapi: counter: Add microchip-tcb-capture.h
Date: Thu, 27 Feb 2025 15:27:46 +0100
Message-ID: <20250227142751.61496-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142751.61496-1-csokas.bence@prolan.hu>
References: <20250227142751.61496-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1740666475;VERSION=7985;MC=289978743;ID=1450426;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852637760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062757_464556_CA3F5FAF 
X-CRM114-Status: GOOD (  14.16  )
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

Add UAPI header for the microchip-tcb-capture.c driver.
This header will hold the various event channels, component numbers etc.
used by this driver.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---

Notes:
    New in v5

 MAINTAINERS                                   |  1 +
 .../linux/counter/microchip-tcb-capture.h     | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 include/uapi/linux/counter/microchip-tcb-capture.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e047e20fbd8..d1d264210690 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15579,6 +15579,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	drivers/counter/microchip-tcb-capture.c
+F:	include/uapi/linux/counter/microchip-tcb-capture.h
 
 MICROCHIP USB251XB DRIVER
 M:	Richard Leitner <richard.leitner@skidata.com>
diff --git a/include/uapi/linux/counter/microchip-tcb-capture.h b/include/uapi/linux/counter/microchip-tcb-capture.h
new file mode 100644
index 000000000000..7bda5fdef19b
--- /dev/null
+++ b/include/uapi/linux/counter/microchip-tcb-capture.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Channel numbers used by the microchip-tcb-capture driver
+ * Copyright (C) 2025 Bence Csókás
+ */
+#ifndef _UAPI_COUNTER_MCHP_TCB_H_
+#define _UAPI_COUNTER_MCHP_TCB_H_
+
+/*
+ * The driver defines the following components:
+ *
+ * Count 0
+ * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
+ * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
+ */
+
+enum counter_mchp_signals {
+	COUNTER_MCHP_SIG_TIOA,
+	COUNTER_MCHP_SIG_TIOB,
+};
+
+#endif /* _UAPI_COUNTER_MCHP_TCB_H_ */
-- 
2.48.1




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9618DCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Buc6rlApwruj6W3+FP82DHK9JKaKV424nIqt395WFlg=; b=bip7BWkhPHRD/As30wwNZZn4CG
	+oo3/GuLnCgiora+278j3v0izohNQGUTTA2g7+XBj7omrCs63NKaR/wiY5IyUW5nFH2c4mWLoWXc1
	wXo3rbf347vBHz3insjgHmQqxX0pLXSs6q3+IXD7rFnx8xfn2iyP2tMe78OJidRaREhEZmxsY8gSC
	be2Q5Fl8Xxfdfqiw8hmBI1uuIfWrYlVLzebjWxhav8RqIGx6n6z6sfOopkuv5VOMrcMUFZTRhNxkI
	H8J6Ck8zrvlD+kGQtzSTcMUUKqARUZ9gGwrz1f7RGS/aM56brBo7pI77Uc73wptTTgB1NGhDuZ4p+
	qjKCqLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYoV-0000000HEhW-09c6;
	Thu, 14 Aug 2025 14:20:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYIP-0000000H65T-1bWx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 13:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Buc6rlApwruj6W3+FP82DHK9JKaKV424nIqt395WFlg=; b=ebXXq1UuCHswWasOIq9/5gAtsY
	EjRVRipm5OV86ythmZgDKxKNGxTrIWiMYI2ngJk7Zi09BxSWTyFw3APQFLY+K2I0r3ZlEXVtGZAsJ
	j/S8/J9GWpzRjf2r5U85d4aAsdJHfi2IkQrtUxGaL+5XijD6OFQKixl7bJOkVlVomcu931PBHK4jp
	5X4Ce10oEuNeuQtdS10x50Q7HxEEQ0MD4DrVL3NVFIwBdB9G7SApsvncAE5J797zvlP3ZaHunJT1F
	PodGGNrG6z2KsW35R4UppY6OsNXAlP7qUYPPwlh2OCOo4SHMFB3iMkOv+4QgcMBdqTkMqRBEo9xgM
	00LLDTQA==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYIL-0000000GPrF-1Dcr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:47:08 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EDkxNH1890365;
	Thu, 14 Aug 2025 08:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755179219;
	bh=Buc6rlApwruj6W3+FP82DHK9JKaKV424nIqt395WFlg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GRrSuZoyPxUHlArfe315Sv7y9Eiaxu6ls+ojy685CtQlto67aV3i305taeuHsrGyU
	 g/9DGk8UglFAyPmIjWILTl4My4rd88zFJ9Cf9Axgq5OeQ6zKu2xT2vx357nGDTviDC
	 MvKp+WlUEmvJ16HMtOYAqFUuKPRgfXFWG+xedzLk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EDkxaU1872418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 08:46:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 08:46:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 08:46:58 -0500
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EDkvNN3995964;
	Thu, 14 Aug 2025 08:46:58 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: Anshul Dalal <anshuld@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/4] arm64: dts: ti: Introduce base support for AM6254atl SiP
Date: Thu, 14 Aug 2025 19:15:29 +0530
Message-ID: <20250814134531.2743874-4-anshuld@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814134531.2743874-1-anshuld@ti.com>
References: <20250814134531.2743874-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_144705_584720_0032ADD2 
X-CRM114-Status: GOOD (  13.43  )
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

This patch adds the top level dtsi for AM6254atl SiP which integrates
the existing AM625 SoC with 512MiB of DDR in a single package.

More information about the package can be found here:
https://www.ti.com/lit/ds/symlink/am625sip.pdf

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am6254atl.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6254atl.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am6254atl.dtsi b/arch/arm64/boot/dts/ti/k3-am6254atl.dtsi
new file mode 100644
index 000000000000..976ad7dc1e71
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am6254atl.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DTS for AM625 SiP SoC family in Quad core configuration and 512MiB RAM.
+ *
+ * Webpage: https://www.ti.com/product/AM625SIP
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+#include "k3-am625.dtsi"
+
+/ {
+	model = "Texas Instruments AM6254atl SiP";
+	compatible = "ti,am6254atl", "ti,am625";
+
+	memory@80000000 {
+		/* 512MiB of integrated RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x20000000>;
+		device_type = "memory";
+		bootph-all;
+	};
+
+};
-- 
2.50.1



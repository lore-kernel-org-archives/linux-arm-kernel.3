Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629AED74941
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58/Yp9z5BeuiNsOYUdEfHyKptWKflHI/Ww9dE/OYykM=; b=OjA/pdiBxaUOf5PHVkWF/iAa4N
	CSl+w3DyIu+q6X0X/XVoPwDvu84u4JpFxEtGP9u6cvndhLx1hM1mcu4f70KU+htCF67gEgJSNu/S8
	Uwz/Pz5+24oSktnA7ZV1nx3AatHCYuJCtLvdQaC+ouh13dBV6bvw+cs7tg4pg2rOcUGrgHgSlOFOl
	XJ7oqTwjzGaKY7O4QiamkJyeLprzD2oruYdrXs70QE9WUbt3nwtxmtoL4hdoJzWfEaZvhsM0KdYDk
	yloKtsYapImBh3CENOhfEvEZs7JEhCtj1nhVcs5FPq3IbY3puMJWqxocnC9Fkd0eZgaZMsOvjsxwX
	opBtsDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tOH-0000000FuY9-31yf;
	Tue, 29 Oct 2024 21:04:37 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slV-0000000FlMw-20r7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d432f9f5aso549081f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233472; x=1730838272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58/Yp9z5BeuiNsOYUdEfHyKptWKflHI/Ww9dE/OYykM=;
        b=fM6cW2vqVfUNtL3k4+dNXydsZMULMJtGD3ZsI3GHp7ejaONFBPVInL9ysJKdSRUQRr
         ajgZf3Mw4X7bF6mFmKNnvG5tVAsEHARcBTvRC9orjCXNCdLY2p7Kwla7Z6/uHtmWKdFx
         InFbY6ZqL29j3JQ43GRxPhsC7L8WW/lP8uyAoOrJPTmcuJ1EeDODK2a+AB67aMt3uTrL
         V19s2TH4MVozF15StOyxZ/zFcA6fhfgWMmod33FkOziPe7C4jcITtpdQ4Ck0P5BpQfRS
         jn5Rz8ft3uJI5Cr75WkGnwsONUYW/tFiUebg1mUky1Ax1vF5Sq8zqySvMQP+dLOxjHaA
         QevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233472; x=1730838272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58/Yp9z5BeuiNsOYUdEfHyKptWKflHI/Ww9dE/OYykM=;
        b=N8Mppt9XBT4zuiEGDKE9rA+D4Ciu/vS++tbjd95ZJStoZ1e40avR9tA6eonE8HhEz7
         xhFyzyYE7zY6GqHmdTpe/YYHrScdsahyV6bpIf/xGtjSjtj96AcFoi/22CiQBh9u0wnB
         m4SMJcyT+m4u8ZbauJqlGRbSEyiElgsD4EJ8KFlvKX4HBg8E/8Kgy31qS8RWBLtoYfag
         /roawE7b3sSkSpa5vv+KLKzxtkT7tY1bmTfGMAXS43sXtEMvNPU0ARrGDEWG4PJcyyfg
         fpw72pRlMp73tEBz6WjDbBkFRE9VNUA39aNJ+vbsjKLTKU8WZWmVdtWfENBXKMLUbGY5
         M+Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXCjqNab/riFDkoUmY/ChLXvZxqW3spkNMXwzuBVZzviIt5laf5SDQUwaJdMYms20KLZsrK51O3sBB/1cQuAEi6@lists.infradead.org
X-Gm-Message-State: AOJu0YzYCvKCWupeo0cCrS6pf6LKeVUrQx3ckk2RY1OZUIT9GFfvRJVJ
	PmUc8y7UFMoP0gJp5j3bVx4GGBTBun6QCEoyCXe9UomR7ZaAPnfV
X-Google-Smtp-Source: AGHT+IHUTIPntp80wlmsDSZsxnN4LdgLxCxHE5azOHJ+sZci6nyjaVWgArufst7Usgp1AAGI9yIUwA==
X-Received: by 2002:a05:6000:186b:b0:378:955f:d244 with SMTP id ffacd0b85a97d-380612bdf5dmr4233334f8f.14.1730233471868;
        Tue, 29 Oct 2024 13:24:31 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:31 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 23/23] ARM: dts: socfpga: add Enclustra SoM dts files
Date: Tue, 29 Oct 2024 20:23:49 +0000
Message-Id: <20241029202349.69442-24-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132433_738380_F5163063 
X-CRM114-Status: GOOD (  14.55  )
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

Add the approach to set up a combination of Enclustra's SoM on a carrier
board and corresponding boot-mode as single device-tree target.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/Makefile      | 24 +++++++++++++++++++
 .../socfpga_arria10_mercury_aa1_pe1_emmc.dts  | 16 +++++++++++++
 .../socfpga_arria10_mercury_aa1_pe1_qspi.dts  | 16 +++++++++++++
 .../socfpga_arria10_mercury_aa1_pe1_sdmmc.dts | 16 +++++++++++++
 .../socfpga_arria10_mercury_aa1_pe3_emmc.dts  | 16 +++++++++++++
 .../socfpga_arria10_mercury_aa1_pe3_qspi.dts  | 16 +++++++++++++
 .../socfpga_arria10_mercury_aa1_pe3_sdmmc.dts | 16 +++++++++++++
 .../socfpga_arria10_mercury_aa1_st1_emmc.dts  | 16 +++++++++++++
 .../socfpga_arria10_mercury_aa1_st1_qspi.dts  | 16 +++++++++++++
 .../socfpga_arria10_mercury_aa1_st1_sdmmc.dts | 16 +++++++++++++
 .../socfpga_cyclone5_mercury_sa1_pe1_emmc.dts | 16 +++++++++++++
 .../socfpga_cyclone5_mercury_sa1_pe1_qspi.dts | 16 +++++++++++++
 ...socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts | 16 +++++++++++++
 .../socfpga_cyclone5_mercury_sa1_pe3_emmc.dts | 16 +++++++++++++
 .../socfpga_cyclone5_mercury_sa1_pe3_qspi.dts | 16 +++++++++++++
 ...socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts | 16 +++++++++++++
 .../socfpga_cyclone5_mercury_sa1_st1_emmc.dts | 16 +++++++++++++
 .../socfpga_cyclone5_mercury_sa1_st1_qspi.dts | 16 +++++++++++++
 ...socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts | 16 +++++++++++++
 .../socfpga_cyclone5_mercury_sa2_pe1_qspi.dts | 16 +++++++++++++
 ...socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts | 16 +++++++++++++
 .../socfpga_cyclone5_mercury_sa2_pe3_qspi.dts | 16 +++++++++++++
 ...socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts | 16 +++++++++++++
 .../socfpga_cyclone5_mercury_sa2_st1_qspi.dts | 16 +++++++++++++
 ...socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts | 16 +++++++++++++
 25 files changed, 408 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts

diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
index d95862e34..861880560 100644
--- a/arch/arm/boot/dts/intel/socfpga/Makefile
+++ b/arch/arm/boot/dts/intel/socfpga/Makefile
@@ -2,6 +2,30 @@
 dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
 	socfpga_arria10_chameleonv3.dtb \
+	socfpga_arria10_mercury_aa1_pe1_emmc.dtb \
+	socfpga_arria10_mercury_aa1_pe1_qspi.dtb \
+	socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb \
+	socfpga_arria10_mercury_aa1_pe3_emmc.dtb \
+	socfpga_arria10_mercury_aa1_pe3_qspi.dtb \
+	socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb \
+	socfpga_arria10_mercury_aa1_st1_emmc.dtb \
+	socfpga_arria10_mercury_aa1_st1_qspi.dtb \
+	socfpga_arria10_mercury_aa1_st1_sdmmc.dtb \
+	socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb \
+	socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb \
+	socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb \
+	socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb \
+	socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb \
+	socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb \
+	socfpga_cyclone5_mercury_sa1_st1_emmc.dtb \
+	socfpga_cyclone5_mercury_sa1_st1_qspi.dtb \
+	socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb \
+	socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb \
+	socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb \
+	socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb \
+	socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb \
+	socfpga_cyclone5_mercury_sa2_st1_qspi.dtb \
+	socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dts
new file mode 100644
index 000000000..b6cca0b5f
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_arria10_mercury_aa1.dtsi"
+#include "socfpga_enclustra_mercury_pe1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_emmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ PE1 Base Board";
+	compatible = "enclustra,mercury-sa1-pe1", "enclustra,mercury-sa1",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dts
new file mode 100644
index 000000000..6ad023477
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_arria10_mercury_aa1.dtsi"
+#include "socfpga_enclustra_mercury_pe1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_qspi.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ AA1 on Mercury+ PE1 Base Board";
+	compatible = "enclustra,mercury-aa1-pe1", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dts
new file mode 100644
index 000000000..653c9a865
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_arria10_mercury_aa1.dtsi"
+#include "socfpga_enclustra_mercury_pe1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_sdmmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ AA1 on Mercury+ PE1 Base Board";
+	compatible = "enclustra,mercury-aa1-pe1", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dts
new file mode 100644
index 000000000..ae9c7c6a2
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_arria10_mercury_aa1.dtsi"
+#include "socfpga_enclustra_mercury_pe3.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_emmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ AA1 on Mercury+ PE3 Base Board";
+	compatible = "enclustra,mercury-aa1-pe3", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dts
new file mode 100644
index 000000000..c3a0c30a0
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_arria10_mercury_aa1.dtsi"
+#include "socfpga_enclustra_mercury_pe3.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_qspi.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ AA1 on Mercury+ PE3 Base Board";
+	compatible = "enclustra,mercury-aa1-pe3", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dts
new file mode 100644
index 000000000..dc1e1ad20
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_arria10_mercury_aa1.dtsi"
+#include "socfpga_enclustra_mercury_pe3.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_sdmmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ AA1 on Mercury+ PE3 Base Board";
+	compatible = "enclustra,mercury-aa1-pe3", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dts
new file mode 100644
index 000000000..61d5e4c85
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_arria10_mercury_aa1.dtsi"
+#include "socfpga_enclustra_mercury_st1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_emmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ AA1 on Mercury+ ST1 Base Board";
+	compatible = "enclustra,mercury-aa1-st1", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dts
new file mode 100644
index 000000000..a3b99c9b1
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_arria10_mercury_aa1.dtsi"
+#include "socfpga_enclustra_mercury_st1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_qspi.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ AA1 on Mercury+ ST1 Base Board";
+	compatible = "enclustra,mercury-aa1-st1", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dts
new file mode 100644
index 000000000..5deb289e2
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_arria10_mercury_aa1.dtsi"
+#include "socfpga_enclustra_mercury_st1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_sdmmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ AA1 on Mercury+ ST1 Base Board";
+	compatible = "enclustra,mercury-aa1-st1", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dts
new file mode 100644
index 000000000..85d6146da
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa1.dtsi"
+#include "socfpga_enclustra_mercury_pe1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_emmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ PE1 Base Board";
+	compatible = "enclustra,mercury-sa1-pe1", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dts
new file mode 100644
index 000000000..770ab680a
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa1.dtsi"
+#include "socfpga_enclustra_mercury_pe1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_qspi.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ PE1 Base Board";
+	compatible = "enclustra,mercury-sa1-pe1", "enclustra,mercury-sa1",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts
new file mode 100644
index 000000000..990ca0fec
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa1.dtsi"
+#include "socfpga_enclustra_mercury_pe1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_sdmmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ PE1 Base Board";
+	compatible = "enclustra,mercury-sa1-pe1", "enclustra,mercury-sa1",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dts
new file mode 100644
index 000000000..6c8fd5b0d
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa1.dtsi"
+#include "socfpga_enclustra_mercury_pe3.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_emmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ PE3 Base Board";
+	compatible = "enclustra,mercury-sa1-pe3", "enclustra,mercury-sa1",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dts
new file mode 100644
index 000000000..329242607
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa1.dtsi"
+#include "socfpga_enclustra_mercury_pe3.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_qspi.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ PE3 Base Board";
+	compatible = "enclustra,mercury-sa1-pe3", "enclustra,mercury-sa1",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts
new file mode 100644
index 000000000..1eb10b524
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa1.dtsi"
+#include "socfpga_enclustra_mercury_pe3.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_sdmmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ PE3 Base Board";
+	compatible = "enclustra,mercury-sa1-pe3", "enclustra,mercury-sa1",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dts
new file mode 100644
index 000000000..8c97b5b3a
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa1.dtsi"
+#include "socfpga_enclustra_mercury_st1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_emmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ ST1 Base Board";
+	compatible = "enclustra,mercury-sa1-st1", "enclustra,mercury-sa1",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dts
new file mode 100644
index 000000000..e6d14b22e
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa1.dtsi"
+#include "socfpga_enclustra_mercury_st1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_qspi.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ ST1 Base Board";
+	compatible = "enclustra,mercury-sa1-st1", "enclustra,mercury-sa1",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts
new file mode 100644
index 000000000..beaeca94d
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa1.dtsi"
+#include "socfpga_enclustra_mercury_st1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_sdmmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury SA1 on Mercury+ ST1 Base Board";
+	compatible = "enclustra,mercury-sa1-st1", "enclustra,mercury-sa1",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dts
new file mode 100644
index 000000000..6f79d9ed1
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa2.dtsi"
+#include "socfpga_enclustra_mercury_pe1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_qspi.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ SA2 on Mercury+ PE1 Base Board";
+	compatible = "enclustra,mercury-sa2-pe1", "enclustra,mercury-sa2",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts
new file mode 100644
index 000000000..b94bd8baf
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa2.dtsi"
+#include "socfpga_enclustra_mercury_pe1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_sdmmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ SA2 on Mercury+ PE1 Base Board";
+	compatible = "enclustra,mercury-sa2-pe1", "enclustra,mercury-sa2",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dts
new file mode 100644
index 000000000..51fc4a229
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa2.dtsi"
+#include "socfpga_enclustra_mercury_pe3.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_qspi.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ SA2 on Mercury+ PE3 Base Board";
+	compatible = "enclustra,mercury-sa2-pe3", "enclustra,mercury-sa2",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts
new file mode 100644
index 000000000..e4209209f
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa2.dtsi"
+#include "socfpga_enclustra_mercury_pe3.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_sdmmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ SA2 on Mercury+ PE3 Base Board";
+	compatible = "enclustra,mercury-sa2-pe3", "enclustra,mercury-sa2",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dts
new file mode 100644
index 000000000..ab4549a0d
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa2.dtsi"
+#include "socfpga_enclustra_mercury_st1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_qspi.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ SA2 on Mercury+ ST1 Base Board";
+	compatible = "enclustra,mercury-sa2-st1", "enclustra,mercury-sa2",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts
new file mode 100644
index 000000000..ebe62879c
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+/dts-v1/;
+
+#include "socfpga_cyclone5_mercury_sa2.dtsi"
+#include "socfpga_enclustra_mercury_st1.dtsi"
+#include "socfpga_enclustra_mercury_bootmode_sdmmc.dtsi"
+
+/ {
+	model = "Enclustra Mercury+ SA2 on Mercury+ ST1 Base Board";
+	compatible = "enclustra,mercury-sa2-st1", "enclustra,mercury-sa2",
+		     "altr,socfpga-cyclone5", "altr,socfpga";
+};
-- 
2.25.1



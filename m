Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B95D3A69F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rx0eMLUEzhYETTDB2Dx4nHIilzNRVf/VQgEFIdoul78=; b=Z2BNHSYVO6zs9e6K+w+iEZR535
	J/yUg/du9wq/cA0qU6ZHQ49IJsmdMEYR2IpInGpi94VPqDw8iaNFItf4GL+BCVOaX2EM9MEIZpI07
	mhGxr3Xa7d/E8NeSUX+ElXJTCYkdw6vVcX/NSM7vSiFn2YEXEb4eYLjmnLOv0p1LxBMrugBWzFz8w
	fPHmg1x0S7MIkwi02zyu2vaT+8Sy4DRxtrm7ZONAvKVciMNvsbQAtijkRwu+FZ+jDIDFOP7AjBDBJ
	R1LOf9p4gH2c/13lxsnR71sStmisPPZwn8u0pch0oVeaeM/xYBQkuIknmf/eOUuRBLwVLUExMgQqz
	QfjyE2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5t8F-0000000Fs5I-0e1Q;
	Tue, 29 Oct 2024 20:48:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slF-0000000FlDU-0dbf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d6716e200so888396f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233455; x=1730838255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx0eMLUEzhYETTDB2Dx4nHIilzNRVf/VQgEFIdoul78=;
        b=aZIe2bkFhQV0b5Lrnk13qzSRwAcIXbXn07aoClKbGJzPGND/oYETtpKrYDeRC48LAO
         NuRoB0FK4dQNXJTfkf0n/YWp/gUZGZx2P5Utn2b+cY+6WDhxox6fKoCbXFOeOaaWzGgS
         wifYGOre+r2yteFsi+Qhf1lPkVHzFq3SbpOgz0qg2icHczjtxhGC/rCBXAEJ2Fu/MApD
         EKYImAgv0PgIXRMt8m/JlG0fxEeVAtExG78DADXATn2Xb09AVTH1tDBhiKlPAFxMecJ3
         Z5O8qsXXNd5rZ2P85acpYnhKM9WggmRUJj5BPdVJp+mjge3pibPBQ22rCqnXrQ0+jX0R
         Z5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233455; x=1730838255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx0eMLUEzhYETTDB2Dx4nHIilzNRVf/VQgEFIdoul78=;
        b=NItYvW4P5kLbDNA33pOPVEMtOSBfMbqzdupyA1x2zNuIxXRzbPHQ4u9y7FVYLGbjZM
         Gvm3kAk6Km3Qu1xNj2YIfrgT5Ix6lv4ZxzjVSPny8+uiQPb54QXBHNhSeA1qEL+FAq+S
         ohHsUQoClWqVEBNWiBBRq2lvXET6sPpfj5uWk4YxTuzNMvxBXSkO6tUyJajilM33ORiX
         gUMu0NCYtxTa+wHfC+Nh9155NHwPf8qSTftIVB15GMQFPCCmn8zafhGkg806vmFj9meA
         /yO0Igf9If+fqTdGg5naKuDLk34d8xdHOsz9PzPGDBerUK3W4fwddPbRq8Z1m0CK6+xk
         SQuA==
X-Forwarded-Encrypted: i=1; AJvYcCVw8s5kLZKeBdTMmSBcID+6h+PIRdpc5zFZcGu0piMfZ8bnka4vI3dD3baO4o5Nakdgqo0Jf7UWJxAGvuqEBpJ3@lists.infradead.org
X-Gm-Message-State: AOJu0YwMjOIjAkcLpGmykcrdcbuTmgLDiOQPrMh33Gi/0+rO+AYJda/N
	K6/9b6mXqDoldD7EJhvs1s+wU6+APBwfMkGKRP5tpnZJCk7DYSA6
X-Google-Smtp-Source: AGHT+IEnuFjr/Zc4f6jXZAW8xbcExw/fgwTtYOC4EmQWOqcT/pxDPVKNa5Oe0HscWQqMZwS60H9tkw==
X-Received: by 2002:a5d:47c2:0:b0:374:ca43:ac00 with SMTP id ffacd0b85a97d-38061126ae4mr3904749f8f.4.1730233454663;
        Tue, 29 Oct 2024 13:24:14 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:14 -0700 (PDT)
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
Subject: [PATCH v4 13/23] ARM: dts: socfpga: add Enclustra boot-mode dtsi
Date: Tue, 29 Oct 2024 20:23:39 +0000
Message-Id: <20241029202349.69442-14-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132417_239359_90ACBC45 
X-CRM114-Status: GOOD (  16.44  )
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

Add generic boot-mode support to Enclustra Arria10 and Cyclone5 boards.
Some Enclustra carrier boards need hardware adjustments specific to the
selected boot-mode.

Enclustra's Arria10 SoMs allow for booting from different media. By
muxing certain IO pins, the media can be selected. This muxing can be
done by gpios at runtime e.g. when flashing QSPI from off the
bootloader. But also to have statically certain boot media available,
certain adjustments to the DT are needed:
- SD: QSPI must be disabled
- eMMC: QSPI must be disabled, bus width can be doubled to 8 byte
- QSPI: any mmc is disabled, QSPI then defaults to be enabled

The boot media must be accessible to the bootloader, e.g. to load a
bitstream file, but also to the system to mount the rootfs and to use
the specific performance.

Signed-off-by: Andreas Buerkler <andreas.buerkler@enclustra.com>
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 .../socfpga_enclustra_mercury_bootmode_emmc.dtsi     | 12 ++++++++++++
 .../socfpga_enclustra_mercury_bootmode_qspi.dtsi     |  8 ++++++++
 .../socfpga_enclustra_mercury_bootmode_sdmmc.dtsi    |  8 ++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_emmc.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_qspi.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_sdmmc.dtsi

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_emmc.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_emmc.dtsi
new file mode 100644
index 000000000..d79cb64da
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_emmc.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+&qspi {
+	status = "disabled";
+};
+
+&mmc {
+	bus-width = <8>;
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_qspi.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_qspi.dtsi
new file mode 100644
index 000000000..5ba21dd8f
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_qspi.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+&mmc {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_sdmmc.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_sdmmc.dtsi
new file mode 100644
index 000000000..2b102e0b6
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_sdmmc.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Enclustra GmbH - https://www.enclustra.com
+ */
+
+&qspi {
+	status = "disabled";
+};
-- 
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF75C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rbQVOsnj8MtiW9Jyx4x7uRijCuPdjPgMW3Or5zSI/4=; b=KoSx+7gll/RV/XvOa8C+Z6M4BE
	2JeOnvzLrjKppax1DPr1ZSnuQFGqMpKxCviHUoK8puxMRbt1mFsQ5ZOHVlLlRUqCMCia5UN7BCq29
	8FPFoJYFAJmAlMRp20BubuO5xgrXUbxM2hH0Xr/k0thX7ugFBMuWRUFPkEflog7U/0DUrMZTerOQ8
	sBF/cV+17E8zSYn5aizroUa9SaSj1aRlFrJ4NXO+A2MzVaWBjqpMSD17+6YzgqOT/tUNEXbBBQ+1w
	iS7Ix9Q4UBYmLuopyA6+Z9SO2gGCE08cxUZ1KulmafQdDRSiDz60fFmDT66ok4J75RGZgjWAWITKS
	NcR5bWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugH6y-0000000Dk7A-2RCf;
	Mon, 28 Jul 2025 06:13:24 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGqd-0000000DhMH-2xFH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 05:56:32 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b31d489a76dso4076082a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 22:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682191; x=1754286991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rbQVOsnj8MtiW9Jyx4x7uRijCuPdjPgMW3Or5zSI/4=;
        b=FJHQ0wdvO7hTO6Cc91QJ/+R2hgAgJbXD5T9nRI87LsCV3Sc9t0C1J9Nh9HEbcP3pMZ
         DuF8MUkGUJ3orOft1bS9bJQ3j/BnPcThLdU6DLdUqdw/c18OIVr4Ir3mIVuiHlK16W+4
         hq6PG3hUghCGC8jw9rk9U9Uc+UXMtgcf1Qd34GFCrquPEE0uoroPiH7d73KqZ6RDbace
         9RCmI7Pvj7C7btRpusHp54DjJP7LYL3SZe2lkNED77MOowTCBMhzsEf8RiN4uuP2Vd9r
         EfpM9uGQhGKjfFep/rokBOPb2Ujbk/1bXChzJiokJOTcymvwZ5rgmAkY+zEx4YHaS1Sp
         WXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682191; x=1754286991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rbQVOsnj8MtiW9Jyx4x7uRijCuPdjPgMW3Or5zSI/4=;
        b=sMMCLioWmO5PasV6RQBVkJd4W4+S3ErWSoa3AaHbL0wk+ktA7Wa5g4O9/moeFQq8Cx
         NgPgzlMQpdgEUETUd82eHIgmqnGK9D/OsUcOm6Jz0o58DJCqklOTh4bCoHJ4TW8Ma2rI
         PZz3VhENHlw4DKrxBQuqTAj5PZAkr9vJVnWD8wpOBbYenr2tfbe2bgEdpnNAbHhjw6DL
         0NQON4+n6LfGnq16FzgMO8QGRMUeCVR99Z0W+4SAbAayg43vHVwA5hn6uQVwYa1tNnsK
         qO/Gyrw9rAcAGZaVaUASpYrL5sdio3dRO0ROD295V9TWI28CYT4BewasW1Bw3YGyJlBr
         78NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhGyx3yKVgvMZDipVa1otFrZzxa4q44eQQV+F+Q2Ju+MMdk7xiBqgB5c3SFj72sr0HCAsRkoc3vj/k6Yminn7A@lists.infradead.org
X-Gm-Message-State: AOJu0YzWd8IVksaJqlkk9465RD7Mp5LV5gVmhGovehp+ytdfM0uWTzDn
	sM36Y/8cR0DuNRZ3av9++gG/78FSXuD8VGhepBlckYeDbi2fVXtz0gZn
X-Gm-Gg: ASbGncvebz2HZ4wWAN2yo5oDtNmpMEFG0l9grZRO1pOnIkir6LO8Qi+xqATnFtuGBgI
	4+0e0lDmhfYWhP3kUUP5o/67c5kpvglDgkEsBoXJJ1SE6IFxa/gQPqYOiyU+VWQ68uH8LieIm2H
	VgwHJ8EBYVPJdgagebNEIg440Ly7khPXPO2qjml5Dj+M3/pLvxCcI35Qv2lhiNIPjWzVjuIq6tU
	jmGHlcjgz1vGrDgAV9b05GTMglMASdIbtbPZKdExblSleErmfcBl8ivFdXX0S5gTTqae7GvOVtv
	ThVie/YMu/3c4Tg0RL6KGsEZ//HupF2qHtnpev/+Iq/Bu3dVwF7BSenlT8tBMXdtzvG1EEfsYNG
	xEdCrHQ16LUHGjw36QlC3JxUOGYzVgBR/7LAa/XMGrlCTHqMFb29nnY8tZEB7Uz9wNoLjUT9QL/
	g=
X-Google-Smtp-Source: AGHT+IEsZ+Ve7h/dSpvrm5oVG5f63/zmNJSGPRE5zLBLKub43uiQvcH1rH25UaQZkyLxvP17RPIH6g==
X-Received: by 2002:a17:902:f70d:b0:240:3ed3:13f6 with SMTP id d9443c01a7336-2403ed3167cmr11337685ad.18.1753682190828;
        Sun, 27 Jul 2025 22:56:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe514b59sm45091795ad.128.2025.07.27.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 22:56:30 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v4 05/13] ARM: dts: aspeed: Add facebook-bmc-flash-layout-128-data64.dtsi
Date: Sun, 27 Jul 2025 22:56:07 -0700
Message-ID: <20250728055618.61616-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_225631_743139_FA6F2995 
X-CRM114-Status: GOOD (  15.34  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Add facebook-bmc-flash-layout-128-data64.dts (with 64MB datastore) to be
used by Meta Network BMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v4:
  - None.
Changes in v3:
  - None.
Changes in v2:
  - None (the patch is introduced in v2 per Andrew's suggestion).

 .../facebook-bmc-flash-layout-128-data64.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi

diff --git a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi
new file mode 100644
index 000000000000..efd92232cda2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * u-boot partition: 896KB.
+	 */
+	u-boot@0 {
+		reg = <0x0 0xe0000>;
+		label = "u-boot";
+	};
+
+	/*
+	 * u-boot environment variables: 64KB.
+	 */
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x10000>;
+		label = "env";
+	};
+
+	/*
+	 * image metadata partition (64KB), used by Facebook internal
+	 * tools.
+	 */
+	image-meta@f0000 {
+		reg = <0xf0000 0x10000>;
+		label = "meta";
+	};
+
+	/*
+	 * FIT image: 63 MB.
+	 */
+	fit@100000 {
+		reg = <0x100000 0x3f00000>;
+		label = "fit";
+	};
+
+	/*
+	 * "data0" partition (64MB) is used by Facebook BMC platforms as
+	 * persistent data store.
+	 */
+	data0@4000000 {
+		reg = <0x4000000 0x4000000>;
+		label = "data0";
+	};
+
+	/*
+	 * Although the master partition can be created by enabling
+	 * MTD_PARTITIONED_MASTER option, below "flash0" partition is
+	 * explicitly created to avoid breaking legacy applications.
+	 */
+	flash0@0 {
+		reg = <0x0 0x8000000>;
+		label = "flash0";
+	};
+};
-- 
2.47.3



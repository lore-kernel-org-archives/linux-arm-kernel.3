Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63361C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 23:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b72NISK5krV+0Jl86vAJ9RGRsu+nUqF+WjMxoexuWM4=; b=2GBo+JrHeZybcBC59x3I10i7BU
	0v3FNmQ6Qx6JgsPQSjyPTfXBC0+Mv25NAx43HyK/4Pty+wlLTXNfHLEHAuSyU/MEUyMI+bzcCVLs8
	uUU49vMG37zCIe+0N1Ia5NHhTdRNcaBOp0ScGD5Sd3w7K5CcQ2Og8I3YMoeQzAeVQ2GpFLrhLeeZG
	NYgzWdejSJNrQPHdN7vkBgL4xZ7BQIL1uVD9zAcjUJDolDHd1nOV8c/gAMLVkfQeNOT6aJ0llNyTY
	ZSoygDDQniKfppKzCiEaD1BUXrl3SZAbSXrRFu8t5+KJPENFZCIBXjyorEku9G7ivuhes2xai30a/
	RwRQMlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uej9E-00000006Ann-0pQW;
	Wed, 23 Jul 2025 23:45:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiuq-000000069Jc-3o5D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2350fc2591dso5154555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313428; x=1753918228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b72NISK5krV+0Jl86vAJ9RGRsu+nUqF+WjMxoexuWM4=;
        b=NWF6gnWjgbTA/v1hxsHlo29fTuozIC/BjO6qW+dv5BikZ2n0WkLd09jvKDSOSF+Fi1
         kQX4qrz+aJiRf4fc5ZakVisO1AJBFgDyKZsyKJZGD0wwyjN83dIvtyfslPSxaiztmfAc
         Z5VJksO/3SkDgwmSmZL0kcsT/CiMZ9NIA+xDLmYnwM0Fny9P+tYxFTyZzo3G9wBEnVWc
         nkIffAilwaF4NzzMT3p870YHL7e+HGgOSsCcvUoyGAVwrZFhyi0sFLkSMuLqUFmqe/Op
         PdQGLVtGTkjZlL5ZFSDOYCLORUsZRlHbyjudb2gj7gMHzca2h+Dw82KQlJK8JrbadkEn
         ocWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313428; x=1753918228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b72NISK5krV+0Jl86vAJ9RGRsu+nUqF+WjMxoexuWM4=;
        b=ZjxAk/EW7Ay1EXCxBiavDA/8ozBsZA/CNrmow9vTB25gp2ivZV3k6KJI/jy1rfuLl+
         FCVt2PXW/Mux3Y0yQusWig0gNnEWV73+OSAGGFHoMTfHgYxJhJDzFVACSw/NpYVFvCDz
         zWNl9J4uSpPdBXzaQylMpDEcj+np5I4xXLY8gY6NEWLHLa3F3cZrJdWV+3/aIHyA+iLa
         Wjj8FIWJVRxpSIPIW+/L9T/8qIR33lCoXlrmG4nBWf//6pbSw0fqeEE6tMWHPLVz9W3x
         ZwXNWBBIb9iAi5U852eouivMvlo0gQExB+LsalBSu8xb2ekRkluWY0S5KOirdyjBL8I6
         wZxA==
X-Forwarded-Encrypted: i=1; AJvYcCUGkLK3QGXn0uHRHgMi6u8sIF+pJ7CuhoEEIDTl2HTYhLPMr/8LnPsAugZOm/PW8wRxJcJ+SU2FCzayKslHYdOb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3nbaf24swrR0WEkZ4WfEB+SsQ4bRQqeaPRJ3MJOaTvXtB9F+L
	qXcX/fYZGHQns/mAEPNDSb+N1f1uSZ0dx6gTnWE2wH+NEH9MkOQ6xZGx
X-Gm-Gg: ASbGncvUyvOBRFK+GKXSr/VfkrTlxZTNFKcVnxj0slG7z9XaowhIpVK7lahcG4wgB0R
	eAH+rNDEnNoVmlqKuKvob802ztFn3QjAZv0D7VCrX0E+WIQq/43lxrdzriw4Au+D4ogj88j2ZxA
	8mb38L2RmLbub1zGJhHqKPIPdhP9YLIQw9zVfhTEcWzEKQ9vgC2FsI/+ZZWA+oTnt1ihYXbH6W9
	mI/WdfLXb/1zVy1vmpCAfFI3jmBKnuBF8UJ7lKS/dX7cTR/U92tauCD85cc9ZOk/PPkSVuOiAwi
	hlOcWhBaXZJTMPVInqZ6uoP2IxB/Zqps3HFKKK+jvr0AQsep3nV8+rmNHgaAIrJ8apibHY2iizT
	d7k1EC3hZUNkLaiXo5N74xXO7j5kS7K/6t4Ev/ELGsv5MNiWXTVYH0RzbJrTUbgBSvWvBr99+J7
	Y=
X-Google-Smtp-Source: AGHT+IFZkg/b8A39QrIJ5oCFTjMCG7sZ1b5Fg6PtXTUqUo1MSR5HSBvGsKpnVVU8z6juoLnGuhsccA==
X-Received: by 2002:a17:902:e54e:b0:234:1e11:95a3 with SMTP id d9443c01a7336-23f8acb17d2mr137494515ad.13.1753313428099;
        Wed, 23 Jul 2025 16:30:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:27 -0700 (PDT)
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
Subject: [PATCH v3 05/13] ARM: dts: aspeed: Add facebook-bmc-flash-layout-128-data64.dtsi
Date: Wed, 23 Jul 2025 16:30:01 -0700
Message-ID: <20250723233013.142337-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250723233013.142337-1-rentao.bupt@gmail.com>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163028_945748_FDB5ECBD 
X-CRM114-Status: GOOD (  15.47  )
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



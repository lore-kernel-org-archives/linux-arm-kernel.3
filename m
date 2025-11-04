Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D9DCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9kL7sLOaubIomrxMG9EMGJEPQDeUh/zlxyCoHi0rRk=; b=n8VwxkPsVvjQkpKBPvfFoM9v9q
	B3sks9h90nHqDAy1HfXz2xI15SbGae8aOSQCDmaXhLh3gRVKcOZsW+URh2FDd4D07QjXz+Db/Dx3l
	EiTpgX+G39wFATL2fbUhZFaKpfld7kCYWFCpwlPHeBJM5rELgnNVRl8TQmBoGo/NZX+WsgY4Rp76e
	zgurdFrMPPKzCeqxU/4d9W/Ug5cbItsoJk596k2UT5dDNPHPh5lQ3FQbZA+VHSk9nrt9ZZqezlcy4
	lI6KOAIEFK63LERL++FoC0JZRUfHEnNaboU1zf3D3WuP7APSTC74itv+QUiYkXVCEzVdyG3j23+pP
	0Cpm0JAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIcn-0000000C2bO-1QjC;
	Tue, 04 Nov 2025 15:07:09 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIcl-0000000C2Zz-10Sc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:07:08 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-640ace5f283so2999491a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 07:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268825; x=1762873625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9kL7sLOaubIomrxMG9EMGJEPQDeUh/zlxyCoHi0rRk=;
        b=GJ8K2xEf9C9GomlD9Udbms9AsOaa21OAXSGWkSRoweZWPqcxsax0IBF19pU3OXehIt
         /nPZh1cgx1J5BM0lYNuihWbbHEXsiHK+0By47xuglv+PenFcYlP4GcMey18KS0SYzbqI
         S99DrxEPIjvtqf4O9DdF+8J1LLqujD3My5YR4x+C7rlcHN0HSG76PRAnKTqZSUxQUeLg
         8S8WXc4lkxln/6tVEC7RDPWSo4cLm6jNiUWfQ/4X2Teqs9eidkVPOqrV8jLh5grZFxP3
         8VJMpzMwKAIvbFkwUZF1mTvBoZTw1X4RwSTUDMZLiL27tT8bMN8SUUpi4FLjqEy16l9s
         OpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268825; x=1762873625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9kL7sLOaubIomrxMG9EMGJEPQDeUh/zlxyCoHi0rRk=;
        b=Vxx6sTE0s5xUuIqOKJOZdrwoMNfr4+IYcgXKiudNZNkjZM1m7VLV/kyF4Pm8Nhag2o
         xMlYJ5UyN0FRXPA6/VfYJoUcF6G6J0dlGw3ebg2rQQ954kqwpSjU1VSjXItTYTFKJ+0k
         GhXmPE0o7Dn/wnN/5+rm2xf6ScM89f3WBI8+gXr9UM0ItLdidwK/PJ5P8bdTj5YowVM1
         zlTyt/+qHH3W4SQ2bSsaB8dao9bT/G9bqSLaPELgwvYkAbVQc083EGv92DSGNEVkC622
         PXR87JdHFsI/TMlqGM/6lonysM0xB7xaCeLDK3p57Wab+7lgwet0LCylsdVF6wxfS2kx
         Vlnw==
X-Forwarded-Encrypted: i=1; AJvYcCUloOnS5KyDD0jNCsPyx+Y44L0v6cKysRFk02KBp89tqc0rw/2/1aXAz7pTAVr2V1HzWrtv8HqkG2WLGvO1jgU6@lists.infradead.org
X-Gm-Message-State: AOJu0YybGxGEtW+GHVAsM8De/IG4EPK6uDHKTxc564gmbnPcH7jGefSo
	6ugBwhhjUaqwYA02dJNofk6B81jooZDI/tW+2MILArFfpdj/E57XuIje
X-Gm-Gg: ASbGnct3lbnzOviPLlMKIBkjdvT4piCKKac58mmvdo5ANZN7L47b3R10i6F90Wpw8I0
	zUrwCKP4dr0xXKSyrHhFIOpxRpkPQvhPjDZVp5pB2LZ6j5a5l671rnrbzxa62pS7/T/3DNpI6Cf
	m3Zi/32Yu391ALxymA7a1T2TqAFstEh8mg90qiznNsmbj+OzszhMOwPFeK2PxLIH6hNhORviz/2
	k4hOaRxc4557bra36Ycj3GGIbbzIB15PygrPRKZIgNBkZj/Tyy7OAuAkE2RdVWa0Wr5/D5tDvzN
	aQPuNuEMi1n44M8HkdCEQcQi8ZFflHqKXWpdXngMxYPU69WdzfOqFv3y8878UjGjQwef+Om2aTk
	Zs2h98IMDuDmRAsYnIr//BkcuqPoNXpL++WsuElp2kjPFJJ5CUgxd1ptEXjX4w2ckmL/n2BxVs3
	cRpzvZ5jgIoVSaQYFVQ5jsZzUXGw==
X-Google-Smtp-Source: AGHT+IFZdmElqbY9AODKm8wDfOCdQUqzn7Zp3okj0ZJauLQDD2dujxP+a4vOZzN9gWrLXe/og7S+0w==
X-Received: by 2002:a05:6402:51c9:b0:640:b825:183d with SMTP id 4fb4d7f45d1cf-640b8252621mr8119844a12.14.1762268825258;
        Tue, 04 Nov 2025 07:07:05 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm2342014a12.15.2025.11.04.07.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 07:07:04 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue,  4 Nov 2025 07:06:12 -0800
Message-ID: <20251104150612.1874-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
References: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_070707_301337_1AEEDF11 
X-CRM114-Status: GOOD (  18.08  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  6 ++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..6481c484ca37
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+/* consumer type - master or peripheral */
+#define IMX8MP_AIPSTZ_MASTER		0x0
+#define IMX8MP_AIPSTZ_PERIPH		0x1
+
+/* master configuration options */
+#define IMX8MP_AIPSTZ_MPL		(1 << 0)
+#define IMX8MP_AIPSTZ_MTW		(1 << 1)
+#define IMX8MP_AIPSTZ_MTR		(1 << 2)
+#define IMX8MP_AIPSTZ_MBW		(1 << 3)
+
+/* peripheral configuration options */
+#define IMX8MP_AIPSTZ_TP		(1 << 0)
+#define IMX8MP_AIPSTZ_WP		(1 << 1)
+#define IMX8MP_AIPSTZ_SP		(1 << 2)
+#define IMX8MP_AIPSTZ_BW		(1 << 3)
+
+/* master ID definitions */
+#define IMX8MP_AIPSTZ_EDMA		0 /* AUDIOMIX EDMA */
+#define IMX8MP_AIPSTZ_CA53		1 /* Cortex-A53 cluster */
+#define IMX8MP_AIPSTZ_SDMA2		3 /* AUDIOMIX SDMA2 */
+#define IMX8MP_AIPSTZ_SDMA3		3 /* AUDIOMIX SDMA3 */
+#define IMX8MP_AIPSTZ_HIFI4		5 /* HIFI4 DSP */
+#define IMX8MP_AIPSTZ_CM7		6 /* Cortex-M7 */
+
+#endif /* __IMX8MP_AIPSTZ_H */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 426c11853d84..2173b539dfb5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
@@ -2479,6 +2480,11 @@ dsp: dsp@3b6e8000 {
 			firmware-name = "imx/dsp/hifi4.bin";
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.43.0



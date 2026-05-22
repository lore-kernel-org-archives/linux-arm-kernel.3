Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D01CD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYSKle0N5gkhHFZVlrjMQ1yuCxunHMt9ZfrNwqt0f6k=; b=p4G3OiFznqICPfzPj1hVRb1Mzk
	moEVzkl3ImliSXKpvDDaFkbu1sNnaSYK0Dvm9KmlFD7swndBf08ZuCSfc6M7jnNVtSxEwEkX9mV6u
	+drNxj+R7qIuNtGRzM8GQ2pCxOj4zLtsvYKsAyoVo5ccyEyujWu2qnTScnU9g+fRSCZCQ3TpEylwe
	OUupDVgAQGESIh7r/57mPMkRrjYijTkAQFXJZ9DEh3QCiIVOWoQ9Zk5EJg1jMLTEmoCSmeJLO3UdG
	38wmObWMlBxCjfHd8slAA3ujyh19dCJ00O/vUf0rS3hpkw8I9hsBeidFiwQG0v7DK+s2CW35MLcIM
	s/7tnqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvt-0000000AbyI-3DE1;
	Fri, 22 May 2026 11:20:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvo-0000000AbuZ-13PL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 11:20:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso14030735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 04:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448843; x=1780053643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYSKle0N5gkhHFZVlrjMQ1yuCxunHMt9ZfrNwqt0f6k=;
        b=qOXGv0ETFp2KUs02yrJ4DrenyUulm3fWcuvFFJIwE2Gev6ZprX+N5pfwYVRAVaElCj
         LHCXbNumONAtkE4vvMVYR7/Q8VzB7r++fbaAgRhuwlNPuyJrbMdl/c96WAEvbtf2gwa+
         bjOvzZF0q4+bZLHtJGC4f8xW3bDTBTmwBavEnJer2F2J1zv8qyoJyKAhjPAWFMWp2FsD
         wPymUjnqn9/vxKct/srOdjkMKzvJB0B5Wa9IVIgR6GAeKaX1QJk3CqdqHYZBZ8xYnuAa
         f+KTWnybDD87tk1+pxKgbEHNMMHMAGBmkG0IrSMyrfrBYSdjpKLx5guUddoZwxptyKPX
         rDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448843; x=1780053643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hYSKle0N5gkhHFZVlrjMQ1yuCxunHMt9ZfrNwqt0f6k=;
        b=aC5LQEz/Q7YojOCeOtTRzZXo5tFOwUDpEY3tK2FUHGuURxngCqTrKxHUqqnJBDj4zB
         ng+D0TVdBkgKiP5Ams2b+j5Wa6tuU9CMGPwVfbKSwH1IR61lEnuQ21/o2jrHH36bGy9H
         zE2wL2XrOCgihiqobknNZFs1IdDxg5/pXeaTMqBWRpzbVSkX09G6CzHmNV4OtGGdW6xJ
         UtNVWEkXgKePbXkcT6BgXub46LJI3wC50i5GGzMETxn6M+6ggpHjQcVuFZ4CfauwrgAe
         Szg4PBUo4fPiKqjLrTluFCXUbFMxHe/Z4JMNpvSJxyagFsHBp2jiMYjVb/K3TCvvDw4J
         KAIg==
X-Forwarded-Encrypted: i=1; AFNElJ8q+rlEto8rhGpErM36PCygRhFHWStI5TFnjrE//pWQHoMtIKVmUIiw3BKZubOKO2hE6doD/gYoJHI4AT2OvFT9@lists.infradead.org
X-Gm-Message-State: AOJu0YxzhONrVOk5hTW1jzS/G5eA6den7iqRp/+j8IyxxBVdd2o8Xllh
	tYvb5SvjUvT43qJMC2U2Dsilyuii/jz3M64RTxl4Wvpv8AyG0uMrMBj0
X-Gm-Gg: Acq92OEq6yKBjVZSQS4aQfxDBKDtdbvwv+e/HmzmBSaXbJQRSSmIk9Tlt1JucU52joN
	JpijqX2/ko9bG0tNT+fHBWC4SMZcyEc/6Uc+F/PGlk0eAJhYqKQ4gtRbGd73o/X51jvnzp/ko2G
	duOTghNsptzw8FjKYcLoGOij9iG7MeJAIzzhVkIdzFX1qL1NmKgn1v+ZKG+D164c8mFNOyU4fW/
	pYRg92BayAR4iWjP0Zg6L/9OmzZnld/RkD87FKumqL1HUGNG1OxFSLyYo70veIPNaxDomSeQRak
	ndztV0Wm2F8PGiE1EOCihlmuc2gqIsgdk3zDoZLo3Vm2G+AsdJQTs8Eiz8cN/yYiex0A9VpZRUf
	qxhe78O3oUzsnSkujMcRyBnO4dScRxkh8M+iOJ4oCMoo/A5SRETMsb7zqsldovFoaSUNA9Rqrv9
	NH8jE5MLYcodGban45L6L9BGm9HxNqP+VwasnXSFu6PEHzuzp1/7qS59VM9BOE
X-Received: by 2002:a05:600c:a402:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490426d3f95mr30812985e9.24.1779448842577;
        Fri, 22 May 2026 04:20:42 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:42 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
Date: Fri, 22 May 2026 04:18:49 -0700
Message-ID: <20260522111849.783-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042044_313608_A2D0F3D2 
X-CRM114-Status: GOOD (  16.23  )
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

Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
to be used with the mx95evkrpmsg system manager configuration for
remoteproc and audio over rpmsg-usecases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 65 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 513f61eb27b8..a30a99e42426 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -521,6 +521,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
@@ -539,6 +540,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
new file mode 100644
index 000000000000..b39444dde66e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ *
+ * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
+ * configuration for remoteproc and audio over rpmsg.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&cm7 {
+	memory-region = <&vdev0buffer>, <&vdev0vring0>,
+			<&vdev0vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0",
+			      "vdev0vring1", "rsc-table";
+	status = "okay";
+};
+
+&edma1 {
+	/* reserved for M7 */
+	dma-channel-mask = <0x40>;
+};
+
+&edma2 {
+	/* reserved for M7 and V2X */
+	dma-channel-mask = <0xf>;
+};
+
+&micfil {
+	/* reserved for M7 */
+	status = "disabled";
+};
-- 
2.43.0



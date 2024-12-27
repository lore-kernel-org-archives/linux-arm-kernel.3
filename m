Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492A2E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuXjo3JGZawNXnVh34G3BVvcpo5eexvbjdWC4vxEYVU=; b=bHT3pbYlljgrT/cah03T60ahDR
	q0cF07sf/ga8IIaCzK9JK298OUMb48bjK5t9KNjs/wMnQQ1W8FSCBdoioMw1XQlpZzc8OvMyGhbKg
	1X7ZIWjFY+NumOE/qFPm885Cke3D1akpsrMEFdVtnHtUkKuyJnAkVxt50H7+/Ht6CKJo+mtgWMiUm
	pFI3FxQrxsM4BLEzV3T8V1SdPIrqEdGZ3tnGUS6x8pw5Hs3VZmEW8+TUwDboXzMweAuET7SlLhUXV
	ByCR+y7MnvQE7zmaE0R6zKnwyXWxSzWpzicFcBm8ev7p0x7YfaeA8el6RTUHviH5i0hHP9jRXY8yN
	HyOHKqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAYb-00000000JFM-1PBA;
	Fri, 27 Dec 2024 13:39:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRAUC-00000000IlY-0Cc7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:34:41 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2163b0c09afso86149515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 05:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1735306479; x=1735911279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuXjo3JGZawNXnVh34G3BVvcpo5eexvbjdWC4vxEYVU=;
        b=zFNAPsxQFefajzx1xU+3WM2DG+nt8T0aVJvD8zX4yYasQ3F102iNhy7TafpJg5hCjK
         iTlLLV+NW24V3y8syhBQjUwQ9SvbBFvSSW9dPeSS6Gn9twTAmcIZ0wvF8O5m9J9Swap0
         ZElINcd7WJLL1qhBvTFwChtdPGf4ndgccMaRzfNgkaexfODGTVf8yMgxJ80lyMkzMOOs
         wXEPq4l3wokhh7Mnxq9R60TgrYjVK6OYjpgQWF4/uziJa6VZA1jpPwJisUhaOZd6ZdkB
         JPf9aXXxFBylUeQtZ5EoU7y6yP61YmU+eHKpTf76w1MW2ftwd1FCSpFycFL38ciq9/sP
         XlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735306479; x=1735911279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuXjo3JGZawNXnVh34G3BVvcpo5eexvbjdWC4vxEYVU=;
        b=jGEA5M2HxIrQSpTKS+xf0VEnvq1kcQYZAhtQxK5q7vGIWL1O/++eAUoEwSOTgRZcEI
         hQ4wWz03q+P7bi1MHcjSM4Tt7hBE7ygIXjz7+u6PMYYDcKUKv+pFN6gf21TZ4oNMClVR
         dowD+TBKaSLo6p8MQSU1+bjQO7Gq5Zbkr783jchgFllR/O6T2oJAD2lbePN+0ovn2CR1
         naIzm4mScm5LS+Gmv3r336X/jByzYEd6OVsv+2H6+hl1z5kdYglqkngSXEe1TX63L/ae
         5hDEpKFM9MdERFx3/HBkws7Mo1BjSkfy48mHL9C5JwCg8FaLu6/Pr+9+764BTxZQO3n9
         5m5A==
X-Forwarded-Encrypted: i=1; AJvYcCUrAK/gMQc0gX/48xwm8Zod7kcT5gz2sY8XM+9fRZjfHH71/HEYxG/1LwRAJXe1EYLjWxLf5IuPTpwi5Dd9hJXN@lists.infradead.org
X-Gm-Message-State: AOJu0YzlXc2y8UAlST/H670XuGM65l7WbXDzDCQnqROm8B8CHAGQaY3Y
	BOLR32x/iZ1CGsSwFTtQVvDZEThYqHPFhFd7//tZBs1pNih6Qnbd48W9QkRhgmw=
X-Gm-Gg: ASbGnctgRwaHm3QWSRkyIWVa8DJmboaeeaBRwi76+NQLePb6mjOvL8vptoAZRIodhgS
	+6pBjQpvLERjBMyWQhmyPZxlaSIzRPBEJyKT5YSPNw2ZTpKLuOa7UAJBipJqlhfSByHTAQO7kY4
	zTY4gUQGcufxqBaI4CbthCf5vpym5J7LUW/Za5i4wUtpsZovv8e2FRhx7DBajqcP67Mbkk+9orb
	jMk77jKbrGk9Y8fp9R1T6o8VCAMzOMMBfU6bBft0a3rOxrAQHYSojLODjCRdL7ab3fVri4=
X-Google-Smtp-Source: AGHT+IFXkXBm1QSSKkDzkvGxOci8jtBovYoGFK+VfgBPfLEbz3spqaHBx+B/XcRXQ2Ybz2HyRRadqQ==
X-Received: by 2002:a17:90a:d646:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-2f452dfccb7mr35641883a91.3.1735306479201;
        Fri, 27 Dec 2024 05:34:39 -0800 (PST)
Received: from tops-ThinkPad-E14-Gen-5.. ([103.217.239.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4623dbfbfsm11808238a91.48.2024.12.27.05.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:34:38 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jagan Teki <jagan@edgeble.ai>
Subject: [PATCH 4/4] arm64: dts: rockchip: Add Edgeble EAI CM6 Industrial IO for Automotive
Date: Fri, 27 Dec 2024 19:04:20 +0530
Message-Id: <20241227133420.169714-4-jagan@edgeble.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241227133420.169714-1-jagan@edgeble.ai>
References: <20241227133420.169714-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_053440_095501_D6E7C7F3 
X-CRM114-Status: GOOD (  14.10  )
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

Edgeble Edge AI CM6C is an Automotive Edge AI Accelerator module based
on Rockchip RK3588M, operating with -40 °C to +85 °C temparature.

Edgeble Edge AI CM6 Industrial IO board is an evaluation board that
would compatible with Edge AI CM6.

Add DTS for Edge AI CM6C with CM6 Industrial IO board for Automotive.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 arch/arm64/boot/dts/rockchip/Makefile             |  1 +
 .../boot/dts/rockchip/rk3588-edgeble-neu6c-io.dts | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6c-io.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 86cc418a2255..6701b296f3e0 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -136,6 +136,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-genbook.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6c-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6c-io.dts b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6c-io.dts
new file mode 100644
index 000000000000..1e484991d1a4
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6c-io.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2023 Edgeble AI Technologies Pvt. Ltd.
+ */
+
+/dts-v1/;
+#include "rk3588m.dtsi"
+#include "rk3588-edgeble-neu6c.dtsi"
+#include "rk3588-edgeble-neu6a-io.dtsi"
+
+/ {
+	model = "Edgeble Neu6C IO Board";
+	compatible = "edgeble,neural-compute-module-6a-io",
+		     "edgeble,neural-compute-module-6c", "rockchip,rk3588";
+};
-- 
2.34.1



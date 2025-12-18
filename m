Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09592D6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meIgiWUQ9De2m5wPFplm4vW4qbqL4VHogHh5hQm1yv8=; b=i2GavEShyRa48FIM5t2aHfyEwQ
	WfrPhbq0jtN9jegD2Kiq+upwtGkmCc1DwgmUgJrAObkxi4gSaJGjnPMUKAEQHQO6qHZ+sD9c4wnCi
	CP2maqtSRgkqPOsq+0t4QnVpVr2hAsgrlRz+rzWTWpb+b38FUdPNkKiHSJk+DvmZ97Ipjt3aW/Qpn
	Svr8NdRFrunl5xkZIS9S6lCHyBCAzrykx5K5jJbH8zUsDpHONg/xq1Tj9gxVRoJgMjtxMEQReXY3g
	iILuoNO65U6jCXm+itXMv2QNKMhScTPflOQG4PqG4oWr8jRXMnxw4tM4ePb3TpGyPbaPZCZPiag2F
	VWCfsKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJL2-000000092z9-00Ue;
	Thu, 18 Dec 2025 19:07:00 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJKo-000000092nY-1Fu2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:06:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-647a3bca834so1531590a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 11:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766084804; x=1766689604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meIgiWUQ9De2m5wPFplm4vW4qbqL4VHogHh5hQm1yv8=;
        b=Ln4uq2OdsTMYGgMFSwsRP1aWyA/+Jece8hHBwzfJgrbhrlkbegHuTjLES97NmyPlm1
         PdLX3lQOLyzJyOdOQ+lyfkEdVT/9jxMhHEU7GQQmk0Q5J89FDfpGwwbUQ5njoXzMpw3c
         wqLMurFfsdkDJOAFT1+op4FvHirjx3vH/wgwqmeWiw7hsdiDwtWLcmYOz89xQfPCxZGH
         Zu531jb3dwESeRMk40jqSzBw08Cq/AXtRW2siafsQNGcPoI1lBjPsRxOuF62AVmidvtW
         Ajr/A/GXWLER9kvxGpRziiYw1na51e61fTJFN9D99Jvr+/A20x6qk9I0rKBK4WNw+B8w
         LKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084804; x=1766689604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=meIgiWUQ9De2m5wPFplm4vW4qbqL4VHogHh5hQm1yv8=;
        b=lp3jQxIDbY7jelcRk4DesQe/HdVa4yyPyQOK4rRae9jkGRIvJ3jXVhh98K7ZY+3sOc
         A+Gf1CKBlM+g6WkTFmIkboHlm8MwINnwvrJVqpmfOmTTWQDgeArCzDtInLYQQHEH96Dt
         UF+tnznpQczxiI7U250t49qBHX3AV+Qj3ZhSmem2l9WmzpmJjEjanmXMdYQuQgfZQvp6
         X21i9fTIZanWcDa9pB/hbYwjjaTjtREWpJenEYONeS7KtfbcPAZlW0ejGuns5+af3wdI
         pigQ2e8oQQ4vhhhLd+xQqGSh/Y62pQlOo3jycE7Iuy3enyaAr+FqfwtJrFXNKw7pE5QW
         tDkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcqp62WgUEINXh8dG9gI1yF12X2SetX+pZGx+DrjhhigeaTOvtcrhF7JS7DZx/6cS4RWb10Cw5tpW+7Ob1N/dN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+9zKQKwInIwYzEGYB3yyJh/LAZrdBbXWdvKjNHV//OiD33LYI
	VfA45zDJA7s5rm0q3hie9mSbHk9Wf1aiDu6CuGa5otP1CHr1yGWwQIpDZZUdsPCC/7M=
X-Gm-Gg: AY/fxX4AddNtYN0qOjzSPZiXagG/otsS6DwtK5I+Samj91Zapq5JhP7HAcn1+5+LZyq
	f9xhfLFM2GL2zaMDu7IVIrosIYymMyYw7HVu4tVRcugBW5bZ+Y/6fYvuJmn4ToeuZigicBsiRcm
	znVTme7OMWdkhXDKN4vSX0uCF1l2Fy875Qcrjw5dyuLJK58VE4p+9JuDOYx/Qz0/dErT2scjzOH
	BsC5IxDA2vC5QtKJOE+Vf8SqDXA1fDAg5Yla6xWB9F7QK2Pmq+cHLsP97fDmgW+ieGcUZ+lvMkc
	qz+0hLP2imNf2ZosO/xC+7MqnhaQ7CPgKdOYaZS8nIWTmoRKYDBwpGhNv2SXgO0/8pM4Vb53c2h
	91C8fbrJxu43iJSPrLRlIxbVkBarlpmfIAszRCfH8xApKApTqJtcAnrXmEm1ryhAwicSsdVA67l
	Ri3XvcxKPZIl4tI4FCzUmvGQF4xvsvIuaN1Ph018L368SeNE1BXnZlsg==
X-Google-Smtp-Source: AGHT+IFzFfQNZh0mLNNy8P0sjbZrtvUKo4fA6WSa5t/h81X7jrCeW0CUo03UOo7LGxZQ3fjwMYJm8A==
X-Received: by 2002:a05:6402:2345:b0:640:9eb3:3673 with SMTP id 4fb4d7f45d1cf-64b8e93baa1mr437157a12.4.1766084804297;
        Thu, 18 Dec 2025 11:06:44 -0800 (PST)
Received: from localhost (host-79-37-15-246.retail.telecomitalia.it. [79.37.15.246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c51sm173729a12.3.2025.12.18.11.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:06:43 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH 4/4] arm64: dts: broadcom: rp1: drop RP1 overlay
Date: Thu, 18 Dec 2025 20:09:09 +0100
Message-ID: <85167b815d41ed9ed690ad239a19de5cd2e8be1c.1766077285.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1766077285.git.andrea.porta@suse.com>
References: <cover.1766077285.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_110646_347365_2BA0025F 
X-CRM114-Status: GOOD (  13.72  )
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

RP1 support loaded from overlay has been dropped from the driver and
the DTB intended to be loaded with the overlay no longer exists.

Drop unused include file and overlay.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
Just a heads up: This patch removes rp1.dtbo from the Makefile, just like
this [1] proposed patch also does, but the merge is trivial.

[1] - https://lore.kernel.org/all/20251211193854.1778221-1-robh@kernel.org/
---
 arch/arm64/boot/dts/broadcom/Makefile       |  3 +--
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi | 14 --------------
 arch/arm64/boot/dts/broadcom/rp1.dtso       | 11 -----------
 3 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
 delete mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index d43901404c955..01ecfa3041845 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -13,8 +13,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb \
-			      rp1.dtbo
+			      bcm2837-rpi-zero-2-w.dtb
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi b/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
deleted file mode 100644
index 0ef30d7f1c352..0000000000000
--- a/arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-
-rp1_nexus {
-	compatible = "pci1de4,1";
-	#address-cells = <3>;
-	#size-cells = <2>;
-	ranges = <0x01 0x00 0x00000000
-		  0x02000000 0x00 0x00000000
-		  0x0 0x400000>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-
-	#include "rp1-common.dtsi"
-};
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
deleted file mode 100644
index ab4f146d22c06..0000000000000
--- a/arch/arm64/boot/dts/broadcom/rp1.dtso
+++ /dev/null
@@ -1,11 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-
-/dts-v1/;
-/plugin/;
-
-&pcie2 {
-	#address-cells = <3>;
-	#size-cells = <2>;
-
-	#include "rp1-nexus.dtsi"
-};
-- 
2.35.3



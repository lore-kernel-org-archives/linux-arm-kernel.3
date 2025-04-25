Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCCBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fJtFgz8Pc2XyTKgSfUOoq/oEt4LEs1nNniOPLnzWRQ=; b=bO9dLlgmeNsC2St3izOqnXq/n4
	L5BkyMtrEXSock1ayb9//IJ6Ng2Yx8VSpwIDGj/kfEOk8hsY3Tv9Xd6itdyBdsMusCwYT7uyD7n5s
	AINQVOi7q6h7UeqaFlxMjsfxng9qtUZtKeHEC3pnnAIUOAP6/6Wsa92Cs/NXrTLs4hFP8lGHiNVEm
	zYgxU2wfBtXYuBqwJv0XYUQWycvLHtsgZpFC6jsKSnDfpoLwvtQcPUSRMo3VoIZVhG0YRixW1FehT
	MH+M18+SEBgZ6qn9RJJiLVWW8PoZi5scihRMCSwG4XWxA2w7GtoTqCjQcI1C3WunOT5BCU8CBw9Ob
	r5kV3VFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JxC-0000000HQNG-48T8;
	Fri, 25 Apr 2025 14:22:58 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J6B-0000000HHDt-07xm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:28:12 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so2148808a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587690; x=1746192490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fJtFgz8Pc2XyTKgSfUOoq/oEt4LEs1nNniOPLnzWRQ=;
        b=KP8XS5BcfL/To7REvMCEow6yFYUDTMJ+hD6pbV8nczyLW3dHmFMvkYZKmyhNJxkUEL
         36p2XiaPMHl+KnWUQBcU59kNVh4jHWuBGehmjmyfBKSuITCBroEV+PCeP3SoBtdhuLdv
         6oZ5ZD8Kuw5NexVTDHDelW3H+NKe+lFy8W7OTZGRetj8xac4zJajnD/QPIeysEXeODwd
         dhAYB9M7NZgTQGYxjdKDz/wZC36CWKO0gRslbDMmBP0z/kxxFysVuhfEKu0QILDSKTV0
         Er11ww5saD9E51qHwR+PnbmwXNot5gdU+T03zeb7M2+728kmrW/ta5iI8nqUV0VPbg4j
         vcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587690; x=1746192490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fJtFgz8Pc2XyTKgSfUOoq/oEt4LEs1nNniOPLnzWRQ=;
        b=KUgi4Q8RrqlDBbjrP2WV/Ly8FcaXTXUsknVYizhRaMXPIiKmdSK26qkelQZy29sBA+
         8l2tn0KKirPggzH0Jba+Mu2EtNorGQuzS1bQ1GP8ivI6uv+r2VlAt01eJWiJ0fF4cs5j
         JU1jnQQ/NI8/rZYsmrKWo+kjbBUkpneEuFNjGRUk+b4kLyIrLn5NSdR1BtV+5bsA8oQE
         b1P8FS34SXnUXMQKwOrBe2UXhh5q6XepELXbal7ZoVjLPUXJOgsGB9Bjy6lq6oi0zYn1
         F9GEH0Ec85REUEDb9NfdZKwNObPSH6HWO4btIBK3ggJdBB5MK6lE4hgLYegZHwJVK7Rm
         FzEw==
X-Forwarded-Encrypted: i=1; AJvYcCUJzP8OMgxXxRUX/T9JZ8WUS9MCMnVTVX9cabM+gsNdRwhLdUiFKY/XhQUyrHq2ILO+BL9lhg59dScXRRMALmbR@lists.infradead.org
X-Gm-Message-State: AOJu0YxZOOnYpAZrP9+9Y2PKqDnwzcwXMEItHSIOsG1wM9SDq9eJtVOQ
	Ox6Bwr76B+dsFOvDyVguNnCrwnVA4+3vW6NWyyR+WlAVirXVap1V
X-Gm-Gg: ASbGncsLjuGAX13OauOeICblwwWvvAutyxqXfODfF75vYsBuIRT04zkewxeb+PUUGGg
	kzy1vpo0ZH2B13HjmFWNrLvh1ikt3V0sjEndXlM6H7Q7wi+qKnHvZ8VAe2BshOBN1lEzryFNd9A
	fIUfZMphYHvYdeIWxhrpLu0qPjj9+zQt8CcKrHXyMgmxHH5fqxnk1LLrcEZWdyh/W1Pf2Juw8rl
	sqgcid9l2AY4xk2e7r9W905ZyiJBt3b5uYP8UkxvVMrLGMbwkkLwp0HAKvYM6Dz0qqT6gVXfOhC
	XLIH4oo6Y0y5MnLIkhNQW2b69S3/DfwMDXYtJuhJtuIlkQTcWq/IyQ==
X-Google-Smtp-Source: AGHT+IE0B0jfK5eB6DMRg7QdZ0TYxev8uNpIBvEu/A8yMtaqxyNFSybZ6GGMuVFKhth422xl8fGg7g==
X-Received: by 2002:a17:90b:3bcf:b0:2fe:7f40:420a with SMTP id 98e67ed59e1d1-309f7df30c5mr4530511a91.17.1745587689959;
        Fri, 25 Apr 2025 06:28:09 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:09 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 03/10] ARM: dts: exynos: Add proper regulator states for suspend-to-mem for Exynos4412 Odroid
Date: Fri, 25 Apr 2025 18:56:23 +0530
Message-ID: <20250425132727.5160-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062811_065428_8BFFB513 
X-CRM114-Status: GOOD (  15.46  )
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

MAX77686 PMCI is able to power down and up key core supplies and other
voltage rails via PWRREQ signal to enter / exit (deep) sleep mode.
PWRREQ status is ignored during initial power up and down processes.
All programming must be done before the AP enterns the sleep mode by
pulling PWRREQ low since the AP does not have programming capability
in (deep) sleep mode.

Add suspend-to-mem node to regulator core to be enabled or disabled
during system suspend and also support changing the regulator operating
mode during runtime and when the system enter sleep mode (stand by mode).

Regulators which can be turned off during system suspend:
	-LDOn	:	2, 6-8, 10-12, 14-16,
	-BUCKn	:	1-4.
Use standard regulator bindings for it ('regulator-off-in-suspend').

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../dts/samsung/exynos4412-odroid-common.dtsi | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 03943c666d11..3837e038c266 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -309,6 +309,10 @@ ldo2_reg: LDO2 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo3_reg: LDO3 {
@@ -338,6 +342,10 @@ ldo6_reg: LDO6 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo7_reg: LDO7 {
@@ -345,18 +353,30 @@ ldo7_reg: LDO7 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo8_reg: LDO8 {
 				regulator-name = "VDD10_HDMI_1.0V";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo10_reg: LDO10 {
 				regulator-name = "VDDQ_MIPIHSI_1.8V";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo11_reg: LDO11 {
@@ -364,6 +384,10 @@ ldo11_reg: LDO11 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo12_reg: LDO12 {
@@ -372,6 +396,10 @@ ldo12_reg: LDO12 {
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo13_reg: LDO13 {
@@ -388,6 +416,10 @@ ldo14_reg: LDO14 {
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo15_reg: LDO15 {
@@ -396,6 +428,10 @@ ldo15_reg: LDO15 {
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo16_reg: LDO16 {
@@ -404,6 +440,10 @@ ldo16_reg: LDO16 {
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo20_reg: LDO20 {
@@ -442,6 +482,10 @@ buck1_reg: BUCK1 {
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck2_reg: BUCK2 {
@@ -450,6 +494,10 @@ buck2_reg: BUCK2 {
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck3_reg: BUCK3 {
@@ -458,6 +506,10 @@ buck3_reg: BUCK3 {
 				regulator-max-microvolt = <1050000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck4_reg: BUCK4 {
@@ -465,6 +517,10 @@ buck4_reg: BUCK4 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-microvolt-offset = <50000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck5_reg: BUCK5 {
-- 
2.49.0



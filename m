Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D7CC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01k0FR3gadfOW7bYhsG0pi30JzxZ7YHZvTgo3ghbW0I=; b=apKKd7kfiyIyC8oiXtehFhLRLX
	6XP3GpbMVFtXrzEsb62p0dDv1GznZDSCpdPYD3o7EBN+xDekNmnVrrDSjPvdtuPaDrNK+nt6ywo5O
	YnfoxLVxwu8IdanxSoIDRSe4NXM9JkN4BkMFh0KMWMrN4tTUqKt8hI+TkfvB46/SdS7vPt67L7IZx
	uDcKQLSNztQ1L4P/p+xIcqbC4SG5b5Ub2mXyYfBDD5VPa6rEBn2RDjoXt8yl8pWjewYVxCJo8rnb1
	EatYkyvael+Gq2wSCWmFdqNoJboSNwA2ZbslQHTfmqCt7zlEJr79Dkv4L1Nhg2SJgoMZ6rMKHG+Ik
	mGlEq9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KBt-0000000HStd-0v1S;
	Fri, 25 Apr 2025 14:38:09 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J7B-0000000HHUX-4AgL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:29:15 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b06e9bcc986so1717978a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587753; x=1746192553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01k0FR3gadfOW7bYhsG0pi30JzxZ7YHZvTgo3ghbW0I=;
        b=SrK/GXgiW7Jgf2OheWE77rm+r4AcMWh+0ZlnPZclDItiiuJLOUxn4IO5KuwnWUKqt0
         /1Es5vpyUXyBA2+v1Iw+P9mf3PCB89wLoCA8tbKhar+4e2WW5Ed8Y01DhUJ+XBOPUhBG
         1+M8dSKtehnEqUIBiUg2TnCilfb1OBexONu/Kb8CY4qrE9oxMInBoWOtsQJUGh05rHvo
         Wu1n6WSZ2+PjOMvERotg8M/l2JudWI61H6BXR135pCG9FXLT5gnvskxPJcg4GbiTFn/3
         1TdPaJMoCurUJ2CliSwAEYJjcskw+RYEqRPVpY+QlohAy9mtQshKKeQ1Y3x/qonh7jCH
         8b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587753; x=1746192553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01k0FR3gadfOW7bYhsG0pi30JzxZ7YHZvTgo3ghbW0I=;
        b=cTA/HLpU88jaWP3w/pc/bCpSr320FZe3VSai6cV+of8CRIHenbH+4iYQUgz8HnIvQX
         Mgaw29eVpoRIhygxAgPIT7u3WEEtmOXjybOnYaC7Zql1NrVdhA7pBTBHAOWNYtAdQhQD
         LhlkW1Beu+5/olJmBX90CB13+23XoCTbnpDa8QPG3aMsT4fQNKhyXs9Of/nIQ+Q/IIHF
         YZMtwNrrEugs+pS/xKReSfinixz2a7DL2ceGQ8ydZGGevb7nFMMbLqflIo+hIrl2C3tc
         RW7GH3HQiQ+PCvOKlQDP0oDNbAWztFEPSMdfuq962HVgUJaL4PpswMIKIi/mzB/9HLY5
         0ETQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUNeu+WA9ADrGKBuvLLi6gzR3DZNaCf3b3kpnrPj60mJtVXi3yf32MZC5nPsD2EaeGxVX0YM1lIhUb7Gfhu2Xe@lists.infradead.org
X-Gm-Message-State: AOJu0YyZjPoQzYrsTCfwMHCCePWSn7J4Zb6A5zEum+cj+bMNXIajSAf5
	5CnoE+s/Yq4HSZ/OxE/rUsSO8m7ZCmqYUrsjSgWbe6JM601vfQql
X-Gm-Gg: ASbGncvA2MwjUKoqNk+DUNfmf8D/C/LXYonwW7jqG4iDLjPqbw5KCcSoZEp0o0Bq+3m
	HqwGiMJTi6QxzWkGobTB8TIHitHkuC4xmn+NPZxpRKFaPnBfRBzoFPqyc6vYNIVSApyczvhnScI
	VFl1yGDplD92kpYWUubVqwjBmD8mEWvzlvTFaoypSlAE+lZ85Xwu7CbbRIXvDA7Urj8kdlZkaNR
	ZU3iTwG/gcDcp/x3iQbQVuv9q3fVemhFw7B0iF09EqGsELoAv7ay0RLHlMMAKPdyeLvv/15hZ0t
	5MFtC3QlMQhWE8PWDEXsDYs03rA1iiz0Vzms1JjZjnxAiwuBe8vjtQ==
X-Google-Smtp-Source: AGHT+IGg9or9/EVXKbPbko2FEzf8DUz4YrsrKKDLHYz0xNXlwlVAF65DQ3EkGDa+iSIFAG3GfpeaFg==
X-Received: by 2002:a17:90b:5148:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-309f7eb4b0amr3246854a91.31.1745587752974;
        Fri, 25 Apr 2025 06:29:12 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:29:12 -0700 (PDT)
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
Subject: [PATCH v1 10/10] ARM: dts: exynos: Add proper regulator states for suspend-to-mem for Exynos5250 snow
Date: Fri, 25 Apr 2025 18:56:30 +0530
Message-ID: <20250425132727.5160-11-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062914_034994_9FF3450B 
X-CRM114-Status: GOOD (  15.57  )
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

The MAX77686 PMCI is able to power down and up key core supplies and other
voltage rails via PWRREQ signal to enter / exit (deep) sleep mode.
PWRREQ status is ignored during initial power up and down processes.
All programming must be done before the AP enterns the sleep mode by
pulling PWRREQ low since the AP does not have programming capability
in (deep) sleep mode.

Add suspend-to-mem node to regulator core to be enabled or disabled
during system suspend and also support changing the regulator operating
mode during runtime and when the system enter sleep mode (stand by mode).

Regulators which can be turned off during system suspend:
        -LDOn   :       2, 6-8, 10-12, 14-16,
        -BUCKn  :       1-4.
Use standard regulator bindings for it ('regulator-off-in-suspend').

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../dts/samsung/exynos5250-snow-common.dtsi   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
index ca6ebd8a9d62..70c3e6da55b7 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
@@ -318,6 +318,10 @@ ldo2_reg: LDO2 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo3_reg: LDO3 {
@@ -332,6 +336,10 @@ ldo7_reg: LDO7 {
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo8_reg: LDO8 {
@@ -339,6 +347,10 @@ ldo8_reg: LDO8 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo10_reg: LDO10 {
@@ -346,6 +358,10 @@ ldo10_reg: LDO10 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo12_reg: LDO12 {
@@ -353,6 +369,10 @@ ldo12_reg: LDO12 {
 				regulator-min-microvolt = <3000000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo14_reg: LDO14 {
@@ -360,6 +380,10 @@ ldo14_reg: LDO14 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo15_reg: LDO15 {
@@ -367,6 +391,10 @@ ldo15_reg: LDO15 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo16_reg: LDO16 {
@@ -374,6 +402,10 @@ ldo16_reg: LDO16 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck1_reg: BUCK1 {
@@ -382,6 +414,10 @@ buck1_reg: BUCK1 {
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck2_reg: BUCK2 {
@@ -390,6 +426,10 @@ buck2_reg: BUCK2 {
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck3_reg: BUCK3 {
@@ -398,6 +438,10 @@ buck3_reg: BUCK3 {
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck4_reg: BUCK4 {
@@ -406,6 +450,10 @@ buck4_reg: BUCK4 {
 				regulator-max-microvolt = <1300000>;
 				regulator-always-on;
 				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			buck5_reg: BUCK5 {
-- 
2.49.0



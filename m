Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CD0C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFjEH3qP0dLTK5ihHzovZcinv2fwnPAf5xRz9u95KUM=; b=qXjmQ10lxrr2yn0ylHXVX+fNtL
	SiZIbpu41+DZBo1IkfiJpke6EoZi+xoEPDBBwXjmArc4hBqAj2QnZ03nt7WtC1YS7rxVbXTaGct+g
	/d9Cko6EOFekhJUmRHRy/iYoX9racLtzk51Ihx4ROV8Xbfy7WMlIWj6GxF0ZCfygJtq6kcZ9GieRz
	KXfSoO4XpkoHOPw1AHOpIR6UPbj3Eh473SCql/Iuhs4ix/g2rtoC0dD4Bb+tgVEtt7fM5DTQVbp6A
	wA6XIxb90DhDqXhqU0eoXbzIjNDA8js+sgztc1lKsIUcGlkgbkEfvdX/IMoVJCdxAoXYOZ2N7Y9FM
	GFvPeOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L7L-000000004Vu-3xX8;
	Fri, 25 Apr 2025 15:37:31 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J6b-0000000HHLF-3rSq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:28:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30820167b47so2311940a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587717; x=1746192517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFjEH3qP0dLTK5ihHzovZcinv2fwnPAf5xRz9u95KUM=;
        b=hZzK4vLdajvo5OAnBFogYAuCOspVWICK2jndg8SnR5Ayhcfppf/ihyR8psOAbUI+yO
         /s5rH4+VTF86E3+n069RIMCIkr1BoRBDcfHFV9D+v48eqsnt5tPCT4AVxeGgb6JrR6PD
         AJ0rm4ix4SACcdCpNXHvZdoWKiRRtsuqiX7t0tAw2ZdN3y93JwLYyXE3b/9nws5MyDtc
         UTFINGrEq9JNtBlh7GtJvekJw5r02HFr28hsB7Bs29OGmLYZaErQeFiuSVsbdUgijGiE
         4MZBkAVNkl3YgLgJODRm7otde+UIbeMPZj/yHRrhwDL6BXxPKbxChS2iFzXhCjUNYLDW
         Yjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587717; x=1746192517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFjEH3qP0dLTK5ihHzovZcinv2fwnPAf5xRz9u95KUM=;
        b=Q6U1YBPgYNmM2EgBrZPG4CPuj8TFasnI59NNNcXw+cr3+/qeFQeToksmUq3d3hGH4h
         PLCh/zpFG9bdJmxJFVdachyhGgEHn5l/ZRP106nmmN066yE92J4y7WnptYfHvaGe8ebR
         HnlVIZ2YwrxIh+MgXYMqpNGVngH5bGmMM+kRDNMoHFNKZReScSYprOmDbTUrzTS6prg2
         xlY8DYyR8hD3G8vcUPhiAZONnxy19YMNLkaOyDYkUVZVip7Yp98a7sJRK1XAjIzqkTcw
         iuAo/yPVPXpFPFmlnHdrTwXu/M/seJfPG7gVOaZZeTKEhQKH0Bz69di9mEATgh3you3Q
         oZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWEHKT+XD9s4nDHY7z6yG085OOOVJuKUG+TXIAcoJJENikGn8tMlwjP4fTn8mWdfqmV5IEvsn6aForFE0RmH6xw@lists.infradead.org
X-Gm-Message-State: AOJu0YwFv629TnQQMPasLqP4Z2bNwD9id8fpLQyEThMfDZ/+F1V+UzE5
	AWazL1ccVaREiXonjqcmuXJ8PgP/D+JKLIobMaWXqWrgQQ3+E7Nj
X-Gm-Gg: ASbGncvJU8B86KcRWbUAtCCyhCKHajxos4fhLELnjprn8EFNs+ixKWp9VJJOeZb0lZ2
	8wH6upyk33YHnCVCGz+9OqAIDcXmST7V19aorr7Wuzdszk7r5O+pV/+jJbVWKgTa0DGlXnZDl4t
	PFoajIbi42KgtpHBaDewyWVtYqi5GHveumPTumKkhiFWeIoQ+73tx9Vf88QR86SUJt2CmjYV9GM
	YM/KvoWk6gtfaF9k34g3Dq5oqF9RHMtSWXhHgs5r9GLTkT1qvtGZD1uGfsfayRP7/F2bdzjEqSU
	7dsmapFj9bDo9unmcdsgAysf7vWL4mpMSMiNiZWhPJBgimRTGeQs3Q==
X-Google-Smtp-Source: AGHT+IGj9lR9tmU8eyR40XzFeimkdT87ngl3tdqW47D7njs1AnBF+aef9o+xkSHHj9j97MED9tFceA==
X-Received: by 2002:a17:90b:1809:b0:2ee:9661:eafb with SMTP id 98e67ed59e1d1-309f8a07690mr3104746a91.12.1745587716944;
        Fri, 25 Apr 2025 06:28:36 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:36 -0700 (PDT)
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
Subject: [PATCH v1 06/10] ARM: dts: exynos: Update proper regulator states for suspend-to-mem for Exynos4412 p4node
Date: Fri, 25 Apr 2025 18:56:26 +0530
Message-ID: <20250425132727.5160-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062837_958696_7EADE2FF 
X-CRM114-Status: GOOD (  15.17  )
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

Update few regulator node with support suspend-to-mem node to regulator.
dropped suspend-to-mem as MAX77686 do not support these.

Regulators which can be turned off during system suspend:
     -LDOn   :       2, 6-8, 10-12, 14-16,
     -BUCKn  :       1-4.
Use standard regulator bindings for it ('regulator-off-in-suspend').

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/samsung/exynos4412-p4note.dtsi   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index ad0abe8d9e30..d0ecb1c6a922 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -448,6 +448,10 @@ ldo1_reg: LDO1 {
 			ldo2_reg: LDO2 {
 				regulator-name = "ldo2";
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			/* WM8994 audio */
@@ -457,10 +461,6 @@ ldo3_reg: LDO3 {
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-				};
 			};
 
 			ldo4_reg: LDO4 {
@@ -472,20 +472,24 @@ ldo5_reg: LDO5 {
 				regulator-name = "VCC_1.8V_IO";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
 			};
 
 			ldo6_reg: LDO6 {
 				regulator-name = "ldo6";
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			ldo7_reg: LDO7 {
 				regulator-name = "ldo7";
 				regulator-always-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
 
 			/* CSI IP block */
@@ -506,10 +510,6 @@ ldo9_reg: LDO9 {
 				regulator-name = "VLED_IC_1.9V";
 				regulator-min-microvolt = <1950000>;
 				regulator-max-microvolt = <1950000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
 			};
 
 			/* CSI IP block */
-- 
2.49.0



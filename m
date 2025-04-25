Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA08C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BU6Gjz5o2n3GUta3AJxmLr4JZHkWrS1NhJGZu0/+08=; b=TsMVO2zA8y088ovYTrdw4NVOUu
	V7alNaUhGKXuxPtRe/taJbMjMLQS0Mkw4tVLSEUMy10Co1LAS+L4UunVC9JAXNR8tFQsoQ3DQO0vs
	QOFbkAvsJQPX4um9bOPbEPxXxLCwN8MU9T26dDsDm0B0chXgDmL/6MsY4sK/bpIPHFB9l5XHp9zav
	7YOiq9jA4kv9IC7E9iZQJMdYMYGS13Ta6G9VYKavmPtG4AL+3Pwwkk2g0cHlAuPYuh5xyFO2v1dSU
	FmAaNMN9gS08fFEbock5NHxrIgOpelc0VNeaBwP76ECRVKXH9GarjhGuwycegri5NccR7QOrc55u7
	joD529Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KA2-0000000HSRK-41sx;
	Fri, 25 Apr 2025 14:36:14 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J72-0000000HHTB-2pmC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:29:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3014678689aso1939942a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587744; x=1746192544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BU6Gjz5o2n3GUta3AJxmLr4JZHkWrS1NhJGZu0/+08=;
        b=gPwovYS/OJxqYBxdP0xZ+nZ45MW38sT45XLWX7WDk1r9mNoVdiZB84+rLubREgYNDN
         Qf3cRaUZYoKAgSGzc/amONeeasjEhfYhT8MTKReFV4VOKukVu6T9bXKV2CwO51n/ZvyB
         jrTq+eXhWvxYFqf90FkFvyT7tq3ZScpb281Zl+upuSCC9XnEE4+pJP8CuLhStWa7kBcA
         TcUD9ftTIMMvYiRmjBo/Sk5sP3VMhHNpU8+x7iuck7XML4XTANoguUIURa5rc76x3i2c
         6Fjwo7+Jdb+baBL7PNtV1zftvIhiuCbcqQIbEtumMZ+GtL7rXG95tTzzJlYa7MbWYC4U
         Bo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587744; x=1746192544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BU6Gjz5o2n3GUta3AJxmLr4JZHkWrS1NhJGZu0/+08=;
        b=Rdf5XRIx6JVGH+hVnNB9ZRGYcQac5pmxaC8l5PwXXiwuQctRMpfaQV4uts4v9VSa3P
         2wOD63BbDUrnneSBgdZwfs/eH+J9sYApxlBv+ctdCqzCrW5D33Z3oCdEOo3kgCAdzTra
         rabx3nUYq9v15nX9/8bE4wY/bFMyCSOKhItlIZj6t7tCvPazEwQedVDiuZpaMr7wOW2c
         lvuHC8AStRBTai+ACm8t/tYmKJprcXoUuvZCh1YPAhhw+gR8s/ySfy5MbcwxseC6aMj+
         QWtT3rCaaPwuXVaP27xPsq3mqHc8K7u5Fq8t21RQ9smyUax10WbumbqK4p8E9n+hSESd
         pJsg==
X-Forwarded-Encrypted: i=1; AJvYcCUWURyp33tEYgi5BfRm1OX1ACQX1ih8mQZg5vmNdXCNd8DoLfwomJyp4nsa36fn8L+xhk3YYil+vo2vw3aApED1@lists.infradead.org
X-Gm-Message-State: AOJu0YzqYA9s0hJRtazpzaGPFdhW6KQuIIZ3zU88XWoKbQpjXYXGC46P
	RjFtxaUkQXjcZZJ+28RQL7bIWCphI9/mu/S1rATsZf5GcNEVNFHp
X-Gm-Gg: ASbGnctVNzTSJK14XIh2PbGNA7Vrx2EkIKyYmUPjlV9ushQ6vMPlkXzG7bc8xRoe47x
	K9O7EdF9ic3qEOMDy/YSqICT4XZYvlaj83PspnWJRA/0uAvm0SM4I3gSk4I8G3OZSIN6D/kDrvL
	DvLQ/p0DL3HUPSbEgYUE10VZ4fiFHdOMfZVpbS8cn5SqLszpepA9kfb2p2jKLlYDOAfG9VURDit
	QE0PGxwXb3JC3da5sC59jx24cCQ2UHxCXvsn7iEJ+962EXJTXvP3bAjqM/H+biKUu+nvu/EIysV
	kXx3eK6T1VTfPdSIissEXgAYx1Wjx4iGIOk7HjVZ4kfQd/94DrbhYg==
X-Google-Smtp-Source: AGHT+IE/Flas7YxNWdzmEA4xipdCbt62Jh1HqONiQvnCT3cgbZMRmzKQAq8RQ8r26ji5bsvaT+3wuw==
X-Received: by 2002:a17:90b:1b48:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-309f7c70113mr5039718a91.0.1745587743976;
        Fri, 25 Apr 2025 06:29:03 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:29:03 -0700 (PDT)
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
Subject: [PATCH v1 09/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos5250 snow
Date: Fri, 25 Apr 2025 18:56:29 +0530
Message-ID: <20250425132727.5160-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062904_711457_D4A44DBA 
X-CRM114-Status: GOOD (  14.87  )
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

The MAX77686A includes a crystal driver with an external load capacitance.
When enabled, the crystal driver starts in low power mode. The
LowJitterMode bit controls the crystal driver, allowing it to switch
between low power mode and low jitter mode (high power mode).
Setting the LowJitterMode bit to 1 activates low jitter mode on
three channels simultaneously. These three 32khz buffer outputs
(32KHAP, 32KHCP, P32KH) are independently enabled/disabled over I2C.

The 32khz_ap output is typically routed to the AP Processor, while the
32khz_cp and 32khz_pmic outputs are intended for BT, WLAN, BB,
or peripheral chipsets.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
index 65b000df176e..ca6ebd8a9d62 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
@@ -298,6 +298,13 @@ max77686: pmic@9 {
 		reg = <0x09>;
 		#clock-cells = <1>;
 
+		max77686_osc: clocks {
+			compatible = "max77686-rtc";
+			#clock-cells = <1>;
+			clock-output-names = "32khz_ap",
+				"32khz_cp", "32khz_pmic";
+		};
+
 		voltage-regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "P1.0V_LDO_OUT1";
-- 
2.49.0



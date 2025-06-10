Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A079CC71133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1WSJKtNh06L1CyP8FQkWQEN6wo4ZLtufwHyPn7x8ns=; b=WdeEOF9Mv1tVvRaFMm7g2+J7MH
	3+twN+ELI8CQe1jV5hwdvqfHAVDR/ToGEMGL6D+vzLRyLEo9WfhPEGUA2IzCpEoJOXJ4LFfR6omyR
	LGB2/acLcGY8rRdzKlHQBCx1++4GeRKs3cSqq4cx4RV2Ko+IKu5YcuGB6eTy96VpJndMATIbOBPMB
	kJ+os7tZ7WFkrDef0g+EA2ktf0F/bXT1SQrS2sgkwPi6KseOPqwtGjPNSAyfB8G+JXO7xUOO0Zqqf
	BQju0sm07CtuJUgJ7k+TyhsODAIBFV1eTfLt6GJn2HukOqBTvGLcMgcYG7vuglSORTyKf4b39DNuv
	2XX+wi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nE-00000008IEM-2GSu;
	Tue, 10 Jun 2025 22:50:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Kw-000000080k2-2THy;
	Tue, 10 Jun 2025 20:12:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so1845545e9.1;
        Tue, 10 Jun 2025 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586365; x=1750191165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1WSJKtNh06L1CyP8FQkWQEN6wo4ZLtufwHyPn7x8ns=;
        b=U2V3yr3YmDIF3ZPdsUpCaNM8BiPkX1SG/U0Lxn9hNmXd/2IjcMVlAFT+Du2VA7UEjb
         xUOb54xcDgIlIKQaA3Jg1OGuxSlXDBQtDOF0Axp3LFLnGpJ2c1qfrRy74jjgNCjU+1sk
         iFlEfug6ZlHIFsThCOyU08gRfOKPKSxE5s8uNRnId0Buii78EGO4meXcMC6XP+XfSQSt
         ZT732vDGmtv9foVvReWJDjhhLXS9BP4fbteb8H1+sCITkRFkha8tCQiIFMvlsLp/Wbri
         F1lodIEIH4g0O97829ZPGnouolRNv9MhBlKoCDOcXep7OsfLTeitvLEbaLNKrXdes0Sn
         p6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586365; x=1750191165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1WSJKtNh06L1CyP8FQkWQEN6wo4ZLtufwHyPn7x8ns=;
        b=SJiipcm1E2S2zDwcYKA5k14OkaHzxZdNoIOvgSh00jl0L2zODd9Xx5aRXOyF8OtWv/
         blIYa0HpBodDUtm+5IKMawxTHYChl/sHf5FG9ujqgut9znh5gB5m7Q1udmGzXgmnsmOQ
         jqvK8at9z/2KihrYKmEskwpgRvS0Ky9bizlltWRbCIL7LBthv9lOYwA7hA2+KcHYdnKE
         V1wbVJl0O0rQLJAaPv/eJx0EMOQdyzJZjoJ2JfGm5/LKMZVks0kuOHEd8E86s+hhcKJ4
         GROMrreoB3jLnhcEsb71bpKl8GpzpbhxpviHPiNlA7KWcG/V0KvJFkWpEXfgOn/HMJcH
         nH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU46UWHkzfCWMRaf+PmagWEnIePK6fyeCG04+JXlGiMGpIxJGlqccvaiqoFpIa62GUFsQlwcbDGzqIkck4=@lists.infradead.org, AJvYcCXWMnurZ+evj3pdj0uRsHc9mEH7CP0Lzui5hyVG1HQaIBGPIja+PS/1eKyRgKJRO+aH2XHtCC6ooAzlWYVd8lfi@lists.infradead.org
X-Gm-Message-State: AOJu0YxCAWkO/mzRb0sdI5T5C9aVJyUs/iY5rrvZO8m2Oc7lzetRSioa
	MlL9wCPOD9e/5HEN8sk6frp9gF2knvYaDly/sySE2BZleJ35LyyECXhv
X-Gm-Gg: ASbGnctLNdLvtFLJLfrdpgaOnt+OyyVYbgJ1qUNaEAsM/sE2w8F08a6eWy0hLlZ07vB
	zr4d8L6oqanD94cdr8HrB3G7E0jPE+R183WIbdVlNTAzv+ib6XJfjqceno/YBHpucRMM/NudKfX
	hufN9ROaLYTCQlrBSaLidFTWmpiElv+8gJHzXKtwCC3Kt3k2PTAo7Wi4MsnuwJbnxHmEoLmLUaW
	v/3GsjwNMbjRlr6pU8jJMVNuqbDxzDNgA+ShXlp0mgv5F3DwiUV2eQZ9N+5s4RZyZjzRPoVoGaM
	cJ5MxePt6pHERMzpO0PtTtNFSS9hWOOdczNM5S62o7wWpI1kWw0dY7j6tZ4YnlpJFME+ivLUWzc
	=
X-Google-Smtp-Source: AGHT+IHineQrgugs25LCya85uBq6rIjv937s6Fj4YMPKEhIETsihHbGjyPMBhZchKD/YHDl/HXkiFw==
X-Received: by 2002:a05:600c:314c:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-453240b0e39mr7125885e9.3.1749586364752;
        Tue, 10 Jun 2025 13:12:44 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:44 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Tue, 10 Jun 2025 22:12:17 +0200
Message-ID: <20250610201241.730983-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131246_625338_1A9F4C24 
X-CRM114-Status: GOOD (  14.30  )
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

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.49.0



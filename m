Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EC8C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPm0e/JJXYmTtXoApki92fg4KK/rnmg1MG8vP8qKKeI=; b=460JZsmjUVGBOjh5JR25by+vOL
	p9MxTBDxUtkseItc89bK1Ryvjv0aipE7ciDqe5q9Lwsu4LxGf+4LM/6Luaih+tVmyp7n+eQFbEB3E
	8pKVOhS3Jgn7PX3hM+fzdBQNCn2PZLwHNB/Rh7yiPVlcdQ7O17d0bkwZBC5dm3PWgpWuxUNo2tJFp
	Pz6Bz/ukyZOg/64g+fQ8etx3SqOndigRl7Fau7GSAb2GZBFtyM/x22IEKYXD2UeH/QXXXN2byWTwO
	J5XdhF00m4eVx3lX3OH1mdNafIeznRcS3nCkdY1vPGD77d9yZclepU4y29bEyfjqPFXv3zqOqw4Yi
	8m+VZjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nC-00000008IA8-0lHv;
	Tue, 10 Jun 2025 22:50:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Kt-000000080jW-30o4;
	Tue, 10 Jun 2025 20:12:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a35c894313so5202767f8f.2;
        Tue, 10 Jun 2025 13:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586362; x=1750191162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPm0e/JJXYmTtXoApki92fg4KK/rnmg1MG8vP8qKKeI=;
        b=bOvyEjV3/wnMCYhYttcubcr22Q7y932XAq6UAMa0pezYV0nkNrrMum4u/md5LzOpAr
         5WZIJtqy5nnZslek1auC2VYDV+VN3xT8awdO7AB5uYWtYyn54x6o1qr3BnWqyaSMitK9
         lWtFJSdBL0R98jx4y47Mv59j4O/1lhlA8LNmpsWglipixTYGC4wLuCyAFIG+oA4BTV7F
         AdGZKyFw03s3nxKro9nXx8RuDOiQjv6uhFtRsLmQHuMM89WIvIEnck/g9uj17kZDc9oG
         L6/9w4auYeUjlzMqtnhTdiYjD2dFkiGFq1QywHY5xuAHy7WcXcvmmYJ+9Lxe2Qz9TosJ
         RPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586362; x=1750191162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPm0e/JJXYmTtXoApki92fg4KK/rnmg1MG8vP8qKKeI=;
        b=l6D6VP/Cc4rk0x5ktFNw7E8zSeAG8/s44Tv2nTYv2VbdFqjX5cDeEziY1iwylcyYCL
         u9zoDxNjUQmIwJL/mcePec0ZAkhY+YVlvgHejpJ1hR0iImNaAhRF5YH1o4MxOpMSY/Ma
         ybkKlDNK2LK/U5ZP0ZGWTAKYpQ0kKuV3coGKqV3EWFx1fn1L9/3tkiogKL/Q+kdxf0Ma
         U1IWk+RLh5afTjU8DFHg91hcgLC+IhCgfTcr/5/CvkxyD17DqFz9YTtMUaO03UvOe4dF
         ABCgl4oInuT9KSyYsMq3HsD4LqyXgV8fFTVRUC4JSiD4oAUubv+voRzyRlJo0EM6A/Ta
         /+vw==
X-Forwarded-Encrypted: i=1; AJvYcCVfjdGYq4FtFvA0SsWw7R9GC6OAeMlgIBfPfasAb0h3iABYwBxcK8WLsRv7dU/wQ8LVblTMiigQGbHZA/oI6wjL@lists.infradead.org, AJvYcCX8VMuZZUKzpcwzYd/vJ8bQIGKTSY+KRB7hWinNR0OMftSdXDEfSwdu99ZZkC90LxbW4U8nqO8AmHvRVp8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHL5EAWZN9MphjpDnZeSD2CSkz28BAlvVnsvfzkrIA/FUEi5B2
	zUanQ+yL4JV9XBqS71vKXBJJscyArlp6h2F+0MELYpLgcGpJ1ocCjU7b
X-Gm-Gg: ASbGncvZQeAKkNKuulvP2EZMVvUNT8+t6lB+5AIon/wOZeOWVMVVf6JF9g0PkV3SzJ6
	NZcfsHyUF0sCS8NVMngDFnMsJSZSx8IlYRenJq5PYlHuIQ/y/cUQAnCajwbHmF9KpS5xPJl/iUt
	6LGeQN9z+BhKyjSnoRqiXciiEpCZzkwW2fJlqHlp0ZjvWxL8PdGZ1hvuUmfLyyjTTMok9iAUt2Z
	E9wssWkridK9OTvezlPeMFeaVDjNyLXcwhpCBOA4dMNaBWudRFw3vGR8kiNcUnKU84nBEyioISQ
	GS9Y7CHqPfHQ50VRKNOmJh+U0DxHqH0w+JHyB+lk3JU07ANHwbyscPbuzDEinjR6AH+8NvrAkNE
	=
X-Google-Smtp-Source: AGHT+IGeIgB5Jm3zvzqrQCQ5YAuHI//D5pyuMaTvzBfMR1wJ2aI2COqR2XOMS3IGrHzzEanCXEJOQQ==
X-Received: by 2002:a05:6000:430b:b0:3a4:f71e:d2e with SMTP id ffacd0b85a97d-3a558a27aabmr309671f8f.56.1749586362120;
        Tue, 10 Jun 2025 13:12:42 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:41 -0700 (PDT)
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
Subject: [PATCH v7 3/6] arm64: dts: sophgo: Add Duo Module 01
Date: Tue, 10 Jun 2025 22:12:16 +0200
Message-ID: <20250610201241.730983-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131243_753714_205E2F4C 
X-CRM114-Status: GOOD (  12.32  )
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

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..bb52cdad990a
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.49.0



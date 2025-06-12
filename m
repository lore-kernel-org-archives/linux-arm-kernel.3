Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3CEC71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJWz9vWJiXDPslvRljzbQ2vAHgr8xWbGQ+fUKxXPUgM=; b=oMErHGNKVAnzalLEhnjE5/xqLK
	b6hB85aNiRRsEsB4NRbBYsCAZbq8G5IrP2MBoilVFpk9DnH9y+qFVe/Ief/DjU5TY8fY6igi/z+9w
	Bwy8Wv2Pc5Uv14wH5oqVh5Oxdzoz5KmKuwkzRMspx81sI1olmRb+3bbWgKxJshtk+InDZguN6jvrJ
	p2ox112HdRWBHbuDQm4NH4crJmBgg3jbSATYEZyeVn5C8O5y669Vgld2PWo2k8G1pmCvHqiU3eVU6
	vN+8SwSdkONJusbHJD1reIM04ysAZ9lG2swcaw7EXqTV7B34vIDaZpfjUUMiwBQyxmMLAI+GJtXXu
	IhVEpX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowK-0000000EXAk-0074;
	Thu, 12 Jun 2025 20:54:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhyw-0000000DSUH-40SW;
	Thu, 12 Jun 2025 13:28:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so8181065e9.3;
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734918; x=1750339718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJWz9vWJiXDPslvRljzbQ2vAHgr8xWbGQ+fUKxXPUgM=;
        b=Pd4pw7dUkWfUppqy0WpR031v9a+qgpYauq/R+vGQ395Phx5pEcut8vp6ef9S3zQKaD
         tx7+hzGNGDGkBRG3w3UKU56hCbAr56GjieAFDvwHuQrTG/u3EUD1N+h7GGhBaujkxh2f
         OfQALn/itiF0D79YL4UR970JTV2AheaAc+VJ9MtQm08KALAImjfRmy2wpC3JLSvlcB9l
         Zrb4ZiWWQagfuwCQLUYeamiAWLS5YJqlEHHbo93WbrSP166DEC0PBcaKI8C1+1l3Gayu
         eMOKeSUaeqGof6t8hilfSY24CBxBGUHHWKm1bKt/Vp5SK2GXNRD/8nRXwxN9h5p24OiR
         9N+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734918; x=1750339718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJWz9vWJiXDPslvRljzbQ2vAHgr8xWbGQ+fUKxXPUgM=;
        b=cCoRqxCCaJuv55Bx0kcjf6VU4rRmORH6eul8Qxu/Q2ZVJd0l/t1F/s9R2XK8f/6mxO
         6v9Anbehr3dawgA9UDfQTojNW8LAkiYI5ySWd/k9YlwmHS7R9a30McWx+lEz4zTruxRR
         5i93nhaY92ZOGmItdTFv7RwlBR+V70jQyzaxnLGb1Yc74ftrgD6ylWvDDQqMp4Jq1pWR
         ija5d6xzHYAzdSEcgilgYe/apwzsFhnTe854TK5Y96qn7l58rooPyWNPZDQZvufNbLoJ
         tUrS6y2nnKJG5Tpj2qk+B6Og61xIu4IryAdiIDK/OIhms7dSFSu7sLvNPNRhU0CXGg2q
         7QdA==
X-Forwarded-Encrypted: i=1; AJvYcCUhb3QS8k58WcFNd0Vi4PFm2kb5jg7MgIJx4QS7RPPZ67X2ceq/tcSIOuR388lLHcLfOpW0G5qHsmd1sg8=@lists.infradead.org, AJvYcCXQeTAg8k0JSkid8ksumYuNVr56tH6w1Xr62I43ijPryRb9v+Uky+GtCju33TcbuYGwyi1Q+LAYzGwwV4FwN/ab@lists.infradead.org
X-Gm-Message-State: AOJu0YxIXfPDoGuMkc54kOary4BbmF33vvtCdKT+VRKC0+eTF6tuwWWY
	h0Dj/2aNL6VGAyr7W7McX2ouNh6h9id8pboPALVWidSVPkmW04Xcf0JLBDs22eC9pgU=
X-Gm-Gg: ASbGncudLclmHsaEbteS6ef2YD0HdXUarsIO/wE2mB1icace/sS6LPB7WmJ/8qlhQdE
	mta6ALM0ruY+FnEHZ8XHpg/LbwzFpHDd1EctcKB1aphoxDM6DnTrDkFmZVdz/WkbTcDd8rgCqjS
	Le0IFmg2BnC5VnNOxaME9/zr5V/bBuBvzwhhcDtxGsRRD0fIrdMSLt9nv+aema4jaulaOlAgyP6
	whosIJyJeOmkGhXGDRbaFXprdNumWhEyKwFfjX7un5fv4m76Ho1cFb1U3p62LBwebxdZwIVSsEK
	HgPTMflWcUbwo0Ym45/CN4ynaxKx1esRxfowjunRF3/99bCNgccak47Kf+X2En19bo1nxvxwTC0
	=
X-Google-Smtp-Source: AGHT+IHh97fti/JWAbGW2t2YuMyXXMtMWtB9nKhN92ggDlclhSDS35Gf1vxm+RRU+a8WgbLT0c7WzQ==
X-Received: by 2002:a05:6000:2c13:b0:3a4:f902:3845 with SMTP id ffacd0b85a97d-3a5606e0b54mr3212419f8f.21.1749734917376;
        Thu, 12 Jun 2025 06:28:37 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:37 -0700 (PDT)
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
Subject: [PATCH v8 4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Thu, 12 Jun 2025 15:28:12 +0200
Message-ID: <20250612132844.767216-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062839_007907_CC63D5C5 
X-CRM114-Status: GOOD (  14.26  )
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

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 +
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 76 +++++++++++++++++++
 3 files changed, 79 insertions(+)
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
index 000000000000..a281fee0d76e
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,76 @@
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



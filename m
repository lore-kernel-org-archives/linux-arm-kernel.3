Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F93C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vt58qBJVemIGGqEfVTnyjQvkxHCHLvzkYRzz/VP6lvQ=; b=GTju7LewqQnS7hqVxmFW1Ir4Ex
	OY6sAA84hG2iG4GEO8CoPcIqdb08OF0dEr4GfWoBH1f9UTH211AG52PHR78TY+DGN1Xiwo8aBf0sN
	PMp4MYZ2huFdzPop+MVecslAFDxmBaq+XdPJ6Tw2IclsD/228wzo1YFIDIM92HdHGbLoaaJmtKF3b
	sPXu2/DegiDAxDDmO1Kr6GyvnHd28cYcC6heFThzD2EktHpIFVpnEWJ1u71lFiwa8R+BokLiEvGiG
	5H5YriCyZReQ3HLg7QjYWFgRJKFNkS5eHF2qDCbYYUz4IHEqJNzaXI9BHGHAqgO+YbQFBfIT2Hkol
	lvsBBp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFaT-0000000FfyR-1Lr0;
	Sun, 09 Feb 2025 22:15:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSJ-0000000FegU-0Rnz;
	Sun, 09 Feb 2025 22:07:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-436341f575fso44121965e9.1;
        Sun, 09 Feb 2025 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138829; x=1739743629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vt58qBJVemIGGqEfVTnyjQvkxHCHLvzkYRzz/VP6lvQ=;
        b=ngs3y8b9ap1lmvd1LMbAnPdr2x3ou0n/1UNY6cILcLn6s1YWBZA/rdVBAsPUe1C5kC
         mbFt7Ne5ixW/i7DxiuXVRzao0AsThV/ty48XMJNQqK0RWzBtG3ujKuOTs2UWzNgGPIng
         d1ZHCZJUmdCnskPNDQYbiTTOtE53m7Af6j8rO5i1E51RlY7BysQ7njCMlDj//luo+pud
         KzHPSUaKXWTD1H8fW4lH+op8hbkRUUXmvNPKhJq2z5wY/Wnvpofpi+zWQ/h1XIzp4ZSK
         4uJ+UPZb5Ibn5a+tDqnEjXC6rpUH86e5MX35TccvW+AY33LIJUyv9Jauzr+VmRBwX8BM
         T6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138829; x=1739743629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vt58qBJVemIGGqEfVTnyjQvkxHCHLvzkYRzz/VP6lvQ=;
        b=TvSAVgyT3kE+gkNTpqD7zOw7Vx4MDcCNWU36B3NLqwDL2f4x0IdpSWEat9N1M0V3/Z
         OvU0f0pxBtZkSa6MdMAJqJk+DJnO7+Asd+1Y+xn7txemhRg+Y49E4TbRX+d1p+8IUVpG
         FxWE6vbzdErx4hc0xW64j2Y1hpSAkQmeu/RTVxc2Hb1hQBcL1vUg94x+YdxfiHyX3926
         KF3DFrIv10sw7J5KW4Rd5eVEVkvJrS3xRtghgTvzoHEh2kmFunVqbKRKY5QqJqk1IK/L
         G/AbqDUf53zvllYBfPNRELcLVNrgsgZWrbbqx5VdXO8V97oohUqLyfNWxiArHuKfT+uE
         DZYw==
X-Forwarded-Encrypted: i=1; AJvYcCURPeGyXlqx6fzKv9x/9AHiY6fS8ALSlm+PGIyiac0SHBUo91jR83vI6lz1clf5/zPN72ZtKX8RNgOjLdo=@lists.infradead.org, AJvYcCWU0J1q0cpud/YcBr9PcNv/dRST07sYazqjvkQUZmuZEqEEx8u/iXgLmXhbw92rLK/KWFE5M1EftWmXU0nyzsXr@lists.infradead.org
X-Gm-Message-State: AOJu0YwWawPWhnVsHjyDjSd5YUgk6LSsWvIX9j4UIP7KIyJX8Kl7yvzB
	EyaKTSJe7+Vv7X/P62tdab3dGx/O2vD708xMEeJjfQRfGsLETw33
X-Gm-Gg: ASbGncuURKbCuhkOV+r5Cry49s2xp6//f0TjIr1+x+aOOZyihAX4Z1sCrJK2WPZjpYc
	+GEk7xdfsWgapaYFIY9haCGcnQmDtF9VtNjQZO7uCa9dxRdqTJYC34np7ty48ntN+LGVVyiTnVV
	LMKx7JZEAcu7EHMhyxGOfue4ZNgp5dPeH6L7T4q1xpBF50KYDOEe1eEmaYYqlU0DRkgQ6u9wj3O
	AZ64WCg51ytg+LnKdHdyj9z8ZJrDe/vcTTa90OkLrY+VUyA9h6t4lzQLY7EfFg8GBdoIqnzdyg7
	SIhyuD7grhDK+baTeNbs5X9LQFvt
X-Google-Smtp-Source: AGHT+IGlozVsf/D6m3LbJIZJ2CuRmWh8Ek+/gWJZ7Ur5gu6Hztc8qhcrFEYMzrN7igLcyNVl56iqCg==
X-Received: by 2002:a5d:47a6:0:b0:38d:d9e4:9ba6 with SMTP id ffacd0b85a97d-38dd9e49c91mr2505479f8f.3.1739138829351;
        Sun, 09 Feb 2025 14:07:09 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:08 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 05/10] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Sun,  9 Feb 2025 23:06:30 +0100
Message-ID: <20250209220646.1090868-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140711_144758_1E0A7F9C 
X-CRM114-Status: GOOD (  13.53  )
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
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000_milkv_duo_module_01_evb.dts | 30 +++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts

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
index 000000000000..fcabaf0babf4
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000_milkv_duo_module_01_evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts
new file mode 100644
index 000000000000..f3533892453d
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000_milkv_duo_module_01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&sdhci0 {
+	/delete-property/ status;
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+};
+
+&uart0 {
+	/delete-property/ status;
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+};
-- 
2.48.1



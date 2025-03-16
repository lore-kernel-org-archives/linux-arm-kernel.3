Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C17C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byzeZ9g+q+OgKNQAbtO6VbDB8pMI2PIP6vw/GOpDXCs=; b=4aTd9LmDytYb8h7BKrePwlbzjm
	gBA9f6dt6yE6p8QB6cDMo6DIT2m1RyWUHiRl30m6HymjrumT0/g5McwlPgCqnwWOy2PckaTda7TkI
	e8bSXP9SghLn+QX0UT57y9uBHbGCP8IaqnshQTHPmphHO0B4mcn69psTD0CbIhTv8GhRgyvmqku5n
	oMY7Jjv990bwVdgyLXb+4pLYCPB3S7T/JVcG0Sz8qcpohTTqRvrXDC4Q5WCLue+0WJho9gTSedtP1
	4X8gt6GPgkMGm0lODdy0EC/T2QQJeZZDE9sZPw4vi/gDicv/lG51NBDRR9Vk9p7EaKkKUBRTvcDLq
	olXSyU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tttKC-00000000W2Q-33KM;
	Sun, 16 Mar 2025 19:07:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tttAI-00000000UOH-1KkD;
	Sun, 16 Mar 2025 18:56:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso9482945e9.1;
        Sun, 16 Mar 2025 11:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151409; x=1742756209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byzeZ9g+q+OgKNQAbtO6VbDB8pMI2PIP6vw/GOpDXCs=;
        b=NeEPZkuOO6F2Dy77/+srIK2lZ90U59j58ut5BTjwLnpJsGQGG9oZT1CWcImW6okWj/
         DzWAQrBRAYax0bIf3sR+dcKTHCxKULLxgLDXPf1+xDat2qo0j0FzM4FyPsomkpSCCKMQ
         kmmrre1/6G1+7ZJmpeYxf0lPg3iGzdctq3/p8ZjXb07oShO6Tw7DYpyhOgG7lsGekiW+
         DaqQmZQVaR8Djmy8+D+PIstyUK4Qzcy4v2rNmKORCb6UoPsRYjHHoVh2yb5FMOMhxwk+
         IpbVwxfJvLYzL/lZfSsUWekhm+X6LmtzhZMgMt2/S+lye4JV1lkQn+AYVJ949T3JTXHO
         Ileg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151409; x=1742756209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byzeZ9g+q+OgKNQAbtO6VbDB8pMI2PIP6vw/GOpDXCs=;
        b=jMBxStDLAGGwSHlgPjvCLR3PM50PMDH5I+q9vzcacv6fYPIhLjBD/mn+iVJgJOqxNG
         35oSYjHyZCGpj6z8q0uxs7+em+HyhJrEr5ywWJLkplEHVCo0sSr0+rekhI97kAE8J7ha
         xXQILEBu6PxWkYyPhzzAJyhluP/Ze7a+a+pIbNms9x9RhoJS522GRdxdkioZNnN8TxeR
         SBq4MUhMlHTbCQ8FxJl3XluhYY68oqt4VUvQH5Oy/pvAVeCqkicIEbpTIPPm255CtNBB
         3Puw7zyc3mISWMlhUEVz20ef6i5ccUkThg0BR5g3FptcdKONC1kuQfEUWBmnzLoPVb4M
         nBiA==
X-Forwarded-Encrypted: i=1; AJvYcCVB7gort98zRBaki1R7FDbwPeTYtPdYluvjo24pjmWz5m/4qV/eFGLTE+96a9rfO0K1yckfGI69OgqMrm+neIUO@lists.infradead.org, AJvYcCXVWLigcSD91WoqY26u2c3nLIXvxN5kuT+WfDmM37p7ILBIXiqzeSA1VKf5bckBtcpcMJTF6dGlOBKbjjM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yye5S7bSFLJkpCa/j+uKnnfyjRMu36IkRkEdOpTXe1XGwArdx1V
	cFhjU0k7Ibgxv+f/fj2PHf/0WuJoZZaLYSYw32Os5nSX6m/81+x+
X-Gm-Gg: ASbGncsv4BbS92jyxzYkVlihOM8+90JhpQf/qYtSN6A0d4sj1hMxn2fYD5nVJUS3PJJ
	cRFbTUMKTXioU2WkjHZdPwNJNlce0wOQnkhwH3vNmu83R3qUg1zXofWlOb8iSmvUl4FIe5P0H9Z
	onOo/6J8SWDX/MAvTvLx6ohKP+nDYP4S0DD4+V0lmYcGR1Xl57nA3PCru4Iq5ondPBsMC6F9Aeh
	IbXlH1kacoUvUemjedQyQHef9TNFg9ugTzinQqZ2OzA4xL7O6f5KEWzVIgB2grre4HttL/5lPHZ
	z817VEPOtEtbmiHDeELharN/yVznw9EhYJvU8vkrex5rSWvFfvFUF3bY9g==
X-Google-Smtp-Source: AGHT+IHyIAsL2flJepwd1QARIIgbCY/AczwoRosR63EIuqAqBvEyZG+kPa3KUxlGVA7o4JyQtrlAcA==
X-Received: by 2002:a05:600c:3c8b:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-43d1ecc7b28mr110788435e9.16.1742151408488;
        Sun, 16 Mar 2025 11:56:48 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:48 -0700 (PDT)
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
Subject: [PATCH v5 5/7] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Sun, 16 Mar 2025 19:56:35 +0100
Message-ID: <20250316185640.3750873-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_115650_358530_55EABCFC 
X-CRM114-Status: GOOD (  14.34  )
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
Changelog:
v5:
v4:
v3:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dts not to use underscores;
- added status = "okay" instead of deleting it;

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
2.48.1



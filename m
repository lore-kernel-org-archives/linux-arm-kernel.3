Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FC6C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekGeHvNSL1SlOKhiP/GYIMa5Q3fMVm07N8k+F21EM8c=; b=lWsIbyPGw6AFIs7+4rJhUhrpe0
	SoeesAVBYNeTbMyT5J12PYw7qrZJ9ICcYVQcC9zfUhu2nUmLgd2akc6huiEIBrowwIRId+lFoOS5n
	8Tmb3pmqWrY3oyQ8JdUC1yrBxtrFpmUvgssE4Li/Mt5P7JaBiCfQ6mTfCTmrLDdp2H+xHpAmS60nN
	ZPmX+5J4hXoliMUhQKyKweItJNptETkASUpSgefNJxbBR1Qp0iuFsW7Z1Y/7FB9PN6gx6uhp4+QDa
	OUnL+xva19GzUjlYPgmpfj7xZw7rQhgfanP03BVX5Erg5S7yonaGjAGsInSfT6li2SvTiwY9qBgsl
	Jj7r0QaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowI-0000000EXAC-35vA;
	Thu, 12 Jun 2025 20:54:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhyw-0000000DSTG-0Uc1;
	Thu, 12 Jun 2025 13:28:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-451d7b50815so7850405e9.2;
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734917; x=1750339717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekGeHvNSL1SlOKhiP/GYIMa5Q3fMVm07N8k+F21EM8c=;
        b=Dpsg+OpaJXDZPxeVU5QvBgDjbgsNlGO9UL/Uv04o4daNNIZDu1v5dUf8gzpG2L71PQ
         +BbITLnDUNzE4PWqKVOqqRRz2uuNUozTgLklK0ERUgK8mH6rqdWg/bWXIncwIw6KW8r9
         l5x15/WJg2Cwkq4RzGJeBfTMgwssXnBczaT9zphDC0ZHV8kV6Mqwp4ADqYFf+AsRbzTD
         Sn4nrNSSL+os+IDx6uWMc8rl2v7Lpc04EfTiyvdWpaA14orF1EPPCUjv55z7gydY2Jk7
         WtuXtsFxTvqhkp65icQEeVaNlWXisFVPiRSCrRXPFqo3qNk7w6BFTk0i7y6BOii1Mhhk
         2HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734917; x=1750339717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekGeHvNSL1SlOKhiP/GYIMa5Q3fMVm07N8k+F21EM8c=;
        b=nnC/lRzG72/nS+DS1EmE8NSDpv3BDX4CLz/HEijXXKFo/qXtzq4eX+/tdo2nSP1g6g
         VXGJMBCL/DcwVVN4B6ZKgX/5dvsYiODeI1uoLEcpn3qsS17F4NJEpb4+Et/s37BVBscI
         nK70JOFw1urqd9eDaZQKjrcV8Dnif8uTPxvqSGqODBO8UsoQR1NkWW2fFcQMNYqadAf2
         mD8C0Nzall0EPdIQrTFIOuyN8iDOggagA+wDD8oxLukJ6ZSTHt+7FWqnFNqu18Kc/XCy
         Qy1Ll83EZZNwfuAviRs1pswsZ/X3YTasCtEwHF5rc8l1COXeDjs+ScIfOK/7ZB07RBc8
         GdHw==
X-Forwarded-Encrypted: i=1; AJvYcCVNPsTR1Smp/2/AV3dGltCwj55vgxjEF5uVTmYitEkDmIV/PxaNkZiR4SoYjSFktUovtX6i+X45TkxzIMQ=@lists.infradead.org, AJvYcCXBIqkKOS6E9rTirxtvSmHqyTtQWvVI3yK7ODQCwYT2Hj+bOPuATuZufqZh6Q0bU3iimE+riOCVESQzA2AAJit2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4V1fkLbALcZw1Jn0gBysJUzTvMITa+h9QXNNaW5wlEu1utsQu
	rvoOA7LipewaoAZMe9htMq/LWQ6ltzOrgyviQ5ObLW4tpoH95ZAtrcti
X-Gm-Gg: ASbGncusA74Bi3aemKz1IffMR/mayTu5ecGcIPURw1wMunY/ILXLaxcIF/nP72AN3FO
	Av4oIQuIjRuGnDQX3A+9zMQxTdhKSL5K1hN+TJP558kev9HyCLRyTfd/wD+XeEi0piiuuzwGlRt
	Qi0SG9stVrhaRUqwFaGqKE5m+q6dSToK945AuKj6sDgH9jDJ7dWrya+jRN0wtpjApE1QOp7RAIn
	dT+/YJvnz382H656gSmdhsNaXK4vARvU6OO5H7ipcRD/3cyTsJzZfilxDewrX7cZcg1v9jNWJ9C
	oiEnFxkvX5q4xSyJNpfCk4cq9HKO1drF4OaFE7F3V8lXc/HYutJGaQyxGZBuXMQfWidzn+EdGmg
	=
X-Google-Smtp-Source: AGHT+IEKmn4RY6c+gClx41nLsTgX4Xhg6moGyMTvcwXAQsiQquwBWP5O0+rXDnZmBQl7NLCd6MAESg==
X-Received: by 2002:a05:600c:628c:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-4532b89b7cbmr36923045e9.6.1749734916493;
        Thu, 12 Jun 2025 06:28:36 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:36 -0700 (PDT)
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
Subject: [PATCH v8 3/6] arm64: dts: sophgo: Add Duo Module 01
Date: Thu, 12 Jun 2025 15:28:11 +0200
Message-ID: <20250612132844.767216-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062838_163358_65EE4123 
X-CRM114-Status: GOOD (  12.09  )
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

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..32c988f3c58f
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,40 @@
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



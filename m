Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6C5C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7ID8a2waLPqEy758YEiSSOlOf5nB14uzjzhQ1m474o=; b=ztCbKRofSb0c8jp8X6nEeYY0lf
	dqxT3hkdvaHhybcbhY6oOj5VXYAIsfxGmEBPLqQ0QKZrc32rY5OqZyj7YeDf/6Pl/GoKm8JebCNpf
	3Kox+sykEsYvHB2gPkiBf9qs5phlX1Aqe9ewcUCLgqKFkBXticMyGcfdyDXWU20aMoUJ4aC4vZst7
	ZVIYJ+3tZoRjSH62lmjPveO6Fc1iRyt+I9CzrsS4HoKq+TXD3IVCy6PSlCH/moVOSQsDsbpRVOiW9
	N2EcbOZeFLvQ4VbBdIDEmMGGECcwdwyUWWDGf22K3LakLua5RZ6LiQ2s3SAHUEGVtSRBf3I3SXnIT
	4VU8hH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLZc-000000095pa-0l3z;
	Wed, 12 Feb 2025 22:51:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLSb-000000094f5-0gch;
	Wed, 12 Feb 2025 22:44:02 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5de74599749so291314a12.1;
        Wed, 12 Feb 2025 14:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400239; x=1740005039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ID8a2waLPqEy758YEiSSOlOf5nB14uzjzhQ1m474o=;
        b=I9sZMnew1Gbze0qY+FaOxsgPGfbSC4d401cVQrK4GI3eZyjpocmRIlRNOrbWT9QGCz
         hbz+s3xUSRn9yyasWohyaVGSoNeaNIFUtpTrsNSNTIgwWOwHcjqSj+GdfKLonpApDa+U
         7gAQnOgzuNKYolno/Dk7NdcRw7LBvg7vpOhpH0PBqTW2NJhP/IhlrfAvFTougMu+bohs
         NkrkbtmmIE9JKOs58Cx+1YxAzv9YIhIZMeE6bh9/ztHq4/XiUtxDSlk3vijizAPfFcRN
         BiTrI73mdq4VwElGfq24u3VoG5aWWB56x1v8XSfHFx3K5JH9FyPdrgNjunR4wY8YKopF
         ldNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400239; x=1740005039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7ID8a2waLPqEy758YEiSSOlOf5nB14uzjzhQ1m474o=;
        b=RTUzeYHs41Wz4gGU829Ew1kR4MH5286heI6HZhkaoM8K6TUPMnUajTAS1krb9RZxQu
         nZhGnbP4HAvK3dQhzUDIpaLfugtcnV4NBdc7//7H/CcO9TxNHzyAJJ63RmTDMlcIB2em
         2NFY31Z/nEMh8tLPMiz4TCuhtcStBguuZ7WLqzrQ52+SS9hwQQaE2er+ErQA8ZT3b0Xl
         WbeC3cymsjWgXXOpyOgxxQqwCobY/KY2lpUAUmBuwJEBSczgI+GaQYc5nFeyMu69ICS0
         ftmrqKYu3yWRqJ7pyWhUbOUdPlB8UZpOKuGcNVrXfuVicB6OKCywETeuc9gDWn+eqq2W
         +KCA==
X-Forwarded-Encrypted: i=1; AJvYcCV6EEjpjJb1SmHkkMQDtqDeCuxPJWH0eqwRniP4DEwTuyUvQfJH3wlrfJlTRpndg6fMj7MBVzu8LvG4TP2j/u/P@lists.infradead.org, AJvYcCX3/aysWXJomOtsqXhEjFd889K+MDnGWuhWw1YYmkMc0gdMEyae+kKvS84mZa5M4rhg2zIyIS7HozuTBDs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSjQDegm3UQ0FqilECsjufJyxlx0nV51DqhlSa1wndB32RltQS
	tc2gJo+V01LqIw1BOS258k8e3wHMkL9DcEX/QpHzovSMTNKKPfDT
X-Gm-Gg: ASbGncsVzAfoY0P8hJJOajMObbtY1CobWxokXntbxm9159+A19wkV3hgRTKsOkMdb+l
	vgnuwnbBiwc3b/AwHHNYcTFcfhhIjNxFbhVUV2HFq+8l3oXrBB1Ei7unqcCE1NnHY8+0iIdQEuE
	uFUt1g/ZqWbMVVM8/tFCV0j/8/PlEV5SAQmy6QQbtrZsOK9GlPvLcghW2QZ4tV5ldwMs844iYsJ
	vDKQtqtoyxHenGUeS7VUHn72xrKBiF4nCn7RjLWKIPYFuJkXPGyPeNcOncx6U7uLJkBKy3vPHue
	b6D09D3AnzsXwGmkU+SePcvSo8yS
X-Google-Smtp-Source: AGHT+IGSZ+5NVRXUnv/KzOU2x9ad+Bw0QjOj1aATkZqQoNCOlf3IOiqReQ6AqDastAbMsLDHFKzucQ==
X-Received: by 2002:a05:6402:43c9:b0:5dc:db1e:ab4e with SMTP id 4fb4d7f45d1cf-5dec9d58e89mr699583a12.19.1739400239363;
        Wed, 12 Feb 2025 14:43:59 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:59 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
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
Subject: [PATCH v3 5/7] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Wed, 12 Feb 2025 23:43:37 +0100
Message-ID: <20250212224347.1767819-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_144401_200706_D273B4CC 
X-CRM114-Status: GOOD (  14.18  )
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



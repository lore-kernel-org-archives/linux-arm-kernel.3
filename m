Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBEFE9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UGfmTjjQx0R3K/qzXuIjVo3qjY4VwIiKp8L6tm+HmGo=; b=iKpWXJ+HmYUngZRxcNeLOv1dvN
	pEZL53GLIAJbDk73ASlTEAWa32UQSwQsf4x/3vcyZD6C6Q+6/2Hk9IWfVddgPEJhuMFIHWN0u3Pmo
	GGc4EG+sodwjU0eYtSzPVNLA69P/BZW/WB7xnmNykBsUNyJLHSG5hgf7pkZn0SW//TvIDlFUEs1Xt
	GwCiUTO8fiPbFwutTpHkBdncAMa6yFtiUG4S5/+6dEv5yL8eKe0xquTypxtxEuDiyPsSwmoZ3Hh/q
	dYZ1NWNdOJgnksWdxDIPWJU1sGVXSYN01i9oxyb2F/NbvbytXfgZ/E5U2v3G2C/2CjwNPsjhYxSkU
	xIHGA56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5hT-0000000BXgE-0LtF;
	Thu, 19 Feb 2026 15:12:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5hQ-0000000BXfq-32BT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:12:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4807068eacbso9429345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771513934; x=1772118734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGfmTjjQx0R3K/qzXuIjVo3qjY4VwIiKp8L6tm+HmGo=;
        b=Zc0a6Sva2n2cNfg/nnWc6sBAkls6uRVlQGy9gyJwDZNrq0Cn8W7tZ7wW4i0vPqLGKu
         332lmzmFI0KcM2LEwObMxaBIkD0xFhzlS880CFeK3SPA3/QU+Oa3nmL15Imbryshla76
         U9xVOtX4HCuwsauoMjHSel1OQ1xjP/ier8TEYBKAzjgiOHiUnCeyc5XftL3sy8iF5dqc
         UJMAv5kTnqGOTmwi6CMyH7qHB2oQZ4GNt7lXJ12GjtUQnqx551y6fWU5TQWjj7J3nOKy
         ZcETrTSsFv5SGs34xlATzQY6o4E5JqPUwVbgOPiFNBxwiAOmvOM/Lcb/b8LqjV8eos/9
         STPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513934; x=1772118734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGfmTjjQx0R3K/qzXuIjVo3qjY4VwIiKp8L6tm+HmGo=;
        b=FsK/OQwXB1TZM+yfjdWEM3MyXye9K6/2Xyq3+V6aXBcgbYYYBEZJOLQhzRxJO2jT5d
         dV33Voz6nNyLwCaXjiB6hztZ5K8XWa3RvmnUUbbuktZqVRdm1kB8wkiKEF92J1mYeXcO
         yvs40zPg7y/BYmZv6rO9jReQYduLFK4I8pzzaEjkMzSPcITCuBNfv342MDFpuSWeXTLw
         z2osZ92JZCSmEBXRBG2fJB7OL0QNDUwGI1xPAR+Y/FVYUaNvez+GxdNZBJhuRqlElBk6
         ofXNqSUxAPEtuR59y5bbBMUWJ1tgwd2CAwFvt/UDHNV1pNfQAni/wZ3Fd8KujmT//hbm
         T6TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOgGCWf3/qp0koU3mNJ/IyQu0P9IRxQwwoHoP8QotZyPgGD2ax6FYMRXdNheLaXNHgcFgE4/lDK9gYhj7qu9VH@lists.infradead.org
X-Gm-Message-State: AOJu0Yycee7u1LJER9ee8N85mgl8zN2ALw5wydMbxnDSnXjgr9ymeSWs
	VaCuxw83eyz9rXilEUwhrwJXdVdChVH3loEHUemHfXDpaXzivmtIQgbc
X-Gm-Gg: AZuq6aKbauVCiEvRSCRZChXIDTzjNuV1jsVTJvDun3YE1zQAPvfVs447y0SyednNvuh
	rKB8w1h61kvBuq/paD8bOkimwQMMKAdLD7Sj/C0oU6C2Qs5bgsMiJQ/Whi7vqqS9d/Ie9JVcxRv
	Zi9344diacK07LLZ/p/EaY9kZ0NZzy4ZzWk8sm5kjtF5YVLD0fw6+z0aXeztb3zibRZrHjaY7vG
	OQMvqXcEdKMWk2HOBVX0Qg6qdLV72C1ybj7JwGk3f8hp41nPnoRfUJsBilSA1ipc9vjMCoSRWb3
	rSHO6nAE+1zvy3wZ5b+oz7gA20ke3EdbUwxc9HJsCDKKurBms1uyGzO7mRvxVyj53j/hO9Om2zO
	oU13P972uOlLEdSN/0ztjH5QCfq9YPOZVsOcSl6GHzUSFy/BeUpzOWet7IDDbGi9//9106nQdeS
	7i/lXdXgnNhWU0Zwtu3+CAlRdzGGMhjYsDa2TibIVQS0jaOuMgUJZpKzW+F1ksNyeWoh2hVtX36
	DRSalRB8ywLXEwqzHK+Wxn+D3uT
X-Received: by 2002:a05:600c:35cd:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-48398aefd55mr90529135e9.36.1771513934048;
        Thu, 19 Feb 2026 07:12:14 -0800 (PST)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f990384sm33002245e9.5.2026.02.19.07.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 07:12:13 -0800 (PST)
From: max.oss.09@gmail.com
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "ARM: dts: imx: move nand related property under nand@0"
Date: Thu, 19 Feb 2026 16:11:49 +0100
Message-ID: <20260219151157.2549198-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_071216_845465_DC4F371B 
X-CRM114-Status: GOOD (  13.68  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.

The change introduced a regression: at least Colibri iMX6ULL and
Colibri iMX7 no longer boot with that commit applied, while they boot
again after reverting it.

Although this has only been verified on these two modules, the issue
is expected to affect all device trees using the gpmi-nand driver.

[    0.876938] Creating 5 MTD partitions on "gpmi-nand":
[    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
[    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
[    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
[    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
[    0.894686] 0x000000400000-0x000020000000 : "ubi"
[    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
...
[    0.960443] ubi0: default fastmap pool size: 200
[    0.960476] ubi0: default fastmap WL pool size: 100
[    0.960500] ubi0: attaching mtd4
[    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
...
[    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
[    1.650029] UBI error: cannot attach mtd4
...
[    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)

Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
 .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
 .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
 arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
 15 files changed, 22 insertions(+), 82 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
index f452764fae00..547fb141ec0c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
@@ -36,12 +36,8 @@ &clks {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c3 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
index 58ecdb87c6d4..9975b6ee433d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
@@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
index 6f3becd33a5b..aa9a442852f4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
@@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index f2140dd8525f..85e278eb2016 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "disabled";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c3 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
index 131a3428ddb8..c93dbc595ef6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -260,14 +260,10 @@ fixed-link {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c3 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
index d29adfef5fdb..57297d6521cf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
@@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	fsl,no-blockmark-swap;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
index 40d530c1dc29..2a6bb5ff808a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
@@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
index 776f6f78ee46..e34c8cbe36ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
@@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "disabled";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
index 27e4d2aec137..a3ea1b208462 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
@@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "disabled";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
index dc53f9286ffe..1992dfb53b45 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
@@ -296,13 +296,9 @@ &fec2 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	fsl,no-blockmark-swap;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &i2c2 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index eaed2cbf0c82..ec3c1e7301f4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -160,15 +160,11 @@ &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	fsl,use-minimum-ecc;
+	nand-on-flash-bbt;
+	nand-ecc-mode = "hw";
+	nand-ecc-strength = <8>;
+	nand-ecc-step-size = <512>;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-		nand-ecc-mode = "hw";
-		nand-ecc-strength = <8>;
-		nand-ecc-step-size = <512>;
-	};
 };
 
 /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
index 3dfd43b32055..43518bf07602 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-ecc-mode = "hw";
+	nand-ecc-strength = <0>;
+	nand-ecc-step-size = <0>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-ecc-mode = "hw";
-		nand-ecc-strength = <0>;
-		nand-ecc-step-size = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &iomuxc {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
index fc298f57bfff..83b9de17cee2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
@@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "disabled";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &uart1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 8ec18eae98a4..2d9f495660c9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-on-flash-bbt;
 	status = "okay";
-
-	nand@0 {
-		reg = <0>;
-		nand-on-flash-bbt;
-	};
 };
 
 &snvs_poweroff {
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index a41dc4edfc0d..8666dcd7fe97 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -375,14 +375,10 @@ &gpio7 {
 /* NAND on such SKUs */
 &gpmi {
 	fsl,use-minimum-ecc;
+	nand-ecc-mode = "hw";
+	nand-on-flash-bbt;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
-
-	nand@0 {
-		reg = <0>;
-		nand-ecc-mode = "hw";
-		nand-on-flash-bbt;
-	};
 };
 
 /* On-module Power I2C */
-- 
2.42.0



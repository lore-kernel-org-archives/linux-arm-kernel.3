Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C394109E52C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdqH9GF/jHNSyWBdrNC7S/eoQNumPq7J4tkoPlO6e90=; b=ANjkGL7sBQMLsSQjojbi+36dSF
	Sd7E27skRGkcmIeEgqmVg0ciIeBrCsctFAJG6lTFYljdrv0dpGqjPYdjJNyruXXFLgQGYk3w0gTd6
	p1sq39bKMdLQ2SJ1TdZnxcpz3r3DFYTwcXKYl7IQOTlIJLvXFGmol+uG7QDQeT6WPvlg8KTeQL2xx
	OSBqaQNCC7bj4QTghha2vNeiCw3N3zbplrYNDlAOTobxKdsZUUi+vz2jCELlpc3ySZs3QX6ku6CEO
	BFTiL4LBXBCN+I6zMIfBbFgx1KYek4L3UKpmgvh02Bw1gS2+i7vGd2h1VFb0SG9NpVc5llt+vb2m4
	a8ZeE6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5X8M-00000004Np0-3I6f;
	Wed, 25 Mar 2026 22:55:30 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5X8J-00000004NoB-3hJQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 22:55:29 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-35a288a2c00so162970a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 15:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774479327; x=1775084127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdqH9GF/jHNSyWBdrNC7S/eoQNumPq7J4tkoPlO6e90=;
        b=H2DDSivD2Iw3o1kLaJFilfcmvKZQtBOFU39vNSEHAxx97Z8Z//NV+CQZJ00vJ4Qft0
         fPqTHHFv97iw5DLQ0r2NpNbpr9vOO4hphncoqenke530AScTDfIRccUMn5kxLDShhsWH
         Dqu1Qzg60GGNQy+zfXtsfs/Zu+7rIr+aHS3HCrOzog8JS1iQD4qMNraEbDRHQrki8l4o
         Y9wNMwr45qqso+juVfKd+K0yWpD2A6ZRNjNe5MU+3Pew0yqKG0pu61a4EAcmXLfBLa74
         WB7S2wrA1vyU2EqIyurbUeP6SP/w9P+eKVsHN1b+I7chWZIM/5xp6TYQ7IGq71Tg4uTx
         V2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774479327; x=1775084127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CdqH9GF/jHNSyWBdrNC7S/eoQNumPq7J4tkoPlO6e90=;
        b=dpTeVq9ao2dkGs+ueiRyWaVjIny1cEb0l6ANvB19qj3H003tGp/QvVxzcw5gYbsOdP
         9ypNsEuySkfJNa4Zq6dH2u2ENc0mbFWmiqKgQI+RZ2YhHrdSLduesQAz45SHg8XyHDmW
         UPnL4/5fxyfinJhwb5OjuD5T9dWp/iHbbVbFyCxEs1h+9IPpsD+fah8+ssvSpjvoFjoi
         OPuSMytu8DOzHuKNN2K8rNIWQZVKygmJ3GXUKkJ9tU9FGm32PeOaHZiIlmlfFTX7OeRB
         RsPTzJOM8ZEKcXIMpKSaLxBDKpjvx95OF1yXjU3aqBIednqQT1zAdFRwuq2GACEGr3ts
         fceQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjguT5Vj5T+P+Bzh42DFMvqqZBDAz2mn1z4QVXZSlobgJ0FNIehqESJi3fT21vAskwD7FfniGbx8Bx4MQ7LG9B@lists.infradead.org
X-Gm-Message-State: AOJu0YzTUN7QnmOB17pkh1qH25jDJU4uQ34hIVepCMqA6mSj5HB/Xwff
	tFlvrXm2j/MYVI43QaFCAfB+9C8a1OOfKJg6RXgtKZYPSZthi1n43Pvl
X-Gm-Gg: ATEYQzxr4ybnvtbTIZBTKOHEWYBgL6vUE4pyHdz3f6j+yTNE2mgCc28dTb/rX4tgbBJ
	Gf/ZGL5AUMMXPGh9bEA2CpHk0erw9gZAo/89m73YsmuRj14Tjai40e+X19MylBS4BFGyNZ32m6F
	yU7M+3LYre5JCfG2iqwP2vfEKZKzXIqVtq5GqAF/5bpEaGUo0iZABsUrhtWD54WZTTVWMbn4wBJ
	VGpHbTQZyRiERJpdmUy+QdQR/y+xtXhhce2k+zD6fa2ZML4qR3crvHQYTthQEfAYya7FSsPcT6g
	QriB/O1raBQSzXWEFYK8U22sxAo1rJXYS0HqGeojRs6gDWGvEyMWpe6OvJ2Eva/UaRIshX6HAse
	GQJ4MzCNGE39/P7fF+IvfR+8QUBuZbi4HWCoTZYZwHBfVmdbkHqJnyZuC9FovjcunW0hC2eBoOE
	wWehu4NxguGbyKtoObYhOLO+PA
X-Received: by 2002:a17:90a:e7d1:b0:359:ff8a:ee4c with SMTP id 98e67ed59e1d1-35c0dd11280mr4584019a91.11.1774479326857;
        Wed, 25 Mar 2026 15:55:26 -0700 (PDT)
Received: from arch ([2409:40c2:5018:3ab3:ebcf:9aee:dece:80da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1e1a64absm84066a91.2.2026.03.25.15.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:55:26 -0700 (PDT)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xuwei5@hisilicon.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	zhangfei.gao@linaro.org,
	linux-mmc@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	rougueprince47@gmail.com,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: hisilicon: Rename dwmmc nodes to mmc
Date: Thu, 26 Mar 2026 04:24:39 +0530
Message-ID: <20260325225439.68161-3-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325225439.68161-1-rougueprince47@gmail.com>
References: <20260325225439.68161-1-rougueprince47@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_155527_922925_08BB4E3D 
X-CRM114-Status: GOOD (  11.43  )
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

The core mmc devicetree schema expects mmc controller nodes to be named
using '^mmc(@.*)?$' pattern.

The legacy Hisilicon SoC files (hi3660, hi3670, and hi6220) previously
used the 'dwmmc' prefix for their nodes. This caused warnings during
dtbs_check.

Rename the 'dwmmc' nodes to 'mmc' to comply with the standard schema and
dtbs_check warnings. The legacy phandle labels are kept intact.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
Acked-by: Zhangfei Gao <zhangfei.gao@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
    - No code changes.
    - Collected Acked-by and Reviewed-by tags.

 
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 957a1b41f19b..374aa173bec6 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -1057,7 +1057,7 @@ ufs: ufs@ff3b0000 {
 		};
 
 		/* SD */
-		dwmmc1: dwmmc1@ff37f000 {
+		dwmmc1: mmc@ff37f000 {
 			compatible = "hisilicon,hi3660-dw-mshc";
 			reg = <0x0 0xff37f000 0x0 0x1000>;
 			#address-cells = <1>;
@@ -1075,7 +1075,7 @@ dwmmc1: dwmmc1@ff37f000 {
 		};
 
 		/* SDIO */
-		dwmmc2: dwmmc2@ff3ff000 {
+		dwmmc2: mmc@ff3ff000 {
 			compatible = "hisilicon,hi3660-dw-mshc";
 			reg = <0x0 0xff3ff000 0x0 0x1000>;
 			#address-cells = <0x1>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 886b93c5893a..0db1849a2878 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -679,7 +679,7 @@ ufs: ufs@ff3c0000 {
 		};
 
 		/* SD */
-		dwmmc1: dwmmc1@ff37f000 {
+		dwmmc1: mmc@ff37f000 {
 			compatible = "hisilicon,hi3670-dw-mshc",
 				     "hisilicon,hi3660-dw-mshc";
 			reg = <0x0 0xff37f000 0x0 0x1000>;
@@ -698,7 +698,7 @@ dwmmc1: dwmmc1@ff37f000 {
 		};
 
 		/* SDIO */
-		dwmmc2: dwmmc2@fc183000 {
+		dwmmc2: mmc@fc183000 {
 			compatible = "hisilicon,hi3670-dw-mshc",
 				     "hisilicon,hi3660-dw-mshc";
 			reg = <0x0 0xfc183000 0x0 0x1000>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index f8b56d443850..61eaa7f8c1c9 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -799,7 +799,7 @@ mailbox: mailbox@f7510000 {
 			#mbox-cells = <3>;
 		};
 
-		dwmmc_0: dwmmc0@f723d000 {
+		dwmmc_0: mmc@f723d000 {
 			compatible = "hisilicon,hi6220-dw-mshc";
 			reg = <0x0 0xf723d000 0x0 0x1000>;
 			interrupts = <0x0 0x48 0x4>;
@@ -812,7 +812,7 @@ dwmmc_0: dwmmc0@f723d000 {
 				     &emmc_cfg_func &emmc_rst_cfg_func>;
 		};
 
-		dwmmc_1: dwmmc1@f723e000 {
+		dwmmc_1: mmc@f723e000 {
 			compatible = "hisilicon,hi6220-dw-mshc";
 			hisilicon,peripheral-syscon = <&ao_ctrl>;
 			reg = <0x0 0xf723e000 0x0 0x1000>;
@@ -828,7 +828,7 @@ dwmmc_1: dwmmc1@f723e000 {
 			pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
 		};
 
-		dwmmc_2: dwmmc2@f723f000 {
+		dwmmc_2: mmc@f723f000 {
 			compatible = "hisilicon,hi6220-dw-mshc";
 			reg = <0x0 0xf723f000 0x0 0x1000>;
 			interrupts = <0x0 0x4a 0x4>;
-- 
2.53.0



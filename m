Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4DCF483E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5NEDQbOtjDud7bnDY+GwHBPLXpf4/JRpvLsQ7SzQtg=; b=X51F0tp0NfFwsbshfPDn7fHKoM
	DG2nf1um123Jup7SN////YRXNFyScfnnAQ/5WNwN+2PpWgZYoQp+3rm2XmTxHsbsNhTzPWdYb8lis
	Zj7afZ9Ok7y3nlKwyNi0bDD4RyQqK2bjGAi9oguBlQmCDvLdWbfObkTYKQ3gNTWQRGo0c4pD01JpR
	98taifhW10lJ2Fv5QssFURDdmhiKdgttmy3FNxtXnmKxukBUppKSEIPzc/KvWwgLEfAnU/voVGjSV
	QYbn/E1lQhe6WrZOc0hsckl6xIOuN16AU3sQ0IpE0DTjX/S6+2SHJaS+TklaIga43AM0jFerPGaQu
	jZIhk+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lCp-0000000HUfm-242S;
	Mon, 23 Mar 2026 19:44:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lCj-0000000HUd2-3BPr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:44:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2addb31945aso33639115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295089; x=1774899889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5NEDQbOtjDud7bnDY+GwHBPLXpf4/JRpvLsQ7SzQtg=;
        b=alSX9tyN5RXmaMDPvtxkby08pj56at4zMsn0xqxNRkfSCCMQKIgTWiUB4LC+LJexYN
         OnGVWit4LNyem6k5lvlsadBb+MVgO7Sr5guoVxSH50w61vv7X5kzGB1R4GxFE7FAibLR
         5kmXTUW2LGTsm3c/VfL0orwmNUALZU/aiIGlo3FlYaLlTOVn0erQMMYu0BAhthgvP95P
         9UDsoGgvVzt5kMmjBvxbOJSvGgXyiMMecLvXmMIlfiNVyVpYgPrPEpUD4qMdtPSAqH78
         zD36lgFGl6O8eogZXOis8Z9jmDYbMzDTeuAprQwsbgBUSMd3LimKjT5/drnhKW5zIOGk
         2jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295089; x=1774899889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5NEDQbOtjDud7bnDY+GwHBPLXpf4/JRpvLsQ7SzQtg=;
        b=ZBIPYoJEnBjQ0k+bO1ymDTBocw0S25jk2TS2VXej4aIruK2lhOGCqp1Lh5YqDwMczX
         xyRr7uoSmMhg1Bueeb0r/3g3aSdBA+iv98vohPO4lT328Ac5B/1tknyNzLcwZ4zjzU0y
         sY60YDiVZ+fanxZ5V/7CQeK6xmBodMp7OYwqoXwr+NMRq7bo3uZeL2VU54JBtTCw2oxV
         UI6kaJJrRlHX1pSnna3N1ElwCH/i0ACx0hj5K/RVYZ1B5qoAJR2c4uJ3UTX6E1+DRMzc
         lQncZU5jn70HVefkrX2UDvOjfI1seSoY8ckJBQD0PEwc4iW2+BN0rmJo3gzW5wrs7vlN
         POQg==
X-Forwarded-Encrypted: i=1; AJvYcCXPhf2bwKxck1KpmaJtmmge/oc0dF2chkoPjXX7Ol9fjzOjACvlcNYPy8hlZ43VIaySCWbhkex9AVvjEi7oUryk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/F/pdvTISBF7NfnrPpg5SY8eHbVB8d2kG1jkcHaLY1tZmpXFy
	sDAy9IscvP8teRPn0LBdxIwbFOpJ8xqo1zq2lESYUgFwyTViz7Z/DDrr
X-Gm-Gg: ATEYQzwVWx9qduZe+F3QBvsa29jamLy14cAJ7brC+y0pl6yTWVJGJycNRYMko1PGCWA
	hIUfN7lGpHl+LRWVFaXmvfE4RBaFvqMZnbEl64q11A1bZpU6ElEEAFG8wXI+4wP63M5PWYlG7j4
	jX99uNjoss5dVp7W7HAczzI7G7FpgiNt00a7oQpDJIc1qbwb9yQYQJ7LBwrxKHUyR66K3LFtCid
	LDHP71gKsduLbB3AAhhDwuII87Pxv76VjI1KdS7LWAgYH+1spuj5U3Al8Rj8jHGho8wKW0PgSDT
	Znod6Y/XlCwodpEOzy73Brcd2QMSaQP4JMAN8aWv3tmEtw0QINC/+oZZ1Uz71TbMcPjT6+rNdu/
	KTKaoupH35ruycvcdEJ8ms7xzlmmH15B0eE14/CP1K4Nm4jeLAWCE61mPduVZzBuGhxwNMQHl2D
	1wMtstUzDgDmyzntt3qpHtl+mTjeKiLNdNUw==
X-Received: by 2002:a17:902:c950:b0:2b0:60f1:de58 with SMTP id d9443c01a7336-2b0827d1a18mr131462675ad.45.1774295088929;
        Mon, 23 Mar 2026 12:44:48 -0700 (PDT)
Received: from arch ([2409:40c2:5005:bea7:1ec:aaa7:ee5b:2371])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm152080805ad.60.2026.03.23.12.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:44:48 -0700 (PDT)
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
	rougueprince47@gmail.com
Subject: [PATCH 2/2] arm64: dts: hisilicon: Rename dwmmc nodes to mmc
Date: Tue, 24 Mar 2026 01:14:00 +0530
Message-ID: <20260323194400.22886-3-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323194400.22886-1-rougueprince47@gmail.com>
References: <20260323194400.22886-1-rougueprince47@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124449_798099_C04FA3D1 
X-CRM114-Status: GOOD (  11.40  )
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
---
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64FBCAC593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg8MFO3EvcQCH2GMBa7esLpNK5V25mOJPytVnl79R0w=; b=Rh8GauOkMBtoH41H1ChMycluT1
	TyoDz9NuuERWN5BP0I94+iJfPVepUhYkWCImi/0FDw79mgmQj4Bi60curyaaSJ+91oBqmIWPIYW6T
	cV/OZjJr9ICC2ZKwKnadqK+nMV7ZxFCiJeYrg2yMDriDovmcY0By8gozNvJFm7TI3GVAWxCbf5jgU
	Y++yef7DOa/VtWXxfAUly/x4zGCxuu+PfFvqUO8oheDfZmgoS/71DLvvUYV42+p8eCBDb1ioHUFNB
	J5b9aQtZV7N41EUb8kE/1rhoK770uKkc7eetcohy/YiAXSeBb5SvMrXzsGDJ2PHGOydNqBvDi9SXs
	GgPlno/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi72-00000003UfT-39Xm;
	Thu, 11 Sep 2025 14:17:24 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwi6u-00000003Ubp-1BGw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:17:18 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250911141713epoutp01842c1d5130077e61faf13c5fa00437b2~kQBmq4MgE1217312173epoutp01h
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 14:17:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250911141713epoutp01842c1d5130077e61faf13c5fa00437b2~kQBmq4MgE1217312173epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757600233;
	bh=Jg8MFO3EvcQCH2GMBa7esLpNK5V25mOJPytVnl79R0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y3XUE5wEkA3/opDPTwcYqxbUqa35BrKznBmAnVJS+PkmoPxis/HGSYrT/wEJ44HbF
	 D0VP4EfpFp4e6oYY2Jls8p0Miujma/+3bP8FbtwkSr8nIK1XFJZvaMrwToBvSsdw2C
	 36zc+WS8zW94Db4PdybebVkKhn7Q9FT033EgTBK4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250911141712epcas5p36d9f96f77cbd7fc897d915f22de68fa0~kQBlhE0bP0750507505epcas5p3Y;
	Thu, 11 Sep 2025 14:17:12 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cN04R2NX1z6B9m4; Thu, 11 Sep
	2025 14:17:11 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250911141710epcas5p190bae9561e3886250c74a9e11def935b~kQBjrqDaJ0925909259epcas5p1F;
	Thu, 11 Sep 2025 14:17:10 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250911141706epsmtip127af8a1ef2bade909c2937ce4b346240~kQBgOqSyA0081400814epsmtip1h;
	Thu, 11 Sep 2025 14:17:06 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, jesper.nilsson@axis.com,
	lars.persson@axis.com, alim.akhtar@samsung.com, arnd@kernel.org,
	krzk@kernel.org
Cc: andriy.shevchenko@linux.intel.com, geert+renesas@glider.be,
	thierry.bultel.yh@bp.renesas.com, dianders@chromium.org,
	robert.marko@sartura.hr, schnelle@linux.ibm.com, kkartik@nvidia.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	ksk4725@coasia.com, kenkim@coasia.com, smn1196@coasia.com,
	pjsin865@coasia.com, shradha.t@samsung.com, Ravi Patel
	<ravi.patel@samsung.com>
Subject: [PATCH 2/3] arm64: dts: axis: Add samsung,exynos8895-uart
 compatible for serial node
Date: Thu, 11 Sep 2025 19:46:04 +0530
Message-ID: <20250911141605.13034-3-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911141605.13034-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250911141710epcas5p190bae9561e3886250c74a9e11def935b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250911141710epcas5p190bae9561e3886250c74a9e11def935b
References: <20250911141605.13034-1-ravi.patel@samsung.com>
	<CGME20250911141710epcas5p190bae9561e3886250c74a9e11def935b@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_071716_635703_074AC03D 
X-CRM114-Status: GOOD (  15.93  )
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

Add the samsung,exynos8895-uart compatible in the serial node
and also add samsung,uart-fifosize property.

This is to remove the axis,artpec8-uart specific code (which is
kind of duplicated) from the driver and use the other matching
exynos8895 uart code for ARTPEC-8.

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
index db9833297982..0f018b258b60 100644
--- a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
@@ -223,7 +223,7 @@
 		};

 		serial_0: serial@16cc0000 {
-			compatible = "axis,artpec8-uart";
+			compatible = "axis,artpec8-uart", "samsung,exynos8895-uart";
 			reg = <0x16cc0000 0x100>;
 			clocks = <&cmu_fsys CLK_GOUT_FSYS_UART0_PCLK>,
 				 <&cmu_fsys CLK_GOUT_FSYS_UART0_SCLK_UART>;
@@ -231,6 +231,7 @@
 			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&serial0_bus>;
+			samsung,uart-fifosize = <64>;
 		};
 	};

--
2.17.1



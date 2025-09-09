Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC1ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miK6UxLdZfTtLSDYf8EyocEMRLQp5DEigZYlJKLzNHg=; b=KJ+XHNIH3LhZ302MuOL6O5Dt5h
	SpG+QIQwQdzS5E6QtXWGraiP0iZ0AUQwVnIgJZ+szkCYlsl2xfdFRvImBbzpj2ZmJ1c3qYKYrGzDQ
	HVZIocm2KhwhOIsIAuFEcDPFh3637wTfyg9MCW6BHqQyhDP0HzqanJLb0yDiTraRoMec65yU0FzJi
	6nCPIwUudHMerCa/nvPDmCpobmjc3rCjvgY9dtZ/CqZOkgWqaDJ0FY/9nvl1zEE4NE3Fz21CgSswj
	CpGjCHmGEAqGDyWvVwbSfcQ3ytb214F9KjT4nku2VpXYq4DkfFaA9g+pmnRLfH4Wq7mjgoohRWXhG
	Hj3cLFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtND-00000005RLl-31tu;
	Tue, 09 Sep 2025 08:06:43 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvqAt-00000004FET-065F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 04:41:48 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5894fiSV256664;
	Mon, 8 Sep 2025 23:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757392904;
	bh=miK6UxLdZfTtLSDYf8EyocEMRLQp5DEigZYlJKLzNHg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uYeuTOav/56A37mhUr/3ZUdxgL1xfQ5pQw9crD4t2lJ2uhQTzZw6cN41WKKKRwVPi
	 Dam7cKwYQEL32twh4PKUiCotjJk8Q3VAx04dCItBstkraDE2aaC8IzjfFYJYArnbqe
	 YBrSbizu5gzhjQIaK7pw0J8fgKGcwiPDGFgMcbqk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5894fisP3511819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 23:41:44 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 23:41:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 23:41:43 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5894fAkG2012008;
	Mon, 8 Sep 2025 23:41:39 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <u-kumar1@ti.com>, <sebin.francis@ti.com>,
        <k-willis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>, <a-kaur@ti.com>
Subject: [PATCH v6 4/4] arm64: dts: ti: k3-pinctrl: Fix the bug in existing macros
Date: Tue, 9 Sep 2025 10:11:08 +0530
Message-ID: <20250909044108.2541534-5-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909044108.2541534-1-a-kaur@ti.com>
References: <20250909044108.2541534-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_214147_151355_3F5ED2B1 
X-CRM114-Status: GOOD (  10.47  )
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

Currently, DS_IO_OVERRIDE_EN_SHIFT macro is not defined anywhere but
used for defining other macro.
Replace this undefined macro with valid macro. Rename the existing macro
to reflect the actual behavior.

Fixes: 325aa0f6b36e ("arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros")

Reviewed-by: Kendall Willis <k-willis@ti.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index 8ce37ace94c9..e46f7bf52701 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -88,8 +88,8 @@
 
 #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
-#define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
-#define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
+#define PIN_DS_ISO_OVERRIDE_DISABLE     (0 << ISO_OVERRIDE_EN_SHIFT)
+#define PIN_DS_ISO_OVERRIDE_ENABLE      (1 << ISO_OVERRIDE_EN_SHIFT)
 #define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
 #define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
 #define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D933CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 06:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmY9DUK5RkcdEZJ8Yi/upFZ9xXuOGPE9LZUfMrKallU=; b=07kxHzAjcnZEn2P5qzNE1OYeOW
	oZ2jPpUXLT8VA6YlRIVflJ11RAaVRf91GhUWaAfeLhzZho2OBgVN1/qVDlAusfi9a9tlzLQbCqpQT
	/trx+L8HdQ6xHWBeh/dy8CNKnWxL8PmaEU3VpiUy4Pzwm7sLG+IQUMAxEWyEGMpwgMT+mW78nhksy
	KXyOrxOPUqsIH2K4nxr4m0GjHhFA9sA987IVOJ6B7D9xE3fsj6jT8BYDtN6dWEjy/o1EH8YDH+OtB
	xiGWmwNOC1wf/OJ8F1FZfSV0HCJFWhI3Orv6HLzebmaEoFm/iI2gVNUDdEUXA6XSGjS/TJGdKI5tu
	ZPXacwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uth3U-00000004g2l-2NZm;
	Wed, 03 Sep 2025 06:33:16 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utgvy-00000004cbW-35hj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 06:25:32 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5836PLUA3161908;
	Wed, 3 Sep 2025 01:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756880721;
	bh=LmY9DUK5RkcdEZJ8Yi/upFZ9xXuOGPE9LZUfMrKallU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wHm5jQxNq8oOokqf2CPxE9OH4grQ4dLNGaDz1fjezfUo68QgBBOA+ETvo/kgVYowg
	 IhHRHyZXdfeqqR+oni9cBYxzA3Iq5O0IsJf4lp3CmETnAj/vJxELLyxxx+FXExYN+Y
	 Lp7C+M7ryd3u/dTLJJsNCFEscuiteU2JPXHFTBQ8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5836PLNN3315610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 01:25:21 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 01:25:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 01:25:20 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5836PJwc1116011;
	Wed, 3 Sep 2025 01:25:20 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 1/2] arm64: dts: ti: k3-am62a-main: Fix main padcfg length
Date: Wed, 3 Sep 2025 11:55:12 +0530
Message-ID: <20250903062513.813925-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903062513.813925-1-p-bhagat@ti.com>
References: <20250903062513.813925-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_232530_864085_8F6C01EF 
X-CRM114-Status: GOOD (  11.85  )
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

From: Vibhore Vardhan <vibhore@ti.com>

The main pad configuration register region starts with the register
MAIN_PADCFG_CTRL_MMR_CFG0_PADCONFIG0 with address 0x000f4000 and ends
with the MAIN_PADCFG_CTRL_MMR_CFG0_PADCONFIG150 register with address
0x000f4258, as a result of which, total size of the region is 0x25c
instead of 0x2ac.

Reference Docs
TRM (AM62A) - https://www.ti.com/lit/ug/spruj16b/spruj16b.pdf
TRM (AM62D) - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf

Fixes: 5fc6b1b62639c ("arm64: dts: ti: Introduce AM62A7 family of SoCs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9cad79d7bbc1..260279702c01 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -267,7 +267,7 @@ secure_proxy_sa3: mailbox@43600000 {
 
 	main_pmx0: pinctrl@f4000 {
 		compatible = "pinctrl-single";
-		reg = <0x00 0xf4000 0x00 0x2ac>;
+		reg = <0x00 0xf4000 0x00 0x25c>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
 		pinctrl-single,function-mask = <0xffffffff>;
-- 
2.34.1



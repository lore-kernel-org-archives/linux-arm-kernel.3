Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BD8C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 06:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLwho06vrhR2st2QbPaI2lCYTW/PqUtL05pCheR4f6I=; b=wvorauABKjtA9lhNDdfrT9Nalk
	8yJlnFWgT0NwWaQm0avrX9YuETRKQjMt/fvhXFFgWZudu2FYh8CRna6dBEeL06kQ5jR+HXgjdXONn
	e9KIwWHwB0Ab5z7HELImsa+PwVZIox8924yORkBOEpHh3i1NPGpyqtEKbjBlP9o5MuR9Z5YQqtw+S
	O6tUpHUdQJteU8OYXYYGF0fAL/yz1p9od1JPidm3KN47ydGvRacJbDDUNNIjldWTXeRj5D1MiBoQ3
	7bfn7R39IymMtJjRmdGkX8CTPSc6Nw/ZMWH/rF2jw4xLHjcICQh54N32VG9oLl/lop4fO1gI+TFjp
	t9rQZOGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4Il-0000000EsEg-2Hcx;
	Thu, 05 Jun 2025 06:42:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4CG-0000000ErlG-0mdn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Jun 2025 06:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZLwho06vrhR2st2QbPaI2lCYTW/PqUtL05pCheR4f6I=; b=gtmKKQ1OiA15xtyiHGLdp9SoZa
	Ph8LfHsDfz7vSwAOO/YqQeyk3LiECw3dkDTVikgO8VDa1cj4blbhSMZzpuCBIweYEkdDDZnog2RFU
	1FlfFDvgXrARw9ioHpUR/yvJXXjpS+ZLCSybG7AE8h8y9OtMGbzf1/Lrg3s/Xo8njfD4W2nONiXRL
	jo3RhfbQm/XgBb948gY1rCjS/zXaYHZxn/rI0kHfu7Nb1CXHRIAzwS4yqKy6Hxvyr/Act+h1xvWSk
	pKI54MoJUhMZTCZJtQWHGwQuFTIv98KbRAfn9Ee96bq0+BEQApHKaqBFmL3keLozYczE6evu4zbjq
	V/ztQ3dA==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN4CD-0000000158n-29cJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 06:35:27 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556ZJwj1031528;
	Thu, 5 Jun 2025 01:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105319;
	bh=ZLwho06vrhR2st2QbPaI2lCYTW/PqUtL05pCheR4f6I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JHy/TmF+N5zOIkgG/JkWvCtoShNuSUSQ4WJlDioN7kZzmDai/icZz1q1MkLQpIER/
	 +YrJpdo5B3rdtyjoEuHKFUjtY3zzoUvv2yZf+K+MKfZUVgBc5WRyf5V4gBJKGKNndQ
	 D5CDbJCVS0142sBuXczgvNaBOyK8NPXLfcn4iE0M=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556ZJY3948598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:35:19 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:35:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:35:18 -0500
Received: from a0497641-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.69.37] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556Z7Va3168702;
	Thu, 5 Jun 2025 01:35:15 -0500
From: Neha Malcom Francis <n-francis@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH v4 2/2] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add PBIST_14 node
Date: Thu, 5 Jun 2025 12:05:06 +0530
Message-ID: <20250605063506.2005637-3-n-francis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605063506.2005637-1-n-francis@ti.com>
References: <20250605063506.2005637-1-n-francis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_073525_850170_D468EFA6 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

Add DT node for PBIST_14 that is responsible for triggering the PBIST
self-tests for the MAIN_R5_2_x cores.

Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
---
Changes since v3:
- add support for J742S2 as well by moving node to common DTSI

 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 1944616ab357..50954e9d5779 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2670,4 +2670,15 @@ mcasp4: mcasp@2b40000 {
 		power-domains = <&k3_pds 269 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 	};
+
+	bist_main14: bist@33c0000 {
+		compatible = "ti,j784s4-bist";
+		reg = <0x00 0x033c0000 0x00 0x400>,
+		      <0x00 0x0010c1a0 0x00 0x01c>;
+		reg-names = "cfg", "ctrl_mmr";
+		clocks = <&k3_clks 237 7>;
+		power-domains = <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>;
+		bootph-pre-ram;
+		ti,sci-dev-id = <234>;
+	};
 };
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4413CA0EF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXRkk2zDcggKtqTefi0QIESttIf8M0uGEmhb4YEPw9E=; b=H0J+6UoVdoOC79fNf0GGjhywXL
	4J8LH2GqmEUppwmSlF7iuWdZ4lEr5zxaf/4mnOWLBtkMUZNkuvvECe5XBXJtBuoFLomGoBEOAP6ED
	OaZi9F1RNcSQSmOcumjKnpqwjXM+sn4xYkhFDIVT1ZycyOEnMS3aEr3Z+BFDRtLSJDcXG0RLenX3c
	e6Dw65+hmtTS9nI1NpzYmp+36xppegWfi0baEiE9jXPOj3ZjzWxoF872ETkPTB7NjjiLrYZjOHjyH
	k02UMET0ymPbzJ+FtMdpl+6zdaqLBvKbwLjWfH1YoKvmuG+ZpIp681AYmDEdV8/hkosX6CIgXTg4+
	Axn27G8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Ny-00000008i7P-3MSM;
	Mon, 18 Aug 2025 21:27:22 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5VA-00000008VlG-2DtS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:42 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IJQXQe2784525;
	Mon, 18 Aug 2025 14:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755545193;
	bh=UXRkk2zDcggKtqTefi0QIESttIf8M0uGEmhb4YEPw9E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=g5ZitLUMZVY9XhusOnJzaZgC1dVg3TOVuLIw1Yth2hbrBTzQqnOshzzCjp4gkVGox
	 9DdrO9tyNhC3l5IyFmx5mhBAztHm+ilBLZyRAZWb5fdIECK1XGlidR/nUWUl1KUhqO
	 Y6eFxa7yK/sUNchkvG0VhP+eIMIJioPNoTbFoOik=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IJQXMO039962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 14:26:33 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 14:26:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 14:26:33 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IJQWxY1525949;
	Mon, 18 Aug 2025 14:26:33 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Bryan
 Brattlof <bb@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62p: Fix supported hardware for 1GHz OPP
Date: Mon, 18 Aug 2025 14:26:32 -0500
Message-ID: <20250818192632.2982223-4-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250818192632.2982223-1-jm@ti.com>
References: <20250818192632.2982223-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_122640_613568_F4A5405F 
X-CRM114-Status: GOOD (  11.73  )
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

The 1GHz OPP is supported on speed grade "O" as well according to the
device datasheet [0], so fix the opp-supported-hw property to support
this speed grade for 1GHz OPP.

[0] https://www.ti.com/lit/gpn/am62p
Fixes: 76d855f05801 ("arm64: dts: ti: k3-am62p: add opp frequencies")
Cc: stable@vger.kernel.org
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
index 202378d9d5cf..8982a7b9f1a6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
@@ -135,7 +135,7 @@ opp-800000000 {
 
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-supported-hw = <0x01 0x0006>;
+			opp-supported-hw = <0x01 0x0007>;
 			clock-latency-ns = <6000000>;
 		};
 
-- 
2.49.0



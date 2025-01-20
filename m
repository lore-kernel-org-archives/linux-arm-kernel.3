Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5A5C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8hAzpqhK+r7FJNtEnXIvhOhfkNchLyGSgqsngobflg=; b=zCgYxyc5za3uxv
	wKQbjQNjc3JHRN98catUcFybrvU7Lg27RqhTO5AKSBQlXzZiMqLBG+UjEXX3Gkxnf68Y0HkMWGx7H
	bFNdf7LY4hjFskUKUL2JFGspD69T7aVJ/wThrRDQzTjobl2SmSNNqPckomJMchvbBfxK23MMxhJ+f
	+Fux2c6n3iRap24moLC5zKdSJRACpc0ZbcjREAY1jYlm+jsmlTIliG7CTUAY9f5ntM5/UTK4G+5Px
	762HGh9cktsaxiMNnmgp23Xhi1mFA+5JWy/gylY4rYrpmKeksb7JYU5KsSvMcLaULP82rzKE0rNix
	34t/ENpP5KJ42dOlwvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmeO-00000004yIm-2imj;
	Mon, 20 Jan 2025 07:56:48 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmd3-00000004yBa-0QyF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 07:55:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50K7tDkC599415
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 20 Jan 2025 01:55:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737359713;
	bh=J8hAzpqhK+r7FJNtEnXIvhOhfkNchLyGSgqsngobflg=;
	h=From:To:Subject:Date;
	b=rhqpwzp0OynM4Vy13jMidlULjWtm039wwYrf65z/4SS42EPAuhcI0+1e3hr9XR+qo
	 7r4v5Z8XtKMH5+F0zpAsrdUT061q9je57nNeJW+7Su31LmHTX4O8M30jp70phjCTnQ
	 B3B/KqQn3ZrJRsXuS4vCA5F74AbztbbxMKDCMTjk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50K7tD73038264;
	Mon, 20 Jan 2025 01:55:13 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 Jan 2025 01:55:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 Jan 2025 01:55:09 -0600
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50K7t6hY036694;
	Mon, 20 Jan 2025 01:55:06 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62a-mcu: enable mcu domain pinmux
Date: Mon, 20 Jan 2025 13:24:42 +0530
Message-ID: <20250120075442.181191-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_235526_348969_DBE067B8 
X-CRM114-Status: UNSURE (   8.33  )
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

Enable mcu domain pinmux by default to be able to access mcu domain
peripherals from main domain.

This also makes it consistent with the rest of the k3 platforms where
mcu domain pinmux is enabled by default.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
index 0469c766b769e..9ed9d703ff24d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
@@ -12,7 +12,6 @@ mcu_pmx0: pinctrl@4084000 {
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
 		pinctrl-single,function-mask = <0xffffffff>;
-		status = "disabled";
 	};
 
 	mcu_esm: esm@4100000 {
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0334CC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 06:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rekte+N3RPXLXmzmpCOaS5XD2YPDyBRYqwD4rqifLzA=; b=dXJwj9p26xUgXxkERCbN+4RzFd
	kt6g3mYSvCqHWW8B/eE3y/8M6GJqyXYrgcjIlGXALFd5KSkkKL5kRVoEJ9KeeFndb5rbXR8hUIqN/
	+GKaTuqtWiGIRHzTYHb1N86UaR65/fO/WKPdKUeJtBd2TfR9pPW1MW4qcH7E2/1KMPmCLT4hZlX+R
	yHJoqA6jth3hGgoQtkgRLiiMUHWfO76zFbX56NSFiF8M0lET0/vkaVhwF0WTLtTLWFC4QYLmE0Qpc
	/0cuamQUXP6l6rBKKJ1i9GyR+azfIDAFUY+4u2wjnJlRzulP1AY7S90M/a3IxQNdMIU+b0lFgSR9o
	aNzrXZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4vy7-00000008Mv9-1gIX;
	Wed, 16 Apr 2025 06:09:55 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4vwG-00000008MZN-2x4C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 06:08:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53G67wIU238064
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 01:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744783678;
	bh=Rekte+N3RPXLXmzmpCOaS5XD2YPDyBRYqwD4rqifLzA=;
	h=From:To:CC:Subject:Date;
	b=Bf+n3m6/zCwN5QuosMuPbK3KXNNeIsDuvAjo+gbr1l9vPOh8meXpmi6auTsF21rcq
	 SfGAKu65pxKPtiRU41jWuj0VScpsOIpieOeGweQaLhNPRKM6Ypz7ba80tvKGJMjeJ2
	 n4C51A99CUV2q0HT8jhhakY5u2lAiLnOIESayUwY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53G67vsD081089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 01:07:57 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 01:07:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 01:07:57 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.227.92])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53G67tta080937;
	Wed, 16 Apr 2025 01:07:56 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: ti: k3-j721e-som-p0: Add bootph-all to HBMC node
Date: Wed, 16 Apr 2025 11:37:54 +0530
Message-ID: <20250416060754.2393701-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_230800_792214_A77E13E6 
X-CRM114-Status: UNSURE (   9.77  )
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

Add bootph-all to HBMC controller node for successful hyperflash
boot on j721e-evm

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
Test log : https://gist.github.com/anuragdutta731/103e84e84f013093fa089803719d997d

Changelog : v1:
1. Added bootph-all to hbmc node in k3-j721e-som-p0.dtsi
2. Removed bootph-all from v1 patch from flash@0,0 node

Link to v1 : https://lore.kernel.org/all/20250411082637.2271746-1-a-dutta@ti.com/

 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
index 0722f6361cc8..5665b9490003 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
@@ -440,6 +440,7 @@ &hbmc {
 	pinctrl-0 = <&mcu_fss0_hpb0_pins_default>;
 	ranges = <0x00 0x00 0x05 0x00000000 0x4000000>, /* 64MB Flash on CS0 */
 		 <0x01 0x00 0x05 0x04000000 0x800000>; /* 8MB RAM on CS1 */
+	bootph-all;
 
 	flash@0,0 {
 		compatible = "cypress,hyperflash", "cfi-flash";
-- 
2.34.1



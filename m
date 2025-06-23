Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD599C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=43OOMOtrQdbIl0llSClmQm0cuBZtWECNSMICINWNa2E=; b=UMV2VpQ3SKZoGwWBwqNNJvtv4Y
	fKPHJPXlFCcble7JpTYi1f4B9cv1ieHdeuOUH3LDnmCF6hwPOqm3NZ3O0kTXeSAc5RANCuhUnm4RO
	/SAvBCusE9yNOG1Y9gdvwsfEzvfGJYMa+8LJ+3cSHHHJZF578R3qvpBAmje9UjNUSJEIOMGowZTBF
	BCP3zaugJtB2mA8pen1d8i1zmxfqT3IoL0KOGMC9P+ufWnDp/2IeCOYa7miUdLS76mITkxclIDLhz
	33QN+L+TxWc+v5PBgoo89swVWk3boWpDYk57CJy43BE1w3jwUcbWzKMcZSiWtQpcznAbP8tQu7S+W
	q6aHgvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTevO-00000002TBe-1JCl;
	Mon, 23 Jun 2025 11:01:18 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe4x-00000002IBC-1gGP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 10:07:08 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NA72Q61451920;
	Mon, 23 Jun 2025 05:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750673222;
	bh=43OOMOtrQdbIl0llSClmQm0cuBZtWECNSMICINWNa2E=;
	h=From:To:CC:Subject:Date;
	b=uHXhW5tJFimmz24kJt/rYj4/6sOmWDfXGQHU+FDpJ2q1vQJ+QiNkkS2LkXIhmLyYV
	 CsZZJGpBWSCovWLU5dtYQlI9BpGkKLwISceVuq687O4T0bZ4So6UsbBI4UrtozgYUf
	 r9IIrAvbuX7X4c0Lt2q/fZCKlNcdtcnQCLoOeO+g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NA72h03138105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 05:07:02 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 05:07:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 05:07:02 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NA6wcW3627251;
	Mon, 23 Jun 2025 05:06:58 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j722s-evm: Fix USB gpio-hog level for Type-C
Date: Mon, 23 Jun 2025 15:36:57 +0530
Message-ID: <20250623100657.4082031-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_030707_524777_46E0D1EA 
X-CRM114-Status: GOOD (  11.11  )
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

According to the "GPIO Expander Map / Table" section of the J722S EVM
Schematic within the Evaluation Module Design Files package [0], the
GPIO Pin P05 located on the GPIO Expander 1 (I2C0/0x23) has to be pulled
down to select the Type-C interface. Since commit under Fixes claims to
enable the Type-C interface, update the property within "p05-hog" from
"output-high" to "output-low", thereby switching from the Type-A
interface to the Type-C interface.

[0]: https://www.ti.com/lit/zip/sprr495
Cc: <stable@vger.kernel.org>
Fixes: 485705df5d5f ("arm64: dts: ti: k3-j722s: Enable PCIe and USB support on J722S-EVM")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
86731a2a651e Linux 6.16-rc3
of Mainline Linux.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index a47852fdca70..d0533723412a 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -634,7 +634,7 @@ p05-hog {
 			/* P05 - USB2.0_MUX_SEL */
 			gpio-hog;
 			gpios = <5 GPIO_ACTIVE_LOW>;
-			output-high;
+			output-low;
 		};
 
 		p01_hog: p01-hog {
-- 
2.34.1



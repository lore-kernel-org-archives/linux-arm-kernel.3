Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819BFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hu3uAgQuAkms0/9RpR8vcBVvwdO2elej7Vk+d6PRqRU=; b=lAXe0hG1JotutHkJI8y/aDWM+W
	3fPh1UX+7R+UzXR6vvrALcs/X9CLR80tsQubgCRyh0L8PtFtGuVqbY6sHb66JosO3lnKFdKhhyhTZ
	Bg7tk37MrKOMdnKEpTu7qeJ6xoyYMC0CvC/bFEp0lS8UMR0UiJ5x+QNbOxb5TNfqfVBiQU2hsGDyF
	m9Knk4ykXcK5GcxM5GA76TpxRrmTadZ99zY09Z0Jbytch5cX1pnlXYdU/j5Q1UorFna+sZQ8Ny2/j
	9CQwk7AEqyjkGBVXm7Ly6f2IW8SohwsaHXJa/c/iw2gz9eXS05Lvw2udfrYtyBd+ZTYM8rt9n1kZb
	8PPZgXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sib-0000000DTVw-20H1;
	Thu, 24 Apr 2025 09:18:05 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sC0-0000000DOCS-0IEY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:44:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iJHG2448691
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 03:44:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745484259;
	bh=hu3uAgQuAkms0/9RpR8vcBVvwdO2elej7Vk+d6PRqRU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C5FBImGYId6V5JyMvVMZNFUl6Bqh4WxLp5ZOBI/x8g5y4BsBFPC7b2ijQbnYJa9zx
	 h4yn7dm1bj15muZJgbhVCGfCcphHFNKN8iAbFDZmjMbpspozVKTLxT77FU2d0BXuqv
	 XiL6ObI8ZM9UJK+KDov2fuleRLcMSV5h9zADV4bs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iJpE059154
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 03:44:19 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 03:44:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 03:44:18 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O8iHLC058403;
	Thu, 24 Apr 2025 03:44:18 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH 1/4] arm64: dts: ti: k3-j721s2-som-p0: Reserve 1056MiB of global CMA
Date: Thu, 24 Apr 2025 14:14:12 +0530
Message-ID: <20250424084415.66457-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424084415.66457-1-j-choudhary@ti.com>
References: <20250424084415.66457-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_014424_199505_DEEE1A82 
X-CRM114-Status: GOOD (  11.12  )
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

Reserve 1056MiB of global CMA pool which is also marked as re-usable
so that OS can also use this region if peripheral drivers are not
using it.

J721S2 has different multimedia components such as Camera, Dual-
Display and H264 Video Codec which uses CMA for buffer allocations.
Assuming the worst case scenario where all three run in parallel,
below is the calculation:

1) IMX390 camera sensor 1920x1080
-> 1920 width x 1080 height x 2 bytesperpixel x 4 buffers :
   15.820 MiB which is ~16MiB
   J721S2 can support 8 cameras so ~128MiB

2) 3840x2160@30fps MHDP via DisplayPort0
-> 3840 width x 2160 height x 4 bytesperpixel x 2 buffers :
   63.281 MiB which is ~64 MiB

3) 2560x1440@60fps DSI via DisplayPort1
-> 2560 width x 1440 height x 4 bytesperpixel x 2 buffers :
   28.125 MiB which is ~29 MiB

4) H264 Video Codec 1920x1080 resolution:
-> For 1080p resolution codec application, we require ~98-100 MiB
   per channel. We require ~800MiB for 8 channel codec application.

Total comes about 1021MiB. Adding 32MiB for other peripherals and
and additional 3MiB for rounding it off to 1056MiB.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index 54fc5c4f8c3f..2d67fc4bd018 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -25,6 +25,14 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x42000000>;
+			linux,cma-default;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>;
 			alignment = <0x1000>;
-- 
2.34.1



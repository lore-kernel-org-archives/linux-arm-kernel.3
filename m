Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C05C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0w59BnAo2ibcuUUxoJakn61DbC5LjYgWXwXc41KdlkY=; b=TbTFsP0T6NXEyyFICIkwSSnBdC
	G8yZaLxJ7dYsOXetYzv/z8al9sTMSg+lwKacHKwbv/CgPY0VCHKGD8CFqPkmJTZ1CHttFMAw69USq
	04gUDQBlp7rkU3BsPmNxDyG68pYmzSpB9NFtBPbFo6IZV7cCAkucBQD1EwFiult/UEcvLhpkW8RGp
	jc8G10EESAlA/QuCWgjgaJ3oZ93PWhlliWOzcgM8e5gWUBGVjKhQ1FZ99XXJ4vyh1lED5kP7ubnaD
	pD9Prx7mSkNx7EkDQS9IsaC1HOgPjHEl+oNY2i10AfnxDywO5cC3daC57vjlLmuWwv6+/lj60P/Wl
	/TZqhUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgOy-00000006Rbg-419Y;
	Tue, 01 Jul 2025 19:12:20 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfDM-00000006HPL-3IXb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 17:56:18 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4D2D6C002100;
	Tue,  1 Jul 2025 10:56:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4D2D6C002100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751392574;
	bh=wLXAaiC0Gi5y0soIy8yfo2U59MIViibgMdGokCZf+80=;
	h=From:To:Cc:Subject:Date:From;
	b=YhpuyuoUPUU184FbdvQ56Wj9cnVDY3rZ3s7kFv6nUV+LBvtEzFBsQ74CQCrsAWZFv
	 XXrlmoSUP+FYqaw9f+LKZWhxd+2RVoR04s4kRNRs2fY1Y/X9WdIhZybjVS3oyCJKNL
	 eiPR+5mc3kZp5U3U8UaQTcPWkzAoFdP3lkJpcqkI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D653D1800051E;
	Tue,  1 Jul 2025 10:55:43 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	kernel test robot <lkp@intel.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: broadcom: Fix bcm7445 memory controller compatible
Date: Tue,  1 Jul 2025 10:55:38 -0700
Message-ID: <20250701175538.1633435-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_105616_937618_7437C265 
X-CRM114-Status: GOOD (  11.26  )
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

The memory controller node compatible string was incompletely specified
and used the fallback compatible. After commit 501be7cecec9
("dt-bindings: memory-controller: Define fallback compatible") however,
we need to fully specify the compatible string.

Fixes: 501be7cecec9 ("dt-bindings: memory-controller: Define fallback compatible")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507011302.ZqNlBKWX-lkp@intel.com/
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm7445.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm7445.dtsi b/arch/arm/boot/dts/broadcom/bcm7445.dtsi
index 5ac2042515b8..c6307c7437e3 100644
--- a/arch/arm/boot/dts/broadcom/bcm7445.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm7445.dtsi
@@ -237,7 +237,8 @@ memc@0 {
 			ranges = <0x0 0x0 0x80000>;
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-b.1.x",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x800>;
 			};
 
@@ -259,7 +260,8 @@ memc@80000 {
 			ranges = <0x0 0x80000 0x80000>;
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-b.1.x",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x800>;
 			};
 
@@ -281,7 +283,8 @@ memc@100000 {
 			ranges = <0x0 0x100000 0x80000>;
 
 			memc-ddr@2000 {
-				compatible = "brcm,brcmstb-memc-ddr";
+				compatible = "brcm,brcmstb-memc-ddr-rev-b.1.x",
+					     "brcm,brcmstb-memc-ddr";
 				reg = <0x2000 0x800>;
 			};
 
-- 
2.43.0



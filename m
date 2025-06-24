Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PM7HT1zExkxh5kKrFo2bnq5xJBT6NyNgAUOoBgPhwUk=; b=qoZgp3UkvmevskxnSsFCaxauat
	FIOgNDSqS7NG43L4jjAXDvMwpol2Kx98krN1CdPu9n5wc31GI/0UTDgfJOxEAludp6d04nT0OPg7k
	DHXRvp+kAe0zhYIgs/1xaji+f10GC5xNfVu9pNX37uvqzJ8PvyDChF4o5Nr/Uwnef8qKMH4e9ldrf
	j9+h+H9GzS9Abf9b+vdbS4vwQqURhtoZ3wgNP9nsyemVcjmWlLbooSlFEzi+YEBylxbTiqQyw0n7T
	FKGNBGe9XH5cgAo4WCOB/Fwim7Lu5w5ueqjz1lGxsmcnk1rJjusMCN5IVtzPcr6CFHFOtMbfXLRT9
	5cv/wtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7BE-00000006MPe-1gwI;
	Tue, 24 Jun 2025 17:11:32 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4yv-00000005yuj-1Si0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 14:50:42 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OEoYj51193065;
	Tue, 24 Jun 2025 09:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750776634;
	bh=PM7HT1zExkxh5kKrFo2bnq5xJBT6NyNgAUOoBgPhwUk=;
	h=From:Date:Subject:To:CC;
	b=SIKladKITRCK8nJra5lZE1g6Ft4k7okHpr5aRJy7hwv9IIMIQSV0g/N2OYfrE2llj
	 qZRhibhf/kGfb9Hc6eggg7KEUfheN0roKTjPmTBp+RVQ70C9twsT+kd3G8A3gY627g
	 RjX0ugaEPD+fa+/Pp1xTnG50gEo6/O9K1bcHzheU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OEoYZx108841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 09:50:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 09:50:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 09:50:34 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OEoYL11684824;
	Tue, 24 Jun 2025 09:50:34 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Tue, 24 Jun 2025 09:50:33 -0500
Subject: [PATCH] arm64: dts: ti: k3-am62: copy bootph flags to Linux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-62-uboot-cleanup-v1-1-c36230ab0375@ti.com>
X-B4-Tracking: v=1; b=H4sIADi7WmgC/x3MQQqAIBBA0avErBuoCY26SrQwG2sgNLQiiO6et
 HyL/x9IHIUT9MUDkS9JEnxGXRZgV+MXRpmzgSpSlaYGNeE5hXCg3dj4c8d5Yqu165hUCznbIzu
 5/+Uwvu8Hp1KXYGIAAAA=
X-Change-ID: 20250623-62-uboot-cleanup-dbec66f9e257
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004; i=bb@ti.com;
 h=from:subject:message-id; bh=HxzdnHlvNmXe+SO45XnlkN/PmfV+l4m2RoOlMEC6YJQ=;
 b=owNCWmg5MUFZJlNZV37u9AAAYn///7bfNrn+bTuX7/w/1Os/n//++t0du/f7Tqu8nT/Z7O+wA
 RmYHeqABoNAGgA9QNPUAxGjQA0AGgDTIBoAAGgAPSANqDQAA9R6mRpmmCh0DINGhoGQA0yaDEDR
 kNNMhpoAaBoGQHpADRiaBpo9JpoMgekNMamg9NIAAyGUaeo0Y1PSDJppkBoaGRpkDEAGhoBoBpp
 oaMEDRpgCANGjQNDQDQA0ZA000AIJUVXwqWEC0xYeLNyMNuX0RaRQQEn0geNGIVIYARL2fuPKCw
 tGYD0nNrYqkzmONq7PYoBeA1gU3QBQ5/4e4O/0YVgaGdvAda3hzHme7JrrRiH/MjePDrb7fF1eC
 1ja8rwgM0qywCEY1vageBu1wCtVtktleMA7zTITuBwbjRCCLaeTmpAXU6+lOPPZlGJVRlEwVF9V
 6+KK6l0P67bCTYftdB3JiCgEowQVVPIQZN4rFbMtUwu2OUNfGne9mJJb3j9lCm7QTgH+znYkIjv
 IpaxQkeoyvtkAFR7zf8SThinJgfRIk2L7rpNx1lPMqPehiek+TnPUpyxlrUca+adzDjrpE+gU0A
 g48ouQ0IbxULGLI1pLgwUAGYrIQlUMEEvt3q1TAVhRcES7/0xjZWERkEmZ54tYUctBSzB1ANxR5
 /RbU02q/xdyRThQkFd+7vQ=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_075041_527039_42FB08BC 
X-CRM114-Status: UNSURE (   9.41  )
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

To keep things as organized as possible, copy the bootph-all properties
from U-Boot for the packet DMA controller to indicate it should be
available during all phases of bootup.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 9e0b6eee9ac77d66869915b2d7bec3e2275c03ea..2a727caf36ec44e4a023c5985d1bad9b80737633 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -150,6 +150,7 @@ main_pktdma: dma-controller@485c0000 {
 				    "ring", "tchan", "rchan", "rflow";
 			msi-parent = <&inta_main_dmss>;
 			#dma-cells = <2>;
+			bootph-all;
 
 			ti,sci = <&dmsc>;
 			ti,sci-dev-id = <30>;

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-62-uboot-cleanup-dbec66f9e257

Best regards,
-- 
Bryan Brattlof <bb@ti.com>



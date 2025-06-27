Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE9CC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L+cYJTlJeUVr9Wj+MuRXcuU+UYAyVJS5NoNC4VWOl8c=; b=Z2HqxMWo+xXUWGxKIegD0iz8M/
	7ZlXpgmEWOs50T/ZLsbh0rN2l/IiSpSH5FPXHDBOt0LBTMuxowAx+ISpCFdyMMWemZ1P53poQFMya
	wQWhoVvps2oP+pae67C+vmzYCAd3rZG24UDgHCEWMSEZ52ZrlvKRNWAwhUqiZw1AWH+06JPYfel+5
	cb7cvmtRVpoeCd2CDF+hXuQZ/TcziYgzo9x0p5c5lbwfCubxUk0YSioPolpnH92ZjifkuJjI29zhi
	A6ebSKmLntzYkoCo6AKCDD76ud36qqBPeTSuoCef2F49q0kWb+F0NR/xkJAc0zlP7ITHvPgU55WP+
	xMKm3qwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAGI-0000000EwDl-2ZBi;
	Fri, 27 Jun 2025 14:41:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9T1-0000000EpHj-4298
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E7005C558D;
	Fri, 27 Jun 2025 13:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4B5C4CEED;
	Fri, 27 Jun 2025 13:50:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Simon Horman <horms@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: porter: Fix CAN pin group
Date: Fri, 27 Jun 2025 15:49:48 +0200
Message-ID: <70ad9bc44d6cea92197c42eedcad6b3d0641d26a.1751032025.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_065012_046420_9D47AB20 
X-CRM114-Status: GOOD (  12.07  )
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

According to the schematics, the CAN transceiver is connected to pins
GP7_3 and GP7_4, which correspond to CAN0 data group B.

Fixes: 0768fbad7fba1d27 ("ARM: shmobile: porter: add CAN0 DT support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware.
I did verify that the CAN0 bits in the pfc driver match the
documentation.
---
 arch/arm/boot/dts/renesas/r8a7791-porter.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index f518eadd8b9cdad3..81b3c5d74e9b3a60 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -289,7 +289,7 @@ vin0_pins: vin0 {
 	};
 
 	can0_pins: can0 {
-		groups = "can0_data";
+		groups = "can0_data_b";
 		function = "can0";
 	};
 
-- 
2.43.0



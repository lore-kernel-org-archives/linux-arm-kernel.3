Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49309E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=48i2+bbfQOsVn9kQtU3m2ql3/hd7Ql65fiI8cIu0j58=; b=UKgEJhwUqUgsl1RxBHzGU6Kzgd
	ixGutPHqYRO/UfPU0PJm4IDnlp0/MYfX+NWrrjcpZ8Yaast35b8eFF2NXor6PmO5Ynn8GnVPS3R3f
	z4AzIo8y/Cnoi+RIwatdyDUzsU/o4MKbNZv/qABZfHs+tI24V/KYsy/M5ehXhex7xDj0YQN+eKXhi
	lXvtdcOo4C39hoFXoB0j8F3Cb6skc6cpjcSP8rhJAwwf7ydyY7mXVdPCBnk2hgQh6R/3/l4mGiEXg
	D5dAuhvu3+t3APK89hYJTnnkdgrSUsGks+CXcFhFvwctsH1fJlvLGAEihu4Sgv1ku2AymZwrV3yKO
	DzlJSDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTUb-0000000H61H-0Iid;
	Sun, 05 Jan 2025 16:28:45 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTTO-0000000H5u1-3iOO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:27:32 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-72m3.prod.antispam.mailspamprotection.com; s=arckey; t=1736094442;
	 b=u3ayCYHnlvOpB7hyJ9kNIjVtazLB9L95YAnu+n5Bq8x6iPIL6WfBGmOYzxFCKsdUGmky6Y+88G
	  V44M3KU9pYe7wJt3X+oJmcFC6OVyawWOhO/gRXYz+P7XLObY8nc84ROu60fj/IeaR6PSWGffov
	  tCqUCNZNAI3nIwxIOadfyj425tcrgUVeRj6Sm1/dZi9v/k2tSmxpAT1xa+xWXH7BnnrOqu3eJJ
	  Orem5p/sQ6qlV4K1ooHFdQFlrs3Dl7Q/QQRw+DsKDyAuZRh4As3sPfkkN4D+JGSU13nNROecyF
	  9tQfrTsjpwoYijyTEbKG18679rjr/t/yu3wxDsqi9Q077A==;
ARC-Authentication-Results: i=1; instance-europe-west4-72m3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-72m3.prod.antispam.mailspamprotection.com; s=arckey; t=1736094442;
	bh=3zXsEw/3Zreogf33S4hWe04mUilkn+cAgezjW9vC1fM=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	  DKIM-Signature;
	b=PJsI29GcBoZBxttjZ3T9xcnIH1/gAjcfbKpynn8U9fJJRY6p9uupn+4QwWuXVKfVqj2HcYXEou
	  RCTux8htbvN/fuf+4s+98mMxSfV7bUele04lQmWYVTSS+qFGtn2Wx/V6x5eu/f2c5w/ZprTh6q
	  ma5gRDVGOupL+F4jf8v1V9eVJ4yr0Y/LKUtqo59bWmL8qiSPdg4C8XrReEx/CpxSBMOHr+BwMe
	  oi8PjkptrjS+lFXucv5OnIQ8bijDWzio8/T+XIvx/TATH9pDs0+4MkXscah63jIrdCKlZJi8c9
	  4MbItV+60PeHAHym3funuuWSXlJeEXxLpnjIzl9gABMu1w==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-72m3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tUTTC-0000000D38U-2gnv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=48i2+bbfQOsVn9kQtU3m2ql3/hd7Ql65fiI8cIu0j58=; b=fwCISfA2mIl4Cv0U2N0THYai2d
	liDpzCpAP14nHCvkg/UBn11EQGFd2gwh2QluWV8uQppjY19LaZXQevzzLBokGHo6ob3usKyFWoiNw
	5jcrR7g1x5VOG5rgSqfjHEF5KstC0/MEbt3YP6Wf/b0vc97BzlWVjYbOyVX+AQ3m5FrA=;
Received: from [87.11.41.26] (port=63875 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <francesco@valla.it>)
	id 1tUTT8-00000000Mmg-0qyJ;
	Sun, 05 Jan 2025 16:27:14 +0000
From: Francesco Valla <francesco@valla.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: ti: k3-am625-beagleplay: fix DP83TD510E reset time
Date: Sun,  5 Jan 2025 17:26:30 +0100
Message-ID: <20250105162630.243899-1-francesco@valla.it>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 73709cb7f9118b7a4181dab19fa4dee8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-72m3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_082731_058982_85DD268E 
X-CRM114-Status: UNSURE (   9.11  )
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

The reset deassert time for the DP83TD510E is incorrectly set to
60000us, while the datasheet states that the minimum time required
after an hard reset is 30us (while 60ms is the time required for the
Power-On Reset after supply stabilization). The error probably arose
from the two timings being indicated by the same symbol (T2).

Lower the required time to 35us, aligning it to the value required for
the PHY to complete the reset AND to be able to accept the RMII master
clock. This saves ~60ms on boot if the MDIO driver is built-in.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index ee96f4f6deb0..75c80290b12a 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -610,7 +610,7 @@ cpsw3g_phy1: ethernet-phy@1 {
 		reg = <1>;
 		reset-gpios = <&main_gpio1 5 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <25>;
-		reset-deassert-us = <60000>; /* T2 */
+		reset-deassert-us = <35>;
 	};
 };
 
-- 
2.47.1



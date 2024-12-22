Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E64E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 03:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qjbp4cBC2uXMHpTsRQRHtViTfdm9+Fp7YQkNlwi9Ec0=; b=p3Tq9oDONcBRnFhKeGHeKlFzDD
	hgzDWL2R5EcKmnHlEy0QIGAWr+yxBPNShlxQLlmhBD0jEUOgXAwnWl6XKY7vNSJeV30BHPuR6iFdV
	nSjBKE4ztbic57DIWekmlN3tAcUFl9XMYCdrGYFE+8mtWroqxCgs7xWzU0iGtbBWwu/rWUqhJjS3p
	VmDpoq/aJ9x97T8WqnnRJByIBMqGfqWurIr1VxCO602/HMtkKHUelHClyIuUEDSZxEuT574j1bG8K
	SA5a8XUcZKuOqbaIcwc0e93rnl3wbpiihiHuKAse+mcQnE2Bm/yUYdioL/VUpWc5Eo0UFMn/CP+46
	ZlixOsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCIF-00000007iyz-2zY5;
	Sun, 22 Dec 2024 03:06:11 +0000
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPCH0-00000007inZ-0d4G;
	Sun, 22 Dec 2024 03:04:56 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 4BM342BS020894;
	Sun, 22 Dec 2024 12:04:06 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, maz@kernel.org,
        tglx@linutronix.de, jonas@kwiboo.se, macromorgan@hotmail.com,
        andyshrk@163.com, liujianfeng1994@gmail.com, dmt.yashin@gmail.com,
        dsimic@manjaro.org, tim@feathertop.org, marcin.juszkiewicz@linaro.org,
        michael.riesch@wolfvision.net, alchark@gmail.com,
        sebastian.reichel@collabora.com, jbx6244@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 1/3] irqchip/gic-v3: Enable Rockchip 3588001 erratum workaround for RK3582
Date: Sun, 22 Dec 2024 03:03:53 +0000
Message-ID: <20241222030355.2246-2-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222030355.2246-1-naoki@radxa.com>
References: <20241222030355.2246-1-naoki@radxa.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_190454_427630_1E03A4A3 
X-CRM114-Status: UNSURE (   7.70  )
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

Rockchip RK3582 is a scaled down version of Rockchip RK3588(S). Apply
Rockchip 3588001 erratum workaround to RK3582.

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 92244cfa0464..c59ce9332dc0 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4861,7 +4861,8 @@ static bool __maybe_unused its_enable_rk3588001(void *data)
 {
 	struct its_node *its = data;
 
-	if (!of_machine_is_compatible("rockchip,rk3588") &&
+	if (!of_machine_is_compatible("rockchip,rk3582") &&
+	    !of_machine_is_compatible("rockchip,rk3588") &&
 	    !of_machine_is_compatible("rockchip,rk3588s"))
 		return false;
 
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EC2C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKC2LPdw3n8i6eOmbAF8IdjSTk4530z62vZdkc/GbAE=; b=TmfuMD3dA2+QXPOoo1u/dx1wcy
	GwvUEWcA2mHh02Mq9BF9Fox8EKJCvXhZLvVJtnlT7FITNiHQJVRS7pqIu08TXb9UbmknDbKI9sK4d
	xmyC5hb96jSd+Z2HhetG3GRK42008NXbae+YwWVpjtdYsKb+cZm/8fO+d+tL7ewkNDAXb2f7NwPyx
	2eETZODaAH6H+3m94ZJKEdQYEk1CyzLDYJnw8g6kTTWf+w7jyckdt7JKAGO8LRxTLvuWmSLoL+eWF
	lxDLWfjtZx8xJh1K9EmUhsQFyjSXSIAgNLZ3oQ45Q4IDOH+SIIr9ju975LpSK3LSKmkMr2wRM8vmP
	vlHV0+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDS6o-00000004WVr-0Ub9;
	Fri, 09 May 2025 18:06:06 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQ4P-00000004B9q-0CVh;
	Fri, 09 May 2025 15:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=OK
	C2LPdw3n8i6eOmbAF8IdjSTk4530z62vZdkc/GbAE=; b=K4TmGG/Gh050AD01ci
	CGYzNi+IKjeMx3Ur2n6Sex5JqqZ62XFfjPjUkxYn762sl2+ZPxI424t0VffM5boi
	Blu1K+FDdxI3OcZ8Lkf0r1QUnQagracG39qcLK6fHpLn4cylGci/6DaotPrReWMV
	j7NOGV7GlfYR/U89vvwV+MVdU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCH+a9CJR5oqYT+AA--.23731S3;
	Fri, 09 May 2025 23:54:44 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	manivannan.sadhasivam@linaro.org
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/4] PCI: rockchip-host: Fix "Unexpected Completion" log message
Date: Fri,  9 May 2025 23:53:59 +0800
Message-Id: <20250509155402.377923-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509155402.377923-1-18255117159@163.com>
References: <20250509155402.377923-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH+a9CJR5oqYT+AA--.23731S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWrWF4xXF4kArW3Cw1fCrg_yoWkGrcE9r
	n8u3W7Aw45KrW3A3Wqy3yxtryrAas09a1IkayrtF1ayas2vr10q34kZ3y8JF15ur1DXF9r
	Kw1qyr47WwnrZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRN73v5UUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwdIo2geJBoynAABsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_085529_475474_D64C6F7E 
X-CRM114-Status: GOOD (  11.37  )
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

Fix the debug message for the PCIE_CORE_INT_UCR interrupt to clearly
indicate "Unexpected Completion" instead of a duplicate "malformed TLP"
message. This improves error log accuracy.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 6a46be17aa91..2804980bab86 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -439,7 +439,7 @@ static irqreturn_t rockchip_pcie_subsys_irq_handler(int irq, void *arg)
 			dev_dbg(dev, "malformed TLP received from the link\n");
 
 		if (sub_reg & PCIE_CORE_INT_UCR)
-			dev_dbg(dev, "malformed TLP received from the link\n");
+			dev_dbg(dev, "Unexpected Completion received from the link\n");
 
 		if (sub_reg & PCIE_CORE_INT_FCE)
 			dev_dbg(dev, "an error was observed in the flow control advertisements from the other side\n");
-- 
2.25.1



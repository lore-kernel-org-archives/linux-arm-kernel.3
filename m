Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAF6C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY9gGG+ynYNdnB1j3/6lY26zStHwpPSt9Msjmy1Whvk=; b=kbLOqjW8RYvRnGre5qrCFJ9hI/
	2GVo9+POqEYlo5Ffz2Bwd5ae/a7varpi6Yns5rpSnTSCME8R1kDw5chrzExy912EekR6prf9SI7aA
	76gFGfgPSyzTu8ReWLTM/NZONeKNTxBa7wO1qRm0w6oNpbMMgJENgedvJpynuoTkBBsBILPzKrgRH
	8UUMDTWPdP/pdmlkKLhL3Nfc2LcFrti4KwmGQG8MezZANH/6SfUazAqrrG/fBtCkTiIYeFaR3zLMn
	UJiL0NtmnUCWOxS8afPIJcqyfhn6LELFrItzkPPPuXhyyUgYSMpYnFGUFgBBqaXPVv3Fci2894r5R
	RM/1P6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Yiq-0000000AP8O-1SQ1;
	Wed, 23 Apr 2025 11:57:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Xkr-0000000AElq-1oqD;
	Wed, 23 Apr 2025 10:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EY9gGG+ynYNdnB1j3/6lY26zStHwpPSt9Msjmy1Whvk=; b=AwzV8JH77Nw3EiOz54zxEws64A
	0WcHCpGZMuio1nAjGKFQGdBQnCbbI6CEcSGhm6HnsQnWTIHYgWdzP/A+bMnpeBnzj7D3f4nOJ8JLd
	35MxG6/7RWA8wZKmtftoqbc5a4zI/uWcMgZO00ryJ0TruS1jFNqUKesVcsanLWsuclOxvtjh9m9T1
	r3iUgCX3STeRZX9qDWnpPhpkIdqph9mMQ9IkC5mc5CqlK0itOML00DDDzD88FpNxZC6i0QwEI7bFI
	GrA4piVcdLz7H05JZI+vMtD470KwYBKm92JxgJCn2kfdK02FV8cnGSGpeumZPSQ+52VoxqwVrRX0e
	nGJ659ZQ==;
Received: from m16.mail.163.com ([220.197.31.5])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7Xkn-0000000BPgR-1hWV;
	Wed, 23 Apr 2025 10:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=EY9gG
	G+ynYNdnB1j3/6lY26zStHwpPSt9Msjmy1Whvk=; b=aIq/Vi1RZ9umh5TXnWfqp
	ho99u5DwjrwTC4TYqEmQfQSgxhiBVvEVcn4qQJmAXHYgfMWUpRvWZNk387DjgYiq
	gUngwA1HvcbJOPa79n6Sv23DPoL8o8q7CewSSHkx5FGu61jkINS14nVhaU82yC9o
	oSt7R9eO9NZucwwZMKbvNU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAnRTjYxghozJctBw--.58909S3;
	Wed, 23 Apr 2025 18:54:19 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de
Cc: manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	jingoohan1@gmail.com,
	shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>,
	Niklas Cassel <cassel@kernel.org>
Subject: [PATCH v2 1/3] PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
Date: Wed, 23 Apr 2025 18:54:13 +0800
Message-Id: <20250423105415.305556-2-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250423105415.305556-1-18255117159@163.com>
References: <20250423105415.305556-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnRTjYxghozJctBw--.58909S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1kCw48Gw15WrykXrW8WFg_yoWkXrXE9r
	yUuF4xXryDKrWSk392yw4xZFn0yas7ur1xGFZYgFsIva47Kr4rXry8ZrWrX3WDGr43JFyf
	t34vyF4ruayxtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZeOp7UUUUU==
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwI4o2gIwTqxrQABsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_115458_221730_67BB67CD 
X-CRM114-Status: UNSURE (   9.03  )
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

The PCIE_CLIENT_GENERAL_DEBUG register offset is defined but never
used in the driver. Its presence adds noise to the register map and
may mislead future developers.

Remove this redundant definition to keep the register list minimal
and aligned with actual hardware usage.

Signed-off-by: Hans Zhang <18255117159@163.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 0e0c09bafd63..fd5827bbfae3 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -54,7 +54,6 @@
 #define PCIE_CLIENT_GENERAL_CONTROL	0x0
 #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
 #define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
-#define PCIE_CLIENT_GENERAL_DEBUG	0x104
 #define PCIE_CLIENT_HOT_RESET_CTRL	0x180
 #define PCIE_CLIENT_LTSSM_STATUS	0x300
 #define PCIE_LTSSM_ENABLE_ENHANCE	BIT(4)
-- 
2.25.1



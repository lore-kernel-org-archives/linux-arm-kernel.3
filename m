Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F34CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LR2nmJ62loXDtxlHutXhsVIE0IN6VZYRDDuR+Lj7rE=; b=E9yrWbiLVoA9LISejB9S3RDTfe
	Lpai0eFpUXZovEyJ1RHKj40g0DpxFBbzdikGQN8wXccHWNuZI6KHDB3Vi2HKQQVkYvCjQFKKNegru
	K+89JSVOETFdOJAkGEy1kyZxS96FBuxKYWoO8P6r7WiPQyBjOnpB5ukWdJcCWZXfAODO/KT4aKubt
	4FAjLleccVxsg5kQIifjsCor7yWOCOJujmNWOqlpHBxoV7In4vfYJo62QUvGIsKZwVjlLoZ2zVIBc
	+kk7lN2VbyhF2vAg+YPYAtmImPyXvo5VVwBHb/9aUkjzlgz43TUK8Ln47xaYfQUTqGNaQVJSdz83b
	zvT8EqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUQx-00000005k7G-3MAn;
	Thu, 30 Apr 2026 16:40:15 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUQu-00000005k5K-1u60;
	Thu, 30 Apr 2026 16:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8L
	R2nmJ62loXDtxlHutXhsVIE0IN6VZYRDDuR+Lj7rE=; b=dYCPvYtvGlhcQPpKyi
	69+S6+sI3KzxYSFm1SLj0ihlOiYuQkqwdCRnUuYlp7/EyjE/HOEx8xA8LFWix+mJ
	P2vDM+TBBFCwIszaC/SckWPh3hRyIiIZvTDGXw4L64gP+7eZha4lIMwFtEIHTshT
	/D5F6Kiz52GfApUlOjZtE/mTY=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S7;
	Fri, 01 May 2026 00:39:31 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	mathias.nyman@intel.com,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 5/6] usb: xhci-mtk: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:18 +0800
Message-Id: <20260430163919.47372-6-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163919.47372-1-18255117159@163.com>
References: <20260430163919.47372-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnUmm+hfNptZrZCg--.19910S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4rtFyftFyruw15Arb_yoWfXrg_Cr
	95Cr1xJas0kwsxCr4DCF15ArWqkrykXw48ZasFqrW3Ka4Utr1Sqryvkry8tFy3ZF4fGrn5
	GanIgry8Kw4FvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMTmS3UUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7APojGnzhcPaBgAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094012_864422_819E6E6A 
X-CRM114-Status: UNSURE (   8.59  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/host/xhci-mtk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 06043c7c3100..d9b865546a67 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -185,9 +185,9 @@ static void xhci_mtk_rxfifo_depth_set(struct xhci_hcd_mtk *mtk)
 		return;
 
 	value = readl(hcd->regs + HSCH_CFG1);
-	value &= ~SCH3_RXFIFO_DEPTH_MASK;
-	value |= FIELD_PREP(SCH3_RXFIFO_DEPTH_MASK,
-			    SCH_FIFO_TO_KB(mtk->rxfifo_depth) - 1);
+	FIELD_MODIFY(SCH3_RXFIFO_DEPTH_MASK, &value,
+		     SCH_FIFO_TO_KB(mtk->rxfifo_depth) - 1);
+
 	writel(value, hcd->regs + HSCH_CFG1);
 }
 
-- 
2.34.1



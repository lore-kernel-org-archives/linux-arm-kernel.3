Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08BDC3ABCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 18:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xriZp5G3YdXkIK9LD+KY/Qb8BNn8y/0CGxYnt75nvI=; b=bravzz5Iy9y08l7zhoGhA8wyxl
	4cCQNjYJ8V1VCexsF41m90TahMo7XAWpFm/WDuIKTKAl1d+xo34fq9RLxsIIQC6Jku4oOOaNCpRyI
	stOPvs3fImDwkISX9VAotIpMq5wdrjS7sP2Hpd6+2sLgOsGLxqdLYe/wUsq3il60jH9CTpBAWfH77
	8A46YAKkYrg1Lm2GBrAY5iHNfVyMTb/NS6LRNSz0cS9UknlBVYKnobjS2KZxqAmTLieZLZ8AHyjWS
	cu6RpAdT66a21Wx4nKRZMMSP9WaVEY4ZqZQmuyp0fKwO/NlEqIS0RkOffJ7rln6brauN3+bNfqXfD
	1Mcs3ymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDS4r-00000004WAf-3Oft;
	Fri, 09 May 2025 18:04:05 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQ4G-00000004B7P-2VCI;
	Fri, 09 May 2025 15:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7x
	riZp5G3YdXkIK9LD+KY/Qb8BNn8y/0CGxYnt75nvI=; b=XOezCR2KtqaqZL0aNI
	VjUl4PDOUfndplYFo2dTpD8zhFOqP3m9QLE+VuE2iqhrkE9sDvpyQjfn7JxoAnmz
	el/BVm3A4xP1tkPgtFxjVqvwCiwzt+ESgzUxYG/yCizYoiirttllG+9Qda3Cdtne
	cLNAIPHjuRkuHvqS6cUoZq9+Y=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCH+a9CJR5oqYT+AA--.23731S4;
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
Subject: [PATCH 2/4] PCI: rockchip-host: Correct non-fatal error log message
Date: Fri,  9 May 2025 23:54:00 +0800
Message-Id: <20250509155402.377923-3-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509155402.377923-1-18255117159@163.com>
References: <20250509155402.377923-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH+a9CJR5oqYT+AA--.23731S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4ruF1fCr4DAry5tFyrWFg_yoWDKrcE9r
	1jva47Zw4UKr9ag3Zay3ySqr9xAasI9r4Iya1rKF1aya47Xr1Fq348Zwn8JFn5Cr15tF9F
	g3sFyFWUuF43ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRurWrJUUUUU==
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwxIo2geJBoy0wAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_085521_007693_AC3FB4B9 
X-CRM114-Status: GOOD (  10.64  )
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

Correct the debug message for PCIE_CLIENT_INT_NFATAL_ERR from
"no fatal error" to "non fatal error interrupt received" to match the
actual interrupt semantics. This avoids confusion in log interpretation.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 2804980bab86..209eb94ece1b 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -489,7 +489,7 @@ static irqreturn_t rockchip_pcie_client_irq_handler(int irq, void *arg)
 		dev_dbg(dev, "fatal error interrupt received\n");
 
 	if (reg & PCIE_CLIENT_INT_NFATAL_ERR)
-		dev_dbg(dev, "no fatal error interrupt received\n");
+		dev_dbg(dev, "non fatal error interrupt received\n");
 
 	if (reg & PCIE_CLIENT_INT_CORR_ERR)
 		dev_dbg(dev, "correctable error interrupt received\n");
-- 
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F61EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 22:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7TiflaSmlDHD5QUweyOWTNN1cwlytjiZ+cyZbaPXtE4=; b=Lc7Kaq5MLbc5NsmhpKCyIMG2g5
	8aVSs5ayKd65ko0Ns+yBHGzOX4P5qM/0qVH1fx/Gj8kI8Rj7PVbFu4JEAVwdi+6PNbZJR4DNQUvsl
	ZjYAk2BwXvgmJiH0jpORQZEnSFUlnyuczNIIgcuQGXgt94uuqKnLPVwdrSF1P+yXxw/uWt5R+HUl9
	z/hGSWRDS0x3LtShN44U1eC/3WEjec4BHa5h/2dATQ0GnztqNAU62uqrBTi0B4Lq9OKfF3Zw26Jin
	3vP7zj3nQ98x95yFDkDrGZn819OMwfDEvqlG7CZ8wElO9N/+rNy6sSR43SEDo6DrjBluyK3ZV8vFf
	847cQQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflzZ-00000007xRM-3StS;
	Fri, 03 Jul 2026 22:04:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflzY-00000007xRE-2CHf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jul 2026 22:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7TiflaSmlDHD5QUweyOWTNN1cwlytjiZ+cyZbaPXtE4=; b=AWDTJrZKQYKyglcYikjim16XFF
	HKv/DMXLBnYU5BtJrfuOtek53J0jTfjOBJgHghSIIDSR4wCueiwz3dk+XAFQIOZ5jiJvWssbQcWsN
	Fpisr8pZj2fl++hCLW8XF8i67qYjAHe3j6nhIGtaC7V0cPiU2/HJg8pms7z7NmVT3LP2T6azmlzV7
	NzyyTd5BbrIyVp8tku4mgJlgQnpdguRyO2HcV96prgh6Ke0CWDhqXCoIzW5H8ig2OFmgqxbL2jUVt
	NjvhSEgpIt7AocFel3InsgNZwI1p5H/POM8spr7u+vFBlcEPrU0MHdS7uhRRgtc2QIMu/TA9oXxVt
	xJEGN/eg==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wflyb-00000005Ax2-3AQT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 22:04:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cace91f112so7732525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 15:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783116191; x=1783720991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TiflaSmlDHD5QUweyOWTNN1cwlytjiZ+cyZbaPXtE4=;
        b=PaeDU40MrcEetNJL9Ul/Dp4axA0w9tR6HCFjaD4l2yYPwpKfTr+3QV4jUMh+R6oyhT
         RzeL9gIwL+iTB/zFJtr1oAvfrMDhdcF9ERWGcuA3WJHGCa1A78OYCOJrmvuJNSmQ5ba7
         u2VhC8o6Wc6IUoWJ3lk+f9aCzyTo0eEVvFYV1NiPXrZPb1lMkdzQBypLvbluJqOhzqLB
         wwHJ290uZD7l4w+b8uJeZo9Z4eIMrbSv3gDi2JRdFed1V5kHEoFZA5sO72a7zKVXJA8m
         Xk5HlXgNh3q3fPU4CXcZ8hn539rYgGzTH941a6aizKNvs72dvkhYYACGgR6Fbq0IwMT4
         fFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783116191; x=1783720991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TiflaSmlDHD5QUweyOWTNN1cwlytjiZ+cyZbaPXtE4=;
        b=hHjgTuN2Ha2Ys6CYPpbmhgUgB4h5FyhKIOUpyDZfmPIHvv4aBahWdA7IHJZdP6bYeg
         Mz2b5cVvAwWJSdUXSdpF9gyVJJbv++gi+eGncXeTUQw0Y7f1oRAoRsXv8ZG3kXWimPt0
         zRQK5Zm07JKROMvgDo7LFbT9DHUWldgU4upNuL8CP+qvNWjuMIgsx+M/wHxaC3lpadj5
         Wh+udEtR4CIrctBZMqauTtjotd988+TStAlQieW+5SLQlRgbJwBlOvOphCukW2RbmFtb
         B8d0ymSS/gNQgOunD8qSla+yDmuw8KN9g+MxfLXm23ROkkZlvZFLstxarqM1eX54s5hI
         srcg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8FTDI0OXJFdJeWUtiKMkXmIkj7EdW1uclIvL+6AAnaf1pkLPchOdMKO4ekZAnZk67Jvmi5R4dcYSkHDreh7eC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx84t1TX/sxX/dXOJg/Nm/m8yPsP3khH1zCoCQuUdouw5lo1X1E
	JDNC7+MNfDWAh1VwFa4ECOqtBgjo+cxOzec45G1BlwPVRlbvxsiel6sH
X-Gm-Gg: AfdE7cnjO+HaLJahkXuzTQcu9tRq8LEMu5jiO2rDtDQIOEdm/mNbtsSX2kyCW+59oUt
	+bgIYiNCfJx33TaPWvBXgjAY0oksQY4ZggUKqur1NfN9pMwuopNiJ+VRYHuTnxa2excL9EpRi+b
	vkZzdhbiPhoyniLESaLpcDwLFPVf8uoGHwVtdyUh4BXR1JIn99Ee4BV4hM7o9AexLKJFrU95q48
	LOx5918AxmRikTNvCT838Q0nN3osYqBOeDjOQ+3bWC9fKIr/NINHSZ901cEmgWIbbbvdpgB1Jxx
	JNQY15FDXfgAwnKC7sgQzlu3iOOH0mah+G3EHsI4qB7uzryStxOnEGsTZnAvVA1bXbRM/PfLKB1
	JTLz90ORmhsfYJIS1KP1tK5UvanRTWGh4ySS4lCA4LwvqDS+9nrbzV1wVpH0D5pCfzvgtZi/cXS
	bywFa7yhdgyUaG9sNw1lwPJKx4w6eH1tvnQ8c9GbpdAL04eHn/ympTYfcWq0c+wtUR/JBi/oUXn
	d5a32J1lQ==
X-Received: by 2002:a17:903:3bcb:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cbb9ec70a6mr8823645ad.35.1783116190489;
        Fri, 03 Jul 2026 15:03:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad77657cbsm14598455ad.47.2026.07.03.15.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 15:03:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:MEDIATEK USB3 DRD IP DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] usb: mtu3: allocate phys with ssusb
Date: Fri,  3 Jul 2026 15:03:08 -0700
Message-ID: <20260703220308.294247-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_230353_176196_6B375ABA 
X-CRM114-Status: GOOD (  15.31  )
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

Use a flexible array member to combine allocations. Slightly more
efficient to have a single allocation like this.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add max() call to prevent negative values.
 drivers/usb/mtu3/mtu3.h      |  2 +-
 drivers/usb/mtu3/mtu3_plat.c | 19 +++++++------------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..d71849388602 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -252,7 +252,6 @@ struct ssusb_mtk {
 	struct mtu3 *u3d;
 	void __iomem *mac_base;
 	void __iomem *ippc_base;
-	struct phy **phys;
 	int num_phys;
 	int wakeup_irq;
 	/* common power & clock */
@@ -272,6 +271,7 @@ struct ssusb_mtk {
 	struct regmap *uwk;
 	u32 uwk_reg_base;
 	u32 uwk_vers;
+	struct phy *phys[] __counted_by(num_phys);
 };
 
 /**
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index cc8a864dbd63..afb01b76e1d7 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -240,17 +240,6 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	if (ret)
 		return ret;
 
-	ssusb->num_phys = of_count_phandle_with_args(node,
-			"phys", "#phy-cells");
-	if (ssusb->num_phys > 0) {
-		ssusb->phys = devm_kcalloc(dev, ssusb->num_phys,
-					sizeof(*ssusb->phys), GFP_KERNEL);
-		if (!ssusb->phys)
-			return -ENOMEM;
-	} else {
-		ssusb->num_phys = 0;
-	}
-
 	for (i = 0; i < ssusb->num_phys; i++) {
 		ssusb->phys[i] = devm_of_phy_get_by_index(dev, node, i);
 		if (IS_ERR(ssusb->phys[i])) {
@@ -330,12 +319,18 @@ static int mtu3_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ssusb_mtk *ssusb;
 	int ret = -ENOMEM;
+	int num_phys;
 
+	num_phys = of_count_phandle_with_args(dev->of_node,
+			"phys", "#phy-cells");
+	num_phys = max(0, num_phys);
 	/* all elements are set to ZERO as default value */
-	ssusb = devm_kzalloc(dev, sizeof(*ssusb), GFP_KERNEL);
+	ssusb = devm_kzalloc(dev, struct_size(ssusb, phys, num_phys), GFP_KERNEL);
 	if (!ssusb)
 		return -ENOMEM;
 
+	ssusb->num_phys = num_phys;
+
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "No suitable DMA config available\n");
-- 
2.55.0



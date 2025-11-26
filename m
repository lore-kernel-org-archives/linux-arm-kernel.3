Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953AED10390
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qROQ1d/rJ3p9sDL8V6Cw/YwOWZVH09EJvhZr2XOPZ2A=; b=TizHsscLgun2KMhfeADvqF4uAF
	U8JNbHw0ouPCGIP2ZSsiiqsyZ6MbObwbkB9ANWbEHmYEp8UmvIUtNMSaqw5uhWDBPXjRf5eeX3az2
	nKSY+S405Rs/iNallywbvoicbZQVycW+hWoXiXRZsHJ5zaTLfbZkiP9pPJO/Ox5OT02chZWZDrka0
	XKy7AAj4Qk06OcHLtvmIHPEa4fuxebMBDo94HAweeG/OGPrHyPVn5LUkX3k3hKSoSuycRNzWCLk00
	xZctCe5rVrOt7r2/n09avgTy8TL9TKDeHFBcVWkxq6Weho2+pUeuiz4ewU1+8KJxImgdyLmJNq5l8
	RxfVV+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAzI-0000000EcEw-20W3;
	Wed, 26 Nov 2025 08:34:56 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAz8-0000000Ec8d-3nOJ;
	Wed, 26 Nov 2025 08:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764146044;
	bh=qROQ1d/rJ3p9sDL8V6Cw/YwOWZVH09EJvhZr2XOPZ2A=;
	h=From:To:Subject:Date:Message-Id;
	b=E2/h1++YULHdjY5YOKGyk/EPOVmE6TzCc4f9fcIQ7TU6U0q52/eUlDPozwrjLjcQv
	 pvdJt3T/izXbtLi48r8/6meB6SDzr+TOu8AFFWNYDUtmj08i8BjTeA9eDED0WRp3Zn
	 rCCZpHYb2PlnAwd23yeqNC+VnGDPwSogUfsvaTbI=
X-QQ-mid: zesmtpgz4t1764146035tf6f1de73
X-QQ-Originating-IP: hZmGDUB5pWL4vwPmhqVG5XW5MaCy4rmE9lT7izAS3qE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 16:33:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10528656724047944160
From: Chaoyi Chen <kernel@airkyi.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 2/2] iommu/rockchip: Use devm_clk_bulk_get_all() to get multiple iface clock
Date: Wed, 26 Nov 2025 16:33:45 +0800
Message-Id: <20251126083345.88-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251126083345.88-1-kernel@airkyi.com>
References: <20251126083345.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OK8k06hE7wrVfPkY59X0+/pI54ixdz8xGGg68ftZJ02MKwNzDqLg4MgZ
	UOvu1NYTsoBhJBUxZN9D6BquILYX+KFTD7gRi+Bra9lYkuabeVF2BaNbFosc8pXeY5Gfo7Y
	6zD2YYGMJlz4e2b86XgKVtlacH5chUk+2IKA9uLgtTtO81jLvF7DcAw1oLzjfgOvMVJx7FQ
	6LWh8i3s3ET9OXCqyD4fBwIHGvWZy/ewtwMwI9JsUn7wRVa/oU0QgRQeyVx5+WlhMcIAUCh
	m+VAgeRBPj1USwFd9Dc/xFIpLxuU1q/LXsejEFekCITdY+zUgAbFtO20kgHJUwrU428Ebjg
	jC9QQQNPSQVbwFpGW67jAqzxWFfaPAhlIx/79Wo1ihbO36tePNPYQrbi8taG5LtXR4r+eZM
	nVEVzK3xvVN8cYDfdOnD2enmneuIM39aV8HZMSkJ0IMqjIbMsgyiT1QTy+lQUvGQu4VHWVc
	6IdSKBdJ7Z6icULJFAnDBvAKxY8aD1JXcxN4fBf3x/Ijw9Gl2Y6xRuAeojIqi0BfSIxOphk
	VrA+j/VnFEsUOPpIbh/O9MkBh8Uh3czS7I90jrkxSFdpagpI+p8+XAmSKcw0ANnC73lH6yZ
	Go6wuEZ6ZnJUhkXLuBCsZKjOXgsxlTIOyiGUJusP69hqXekrHIghCYAEhbITALGv1QfaE5E
	SGWHBZ6VUi3kO7wU2OS4FveX4OUwfCeJEA01DKSYA9uJY9L/GzFr+a9CNnbmwaS+qU6TAdL
	jSRDqF+TQnbQXpMglND4gZb0As3QaeFWG8nycNyOXTWkS78TD1dVBmOBLgyMIgyb+H1P0bQ
	xQiLtBDolWxZP7uGc6Ca8IHRJUrIK5foNkTfFWQq8RbpFni0fjmGU+I30UniUDCDjcD3JiA
	DjpWgDL2qIWUWGTgRc7HwgBbzHrPzVD01vGvSCmpaEWIwP5+Cwi0gk5jhnrRyuGcL3X0MKm
	LVlYw/d+efzAMbOHOAMRfT7bg7hZ2Z8Gs9cE=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_003447_399752_C818459B 
X-CRM114-Status: GOOD (  14.44  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The iommu found on RK3576 NPU/RKVDEC may contains more than one
interface clock.

Just use devm_clk_bulk_get_all() to get all the clocks and use them.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/iommu/rockchip-iommu.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 0861dd469bd8..76f71fb679f8 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -93,11 +93,6 @@ struct rk_iommu_domain {
 	struct iommu_domain domain;
 };
 
-/* list of clocks required by IOMMU */
-static const char * const rk_iommu_clocks[] = {
-	"aclk", "iface",
-};
-
 struct rk_iommu_ops {
 	phys_addr_t (*pt_address)(u32 dte);
 	u32 (*mk_dtentries)(dma_addr_t pt_dma);
@@ -1236,25 +1231,18 @@ static int rk_iommu_probe(struct platform_device *pdev)
 	iommu->reset_disabled = device_property_read_bool(dev,
 					"rockchip,disable-mmu-reset");
 
-	iommu->num_clocks = ARRAY_SIZE(rk_iommu_clocks);
-	iommu->clocks = devm_kcalloc(iommu->dev, iommu->num_clocks,
-				     sizeof(*iommu->clocks), GFP_KERNEL);
-	if (!iommu->clocks)
-		return -ENOMEM;
-
-	for (i = 0; i < iommu->num_clocks; ++i)
-		iommu->clocks[i].id = rk_iommu_clocks[i];
-
 	/*
 	 * iommu clocks should be present for all new devices and devicetrees
 	 * but there are older devicetrees without clocks out in the wild.
 	 * So clocks as optional for the time being.
 	 */
-	err = devm_clk_bulk_get(iommu->dev, iommu->num_clocks, iommu->clocks);
+	err = devm_clk_bulk_get_all(dev, &iommu->clocks);
 	if (err == -ENOENT)
 		iommu->num_clocks = 0;
-	else if (err)
+	else if (err < 0)
 		return err;
+	else
+		iommu->num_clocks = err;
 
 	err = clk_bulk_prepare(iommu->num_clocks, iommu->clocks);
 	if (err)
-- 
2.51.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09364D35669
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 04:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+jB6PzGGdWV1uaHP2Da/qWAyeyyV05sGoYc6QsbzsxY=; b=VxtivWyZR8BrO3n2MLmX7K+duu
	Xubihc1R8zgJXhtjkgVk3EQvWdqGPqYD9fKd0Gs7LErGa4ba7AYiamnLDuahtpNKaUPubl4Jg2A2/
	wJojYSRLWENx6pbOw0/Kt2sTVQDzGVux9kPgGOAsFf/j5Icht3Hgb3wLweIV2OTwLm0B9PhZvMls9
	LsRto1mjKJHZqL+La+vLs7CTVnWZtGoR0/XOv9251PtIuSZl/h2kjU/5yEuli8p0tTqmLYKWBuRqA
	M52BiF6fDBOtEbPRmgmF1EZ3L1FY6Af1MXomiIWaFfrg6hy4azjOJBMugk566wiw3ndyoaVunpT7W
	u1tdFLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkx5u-0000000FQHX-2wNF;
	Wed, 28 Jan 2026 04:23:54 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkx5s-0000000FQHA-01qn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 04:23:53 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAA3zRBTj3lpE7rYBg--.31474S2;
	Wed, 28 Jan 2026 12:23:47 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: amelie.delaunay@foss.st.com,
	vkoul@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] dmaengine: stm32-mdma: Add missing check for device_property_read_u32_array
Date: Wed, 28 Jan 2026 12:23:21 +0800
Message-Id: <20260128042321.2260321-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3zRBTj3lpE7rYBg--.31474S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr18ZF4rZr17ZF18tw4kCrg_yoWDAFcE9w
	4kur93Gr4vvF9rtr1jvr13ArWSvF4qgFyDXF4jgFZ3try5Z39xWrWUZrnxJFy3Z3yIkF1v
	k3WrCrW3C3WrCjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxkIecxEwVAFwVW8XwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JUhZ2-UUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_202352_423121_A4A824F4 
X-CRM114-Status: GOOD (  10.34  )
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

Add check for the return value of device_property_read_u32_array() and
return the error if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/dma/stm32/stm32-mdma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
index b87d41b234df..f833724cf42c 100644
--- a/drivers/dma/stm32/stm32-mdma.c
+++ b/drivers/dma/stm32/stm32-mdma.c
@@ -1630,9 +1630,11 @@ static int stm32_mdma_probe(struct platform_device *pdev)
 
 	dmadev->nr_channels = nr_channels;
 	dmadev->nr_requests = nr_requests;
-	device_property_read_u32_array(&pdev->dev, "st,ahb-addr-masks",
-				       dmadev->ahb_addr_masks,
-				       count);
+	ret = device_property_read_u32_array(&pdev->dev, "st,ahb-addr-masks",
+					     dmadev->ahb_addr_masks,
+					     count);
+	if (ret)
+		return ret;
 
 	dmadev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dmadev->base))
-- 
2.25.1



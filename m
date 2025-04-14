Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158F7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vu67UkXmiFFya5XoeJuQ7PZ1kH7H8hEZhkpL2VvaDRc=; b=hATUhscGDDWTssjXaDR4OpzP/U
	VCgUn9a1Shv/0G/VKeABRCejovGmmoGio8+3ZGgDC+AEf3Whluw5OjUSdcQI3syFiGY3/1jsbWsx8
	pfW4oV+9UfQzF8L8qSvsvZq5yfyeXz9Obn0KHz6EQ9TujYGOFJ8L2HGfZTlYO+tN/BAEg/HzSXwct
	fPC+wZmO5bsS/5t4WeTDzpXWbMxbaer8K0IKY5ZJpt286Hf2rIiqpyV9xgjsuzBheidm44M2qHS/N
	D8MvjwgtUvXuTxA+hcAQ3ojQyLVPH+yHeWvahM3ikvFpTC5W8CvBe4tvHS/DQ5YWPVFiK9LnFUwMm
	UkTDZeIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EYB-00000000zI3-1ubf;
	Mon, 14 Apr 2025 07:48:15 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ETx-00000000ya0-16DR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 07:43:56 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAHQwuwvPxn49_nCA--.16546S2;
	Mon, 14 Apr 2025 15:43:44 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: Zhiqiang.Hou@nxp.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] PCI: ls-gen4: Use to_delayed_work()
Date: Mon, 14 Apr 2025 15:42:41 +0800
Message-Id: <20250414074241.3954081-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAHQwuwvPxn49_nCA--.16546S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1xJF43Zw1DurWUuF4fGrg_yoWDXFX_u3
	yqkF9FkFyYk3s5J34akrW3ZFykA34xXw1kKFs5KFZ8Zay7Jr1jy348ZFWDAFW8Kr45XF13
	CF9xCF13C3yDAjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbVHq3UUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_004353_681162_D3D15BF7 
X-CRM114-Status: UNSURE (   8.31  )
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

Use to_delayed_work() instead of open-coding it.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
index 5af22bee913b..09dff6bf824f 100644
--- a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
+++ b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
@@ -174,8 +174,7 @@ static int ls_g4_pcie_interrupt_init(struct mobiveil_pcie *mv_pci)
 
 static void ls_g4_pcie_reset(struct work_struct *work)
 {
-	struct delayed_work *dwork = container_of(work, struct delayed_work,
-						  work);
+	struct delayed_work *dwork = to_delayed_work(work);
 	struct ls_g4_pcie *pcie = container_of(dwork, struct ls_g4_pcie, dwork);
 	struct mobiveil_pcie *mv_pci = &pcie->pci;
 	u16 ctrl;
-- 
2.25.1



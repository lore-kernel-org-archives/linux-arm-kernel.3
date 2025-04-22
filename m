Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18DAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N9dNOfuTXw0dsa2fp1qOtdJrN9EF5haXVa5yEOwQyZk=; b=0JbrY38qigW8BfOipNgYSnWtZX
	NaLLTfjKYlxz6WA9mC1hLanU8c5IZ+neWV4tu6SuMgyFIDPhQnLgz61JvepZVG1PabUmIkwANkvEi
	Z6u3ALEYmT07phqN/GWR6zDb0CjuQwsytKiavMiRUww6zpRLehJ3DVM0IZe6D0q7HcrlZXzkFqoSn
	VrEzFuH39K+k1HO+gMIPANKlIMEOjTGpX87enbjDlQCwfpG8sJ1OCOeuWZ6pf3ds26KFkjZBcHZ8z
	y8tcbwcGJX/uRC/db0CclwAmxOipsKcB5Xw4BZJkkKNx3tgy+v0pEH+XpTPoCNlSNO+PrqkCUMSbT
	sXJPHYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u796Q-00000006KwZ-2eEf;
	Tue, 22 Apr 2025 08:35:38 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u781E-000000066tl-0lax
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:26:14 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADXezh6RAdoZOAVCw--.18178S2;
	Tue, 22 Apr 2025 15:25:47 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: sven@svenpeter.dev,
	j@jannau.net,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] iommu: apple-dart: Remove unnecessary NULL check before free_io_pgtable_ops()
Date: Tue, 22 Apr 2025 15:25:11 +0800
Message-Id: <20250422072511.1334243-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADXezh6RAdoZOAVCw--.18178S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18ZF4DKw1xZry7ZrWfAFb_yoW3WwcEkr
	18CFn3G3Wjyrs8Aw1jyF13Zryv9as8Zws2qa4DK343Jr95Zw18C3s5ZrWxZrs7J3yUCF17
	Aas8Ar1fCrWfZjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1eWlPUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_002612_575969_FB183904 
X-CRM114-Status: UNSURE (   7.96  )
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

free_io_pgtable_ops() checks for NULL pointers internally.
Remove unneeded NULL check here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/iommu/apple-dart.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index e13501541fdd..757d24f67ad4 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -776,8 +776,7 @@ static void apple_dart_domain_free(struct iommu_domain *domain)
 {
 	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
 
-	if (dart_domain->pgtbl_ops)
-		free_io_pgtable_ops(dart_domain->pgtbl_ops);
+	free_io_pgtable_ops(dart_domain->pgtbl_ops);
 
 	kfree(dart_domain);
 }
-- 
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6F5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=58cco15IO24hWp0On5PpJFu0SKhXmxDGqWHzOYEtnjM=; b=QU3sflZOJ95MsrJLkY95wjwrEO
	Jt/IVxu7ylDTaM9eiYYoXj6T4pSdg5uUSqX1i31L36jnbs2ROzyrHlw6FII4JQI6FjKRT0cxQ6aAc
	8LUh9f+jvoe4Wy5bV/OmRi51W4wfaNhy6MRnGbxCMXj3v1Uolyw2NFSzd8a0GZllkxuI9tBprFR85
	MVfSsytjr6XMNsy3mBVJbeWsp1/Ht924FuMDXsfaJ33GgX8CiuAatYvLCC+FvktPIcDwLW5Xty93E
	+axj64QEzKyv8gxped9FsChWHDO8hr23N5ODUjhkQehALD2w+Dc75s+SMhR7/wPeffPwJkjqKNiYZ
	EaAlFciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hVY-0000000Gvmw-3uaW;
	Mon, 07 Apr 2025 08:07:04 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hNY-0000000Gu7F-0jTN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:58:49 +0000
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-03 (Coremail) with SMTP id rQCowAC3Y0CphfNnN1jWBg--.33395S2;
	Mon, 07 Apr 2025 15:58:39 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: linux@armlinux.org.uk,
	elder@kernel.org,
	sumit.garg@kernel.org,
	make24@iscas.ac.cn,
	gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 RESEND] [ARM] fix reference leak in locomo_init_one_child()
Date: Mon,  7 Apr 2025 15:58:32 +0800
Message-Id: <20250407075832.2592519-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3Y0CphfNnN1jWBg--.33395S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WryrKw13CF4fuFW7AryDGFg_yoW8Wry7pa
	s7Cas8trWUWr4vgFW0qFn7ZFyUGayIkw45GrW8C340g3s0vrWIqFy0ga429w1UXrWkAFnY
	vF4xXw4UG3WUCaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JUvg4fUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_005848_576858_5959C0C6 
X-CRM114-Status: GOOD (  11.52  )
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

Once device_register() failed, we should call put_device() to
decrement reference count for cleanup. Or it could cause memory leak.

As comment of device_register() says, 'NOTE: _Never_ directly free
@dev after calling this function, even if it returned an error! Always
use put_device() to give up the reference initialized in this function
instead.'

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v5:
- modified the bug description as suggestions;
Changes in v4:
- deleted the redundant initialization;
Changes in v3:
- modified the patch as suggestions;
Changes in v2:
- modified the patch as suggestions.
---
 arch/arm/common/locomo.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index cb6ef449b987..45106066a17f 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 	int ret;
 
 	dev = kzalloc(sizeof(struct locomo_dev), GFP_KERNEL);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	/*
 	 * If the parent device has a DMA mask associated with it,
@@ -254,10 +252,9 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 			NO_IRQ : lchip->irq_base + info->irq[0];
 
 	ret = device_register(&dev->dev);
-	if (ret) {
- out:
-		kfree(dev);
-	}
+	if (ret)
+		put_device(&dev->dev);
+
 	return ret;
 }
 
-- 
2.25.1



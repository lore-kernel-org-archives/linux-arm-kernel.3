Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4052606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NPio2RXX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Cc:To:From:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7rHYnxYTu4CtmRREkp9VVD+YtIyQ5uRuglguRrV9UfI=; b=NPio2RXXuCqoOb2C0RIxe2orSS
	dqf1K3qHsTeg6caZy4QmZ7o/3aR+0eOLYEKaAgWyP6XhjKylImh9rtuHLm40syrz5DEUINgi9N7io
	SbQxtrEUpJLXZXgP25oG4W3ns+XyRrytG8BI1D19PwTB/yg9VExwVRyfEJkRKHqv7V36VlFXkFHRf
	wC1RmiSrhanpA2QFQ680ua/4Maj0PsLkqu5odjtsro73W08zbx/mLLvohmZ2SQ4Fpxi+DjbPHFV0i
	rWn6ijlak0Y8r7l2kBSLiBuvFTx8QwcSsFCNdSpEsoWSP+a0PU8L0GioK/56eOtNvWnXGdSpK04LK
	+87GpNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFXC-0000000BcKG-2V3x;
	Fri, 06 Nov 2026 08:42:54 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFX8-0000000BcJf-17K8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:42:52 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXsbYFk+1qC3huAA--.1570S2;
	Fri, 06 Nov 2026 16:42:45 +0800 (CST)
Subject: [PATCH v2] dmaengine: qcom_hidma: Fix runtime PM leak in hidma_issue_task()
From: Wentao Liang <vulab@iscas.ac.cn>
To: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, vulab@iscas.ac.cn
Date: Fri, 06 Nov 2026 08:42:52 -0000
Message-ID: <179395457228.2120679.13809646473624751961@iscas.ac.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXsbYFk+1qC3huAA--.1570S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWxtrW7JF43GrWDAry7Wrg_yoW8WFykp3
	93XF4SkrWjgw17t3WrCw4UZFyYk39xG3y3KrykKa4kur45XFy2q34kCrWjgF1jyrZ5AFsF
	ka18t3y3uF12y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU7nmRUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUDA2rtTc-XHAABsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_004250_697380_78CB65EA 
X-CRM114-Status: GOOD (  11.83  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hidma_issue_task() bumps the device usage counter with
pm_runtime_get_sync() without checking the return value. The counter is
incremented even when the resume fails, e.g. when runtime PM has been
disabled or the device is suspending, and nothing drops it in that case,
so each failure leaves the device with an elevated usage count and it can
no longer runtime suspend.

Use pm_runtime_resume_and_get(), which drops the reference it took when
the resume fails, and do not start the transfer in that case. The counter
taken by a successful resume is still dropped by hidma_callback() as
before.

Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
  followed by pm_runtime_put_noidle(), as Frank Li suggested.
- Link to v1: https://lore.kernel.org/all/20260916093032.2003397-1-vulab@iscas.ac.cn/
- Sorry for the very late reply to this review.

 drivers/dma/qcom/hidma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 1349066b1544..c49cf622e5fb 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -219,7 +219,8 @@ static void hidma_issue_task(struct tasklet_struct *t)
 {
 	struct hidma_dev *dmadev = from_tasklet(dmadev, t, task);
 
-	pm_runtime_get_sync(dmadev->ddev.dev);
+	if (pm_runtime_resume_and_get(dmadev->ddev.dev) < 0)
+		return;
 	hidma_ll_start(dmadev->lldev);
 }
 
-- 
2.34.1



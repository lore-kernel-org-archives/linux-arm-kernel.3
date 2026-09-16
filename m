Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BBDC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kcNrqFbOyKMfAL827i5mI0u5Hrpb7K1Iil07U+0ymNk=; b=c5ervp3biVKAOGJKD0ZwyTJGb/
	ZvU/VMzCzqDjdQ5QSId5t+mnyCA+0/fSn/gn+/K2V0+vG3xFZGvagAOAqIUKwHFM8NGVzxQCPYn4/
	WXHHLwDMFmHagAq0PwyDc88jzRWbCMCOV2NwcwpcMO4DQ67PrN/h166bbwGakcSXG1/5vkTWJyLnU
	LdjxZxLI3H761tQGFrRsLAFCtWGHdEZB7LABAf+CQSFDUiUN25W5RMqvi5OyEgGm75HAHpOQTzVFC
	vHXmtySBQho8jcbo9lwMOzSCKUcQJ9ZxNMqcBZ+O0JAHGFSbrOZvYIgg/yx0yUWEBPFVGk73zYKHN
	gezS1XqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lyw-00000008qMo-0F9t;
	Wed, 16 Sep 2026 09:31:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lyv-00000008qMD-04CW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 09:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kcNrqFbOyKMfAL827i5mI0u5Hrpb7K1Iil07U+0ymNk=; b=Z22lFzWVzUpFyU8KjlesbJqv2Q
	mzJRloN9ibqNq5Tg4hLoLhwGyFrq73vkOIKKRzw42EsqCyzmgbUkDNsZZNbwSbPPjNV7UDV9X61Ql
	3Mtxi1//hPZgPYdqVEVYd3P0HEFgxwMlgoCzBJfjaqvsKrr/Fk9ox//RmuqJgB2qhi9GuccwG0LZP
	nHP6Xp8boIb1SazrIwPwHb2geUQfHAqMBFiuSLtl5PalXfm0T7PbhTTIg2pKaSIZAsMcYZSje2NKC
	f8NP+hmgCnNnp37HnGBbV4SZyqc6cOqzWWJwm5ud3rq1jYy98efr59S3mQPuoYNzPkvN+7eV9OAEF
	VafnpHFw==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6lyq-00000007gsD-1It3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:31:06 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAnKjjUYapqg13gBw--.41217S2;
	Wed, 16 Sep 2026 17:31:01 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank.Li@kernel.org
Cc: andy.shevchenko@gmail.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	okaya@kernel.org,
	vkoul@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: qcom_hidma: Fix runtime PM leak in hidma_issue_task()
Date: Wed, 16 Sep 2026 09:30:32 +0000
Message-Id: <20260916093032.2003397-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAnKjjUYapqg13gBw--.41217S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWxtrW7JF1DJw4UJrWfuFg_yoW8Gw1Up3
	9IqFWFkr90gw1293Wjkw4qqF90939xGFW3KrykK34kurs5XFy2g348ArWjqF10yrWrAanF
	k3W7t3y3uF1xAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
	4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUrrWFUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcMA2qqPpSX9QAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_103104_964016_C6B16901 
X-CRM114-Status: GOOD (  12.64  )
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

hidma_issue_task() bumps the device usage counter with
pm_runtime_get_sync() without checking the return value. The counter
is incremented even when the resume fails, e.g. when runtime PM has
been disabled or the device is suspending, and nothing drops it in
that case, so each failure leaves the device with an elevated usage
count and it can no longer runtime suspend.

Bail out and drop the leaked increment with pm_runtime_put_noidle()
when the resume fails, and only start the transfer when the device is
actually resumed. The counter for a successful resume is still
dropped by hidma_callback() as before.

Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/dma/qcom/hidma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 5a8dca8db5ce..03a73dc9b066 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -220,7 +220,10 @@ static void hidma_issue_task(struct tasklet_struct *t)
 {
 	struct hidma_dev *dmadev = from_tasklet(dmadev, t, task);
 
-	pm_runtime_get_sync(dmadev->ddev.dev);
+	if (pm_runtime_get_sync(dmadev->ddev.dev) < 0) {
+		pm_runtime_put_noidle(dmadev->ddev.dev);
+		return;
+	}
 	hidma_ll_start(dmadev->lldev);
 }
 
-- 
2.34.1



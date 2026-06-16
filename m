Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0523CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s1ftkIqF4d0esafVCvHBO99CH8HohJzOtPuHlBdQqNo=; b=iab+ak2xu6oeqqSjTsZXCV7cAD
	bDUpARqv9XUwOUl6cFQCBlkn5YnWVuH/RZwaZYpFk/hhdPWAKaKqaJKk/to/xXlRfF/dFWevnOkLV
	k6LWODgul157K5aLnTh51BwYtoFF0TvQf3SVw4P8JlfsQcGZDNAuTUJ/u7HkuXx1CJDbhszOtJn99
	tz8jQJ8G17U9jsqEa78h793xMY72Yzf8F5/GNeN7XEqDtTIXOTgMJDb8rP3Ilvat5Ght/4WQY3NC5
	op09i2U1alpFc15jnUy1bSOlh6QPpodmaxOMlzY1YkCFbipahABeqQIJrO61f7ZrJOT3mr5JqKkqM
	f03ekbow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI3x-0000000F2CB-0dIo;
	Tue, 16 Jun 2026 00:53:57 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI3t-0000000F2Bp-42uG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:53:55 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABHZt2bnjBqQqneFA--.7217S2;
	Tue, 16 Jun 2026 08:53:48 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] soc: apple: sart: require device link for consumers
Date: Tue, 16 Jun 2026 08:53:46 +0800
Message-ID: <20260616005346.7862-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABHZt2bnjBqQqneFA--.7217S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryrXw47Jw4DuFyxGw13CFg_yoW8Xry5pF
	45Ga4Y9r4DKw1UWF1jqrW7ZFWruayIyr4fAryDCa109rn3XFy8try5tr1Yka1Fy3s5GFW3
	Ary5trW8J3WrWr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUTnQ
	UUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_175354_388221_25733693 
X-CRM114-Status: GOOD (  10.72  )
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

devm_apple_sart_get() obtains the supplier platform device and attempts
to create a runtime-PM device link to it, but it ignores device_link_add()
failure.  A consumer can then continue without the dependency that keeps
the SART supplier ordered and runtime-PM reachable.

Treat a failed device link as an error and drop the supplier device
reference before returning.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/soc/apple/sart.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/apple/sart.c b/drivers/soc/apple/sart.c
index 9eaf3febb382..66b99955b395 100644
--- a/drivers/soc/apple/sart.c
+++ b/drivers/soc/apple/sart.c
@@ -218,6 +218,7 @@ struct apple_sart *devm_apple_sart_get(struct device *dev)
 {
 	struct device_node *sart_node;
 	struct platform_device *sart_pdev;
+	struct device_link *link;
 	struct apple_sart *sart;
 
 	sart_node = of_parse_phandle(dev->of_node, "apple,sart", 0);
@@ -236,8 +237,12 @@ struct apple_sart *devm_apple_sart_get(struct device *dev)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	device_link_add(dev, &sart_pdev->dev,
-			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
+	link = device_link_add(dev, &sart_pdev->dev,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
+	if (!link) {
+		put_device(&sart_pdev->dev);
+		return ERR_PTR(-ENODEV);
+	}
 
 	put_device(&sart_pdev->dev);
 
-- 
2.50.1 (Apple Git-155)



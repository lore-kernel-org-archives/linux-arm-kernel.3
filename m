Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E90C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 05:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1KPhgsJ0oKuFpY/J6wMZ1C4ggSrgcZOnJi6OUC3dG4=; b=Ihti91TMY6xVwPQ45jOG5I9NSa
	y/KOTM9IeD+xM/3fKciy8Feub+NHfSyayPta36ZIDNMOifrBAPQWqdfpzYYjKptNlYMiT5Fjm1Zso
	RPZWV8WYqpnuuk9hqcKkofAsqm9WYhm4lhFLl1v5lVlXpU7zjbqMZDjFY94CN8X/iEGOkjAQcOCLr
	vgD8UxEg96SRkPSeNhpjbKK6qwn4/PvjFiyazcvc+Qwk9srVLI++54ibjUE84kbRcNl7NE2HoxD8y
	OPiJdGbb9pY8QLb/j8AOcgrPNbOMcVQVkDSqfRC8CPsr2BeUp8r5ugHlQdxCBV0QvwUuCGRJNY5Zo
	9yXO/s0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnrS8-00000000vIR-0Oa0;
	Sun, 26 Jul 2026 05:31:08 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnrS4-00000000vHo-3cdN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 05:31:07 +0000
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wB3T_yHm2VqXL0+AA--.15401S3;
	Sun, 26 Jul 2026 13:30:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app2 (Coremail) with SMTP id zC_KCgBHt8yGm2VqrsI5Aw--.61727S3;
	Sun, 26 Jul 2026 13:30:47 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: vkoul@kernel.org,
	sven@kernel.org,
	j@jannau.net
Cc: neal@gompa.dev,
	povik+lin@cutebit.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [RFC PATCH 1/1] dmaengine: apple-admac: suppress bind/unbind sysfs attributes
Date: Sun, 26 Jul 2026 05:29:50 +0000
Message-Id: <20260726052950.37062-2-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726052950.37062-1-fanwu01@zju.edu.cn>
References: <20260726052950.37062-1-fanwu01@zju.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zC_KCgBHt8yGm2VqrsI5Aw--.61727S3
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?VX5ItQXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfncGSG+szpQCInt5Y8rbJUI2Pg//e6j4FKdZm0BtzyOi6Gk4fn5lSG9u6ag7PbtwWS0tV
	+3ZpGbDuFwA7FmFP7M2p9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW7urW7Kw1UCw43CF47XF4DKFX_yoW8XFW5pF
	WfGFW3uFyUKF43Jan8ZF1UuFyFy3W7CrWYgry7Kw45uFs8Xry7ZrWkKFWjkFZ8ArWrWF42
	yrWFyFy5WayYy3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8-6pPUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_223105_036508_5FED9ED6 
X-CRM114-Status: GOOD (  12.20  )
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

apple-admac stores its dma_device and channels in devm-managed memory and
does not implement dma_device.device_release. At registration, the
DMAengine core emits a diagnostic that the driver is not safe to unbind
while in use, and on channel unregister it emits WARN_ONCE if a channel
still has clients. admac_data is released by devres after admac_remove()
returns, so if a client still holds a channel at that point it may
reference the freed dma_chan and admac_data.

As the controller is a fixed SoC resource, remove the standard
driver-core sysfs bind/unbind controls. It also opts the driver out of
CONFIG_DEBUG_TEST_DRIVER_REMOVE.

This RFC does not define behavior for other removal paths, such as
device or DT-overlay removal. Guidance is requested on whether this
restriction is appropriate, or whether the driver should retain manual
bind/unbind support.

This issue was found by an in-house static analysis tool.

Assisted-by: Codex:gpt-5.6
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/dma/apple-admac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 04bbd774b3b4..b448ee323454 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -946,6 +946,7 @@ static struct platform_driver apple_admac_driver = {
 	.driver = {
 		.name = "apple-admac",
 		.of_match_table = admac_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = admac_probe,
 	.remove = admac_remove,
--
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045DDC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VnQtAPnmzsNXyG30aCgKLW877OIe/1r7F5azTH//yIQ=; b=a9dn8z7TF5Tr4aCXxPUD6Kl9pa
	ByrhY/FWLC/df+X1k4QoaNsBYF8E7F647LtOHciQEwrlgiE+H/51jLPXTAAJj7jfME7FpNtJpxxVW
	Ox88HY/UgQnPmWXY/E4t/i64NKL9RgDqoxKL3iPsGE3YGiWgN8cuuj02vBD4ZFdKs8yZNHuwn4fnK
	W9Ifh1sgDjvn9/EVCPVEBlyEbDB7cXJnf3Az6hHLsXxdnFid1nEFf6tE+1lzmTSOABp/BJ03OZNPD
	YJJO8eXsiACJFLl5radD+QU3iybwmh6Kl+boFB8fABjx6oyuOI6N3E3GVGIZ4zqbSHNqPsWmuDDzb
	cLp8n3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAau-0000000BRR2-0Kjc;
	Thu, 20 Mar 2025 07:45:36 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAT3-0000000BQIQ-30Bq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 07:37:31 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAAXHNCrxdtntmrdFg--.44953S2;
	Thu, 20 Mar 2025 15:37:19 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: s.nawrocki@samsung.com,
	mchehab@kernel.org,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] media: platform: Add hardware sync wait to fimc_is_hw_change_mode()
Date: Thu, 20 Mar 2025 15:36:57 +0800
Message-ID: <20250320073658.1005-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXHNCrxdtntmrdFg--.44953S2
X-Coremail-Antispam: 1UD129KBjvPXoW8tF43KF17AFyUtr4rWr45p5X_Gr13JoW8JF
	yaka1xtr4UXwnIgrnru3yfAwsrurW3KrWF9FZ0gryqq3W3A3W5W393Xr4agF1YkFn5Xry5
	Gw13AF4xJa4xn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3AaLa
	J3UjIYCTnIWjp_UUUYT7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_
	Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M2
	8EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE14v_GF4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUYhL0DUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUHA2fbxEAF+AAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_003730_124424_654463E4 
X-CRM114-Status: UNSURE (   6.55  )
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

In fimc_is_hw_change_mode(), the function changes camera modes without
waiting for hardware completion, risking corrupted data or system hangs
if subsequent operations proceed before the hardware is ready.

Add fimc_is_hw_wait_intmsr0_intmsd0() after mode configuration, ensuring
hardware state synchronization and stable interrupt handling.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c
index 366e6393817d..5f9c44e825a5 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c
@@ -164,6 +164,7 @@ int fimc_is_hw_change_mode(struct fimc_is *is)
 	if (WARN_ON(is->config_index >= ARRAY_SIZE(cmd)))
 		return -EINVAL;
 
+	fimc_is_hw_wait_intmsr0_intmsd0(is);
 	mcuctl_write(cmd[is->config_index], is, MCUCTL_REG_ISSR(0));
 	mcuctl_write(is->sensor_index, is, MCUCTL_REG_ISSR(1));
 	mcuctl_write(is->setfile.sub_index, is, MCUCTL_REG_ISSR(2));
-- 
2.42.0.windows.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AABD3C521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 03:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KD2dWM3epPFyE3Csa9fshM+D/VkqSXAQBgJ/S3L9/Ss=; b=XINphsGlusU55i2vmkSu1jPHKD
	npHLFtik3GPmMbKNgt+Dp119LxTLt5eOX+rLHuH2mMpgsWnSGobDBh5fUnCYT9Mb9LW7rA4qlOIYI
	cqpzdXQgtWS6oY0buAwwhRtBk5QPZLvxE2hybzDGO9ixsgXwk+z1h/dnFbLj3CPElhy05FAvXApXw
	0W/ZhS6P7/mzolWZj6U8MGumOWSAormNkeAyZVWHwpDep+pvpFo+9tdoEQZGWzCs2WjOylHVVa1nO
	pVHAzbPFgfylLRCVZet23UsrFHWQyFc4Zvyztsf2I0kSbmw3jUFUTJRfO0zJBfoTvPHu4IKa102f9
	efr7VK1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTARg-0000000F2Q2-0KGQ;
	Wed, 10 Dec 2025 03:00:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTARQ-0000000F2PU-0uct;
	Wed, 10 Dec 2025 03:00:49 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAC3X2tN4jhpoGMoAA--.1160S2;
	Wed, 10 Dec 2025 11:00:31 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: dmitry.torokhov@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: louisalexis.eyraud@collabora.com,
	bisson.gary@gmail.com,
	julien.massot@collabora.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] input: mtk-pmic-keys: Fix potential NULL pointer dereference in probe()
Date: Wed, 10 Dec 2025 11:00:13 +0800
Message-ID: <20251210030013.913-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAC3X2tN4jhpoGMoAA--.1160S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4DJr48Cw1DGw1Uuw1fXrb_yoWkWrX_Wr
	yYvrn7Wr1xKryktrn3Krn3ZF9akw1vva48X34Sq3s3t3y5ZrZrWayqvryrZw4UW3yxGF1U
	J3Wkua18Ar45WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBg0MA2k4t7ewIwAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_190040_416277_F42C0E6D 
X-CRM114-Status: GOOD (  10.19  )
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

of_match_device() may return NULL when the device node
does not match any entry in the driver's match table.
The current code dereferences of_id->data unconditionally,
which can lead to a NULL pointer dereference.

Add a NULL check for the return value of of_match_device()
and return -ENODEV upon failure.

Fixes: 3e9f0b3e2b27 ("input: Add MediaTek PMIC keys support")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..474ef36605dc 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -335,6 +335,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	struct input_dev *input_dev;
 	const struct of_device_id *of_id =
 		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
+	if (!of_id)
+		return -ENODEV;
 
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
-- 
2.50.1.windows.1



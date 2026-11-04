Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759FB606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XDJ+7HG+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CxotMRg8Jl9jS5fqsbNoyoQDH1t41chIx29r6F3HV4o=; b=XDJ+7HG+q2bNJlWZh2NO1JzPwu
	uvHDfu2u9wBX2IwAO9fgAWBBhIcmX3c+4T7JR4VTpoOmF3KHZOfEZLYV1DMAJ1zmTIBI3cZXoozgL
	zah0PRxlN2pDraaS/SeGcIAzQbbp+LzLygUExjzZb/H2+wZWYeKam+frDHnyasjplNJyCkXvDwNEt
	OUEJyHBlcYuCYgzBL/Rkct/TureTeQ+i2dwoD9tsvcGZGaSW1Gt7Oxa5SnpDWgCz2GdzceCO4JIO/
	P14JE+mphsNL3Wapcmz4xTb2peCVVrn3JIBnn4ZQgXhPFf0qOonyO4avqyEJRQvBlUPuCnv2RHemI
	pxDNMSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQWP-0000000488q-1RaR;
	Wed, 04 Nov 2026 02:14:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQWM-0000000485F-43ZD;
	Wed, 04 Nov 2026 02:14:40 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADH7vgMlepqpHU+AA--.9517S2;
	Wed, 04 Nov 2026 10:14:36 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: svs: drop the subsystem device reference on failure
Date: Wed,  4 Nov 2026 02:14:45 +0000
Message-Id: <20261104021445.1468378-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADH7vgMlepqpHU+AA--.9517S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJry3ZF15tFWDAF1DZF4fKrg_yoW8Wr4kpr
	W5ta4UAr90qF1j9w4UAw1UZF13uayIk3s3GrsxXwnruw1rXrW3XrWaqa4Yg34UAFykGa13
	Jry3trZ7C3yxAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
	6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5EQ6tUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwABA2rqZFi4RwAAsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_181439_395775_970BC415 
X-CRM114-Status: GOOD (  13.21  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

svs_get_subsys_device() returns a device from of_find_device_by_node(),
which takes a reference the caller owns. svs_add_device_link() hands that
reference to its caller on success, but both error paths - a failed
device_link_add() and a supplier that is not bound yet - return an error
pointer without giving it back, so the supplier device can never be
released when probing fails or defers.

Put the reference before returning on both paths. The device link created
on the deferred path is kept on purpose: it is what makes the driver core
retry the consumer once the supplier has probed.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/soc/mediatek/mtk-svs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 99edecb204f2..dd9643026c66 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2155,11 +2155,14 @@ static struct device *svs_add_device_link(struct svs_platform *svsp,
 				   DL_FLAG_AUTOREMOVE_CONSUMER);
 	if (!sup_link) {
 		dev_err(svsp->dev, "sup_link is NULL\n");
+		put_device(dev);
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
+	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND) {
+		put_device(dev);
 		return ERR_PTR(-EPROBE_DEFER);
+	}
 
 	return dev;
 }
-- 
2.34.1



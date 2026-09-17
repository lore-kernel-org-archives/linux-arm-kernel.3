Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EA6C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1l/c6/RyoVKodAg4+5S8RTBCKJBpQxJtRcQaVQS18Tk=; b=NLHhFnR4H+yQIK5yQOSGnDYEVo
	yqXx37THcz/ECrlBQ+upg6db2gUj5tpasxL6muiqV9EQPmUgAiTmjLh2tt9iNu+//Kn3YWLM8/JIp
	fdivB7iE9s3WvW+OzYVsgXB+nA0ijHIPAGXimXOUZrd70p0NbEeYdaT8cQwooqFYUK+riiWGWLcvZ
	qM3HZq8lVG6/vE48Ev4A3nEVJV7cX8+INTN5V2OLu0WUjEFufLI8X+lLtaIq4Ru44MfSO/Z4Q8eix
	M2Bv9e7qDm5hDVHnFEjpCjgjoKjssj6nN6/sshN9eZmrkppKvmbj7+s2D0BE2EtvTqEy0+EhK2+4/
	w4pP8xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E6x-0000000BhAu-0Qr5;
	Thu, 17 Sep 2026 15:33:19 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E6u-0000000BhA4-2DW4;
	Thu, 17 Sep 2026 15:33:18 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABHtD45CKxqAp+DCA--.5832S2;
	Thu, 17 Sep 2026 23:33:13 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: angelogioacchino.delregno@collabora.com
Cc: khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	roger.lu@mediatek.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] soc: mediatek: mtk-svs: Fix device leak in svs_add_device_link()
Date: Thu, 17 Sep 2026 15:33:13 +0000
Message-Id: <20260917153313.2160581-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHtD45CKxqAp+DCA--.5832S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1ktr15Wr1rKw4rXr1UZFb_yoW8JFWDpF
	WDKayqyryYqr129a17Ar1UZF15uayIk3s5Cr4rXwn7Zwn5Jr43XrWaqa4Fqw10yFWkGa13
	JryqyrWxCw4xAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBFb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VAI37AI020EjII2zVCS5cI20VAGYxC7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr
	1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6x
	kF7I0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x07UC38nUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgINA2qr888vQgABsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_083316_936138_DA3F3DC8 
X-CRM114-Status: GOOD (  10.43  )
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

svs_get_subsys_device() returns a reference to the supplier device that
the caller must drop.  svs_add_device_link() returns the reference to
its callers on success, but the device_link_add() failure path and the
probe deferral path return an error pointer without putting the device,
so the reference is leaked.

Drop the reference on both error paths.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Cc: stable@vger.kernel.org
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



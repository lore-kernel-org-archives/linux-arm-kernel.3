Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BzlfvevE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=URrsNRc2P4Bm/ZlumrqW2MM90xFCU+Ya4NjGToSw3Hs=; b=BzlfvevEEw2sxF5jaOoQAVklgX
	9e8dl5f/xAf2eyGLNSwPs1mxzcqBHiqFjRqOyUAAdBr+sFMlBOF16xEvzqfnsPFr6Q3ptIXZLDpFo
	usXTKevL/b4yOMxePlPOV1z1y04q2cu2hprF2qhWxkK9/TFUA/VGnS2/J5/Npbq9RBEvMAISUrUyX
	nxKzh+kNm3sZX1a1GjPTXJsMGkKaGLMA5QLMIOqDImaxptNh1ritjAwfB9xtGo72vc5v67Es5V5/P
	AxhRrxxddTzwbFFK2zuI9S6bjp4GHsNOVtaV5HC7DC1uUlZirHiFMDCu22j7QBbS0IDRh3VFblJ8k
	itTgMkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQX6-000000048YW-3XKk;
	Wed, 04 Nov 2026 02:15:26 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQWy-000000048Tv-0fpI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 02:15:21 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAnUfsulepqLXc+AA--.41779S2;
	Wed, 04 Nov 2026 10:15:10 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: pxa27x_udc: let devres own the transceiver reference
Date: Wed,  4 Nov 2026 02:15:19 +0000
Message-Id: <20261104021519.1468644-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnUfsulepqLXc+AA--.41779S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1ktryxCFyxWF4DKFWUtwb_yoW8ur4Upa
	15Cay0kr4UAanFvay8Jws8Ja40y3ZrtFWxKrs2ka98uFWfXw17J34UXFyYga18CFZ7ZF4U
	twnFqr1fuFW3CrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYbiStUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgkBA2rqY4K8GQAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_181517_855756_90AEBE88 
X-CRM114-Status: GOOD (  13.42  )
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pxa_udc_probe() looks up the USB2 transceiver with usb_get_phy() on
non-DT platforms.  That helper returns a reference which the caller has
to drop, and the driver only drops it in pxa_udc_remove().  Every probe
failure after the lookup (the clock lookup, clk_prepare() and all the
err labels) returns without a usb_put_phy(), so a failed probe leaks the
transceiver.

The DT path already uses devm_usb_get_phy_by_phandle(), so there devres
owns the reference.  pxa_udc_remove() nevertheless calls usb_put_phy()
for it as well, dropping the managed reference a second time.

Use devm_usb_get_phy() for the non-DT lookup, like the pxa25x UDC
driver does, so that both paths are managed, and drop the hand written
usb_put_phy() from pxa_udc_remove().

Fixes: 0c0e287d454a ("usb: gadget: pxa27x: add phy notifier event handler")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index df5cca43afbe..74fc75c9d7c1 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2393,7 +2393,7 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		if (IS_ERR(udc->transceiver))
 			return PTR_ERR(udc->transceiver);
 	} else {
-		udc->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
+		udc->transceiver = devm_usb_get_phy(udc->dev, USB_PHY_TYPE_USB2);
 	}
 
 	if (udc->gpiod)
@@ -2458,10 +2458,8 @@ static void pxa_udc_remove(struct platform_device *_dev)
 	usb_del_gadget_udc(&udc->gadget);
 	pxa_cleanup_debugfs(udc);
 
-	if (!IS_ERR_OR_NULL(udc->transceiver)) {
+	if (!IS_ERR_OR_NULL(udc->transceiver))
 		usb_unregister_notifier(udc->transceiver, &pxa27x_udc_phy);
-		usb_put_phy(udc->transceiver);
-	}
 
 	udc->transceiver = NULL;
 	the_controller = NULL;
-- 
2.34.1



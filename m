Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E72C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7AbITL+5+/JL25kmRdFyVy23v2apvHcMNhgPZmbm4Ao=; b=rOXcddZBmC4RtysqC41rvr0ACW
	+Y+UvsJPFx2wQ8RAWFwbM0WS4PViLpeSVZ7gIqxSFomt0It9l8bymSvQIR/j4tr3OJT1LtUZBJcZP
	b+noX4WCiDZcx+uNtPnkkv6A4mkAR2XV+IoP4ijw3mDD6fEGsUMF/P7yOk6MEnhwIK+nW8WAh7Q9G
	ceVwiU4xdNJlV4whzkm/42GtMaDgxEJ9DKv+/Djt1URyb+McBLFAXFDRzxVGwEbXCJ228siF7lXqe
	Ji00LUpxL4MLifWG3xpBNO92R3LGMVhfa5tb93JxjVunhLArSwPiw1hMQm2vEt+9qoVoLQVqYSj8l
	7HDYOs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79Mv-0000000B6bN-2Ffw;
	Thu, 17 Sep 2026 10:29:29 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79Ms-0000000B6aj-3IM5;
	Thu, 17 Sep 2026 10:29:28 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACXAj0EwatqHKJ+CA--.635S2;
	Thu, 17 Sep 2026 18:29:24 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: bbrezillon@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	nicolas.ferre@microchip.com,
	richard@nod.at,
	vigneshr@ti.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: atmel: Fix MCK clock leak in atmel_nand_controller_init()
Date: Thu, 17 Sep 2026 10:29:24 +0000
Message-Id: <20260917102924.2146959-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXAj0EwatqHKJ+CA--.635S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4ruFW7urWxtF4DAry7Wrg_yoW8CF45pF
	Wjqay7Xa1jyF43ZFsFkayxuFyfZa4kJF98C3ykXa4kZ3ZxWa4UXry5tr1IqFWkCFyxua15
	Z3WUJ3WkZF1UGFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwAC
	I402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrw
	CF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuY
	vjxUqdHjUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRINA2qrq01RhQAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_032927_182889_56C795F7 
X-CRM114-Status: GOOD (  10.09  )
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

atmel_nand_controller_init() takes a reference to the MCK clock with
of_clk_get() and keeps it in nc->mck for the lifetime of the
controller.  If the "atmel,smc" phandle is missing or the SMC regmap
cannot be obtained afterwards, the error path jumps to out_release_dma
which only releases the DMA channel, so the clock reference is leaked.
The callers return the error directly and never run
atmel_nand_controller_cleanup(), where the clock is normally put.

Release the reference on those error paths.  The path on which
of_clk_get() itself fails keeps jumping to out_release_dma, as nc->mck
only holds an error pointer there.

Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 87d9227f6ecc..d61e84b8bc60 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2086,7 +2086,7 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	if (!np) {
 		dev_err(dev, "Missing or invalid atmel,smc property\n");
 		ret = -EINVAL;
-		goto out_release_dma;
+		goto out_put_mck;
 	}
 
 	nc->smc = syscon_node_to_regmap(np);
@@ -2094,11 +2094,13 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	if (IS_ERR(nc->smc)) {
 		ret = PTR_ERR(nc->smc);
 		dev_err(dev, "Could not get SMC regmap (err = %d)\n", ret);
-		goto out_release_dma;
+		goto out_put_mck;
 	}
 
 	return 0;
 
+out_put_mck:
+	clk_put(nc->mck);
 out_release_dma:
 	if (nc->dmac)
 		dma_release_channel(nc->dmac);
-- 
2.34.1



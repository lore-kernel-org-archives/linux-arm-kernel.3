Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4878EDEC03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 02:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QaxFyPGTN7p0+FM0J4XB0FbbUg0IRjRHvd/on3YTVps=; b=vHdL3PbszfHHCBNNvmc7HFjX2i
	8YUnYl0uoVwu6DNmRrN+591DknBzuISY1YORjyuDfwOLFyNIJZAz7nonwpzca7PunJ3jNnw6udsm9
	e0uTsTlmp6ZtFis7BrdxRUdW/O93GeYysGDSa8HiIVk6QgA2OrjHQ7uaqgeIMSRMPS6jCiRf1pmqk
	1jX4EyJ/6ast9wJ9OAB79G+DM2Nr0dv3NCBj76QUNdWaBt+InnloGVeYGhYF0YcweymgY8dPEk7lZ
	RVoV7SGfA+6J2JIEYO0jjmmP52LuTU1342MpBRGqLK5cYwyUTqqF7vCbWt74sT8h5mqaS+9LhxsqK
	hHrstcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcNZ-0000000GKNN-25vy;
	Wed, 04 Mar 2026 02:54:29 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcNU-0000000GKMh-2mZ1;
	Wed, 04 Mar 2026 02:54:27 +0000
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wC3LOzRnqdp0w4DAQ--.1182S3;
	Wed, 04 Mar 2026 10:54:10 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app4 (Coremail) with SMTP id zi_KCgAHv4XPnqdpKd+XBQ--.8647S2;
	Wed, 04 Mar 2026 10:54:08 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	heiko@sntech.de,
	romain.perier@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] net: ethernet: arc: fix use-after-free in probe error path
Date: Wed,  4 Mar 2026 02:53:03 +0000
Message-Id: <20260304025303.145493-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zi_KCgAHv4XPnqdpKd+XBQ--.8647S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?9b13/gXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVF/U4hEbTTFSw5kpxcvjRYKPstlloiYtLMimIxxPCeK937RxSFJIG2LQyB39D0JCgNO
	NV74nIx5vQQu6S65pzJdUyKHqvPLYcUGaa3joYPu
X-Coremail-Antispam: 1Uk129KBj93XoWxCrW8ZF4rGrWxWrW5AFyxZwc_yoW5GF13pa
	nxAF92krWkGF1jqa1DJa1kZF4rtw4UtayYgFyIkw4fuasIkr18G34I9rW09ry5ArWkCF13
	ur4DAryUZFs8ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1PUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_185424_850185_DC5461AF 
X-CRM114-Status: GOOD (  12.86  )
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

The arc_emac_probe() function calls devm_request_irq() with the
net_device as the dev_id. However, in the error path of
emac_rockchip_probe(), free_netdev(ndev) is called before the devm
cleanup happens. This creates a race window where an interrupt can
fire and the ISR (arc_emac_intr) will access the already freed
net_device structure.

Race window:

    CPU 0 (probe error path)           CPU 1 (interrupt)
    ------------------------           ------------------
    emac_rockchip_probe()
      arc_emac_probe()
        devm_request_irq(..., ndev)
      [probe fails]
      goto out_netdev;

      free_netdev(ndev)  // freed!
                                       <Interrupt fires>
                                       arc_emac_intr()
                                         ndev = dev_instance
                                         priv = netdev_priv(ndev)
                                         // UAF! Accessing freed mem

    return err;

    devres_release_all()  // Driver core cleanup
      devm_irq_release()  // IRQ disabled too late!

Fix this by using devm_alloc_etherdev() instead of alloc_etherdev().
With fully managed allocation, the devres mechanism ensures proper
LIFO cleanup order: IRQ is released before net_device memory, thus
eliminating the race window entirely.

Remove the now-unnecessary free_netdev() calls from both the probe
error path and the remove function, as the memory is automatically
freed by devres when the device is detached.

Fixes: 6eacf31139bf ("ethernet: arc: Add support for Rockchip SoC layer device tree bindings")
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/net/ethernet/arc/emac_rockchip.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/arc/emac_rockchip.c b/drivers/net/ethernet/arc/emac_rockchip.c
index 780e70ea1c22..a695ea6547c8 100644
--- a/drivers/net/ethernet/arc/emac_rockchip.c
+++ b/drivers/net/ethernet/arc/emac_rockchip.c
@@ -103,7 +103,7 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	ndev = alloc_etherdev(sizeof(struct rockchip_priv_data));
+	ndev = devm_alloc_etherdev(dev, sizeof(struct rockchip_priv_data));
 	if (!ndev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, ndev);
@@ -240,7 +240,6 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 out_clk_disable:
 	clk_disable_unprepare(priv->refclk);
 out_netdev:
-	free_netdev(ndev);
 	return err;
 }
 
@@ -258,8 +257,6 @@ static void emac_rockchip_remove(struct platform_device *pdev)
 
 	if (priv->soc_data->need_div_macclk)
 		clk_disable_unprepare(priv->macclk);
-
-	free_netdev(ndev);
 }
 
 static struct platform_driver emac_rockchip_driver = {
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89B3CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNmUk6ZhObM4LfmdP3/ziFxF5YJDbBe7swH2WnfOgpM=; b=aEGfSkBWPbInvDcJN1Cs6hkNR5
	LCeFI1U/7qaMMMjIqOLECq5+DpFcnnxLL/VmnlJMvYJa5mWYwRm4tuSGk6WEA/ZD4B9gO2vQt99b2
	6/3VS+X0CpWirJNzNcPCH2Yu7yPEg0ZkD5jUyRSNZhvstl8OsGdv2UCX3bAIwQR61DvDdZ9XEtSB+
	QKFQWFFL+6uVIZ/hn1Qt9Ss+BFLw1Q/4qHoTLaCP/BnHWPkW5jjZWMj7WkB6zWxj1zUcjTlIeYtP0
	NcZyOdLWEOEcofxOavGj9GpGeHAfumf8PuErIkxcBfFoGytpTAeV75J1f1RDjNFxA1OeKetkK1FaX
	SOu+9LAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8vE-00000004FaY-2HXg;
	Mon, 15 Sep 2025 13:07:08 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8vB-00000004FZ1-3f7n;
	Mon, 15 Sep 2025 13:07:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uy8v2-000000005zY-3dY8;
	Mon, 15 Sep 2025 13:06:56 +0000
Date: Mon, 15 Sep 2025 14:06:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Changqi Hu <changqi.hu@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Steven Liu <steven.liu@mediatek.com>,
	John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] tty: serial: 8250_mtk: manage baud clock in runtime
 PM ops
Message-ID: <4a199adc63de9159865a48b7ded2048d45712d91.1757941345.git.daniel@makrotopia.org>
References: <2de07b0a6d51d5d3bf3e55cd03cf75adfc91ee7d.1757941345.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2de07b0a6d51d5d3bf3e55cd03cf75adfc91ee7d.1757941345.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_060705_914476_7E69220E 
X-CRM114-Status: UNSURE (   9.92  )
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

The baud clock is gated on some MediaTek SoCs and can be managed by
runtime power management.

Disable and unprepare the baud clock when suspending the UART, prepare
and enable it again when resuming it.

Fixes: e32a83c70cf9 ("serial: 8250-mtk: modify mtk uart power and clock management")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: add this patch as suggested by AngeloGioacchino Del Regno in
https://lore.kernel.org/all/8b1c1796-6de2-4526-9a29-d8649141b878@collabora.com/

 drivers/tty/serial/8250/8250_mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index 9329ed1f759d..5875a7b9b4b1 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -435,6 +435,7 @@ static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
 	while
 		(serial_in(up, MTK_UART_DEBUG0));
 
+	clk_disable_unprepare(data->uart_clk);
 	clk_disable_unprepare(data->bus_clk);
 
 	return 0;
@@ -445,6 +446,7 @@ static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
 	struct mtk8250_data *data = dev_get_drvdata(dev);
 
 	clk_prepare_enable(data->bus_clk);
+	clk_prepare_enable(data->uart_clk);
 
 	return 0;
 }
-- 
2.51.0


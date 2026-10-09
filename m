Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F72BCA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 05:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WdbeveqM7N6Tv16KBvzRhi0QL6R3QI/o2YFgonCJgF8=; b=FOZxH87B6mXlyiwsdTaRUA3vkX
	gKye09m4PwTJUk5jaGIZY9eOBDM+ZC5opTiVpnVNseeBYf+AnSI4bEVzkU6/yKagDzRZfMSB6ik+R
	nSpe2alnCZYDNqB5uGMp0EhBGC9QoWeGYPErgAo9IWpnD1X50kzSoNGXBYpcjQ/AAY7nH77Ypb32J
	KnHhHDk+s8PErxcKTtRaxmsOr7lbeFMIFnQTVJpLeNBO8LUbBUsxSqIGSw3B01hkBgh43XgDA1VLH
	8EHxmZ/39KbRJbLYvw73zsmzoy7e5HfU0mi5P1U/pg8BYBrQvODpW0o4rh3w75P3fKYlC8mQOH/EB
	fHD6hj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3IM-00000005Xzs-3APZ;
	Fri, 09 Oct 2026 05:37:26 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3II-00000005XzB-0LkC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 05:37:24 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAD3_jyNfchqKC0dCg--.3528S2;
	Fri, 09 Oct 2026 13:37:18 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: fsl: cpm1: tsa: fix wrong clocks released on cleanup
Date: Fri,  9 Oct 2026 13:37:20 +0800
Message-Id: <20261009053720.3146117-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAD3_jyNfchqKC0dCg--.3528S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4UtrWkXw4kGFWrCw4Durg_yoW8uFWUpr
	Z3KrWFvrZ2qFWqgFnrGw4IqF1rta17ta4xKrsxGa1IkrZxJF1Utr1DCa4xZFn5Cr1UCFsr
	XFyUGFs5G3WUArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUqqNKUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgYPA2rIYxBI6AAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_223722_496830_CC681624 
X-CRM114-Status: UNSURE (   9.93  )
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

tsa_of_parse_tdms() gets and enables tdm->l1tsync_clk and
tdm->l1tclk_clk in addition to l1rsync_clk and l1rclk_clk, but the
error cleanup path releases l1rsync_clk/l1rclk_clk again in the
l1tsync_clk/l1tclk_clk branches. The tsync/tclk clocks are leaked --
never disabled nor clk_put() -- while rsync/rclk are clk_put() twice,
underflowing their reference counts. tsa_remove() has the same
copy-paste bug.

Release the clock actually held in each cleanup branch.

Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/soc/fsl/qe/tsa.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 4a88e54d25b9..502e2ffe8689 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -865,12 +865,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			clk_put(tsa->tdm[i].l1rclk_clk);
 		}
 		if (tsa->tdm[i].l1tsync_clk) {
-			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
-			clk_put(tsa->tdm[i].l1rsync_clk);
+			clk_disable_unprepare(tsa->tdm[i].l1tsync_clk);
+			clk_put(tsa->tdm[i].l1tsync_clk);
 		}
 		if (tsa->tdm[i].l1tclk_clk) {
-			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
-			clk_put(tsa->tdm[i].l1rclk_clk);
+			clk_disable_unprepare(tsa->tdm[i].l1tclk_clk);
+			clk_put(tsa->tdm[i].l1tclk_clk);
 		}
 	}
 	return ret;
@@ -1039,12 +1039,12 @@ static void tsa_remove(struct platform_device *pdev)
 			clk_put(tsa->tdm[i].l1rclk_clk);
 		}
 		if (tsa->tdm[i].l1tsync_clk) {
-			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
-			clk_put(tsa->tdm[i].l1rsync_clk);
+			clk_disable_unprepare(tsa->tdm[i].l1tsync_clk);
+			clk_put(tsa->tdm[i].l1tsync_clk);
 		}
 		if (tsa->tdm[i].l1tclk_clk) {
-			clk_disable_unprepare(tsa->tdm[i].l1rclk_clk);
-			clk_put(tsa->tdm[i].l1rclk_clk);
+			clk_disable_unprepare(tsa->tdm[i].l1tclk_clk);
+			clk_put(tsa->tdm[i].l1tclk_clk);
 		}
 	}
 }
-- 
2.25.1



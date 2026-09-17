Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D7FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TyhZ9S0Df/ZDM4tE/XY2GPlgaEVGh88Sx1h9iBIwqD0=; b=F8XrhV9ywF9/UKPaCTNQoU+4NH
	Gr028AUwQ8V1q7HzbDQ0jn4cLEBUlFF6byFwc8rhy6LNyIEeSSgK4rsGKFbSU7mki1CFcnkn5gdKs
	vrzF0/S/lBLZUAipHb6w4DSpgAEWdzu8JDrgT86huDOd2+BmXGG8CyTfHG2LoflLn/Uy4fOuZUBiq
	J2YPd/ihMo3cEDoPkKms7SC1RIzPy1+PzsngByyraVaqntgPHxE6GAioli/AYaUmtF9E6NMrrhgjd
	Ozs7dx2H587FlxbbGSS06yDCdtnR0XX98Ive/9crSG6dvpINpRJnBWG5U85ZtV/XR5XPl1f1QJV0D
	UC8s5iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ENs-0000000BlOC-0Egu;
	Thu, 17 Sep 2026 15:50:48 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ENn-0000000BlKL-0bqD;
	Thu, 17 Sep 2026 15:50:46 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABn0TtNDKxq896DCA--.6140S2;
	Thu, 17 Sep 2026 23:50:37 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: angelogioacchino.delregno@collabora.com
Cc: gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	nfraprado@collabora.com,
	sboyd@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] spmi: mtk-pmif: Fix clock reference leak in mtk_spmi_bus_probe()
Date: Thu, 17 Sep 2026 15:50:37 +0000
Message-Id: <20260917155037.2161027-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABn0TtNDKxq896DCA--.6140S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry3trW7KrWDZryfWryxAFb_yoWktrXE93
	yxArZ3Xw1xtrsrWw1DJFn8XFZ7u3ZFvr40gF18ta43ZryDZFykJFZ8Zr9xJ39rZrWkK34U
	GFyDZws7Zr1fJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfxYjsxI4VWDJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwCY1x02
	62kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr
	1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I
	0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x07UXJ5rUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQNA2qr9LY3tgAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_085043_546774_293798E5 
X-CRM114-Status: GOOD (  11.01  )
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

of_clk_get_by_name() returns a reference that must be released with
clk_put(). If the lookup of a later clock fails, the function returns
without releasing the clocks that were already obtained. Put those
clocks before returning.

Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/spmi/spmi-mtk-pmif.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 1048420b5afb..9323a4adefe5 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -726,9 +726,11 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 	for (i = 0; i < pbus->nclks; i++) {
 		pbus->clks[i].id = pmif_clock_names[i];
 		pbus->clks[i].clk = of_clk_get_by_name(node, pbus->clks[i].id);
-		if (IS_ERR(pbus->clks[i].clk))
+		if (IS_ERR(pbus->clks[i].clk)) {
+			clk_bulk_put(i, pbus->clks);
 			return dev_err_probe(&pdev->dev, PTR_ERR(pbus->clks[i].clk),
 					     "Failed to get clocks\n");
+		}
 	}
 
 	err = clk_bulk_prepare_enable(pbus->nclks, pbus->clks);
-- 
2.34.1



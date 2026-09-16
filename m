Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E064FC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gHf2rQ+Wo9rcDeu4WWDYzPPiRMHLAgDYZ101XcV3uQ=; b=KomUXYbjTAv13xLwgzVuQdP8ON
	SquUT2Bly1s/adD7Wiwf/nYX+9pfIJFI/nEHSc8RiKSMEq6p3qTvM0LHqx3SJCAsMkgMHsuPXW7G1
	Y1+omw3z+o2jly2eFFLpXM4FI8d5n9iaqP6lFOfulw5YvA5MmNHll3w+7dXXgd6ZDKJJklAcovFw1
	6FGXIBm2uYsDFTnbOZIszJUdVcm/h+JUH2QRobSyFVu9uMPPrJAf0cOPUuh18AyvmbhwzS/ZAdpWr
	R9FEUyxFPtfj30SKHU8YjNIptNLKaceDqAawbuVZAYt6Wg3ixM0Zw8STnvOBitOCy1Y5MXX50u5iK
	/WwyypLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jfL-00000008YAd-25Vq;
	Wed, 16 Sep 2026 07:02:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jfJ-00000008Y9x-2t3T
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3gHf2rQ+Wo9rcDeu4WWDYzPPiRMHLAgDYZ101XcV3uQ=; b=MnwXe7S45UpoE7as5sY/9qJt0d
	ETtcRCN+Rag9Y1euoI6rdEpts58R4jSVPriT6tSthQvAnpf30skB5aemT0U97sxUEWIhxNKjBBeU4
	2ClU2hbl8WgaEs4pXM3XVCE/8sTxucKpaQjWF3HfRbr93WAtt9qxUFFuPui9PucxvoJ+Duw0oWGkQ
	IDpc3NitSshyDEWJEamsuLethva3tOtTCxm1NcHJD+ggdvBoEhS4S/ts66wqcKqTdksl2SR+XxeYM
	5ov2bsLpXuRuvjkhhRQ9zKEo79mtDTcvhZAMPFOAb2q7AIjo6SYh1zCmETzNnimfV4fAZaSmHzK8t
	DWdAlQug==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6jfF-00000007ZCk-2vhN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:02:44 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABnbDoKP6pqPeHeBw--.40270S2;
	Wed, 16 Sep 2026 15:02:34 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	schung@nuvoton.com,
	ychuang3@nuvoton.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH 02/20] rtc: ma35d1: Fix clock leak in ma35d1_rtc_probe()
Date: Wed, 16 Sep 2026 07:02:06 +0000
Message-Id: <20260916070206.1965294-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABnbDoKP6pqPeHeBw--.40270S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF13tF4fZw15Zr13tr17Awb_yoW8GF1fpF
	s3JFyYyryayrWrKayDGw18AF1qyayxKa48K3yvk39ag3W3ZF1UJrZ3tF109FykJrWkXr4Y
	qw18JF1rGa1UuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFOzVUU
	UUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRIMA2qqBo79QAAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_080242_472808_69808A13 
X-CRM114-Status: GOOD (  10.54  )
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

In ma35d1_rtc_probe(), the clock is acquired using of_clk_get() and
enabled with clk_prepare_enable(). However, if subsequent operations fail,
or when the driver is unloaded, the clock is never disabled or put,
resulting in reference count and resource leaks.

Switch to devm_clk_get_enabled() to automatically handle enabling and
resource cleanup on probe failure or driver removal.

Fixes: dc0684adf3b6 ("rtc: Add driver for Nuvoton ma35d1 rtc controller")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/rtc/rtc-ma35d1.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ma35d1.c b/drivers/rtc/rtc-ma35d1.c
index cfcfc28060f6..43358d68565a 100644
--- a/drivers/rtc/rtc-ma35d1.c
+++ b/drivers/rtc/rtc-ma35d1.c
@@ -221,14 +221,10 @@ static int ma35d1_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->rtc_reg))
 		return PTR_ERR(rtc->rtc_reg);
 
-	clk = of_clk_get(pdev->dev.of_node, 0);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to find rtc clock\n");
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	if (!(rtc_reg_read(rtc, MA35_REG_RTC_INIT) & RTC_INIT_ACTIVE)) {
 		ret = ma35d1_rtc_init(rtc, RTC_INIT_TIMEOUT);
 		if (ret)
-- 
2.34.1



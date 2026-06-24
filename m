Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD80ACDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 05:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=igfcRZrLncBRIhWwfYp61sZtgIIfEX6+XnP8Grqi7do=; b=2XeBBYk68aKcx2La/R9LG83XVa
	82kzohGSjF/QdKUN536cm9OlldFvDMw46cxOtvxZC4Rfhski0OavQsV5GB1W/ygwHeT+5t6Xpnbt6
	vOipK6b+UEIi3xvgGOZCYOKjhLAHNm3LpQYh7DJPEmyekbkmJHfu5yCoG1H/z+gC1Qd0x9qqyRm3Y
	OpuxcoMVi4fYDdmp/wJ1mFQTrUufw8sW2CQQGY4QVpXAZAvNsBaKhUDi/dOq440Kp5Somcpwel166
	K1r+2RK/S58WN2WiRcxZ3eQ24tcUmI9wFINrLk/7am8XR4Bc8h1nnElz5IrOC0k/spvPAPdZZFMXS
	m39G6Qow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGaH-00000007CI3-0Ccp;
	Wed, 24 Jun 2026 05:55:37 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGa7-00000007CEI-1Kto
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 05:55:36 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACXaZBMcTtqhSCtFQ--.13594S2;
	Wed, 24 Jun 2026 13:55:24 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] rtc: zynqmp: Return optional clock lookup errors
Date: Wed, 24 Jun 2026 13:55:24 +0800
Message-ID: <20260624055524.38522-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXaZBMcTtqhSCtFQ--.13594S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1rKw4UWF4rtF4DZr13Jwb_yoW8Gr15pF
	Z5AFyYqFyjyrWxGas8Kry8uFyFk3Wfta1UGFy8Jw4v93W5tF1UGFZ3KFy8ZrykCFyvkw43
	Xry5t3y5CF1Uuw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU089NUU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_225527_846908_FBE0DD5E 
X-CRM114-Status: GOOD (  10.83  )
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

devm_clk_get_optional() returns NULL when the optional clock is absent,
but returns an ERR_PTR when the clock provider lookup fails.  Probe
currently keeps the ERR_PTR and then passes it to clk_get_rate().

Return the lookup error instead.  A truly absent optional clock still
reaches the existing calibration fallback through clk_get_rate(NULL).

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/rtc/rtc-zynqmp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 2ae54804b87a..5bcb7536e973 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -334,10 +334,9 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 
 	/* Getting the rtc info */
 	xrtcdev->rtc_clk = devm_clk_get_optional(&pdev->dev, "rtc");
-	if (IS_ERR(xrtcdev->rtc_clk)) {
-		if (PTR_ERR(xrtcdev->rtc_clk) != -EPROBE_DEFER)
-			dev_warn(&pdev->dev, "Device clock not found.\n");
-	}
+	if (IS_ERR(xrtcdev->rtc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(xrtcdev->rtc_clk),
+				     "Failed to get rtc clock\n");
 	xrtcdev->freq = clk_get_rate(xrtcdev->rtc_clk);
 	if (!xrtcdev->freq) {
 		ret = of_property_read_u32(pdev->dev.of_node, "calibration",
-- 
2.50.1 (Apple Git-155)



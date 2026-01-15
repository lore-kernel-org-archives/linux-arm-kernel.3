Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2293D3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ieCfMt02g5PkyDbzSDXCUy1JmlbaHrmoOcZmySeh3bo=; b=JwE4tuokzWKjIdDV7O8oDu7KW1
	baL6ux1v+Sqz/hScTYBwVUpEQwAWsiJqyO7+EuEI70d0ejKY/j8KlVs9SEIFCI23ifeNpzXT/MNqR
	nwG74V25oLnH6dcSyITegtJxxkceTsNv8x14t4yp0CB7xmKv0dx774Hz4fweeEm6GxkGLwz9UwGH5
	CbN+Jpt1BQ/z2S24xMPwXuFkECy4GqlSuByxm/Un5ijppAEOYJ9EWKRWeiCIDIMbSV4MaLYHL1GF4
	r0x/hdwlQ8RG6Lbvs4AJ935EPfgXM6Vmc5ZcU2JK/4/4Wt27DIoN9pallA5Lf7zuWIWUJohkRhk3l
	WLHkTvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDG3-0000000BZ5T-3PuF;
	Thu, 15 Jan 2026 02:38:47 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDG0-0000000BZ4Z-2vf3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:38:47 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABXZMsuU2hpD2YxBQ--.43886S2;
	Thu, 15 Jan 2026 10:38:38 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: dwc3: google: Remove redundant dev_err()
Date: Thu, 15 Jan 2026 10:38:00 +0800
Message-Id: <20260115023800.4142416-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXZMsuU2hpD2YxBQ--.43886S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1xtry3JF1ktw4kGryUZFb_yoWDCrX_C3
	48CrZ2k3yDA398tryjvr43ZrWUur4rZFy8uF1qqa47KFyUGayUXry0gF95Ga4xZrW29ryD
	urs8Crya9r93AjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_GcC_XcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUbEfoUUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_183845_118133_C3AFE10D 
X-CRM114-Status: UNSURE (   8.74  )
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

The platform_get_irq_byname() function already prints an error message
internally upon failure using dev_err_probe(). Therefore, the explicit
dev_err() is redundant and results in duplicate error logs.

Remove the redundant dev_err() call to clean up the error path.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/dwc3/dwc3-google.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
index a19857bd6b13..2105c72af753 100644
--- a/drivers/usb/dwc3/dwc3-google.c
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -228,10 +228,8 @@ static int dwc3_google_request_irq(struct dwc3_google *google, struct platform_d
 	int irq;
 
 	irq = platform_get_irq_byname(pdev, irq_name);
-	if (irq < 0) {
-		dev_err(google->dev, "invalid irq name %s\n", irq_name);
+	if (irq < 0)
 		return irq;
-	}
 
 	irq_set_status_flags(irq, IRQ_NOAUTOEN);
 	ret = devm_request_threaded_irq(google->dev, irq, NULL,
-- 
2.25.1



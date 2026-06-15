Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A123ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZuPeXEEpJBJ92jZukUX/Rf84WkOFubIDHDKAwg0+Ffo=; b=bdsXC3m6MPVxDEUgKn/Y/Tx+ju
	jRAVbl7pZM4dJpEfda/LCRIoe4cBfSCLp7+8J7TwNVpnvCFY1V4r5zlfDXDv/6bZpSFJxRf/OQIA6
	l4ylZS8fcaXDKLqaQlazb50uOszdTk5fXIrmftdPECbwh2MFtjeFNdflxrvpCLju9GlA/33jq1eTR
	d5F/5EeCng726DcP7i+zn9VSfLbYv+ir3MMXY4lsgOkkJpnoL60qvBC6mjKRQWsj1uHEfCJHrTQNy
	5wD/lF5a6hi8zc8FddWnsX8DxmbgwbjfhFvaUX/ZgaK4B79ri6UqA0gnfV3mY0OCdPDfYorB5GF/u
	Er6BBGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0qW-0000000Dgp7-3cm7;
	Mon, 15 Jun 2026 06:30:56 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0qR-0000000Dgoa-1Bpm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 06:30:54 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAndcgTnC9qrGaTEw--.34107S2;
	Mon, 15 Jun 2026 14:30:44 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] mfd: stm32-timers: depopulate child devices on populate failure
Date: Mon, 15 Jun 2026 14:30:41 +0800
Message-ID: <20260615063042.36397-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAndcgTnC9qrGaTEw--.34107S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw1xJF15JFW5Gry8uF48JFb_yoWDuwc_W3
	Z8uFn2gr1Fqrn7tr1xtw1rZrySvFWDZw18JF13Kr42gFy3Zr15ZrWDZr1DG3WUua1jkF15
	WayDArW2ywn3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_233051_694480_3D626976 
X-CRM114-Status: GOOD (  10.45  )
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

stm32_timers_probe() releases the timer DMA resources when
of_platform_populate() fails, but it does not depopulate any child
devices that were created before the failure.

The remove path explicitly depopulates child devices before releasing
DMA resources to avoid races with children using DMA.  Apply the same
ordering on the populate failure path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mfd/stm32-timers.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
index b3dbc02aaf79..1f0aecae83a5 100644
--- a/drivers/mfd/stm32-timers.c
+++ b/drivers/mfd/stm32-timers.c
@@ -329,8 +329,10 @@ static int stm32_timers_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ddata);
 
 	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
-	if (ret)
+	if (ret) {
+		of_platform_depopulate(&pdev->dev);
 		stm32_timers_dma_remove(dev, ddata);
+	}
 
 	return ret;
 }
-- 
2.50.1 (Apple Git-155)



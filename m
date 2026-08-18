Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ABAC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 13:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Subject:From:
	Message-ID:Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fjtyryIYmmBpuRdf3jOKdD9JLI/NGQs9gcidVZKkY4Q=; b=c1I6lD26eXiJEA7uFeHIBvO+Zv
	D1GBGNrWkO9GNYkdvbxEXNPkgA6CujC1C28kvjBgPrWHP3WSvAU29hhDGjp4UZQsV+ZpcQgw1ZlMT
	E6+IMmAdw3J//9efSayWhmitzBZ9yVkizMm7GllYJOEgGi7Uz5OFWMg2rTFiCZVZ/cmyjUtKxf5S9
	oUaM39b4xWtQy/lmxvfCihUxS+oN93DSCt2rd7iFHl0/KpO4SWjWord52fxzkp9gIb6lBsTq9gklO
	iAHvqO7eMn8M70xCXn0sxj0FCgg0IcM//Lxdl5GBcGz3eBsdHH8Tbco7taRr0AR9MAzanIRaY+XoC
	RMcP2SzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJnf-000000082Oi-0QQc;
	Tue, 18 Aug 2026 13:24:19 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJnc-000000082OG-3lpC;
	Tue, 18 Aug 2026 13:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787059454; bh=fjtyryIYmmBpuRdf3jOKdD9JLI/NGQs9gcidVZKkY4Q=;
	h=From:Subject:To:Date;
	b=HsWQyjiC5NEdYQp0Fy2i3yj0XXBOnCJaOR58FV4LZ5v2v7su+Hh9QUeg2qTK9Uww6
	 GhqVThD7giUCf8JHWvbW5coldsV4iFk8+3gcHWGMcQw7imH3cs/4flWWkLuPLaZHHF
	 IOWvBS+Rur+3N/m2w7MRo3uLOhZmSrHdat4VCsxk=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1721C6D8; Tue, 18 Aug 2026 21:05:50 +0800
X-QQ-mid: xmsmtpt1787059362tdf415oc5
Message-ID: <tencent_D59EA2224872DD712706C0EE5FFC4AE27A07@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoenuvFrsb4R9ybDGvmupbXOnUzUThfySO2oTEKwR0b9ZJEBJDZBS
	 UxYmoQD6eu8IV7/Oo28c6OQkJsXG462njTtfZp8i80oucCWsvSESAoq3OxUXI7ji5yl931XM9hVu
	 5LLW+JZPOYyIRGQmmsK7E5ExnbV3N3a3uxxej0vRHO7KIw9dbr7RpUeYJK6Sa3XJlKbdsG4kpAiS
	 pnnmqLOO4tvdTuS/r3223svzjvcLkzzSP3ZFI1H34JJiaUYsYnqYhdlDeQefMmaQdDFop1jNNmE0
	 pfkTQ53116Ds3v0uQDSa7MSJH052y8CZ8MLTtYUSHK6jwdJI9Or1whscFHW09xJJmQtsiyurEHeJ
	 LDyPweuHjaKtFCVtxeEUttgfo4IdhvcXv4N+yp+sFY2vjqjmyFqwEXJhzbY+GSNajxccE36t+PKS
	 CfDw0FcGVhlRM4vc586hpwi4nX8c/Stkw2gHv1b8C6JPujYeR4wCW0ZqgEWKsfH1QD25PCmYAQou
	 /EtUvirJOCm6rp54XTYhcLlFNcdqcrFcSLVTRFBnSvHByQn03g1puIhQDII0nBbIwkmP1TlUh77z
	 K68HTM3G6wd0ypFc7plHw3R6uHthoLazlM92oU7qAUgn0YEELX+DDZwDIU2sNZpzTsjaVVEN9X9D
	 BcLzqMvepCiPuAn/H9T2j/NYilVLLkLkecuh7J29dNb+EuEdW4WmQVlsxE+Eyjc/O5NNK41uIZgO
	 zeUXz/GqBDm3DoDyDN0odR/JJnmoMhT2oWzfEdNH1pPDY60ytbl1PxRwutEcx/eKTIwqcWh8iVCA
	 bo5WXdTi6YYf7L5J1Z2Fq9MwmeRHHvoLoOCwDakJvGjaGTBNcmHSL+mz7YiGaS8srOtQXkOq1IaZ
	 unsdnfCoZ9k4YRl1eXs7XindukaqTM5/ZpeO9zk8EVovsgUF5ESpHQGzuLLt+IhwkfWnknQ+lP47
	 e+xV051UenDpRbFKmsBiU6uPGMgHr9MJzssZY4M1AfL/nBsambPQfpGcKlJJYXmKYyweq+3coipQ
	 sIH1OMHTnX1Y2PpQz2cJJPK7E9Mt/m99Bg/LnuY32Ntwzdh/5dVVVoF933qac=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Jiawen Liu <1298662399@qq.com>
Subject: [PATCH] mailbox: rockchip-mailbox: use devm_clk_get_enabled() for
 probe cleanup
To: Jassi Brar <jassisinghbrar@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Date: Tue, 18 Aug 2026 17:24:12 +0400
X-OQ-MSGID: <178705945273.291840.7809734835578127304@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_062417_247505_714836B8 
X-CRM114-Status: UNSURE (   5.65  )
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

Make clock enable devm-managed.

Probe enables pclk but later platform_get_irq/request_irq/mbox
registration failures return without disabling it. No remove cleanup for
non-devm clock.

Use devm_clk_get_enabled() for pclk cleanup in rockchip_mbox_probe.

Signed-off-by: jiawen <1298662399@qq.com>
---
diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -196,17 +196,11 @@
 	/* Each channel has two buffers for A2B and B2A */
 	mb->buf_size = (size_t)resource_size(res) / (drv_data->num_chans * 2);
 
-	mb->pclk = devm_clk_get(&pdev->dev, "pclk_mailbox");
+	mb->pclk = devm_clk_get_enabled(&pdev->dev, "pclk_mailbox");
 	if (IS_ERR(mb->pclk)) {
 		ret = PTR_ERR(mb->pclk);
-		dev_err(&pdev->dev, "failed to get pclk_mailbox clock: %d\n",
+		dev_err(&pdev->dev, "failed to get or enable pclk_mailbox clock: %d\n",
 			ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(mb->pclk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable pclk: %d\n", ret);
 		return ret;
 	}
 



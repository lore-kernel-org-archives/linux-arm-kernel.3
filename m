Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D990C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqEO/z6YEkWBhWY4wN4MgMb0Pt/YVr8jLvhFwv5n570=; b=KIHUbT14V2tXAj5R7bUswDxyfS
	6GW7X4yalIKO4N+MFrQ7aSI3gS6/NOxQM9HjkA4KOAj9cLz9I0rMIU8x3n9qeNtRzNJd2/yo0wb4f
	09RAQ8k4pAfEqBz6LwaFukTvtqFYhLJSW3mHdAN6Kb2o598MgHMQyFD2zgAdTScM1J9x+Ibf7UL29
	1xCKTU2xQr9tV8S2qU0xhRY7c196cJOdF6bES5jaCF82URPzw856ZB3W2D7FZuhfdGUW+v7mlzjad
	rbaRLkeGV0DX104gWX2uYd0VPvTBUq8ONDUJLdsn19qhcJS8mD7i2aUiXrOxEODPzu+oMS2kJXdJk
	s97NVXAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdEa-0000000CBQC-1b0v;
	Tue, 14 Jul 2026 13:31:40 +0000
Received: from out162-62-57-64.mail.qq.com ([162.62.57.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdEU-0000000CBO5-2rrJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035885; bh=ZqEO/z6YEkWBhWY4wN4MgMb0Pt/YVr8jLvhFwv5n570=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nluAfU3JvzetJA5AV9NaC6b2Zfu29adLwPNwskuBo0iDfyTKeW7zR04QLIH3qlZl0
	 mnjqvtfLT/jAqgBHzMbBuZhL25NDBwrmhiYoaWRy0q/2HH0Hgkk4LP3HxNUGE5Zds4
	 DRVm4H06R4WE15znnmYmOAP6NvRYcjby+axwiEQ4=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7D5A9C39; Tue, 14 Jul 2026 21:31:21 +0800
X-QQ-mid: xmsmtpt1784035882t2pnv3uk8
Message-ID: <tencent_C245DB15F66403C1D9EA90BC06987A016509@qq.com>
X-QQ-XMAILINFO: NsBBv6AnqV8OKtR1o+3aEXajI7MGfn/JvzwpgweyxOGiVlu/WtUPYn5Msdtq44
	 KYlnZKV2DtV0vBeOnWMaWhzPpLVt/3QHY6xdk0dqmCuFm6wl4BfGAOtdFNsbQkAcok49U5yr6paA
	 Cyr8M2xA4LZ+bEJuczWeciypGtDyaXcysuZN8fUSoancUiuO2RhB1Hj9jaNXBKA85PFGhbl6A3kl
	 ikt4N6sPrAembactNbIcvM4x7qa0ZA5N5Ja20gUIR+is8skh1orFKpOPaA8kN3MqrhugQBXiTS74
	 mhn63IYUG0VSm7B8yNv9outjGShO49VlH8G39T+pRkHXN6I4EXUK2PJ9zPpNXm0ZnziG36xH2Zcg
	 jCty/M4pHaUBmsJAXxkqJCdqvk4P8DPG812V4WBijiYJUOjaoUP4y6H20HJTTcdziKq3zElRKpik
	 qnV5yFi3K7RvERXnRymKw1nhroQ8cvCd41xt3wRk38w5tUWBVMBpu3qICsanNnMfMhg6EBliXL+n
	 CFKUALSvo+o+IDvXmIn6AC14IryBc/VAaWjdmglf2I4NTYO4zJfDIqQBBuAwku8/gpAC0n0XL2Vg
	 0MAF/bdDTF1YWR5ZH6Bvg5d9CvYm+E2U48jzhTwiBKCkUYQJHt5xp4/XgR5aNY6AbIRFafdxB+dC
	 1ZASl5xXwl6wiAXZUllC+wFFVjiTCCuPK3Kq9kkcSZEIqc2BuLd6Yp4gDRKqL1s1TwUTOD09rMEr
	 6tPG8IcNRkOR+hZ9AtRfZH4dCIdnoT3leP39BpQGeO5t+zr6M8jWKR6eZD2hlJY7Pyt1RAdHopLE
	 2GWjFr9znq6nnxcZ0uG8Es4qb3kx0JkM7mxbReto5vXCkA+yfl6pDRyosVsGeZTeU51rfYQCXeuF
	 HP1yv08UwvwaGhoxXHu0tfLAlwX6EMT+T+dYBVpP/Q1xQGm6UuYhnkQb19Yk66P83ZNFtG8NsLtp
	 9Mne2Ck0ig1IS5QKWRca3IZWcCiC91LxopEvfZeoZ0/57ANHlHtyj9nib3oOo47uJXiNiII3ij/r
	 s1lBZBZPTEDxrmV50ZaKRkm4eRl7fHqZM3gimvwC7IRn6Iv08UD5UxJad5D2Tgd/5osYjDEQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 16/16] irqchip/bcm7120-l2: fix parent IRQ count error handling
Date: Tue, 14 Jul 2026 21:24:52 +0800
X-OQ-MSGID: <20260714132453.3302672-14-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714132453.3302672-1-920484857@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_063135_288736_C872E42C 
X-CRM114-Status: GOOD (  12.31  )
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

From: Haofeng Li <lihaofeng@kylinos.cn>

When platform_irq_count() fails or returns zero, probe reported -ENOMEM
even though no memory allocation failed. Negative values such as
-EPROBE_DEFER were also discarded, which breaks deferred probe.

Propagate negative errno from platform_irq_count(), and return -EINVAL
only for a zero parent interrupt count.

Fixes: 3ac268d5ed22 ("irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-bcm7120-l2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index a98f0ee46b6c..9f412c0be6d7 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -225,9 +225,13 @@ static int bcm7120_l2_intc_probe(struct platform_device *pdev, struct device_nod
 		return -ENOMEM;
 
 	data->num_parent_irqs = platform_irq_count(pdev);
-	if (data->num_parent_irqs <= 0) {
+	if (data->num_parent_irqs < 0) {
+		ret = data->num_parent_irqs;
+		goto out_unmap;
+	}
+	if (!data->num_parent_irqs) {
 		pr_err("invalid number of parent interrupts\n");
-		ret = -ENOMEM;
+		ret = -EINVAL;
 		goto out_unmap;
 	}
 
-- 
2.25.1



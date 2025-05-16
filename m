Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E19C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoyVE6dpJCpwp1H9KqJqcvA2x5V44zAwPbJ/sKD6YuU=; b=mFcB2ZtTOuQNfOyw8LG48Tdvea
	DR/s6N7YgkFhfA3I+2oViov8BXWqae3FQn4bbKXszzYIZ0nj8ZJR7wg5OpIY5IWvzyIgdv25wGmmO
	3DM3LsqLEv5Llq1a7lJ2zPADBBaLWBGFWuDcGPROhMzUeBo87BqmQbeD8eT3VnbSBU9u2zihD0DD9
	KWUbg+7f+synPLFCh/BAGBEhLZizSIpC3ACpGuw5AdjP2IXNQIrKyHX//Neq27rYxKQGIirkBn9ig
	SCQsQ1fvthBcXZ/g9zzHO5RexChWNJtLdNAblREwc0SUVbaATzVZxU7CHrsvRLtlOutDFrVF/GiPh
	XtG+688w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpYc-00000002fZX-48zh;
	Fri, 16 May 2025 07:32:38 +0000
Received: from mail-106113.protonmail.ch ([79.135.106.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpQE-00000002efg-0AzF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 07:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380235; x=1747639435;
	bh=NoyVE6dpJCpwp1H9KqJqcvA2x5V44zAwPbJ/sKD6YuU=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=bpvYxcmyKBKyZtEzTff+rBq5lrNHbd8ut+AbdGyrEOTFWNPX6wt6kZhg0dYJ7xF+O
	 O4AJnstf6qgXfhbKJ/xhzqsuaK6tqzETplLwPwFZmMbKCQKyyKnm7+zCGxAzuN5o1a
	 qAcliW8UgZVUKWvo+dWgmUUzB+QUb012o16oov5Hxl5wswCVG1rEcd+NtYrdmQ2t0x
	 hcfIOkCKGO1fya1RXOt0Z2EGkGqhIdBsZzIZKHdoVHr94wnI5ZO+9TjcKw4K7GpzAK
	 eXqNHO2ynDkRdhLOwnXohBqFY7JIUjqAUtEzulKoa4zmYSAAQjX86lx3uYfnD+8juk
	 KP1h7Evv0coCg==
X-Pm-Submission-Id: 4ZzJV26PJ3z4wx9c
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:37 +0200
Subject: [PATCH v2 3/5] rtc: cpcap: Fix initial enable_irq/disable_irq
 balance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-3-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=822;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=2LUSg7Zdz1NxxCnzMbGgag78qSG7v6rups6Hg9AB3eA=;
 b=llEZBEeeVmLuXVENteg1uyQgrCJd8ICMLUoRycqcWl+NviTZd6eJf03YYUk90h3fGrGZoj/s8
 0sYqYaQZH9FCNmbB6X6oqC6ECktj4JoVtm8QUj0ljcpW2Y+Vy4Q0e9b
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_002358_244544_2546F8D1 
X-CRM114-Status: UNSURE (   8.30  )
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

Interrupts are automatically enabled when requested, so we need to
initialize alarm_enabled accordingly to avoid causing an unbalanced enable
warning.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-cpcap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index 568a89e79c11424967d4af239d252a80a073a341..682f85abfa0e9627c8410220c9cebad7371d360b 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -268,6 +268,7 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 		return err;
 
 	rtc->alarm_irq = platform_get_irq(pdev, 0);
+	rtc->alarm_enabled = true;
 	err = devm_request_threaded_irq(dev, rtc->alarm_irq, NULL,
 					cpcap_rtc_alarm_irq,
 					IRQF_TRIGGER_NONE | IRQF_ONESHOT,

-- 
2.49.0



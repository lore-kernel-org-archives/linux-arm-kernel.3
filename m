Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3B3C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhSWaEsAxjdDofu9C1BTEf8HD8mJOrdR0IjKvjQ68iM=; b=YnGs04NW9zcEhR4kSIe1VFK+K6
	J1u19H0XgHrjCElVZjfI9E0v3p+f4VZuVUZMCfxZ6+mwkQfO0j+O3xSaSoLf98JfL/apPG6Ln5Y2i
	7AtZmhxKJWMKRHAIYhoOkXe3bt2qcG0qgkSgSJ7nUseUPNRxlncYEKba6tnIyoUX/+xfBZaFHGnWs
	K/WcyO1KlkPN9FLnEQKF6kAlmKSLrxumLAIex352xynodISxrPUUf8lS0YUd6YzOMNMay8JX5AX1E
	IL5en3/k4j/sNDkYhZ7nV6/uRGaKIQtdr+sv2JX6LTIOmbSm9zsbGYy47isMYM15M07EFasjm3wEK
	3rLkg7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpai-00000002fkO-2wln;
	Fri, 16 May 2025 07:34:48 +0000
Received: from mail-244107.protonmail.ch ([109.224.244.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpQK-00000002egl-36vS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 07:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380242; x=1747639442;
	bh=VhSWaEsAxjdDofu9C1BTEf8HD8mJOrdR0IjKvjQ68iM=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=JS4mAT4PkG/JB4f7BROfMAPAVOZZcR9sLaP0YhAAIMEeaR7fpxZtD83rSJDzuwyq8
	 kYjuOTmCeLS9UAe8GTrtGcPN912TDyPWb2pnof4DFRsrxVeaPhQoAua++dMF4+wFxK
	 aRU+IS8+rjnWKX2WV+T/u2UZleEDIS7haT8KwpHet3BIoDFbXDH5jnsjv0sQ+jUcfn
	 mHheidtx0jVn7+EckzZMJGABp4W8KYacWtYDff/m1BBTO22rOMYvmirXUxTBWrosJB
	 LbPpOsnoLMpayuQal28WgFXHydKyfDoEypTDarYTx5fIeLCfkJKH2LXlgCiJWKE042
	 ZNzWy2opv7taw==
X-Pm-Submission-Id: 4ZzJV419b7z452
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:38 +0200
Subject: [PATCH v2 4/5] rtc: tps6586x: Fix initial enable_irq/disable_irq
 balance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-4-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=791;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=U/FxXzWBUPkyWbts6DT9nfymDyjSzhYDi8F/JF5C1p0=;
 b=RFB+FyPxB1Zn/jZXYG4SbZpVHAX5IN6jkJA2WhR6fZzTG9PyivmIpCHHP/N0uSkd9eVH7SjjN
 QS+BgAHLdlDD6mDODg7OhH5mGnPJZ5LATO5QuIiBMZG2ijXOWWPou/D
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_002404_927642_A09C5003 
X-CRM114-Status: UNSURE (   7.96  )
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
initialize irq_en accordingly to avoid causing an unbalanced enable
warning.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-tps6586x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
index 54c8429b16bfcc692b1f4d5404f0c42f720e93b4..76ecf7b798f0de22aa89a552a263b473ab3065ef 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -258,6 +258,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 
 	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
 
+	rtc->irq_en = true;
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				tps6586x_rtc_irq,
 				IRQF_ONESHOT,

-- 
2.49.0



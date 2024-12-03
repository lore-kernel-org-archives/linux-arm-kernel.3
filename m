Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B33E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WApADZKBlq3j3lJdD1KVN3i3EQ3JBwzraehjqPZ59qw=; b=4aR0WfdiRxMnx+mSmWWBIs4YN0
	W8pOjrz3Jf9jeX0SuVf5oNOhd8CPuidFl9/JOPYwy/uLNPs715FvXD6NQp1b1ssOtwdIfbXlOHL7C
	VlPFLQwyohdxw4doiVs6YcecWaDy5KRa3ltB+Mlj+YQU38C1h7ORBMnV3BgurabBzr4sq5lFoNpVm
	VhYreGYkEgznnSQrTwE6geEMqelPi4CSb6DHZ9/3NowGywKtWvyYn39ZA1qW3nhXjTla4mNX4c5Dp
	Plsp5yGZ9LJ0eivsHq9D4xEGJNcF1t9cUnZSYX5imee4GB7TsSadmHq4591JH3necQKtAiLwY1x/P
	D2zj80Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQeB-00000009Apj-2Qor;
	Tue, 03 Dec 2024 11:00:51 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQPq-000000097sR-0sIt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WApADZKBlq3j3lJdD1KVN3i3EQ3JBwzraehjqPZ59qw=; b=M7uJAsU5fDKbVFglFHGswVCFpu
	wdR3a3HcWQqbcEMsMf8YL9OaxtnrpqFjaAvwk3evdMxSHv0hasZrd5GyKOZ+CDE8l2lGOKFosrlF/
	Wovc0si+FafxjafqCPnndFUKYlaooV5XsW4/wLAsAs0V4aQC53HU6OjcZGDZ/DEVZhziYlEm6Eyzj
	6Vr/5mBxcZ9bdoD3Y73QxVcryc0HQj5eaEuGSAQu9yd/7aXNqMQxUshLLJkbuUeZYRQYgD35D/rRd
	s/ixaA6bZXTEN91e4benfAdBS4MMya5kD28D9UHe4vPTNUVPfUFUHM+aM99GizDi7Ymp+yOTIA9EK
	wXanh/oA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPj-0001Pf-7j; Tue, 03 Dec 2024 11:45:55 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPi-000LEU-1u;
	Tue, 03 Dec 2024 11:45:54 +0100
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 03 Dec 2024 11:45:35 +0100
Subject: [PATCH 5/6] rtc: tps6586x: Fix initial enable_irq/disable_irq
 balance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rtc-uie-irq-fixes-v1-5-01286ecd9f3f@geanix.com>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=791;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=TUFCOTwIdhBII4MetoSWEIKjJ6AZodGxnrFm8Wl+ZIE=;
 b=MNCoBNJy0N6XD8lT7Ymd2mtjlDVYqgW2/cSEAWw4WeUko3mDRKhp3nl0v9qHQY14CengPCy5y
 QO0U8hfZ9JyChM0ylxJ15HJXORpgUlbuYq9nTomK+9QFxHKoIq/OGs9
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_024602_466726_479C82CC 
X-CRM114-Status: UNSURE (   8.28  )
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
index e796729fc817c1bd99f4c70b714a346fc1a795d2..c8ccb4779b50b2c5909e6a64748f52b61e78dac5 100644
--- a/drivers/rtc/rtc-tps6586x.c
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -258,6 +258,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
 
 	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
 
+	rtc->irq_en = true;
 	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
 				tps6586x_rtc_irq,
 				IRQF_ONESHOT,

-- 
2.47.1



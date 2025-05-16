Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8C2C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IrraWLimy1x05XmWcpgWWj7AES2HxIEsMNAIBePizs=; b=RJ6JkGXzzmkGaSW7nQC3lcMZRT
	j/H7iECq7GT4rtGF0BXqk1YC5z8v+u12CsCWUZKyLJ30x1R0EvVoByBceLfcAO47UAwH6j6Wg3TGd
	aWVukJ4Bhi2UGUbGhuMDMJwoueaVLJ6BmxM0mBnRjtRrHAqxoCPZeNgG0f3OrQHl/ijiOsKf1LFpu
	TXrxPZJApLu75iiYGMl2Ouu4A1uL/yV7NKo5RoCJ0Gzz41uU9JRe1g65NKq+/0/SaH0B2iFAbMhPX
	AoXQ2im6pPWVSd9VQBuHZMXDdPUfcL1wABfdQ7YtodHNEZSnixFV9F1V2Tv6vINSt/9nqrbu2fzYX
	u78GaU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpUP-00000002f6p-1wyP;
	Fri, 16 May 2025 07:28:17 +0000
Received: from mail-106111.protonmail.ch ([79.135.106.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpQC-00000002eev-28Jv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 07:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380234; x=1747639434;
	bh=+IrraWLimy1x05XmWcpgWWj7AES2HxIEsMNAIBePizs=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=XRq1syeTu67fuoUJrxO1i2+rs/1jCnRtTQvmELbFfP55EYql41aBvJIdIxSuy+65d
	 BQaSENptZ1yCLW3xDCaMUqAjJErj0In7vU/onUJmoCL8dFp17Az1hMEjYGdCXX9uXo
	 4/5R8/SsaGrf9CxFLnCDJMSkol7etXB4j51TvnbxmCflacEjfXZzy65Sl7TgbUxYu6
	 1/JtE7TQFEFW2u8Dap/9lRdkx8OI6VkguTi8B4U50lSyEaxEn3YuG+yW/OXWHiO4uz
	 GOI35lEeZkAlHN4eH5UN44vlW0JbJzZzByiuilihjrxdJLXPsfiupYrD1inb4S/ISZ
	 /Oi7KBmht4Z5g==
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 16 May 2025 09:23:36 +0200
Subject: [PATCH v2 2/5] rtc: isl12022: Fix initial enable_irq/disable_irq
 balance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-rtc-uie-irq-fixes-v2-2-3de8e530a39e@geanix.com>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
In-Reply-To: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=849;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=GJXYiYgi48NE9t/P+NOWlO+DdVXReF8iINAhKcqVKAU=;
 b=RfXHJO4jORMcU5oC2njC9qPb5Px1CjeD/ifxPX15ITeWH9dgg65MKJWVkpcBXSnr4DX29gGvF
 TP8iMCZ3st/AMwRngwLRxCJ6zhM7SpGnnFuHluG/uj+X4KifZ1E4OAY
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_002356_695692_92A03C9A 
X-CRM114-Status: UNSURE (   7.99  )
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
initialize irq_enabled accordingly to avoid causing an unbalanced enable
warning.

Fixes: c62d658e5253 ("rtc: isl12022: Add alarm support")
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/rtc/rtc-isl12022.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 9b44839a7402c9ab7da634d95152c2520eb8552e..5fc52dc6421305e957a0c3a169009c3f6a6c7320 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -413,6 +413,7 @@ static int isl12022_setup_irq(struct device *dev, int irq)
 	if (ret)
 		return ret;
 
+	isl12022->irq_enabled = true;
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					isl12022_rtc_interrupt,
 					IRQF_SHARED | IRQF_ONESHOT,

-- 
2.49.0



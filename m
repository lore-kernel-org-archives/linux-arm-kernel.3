Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AE1CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uMS1REwvUex7S66RvMiQUXgUMbhM5GP3fPx1du/oD7g=; b=bQt6KHTz1vSNDTq6bAHnIyZwID
	NAqRcrg910Dqjp39OfBP4GMX7D4hVk+a8j2KX7sIV+wqYLLs5ERlxC61KetvqATSnMnYFRxVKnTLY
	3/OvYHWHRPVF4mUt1ssz+LaxUNHvCuq2XBI4Cy2JKZ6RSOm8cS/8KtubGmcGq5KgfvSLHgg2q0/eV
	jSLvZH1ohevJLPF7sq1Cr3OP4pzUmI2XtdSr9Uv0d1dhhVB7o8gh0/lT/832tSquxKr3vZYk3nQB1
	uuOhGA+J5Y3+VZGAUUjj5Tji3tNy7EHVa+xBwjKjumF/WC45QFjg5JtlWowdeBEqIF1ukln8m+igE
	cRw8x8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgf3-0000000GJdT-02it;
	Mon, 05 Oct 2026 11:15:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgez-0000000GJct-2y1s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:15:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D27041A1165;
	Mon,  5 Oct 2026 11:15:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EB61604FE;
	Mon,  5 Oct 2026 11:15:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9E6210330776;
	Mon,  5 Oct 2026 13:15:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791198905; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=uMS1REwvUex7S66RvMiQUXgUMbhM5GP3fPx1du/oD7g=;
	b=nL0hJUpJpTdyv7epaoanzb+DkpQ1j3z8KLIA1xUbpCsiT8k8iMmPYtcL2c00awa+TAXdPI
	hD1MZyh8OGCmK9wg9Fghqr7IwcM5feDBmBRqEdKKbrRKBO2nsL1U9AxWDXhPupqDaeBqjo
	mGozKDwWtLJUAlx9cTUqCsfTLdhRDoOpaQEqy/F3E7ohFbhV/77hmGc8nv2c0Z06eT9Yvy
	vLwNgoX9WNIVbxc/b1JUAt/H1Vspl9NrpcebcftJ/34JRXNiNhFQtBFuQ6aOrLkLJwW263
	vO0TA0c1DfwQXzPYsoLiDvqlLbkMVd68H/um0xd+ccq2GZtnTbtOABLdTIvQuw==
From: alexandre.belloni@bootlin.com
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: ftrtc010: fix cast
Date: Mon,  5 Oct 2026 13:15:01 +0200
Message-ID: <20261005111502.159855-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_041509_919205_41B96F52 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The hour and minute registers will rollover before the multiplication to
convert to a number of seconds can exceed an 32bit integer, there is no
need to cast them.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://patch.msgid.link/20261002105946.8rdteIpO7uWGEcTlS65F8iSi4gsRoXi2kgq8FTSaDPA@z/
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Changes in v2:
 - put grouping parentheses back

 drivers/rtc/rtc-ftrtc010.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index b29c96be40f4..c66d4a85f23c 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -72,7 +72,7 @@ static int ftrtc010_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 	offset = readl(rtc->rtc_base + FTRTC010_RTC_RECORD);
 
-	time = (timeu64_t)(offset + days * 86400 + hour * 3600 + min * 60 + sec);
+	time = offset + (timeu64_t)days * 86400 + hour * 3600 + min * 60 + sec;
 
 	rtc_time64_to_tm(time, tm);
 
@@ -92,8 +92,7 @@ static int ftrtc010_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	hour = readl(rtc->rtc_base + FTRTC010_RTC_HOUR);
 	day = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 
-	offset = time - ((timeu64_t)day * 86400 + (timeu64_t)hour * 3600 +
-			 (timeu64_t)min * 60 + (timeu64_t)sec);
+	offset = time - ((timeu64_t)day * 86400 + hour * 3600 + min * 60 + sec);
 
 	writel(offset, rtc->rtc_base + FTRTC010_RTC_RECORD);
 	writel(0x01, rtc->rtc_base + FTRTC010_RTC_CR);
-- 
2.55.0



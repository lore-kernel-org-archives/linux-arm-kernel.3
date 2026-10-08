Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A965CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JPMWsQJu6GG/t521wSAIRCn6tSF0itw2kLfOcCY10bw=; b=JmmWdjgcc2YYJn3rl3GtOUTYZh
	MuUV4rP6fQ5CxgrHc3YvI0oOSYEr6oKqjto96Dt3DUhlt0VtyBAh2iBGE32lDrKTCmT1RyZv6HTba
	BGdvXfhXgiHDhlQ8DwSpg/SqKEC7P2qiRASL7WOlrZFVbfmo44n4nKLp7Vz+zudC8TNvmiQ0GQdWB
	t0NNa/teVutEFxhkpoD1SOeuEiz8DTbPA9HL8nBXmjT6Vh1z/u4PinqJ+kk1ifqBFQFg15eGZklWc
	HQiftvh87vqn73bGlQVy2cIUzD3uNsWRNEVWisMumzd2G3jPjyl5NZkewC5uZhzMTXFbW1lEnczFY
	GbN8ZqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmSY-00000004GKi-2GLG;
	Thu, 08 Oct 2026 11:38:50 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmSV-00000004GIu-0Cuk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:38:49 +0000
X-QQ-mid: esmtpsz10t1791459458tf2b2e201
X-QQ-Originating-IP: xJkhYMBPqnGH2ogNQuBmj/rxdypbF6TkxZh23LC+TLA=
Received: from localhost.localdomain ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Oct 2026 19:37:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16305893563606199813
EX-QQ-RecipientCnt: 10
From: Liu Dalin <liudalin@kylinsec.com.cn>
To: Dan Carpenter <error27@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deng Yingchao <dengyingchao@kylinsec.com.cn>,
	Qin Yungao <qinyungao@kylinsec.com.cn>,
	Luo Qiu <luoqiu@kylinsec.com.cn>
Subject: [PATCH] rtc: ftrtc010: fix negative offset handling and smatch warning
Date: Thu,  8 Oct 2026 19:37:32 +0800
Message-ID: <0C8AEB5636132B0C+20261008113732.581825-1-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OLsBWtCIHsg6aGNp6cOs9N8nW3q4hAd+7tOvlA4MYexoegIQRUG+lTw0
	lLU10GWASdR09fU6mmVX+M6zxjPWJgvQNdGdR0IDm2ps1Nez8A/oDMLczYPgaqH4x8t8uux
	cc4FdOZqLnCrm9d8B8YVwZlJ7ToG2uBYcSFq1wwCRT1AI/1IgqPGnwWohySePrVaww0vbQG
	5uUxWh5IOBPG5aSofiVuFOn7//I4M6Ur9Tqq7O/OeYRsBFTIX2hHcMiTo3S+oYOXVzmnKum
	n7XeI1BVIpmVDSBw6Oq4rczbDEfs7JN3WNDH/kppGFayDxSGUQhqAyzW/dXAwK6mICfdP1u
	JweN2VOJ7pQBzRCJna/iefCDrLvkaIefRiLTsSGyTWXcfaHbmZZSscVpfzC1ozd0agcWX80
	S2y7lqFFJMpMZUT9rmfIoZYyNiIrFr+Njn9x2QejXjVfkoPu9Q4UgJDBzZWyjAysrOszEnp
	FDS+jn/+gz1YFYdfcrHjX+oAzHFYbmLdmifZPkkDYUL1IDFpshx1MelUygoPsVw33Bi3YJw
	bIibFuol+SfZrVV8IAzUncfMM5jP3M7XZiuSLS2HLWo41CE2o6WI63QwF/26c0VmRMZB32Y
	N2uXZdJDRCNpckd8rqBanRi4mbRwh6eRNO7QAC46dJTOGE+l1YQOeY9DwpRsUtT9ikfE/2T
	6M4IJ+MspninaFZHFCqnxKBTFMcM4Xu8fQn8p+BwoanXfEYcESySc2tL6LUqujxKCeOSFMx
	M7EQFP3Gu9Q2wwXsT6ksyDA1O/FhpvH+TX9ZctPhx2t4gGytMORpC+ma4K7liUMYxVx1anA
	UNe7nxxmS3IyW8q3q2tDNm00KZVIXKYd41Y3ZkEYMfp66z6C6eUnt6r6/VMLRr7Lv25N1SD
	nctg23EN42wCgdee9yWnPDzNahC45EexN/VZTKwHX1Hvc+5WV9FIJWo9XtdpfaHYC+y+pvu
	F37WKqghcpaLxGnnQXDjxQ4h2JF6iCRwPSBFixsYLdvFuWWgpWrHnAltCNzAFZkC/IGXKXZ
	e0vgRTTHzZsN186Ons7a5kHgCpOvzlsFbDi7y99kKOVyfFWgVfn42RzcgWR3s=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_043847_473170_0679E080 
X-CRM114-Status: GOOD (  10.00  )
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

A prior attempted to fix the 32-bit arithmetic overflow by turning
the implicit u32-to-timeu64_t cast into an explicit one. However,
all calculations still happen in u32, inheriting the existing
negative offset sign-extension bug, and the explicit cast triggers
smatch "cast after binop" warning.

The FTRTC010 RECORD register stores a signed 32-bit two's complement
offset exposed through readl() as a u32. Casting the whole u32
expression result to timeu64_t performs zero extension, so negative
offsets become huge positive values.

Fix it by casting offset to s32 first to correctly interpret the
two's complement sign, then promote all operands to timeu64_t so all
calculations are done in 64-bit space. days/hour/min/sec are
non-negative hardware counters, so promoting them directly to
timeu64_t is safe.

Fixes: 1d61d2592c1f ("rtc: gemini/ftrtc010: rename driver and symbols")

Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
---
 drivers/rtc/rtc-ftrtc010.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index b29c96be40f4..65fe1e872239 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -72,7 +72,8 @@ static int ftrtc010_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 	offset = readl(rtc->rtc_base + FTRTC010_RTC_RECORD);
 
-	time = (timeu64_t)(offset + days * 86400 + hour * 3600 + min * 60 + sec);
+	time = (timeu64_t)(s32)offset + (timeu64_t)days * 86400 +
+	       (timeu64_t)hour * 3600 + (timeu64_t)min * 60 + (timeu64_t)sec;
 
 	rtc_time64_to_tm(time, tm);
 
-- 
2.43.0



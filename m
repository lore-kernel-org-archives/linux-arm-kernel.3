Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927AAC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7riH9EZdfZZZrpWorMhiIMu0gyK3UbinG2L2mxvE5uc=; b=DkzeWzse5QroPVmWKaud9+6Lme
	yj9foiwM/4iRkO/HQvOppaDQ4aOIxbGmh6J8sP3CWtvJnAAZYaViWpMA7kymvtuLccNa8pelIXPuS
	/3Gf87p9P27LI+AEg155xzSimg3PkRazpjG4UIJv7AUU2pouou01141cew50NEnXRl98SM4mw1/8x
	w+gEwWT8XQddWUn4gaHac2jdn/AOzcpbp0ZbIY7YXA4y5Cnb2lgYpN2M8JwhGYRgrFdSMqBeQ21Wq
	jSgydkwbqFB59+qijv6vjln0DsJtNgP74/OwnIj7ZK04cDeYwWILMnL7PBagsCDRZPLJlDe9kvBQQ
	XfIzBeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV6N-00000003b9s-0Qn9;
	Thu, 27 Aug 2026 08:04:47 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV6K-00000003b68-0RXu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:04:46 +0000
X-QQ-mid: zesmtpgz1t1787817828t8512f852
X-QQ-Originating-IP: 00MzLoODkWBqi8SGjbkADt14SHMNhmqII4nrDcvxckI=
Received: from rd.. ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 16:03:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6259571969530155307
EX-QQ-RecipientCnt: 10
From: Liu Dalin <liudalin@kylinsec.com.cn>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Dalin <liudalin@kylinsec.com.cn>,
	Deng Yingchao <dengyingchao@kylinsec.com.cn>,
	Qin Yungao <qinyungao@kylinsec.com.cn>,
	Luo Qiu <luoqiu@kylinsec.com.cn>
Subject: [PATCH v2 3/3] rtc: ftrtc010: fix integer overflow in time calculation
Date: Thu, 27 Aug 2026 16:03:20 +0800
Message-ID: <42C8FBD59AA34EA9+20260827080320.3351155-4-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827080320.3351155-1-liudalin@kylinsec.com.cn>
References: <20260827021054.0963C1F000E9@smtp.kernel.org>
 <20260827080320.3351155-1-liudalin@kylinsec.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M6ekgsUu7W9nZEmcIhcmC8Z793aPoynYTKSVV04Q5+AEGuWuNRYOYAa1
	QcPy2F2uDwCjAqAeyU5kHva9XjyzIHWRCzsAWbVl/qCTbg78x4qBl+A04Slud36zoD+3twa
	suhJcTG5cmLci3XVylMswaTuJLa31FIcOK3oeUcezEgtZ+ApwIy87sI/muvOf00a7p6eJoF
	Vgu9/iqIKB76enlRHhgkyapC4LZSFQQzDpVOTbbQIuVZ9q4Gn0XE/mQ4OHVA4VgM9S5bkQT
	X87Ov9Y5lgWd+Snh5Ievpr/EPGxxnfQM8JSNusbx0yhQZbv5cNQUNnwfxeF1Cq+hkT1p5/W
	vphpXYIJjEhop5X5HOmuvE6IXEKJR1d5+PdQ6CDp6RTqWq8pXcGEFwsslNtazVGEODuh29o
	urYbIPBbsGgaBsBSsxqYTIAwGekNBRQF3qkpFBQNTNV34YI1gp1C7w/W2W6OmkHROw6wEKv
	2X8Q9tlDnKTQIoiZVeZk0BgB6lAhPOvF3alx3DRMA54/orQddO46e4L+n9TUcznJabFlVJn
	g01BmR9ijsevZ5U0UEx5JCNUXedn13Py67ozZf7ehL4GS6e4SqqzTU2cm2j+8GWamxa4JvE
	LWBlwh0MqlBTsdcKrQ+Yq+yb7amK1YjEA2X9rB7YFE/A8tDuI2hF754vX6C1/lHNV3btAtT
	8Mwkzs2l2i9iOWoIyzct9GbqTINek39o8q8Pbir2GRHeRBdhAg4WFbdJ8dK1odVWRpuUpF8
	+bGgJkHjXfdjzwpBM4wYm2PCDeyfHlWoDyH5iDbv4+tUk35n0koMW1Kl++C8atgiNdKgBZg
	tdG0Kjr21/AujlO89hI0c4W/fjxzmvRvd2KPgIzN6BOKMcBh6dBu+3KC0RFWCUKiTzTUBea
	WzmgPCthvJoXJ43Grpsq5ROzZ0XyCxMtFUjYAFFJd0R4pkotDTm47U9Zzqsir/mzk1ENP5c
	+rCO3nZFpeT+xpYL6sMHZABnz1EFCqXvqgdFEvU364EeQCewYMlvR+fZBMbFnmcTK0WT5JF
	Ag9cZl4FPJkta+FYZwJxuryPx+I8+JHTql0z55I8xSR4OYAfv312Bymbz9sD57I/QgSECaS
	2CoaslvvTFblZn3IKf5z5bXiZQBujjWE5mJgyfCaqcVz08O9T0TZ6uCNreQBpzMdQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_010445_092960_3E4077CB 
X-CRM114-Status: GOOD (  11.12  )
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

In ftrtc010_rtc_read_time() and ftrtc010_rtc_set_time(), all
variables (offset, days, hour, min, sec) are u32. The expression
"days * 86400 + hour * 3600 + min * 60 + sec" is evaluated in
32-bit arithmetic, which silently wraps around for dates beyond
approximately year 2106 (U32_MAX / 86400 ≈ 49710 days).

In ftrtc010_rtc_read_time(), perform the addition in 32-bit
arithmetic first to preserve two's complement wrapping for negative
offsets, then cast the result to timeu64_t. In
ftrtc010_rtc_set_time(), cast individual u32 operands to timeu64_t
before multiplication to prevent overflow in the right-hand side
of the offset calculation.

Fixes: 1d61d2592c1f ("rtc: ftrtc010: Rename to Faraday FTRTC010")
Assisted-by: Sashiko AI [static analysis]
Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
---
 drivers/rtc/rtc-ftrtc010.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index 19e6333bfbab..b29c96be40f4 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -72,7 +72,7 @@ static int ftrtc010_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 	offset = readl(rtc->rtc_base + FTRTC010_RTC_RECORD);
 
-	time = offset + days * 86400 + hour * 3600 + min * 60 + sec;
+	time = (timeu64_t)(offset + days * 86400 + hour * 3600 + min * 60 + sec);
 
 	rtc_time64_to_tm(time, tm);
 
@@ -92,7 +92,8 @@ static int ftrtc010_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	hour = readl(rtc->rtc_base + FTRTC010_RTC_HOUR);
 	day = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 
-	offset = time - (day * 86400 + hour * 3600 + min * 60 + sec);
+	offset = time - ((timeu64_t)day * 86400 + (timeu64_t)hour * 3600 +
+			 (timeu64_t)min * 60 + (timeu64_t)sec);
 
 	writel(offset, rtc->rtc_base + FTRTC010_RTC_RECORD);
 	writel(0x01, rtc->rtc_base + FTRTC010_RTC_CR);
-- 
2.43.0



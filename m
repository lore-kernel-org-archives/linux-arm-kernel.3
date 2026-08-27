Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AC6C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcZoXbtLCM6pfPN5fYvCGvLeL2aqh2vwH18pWvZjSOs=; b=atUl9oIH6rFE9fEcz0puCBNLwY
	0vhkjEkhY++MRkSjnPs6By9B9De6YxNzN/p3ixeuYRCCbjHoMi3KIP1fC5Duyl1poKC1q9kMfUdu1
	2fmhRUszv+PzrvUPon9RtGDbVmbgGEz+QcVf1LYuRxNlrZUOPDDkB5gWw0QGkHvRkCqtm4TRQf1XT
	4392Xo1B9xkVJtA0tEU8nOqK0/S7/kKl5IxBgrcrG8YYLI710GMof6lrG1iE4y+hBilZNoj+fVYKm
	lGIfbq4gSTQIJSakTovzgNbJQfrHyOC/rQ+/nP0M5BI2T4u6ywIXRGY2c4963o2bHh2G5/1L0T2hM
	T1auzW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV65-00000003b5n-3bV5;
	Thu, 27 Aug 2026 08:04:29 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV60-00000003b3D-0aw5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:04:28 +0000
X-QQ-mid: zesmtpgz1t1787817814td7d3a987
X-QQ-Originating-IP: Ptz95ERRE1amiAopFHAgp8ZWVU4j35InjTBb5Bw/64Y=
Received: from rd.. ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 16:03:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8574756199102774927
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
Subject: [PATCH v2 1/3] rtc: ftrtc010: fix clock resource leak on probe failure
Date: Thu, 27 Aug 2026 16:03:18 +0800
Message-ID: <AC51B5F2C5FFEBB0+20260827080320.3351155-2-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827080320.3351155-1-liudalin@kylinsec.com.cn>
References: <20260827021054.0963C1F000E9@smtp.kernel.org>
 <20260827080320.3351155-1-liudalin@kylinsec.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NU2MhohCfzQFvFdngKdCegQT0pbsta6x5dL1Qo+PQhu77RcNOQbVsji0
	0jfCNGZQ5pOMrljtn6g7G4gpbp86/dbFc3c/OgdRFp/mZ5noOoQ1b0fk/eGfQHEvtFF84oe
	6eGlOxjQDwD79BOz/lPTduWKYqmb0lMtkLo8a2LDd3Njpqt3fmPB2hQLAcxYEXNUlx+KfE7
	Ans4tazqAqXlDYrdqFnDjXR1xmaPxtWPLUMofB+k20AvxLjxcldgiuRXDFoiK0wDZ1WbU6D
	YxIVe8cat+r2ezyvuarbyEjv3SwKEA6zgpuxL6QXv+9TwyEdz292X57xtHwB0hOhRNVYZ+j
	f4AnmzMWT1kCtI5xTMy54NujmZT7EJDzvHdNvqNURCBwMuV8IH8wUdZTIpiuXvpIuSDAlK9
	aCYLD92YZz0wDe0ch/h2Zu4p5BiUFH88+CgGB6yujiLwzH5OeqR/qMiY15hTuP0DJS3gGiB
	eTperLSSJLHfC+26Kns0FsVg/M7Qt1tFZCvrRZGDg5b1PEdBcJwS05vgKSYbE+IxNgGgQke
	EnLSx0KsHC4qEJ25w3Cc00v8IIN8Z2fUAK25S3qX3jVGfQiyV+4lCszzLJn/y38yWDch3UH
	homWxIPHBdVDvpYMJmw2OuqCP61Y53kPMSjxtkB+R4X27PmUs/KHwI9t7JBeohtHUjiDp1d
	GDO1xtEtPywXiMDvx9OuE22WbhB5YEAtXrdnRP4cwKNXNP7p/0sbIlYfvKrmbfEIU8bI4Fz
	TI+YQwOjhyqkg7ygxJKmtUaM0i7hC6unYedD+b0w7J73I0ZB1a7NHqWh7BeyjU9i/Zy0Fbr
	lP4KrkBs3f+r9qspkzdoS1zcZ7dFZl+/S2/MWjyolf2MPmQnF/pWLxqr7Wunb+IZzRkkxB0
	OKQTUU5C0mYV7CZqujaJZD/xmCtK66gj0ytejAYXnwUcu66E89VCFiem9U5s+n6GrUX0TQT
	txz9Blyfh28WH8WlGqIqJK5Q9WixZZ3jAI+MqRle3QvvDdijhsfdwZeuW0h01w2r1REtmtU
	S5bjmSDR8cctI8jNVZPnSfO6GnyRlm07lUGei1cK8ulQI6rlAGya6UUYW5aB491hATnuZU0
	KU42KwLt0GW294sWnhRK26RvRYahVh6NYQ7aa1AkguGMWvfIipuTCB0Ei1Pwfe+h1qpYfOA
	328KVkXo2j9Fe70=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_010424_645697_53CBDC2D 
X-CRM114-Status: GOOD (  11.13  )
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

When devm_rtc_register_device() fails, ftrtc010_rtc_probe() returns
the error directly without releasing clocks obtained via
clk_prepare_enable(). This leaks both extclk and pclk resources,
which may prevent subsequent probe attempts or module removal.

Capture the return value and jump to the error handling path to
properly release clocks via clk_disable_unprepare().

Fixes smatch warnings:
- drivers/rtc/rtc-ftrtc010.c:189 ftrtc010_rtc_probe() warn:
  'rtc->extclk' from clk_prepare_enable() not released on lines: 183.
- drivers/rtc/rtc-ftrtc010.c:189 ftrtc010_rtc_probe() warn:
  'rtc->pclk' from clk_prepare_enable() not released on lines: 183.

Fixes: fdcfd854333b ("rtc: rework rtc_register_device() resource management")
Assisted-by: smatch:2.0 [static analysis]
Signed-off-by: Liu Dalin <liudalin@kylinsec.com.cn>
---
 drivers/rtc/rtc-ftrtc010.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index 98fa0f518303..512790bc3f2b 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -180,7 +180,11 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	if (unlikely(ret))
 		goto err_disable_extclk;
 
-	return devm_rtc_register_device(rtc_dev);
+	ret = devm_rtc_register_device(rtc_dev);
+	if (ret)
+		goto err_disable_extclk;
+
+	return 0;
 
 err_disable_extclk:
 	clk_disable_unprepare(rtc->extclk);
-- 
2.43.0



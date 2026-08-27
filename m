Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39324C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcZoXbtLCM6pfPN5fYvCGvLeL2aqh2vwH18pWvZjSOs=; b=CWBGOLzZKRZ/Uq6dND5kIxWk8y
	kYTySuHIHmRedZ1Mhj5ddpI4xA6bfl5kLre1ua2/oysYE7GWcdix2ulHrVA+1QFK1Ei3fDQE9ID3d
	HhMWfriQVeNUjRtF/CdmLUhb+hukPR9nz32h17Go9KtKjPDCCq6X+1svsYEs6LY1kSBNUBTv1P8k7
	K0un/11AJ/vehaitfvza1JwoT5OOqV6NGu9a08uu/6guPXOl+AQMtv3LSMAOzHSjJI78+qSmpptrC
	ch3svl4OHndfzE2hP1GJP1/lQqaEYCuDXjo37IkJHH1ZQ2GC7Nh5eENjQOw+DPGU+bBwAnC8vMSQa
	6RLrdn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTe3-00000003UAB-2hz4;
	Thu, 27 Aug 2026 06:31:27 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTe0-00000003U9D-0Iqg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 06:31:26 +0000
X-QQ-mid: esmtpsz20t1787812240tcdf2c45d
X-QQ-Originating-IP: 1DJtWNx3YhLenhIB0FYvT59Ray3IYrfdfdAfsbybCLQ=
Received: from localhost.localdomain ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 14:30:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3173617341218191905
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
Subject: [PATCH v1 1/3] rtc: ftrtc010: fix clock resource leak on probe failure
Date: Thu, 27 Aug 2026 14:30:17 +0800
Message-ID: <16D871E1646724FD+20260827063019.3342085-2-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827063019.3342085-1-liudalin@kylinsec.com.cn>
References: <20260827021054.0963C1F000E9@smtp.kernel.org>
 <20260827063019.3342085-1-liudalin@kylinsec.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MiIS17MxlZUaSUXmqhs+oyd4Ya7cdXLy5uVOEZqu60WNmIskGOPozYZG
	ESqbBgqIxnejlaTaIG3LaXyR/iKrM8oEWtu5nkM1O9rbs+/r0EAN4Qlog859neHDsffg3N7
	+RKJQx8WvrMfz11eSd7tdrcbC5Sn9GFdMvdbvbWiIYVwBDaZY2516h2RnajDydbYTp9zNz6
	wg5IbdFZWdNBRD72W6PafQHfnJ0c4n5g47Rj2fANMp+qYCIJhqGchqAwa6HabMyAu8mxkb8
	BylwGpHSmDb2mIeua+/TsPETFuw6Z9oL2kQtsM1hdDuYLNYG/goSsYuPPgDawIOs84mp+Is
	tJyS+fB20pwh921aeXTrDHlGxuWhgwZ/ibv0XZw8idFFmQoZXPAZYnFngbwlUwT4yNylZAy
	LAUGgfwkKgdKPuyAVZ37ZfxTQyFH1+2ljVyGpNlQN/knCQZEhzu9RkX0jB5Vu/m+XPiXggQ
	yHOAq6vInBS+5lN8z+4uvMxqRiQ+lWy/DRJ79NRigsZ//fRAwF7MEHOP7iDA0IQbXtX7V9u
	8gz6q9nsrXZ5el9LsLBxbsTsIEvBbF+qGAfVNzQvXpVhkrjXK7KYJ8u8L8wfk5s+Oe8xYsI
	JzUSp94Q4g3SBfVmn7cQxsctrn+BW4vCIopvQY2lKLXyxwThUc0QfXgt4mQ83AGdJcizimL
	jCmIKwCWJ4NDAyNH9XBra7puPML9VTxXcG5EjNyem9KIm131EWW0wKAE2ng9Qudkp+g4XOq
	9DNs/fkmAO8ADsc8TGRslmY+cPGs8aqGAesOQpRTupz9VhbDb3CnV9mHIS3iy4KDK6m3Kpk
	lwYXTsZPuxY9vmEWNfllO0qxiyJdKplLgNBi+UXmHx/V5d5XMlg9asHDw9O+k3Oq4LDfD6Z
	emUFhr6rpdp49iq6fw9Jd1xNS7C0kAqc+WphPn3JpotMY1jDpKJ8+wJsr+dyAZAmGR1N4Y6
	pcKkuaDf3UZht4eLeNH91ggvDNyZo4u7R7jbL6Sc0JioO/SZ+0QbSW0Et+2RzDxHYvtXa1E
	hXwSieKVUiVZM87guuU55Onp1reYZhFxeyY7THHaSM9sRLTxq/u/1m2cSpz/UgqTq4ksev8
	m6hSJ9mOko8WjCARjT6DH38tIjorfhnKkpDWpCQyd3g6RGf0JVwzQtr15oxysraMg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_233124_488480_072B18FA 
X-CRM114-Status: GOOD (  11.17  )
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



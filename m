Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBFBD6A225
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GZw1ocqAf3SESs6AoLOS/AjZZcQZhWXXwDvFKs9mIIs=; b=3r7dFv/1ZtTm4f
	UiSqLLf+dK7UifyJJIkrqhJa95o20RpTBKggrQuEexaRpc8BVmLWf1KHX9veVG50pAqT9gcOu8hud
	eH1hH79c64Fv/mKcA4lf/LUAIEQX3dHRK3pwaG2MujjPkRqyxN/xjAKJlEgGS2c4yNDpAlL4GAR9C
	ste1RBnzjwoGInICvE1Z6nsJZsnjeHKnH0RIJFI6iPSWjNMZBcsfsaMYWwXvXFKLKzt0JXekJIpKE
	iN+3t0bcURHAG7OR3IGASlHD2kgzPq17+tSDb90G8ey68yKBBXTHyw1VSXo675jmkCEI70Y+1lNEJ
	tbU34jhVVRSGo1MaMRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBduP-00000000N80-3e0g;
	Thu, 14 Nov 2024 17:45:33 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcqy-00000000A3g-1jqw;
	Thu, 14 Nov 2024 16:37:59 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BD56D10000A;
	Thu, 14 Nov 2024 19:29:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BD56D10000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1731601772;
	bh=GZw1ocqAf3SESs6AoLOS/AjZZcQZhWXXwDvFKs9mIIs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=DFxpS74Mp8yAY2ARaUr4JLNfd8z1s1Oe/NEo5eaGrNRh7bxsfjCO62Sa6ZoiIFiDY
	 QCOJGjDxVqfBIMwtMWyqI8a3QQT4wS6ns1KD0W0Ux4EuxJBYbxID2QhWSpZcrvf/cN
	 qoQ+0S8YjgYwKNofiVW5WDKa1iDyFsgm6rNdfM6rpjv08IxSqWuwmWo+UmO/hwrD01
	 m9D/8kXYjG0XLok7QgpykDGjGJ8vHoyLRX/aN2Rll2yL+IrEsvs3qjzgjp+ZZCGnva
	 A7Lavhcy8gAMcJ5s42dqneHcc/zAh/w1SjO2CSkGbEZYBwefV+S6pSGUXzG+ug1oUt
	 tUs9oieqjCalg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 14 Nov 2024 19:29:32 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH 0/3] Make several simplification of axg-audio driver
Date: Thu, 14 Nov 2024 19:29:23 +0300
Message-ID: <20241114162926.3356551-1-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.28.64.45]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189183 [Nov 14 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_smtp_not_equal_from}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:7.1.1,5.0.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/14 14:31:00 #26861614
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_083756_609437_D9BF37FE 
X-CRM114-Status: UNSURE (   8.05  )
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

The series introduces several changes to axg-audio for Meson SoCs which makes
the driver little easier to read and allow to avoid possible errors.

Jan Dakinevich (3):
  clk: amlogic: axg-audio: use dev_err_probe()
  clk: amlogic: axg-audio: synchronize *_audio_hw_clks and *_clk_regmaps
    arrays
  clk: amlogic: axg-audio: get the rid of *_clk_regmaps

 drivers/clk/meson/axg-audio.c | 472 ++--------------------------------
 1 file changed, 24 insertions(+), 448 deletions(-)

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2B8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2+SwZ0bwQjXH66jDtqyAdMkDCSMWPucJICnj+Ww5OA=; b=Zdo4U0Z8bavHaPmxfGtQO785CH
	4nq7m25ON+EOINkwHNZo7vWFBFCtJsTJsz7KqoDAO4mdXt/yfXOhQWEFKOTogaEvR1a8RGaQmhQDQ
	0bdMq+otwoppjKSZYqr4p04mJP679CPW9gvu1krEQLV6yBy16vlDSv1DmqYWP6S9eXu5QteNeEgSo
	n4jISjY9c2+3HlH6GNfyiaTG/v4p/FnE2Q9vtXTxiZD3rwlUCkWdtdRfL1Ci/D1fIWX7wADyPLS/+
	1H4X4UT1Ec8i2k+y12ptJ6Arc53ExAYnvMisCC9Sz0VYf+BcBQMxgHRtcx52nkmZ/pM8XzUdcqCV8
	E7lCfsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFN-000000091CM-37TC;
	Tue, 16 Sep 2025 20:25:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEw-000000090ia-1s6T;
	Tue, 16 Sep 2025 20:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BE7644D20;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31796C19422;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=PGC9RLyvUYb11AvcYKFthsR2RXxFjvbJW7ULzcMM1n4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WF/U+ilsuMpWThSrx1H0QFkgdZaMVWBGJlBSSTATkfxZT6q0ZKb4HEFTUEJ8bf3nk
	 /k4vNhDzDpvL5piUH2exVhGXwpg+s+v9RNTKpicxPJd0y9eU3E78Bg3z2zRLns9qc+
	 9WSeaaXRF3arHwwhkyaEtB+r9wVDxgtL/iQYNJtCx2Ryhcy4NG3OKtbaFjbA/qW56I
	 so2OsPiqAPCn8xTAVqSBmuYU8dBFkHegK9FLvgeyX3VFjxSB78VL4MI7oZHBpfiyKR
	 3kuLWgcwvQJyZbL0BTXDZSjIghucFTYPeSVBE+dIsOVQriJdJ7oqnKUmV9S4bY87Jf
	 xREiIfqhBD1fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216E8CAC5A0;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:01 +0700
Subject: [PATCH 04/25] rtc: Add timestamp for the end of 2127
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-4-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=913;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=DzZHdJKZCRZsyIe84ay5pJ/2Z/eJ/DpBDRNQR5GG0kc=;
 b=TXUPCWPqfcmGpwTVgoZ/csRKglLlNBEzrYFxRh7ZQ//BPu6xMzaihEwxcAVhhtA00DbneF6R7
 Kv5Wv87ejuhBJCzOJ67wnp3h9v8C3HAnCIfUnZpMcrApewJyPWho9WA
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132526_533599_A884BB2F 
X-CRM114-Status: UNSURE (   9.71  )
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

Some RTC (like MT2712 and RDA Micro) can handle until the end of
the year 2127.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 include/linux/rtc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 95da051fb155dab4c8ec72ccae7b8e12a117a7f1..ec5828ccc7449388da2ab8bc757030e6795ace30 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -175,6 +175,7 @@ struct rtc_device {
 #define RTC_TIMESTAMP_END_2063		2966371199LL /* 2063-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2079		3471292799LL /* 2079-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2099		4102444799LL /* 2099-12-31 23:59:59 */
+#define RTC_TIMESTAMP_END_2127		4985971199LL /* 2127-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2199		7258118399LL /* 2199-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_9999		253402300799LL /* 9999-12-31 23:59:59 */
 

-- 
2.51.0




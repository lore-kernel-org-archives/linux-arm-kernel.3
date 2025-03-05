Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2303C28B22
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 23:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=52JzpFAmR4s4hHmh/IBHGR01Q5kxk91ZCSuKPC7c9gM=; b=AZHQRPTbuEI9pSLXumc7bcqgnB
	vP538a8XH6C9gi5tGCbKDlKpnfFoysJkk4BrH1uOIdGL8D0N0yCddvzYxcHME/aMZ+1EcPBzE4+kx
	B7vHf/oNJ7huEOD2kiGB9b1qZ5qkGT+SvyrouatER+rIiU1+PZjXaRuOTGH805ta+X1m0Qjv2jhot
	3d7Loc85yD5rYs1CidOALt6eCdNzzcod3W/ESzP5pVCfl5KAqXyCgs/EIHaRaqNX3Nj69+L4Pz3uf
	51NTPQ/8/s3wwAEUPtqJtlTEKyV6KIpR0PEQv7MvbG+Hhxf0OQd09kaZSmVTaeaT0T26KX3I8zCte
	jufccwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpyFI-00000009coI-0BIA;
	Wed, 05 Mar 2025 23:33:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx3G-00000009SOp-1PkC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 22:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=52JzpFAmR4s4hHmh/IBHGR01Q5kxk91ZCSuKPC7c9gM=; b=P2c3l88KT2SqqoN3J4ft/VB2HU
	3AoV5mMkKtRzLynMtWlI8sJn6Nigx3zECTs3zv5T2bMFeX0T41i+etdMdT1WbIsQAc1HrLfT6dNVj
	V2ErSRPKAYHhc7f8zVQrANBwazbg85plWS9FN5rbRxgnjFclYsLY2HSmPGOcdAijfz1BMfyOJiiIB
	BioQzTiQ2ZPi7Cpx/b77uqb1eoGmlISQfYC334boDd6bFFumI9r06jdH/Y+cCVxNN6cQH9jmgKsQ3
	SAyuBJrnNbm+9zaiVpCWTXEu/P5Fw0+CyXPrZpPAOch9t8qqyT4MAUevtZH4WiWNELGnVrcMT+nTg
	qDara3PA==;
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpx36-00000000mOv-3Tfv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 22:17:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D153844389;
	Wed,  5 Mar 2025 22:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741213024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=52JzpFAmR4s4hHmh/IBHGR01Q5kxk91ZCSuKPC7c9gM=;
	b=IxsQ68HvshiP6OZz8oxdkI3snpV5GkgiLukuucPAUUKn87KWGHRNjzbQFIjUMcSQkGV4z8
	g5B2flY1i+50VJVbSK6sbt3M7E69iJp/M1Kac+oY9bgKL0Hih4coheSUfQ4IWL8hb/k5OC
	sn9yBEi5P6no8N0buNMS//BXsxuFpt5at+lcFHMU1wB9U7aVgkRBFPASuHYGpJH62/kJJD
	FnVWAcGGRidKiN2URY7IrZsvYGMkNHc1lL5YRn5O7sc8XIaGBhKCoSvjbyKX5ExG8WsTEZ
	NIiAbsCiwWXsSGYti7p20k9oUrelnAEi1igq6jrEGvTsYb/BNIlQ8Bcj1PBOFw==
From: alexandre.belloni@bootlin.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pl031: document struct pl031_vendor_data members
Date: Wed,  5 Mar 2025 23:16:59 +0100
Message-ID: <20250305221659.1153495-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdeitdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepjeeghedttddvkedugfelffdtgfffhedtkeeugeetueetvddvtdegvdevueejjedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepjeejrdduhedtrddvgeeirddvudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrdduhedtrddvgeeirddvudehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhto
 heplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_221709_231385_C8AEE893 
X-CRM114-Status: GOOD (  10.41  )
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

Document the range related members of struct pl031_vendor_data.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503011015.SYvdddTc-lkp@intel.com/
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pl031.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index 47bfc5395e59..0401c51191e5 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -74,6 +74,8 @@
  * @st_weekday: if this is an ST Microelectronics silicon version that need
  *	the weekday fix
  * @irqflags: special IRQ flags per variant
+ * @range_min: minimum date/time supported by the RTC
+ * @range_maximum: maximum date/time supported by the RTC
  */
 struct pl031_vendor_data {
 	struct rtc_class_ops ops;
-- 
2.48.1



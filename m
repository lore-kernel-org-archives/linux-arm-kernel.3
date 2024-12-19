Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11519E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=//ZRtVIShAM2YeUwBcImOkVf7DGptpq1kSU1JbCXQ2Q=; b=uI4Z8sFoFj4upICMa2JrDZJ0Yd
	KbizYMDYd8EevwhoDeht3pjmN6Umy7d/HExraxXQauhqJwuOB0DocdVLPFRE8HPsmTM3tqTSJi+sp
	f2wWytO6iCo4u0DYxahI1ozpAL3hGBuWYgbGLmDpAFNHrQfcRoCKvOHdbVb/yxlaj6+gXSrAZL/h/
	NOLEEYo6fWDe7terJxsGoONUOx+2GFYEFB8q1FmuVfHrFC8T+4NQQDLzJKlm1MTUmb73tkCwY93Zx
	jmFqvWq++D7k9I/tFzk+gGVwpXneN8cDKU+c94B/mnYCCO5GxTk942ft60KOWEc4lVziHhI7HLORw
	FVZc290g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEFg-00000001bFT-3ThO;
	Thu, 19 Dec 2024 10:59:32 +0000
Received: from mxout017.mail.hostpoint.ch ([2a00:d70:0:e::317])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEEZ-00000001b9W-2qs2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 10:58:25 +0000
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
	by mxout017.mail.hostpoint.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tOEEP-00000000A6k-3zaV;
	Thu, 19 Dec 2024 11:58:14 +0100
Received: from [178.197.223.140] (helo=localhost.localdomain)
	by asmtp014.mail.hostpoint.ch with esmtpa (Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tOEEP-00000000Ezf-2xQw;
	Thu, 19 Dec 2024 11:58:13 +0100
X-Authenticated-Sender-Id: code@stefan-gloor.ch
From: Stefan Gloor <code@stefan-gloor.ch>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Gloor <code@stefan-gloor.ch>
Subject: [PATCH] ARM: dts: sunxi: Add MMC alias for consistent enumeration
Date: Thu, 19 Dec 2024 11:56:23 +0100
Message-ID: <20241219105622.13691-2-code@stefan-gloor.ch>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Vs-State: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_025823_716237_91CDB62E 
X-CRM114-Status: UNSURE (   8.57  )
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

Add explicit alias for MMC devices, so that (e)MMC and micro SD cards
are enumerated consistently. This should fix spurious boot failures when
specifying a hard-coded root partition, e.g., mmcblk0p2.

Link: https://github.com/linux-sunxi/meta-sunxi/pull/431
Signed-off-by: Stefan Gloor <code@stefan-gloor.ch>
---
 arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
index a1b89b2a2999..9cd1eb690134 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
@@ -60,6 +60,8 @@ aliases {
 		serial2 = &uart7;
 		spi0 = &spi1;
 		spi1 = &spi2;
+		mmc0 = &mmc0;
+		mmc1 = &mmc3;
 	};
 
 	chosen {
-- 
2.45.2



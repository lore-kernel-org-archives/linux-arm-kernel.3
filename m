Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19D9FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFcunWIpYnqUnWj/RVVTZn+6mdgY5gobPpPfEuSRWIU=; b=Zpo7M8b42LadygHeP82RrMTSIv
	GIo/Z8uG7+kdUR6k+jhS9wlfQs0LoXquyqXm4DTqRBWLHN/Nu5UL58wTwQDqEZ7XzN6dwa/WXLNo/
	bCczfTtgsU8iFl1T46Pv69CgLZEQeA/kBxQGL2QTT8hiBiUFLIS5DJEtcWpzFXirtLHqlvvS1A8qh
	9ODFHOKiKC5oHpLxDNSaRnX54sn2a7jSwNih6NQ4VqwdC/2ovirdWR0kSWbErXb5FFCJuAPZH7B5B
	1Mmp3vm5qSwm50/dim6MPYSChg6/gsqG5yH9HREo/ziTNHQ/n2FuFVmw+qah7qKHoQ4zxOX/2K37k
	MnsL2XOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZLM-0000000EHh3-1NUj;
	Sat, 25 Apr 2026 09:30:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZLG-0000000EHd0-2vuR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 09:30:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so51618105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 02:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777109425; x=1777714225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFcunWIpYnqUnWj/RVVTZn+6mdgY5gobPpPfEuSRWIU=;
        b=IxN0YkOVf3NTYnr3ppUC/1URjjnNeXjBoL48N2sMgDhs2eGRzI6zctlD/hBES+JvPU
         bIuq/NRm00ov3u8RBjG+zn/JcxklortzDBzqbpZejXGAPIhIaAsEoBlZhXb19Cd/yfOO
         aApT9Tkr/XuqZAfJarXUzWO08MQAD53PokHtXWxgvGGNABcoHw3Yjf4m3H3HjDh6Ioyw
         S+DoKnRPCZ25YS1zeRO6RJUiPcMpcIwRHyThxn8uKalq9zRq1AvyT74gft+o2A5gYAb9
         5+0WSPRBmQTvKzzQW+UTwTtSeIwCpQRdySFQ4JonWGXlNgwCowNxBcNo9xivnk1X3aOG
         KFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777109425; x=1777714225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFcunWIpYnqUnWj/RVVTZn+6mdgY5gobPpPfEuSRWIU=;
        b=Hxgkzr1e/amQLYQv/fRoUrF3lc2nGVTuUesrLIrcIUCZts2kZqSD0UJSvzS1gyUZFH
         pZFeQ2IZlSDcf7PMP5pRSudvUAFEX4W5Mz3tMLhHuuq0rB6UnHPS8y/u6vyBjaQADpVI
         F3lT1B8WwSq4xEYA5RjNtkKWbFXiMvbp+CGSWRhmwMVWjHC/BdOlplc2SKX6MLsNtAlD
         6x5112X/HMZcQxzxGbpPp4/Dbpr7Wyn8PgAQTHzzwMiI59s3kQ/L4mk0pjwyY0ikH92x
         reg8zsp8+VHkbSnvU2QWXrUy0ECYRfnL2UVWVfXta/LVBiIMeToJZ7rCw3q5Kvwse+/2
         ID1g==
X-Forwarded-Encrypted: i=1; AFNElJ+1s4yo9DBIJnW5XPvtB5sHlsLq3vBnngtVy67ebv3P1vWMgspCsIqhcVV0/kDqjlGUzBoArTCuboVjtITZxvy/@lists.infradead.org
X-Gm-Message-State: AOJu0YwynyOr1IIiRcBBPaTF9h5MuYrZziWppLwv9onX6WzncjQ65ObF
	PsTjyc3hu94ls3J/WeZxaI5kRdzQUA9K1L0BwmYcoUr5TxFRbiFTe50Y
X-Gm-Gg: AeBDietPLUwcFc5jwOV1bld1fEBrHX0nxlqVtW+cZND9tOJEJe/WO8VgVw9mijt6/ik
	lVU91kIERqd1RKsYIuNvhQNGCw484EaV4pcaYCnJeFYz9307ghb+kBh55k4zYQ/sDfkZKP1EwIg
	jPTr7dDi5yql/H8sz2S/IcRUVTC3EcZnYYDP5gu5nAQ1VjYzSzzN5JH+5SErErK3tjT45+SXlIw
	/qdiCunwkhLx+NFvW5dN5LaGxHEZmI42mhWQ5zevUW1/a889mY1HI3V+niTOuvefHZa/pFxFfsv
	KtKKDQwaRkfZBMP3IP1Yoljp0amsxNBZ51dYUyMKU6qZ1xRrlEE/RR2igVDvWhlPDxrX5nj3sYv
	QlCi5cnfMTdIgVb00YhhuO1C/wzdjkPC41EaysZu6Js8+y9pK5KUP87lUEu/qdJbiUM2Axwj+8B
	UfQsbcDRccnyI44A7RtMHLEZ5K2uWZ+pV3XKGMXmzDMSBHE+yL1/BX6eA0KYcJ8+FnBPGPcfHNJ
	5T4
X-Received: by 2002:a05:600c:858c:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48a55d87a58mr238596535e9.9.1777109424887;
        Sat, 25 Apr 2026 02:30:24 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2716sm204422615e9.30.2026.04.25.02.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 02:30:23 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de
Cc: jon.lin@rock-chips.com,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 2/3] spi: rockchip: Drop unused and broken CR0 macros
Date: Sat, 25 Apr 2026 09:29:35 +0000
Message-Id: <20260425092936.2590132-3-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260425092936.2590132-1-john.madieu@gmail.com>
References: <20260425092936.2590132-1-john.madieu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_023026_765872_23BE34FA 
X-CRM114-Status: GOOD (  10.62  )
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

Two CTRLR0 macros are defined but never referenced, and both are wrong:

 - CR0_XFM_MASK shifts by SPI_XFM_OFFSET, which does not exist anywhere
   in the tree. The intended symbol is CR0_XFM_OFFSET.

 - CR0_MTM_OFFSET is defined as 0x21, i.e. bit 33 of a 32-bit register.
   The value is meaningless and the macro is unused.

Drop both. They can be re-introduced correctly when an actual user
appears.

Signed-off-by: John Madieu <john.madieu@gmail.com>
---
 drivers/spi/spi-rockchip.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index de39f5da62cb..231fbcf0e7aa 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -98,7 +98,6 @@
 #define CR0_FRF_MICROWIRE			0x2
 
 #define CR0_XFM_OFFSET				18
-#define CR0_XFM_MASK				(0x03 << SPI_XFM_OFFSET)
 #define CR0_XFM_TR					0x0
 #define CR0_XFM_TO					0x1
 #define CR0_XFM_RO					0x2
@@ -109,8 +108,6 @@
 
 #define CR0_SOI_OFFSET				23
 
-#define CR0_MTM_OFFSET				0x21
-
 /* Bit fields in SER, 2bit */
 #define SER_MASK					0x3
 
-- 
2.25.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C405EEB56F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWMyKK2ygqMKtep8wPExCQcNZJJYioQ3HkAIOidcavk=; b=F8SZiVN0TGjYOjYqAPduwC+wID
	wXg0/6V1QVJ6HVPnJdcqI84LO4+am+1wOtxDu0dmzalucWZoyZx8UMw44Km4Ub15Gc89v8CCxv1Nt
	NIj6d7vQY1Dols98F0kNy3tZ9lnqUBbbCcSYYgnA5M6Yb1lHUkpHdrnhgW7r01Hke9k2ny9WOVD28
	VpydcokyRQZBIL7Dzo+H/RwsGuMRHVpmAR/Ha3UCdHapSB/g11fRwS4GIQo23IG0t2ZL5bbrmKwXX
	KUlMV+ZFNT3ucH1x3Ln6jRmNJxItBe4KXPpsded1Uv+wXAhEoiLeJ6h4v25EcFtjgqB28HL3pYye5
	kcbeZG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bD-00000006Yqy-2G07;
	Thu, 01 Jan 2026 03:43:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9bA-00000006YpK-07rD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:43:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0bb2f093aso113181205ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767239019; x=1767843819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWMyKK2ygqMKtep8wPExCQcNZJJYioQ3HkAIOidcavk=;
        b=mY38mitunUdcb1SNnWvW80f/4dC9ZjoxG1Q5j2+KfF7VZTNT+hS3hwZjSrqlBbqh8X
         xS+Sj5ONILlcxsOF1KqY2tVOELEdSBQLtkf3w8S5fRkiuEoBORNaB4OaXVxlqlLSBoat
         TEyky+i+6QA0L5BQwwa1c4cnps8knveaWVvsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239019; x=1767843819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWMyKK2ygqMKtep8wPExCQcNZJJYioQ3HkAIOidcavk=;
        b=e/iIwBFe6RzsTGP4n71Jw9pWwOR0KEAbxXYJy/Cqqh/fOhK/SyM2OyHlvSOvP29psI
         XfauihfisI2afI/or0DUcApI2ecU3NHnF6G5HnU9pRyPq9wXsliPHhM+s0C0i/r8lm+d
         O903euFKu37MOxmMusvfKjnhR9yJiBwupzQtFiY9CC3+vh2NW9ZIT+pdgtjt95Ps/PMk
         X8XauOhz1Rl2Z02drTiXhB4k3Z/hwd/TtkyCWziWojgzg+i9WvQjlEDlC9fsuTNnTM3P
         qRiH/evSd3/fEmHj30EnL+Ix9YtczuvUXwdc2okti7bp672UiRxYAC+4dj9IxWDT2yFQ
         Ux3A==
X-Forwarded-Encrypted: i=1; AJvYcCWtDeQZAFBqOtb3RrubNEzxwS0IGuF2ZqXjn7twDs3hCi2UqCebPsrr5fon69G771zKRdQYCuLQQ4Nlopv5BMxp@lists.infradead.org
X-Gm-Message-State: AOJu0YzRhvFti7UAJJxnSHFgb3chadwzkPFbViTT5cK0TWGZ/4xCcjVG
	M+w1buI4WxiK1A0HsGOeCJpOXf++wKk44G61UK+O+bz9/IAXQmBzmSZxYmOy+lj1JoA=
X-Gm-Gg: AY/fxX4Jm685evl7YbSVqMMnZDi3XV0v+cci2ZXHstnKOlBGeNsoLac4NapjJN8xNG5
	1sHBxKC0I9H1tpyT2Q+yCFR6d9AN8Tt4Pk47Azn554IRero1DZm6QLx92k1qFlw/MMWAGGeiAbp
	Co5IuAK2a3ZZgKmlYjZicbHvNVhT+8xw/x+YJPtGzK63Do4eu33Ek7tOmp/108z1adYTdQnaAz9
	V++L1xz4ERHwvD5XS0kOirG64bPfAj4BQakz5HVmX2pKLCsb68UDo6VlouFTxLF1XCMKA/eTrv9
	Iik7x9NeTkVGEK2sBPlBRfkjqeSb8F1My5Lu+DkbTRm2BZ8WTPKfZqrnIWb/GixCB2TFir6KVtC
	pBtUEX5Q16z1FM6fOvFV18A7ZOj0eUlRGtlBZpgiEj7j7sR4Rlx1zRHQUKM096khkNnGsd21Cld
	WOmT4llbXRgdWTFgeKTqlEbS4wdIWuBjfQAhYfbwtd62hlMyPFMj2G
X-Google-Smtp-Source: AGHT+IEIBXaAygueTWxJNAUied3BgqfMTeSt+mQtoXDY4HsMTM2B1djVm4ABb7qzMPAl+DjFRSHexg==
X-Received: by 2002:a17:902:e849:b0:2a2:bff6:42ef with SMTP id d9443c01a7336-2a2f2202e4cmr437213265ad.7.1767239019278;
        Wed, 31 Dec 2025 19:43:39 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm340437965ad.33.2025.12.31.19.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:43:38 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 5/8] arm: dts: mstar: infinity: Correct opp table name
Date: Thu,  1 Jan 2026 12:43:03 +0900
Message-ID: <20260101034306.1233091-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101034306.1233091-1-daniel@0x0f.com>
References: <20260101034306.1233091-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_194340_067649_35190A56 
X-CRM114-Status: GOOD (  13.05  )
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

The dt validation stuff expects the name of the opp table
to match a regexp and it currently doesn't.

Update the name to match the regexp.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi
index 441a917b88ba..40e38d995542 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi
@@ -9,7 +9,7 @@
 #include <dt-bindings/gpio/msc313-gpio.h>
 
 / {
-	cpu0_opp_table: opp_table0 {
+	cpu0_opp_table: opp-table {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-- 
2.51.0



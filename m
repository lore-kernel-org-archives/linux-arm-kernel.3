Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EFAF45A08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 18:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T0foN/pqKBZusWgqEzxLGZVWwkm1/709Yr4EKIMdhXs=; b=yTeqt2zAsX/WBjEf+BrBxOUoLU
	+XC6TvfOz8NDyha6rqbXQdbSCeZC5GohKJSQbsfuH9S+kcxpNLRI8cZuQTFMmZxsbZ5wkFEayTkcy
	ERGGstvHVvg12M1G5OgzMI3ci68APOx6jo0NTE4qP+MnK3RD74GYX0+KdP+3B6H2orZX8BKow1iFo
	VS/0KRMnefdMKNJPVxneZ1SGvxelN3wrBHkjylmAx5fHPmL/7At1J3tCT/FaPtTJ8KY3j2R41zyCI
	zz/LFpjGJEwC5F/2LqdJZAX43wy5a5Uy7UDX88mwt8Htkmv3reCK41oGWij0NPVFM9GFYeg6fYUXI
	uiQ84i2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBGVC-0000000Cg5z-36r4;
	Fri, 10 Apr 2026 18:22:46 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBGVA-0000000Cg5c-2A2N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 18:22:45 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so2428954a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775845363; x=1776450163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T0foN/pqKBZusWgqEzxLGZVWwkm1/709Yr4EKIMdhXs=;
        b=J5cNVQE5H4p1e8oc4KHgDmcsAm+e9KS3sQsxoAx4VOSvH6t4LZWK8n1W20a4ZLHTjF
         A9rx/+RWvy6uW5PECjlQuPh27NwKoRdg8puz9S/jZRQrpGTwNWb7yqcTs9XSTvlsGINx
         O2E4+292PZwCkMxv76ASsPoiYNS43QMItLI23pM9mCWcVUEQdilBThniyahi39YSlm1f
         rc4Ak+1NWw8krjaON4BsRsXEWZPmTuN4coXM8kf7zKyBNQ5z8/VD0rbCOg5z6wnSCZwA
         rk4nyswAJ4Re2qYPLzMeh8eZ9m5DnHkJU6OrgFT3shizXj+iZZ4/77zEtctVDf5eUhyY
         Qnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775845363; x=1776450163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0foN/pqKBZusWgqEzxLGZVWwkm1/709Yr4EKIMdhXs=;
        b=dm3Q5PG5QWro4TxjeabQgMdFFtEWXRZdrnMNPMaahx4PERIy+eR2wGpxYET+Pb/Ap4
         xUUW+OqG3IO84+e8bDu24yOxlqQ5GqVMXI8PSt3sVrvFVQRW4UlkjZM6zrwgkIDJX1bF
         IziCM6/R8lgAlnVDb89hKEDDPyKUuIm6xMICwm73Jkt0q87nftXnuOnvd+7+9+QTFO85
         Qt1vzIchS7BMWi9zQnglaixVHvvywobwU+wfEuOXxn144Gessa7+ino6c0B1xMHnJtr1
         +Av54HtS8N5UDevAP1erFCeP5O2k/qvubx079ol0Fs6W56KcEb9DMeTqQkKzQhW1kpvu
         7Zcw==
X-Gm-Message-State: AOJu0Ywvv+vYCrTiGlx+GluNtB/QQbLHjN13zAqWrKBWtExPv85FVhaE
	EQmoRnLtXjg/VWdBYiroKyjRQcm/fDK4Kb9rdUn7YwqLvuP86cS56lQ5GalvZucp
X-Gm-Gg: AeBDievtBxtZOO6ZFahFvhUaaYTMV9hdjfsuIeRDfGuaGG4pVTUkEiNcrpy1N860RxW
	+kcwnOWesj7futIv/kNbFhrxNedt4r9a+VmcQh3t+hKJdNMxtx6hObLsbpr/7NjKoxzkdLAP+W6
	H587QQwwFAF6zEhTQTcxL5vaIdd9J5yfFBtCJ+emKBEc3+b69sEOHHsPZWJdWz52CN7Et/c3nkn
	fp+Lp24XBURoKm9yTHAX3KcBn8zvK4YArNXvdxWpXOEAARLH5vMLYE6Ldb21l8LwtOzArP7kX2Z
	y4UtngLEz6AVhYH6mJl0C3z9XXfTGXfxJws7izeK0fGUmLa2APGORAdsY5Vs1uUd7fINn7PL0Js
	MP8O7AMUflDE0KfrdnwUSZe+/YSWGmcEFJPwuurO/ZPVmKlcAZTg/45gYPuu37httptR41o7ltk
	0Mko0rZfG+brYcCUGQR8LrqXzbo165WHSGfBUh872QaZHtQKDf8BtR2ZabzR/y65IrZMpmchx7R
	wCYGUww71QnBxlGEpc=
X-Received: by 2002:a17:90b:3b46:b0:35b:8d89:7199 with SMTP id 98e67ed59e1d1-35e42853381mr4442532a91.15.1775845363180;
        Fri, 10 Apr 2026 11:22:43 -0700 (PDT)
Received: from michael-pc ([50.47.84.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4133695bsm5679948a91.13.2026.04.10.11.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:22:42 -0700 (PDT)
From: Michael Ugrin <mugrinphoto@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Michael Ugrin <mugrinphoto@gmail.com>
Subject: [PATCH] arm: Kconfig: fix duplicate words in help text
Date: Fri, 10 Apr 2026 11:22:40 -0700
Message-ID: <20260410182240.812-1-mugrinphoto@gmail.com>
X-Mailer: git-send-email 2.51.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_112244_578115_0C7BAFE5 
X-CRM114-Status: GOOD (  13.57  )
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

Remove two instances of duplicate 'the'.

Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ec33376f8e2ba..e62af2a34f59f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1486,7 +1486,7 @@ config ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND
 	bool "Extend with bootloader kernel arguments"
 	help
 	  The command-line arguments provided by the boot loader will be
-	  appended to the the device tree bootargs property.
+	  appended to the device tree bootargs property.
 
 endchoice
 
@@ -1628,7 +1628,7 @@ config DMI
 	  continue to boot on existing non-UEFI platforms.
 
 	  NOTE: This does *NOT* enable or encourage the use of DMI quirks,
-	  i.e., the the practice of identifying the platform via DMI to
+	  i.e., the practice of identifying the platform via DMI to
 	  decide whether certain workarounds for buggy hardware and/or
 	  firmware need to be enabled. This would require the DMI subsystem
 	  to be enabled much earlier than we do on ARM, which is non-trivial.
-- 
2.51.2.windows.1



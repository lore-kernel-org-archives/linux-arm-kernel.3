Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8DECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 02:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DWjo1REpBLczyFtN1dimNiFcYvqpWOFb91sWdxflDcw=; b=GcVtJr+VcVXyVkmx2eyu86ULsL
	F3F2n8DQdOi3nreQbHudZgzSVue/8T/dv04KHeLM6n0Gr3wq12y+8LbXMwvWVU4V+ROrCdeygZ8xe
	0JrpZNeo5buZ2Ci216WPS+cUbALRSP7NjSQsw/4Oqc/DVSWflFt37RQG662qvlWL76UL31Cn1/Qa0
	VPWQFk+qepSKuUmEwaD7BJVP2QymSWWB4BcHmqhIvpl+n9+gJOsIj6arlV1+BorDKjbXcNWQ3yOAc
	WcuuLDoojp3ttAAMf2sUveuWnULS8y/iERBt/yaMvrIIY3LPEh6/EgDSxkS+6TG40Ec3RfASSDN5S
	44pRAIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLuBN-0000000A1sq-1lf0;
	Sun, 10 May 2026 02:46:17 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLuBK-0000000A1sG-1usG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 02:46:15 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-2ee990e8597so5688489eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 19:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778381173; x=1778985973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWjo1REpBLczyFtN1dimNiFcYvqpWOFb91sWdxflDcw=;
        b=bWQN7qhHsZbBYYuyMUIaYHNmUxWva0c8RhHUo5dEhAQPITAAArlLrPIW684nPyITui
         e8w67dclXCsmW/4U0jGlXpxy0yMZyFetAr9GHKEpQ6mMg4e6+203bbJYx9POvd8tn1zu
         pdBShdPGHg8rDLjoFT19vSMZGogN94bjh3ExZMtOxMJHXgUahSds1d6Z1DTL1mKRw/yl
         xSkDV3AcHL24YAlpjWrE/w/McW+3ZulGkhaZOcwIijhtEDPfKmP7CqIzQnlcuAOEbb1k
         Hb/l+yM9XmRKQ0OzvTTcU7TvrwFFnOPHJRhE9nh844NybDrlBGpH39oFFT0AXO/jeR4s
         MbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778381173; x=1778985973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWjo1REpBLczyFtN1dimNiFcYvqpWOFb91sWdxflDcw=;
        b=jhQpl2mGAUAZz+vJVu9EP7a30qzxWKq3NHwWMx+BR3nI5BoyEliWGuxsVbAK/dMX45
         5eM6T+Z7krxwk+Fef8ukH3RsyBeKYzp28SjUt0utafSjJ+R9V6wKtROlSA7W7qfDXoi8
         rPrgLBZla5mwXsDLLBSYV5+tF1OuMr1i8TGHDGrfDdXqzKaYD+Nz2IiG/QALPMAIV4cU
         +zw+YQDKDL4A+6yZYBHHiOYtj10wffVldcNozJfvbLiQSJOopzj9svsyRbjKIkCu0hC+
         qaXhId9PU2K0+2QqX28+oHKe/TR9Zh3bLRxXLqkn4BXIGGVnpwreGS0sJFCzzH4YrOfr
         zm0w==
X-Gm-Message-State: AOJu0YwV2veAmBqiCK6H33UAzh+kbyL610IHJ9LXRag8csFHyXlhe9vY
	gJoJ7HdJHHS4u6DGLI3cxZ66hilzCE8b4L8waMsCqzwimDMluUgVHNpJnSdOcOtkv9o=
X-Gm-Gg: Acq92OHfeyEQOOs3qzA8Cn0VVhVfieSw2fd1DlTFg4xrYEOE47PncS1aqrDHX05n4DE
	3rxxgzHVaNQsiIMfjC8R8X7NuPABN5pGN20cC3swmXj0juWeH8UZYAGjgw9SH96i7Ew8TGmUpnn
	6TTG7mLurbWn7zV6V45WKoO8/oQ2PLg7rO3UNIz3Vp+YrAdXXuAAZ52l00/CMB9vZ5N0792NOFf
	PhLZMQNfR6G6mrlGvtF8qz3m/BZS9o0tWVaa3DEmJJW/qh185pZHzNoOJV4wfdm8Z8E2OYG9Jl0
	104GxE3pWvwV9q+tiynQ9m7mepsJv9Z4xl25nfzbfLivClBCNQNvoUaRj/ot3HWqgHedXIt4Omo
	ppX0BZ+AGDvwJu4pmsohArTu4/q//qwlzYstkpdSYrl4qLqVvB7QqK+oSJdwnko41jAsgSddgDz
	XZMnXgHPWfCiuBz67CXtU0wsctSylKXq+MD4o/hA32WaKEdlA/yHr0o6sUs9uEvNfUbYSGyydxM
	/RdVCJgmTr+Ifx8UlyZaz7xESQoLfjUxF7iYUBaZSQ00zRjhuX1+g49ninQHl0cyhEuSxg1f0jR
	4AbHYTadtMrzLh6oJxGFbOv62J1K
X-Received: by 2002:a05:7301:9f10:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2f54948f6ebmr9034650eec.14.1778381173356;
        Sat, 09 May 2026 19:46:13 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859e8389sm8342121eec.3.2026.05.09.19.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 19:46:12 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] arm: lib/delay-loop.S: remove unnecessary ARMv4 selection for ARCH_RPC
Date: Sat,  9 May 2026 19:46:01 -0700
Message-ID: <20260510024603.193126-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_194614_496893_83726902 
X-CRM114-Status: GOOD (  10.36  )
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

This was done because Risc PC kernels were compiled as ARMv3, which
does not support long multiply instructions used in this file, to work
around the fact that the Risc PC's bus does not handle half-word
accesses. However, Risc PC kernels were changed to compile as ARMv3M
(ARMv3 with long multiply) in commit 8403bcb779a0 ("ARM: 8801/1:
makefile: use ARMv3M mode for RiscPC"), so selecting ARMv4 for this
file is no longer necessary. Drop this unnecessary code.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/lib/delay-loop.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/lib/delay-loop.S b/arch/arm/lib/delay-loop.S
index 33b08ca1c242..56f9eea56268 100644
--- a/arch/arm/lib/delay-loop.S
+++ b/arch/arm/lib/delay-loop.S
@@ -9,10 +9,6 @@
 #include <asm/assembler.h>
 #include <asm/delay.h>
 
-#ifdef CONFIG_ARCH_RPC
-		.arch	armv4
-#endif
-
 		.text
 
 .LC0:		.word	loops_per_jiffy
-- 
2.43.0



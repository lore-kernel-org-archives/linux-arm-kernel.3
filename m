Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580FFF45A12
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 01:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jGbHxsiD0UtpFtYS9y9e27TKmMpwBsROttFf5R989xk=; b=BCX85s9v7b8crr5GQzHAXXkOoA
	NTAxj1G/M1xZHyvw6BI8skh79ou9U6D3lbYjY4I4LTFSnrpB8aLpexkd+lgpe8hRZu+PuNNcJ9AwP
	WJ17E6N6BeBkStHuIq5jqoKL+Vb/oEfzBE3v/iZ9BWA1s241s6ar4HbFOz2Y8Qp28KnVU3JGjy0nL
	tT0Pkr3Jdj4/zeqadoxqkNHvgD79jc2f6XxNipdhI7ItkAEoxYOt63rgMwO3mBIdsD4zuyPms4z5v
	fJceOSqDO2Dw1ujc9VecKv9bbuaR1YH/kWplwA1X300/NJ0Ur+iz+uljOH1E5BAg/mW7eVUv258fj
	wFDk3eJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBN0q-0000000D0TZ-4581;
	Sat, 11 Apr 2026 01:19:52 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBN0n-0000000D0Sb-2uAj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 01:19:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2adbfab4501so11275295ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 18:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775870388; x=1776475188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jGbHxsiD0UtpFtYS9y9e27TKmMpwBsROttFf5R989xk=;
        b=DQS9tZ8t/FUg9mOehy69oSUJr/Efq/Km38zQ7ak3drb4hXEH0Cf2Zy5zlOfuuzjVmL
         6C66OyJcCeg3b29WCmu11Ykk/VBhqow31fO1tucscRxVpMzB/uQJKvZ7GJ/7k72v4pnu
         Gkt91zfBmK8HZxJIe+QTjEZdyRuJ7KYSmkrR4AKz/MhP0x/+EGYZXmoCZ0+ZhORIOR/8
         7Bpzqi2G3k1Omm5Kl3ZozBcWLYmsCz48Dj6uRCJ/oNBIqbfe30qTQ4BZo66D0ke5UdXQ
         eGppG3W5+HvoOYKYuwFe4Q/EaMXfjirJBjiltbqwqdPyRjI+EFU8qKJ7h6vUAN+IWdXa
         IMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775870388; x=1776475188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGbHxsiD0UtpFtYS9y9e27TKmMpwBsROttFf5R989xk=;
        b=TNIo1fsG5hEbio1LOCIv2bboT0lgTp9A7zXMJu/ZUnrvpyJBbty6vquWd/TonkTPaa
         IokmkziBGJgllF6LHLIX1tMmoGFSQOsQNnADHHTld0DwJKvSNXbEAb91aUIuTtBUoIRu
         8bPkwTIoymF4Koz440seT8i/C8Z0QODsn1FdvdOT2geQyh1QseIRejwYdGntxQLqi/ZF
         00gFFEDo5HnfIIiFNCFz5huOpl6ub+BEelw8P2UEv8G14+8vFOWgG8KuY/TtCyRRTVdc
         y9xE67QujibtF/auOxdsGepmp9o1Oay1HLgzpdTHvdPLlU3cTPSEOiYVATjixjB+MPUO
         b9WA==
X-Forwarded-Encrypted: i=1; AJvYcCVq+iBQ5f+SlaY4Q23vlsH+nUJHpdQ6eqPicdX/qWyhGgNoceZvyb5iXTJKzDfm41yv6yb0GzWhq/a48WFy029b@lists.infradead.org
X-Gm-Message-State: AOJu0YxmADbuphwX3aJB4koYgzbHuJUCjsgOaFFQYOeUduHRSo3ofnh6
	odu8q6uQmuNxCEWA0sOb2QAhYmI/oibwGwoh1qyjzJfRlVe/W4PcTN9W
X-Gm-Gg: AeBDiet436h+hl1rn+kLBr9NOgNAIfIeE9Mb1m24JjtFuUuRCQ5Mwh7gg8UmDTOogP5
	O7r/cO+kQEtbz0AA+cyc+J6wA7hHyNjdAgFYkg+EasHF0UfZPtE1ZNKApyYjEoBjlEXZ+Fnke3G
	JPuZqnTFs824EfSXqcc3eMcsSjphQBsQrPonXsCJ0vnM+LMUU5944SfuxqzSzW1gubIzcSa3ZZG
	eD9FyckLdr4y4pL/icl9WKmfXvLj5hpmDCi49bH1Qci9HMTmFJaXXcwLX4HzcZW4lA4+nAc+ynE
	ILXf+bQGfOs2BLTT4erCDiu6XKCVVLIDvKXkspiCasEg5EGWCp6/NMaYIUJU9PfLFwfGsdPkNOE
	4CXdC4d3tRbUQ/HeSZZfmI3T1oNvinrFCPn4McXUksKggu6H/447vaD24lstSbe1QVDHQM3OF1J
	8x13Gn672L9RELtiwTleu7Qk/6MO8URtj5EX/7UhrIYS0OEp9KSZQfYKra2WvuG6Vc0Y4qGZMLm
	ry6YDAmsC/ZcTZeaekeQhFzUFOQx9te
X-Received: by 2002:a17:903:2286:b0:2b2:dca5:101b with SMTP id d9443c01a7336-2b2dca51487mr33878385ad.12.1775870388363;
        Fri, 10 Apr 2026 18:19:48 -0700 (PDT)
Received: from michael-mint.tail2556e3.ts.net ([50.47.84.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddb462sm42866365ad.24.2026.04.10.18.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 18:19:47 -0700 (PDT)
From: Michael Ugrin <mugrinphoto@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Ugrin <mugrinphoto@gmail.com>
Subject: [PATCH] arm: Kconfig: fix duplicate words in help text
Date: Fri, 10 Apr 2026 18:19:40 -0700
Message-ID: <20260411011940.48941-1-mugrinphoto@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_181949_767154_32D1B1B0 
X-CRM114-Status: GOOD (  13.48  )
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

Remove two instances of duplicate words in Kconfig help text.

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
2.43.0



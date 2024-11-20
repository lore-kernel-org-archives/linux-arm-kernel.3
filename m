Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A20FD6E2B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 04:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5onQwIhmjkcNfQKy+hiSaETiCPradWTZcUAdilgGxTQ=; b=HNYykLQOhLVeatoyecDjvUdvUR
	ll6Qqr7+Pyw4XT4NI8CyySsyk37TLBYEuR3P5EWTDqTfJ14HIFaxHCPhwMIzfKl3UkBustvBnJ2ex
	BxiNYvdZuKptXcRDW+smuj82s3i4OHYh0bHTMNTyR/fJ/UjKf9Wy38xYIzNTAxDh4cCjz4eSdnhR8
	hl9X3raCepMZ0wV4oOKoLPEN8urLXtCfG8nKf3SvrPIkTPjV7CvLrXDh7I9sFyYeKAB74lvFFjhWB
	OG7o7jkb7yu5cx4ZcKUYfKtecv3rSFoutkBL0CMQTTOMY6+rKdzCdZC7d+msCNG/WV2l5rlS/gIds
	wAfpByYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDcd6-0000000ENtw-3q8D;
	Wed, 20 Nov 2024 04:47:52 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDccB-0000000ENpa-1xqT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 04:46:56 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ed9c16f687so4151326a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 20:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732078014; x=1732682814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5onQwIhmjkcNfQKy+hiSaETiCPradWTZcUAdilgGxTQ=;
        b=FozUoWGdRoDAkvGzMK1ZY8+WlpqZrAVq4OsfmUCKDwZn6pQkXg/fiNJDy3cF1BJ6RM
         BDUjvua7L/kSDq0Zxd/4iE6gAFe3IZROmTDVxs7kos8SenPSHZY2WlwPorhTqg+hw99+
         whPKQtH9BT6bRmuCUQU/4/hT/clCZ1OPk/iDin4v1tfO3q2+Vkxer08MJyRKaV/B00+W
         fyyHeljpH9MEIoLiIbv/jZIrYfympuQAkhC0pbdv8yFuQmT4FQJnMJlGDdeFPchowWcu
         AmmfuBqTsvh5bXRS5XKfqG7/X3TDhzHHFxVTAHE9GcH8IM1Ww0tXkmU5cFiHOb4USYzS
         jfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732078014; x=1732682814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5onQwIhmjkcNfQKy+hiSaETiCPradWTZcUAdilgGxTQ=;
        b=igfC3napVckOziZho7aSRt/AQEUXwZmEaCQBC41FuISLvq24KL+jZc/3s18pRaR7K5
         rvq91H5XhdhZS7dzzr9Fnpy324xQ0tEcQa2DMF0PQ6LB/kadxU14eeta+WG4+OITlrI7
         vDfRC6cw/EgPbv6K7q7o2VCgxmHYFtz02gQsKF8LSadDAxI9PGFcS7XwuaXyJ0kpL+k8
         ZkuxBp7N9mQc2D7p4zRfSBOi9FtjO8WnU4AarkPpAVn9+I+yUqknV1qYsiPVdWxy3xQa
         taDibgXjwveZxBo/1QmerSmg2UT6lDWqk6DfWVN/d1HFWGIz8j4nSDaHEE4ZyLNkb5a9
         UMWw==
X-Forwarded-Encrypted: i=1; AJvYcCXUJPUtG5YB26PBlTQMWP8UJ7dEzTPMHugokPyeHlR7age1j7ug8z/E5D037SKivrDdHXy/sDIy+JSOTVo+E3Pa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2m8qCXKCOMyBos1WFWIGmyNRxuZbmd2J3B+KMgGY0hAnzL6T7
	SrTEXsXDObwWKKlCIy3TdCv/da7dy8BzkOv0bxufKX9rvqe4uV2N
X-Google-Smtp-Source: AGHT+IHGDwWzUqRuzBRThH89VZ4tUNwTi0GUWsE1QUrp7jgjkbrXmG5/4QZ3cEnWhCMsiUXPj88Q8A==
X-Received: by 2002:a05:6a21:6d87:b0:1d9:25d4:e8b1 with SMTP id adf61e73a8af0-1ddaebd99f3mr2250797637.25.1732078014489;
        Tue, 19 Nov 2024 20:46:54 -0800 (PST)
Received: from localhost.localdomain ([175.112.156.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb833fsm621712b3a.23.2024.11.19.20.46.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 Nov 2024 20:46:54 -0800 (PST)
From: Ruffalo Lavoisier <ruffalolavoisier@gmail.com>
X-Google-Original-From: Ruffalo Lavoisier <RuffaloLavoisier@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Ruffalo Lavoisier <RuffaloLavoisier@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Kconfig: remove duplicate word
Date: Wed, 20 Nov 2024 13:46:44 +0900
Message-ID: <20241120044646.6335-1-RuffaloLavoisier@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_204655_524826_42EA44B3 
X-CRM114-Status: GOOD (  13.53  )
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

- Remove duplicate word, 'the'.
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 202397be76d8..289368a39727 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1501,7 +1501,7 @@ config ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND
 	bool "Extend with bootloader kernel arguments"
 	help
 	  The command-line arguments provided by the boot loader will be
-	  appended to the the device tree bootargs property.
+	  appended to the device tree bootargs property.
 
 endchoice
 
@@ -1643,7 +1643,7 @@ config DMI
 	  continue to boot on existing non-UEFI platforms.
 
 	  NOTE: This does *NOT* enable or encourage the use of DMI quirks,
-	  i.e., the the practice of identifying the platform via DMI to
+	  i.e., the practice of identifying the platform via DMI to
 	  decide whether certain workarounds for buggy hardware and/or
 	  firmware need to be enabled. This would require the DMI subsystem
 	  to be enabled much earlier than we do on ARM, which is non-trivial.
-- 
2.46.1



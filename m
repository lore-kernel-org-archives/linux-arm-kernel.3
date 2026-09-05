Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567E7C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 05:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W6LzuWxJpMnBn9aKpi+zBOEnJnyIuwuuYGfuHrQdAgo=; b=OYkPMUdy03SDy3XFT7/rFmaamW
	UpBi/Q4Y/2O6bH9dFYGMSzihPlPKsENdSDSnySxpG8pIBRupI83i7AQM4ONgIt2HsEhKvDrXt+jsO
	UaOxFVBtNjqjL1JIWKZs5uyZeF9yZ0JUCa+dnK2Pj3BdrOFyAbVf554V5tQHZ/B/cwSQ96wxFuUJ9
	tNkVfWSS1ZIClbHdJKvrKP3HGsKru1UnJUHgHwUunx4AznCLYigAiwAR2xglB/t2JB2i28LVwYWtY
	XzmgC7eysYHuW3UypOopjjCXVstzDXQBQ8+hqluklA1OTCaJ88qThG76glcPRxhmPvj5YvoAMHFDj
	zfVI4quQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2irF-00000003hW0-2OBr;
	Sat, 05 Sep 2026 05:22:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2irC-00000003hV9-3o6w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 05:22:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so19571845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 22:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788585745; x=1789190545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W6LzuWxJpMnBn9aKpi+zBOEnJnyIuwuuYGfuHrQdAgo=;
        b=MQQ5Kl0Dhpg4PBa1c4GlCS9x2iD7qoc0g/XOFL8618b2IepfcrzW/DdvgzSSGTVlaI
         bHAOMvr/45i22jZsI38y1x5+xQDjY+AuakqoVd2IwEbd1vzH3GbAgjYpK0zpMLVtBAwk
         82/hmDPY+9jGnPLRbknXqzpoQ4MCWf0bKitDQALDjrp8aA25St2LLPimApziSKvoxb3X
         YAYVnvs058T5t6aI8Ut7CLSqkMZB+aUwMqHbzYkV+ZPDnCZRiWFRX0SgROb3FeYTmVW3
         ORw3+bvm/Y4MDui3kAzHmHfmkDAYPIpotHc48PV8kKGyfNcBL8dhOb90fKJPdImiEzyE
         1Nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788585745; x=1789190545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6LzuWxJpMnBn9aKpi+zBOEnJnyIuwuuYGfuHrQdAgo=;
        b=Vz9ZqQQxnfPc5ENYmq+BcfjdVb7Hw4/udAww9OcjjRiwI8v62okb3/UDOaeK6eSCeR
         /LbnwUXLXMz4dRzOj1qzFVueiI+zEGJcfhXdespyynsXX8vwbJ39yUujsoUEm70ED8gP
         E/34g6Y3DI4yAXvW2I7CQgkKI1W43qCG8m/Ayrnbl0hdXlF3yrNyQ5u9JBIsSfTwZHU6
         W5Oi3naLVsuz9YGbeJuzzI+QHQFAdLTBka8L/+l9vkiudR6co9VZzsHD+alxG6NaB2zS
         FUwqUKZJUn4ZcCHh+S9hSM1atgmmrDa4N33/XolvxxS9CpvuR/NLLq3LbInVxKv6EgwU
         eppw==
X-Forwarded-Encrypted: i=1; AKwUvBzrEUUTQOouwvOBlxouR//RgTJwbvz7zgQ7l/Bg8GlyWKiTcAX0lx7MBkcpaahKMHUdPiF9LPMx12FDkMMBWHaz@lists.infradead.org
X-Gm-Message-State: AFuF++k3umzopmouO2ubvL4bkGIMAlCS0hVJgTvPFgTjPnHhk5Ybtl/Z
	gQPqUxRmWctcyO9AjfGdSUqnZTtmoafqOTJchgXew2quketmgHJCYD2gyUZ/EsfG
X-Gm-Gg: AYBFou3h1G2P9QgijMv1ncs2Zl82FmbZfPcFY/wmBtJEAJ3YWnNmzIPASEqVol2Df7L
	dn2I5MO5B+JaVzLJ9ot4mgwFv0hEp1TeFBkqI0L2Gmy6uRZYNRIQm0gRvfB6CUw7UIH7ji8M+5E
	4gyDpgcsiblsgmvthME65FzP5SDne0PiZgeBBkGr9hGK5sUPhYICaxKKwqfhE//9JSx5NXrpP/8
	K6zimy9JfKLHH3PGvDA2PzGXTejnnTjxNh7U6Id0BIiahGqQqHUE0tJXTAgv7yPDDJbcPi8vPEZ
	3cKTpsGr4RbwuFP+3OB5jD38ds4628VGwv3Rh2m75TkIJkyG9oZWKdvc929ltgeQR/YGMK6qoNx
	wSAr6Rpdyt5nmiChBfw1Mqhvz7PsFbhCkJaOFPa/BkTnReiOcikmlJ9wdLZOsFAPVwEnLCppxj7
	tjbnDgbgbiiMifmlVjZmZB3HZnHxHUods8poTxvE52Uem7mNZ2lHl0Iv/nl7WftHuwvUY/wYZA+
	gIj6/qoDMojAgeKzn3yX8a/B1+F+N7tyXVjyvk8A+auEz7/65oJ/eFpn5OQd3KSG84+twAgcGhx
	K1/Ye6ZtNwTPCfeEY+OrMedC0q3j0laG6JMPLbPZTMMPyYh141J4XoLw5cAJfA2Qtus=
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr95046655e9.10.1788585744908;
        Fri, 04 Sep 2026 22:22:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm9598692f8f.16.2026.09.04.22.22.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 22:22:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: configs: Update axm55xx FS-Cache options
Date: Sat,  5 Sep 2026 07:22:16 +0200
Message-Id: <20260905052216.11986-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_222226_975189_36EA53F1 
X-CRM114-Status: GOOD (  10.70  )
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

CONFIG_FSCACHE_HISTOGRAM, CONFIG_CACHEFILES_HISTOGRAM and
CONFIG_FSCACHE_OBJECT_LIST were removed in v5.15, and
CONFIG_FSCACHE_DEBUG was renamed to CONFIG_NETFS_DEBUG in v6.11, so
none of these lines has any effect any more.

Drop the removed options and select NETFS_DEBUG in place of
FSCACHE_DEBUG, keeping the debugging support this defconfig has always
asked for rather than silently losing it.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/configs/axm55xx_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 541e38e2205b1..7582c964fba0a 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -196,13 +196,10 @@ CONFIG_EXT4_FS=y
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_CUSE=y
+CONFIG_NETFS_DEBUG=y
 CONFIG_FSCACHE=y
 CONFIG_FSCACHE_STATS=y
-CONFIG_FSCACHE_HISTOGRAM=y
-CONFIG_FSCACHE_DEBUG=y
-CONFIG_FSCACHE_OBJECT_LIST=y
 CONFIG_CACHEFILES=y
-CONFIG_CACHEFILES_HISTOGRAM=y
 CONFIG_ISO9660_FS=y
 CONFIG_UDF_FS=y
 CONFIG_MSDOS_FS=y
-- 
2.53.0



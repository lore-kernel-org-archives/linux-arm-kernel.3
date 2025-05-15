Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D89C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zEHeE/LsGpP7MauSUuR1G6rmRo9uEtgsUB/PM7XoDEM=; b=mEZK1HCHn/+uO7UJ6kOSEa17fk
	akNVX8MVs497HHSE1E/2ni+BtYVBFPOuaInFPnyGTuLQOya3wOPdu6dvmysJak8l7VguuWh6aX9Z/
	RHfzvYF9CAaPPXf1pYDbxWQnRY6/KmaHb3HsGffEZFNRMcxz8rz06FOu9c0xuTo4l1qPS+YSfI7Hn
	Okb7s9XgGfWM26b1HKfr1Vw0ctAJizaM2ffTINosY/YUmIh4/8JXqmLSl7WdW+avmmWgrCPcqKQh9
	aCyrGy/zkBxaDu1zbNoelrQTiPX/xcuVFImqXTgRxMHti22VjRVGwx430DnHYmjqv+RjGjviEsWbQ
	G3Ahx/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFakb-000000016U6-41Yd;
	Thu, 15 May 2025 15:44:01 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaiZ-00000001629-10PF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:41:56 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f544014883so6688766d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747323714; x=1747928514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEHeE/LsGpP7MauSUuR1G6rmRo9uEtgsUB/PM7XoDEM=;
        b=XougXhqgMS+Ev/w5359RyV6VOAcyeoTBX5huBbrcHb7JgqYcRDTNgW1MgCIDqCwpsR
         AdaLKRbzWgPaGsw0YTUM40YXABbw9lpHxThL99UZtLHpbNvWyxl2uc1P5O1Vkk2/UBAd
         OgF+A1AufGQYbfxYP1FuYckTjPXGHRb/YvSK/aSm0zLQtNAVMQBiY/KdRDzOSkqlBPd0
         2BXnXw3j+Xomy+pEBVmRNhr8JvfdGXb69rczkHGisLYNTHPXjLgYScgNy9sBQiU9bjLB
         IpJaBxt5omaLWSdQjszZHh22uDfCzGsDluJY5PeR4cg1gjR0yifoyfkyW4w4BQbDqCKc
         VirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323714; x=1747928514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEHeE/LsGpP7MauSUuR1G6rmRo9uEtgsUB/PM7XoDEM=;
        b=wm7TBIPqS0hByx+IdbknKZKE6ukvugj8/RCQBfqtPzIytXqn27y/KIboNW0B03uFPm
         6zx0ALAQOLGEkDyylP8fzXu028aPsUu6VC1+SZxNKzqDVOoPheKG/xWx7qxAZ6LVfnc9
         X1O7CgRTD6BkhSDcO1fPWLCye5JmwR+8Ok27a64Kg4Z1rS9LgJVfzMrZeNa+VW7BLCKK
         TP8c0dy+gTcnVkZQy5SVhGqlKnSo9m5+fi4Q7GVk4wklmDL0PnqpBo/qhbOJQ02wyiDu
         ZCs8TNpVaw9IbGdit1D2IzJjbMShqsiJF2mcn1rHfChGmuLI4Bae5wLsGo+nNZm3eCZc
         wNTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR973sM3KkPf/SJdAUcAjMtcaV34C/RfQLaB7JRLh07AAsUvtvbNuXzYqNqVBsZhdmo2lePBe8QbTcwCzJFkxR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlgn/IS7FOAo8CP2Lbi1cIJbC/kRwB0sByc/2mytbAouWlxheD
	Px3KVz0J6ijKANm2VeF4HN9v5eZNU9cZneLko6s8kmduyiiU2/pvaeJQ
X-Gm-Gg: ASbGncvzHr90OSuGxi2ta2AE9vMZd/NcoatP7oS7NGT9i7MJUGiBvglU55wh2GqsHxN
	cjD/6DIN5UBlHdtkPWDwujISQ0BgiB9iwgrHWy314RpwTTCpx7TLiHWCWaCszyQRIUHzc/4ld/F
	yOsHnx7XnO/qpQyXxznwOOCsboTvT9BytbilzkUn0ILhdaIZ1+nQY7LnehNhLLUkLADe5yiC3bW
	k4tUtZ6drNJ9g5dhihv0S4DfyWO0n3n6V27xXuW2yzWTmA63LjAmXHQ4tlWZ1V3oGmN2zhHDIv+
	GioxmrgnTdUT8IVqgcfvqGDDIXxVJeh+NQmCsOP7KyTdX/pjouV0cLmzvQ8hhsGc
X-Google-Smtp-Source: AGHT+IGDFyA8q8aqTgi49SZ0JI3d12lh/ntac+FRmn1YMbs2jnYtuoRsDMJOVw0+g1Nr6tlxa3g6Xw==
X-Received: by 2002:a05:6214:d6f:b0:6f5:46b0:7d11 with SMTP id 6a1803df08f44-6f8b093a666mr2699706d6.36.1747323713728;
        Thu, 15 May 2025 08:41:53 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:83e:4807:376c:1d4d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec10c9f0sm95682241.1.2025.05.15.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:41:53 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: arnd@kernel.org
Cc: herbert@gondor.apana.org.au,
	ebiggers@google.com,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] arm64: defconfig: Ensure CRYPTO_CHACHA20_NEON is selected
Date: Thu, 15 May 2025 12:41:36 -0300
Message-Id: <20250515154136.435685-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_084155_277418_1D8F74F6 
X-CRM114-Status: GOOD (  10.96  )
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

From: Fabio Estevam <festevam@denx.de>

Since commit 17ec3e71ba79 ("crypto: lib/Kconfig - Hide arch options from
user"), the CRYPTO_CHACHA20_NEON option is no longer selected by default
due to changes in how crypto library options are exposed and selected.

To restore the previous behavior and ensure CRYPTO_CHACHA20_NEON is
enabled, explicitly select CONFIG_CRYPTO_CHACHA20 in the defconfig. This
pulls in CRYPTO_LIB_CHACHA_INTERNAL and allows CRYPTO_CHACHA20_NEON to be
selected automatically as before.

Fixes: 17ec3e71ba79 ("crypto: lib/Kconfig - Hide arch options from user")
Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Arnd Bergmann <arnd@arndb.de> 
---
Changes since v1:
- Added Arnd's Acked-by.
- Added soc@lists.linux.dev on Cc.
 
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 04619fe7e22a..7856db7dcfca 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1723,11 +1723,11 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_USER=y
 CONFIG_CRYPTO_BENCHMARK=m
+CONFIG_CRYPTO_CHACHA20=m
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_USER_API_RNG=m
-CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
 CONFIG_CRYPTO_SHA1_ARM64_CE=y
 CONFIG_CRYPTO_SHA512_ARM64_CE=m
-- 
2.34.1



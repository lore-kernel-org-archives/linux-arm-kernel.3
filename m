Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CF4CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 21:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gzLqQR6G4kyvk+M7E6iPCt77xQ+4XBPvUj75BQ/swwo=; b=ecnposnNLfhQcMG6ggpW37e3Yl
	RTIDi+9oNMDikLLt+bAMLUCeSvuWjjjHh1ceOSt9fhNCL1Ziovz6m8EdoXoWd1fSp6elOS38U8Ij+
	EhwGA2EZ2/3acWJxDiTqSl6GusGxZMFnZ0bTlVv/Hx6FUtP7NJ0QY3hpxanXNhX9hdqIgDLe3a15m
	EA//h9PxgwEUIr1a7cM9BxSjRWB2512Hwi9cdl2w/sw6vdKDR82qPCZiqmEC93QC03UzqOc37Rv2m
	43ufmD7Fd1+yYMXW1nNgOT4wSC/xLKb/pWCU0Q2RSd6CLG+AlalH+pAAd/FP2GzA3XiIOaat1erKZ
	voH7mGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTnOD-00000009uJm-0EjD;
	Sun, 31 May 2026 21:08:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTnOB-00000009uJR-0VNV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 21:08:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8422f395a4aso543153b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 14:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780261686; x=1780866486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gzLqQR6G4kyvk+M7E6iPCt77xQ+4XBPvUj75BQ/swwo=;
        b=cuR+BA/7bPH7ffEWG/6vax75JRMjhoKhkpGiCgt/sR7aAreLt3rellx4pgaN4Nj7Qv
         zySaLiBsUUJsuoU8s9J4i7FAVMP5aW9x2Do5b3fTwIsaxhLFXpgRNpcK7YO2tJZeHgg2
         FKuHpQeyPJCxytiDzCTShnt9G6XyZu6RcAZ6hOU7JR/K+LBESjzBFDFGaW91Seja77fL
         Q9SNRkqFqXoraWvc+cUyHlbeiGkvjU8JHP7EWYavs46qh1KfaluoEqsubRMEbXdzbAYy
         lOb0osCbLjHC/rLfpE264XQC5qqWtm4p7wjJLITssWHrRostl7440Y5C4/RyABmMFbTx
         1Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780261686; x=1780866486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzLqQR6G4kyvk+M7E6iPCt77xQ+4XBPvUj75BQ/swwo=;
        b=nkYIFoApwI2Hly67wck1UCuYtTYD/HjyorcPTK57amOnH8IrwmxlcfFJy+yGHxL1ch
         i/tKn8TGbF+a7sIyinQdPy5pD7odMFBueATxPWjPWmORmqgoa5i1VRioR1DNDu3AdxDw
         C7SYiIGXCKvABAWU2sOKYWq+Scwvu46AMHCB0pS2IvYeFi5KU1VAvCVwKh2ZGwcNmrIW
         bbXTSP+RxeOZkVYiz4O6j1ouov9EqLKtncN0U3Tcix6kbllvxmcEmNSP1/J7hpostOvF
         XBUkIxhry49vCirIV5ry1rs2UUyFiXLnLbXXm1vePoMWe8FkmmMpup4PmthV2pInXV4g
         e29A==
X-Forwarded-Encrypted: i=1; AFNElJ+gjdO/J7dJOUDngqfnk7RhH1NxB6+jqhcTwrG+NVLGwRzje+LiRmQdJWTrGnvS4LUIMhWHHOPJgr+W0jyNIzm2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw31b+DgwmQcS+PZrW/0n3gLmxxwb5UJR8IOWGUbJHQ+UmbNzoH
	CgjTHvr7mFJUMbXCgejHeF6CPKn7EJCwdM5iUxGxKVchzgGB9HXJfXHx
X-Gm-Gg: Acq92OGHErLm9adzbedqWvb5+Kt+BVVYUfBVfUKGnWqJmUOTmLt3F6761yzIIjyLlP3
	nSNKctQzCT5DA50GS54WBWnKfOtr60yIqAKtHWHLqPcs9+WCs5O6LtX7rmOml9oAZgJjXUIPJ49
	KInYBrQNvZ3X36T2kp65Pc5I5OenFIhmPNLjw3Jpi6QqNYPdP9yvPt7W87fFmh7RxAVcRqeFNYK
	4KS/5g8pDpT/XLNOX3y1q1Wt5FZM2rG6Ev/4FmYawC1fW+u1C1dAyUQadvIbSnGbkgzC6VwsGVJ
	FbvrlNS4yBTvxU7kwKY/tde8w1/PEOLKS0h6I1DZ50/NsVF4n1qyspO5mtoZuz0NdHqfNeS/3kv
	7+QR3kAeWR7+h59bypwseUlMfJxZCWoYVYxLXgmsoqHsIUp8b8iMjBxqPwyy6EJt9KYkQVtyif2
	eYBcNbmnEbYeCXuvGy0SI5o6CcA5dcZlEWgq3TgQFzfhkahG/vt3ykiwx5JQ36FeD8JBf4mBOuN
	cjz+slbq/+CcdaatSNL/deYy5fpVcDbXsLdc5s+N45e9w==
X-Received: by 2002:a05:6a00:23d6:b0:835:51fd:b7ea with SMTP id d2e1a72fcca58-84210b3a471mr8981456b3a.19.1780261685744;
        Sun, 31 May 2026 14:08:05 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm4857400b3a.12.2026.05.31.14.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 14:08:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ste_dma40: fix out-of-bounds access from D40_MEMCPY_MAX_CHANS
Date: Sun, 31 May 2026 14:07:47 -0700
Message-ID: <20260531210747.11401-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_140807_158728_695A4C56 
X-CRM114-Status: GOOD (  12.44  )
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

D40_MEMCPY_MAX_CHANS is defined as 8, but the dma40_memcpy_channels[]
array only has 6 elements. This mismatch causes an out-of-bounds
issue:

1. d40_of_probe() accepts up to 8 memcpy channels from DT
   (num_memcpy > D40_MEMCPY_MAX_CHANS allows 7-8), then writes them
   into the 6-element dma40_memcpy_channels[], corrupting adjacent
   stack memory.

Fix by defining D40_MEMCPY_MAX_CHANS as 6 to match the array size.

Fixes: a7dacb68b35a ("dmaengine: ste_dma40: Allow memcpy channels to be configured from DT")
Assisted-by: Opencode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ste_dma40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..c45643b7f415 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -86,7 +86,7 @@ struct stedma40_platform_data {
 #define D40_ALLOC_PHY		BIT(30)
 #define D40_ALLOC_LOG_FREE	0
 
-#define D40_MEMCPY_MAX_CHANS	8
+#define D40_MEMCPY_MAX_CHANS	6
 
 /* Reserved event lines for memcpy only. */
 #define DB8500_DMA_MEMCPY_EV_0	51
-- 
2.54.0



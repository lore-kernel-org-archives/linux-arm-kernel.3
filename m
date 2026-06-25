Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E933CDE009
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RxV5fEpsJGHhE3L8vdcj3Th/5v0heJ6mrreI6jrRPh0=; b=CqiFQjBSuxxBJ4fWbUYRn2nWk5
	txGL8hGT702dOzSZofVypPtFM/BfcMM3Z9EwaS6mGndT19CfSgL5TUX8oiJmJ2B6nK79c5IsTmJlI
	HDqz+RYhoaXV6h+gztUNxPy7i12wn4zDMt915q545pxePZ5Jh/1x2spWTJYWY5YS0qb+VdrngavDt
	ryYSLXM5t1jYubsaP1P5vfr832/F2Y9Ez8tjPn0Dhhv1JCBhf9kizjllzUJgW2gTiuJ+Vlw7Jm4y3
	Ye/Ieg0oEnozXN/ZUFg1XsL8rHO12tBvPyC/kfpeC599MMNds2JegwEWp2Wp30TOgyammVCgT23pR
	NJuk1PmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcp3P-00000009hHQ-0Zmf;
	Thu, 25 Jun 2026 18:43:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcp3L-00000009hGy-3OjH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 18:43:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c7e8eea816so5574315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 11:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782413034; x=1783017834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RxV5fEpsJGHhE3L8vdcj3Th/5v0heJ6mrreI6jrRPh0=;
        b=L2gMWYT5n3MXG+AstfO5FZhVukLioZ3mCJF8lANEfpJWh81Njs6Bdzun9Rtq5z9C8n
         JnBvab+FPHIh9D88BWZ8LdF7i1ebdnZHNjKCn14uXb927y6Nhct9kGrnHS6if0AC23JP
         X1wBLfJkMBjCJ/BfIifV568a8bUDqP0f2at6YFONNTZ+CIWzAPT5x7aaQRbOpVWNX3PD
         JmteOJDEwzWkqkKT5mPhAey4tn+r7UV8ZVSFgYCggq31l/G+6bWSbEWHKUBDN4YWdgrn
         Oo0EsKEmyJg8KBJTsD9dC+72MxKTkQKPSiCOlO3bD4fUt9wnf5Y79C36jgxMjnzetUvQ
         1jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782413034; x=1783017834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxV5fEpsJGHhE3L8vdcj3Th/5v0heJ6mrreI6jrRPh0=;
        b=MbPkViHrq5WU1NW6LcoT5yxSf2n+IQM48UlW7vf0nJmpmzsIZMhipSjkSt0xUDw6jp
         Oc+XgbA+z9Y063zZCeFxJCZ1iZUbhaesYZUT649YCjBz8Ffg9gKsDzKwcv2YYaz0fiaQ
         VmfI2S/vMH0VRtNAv+QVY9sJU7t9NUsW/mDNtlK+am1GDBx8ZMpnBU3wrac/mKTpr+LI
         71snlBveCUouv5lTVQ3s5e9FpaJzXfrysyFb0kMYwKWw6/fzO+S0zHQQ5hT6AElkdUM1
         bIG5WBqoFiVrIimcBHp236sQS8fBmXWEcjgBqGuiiPaSImWyN6v8JB09iGKSNBBTz/2/
         Auew==
X-Forwarded-Encrypted: i=1; AHgh+RprRAjNxwphaKLm89V9+6IDAtsGAjH5AONUxyPB/doXcE8OGWUQhAanf925xJyW3u+fxWONajUMnZGGTLVkzV9A@lists.infradead.org
X-Gm-Message-State: AOJu0YwRreP2MxqaiZxxUSIajOt1f6kMkf7IlHOjswWoMz9o/rDQWviJ
	wz4uJ60i3npVZDXyi5M2wLSwFGXMNdMKOaSm6RQEBJI+sA9PH08tKTeo
X-Gm-Gg: AfdE7cm5Id81tgbBKV1FK0nNUZj6sqKZWr5dIB24jt3UrdD43qzBjtzErzF4YWQBeRW
	sc+0tsfoWr2613DWJUUnlgFAJVvWeR+SNKZSL4z4nZdW/gJL2a9vOGJEVOAIylP3cTP0nVc+qzg
	1FVj+TtExzGBCZFfHH/odyVaiibPzJBF9+oF0cxC4vRy8KDDZS92atBbbm2biC+uvcEM6U46aPw
	gtXiImiKDMRsWcM+27kHjMJ75zM45yrxfniGaP+dyb1fdK1MyB44SmEnxBu1Ky3IYv9z2GJvfZ8
	5heUf1EEp2CwywDcA3vmk54EPs0bhBHOw/Ndpax7Vsd/n/ouA14p4o1QAHYUIfymGbbAKKaB15G
	gQ0necRmE9c5Rr4+FeWOeXVcYb3Q5WVxpMPdni4jAIC07hcuzrzm1Mj7F+Z48iWJcjJaPfqva36
	B1Afl2p+8=
X-Received: by 2002:a17:903:120c:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2c7c3d2a46fmr117184865ad.6.1782413034478;
        Thu, 25 Jun 2026 11:43:54 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm26263075ad.29.2026.06.25.11.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 11:43:53 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH] ARM: remove unreachable invalid range check in kasan_init()
Date: Fri, 26 Jun 2026 03:40:36 +0900
Message-ID: <20260625184037.630815-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_114355_848218_7FBE88D5 
X-CRM114-Status: UNSURE (   9.32  )
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

kasan_init() maps each memblock region with for_each_mem_range(), which
guarantees pa_start < pa_end. Then it skips any region with
pa_start >= arm_lowmem_limit, so pa_start < arm_lowmem_limit is guaranteed
as well.

When pa_end <= arm_lowmem_limit, pa_start < pa_end means start < end, so
the start >= end check is unreachable.

When pa_end > arm_lowmem_limit, end is clamped to __va(arm_lowmem_limit),
and pa_start < arm_lowmem_limit means start < end, so the check is
unreachable as well.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/arm/mm/kasan_init.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index c6625e808bf8..1f7c74c5df9e 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -262,12 +262,6 @@ void __init kasan_init(void)
 				&pa_start, &pa_end, &arm_lowmem_limit);
 			end = __va(arm_lowmem_limit);
 		}
-		if (start >= end) {
-			pr_info("Skipping invalid memory block %pa-%pa (virtual %p-%p)\n",
-				&pa_start, &pa_end, start, end);
-			continue;
-		}
-
 		create_mapping(start, end);
 	}
 
-- 
2.43.0



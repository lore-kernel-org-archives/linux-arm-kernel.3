Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38666CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WsamuewV/YJ+n5V13FLiPkRgK4p5rrc0DQMBArtGpOE=; b=4sJopixA8iUJ1mneCSUTs/89iV
	8k6kVEfu/NA5sL0wws0wVuyOcZJPIepDpakxp4S0cCqYFzjYOmIRsD5zc2K4YST3dz3LGuSD+8Kx+
	2HTWSUjTdGpU0WYVh5+Gvwkhv0ARxJ/DJv3KC5ybCzhyrzTWK+/UhdlNqQAAZ2A+BQlI0tNpPtIsw
	UcX4kFGZ+1CLpEJPDACG2kIz4QmJ1dQPD9ZmXOK1E8TDEUf2N2k4PesvPIfT8nk+Vz8MTzIchmKpH
	68gYvPXuJk3e5zyhGkkB6ORlgaFbyAn6UV1BoG+YHnwD8ik2uWzPhD67luxpFfNc7yqohqb40PX+/
	KXnPWcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSr6F-00000006qOM-0GNt;
	Fri, 29 May 2026 06:53:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSr6C-00000006qNz-3XuO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:53:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36a3e47bba4so916223a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 23:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780037619; x=1780642419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WsamuewV/YJ+n5V13FLiPkRgK4p5rrc0DQMBArtGpOE=;
        b=jELEb1Lm/iYj8QefmLmigobo/G1OAcgDdXphK2sQ2RGzM0CSki87EoUalAoGeJBWos
         32J329g2sBhEVTbNaLd8qia8TsAFMD+vSKsz7tH3xIqPl2dhyAZz9mSAotU0dXN6Z+0r
         Rk/n5Y4VpXwIRrDcEuBSjU4EK+p4lSxUePjz9z0E4PGCxtOnei2JRzZTpVkLnw+qsBlD
         hJeebvwSJ7qpr1pSRvxVSz6CfGLC7IJ+PII3SaVT1TuTpKni1OT50mG6aTgdkLDsR12O
         FCBtIFKXVLTJ9EttUPSi1yGiIQFIjs34AthajdOjfKpwjgPplsC+pIcP0hhgcX/1nH8A
         o1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037619; x=1780642419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsamuewV/YJ+n5V13FLiPkRgK4p5rrc0DQMBArtGpOE=;
        b=YO8EN/44S85cBK8XqPCEMcMrQtOEwtEvIjwmynFPRhozvkpgA0DEmVyRlP37AWmbzx
         RkBzTHv6vPevD4BfErQ7UY/xC9xKumNS/jRcn2FmCIdpbh4UKLPdK2vC5qnO2oRhgdnb
         yjBtUlTYhvxFfkGDFg745swoSdTTUiopFBFw+Rr/K+k4avKonMvwUvnU0fAOY56uchEP
         aB/FxhxbRPWK2tmx1A3D/NklsJzsY//hdcG5CTyuelG3vTEbpPstL67aY2IjmYoGyrR0
         2uv6evYuU4Q44GBuC78k+8CNjDygQGYut4qh6gTsIJTdT+R3NY3Ywm/SZiIvA0e2SwxW
         YdmQ==
X-Gm-Message-State: AOJu0Yzp7TwNeRyThYGiW/rHe7H83furbutRlBnLiwTtUScFNSuYq45r
	cJUKkpIZq33qxy3/FNAjQ4GNnZSE9DuRb+l2W124aYG2ZJawXaxMKSq5jOCZ/lMu
X-Gm-Gg: Acq92OHDj5X2bmJFqUbnZv6JsbVr2xtktypcENNxpn3NM6QFpeioDSMHiGxIadXaYXz
	Tcd6TtqYp5NKYEIQZbRN+v9oMWmduife8lNBN8Exth4D1DKTfGHjzOtZgQPHqCWZf7Rv7bxHzd/
	bZ7w0T7uHbqEvqv2WnTThQlSG/MqsktiEz48EIRqaPJ0t5uFpdJnc1LwIXkEZk8MC8xLuIyh3Qp
	6sstO4/afqZR/ZVfB3KycxnjtIj2nBmNhU+s6XIXke2+um6l0xGVW8VePUzfHJKw4CpDhQeGFV9
	X6nlwZUoLGnZ1RCRSPkAx6QpyYWzjN/1jgj+T/dL2ABx6SmW3zGmyEyUJUj4R6gYUmIWXefD0Y8
	zXDcAtLd3BCVtGjWNNB8t4EmcBLB/B89izYquCC/1hSNGf9mVvZf/hZJou0Sa7DKgZd7TKtI60o
	xjLpPGJSQwS8TgHzFozZH108Qy7lZsaGVrwhf4B0ZGLmM=
X-Received: by 2002:a17:903:2347:b0:2b2:67ca:5ffa with SMTP id d9443c01a7336-2bf2042cc49mr11513395ad.0.1780037619139;
        Thu, 28 May 2026 23:53:39 -0700 (PDT)
Received: from localhost.localdomain ([189.1.242.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b0121fsm7910125ad.49.2026.05.28.23.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:53:38 -0700 (PDT)
From: Yiqi Sun <sunyiqixm@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk
Cc: ruanjinjie@huawei.com,
	will@kernel.org,
	rmk+kernel@armlinux.org.uk,
	Yiqi Sun <sunyiqixm@gmail.com>
Subject: [PATCH] fix: arm: syscall: use live r0 for syscall_get_arguments() arg0
Date: Fri, 29 May 2026 14:53:02 +0800
Message-Id: <20260529065302.1335743-1-sunyiqixm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_235340_887707_D332F740 
X-CRM114-Status: GOOD (  10.88  )
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

On ARM 32-bit, seccomp obtains syscall arguments via
syscall_get_arguments(), where arg0 is currently read from
regs->ARM_ORIG_r0.

However, the actual syscall dispatch consumes live arguments from
regs->ARM_r0..ARM_r6 on the traced entry path after ptrace interaction.
Since ptrace can update pt_regs before seccomp, a tracer can create
ARM_r0 != ARM_ORIG_r0 so seccomp checks one value while the syscall runs
with another, allowing arg0-based policy bypass.

Make syscall_get_arguments() copy the live argument registers from
regs->ARM_r0..ARM_r5, matching what syscall dispatch actually uses and
removing this desynchronization.

Fixes: 0f3912fd934c ("arm/ptrace: run seccomp after ptrace")
Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
---
 arch/arm/include/asm/syscall.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 574bbcc55382..809c86b5fd5a 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -96,10 +96,7 @@ static inline void syscall_get_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 unsigned long *args)
 {
-	args[0] = regs->ARM_ORIG_r0;
-	args++;
-
-	memcpy(args, &regs->ARM_r0 + 1, 5 * sizeof(args[0]));
+	memcpy(args, &regs->ARM_r0, 6 * sizeof(args[0]));
 }
 
 static inline void syscall_set_arguments(struct task_struct *task,
-- 
2.34.1



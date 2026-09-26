Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136BAC98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qtAmnq7GHFyoC+l0IK8HL+LJqCl6RnngBlg4/6pPAk0=; b=en16TbyjQkBELN/AkBbgXryP/J
	zV//9OhvelVVObvVXQwPb59OctupAAX/6yfD+sqx8vZSpI7NRd9xSR/HCUBeuhcbF4RmcHi2D3yCD
	0oByKDr8x2WWw8GPq9KQ72FDP015vFzaL5QtJjxIPe1h6ekOykCkhDwTJJAXzcX+cFEBNRluN6t8v
	llLU+B72iUqLc3PZL1TiHC8obL+4fPOdtCusGqY99u7clOzzWBIDOln/dy+dxhQ0IYxM1UjDqk6/G
	p9HMGQfEKuKUkHLXHkXQdU7MOFiKODUy7uZFCmX16gji3/+ercsmMTzhyGmNN6uET2AtbMOA5BSkN
	JjsA9XPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJxQ-0000000Ewr0-0f4O;
	Sat, 26 Sep 2026 04:24:16 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJxN-0000000Ewqd-2fNL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 04:24:14 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so956509b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 21:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790396653; x=1791001453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtAmnq7GHFyoC+l0IK8HL+LJqCl6RnngBlg4/6pPAk0=;
        b=DtUjHB43GPBqJ2vF9ic33bjRgni9mTLsvOaQR4BvUhRtJzKR4bOi53Yqx6N0EN4Fd2
         42WnwICtCibvodRJ4dImkxgHjoK9dMJhto/lPnOdfOyPEpgDihncWnGBFQt0Yqg/kPvm
         1IBs9+dPoyhG9Y42emGg9TIWEXdUq4azF+kVycwrGZGAKb3Qh+EAwlMr16u+fUiFk+7Y
         nOaYTVAJ4ybnmi9G7CXjWSqFmmpl5lnpTiawDY714Mr0sgIip2QTCZ2/yTco8GK0O++t
         KDVoYe+Htefm3+MA4gUs9TK+iyxml4lBplILe3Nj0DcpcJHlkq+ApBOWlYXEFNbFsbjq
         s+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790396653; x=1791001453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtAmnq7GHFyoC+l0IK8HL+LJqCl6RnngBlg4/6pPAk0=;
        b=rQBGWtLZLGvFtbpu6as5SMIfKXPHv0TqGJt9+byEq8ws13f11jWwNdcNCy6DHuG2Gt
         5iW9j9yDketSGOTBZEez9YIBK2PrCyfGJWhurCW8cntt0mSl+kzNb1w8KySti8QuXK3Z
         ztVMV174oeUfN8z7PQfjJiJuip5tB1TI5P60OrM2/hJHC1Iyok+X5c7qrTfvpxZgSEXT
         RaPahxDowv9Fu8PdgtMa7udw11tRUD9tc93CDh3wmmhjs3Am2hQ7EcuSEtOb4Gri80LQ
         io4og24U1i2iA7otjsHJ2BcLy3e/+kKxqBj36XW7pgTk6CfKDYOZ68v8BoEnbrHmKNTq
         iVhw==
X-Forwarded-Encrypted: i=1; AKwUvByAH2kquh8HKG7g8B2DfUNHVZtK3SZUhpaX52k/z9mwcW0RJrxAt32qtj4HIqOUhjqB0f3MSF34Uh+ZJyvgDh62@lists.infradead.org
X-Gm-Message-State: AFuF++lsMqTjpIupIW7pLGlXBSKXrHBMHIfoJEDqfylFPrkCpYHsnFUW
	CEbp5HfAhyxtMcU1K8tLIWdDrTZ5OJ6AoRcA79wTmn+be0mdqCTWhifw
X-Gm-Gg: AYBFou1VDBa7egDMvjrzMYmTODBtNtqgm3HYAOylBCyOnUOD9YPHvLJlie2ufESYcXY
	lAPUizkxWQlV7kyLw7Mk0mHm/Iwo4ADPHxzPhzL/AoXja6eMKfrZTOZiXfBAmyTxn4g/CyCUNJ3
	glesCt3Wy96hObudLyjKkzDRQukoWCU/ceNpLIHsoJJzNLJAp1NC/Bo4QadhMxWgLfGfCpW3Jse
	mrIRD3P5y3ldeky6Pc3yI9hQtQ/pqW6EPmvK0GeOr7b/0I+MpZv2f0B/s5m/Co+eogVlfRvj7t0
	l/07MNBQf/DIwxO4Tk6wcYhQf3gCYx9HJRYsGJ5CVLO+lxT2wYr7lL5s6WssLKJ3t1bads9U9pA
	rIeI21xbIu56vWQwp9BbRnzUS0/izc+8IZevlZ0tTWx6RwG+MOpYExYunPlfa/EgAoJHrQ9gbHk
	ql4GJQPPDVbYRZnNYh52zZOwXDcu6bk3VJrZDBoVJ9fKLvmkdrmAU5+x+15j+/eNJvMAVPvI1Yo
	kKsGMwVyZ7TKTSVTQnqzVSo1/bZKk8m56NGjfCu1zH/87U84nLCWfSNQzTqe5kDpCInlrFCM4/+
	/3wQYfCjPpEi3AnIBbB6Qjwwp81DvcduxRetzCSDkC+k/UJC5Q==
X-Received: by 2002:a17:90a:2ce6:b0:3a0:a055:1741 with SMTP id 98e67ed59e1d1-3a0a0552127mr3650622a91.27.1790396652570;
        Fri, 25 Sep 2026 21:24:12 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ca127237sm2005316a91.4.2026.09.25.21.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:24:12 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Antoine Tenart <atenart@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] ARM: alpine: fix device_node refcount leak in alpine_cpu_pm_init()
Date: Sat, 26 Sep 2026 14:23:32 +1000
Message-ID: <20260926042332.1633698-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_212413_709514_D24AD2FB 
X-CRM114-Status: GOOD (  10.97  )
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

of_find_compatible_node() returns the matching device_node with its
refcount incremented; the caller must drop it with of_node_put().
alpine_cpu_pm_init() obtains the "al,alpine-cpu-resume" node, maps it
with of_iomap() and never releases the reference. The function is
__init and runs once, so this is a one-shot leak of a single refcount
during boot, with no functional impact.

Drop the reference after of_iomap(), which does not retain it; np is
not used afterwards.

Found by static analysis tool CodeQL.

Fixes: e9e06f2853dd ("ARM: Alpine: smp support")
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
    hardware; I have no Alpine board.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 arch/arm/mach-alpine/alpine_cpu_pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-alpine/alpine_cpu_pm.c b/arch/arm/mach-alpine/alpine_cpu_pm.c
index b48da6f12b6cc..332c3c00d3680 100644
--- a/arch/arm/mach-alpine/alpine_cpu_pm.c
+++ b/arch/arm/mach-alpine/alpine_cpu_pm.c
@@ -50,6 +50,7 @@ void __init alpine_cpu_pm_init(void)
 
 	np = of_find_compatible_node(NULL, NULL, "al,alpine-cpu-resume");
 	al_cpu_resume_regs = of_iomap(np, 0);
+	of_node_put(np);
 
 	wakeup_supported = !IS_ERR(al_sysfabric) && al_cpu_resume_regs;
 

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
prerequisite-patch-id: c5a3be8688fd8e88a00352acb1374e91fcb52a03
prerequisite-patch-id: 67693e2c08624df0841619cc085ce9200f4385fc
-- 
2.43.0



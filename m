Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC63CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=; b=rZRtnSVZPsR/kNnwMC/KJCLtNT
	sf05E74prLDogmyG/aWZBegzSglAmOX1U5bLQFcLgXrtZnnNoGItZgkt5g/pGR6UTEKWhuHoBlExh
	sdkWP0rXQ+9Uo/RQuG3mDcxxWwN9V6mvRl1XOel2BeBz86RwnI6P0EnXRetTBepALf2qMS0y7TbSm
	SA79eieN6LVrAW0JU5prdpKfkl9eTdTfwGyl7p1Hc8Haukf0AoEmmAAz0UDQ6K15T/yATc5kYIKPs
	+NNLBjTupC4rKxqnxQRyF/zuXKQtAIz0Gr/4FX/UMcGyjrqAZj22BKoeee/h/3u6Ca0NCWzK8Wbct
	Q3TyXteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2J8-00000007aIy-2yd5;
	Thu, 23 Oct 2025 20:53:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2J6-00000007aHP-1jbu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=; b=UlFvrxsZL/QJYF0BYhyBS4caCC
	qaaHywXyME0kue99QWOLe1IRUhJdSHyubB3lDj30c8Kk5kfh+txeitMQh2XE/PFiyuDwdmPhgpEBT
	ZT4XNX5LJC4kL6gMwqG84JlTtqETHyebXl1gxS0ljiEjchf6/p6RXNchkQg8q4vzJeHXmkDVi2OuF
	WZiArn6bfsMmq8x+8OR30vZz1xj5tR/w7RVmVOSOHBSGCMDQVXhqa5Rz6I9vK71kRNMisUtL8N39i
	C4wGQAh85YOfYb/Hz1C/m48P1juscIr4XayQEHkyO42oln++ab8D2BJuAG3+MfDQn62L39MFiCP46
	2jiUY32g==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1RL-00000001k7L-1kDV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:57:42 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-290c9724deeso11715505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252783; x=1761857583; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=;
        b=KhNsomWXkK428t1vkkyC0Plj8ywk8SLzwwg1/+bkPF6zaOGJDyUZk1fX3RGCDuNW0S
         PMOUXBze2r8miwH4XmsRjrDGQLZ2J6mOeQVU1rBaTQqYFjuPJ4PrbCZP0fHQDfhYzwhN
         EIyuokrS3h1GGvoKKLf8Pn1romELMb9vno81/fm8h4HVVKBjg5lHzJLkM/UiW7hGD6H2
         osbMuQbp2NsXyHlZ6M93cxAmMlwT3aT7C65st4mrVxL20WQMBSmQZas/HOEUmO33ePX9
         N+DPK8wERHvWMxPyeYYBs7W1VenHG4Og5O9NyWf7Tz1+OmoITn+QMhSh9T+j2JqKkZF/
         lL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252783; x=1761857583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTNDlcC66j9mF3WCrjdhKpeenuKBiHXH6QybTCxkPhc=;
        b=WL9RbVvsaGiR8DRckl980P/BqhnEVNj0qN8xPWnT+Rhi3bI80wU1S/Qu5y6T48caDi
         ob7cHhxncFRsONR9zfDPSjWF/v7C0SjvNTUWTLPvbCoZQC0kvDa44BRd4U/YPyI2Jk65
         SZscI/PNqH/mnF+eOg2QOPh+D2ZUHDR+0y49sscXuqigS3/yl90pJtdfBQXYZ7wkqwB+
         VGuJ2QD2sccV3aLjSYJcuPyV2Jk6s8CGUCk/gtRDEBZNaSwUdFkyM5p95HuhbhUhD8gI
         ISMLv6+YPkn8k+yqxpB02ClwfTTpSfArtH+8vjvOd933NR3JvgvgYBP9jDmO3C2n5x+k
         hZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGadR9327spg8s2oxwnbxAJL7ZUlrrXCtJC+P6y9stCXT9GkhLI5eWCi7pjzG3t3lRahEb+YIWgePZDyug64Kf@lists.infradead.org
X-Gm-Message-State: AOJu0YwwcOBondzq//JXOWt/DX+21pckZLueJLWvqJ+KWYkNjqEKqn3M
	IF5HVwUempctqp5nf8BKISBqUALjDhncA8cICdlk5/nEB4svRw+Lt8zGigeL1x9qdRzpSbFol6I
	I5HxygYaNnNMLPKftUCMIn7gPtjhYqg==
X-Google-Smtp-Source: AGHT+IGZ8YUla39b6Z83W7WgxBQC43Iqqksh+N1ptF+fhn6Q2OrPyzQYe93BSwde0qjKCGwbnFHIHl9SHzvH0QPzRfM=
X-Received: from plbjh6.prod.google.com ([2002:a17:903:3286:b0:290:b136:4f08])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d60d:b0:270:e595:a440 with SMTP id d9443c01a7336-290c9cd4b48mr299453355ad.25.1761252783163;
 Thu, 23 Oct 2025 13:53:03 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:43 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-2-willmcvicker@google.com>
Subject: [PATCH v5 1/7] ARM: make register_current_timer_delay() accessible
 after init
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_205740_735978_B8DE7CFD 
X-CRM114-Status: GOOD (  14.02  )
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

The function register_current_timer_delay() is called from the
exynos_mct clocksource driver at probe time. In the event that the
exynos_mct driver is probed deferred or the platform manually unbinds
and rebinds the driver we need this function available. So drop the
__init tag.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm/lib/delay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/lib/delay.c b/arch/arm/lib/delay.c
index b7fe84f68bf1..acfb87143f21 100644
--- a/arch/arm/lib/delay.c
+++ b/arch/arm/lib/delay.c
@@ -62,7 +62,7 @@ static void __timer_udelay(unsigned long usecs)
 	__timer_const_udelay(usecs * UDELAY_MULT);
 }
 
-void __init register_current_timer_delay(const struct delay_timer *timer)
+void register_current_timer_delay(const struct delay_timer *timer)
 {
 	u32 new_mult, new_shift;
 	u64 res;
-- 
2.51.1.821.gb6fe4d2222-goog



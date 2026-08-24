Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C513C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 03:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BFrsmmlSYHb7sUcLIy0ALhfjp7FP5iWgM32VwHTY2aM=; b=EVVdMH0LHntXlE0avhVQqPFtHN
	7NS3t/tz8IWR0PXmYJArTGmFzj0ynVj4nMbv83dOtAbf3rdK2lIXiQ87/mg/gVsMlu9PwFGYIqedk
	GOknzw43a56XT7AYR0memze/KNZMY7yZYCLsyYUQ4uIAZlrI22zKffF5ajfmmzNuCSQBgvdWMgQuh
	fjNhXkTMMX//TZ4f4NKGIlMBhzzm1jxKLzt0VWAqsMofw7OxRXUSU+VOhJvEBJqz3A8eA0BuR7OwR
	uvMi39BavjV9CVY+XLXQkMR6hAxnSLCILnxKsQQxM1PtGJjuK0w2H6KP70aUYIv1eujIzGVTWdKXe
	SI+BhD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLPI-0000000Frj8-0090;
	Mon, 24 Aug 2026 03:31:32 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLPF-0000000Fric-2Zv1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 03:31:30 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d032846c95so36092355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 20:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787542288; x=1788147088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFrsmmlSYHb7sUcLIy0ALhfjp7FP5iWgM32VwHTY2aM=;
        b=J4Q2uPJiQo8NQExSUW1cOdSCjcv/3filLlIXaTYMkE00tIi9dPLTT5gjjDkI4Jc0IA
         whrkJ3tHL59wqnEAxUh0472CFKXOuj0mj2rkOE5hjsrY6waW540YXzAbddlwvfpZYZ8R
         Ry1kezcWosYMP+9hihLxOIslYOU5KtH0p/DghIUvvCPVHi24mxocxkymhJHP22caNDYH
         Hv+wG/p4IazkirLirDfD5dEqjcq9l3Beo3WqJ81aXc2/zpYzdlINGJuhPKDNCYBcEb1C
         VWJXgCZp0Ym7d5kA6iIyReLmIXZyITW8kk7SYZjORqoPGt9BD7oziqgVk8yS+YE4RSJ3
         S67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787542288; x=1788147088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFrsmmlSYHb7sUcLIy0ALhfjp7FP5iWgM32VwHTY2aM=;
        b=fwO+SHuho05z0ZDfQkli5gO5zLib38bdIDIOdc0bqbW+n5as9SR7xTBh0UrV1b9WLO
         vgWQrl735OepKFIJ/aay1FZt9IDRF7GQgT7M8ebJp9k3VL4CdyDvPOLupI6CFK0tWNsr
         UaTG9W3cB6xNkTtFfgICdBwewTTutydYnIqJ435Hfl7zTGUsvsckm6op0PMMXAzHI/8d
         Tm0OdDC4fM+uQ2nRmemQ9sJUjtu9xQ0yIt6IBWBXCTApVh/9f8VD+iMJ4cKhl1HLvkfo
         yt2h7ykRTlTuXX4483YYpzZruHcj9k6QPXy1u4/Aj3gWAtDMCrZO4k3Z2F/TA6FGEIH1
         ng+w==
X-Gm-Message-State: AFuF++mj++AS5l9NNSoTW4eVWLRAkCq3OoNvdvlwF5aE97AMjJgzHXvo
	/KwoVuWUtF5LYRtuwaQwx1kZNBcUraJcbkD1OKq8prgHrBijEkQlzOgcEnu2f44sO7sSfg==
X-Gm-Gg: AR+sD13rfjvPAr8QOZpr9endooIGdXFshho/8NacKrou+XC5kTYjobq3popyl7FVbRe
	Ij0U2M5ym+3KiPuExb9Kd466t/dkIj79AYM7DNXBsqSHaVfGeYaNsHT2wov0QGu0FD6b3lD5n1o
	vTf5goRgJey8xQnMI+78yhxvxwUObcF5YotrUfHu+NdEGTdYRwUp/x7kRvNElUbodbhJCboYmkw
	dYMrgfn42OL33v0Fd7+cCwjfm2qr6CWxZmp3Dk4RrYjpdkL7oDHEk9FFA0s+BDYmXvDc8bY6N3b
	nm9j056OiAFBxnJy1mLQWIMG6INbZRi/cZrkDJrJIRtJNE+xrygMTt87NnHJNFk92/6e1DsMOtB
	b8l2bEO36qTdLMuvwjbPejcGwQseJgG9R2FcE999dgmSs6LKyt+7WDw2NI9sfBymJeOJz6Iq+Qd
	QypwP9KX7RdBTsQV/XzDPu9IgEpi4jIuNqhxGB3AfdAveMVsQ+ZwkN69Q1c9eK7iwnMVAqxUECY
	afd22SughFWE6+xkD8Jvw==
X-Received: by 2002:a17:903:354b:b0:2d3:2e86:647a with SMTP id d9443c01a7336-2d64af6f896mr448583275ad.5.1787542288096;
        Sun, 23 Aug 2026 20:31:28 -0700 (PDT)
Received: from Alone ([2407:1400:aa0f:29d8:c1b7:3f39:4ae0:ce0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923615asm21037150eec.29.2026.08.23.20.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 20:31:27 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	rafael@kernel.org,
	pavel@kernel.org,
	lenb@kernel.org,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] treewide: Fix typos in comments
Date: Mon, 24 Aug 2026 09:16:07 +0545
Message-ID: <20260824033107.347011-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_203129_651267_B2498691 
X-CRM114-Status: GOOD (  13.45  )
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

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 arch/arm/kernel/cpuidle.c      | 2 +-
 drivers/base/power/clock_ops.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/cpuidle.c b/arch/arm/kernel/cpuidle.c
index fba1f8bb0..784457ac7 100644
--- a/arch/arm/kernel/cpuidle.c
+++ b/arch/arm/kernel/cpuidle.c
@@ -79,7 +79,7 @@ static const struct cpuidle_ops *__init arm_cpuidle_get_ops(const char *method)
  * cpuidle_ops are tagged __initconst and will be unloaded after the init
  * process.
  *
- * Return 0 on sucess, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
+ * Return 0 on success, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
  * no cpuidle_ops is registered for the 'enable-method', or if either init or
  * suspend callback isn't defined.
  */
diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 59bb37e82..3b8ba2780 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -250,7 +250,7 @@ EXPORT_SYMBOL_GPL(pm_clk_add);
  *
  * Add the clock to the list of clocks used for the power management of @dev.
  * The power-management code will take control of the clock reference, so
- * callers should not call clk_put() on @clk after this function sucessfully
+ * callers should not call clk_put() on @clk after this function successfully
  * returned.
  */
 int pm_clk_add_clk(struct device *dev, struct clk *clk)
-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65BECD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wpy5I6qrcZoBL+aAYboFR4xjmZ4wLohsQTQs1EK7ZSs=; b=jhLoPKPnSTI+6SYGeK0tbnXBEs
	BdcOMhxtz3cwKYd79hfaHeXQCOSGo3zPq2IlQOTK1sgpkXKkAwFSVpbAinyqa+G0+fK6EtnlVGrIw
	a+o0hjLoKBvCrnWZg3laNbZYo1slzlR+VhsKdL1psxJkl3KiR9Tu6ONA5ZCx0CY0HhFuKXDiBYEin
	ps1ZgwgmyaXqE3YiIrd2kjbmDzj6B7rctje+DtFrUWvEFut8s//YtObmG6JZKIhaZ+g2rxObHFmO8
	Pzn1e6IaDl6vkiM4bsCgTzj/A2mbMpQUyzEXTDwNAqJ8abbPwkJ1SfVYR9TE/0PSrTGEXxpzXstL2
	ROpQHAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSeJ-00000002qXH-23Iw;
	Mon, 08 Jun 2026 05:35:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSeG-00000002qWV-2JlQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:35:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0bd02d97eso45349725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 22:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780896943; x=1781501743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wpy5I6qrcZoBL+aAYboFR4xjmZ4wLohsQTQs1EK7ZSs=;
        b=QXnAZHx44xo9fWeY0vt1UkBVcn2YG1H+qJabm3aV6r57iPFrNCu4dWzVLLvPROjRnc
         mbVsi342BH87B513Jrw1zmD+blVf3XIedENfptBFvV9FNHXeKDh0GfExjnReihZY5VFx
         phVCaUugPI3QyV4cHDV/5c5FbGi1RkA8Z+oly6vU5DEaPp8FB57JjjL+BXe39vPC6bX6
         mvjadozA7WMsONmK/6PsR1v7j8K4tIYO+z04bFd4d5+P/SfZ4cIe4+jo5Erw2KnMyQIF
         GR3x8RA6OZ6BfEAku/dX5/uY1o2gEIRXbAhyYVuTyDV6ST3OZS4MkWmJcxrXPtkbymfg
         rDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896943; x=1781501743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpy5I6qrcZoBL+aAYboFR4xjmZ4wLohsQTQs1EK7ZSs=;
        b=M3rNPDLdB/9F6lMm6KggGZ5z3dPh8xL0nz8GtVfwwgYYAxUuVCL8THH0/Glvfy36B9
         erqW7h6AOvzLL15u5Q48YUyLUeZero2f6GjYzMH/tEwQdQ0ZIKcjFL97S2AZDDHG0zNd
         jaEMARk4fzt0aNDX/Hub9CHgSPzZByRR1piO1kYcdd0F0YxVvscTU/w28a6xmy5P7egp
         AmFP0OrJzFw9hnsIfcozzbpwVnvZ1O2yEOMrOL3/ERxE1XoLUm80W09FXo1+XlCbYRIA
         nAvDZCov1IuYYEWDElMD6O9ccAEhh0gtOwQxYfWPQ+XSJ67REUssYE8HLBaN1St76V2K
         VxzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LTLB6l7P+qXOvJ2QlTml9jhhSp82XAEIEtlM52Ob/kdL/edR2Uaudx4jlfx5QSOmeTHwo0m1rKT2HwOXCJBvV@lists.infradead.org
X-Gm-Message-State: AOJu0YyVb/S1SEwVDEXEbQCkZPIGXLn7cWlTm3CHKbBf7aMgPcxtf348
	uv/l8hmnN1t6cBpohZgGFUBH2MNbd4MpGFxpY47ciRG3s5/bu3Tc2xq8
X-Gm-Gg: Acq92OHNCxrxzxepYWC7Zpa+BUPJZWigZRO42VwndZmI/GS4PW2/x6EIDJwK1QfhAjm
	vB6OMebbtIoBwB3ExjFuLSGfAIrZjI8dSf2RPU3DI/GENQ++0HGBCq0PdBtNrnKupbEYtLOFkWJ
	UPBZKq5fn9NdiBAL4KxqBzLog7bNson9s0WxCE+zROQ74MwQaxXfNJKSF0yxlQFL1sRA8EM04H2
	dvMdvClRS1okrSnJ3e3e3XF3L5dc0ui7tS+5btd9QcY7E/9mDyLDe9Y88lYeRNPgkQ3TVWrKpVr
	VrapUQzB+CDmHWa3lC1Hi7YzIasUc3tp8yz23JrMI4DOA3w2chBG1E5KIj895Bis+IVTIlydkXL
	LqmKXBZ9Hwy+smI1WxNkydCeMrY8hudD87qltJGSAOwWbdCOe0QieplNmHSd5iHbgniEOe0XFqt
	YXFz33q16ddPZw0q4QkghxMqIfYkAufQnRb4zig7knbgCB+NHsRuNX3F9QEStIp3ifNlBu2bQY7
	R6HAZy0TE+AeI3K775nuAin9QB0c/eOCMg9tpgBwpK67Q==
X-Received: by 2002:a05:6a21:4688:b0:3aa:c93b:625b with SMTP id adf61e73a8af0-3b4ccd77c1dmr16839353637.3.1780896943548;
        Sun, 07 Jun 2026 22:35:43 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm14526743a12.17.2026.06.07.22.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:35:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	asahi@lists.linux.dev (open list:ARM/APPLE MACHINE SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/APPLE MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] phy: apple: atc: remove stale kernel-doc for removed struct members
Date: Sun,  7 Jun 2026 22:35:25 -0700
Message-ID: <20260608053525.12354-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_223544_628065_EDB8AB9F 
X-CRM114-Status: UNSURE (   8.83  )
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

The @sw and @mux members were removed from struct apple_atcphy but their kernel-doc entries remained, causing kernel-doc warnings.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/apple/atc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index 4156fabad742..f09305dd76d1 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -585,8 +585,6 @@ struct atcphy_mode_configuration {
  * @phys.dp: DisplayPort PHY instance
  * @phy_provider: PHY provider instance
  * @rcdev: Reset controller device
- * @sw: Type-C switch instance
- * @mux: Type-C mux instance
  * @lock: Mutex for synchronizing register access across PHY, Type-C switch/mux and reset controller
  */
 struct apple_atcphy {
-- 
2.54.0



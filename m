Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773F6C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BWOyJj4WL65+67nVExJiDXzlxhh/gmgtVKSlDc8eU5Y=; b=cm0z6yFs7rFk/anH89wRgvTVBH
	qySFn6YE7MjuMxJDWI8R33WsnZvZ2LTPklSEfDaFJqiHj+YSTVAP6SIa3cyGHf7aFXami5/R+fjKK
	RjkWNzTlz7hRB3oaNnoQR/YVGhNXY97uJGdcj4t89jAXjidCi+gr8d2fSBKOoGgJ7DSl8aFtC9dBL
	r10U2DCLh5yPUd7/RKJSCBn36vk76Z3eJGURIStBzvOdM/9T2Xi/uKa48Ce3M+abkTqNOKdIC4KrL
	Ht2LvZmWBUfo/vdT+kIbFv0ctr7tcQ7Gdx///iJYVXS4yg7IRrkJ7xH/Qn0N9iIE6XbrnKj2zVgam
	SmPjcFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl9CI-00000004QJZ-0TYp;
	Sat, 18 Jul 2026 17:51:34 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl9CD-00000004QJB-2fj4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 17:51:31 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-81eaf3709b4so65048707b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 10:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784397088; x=1785001888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWOyJj4WL65+67nVExJiDXzlxhh/gmgtVKSlDc8eU5Y=;
        b=alrGvq7v0YuOuWRAnP/Q6uWS71uDInhZNsvwoRvOBBx4zuMzRMl9mOkLpDIGb8ljc8
         X/nbdKrw8XdqgRBBVaIN34Zd4lX3jdTVA2T4VuPASlW9wXXmp11rP3LGc5Dw3JiEMumy
         g6CGULNvLQp/CW6tlz66KVvkV3AJMF/x9LWY8JKwbKBqX5cqvEVqrP5HT17i+W4syCmk
         tzx2OiQ9rEkRgCknNK6rASIOW3j6jOQrJ+XZ75PWJB34DzB/yDa5F9JNQIXMsI7mvkrA
         6SCX6e90Y//CR25No6p5izrY5tDDJAoqxSjUvySlfjjtLRzOfC1O1lSuW9JQtUmFvx4I
         D4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784397088; x=1785001888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWOyJj4WL65+67nVExJiDXzlxhh/gmgtVKSlDc8eU5Y=;
        b=sk+tR09qK/hE8X6kNauszsehm+rouyyhRqCstznpJoDxfNK5c+0kVqkIw/ryVgqBX1
         wAzFM2d+7p9RozwMKvpUYYl4eRzo7Gwu0oU6LnDrjR+GmoAv27gYmw5FwQI/1k8Ab66F
         0Q2Lj2HsRZO13JvL8enxSyh7kxOuydzH9sAR8kv6sUAGV5icDfnBFzhTd9qFdCPybmn6
         bCxzCyOuidKx52x3mX6M4cCPEEsgixz4USuV/AnDjkmj+MR/68xvXkEf1oj0PC2InkkT
         r7UU9k+SEDgRpgTQzswu8r/F6CwP89D/GI+ptknW+Y506v+0QyfXvYcbhIkfFQ/pVRrs
         WBFg==
X-Gm-Message-State: AOJu0YyfpvY9vs7RaYY4aRKfI/Ak41hcLb1JgXBB6Ezq3IqLSsjWDD8v
	oFWTBQonqeA9DgJh1LOZWvZvigGHNhcOQmRZLOrC2/NMIJDtGEg2CKRNwu1apA==
X-Gm-Gg: AfdE7cmK163jMJTa1PGElyQoN1rMIHVnFgtvcw/g5DIyoBiXCkc7jrq3rB5LlEXrO4Z
	K2+LEDAMb0AAFcrUHlVfjolmtGySE+kueScUdJkcC5L7hN2hsxJr/BL4pWx39kGmXiWPntr84Op
	nCS/JK96T64O61Cu9pgjiof7bAXql5slURqlQbSCe8cmyDYhc+kSlkK5U98A8FKGhhlnj7Kubuy
	d7JmJbfIAQKMwkqPxTPAuRzim/B3elP9xn1dpGrP5jAOETfX1bXLUPuolQvfy2Txo0p9JqYa0s+
	5lk92mBWVCq7vyHur3DT8Ql4iDOnjiYhIgRjuETYZLqMhoRGrj/U8vk0V5RuQTT5z1VMHqSGC+j
	+0RmblMkyMyejeSyHJsKRfWA3aWVPbL3Q+f1wKWpxvXAHtrlT7gORvA/W3B4wbXGiDOuYkFLTGt
	4=
X-Received: by 2002:a53:cc4a:0:b0:667:8b90:2e55 with SMTP id 956f58d0204a3-6683bd63b80mr1264267d50.97.1784397087556;
        Sat, 18 Jul 2026 10:51:27 -0700 (PDT)
Received: from sleipnir ([2804:d45:3612:3b00:b74c:e115:7602:1640])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6683b8cd3aasm3878779d50.21.2026.07.18.10.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:51:27 -0700 (PDT)
From: Lincoln Wallace <locnnil0@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux@armlinux.org.uk,
	kees@kernel.org,
	will@kernel.org,
	linusw@kernel.org,
	f.fainelli@gmail.com,
	catalin.marinas@arm.com,
	joe@perches.com,
	linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	Lincoln Wallace <locnnil0@gmail.com>
Subject: [PATCH] ARM: Drop outdated links in comments
Date: Sat, 18 Jul 2026 14:51:14 -0300
Message-ID: <20260718175114.1404471-1-locnnil0@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_105129_686737_FCB9BA11 
X-CRM114-Status: GOOD (  12.07  )
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

From: Kees Cook <keescook@chromium.org>

As started by commit 05a5f51ca566 ("Documentation: Replace lkml.org links
with lore"), an effort was made to replace lkml.org links with lore to
better use a single source that's more likely to stay available long-term.
However, it seems these links don't offer much value here, so just
remove them entirely.

This is the arch/arm counterpart to commit 89d30b11507d ("arm64: Drop
outdated links in comments"). The arch/arm hunk was dropped from that
commit at the maintainer's request [1] and asked to be submitted
separately via the ARM patch system.

Cc: Joe Perches <joe@perches.com>
Suggested-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/lkml/20210211100213.GA29813@willie-the-truck/
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20211215191835.1420010-1-keescook@chromium.org [1]
Signed-off-by: Lincoln Wallace <locnnil0@gmail.com>
---
This resurrects Kees Cook's arch/arm hunk, split off from 89d30b11507d at
the maintainer's request; authorship and changelog are preserved, with my
SoB added as the one submitting it.
Note: checkpatch's PREFER_LORE_ARCHIVE warning fires on the removed
lkml.org line (the check matches $rawline with no added-line guard, so it
flags deletions too). Nothing to convert, the link is being removed.

 arch/arm/kernel/hibernate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/kernel/hibernate.c b/arch/arm/kernel/hibernate.c
index 231a76af09a0..5bec408478d2 100644
--- a/arch/arm/kernel/hibernate.c
+++ b/arch/arm/kernel/hibernate.c
@@ -7,10 +7,6 @@
  * Ubuntu project, hibernation support for mach-dove
  * Copyright (C) 2010 Nokia Corporation (Hiroshi Doyu)
  * Copyright (C) 2010 Texas Instruments, Inc. (Teerth Reddy et al.)
- *  https://lkml.org/lkml/2010/6/18/4
- *  https://lists.linux-foundation.org/pipermail/linux-pm/2010-June/027422.html
- *  https://patchwork.kernel.org/patch/96442/
- *
  * Copyright (C) 2006 Rafael J. Wysocki <rjw@sisk.pl>
  */
 
-- 
2.53.0



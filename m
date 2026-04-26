Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D0FFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 21:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfWSJE8B9SaG22zzXfiANFyGJZzvbBnZnEiz23tVhwg=; b=DVzlF1GNhP/36DsRpuSH6Emsms
	0RRVdL6k2i50OqCA4eiOryyoGrfdlyfHdlrZJ32TUTxC+mqdU/yhmnV+lxiVar0IGR9zgQ6O+zxBM
	xqdKm/Vr8SLyZlSGhXP8ujHsVX4GV+lGcxv6iEkDWWUxeTjZvdmpD016zd/dJfAmvImkzoDG6Qh3S
	N6+0yCPAtwjcPCZxYu6HEl5DfU9wS0KMy+dOvKMmxJXCXvdRV+dMMjRoWxPTmAxFArLoLItnAtHa7
	7OwxlAnfHElKZUDiO4zsFgCbhMWDcGrG/tPLGSKdrDac6VJi1e+Wvo3MVwqzYVXhgWu246+138pP1
	4RLiz3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6tz-0000000Fr97-2IjH;
	Sun, 26 Apr 2026 21:20:31 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6ty-0000000Fr8H-0dXV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 21:20:31 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2d96243c91fso15467060eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 14:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1777238429; x=1777843229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfWSJE8B9SaG22zzXfiANFyGJZzvbBnZnEiz23tVhwg=;
        b=PIq2TZ4E7JYBwfmlun8VXsGyNqMjy7vqrkhkYxUP/PCh2iIZYDYdP4ujcp1t8p0aew
         2Frzv7R8soM8ZBlqx2c43hAkO9FmSnaYonoX2iwMMBHXMJ8gxJCqFlkSMW8LYN+fg170
         9kTM9jKwam2JJnQSvBZW6D44uunm3zLBKED55wdWHZ5lgOEOYiRKYc3LT8YzF2uw4ebq
         NQg0FssDsAk7G8X2bXqrPINkmzdncvNLWJX8rWGTIj5ETPH5QqRWqjthBHo42DWFCQsp
         zx6Q8/516PhbRjzilq7FR3HBKBpWvyNXqZnBnyF9R4TSjvKHOyrNfTRLjp3efcaUYl7G
         J9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777238429; x=1777843229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UfWSJE8B9SaG22zzXfiANFyGJZzvbBnZnEiz23tVhwg=;
        b=BfBArkQ02X0IHcGyeOW1EBiZ8144UlBxz/XqDCssmpYr8GqPHxztMb22bA37axPYKg
         j9vXs5D2Czr7cClaqf88DdF8mGFjqwCgk1rKv42v4VHcAiNDB96AtxbmP7jhDTu10bNG
         gJL5s2DCmZI2P4gZhb5y/V/aaVK6lYFzBPEdU5p3GRmN60PWCo8FG9Ley+jyv4oMdDaV
         NvN4R8owRKh9Few2yWz/iCOwGTxJor6LoxjqTfZo8YjWpgztfj/XbyMzNsj0MzKB72/C
         ApkGGAguqNHyJkEro2ovgDHBD6VyAS6PAep4baV644FFcasrQq3qim+V0zFey9hhG9F0
         EGAg==
X-Forwarded-Encrypted: i=1; AFNElJ9NXEGh7aTC8Mcw0Dm5x/rANMIehY1c1cnqAtnCox1UoMaAfqqm35m3zDs+ixJ+Tw7aIX7Nx5WQ4Lozq3hFouOF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5HrrtB9b2xQSB2X7ATt8jvkxytC5linA27KH7hJ8csRfO3zxe
	WDqrHUFQ32dgEHtEG/Hq075f0VIydoUOL024n/4qUJf3zNOItIxCyCC10AjQfENRKoY=
X-Gm-Gg: AeBDieu0jLkmpqpkal7QcIh7sgyIqTVW8npiG5hT+ZWApKIjJ4Cw4+nXOOfJk9keeuB
	W1llbiY7nDQX5AxTATk9tHaWAL5ANgkufZNShc9imNE4Db/rbsX7eMHx3mafpvowDZrsZfGEF7j
	+rl7R7wrME93yQurmMvJFHPD2w72Z9XhHusrwpuSd7BLz5fa/Xex9SYCNkuptD3O/iTw585fecG
	dHKuMTQ1BI9i3lXiGdou3AR1SQDUci0hGceB6IWxpv7XP96g88cWQgf5EHBUcLvYDCvTQQwDy06
	kdIHheoTNgKTk6KpcNJW9zmC5SN+M4VKJreOiDGtKDbdw4uTwXvhwFv97uwB2jIj4jUNmxsBu5q
	jLVj51gEIRpW0Cbkno06pK7CNFr5KyL76MLDZcI4TD50o/InRmm+LB9AQnsdguBqkrEoJtVPeev
	8fxqpYgJOmXyLfmWtuBtY/4PS03SOHZ9M=
X-Received: by 2002:a05:7301:3d19:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-2e4875e15f2mr24952172eec.29.1777238429195;
        Sun, 26 Apr 2026 14:20:29 -0700 (PDT)
Received: from eileen ([38.10.153.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce0f5sm40799122eec.17.2026.04.26.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:20:28 -0700 (PDT)
From: Caio Morais <caiomorais@usp.br>
X-Google-Original-From: Caio Morais
To: andy@kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	michal.simek@amd.com,
	nuno.sa@analog.com
Cc: Caio Morais <caiomorais@usp.br>,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH 2/3] iio: buffer: industrialio-triggered-buffer: fix includes with IWYU
Date: Sun, 26 Apr 2026 18:18:01 -0300
Message-ID: <20260426211834.3318306-3-caiomorais@usp.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426211834.3318306-1-caiomorais@usp.br>
References: <20260426211834.3318306-1-caiomorais@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_142030_194874_AED6747B 
X-CRM114-Status: UNSURE (   8.74  )
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

From: Caio Morais <caiomorais@usp.br>

Signed-off-by: Caio Morais <caiomorais@usp.br>
---
 drivers/iio/buffer/industrialio-triggered-buffer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-triggered-buffer.c b/drivers/iio/buffer/industrialio-triggered-buffer.c
index 9bf75dee7..a91d439d7 100644
--- a/drivers/iio/buffer/industrialio-triggered-buffer.c
+++ b/drivers/iio/buffer/industrialio-triggered-buffer.c
@@ -4,9 +4,11 @@
  *  Author: Lars-Peter Clausen <lars@metafoo.de>
  */
 
-#include <linux/kernel.h>
-#include <linux/export.h>
+#include <linux/errno.h>
+#include <linux/linkage.h>
 #include <linux/module.h>
+#include <linux/stddef.h>
+
 #include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/buffer_impl.h>
-- 
2.54.0



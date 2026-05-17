Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB2FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 23:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V2iQw1u6kVkihwkgYC98LX6JznKiO0eseOk9oPE8OeA=; b=dJbVevfqNZ/L4EyrxEhxisYgs/
	0pKHOlyAxsvuP1ykmNoxQcqvNLQF83QJtyr6AjTGHxjrYuKFfiGHnbFW/f2fQgHx09/NtTuSLEN9L
	C+EhDzIbdc+YvbvQ7kT0c8h6orKHeq49gnXFWIoOwvqIs5U9If7Z+Y+RdLDMix7o1ZKwcVA72a3a4
	2OFCqBihrY1S9qMtMnxhb3rcE5yxBRoKgOD4TKf8Cd1yhbiL5Ox4P0XkUwA0jxuSzIjiqvQGffQHM
	Ckz8Rpy4C3NkCy012Z4aabkqahVBgEld8Gymr2C7AbLDiA3Cl1rY8+z+trF4RXQMJRa14nmFmsjRB
	qc8CWsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl8a-0000000Dh0N-4BJf;
	Sun, 17 May 2026 23:43:12 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOl8Y-0000000DgzY-1SkP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 23:43:11 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-1329fc4bf77so4000155c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 16:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061389; x=1779666189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2iQw1u6kVkihwkgYC98LX6JznKiO0eseOk9oPE8OeA=;
        b=ByBG2G6V5JdZMZFzFzJPXg0Z4NlIcH8EP1/apcYWrGJ+k+1+VNsImDY+I8l/OQjeTW
         Zc47V2nqRZEadIaRcZ3BZ15q0mF6FQlYtzaDd0VX36b+KIwbj12JFe5yqTUk188r/YuW
         aLrNAdksxO4sQD1fHfdg/2moun/0dr+04aAWTD4GZTnFTWmLPgzHQmMJCVAL3WDuyj6B
         3YzIsnvqZzUHn6v4OURZndKLTQACZOLX39xB/AbZLf4vGo9KJLjaZsA72rcTq8fW59U6
         m+BCIzIKQhHpJeAeYGQimlETfSPif2ydZioTe/+2Tfn6XB37FXVvE/GPq5PtqrmYZS9W
         10fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061389; x=1779666189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2iQw1u6kVkihwkgYC98LX6JznKiO0eseOk9oPE8OeA=;
        b=UyzYwQVJ4jSl84CVEOlrVsmC/iQEAcEUraFPbvJ2NxNsBJ6ZbjlLi9GrCNbkr9zY41
         W+0FfzZW+7Yku84s1Q2PNKqMAxZqdgpUsScVMyVGlt/pXYt3+bzSnnNbQBcA6yz7iIwz
         slzdyX8A0uOKz4HPYU5izI8WupXW+qrnc3QxlONW+5bd+Zd68J82OMwRuEGYNy8ikQR5
         c4f4PGdrB3MgEPWXuwT+ikThXJXt9OD6TOiNh7YJpfdsyWQ7FROmaKyPfNNS2p4GUIeK
         ARphYJ8Fk1/ut1bWkywERGeiBdG08NFlGxuJE+sk7I3BGDz4sWNUgMfdRhc0bpRlwAMi
         SGpA==
X-Gm-Message-State: AOJu0YwzBxU3KGC2Rtsv5+QSLhqrrV0z9dfKzMBHeBDD91srsHoM5rhR
	I35g9J7y7Cx6sFoPhdWG1/zP3Lh3E9MZORvvDYT6hHLccspD02e8zTFFwH9vpXISE4g=
X-Gm-Gg: Acq92OG0ZG0cYOMyWcM9YYrQCi5oWTVfzI6Z+j8kx6K34n27xujvo3VFaumgmyoCPT4
	Ppv9Pa24X9m9Lq4FM6dIj55Drrq2OMh2SZctYCiahIjiRYUfwVxf5WZcnHNxQCr+/72AIKNjRom
	nZ7qo27FYJlXU6cTu2G6s0ljotAwj+fObC81QxVkwF9Ed1jlZP6vBdPZ+zltCHnCfLBo8yNuIeD
	/7/+6dbJD6oeHBwjQCRL4dnV8vd0r8lrZzu+wUwvkj1jVzsjWb01kTzXK090sN+kbEFjeLjytjk
	4MiiYZ1m4nuF+S1E3nl8TY+zAjZxtZHAv4pTxiaucruQzcTWQONWcRT97/SBK6fune0FE7nzo7e
	odrhsi82BvFsNulG9jSc+qXA5/3Uxj6zXDbY9/x3/eWya27JLEY4qcOkdk/RlaSNUcCim3BCe33
	u3ZKNOMSUxQwcfFWcPtFs6w9aleGjoDo+jvchP4xJBzYez8RHjVM4t3kNsGI3JCIJ8bwWKjGKsL
	Hnsip6Ap+ekPiNAE8zwVEbBfABEze0Ayk+Q3c55RXqWaQC8bqKZX1q9U5GF004FwfnJVGPWHzx5
	vdWxeON/qsGOn+0Xqw==
X-Received: by 2002:a05:7300:ad30:b0:2e7:5737:8364 with SMTP id 5a478bee46e88-303984e17ffmr6297402eec.15.1779061389321;
        Sun, 17 May 2026 16:43:09 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302947e917dsm12417164eec.12.2026.05.17.16.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:43:09 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: move SA1100-specific ssp.h header into mach-sa1100
Date: Sun, 17 May 2026 16:42:50 -0700
Message-ID: <20260517234301.28255-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_164310_386175_0C09AB0D 
X-CRM114-Status: GOOD (  10.02  )
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

arch/arm/include/asm/hardware/ssp.h is specific to the SA1100 and
should not be in the global ARM include directory. Move it into
mach-sa1100 where it belongs.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mach-sa1100/jornada720_ssp.c                | 3 ++-
 arch/arm/mach-sa1100/ssp.c                           | 3 ++-
 arch/arm/{include/asm/hardware => mach-sa1100}/ssp.h | 0
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename arch/arm/{include/asm/hardware => mach-sa1100}/ssp.h (100%)

diff --git a/arch/arm/mach-sa1100/jornada720_ssp.c b/arch/arm/mach-sa1100/jornada720_ssp.c
index d94810217095..ff986e93426d 100644
--- a/arch/arm/mach-sa1100/jornada720_ssp.c
+++ b/arch/arm/mach-sa1100/jornada720_ssp.c
@@ -19,7 +19,8 @@
 
 #include <mach/hardware.h>
 #include <mach/jornada720.h>
-#include <asm/hardware/ssp.h>
+
+#include "ssp.h"
 
 static DEFINE_SPINLOCK(jornada_ssp_lock);
 static unsigned long jornada_ssp_flags;
diff --git a/arch/arm/mach-sa1100/ssp.c b/arch/arm/mach-sa1100/ssp.c
index 613fd767afcf..114c5da4d210 100644
--- a/arch/arm/mach-sa1100/ssp.c
+++ b/arch/arm/mach-sa1100/ssp.c
@@ -18,7 +18,8 @@
 
 #include <mach/hardware.h>
 #include <mach/irqs.h>
-#include <asm/hardware/ssp.h>
+
+#include "ssp.h"
 
 #define TIMEOUT 100000
 
diff --git a/arch/arm/include/asm/hardware/ssp.h b/arch/arm/mach-sa1100/ssp.h
similarity index 100%
rename from arch/arm/include/asm/hardware/ssp.h
rename to arch/arm/mach-sa1100/ssp.h
-- 
2.43.0



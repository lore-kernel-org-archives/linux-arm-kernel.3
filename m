Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61557CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 02:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hNObPlbThHU99XJG4ZZ7Fvsqk9E+RcC2AigbH5ePa5Y=; b=r+x9g9FpJMxFztHDzasRYo7zzC
	8fEGG8F4X9EwQBta1F1T3ocyt511j1gL5jfGm7gbrCRh6xnXjasser+l55Pi8Q/AdmTW3WmWrLi/P
	SwWdGBvF2HMmimD2Ucka1ZZl+JERt+anXXyDKC7uS2JOYy0qFXG46Aak7E3Up4UTiJ+wQSVaS0/1E
	WbB7VosGISp9Ns6D+WdoLAIA1VCkaJ0z4EicXOU7GGQnAznKnESur6K7SGl0FlybdpaN8Re5aIumt
	WjxSZmyX/Jjo6/qWLN8JsTLoZmnse06Lpr3rTK6FabPCAnucKFXJP9j70NYoE3XapRIQ9acMp5GyU
	abetPajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wORdz-0000000BxUL-32Yz;
	Sun, 17 May 2026 02:54:19 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wORdw-0000000BxTv-2q11
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 02:54:17 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-12c19d23b19so1467360c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 19:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778986456; x=1779591256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hNObPlbThHU99XJG4ZZ7Fvsqk9E+RcC2AigbH5ePa5Y=;
        b=TmSKfw1wNQz6R60cI461YWhUA5WzxXMqoUEzCo3VAhEdJO0iG6WffFcq9l8TWRs2VT
         VBXuWABzDu+E/R6vNm7Oc0XdyyRq4RFv7bJ4Ihx/wGKEuCLTThI+aRqy+a/2FybYrLC+
         O3E3ib2Md2vu6SBEQ/7QnTmhWAr0Zxkcr72gjQtETo0oZP0PMSBBHeMWqlYL8/klyM7k
         AQrTdalOxFrP5TJ2d/Ld1CT1coPppxfgKR0jJ3cnJKmTzac7A3Y7KZluCTZtOk0YMyT4
         5iZOLZK6Jadmug87TXQ+YhvEPjZndUyKEOb1XsdcX8mRlpFrrkkUNOpDyTDajvkRNZ9V
         qFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778986456; x=1779591256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNObPlbThHU99XJG4ZZ7Fvsqk9E+RcC2AigbH5ePa5Y=;
        b=iGtlrCQt7Ki8twVRCALRsDYCnRrtJNmq9WJr0+sYD1UznTEv7ETiBm3WxlOb+kwQCn
         excelEX2MMuUoFkQcX+DrXw5Bf3ExfpFw4B4ucDlZU6gvAcvxXf99jnz2UNOUuTQIFX3
         3BAQVyi3Iw7ZPuBET4c2agzlaEmnueLTxt9Q9Kbb0jF5clc111FcYzFFTIP1S5/c2zMo
         PLmkFh9r8GTyHa+tujIr8nhh46Bi/Q/SqwbGabqZeNZfrXkabS6bQvAyzFNExEy53BQB
         lHwu2ooP2YGGzySK2cBuY7c80n5lmZb1zZ8m+9vtwv9/NQrg1Z39LK0smmgbGHQvGBPz
         8HEg==
X-Gm-Message-State: AOJu0YwAuWKv61bcl52ut0i/Nyt4w6WzJCiZBE1hUvrMj5mpOeNuYpfQ
	sL2M283WBv6y+nT69IxaY0oSplxh1O2dufEsPzoZg4tdb8r8jKMLk04rHXMyfLJ7VSQ=
X-Gm-Gg: Acq92OG33OjflOZBRYKV//HmwfxwPXjjRCjqGK2fsntZ5HkfanA+NcVTsdx5qKFQTLQ
	ZsAc2wJJKRcWSWmXHtG/ETyiCKRC3GT9cxe94wunWxxIzRHsrQ7J0cTdj+mJrDNnbo2Cf97VML6
	IR5PX6OBnnQQIyuujyk8GZod9EHhiPj7QtYyQEpDhSXnab0srhbvF51X3ctetVjxM8sVn/pe0eY
	VDIiGV/F1FAtwLwZy3LDurbO28J9vREp/hrwY3IvnnJrD0pntyWBCGN+tko8FdD3YHmLRoQ4wYb
	Fus5+O32BbJFTY4X6KmoIE09DFzOy6Ca+DU+2YfgSvR48hwGU4BeXKFN5lFqd62SJoSUErvoU+C
	iaLSzXHNQjNDCEcK0kbJ8qdZq6xlzB1CXWUuU34PDWSL77sXwNB47tuQKlYDa89zLMiXT+gIWSr
	6RcNqkcWWppYwmfAyzM7UvBmQWNAhmqOfGz89n7UcUpNo/ebJNvNm15TRdvcHwDnAjdtakb5PjA
	bQuMobW/shdQXRN/3rcWp/7HJO5GucsKdTl5qIT2vx0WpqadcvJ9qn+30Jtgo6NeECbzTrX6Q7Q
	w47vjGNEVztwWeoq/w==
X-Received: by 2002:a05:7022:6882:b0:12d:d972:b969 with SMTP id a92af1059eb24-135047412cemr4364091c88.24.1778986455598;
        Sat, 16 May 2026 19:54:15 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdce9fasm13346039c88.4.2026.05.16.19.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 19:54:15 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] ARM64: remove unnecessary architecture-specific <asm/device.h>
Date: Sat, 16 May 2026 19:53:42 -0700
Message-ID: <20260517025348.96906-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_195416_745321_D2819126 
X-CRM114-Status: UNSURE (   8.31  )
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

arch/arm64/include/asm/device.h is identical to
include/asm-generic/device.h, and therefore the ARM64-specific version
is unnecessary. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm64/include/asm/device.h | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 arch/arm64/include/asm/device.h

diff --git a/arch/arm64/include/asm/device.h b/arch/arm64/include/asm/device.h
deleted file mode 100644
index 996498751318..000000000000
--- a/arch/arm64/include/asm/device.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2012 ARM Ltd.
- */
-#ifndef __ASM_DEVICE_H
-#define __ASM_DEVICE_H
-
-struct dev_archdata {
-};
-
-struct pdev_archdata {
-};
-
-#endif
-- 
2.43.0



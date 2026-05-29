Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122ABCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EyPAfNS2y6WG0YPoe21sR6PBixrZIgpxdj99NPdSN8=; b=3d3AkFJFNj3qOk1qnwoU9kfbkD
	HkobjrHqqkcZLkgHfh/2TUfKKukbnM5c/+SQshiV4JiOoZK135IGk4KiU7OnMdUB6GTWxMgdnZiWV
	f97nzuDK+POgzI5BeZdqc8ywtuRY8YFz8pL2Ehjhzwrea3x4cVk+hdp2zRg2e8jzgeFi22mHbse8g
	YR0arFFqoEOf/oeI4Y16aVCmPgYBRDKjfsA9ceD0fcuNVKzpV8u6Cziw++DawBCL5xczuyts5xExS
	8zJYcgkFSwbRFUtQI7KBHeOV+CmLPHajfokwvcb67FwoCbawe4A2PAdlHeZIrogq9QfsqzRzGPdMS
	pFRjyrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjQ-00000007bsu-3Gjh;
	Fri, 29 May 2026 15:02:40 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjL-00000007bkF-1Qfs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:37 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-680308c6c62so12032658a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066953; x=1780671753; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1EyPAfNS2y6WG0YPoe21sR6PBixrZIgpxdj99NPdSN8=;
        b=kxZ1MbtmAbJVnzAhittWRJpDgZki7ji3ziYdhdXSaM8Bz9tNHjtSOdpcwc1BpgdDAy
         fc3h+l7DsHVkw2v4vM/g9WfpySC/YCyDsrXMlS2ohd0RSk/irCxiUhXGLTRbcn5M2K2W
         D9xF583upn1UGfLVPsD1iQBWXnEJ65euLOLpMYejsC/oPr1VtoqSH9vxxKpT+7C8Bcjl
         jErfok9GU2FcmL+nUj/azNtAQlP3dLZyoDBjFSkmwzWS3bEQuAKyeH7a4eHDd6pmsNvs
         LtBZ89Qeia5oXFtfPkFuUozxQ65A6/DuXzxtbiO/nWgRWxgSD2xwCqpAn+9JKXAWQajA
         JmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066953; x=1780671753;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1EyPAfNS2y6WG0YPoe21sR6PBixrZIgpxdj99NPdSN8=;
        b=l5qyX0MBZlO7Ch8+tKgBhVDSqucoxk7vGv1nTJqFW9TY7wgXegIdT0nudq/2RMiemH
         kV0yJRdqttssKPNbKB5nYU4qBi+m2tgaXASvxYDTxeSCm8QO9CG1O6Zfi1c+s4DHc8Lr
         3QZgGYAZ2XieTzOLI08TAFx/Os+3z/0o2fgzBPl69qrOhPLRQtMRpJ0TH3ShGMHqXj59
         W5FqUJunuEXmFk9LHUBFI8y/1WlaiIvljZC2oqExQlyQXMcipFf6LXNLozevlMHqNoQ4
         o88r//KPD4CVHvp4XHiJtJ8Xie398QUsNNM1KfI3mkN71GzQAyKTnXfe1DroKUX+N/91
         Q+nw==
X-Gm-Message-State: AOJu0Yx2pgn9FQh+tBRS+0qHKz55ppRdL6nH1kkjEeWw5sOBh6gY7xaj
	iNh7+SJxRssUdT5ozuzVFGEMOD8glQP5Bz+sN/rY0OTDMfPUmnZ+XC5ZDyZrPQOOZFzDsHLYh+U
	39uLJR+g0cui3bj3BuZEjt8Ltv1n0YxQI5N15LUyucHNNIPJPa5Mjt3VJKOQ7AFCw//Uzmi3RnG
	lGmug2MvVw+KcN//itR6W/dHXqfxZsLpr846nciiBidQg9
X-Received: from edpg3.prod.google.com ([2002:aa7:d1c3:0:b0:68b:f715:5345])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:a29b:10b0:683:be46:c20c
 with SMTP id 4fb4d7f45d1cf-68c8a65763dmr15813a12.16.1780066952419; Fri, 29
 May 2026 08:02:32 -0700 (PDT)
Date: Fri, 29 May 2026 17:02:03 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322; i=ardb@kernel.org;
 h=from:subject; bh=4saoJOhT3cEc7dpWXJZksxFCf7gWJDz5CDZcsy0RHE0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVe4Vpn2a3EuL7z5c9yPshq/FTf8NSmKzXz68s33ZB
 ld1mYh7HaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAibDIM/2u5Yv7kFfP5v2Ww
 OfqOx3NBpOKey7t5vhR6LI5Y9SY78z3D/5SO1Jh354yPPvIQfsjEWFAfIL3vxawn2VI8ya8XJ21 dxwwA
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-29-ardb+git@google.com>
Subject: [PATCH v7 12/15] sh: Drop cache flush of the zero page at boot
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080235_397471_A77F04DA 
X-CRM114-Status: GOOD (  10.16  )
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

From: Ard Biesheuvel <ardb@kernel.org>

SuperH performs cache maintenance on the zero page during boot,
presumably because before commit

  6215d9f4470f ("arch, mm: consolidate empty_zero_page")

the zero page did double duty as a boot params region, and was cleared
separately, as it was not part of BSS. The memset() in question was
dropped by that commit, but the __flush_wback_region() call remained.

As empty_zero_page[] has been moved to BSS, it can be treated as any
other BSS memory, and so the cache flush can be dropped.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/sh/mm/init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index 4e40d5e96be9..110308bdef01 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -331,9 +331,6 @@ void __init mem_init(void)
 	/* Set this up early, so we can take care of the zero page */
 	cpu_cache_init();
 
-	/* clear the zero-page */
-	__flush_wback_region(empty_zero_page, PAGE_SIZE);
-
 	vsyscall_init();
 
 	pr_info("virtual kernel memory layout:\n"
-- 
2.54.0.823.g6e5bcc1fc9-goog



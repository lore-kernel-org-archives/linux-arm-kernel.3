Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16049CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9g+ayt4FM2fztSLOAfcyGb2gFshK+qygOJzTnKa0+m8=; b=R3kCczC4k7PHZ9sCiAsE3Iba9M
	Mt+RS1ZedIK3nQDjILOC1fd1YLctG7rrrf6JIdWrAy7rDj53zeXIEoTsY1d1KVJfBVugz6MHIDFn+
	25rYC/9BSJxj9MnQck9LWESDpkHGkKmmriDTTrWILd7bViMnxo0VYuLjvEKZmrVWvc3mb0loNyS96
	ETDRYniGeTGrwpQkWVkM4DkVSfRlXYBo165XZHA6JOHFkAT70C0V46Dgsysm+Yb/7xOM9+xWKCjaX
	OtoLft1WhxRXbonjXORyZz0pd71gYC9T55vOc2lR1ziF4gilOCW7xLNgFml4s0SMxUlTtJcWARBAk
	XTV+7Z3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuW-0000000H4PQ-3cXY;
	Thu, 18 Sep 2025 10:30:44 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuQ-0000000H4Jt-0OTO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:30:39 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45de27bf706so4320385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191435; x=1758796235; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9g+ayt4FM2fztSLOAfcyGb2gFshK+qygOJzTnKa0+m8=;
        b=WLHnmNS+ZhhDCqX/n/lELINtwSQn1wuaQmpbmZ+jQIPmiQtd1DkpiLsRHwwLio1C7I
         Y0K/AIs9w0y5qWpBismZagx8MyyXyud5Zjh8AdbYSMQ6tFgrojFDpWhBBuAISfjsFt6C
         gT81cNfpkrGa/ZXWmh8tAvB0HCz79Y0pX86w7RmhWC9puP4qEdS/oFw9pOfq3wtpqp0k
         y6yPehFejoIPq7YGTXjxADWJThDoQJvIDzm4DtM7I5ec5oP12engAaUGq7cPeEryvs9O
         GG1Jaif1IChvk8Cxd+pVjkpu4DU2+T8bhFHTgP7i3dl5ucHtd0pDVPs/TPSlizgwLwhy
         hiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191435; x=1758796235;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9g+ayt4FM2fztSLOAfcyGb2gFshK+qygOJzTnKa0+m8=;
        b=C+mk6FaHLvX09c9VHHIKnrcsnCpxuWg44dioS5QwGBcprizPVKQpJHAQdqVRORLOGG
         DuS+PLA40OZyUhyo7/cWF8Bwm2HgttKBLLo/dNr4mw7StqA0cI9/ndgZIuBZULJBVKQA
         Vt+GsVCQEDT3+ZbWk1u9Ds38MOJ9o2P2eUjMyrkGlAlS1igtC3AlELWxW3yeKf5rAx4b
         5wPr+S6Yw69DJH0XSe3NphPfMkhtHSGHkxfzo/h6BgJxKW2VXpwZ31ndHvgvXYhB/IYz
         c3JQ7C7Ls+Xc+QqcO1Zpsuh+CDRQonnB4m09WLw9hrGFdbH8B3I7KxHjAoxCdclh7BYs
         27nA==
X-Forwarded-Encrypted: i=1; AJvYcCVDCf1+6Fr313TyrVYgoNTyN5+D6tRLehs+A4Xd7FK3rIVTvOhlCglLiCIiM2yT2ib/2agS+wVmt8hBzydy4umx@lists.infradead.org
X-Gm-Message-State: AOJu0YySyaWYSjPKR78X44E0Cjdv69JBGTOFOmuR9x6FuWXD9twWQoaR
	ugEcKkDbn5peC8F5lq4/G/BMe9KpmQpKHB9VZ9XLjyFOGERosddiLy4l59iMr21OX/G5m1cGng=
	=
X-Google-Smtp-Source: AGHT+IHLme5GiJqIwrRwEMO5+ZWXnbB3UysoUpD5npyfKiKL033RbmiEockBVOaN3XQJRx9xa79Wam2T
X-Received: from wmbeq8.prod.google.com ([2002:a05:600c:8488:b0:45d:d39b:53ca])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d05:b0:459:db7b:988e
 with SMTP id 5b1f17b1804b1-46202a0e68dmr48837855e9.13.1758191435539; Thu, 18
 Sep 2025 03:30:35 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:30:12 +0200
In-Reply-To: <20250918103010.2973462-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=ardb@kernel.org;
 h=from:subject; bh=6f4GfQJsdA/kppXTxBZ4Rl0+1i1W3t0MYvIV3huOmLg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0fVOTx8nmnjWPnBfWRlyx2Nust7U+6NwL8w/u6QyND
 RPLOTw7SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwERqTBgZluiZM7wIMHV4y6zk
 ptEotHLrMlbGvhem5399bg39UWz4i+F/seOk8zl9+Tn7j2ns0a9iejh1HUdq+LoVum3H9upcd1b gBQA=
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918103010.2973462-11-ardb+git@google.com>
Subject: [PATCH v3 1/8] efi: Add missing static initializer for efi_mm::cpus_allowed_lock
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033038_137984_2349FA99 
X-CRM114-Status: GOOD (  11.42  )
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

Initialize the cpus_allowed_lock struct member of efi_mm.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/efi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 1ce428e2ac8a..fc407d891348 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -74,6 +74,9 @@ struct mm_struct efi_mm = {
 	.page_table_lock	= __SPIN_LOCK_UNLOCKED(efi_mm.page_table_lock),
 	.mmlist			= LIST_HEAD_INIT(efi_mm.mmlist),
 	.cpu_bitmap		= { [BITS_TO_LONGS(NR_CPUS)] = 0},
+#ifdef CONFIG_SCHED_MM_CID
+	.cpus_allowed_lock	= __RAW_SPIN_LOCK_UNLOCKED(efi_mm.cpus_allowed_lock),
+#endif
 };
 
 struct workqueue_struct *efi_rts_wq;
-- 
2.51.0.384.g4c02a37b29-goog



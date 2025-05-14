Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C09BC5479B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3HyzwFpqI96MKN6rPIIRpRYJw2Hi2fE7csbcA6ZBUg=; b=dPw1ySXzeJMtapLWyulnXqCtkO
	IIS0XNYWE1V3uOVPAymqnRxsPQtwCxcTNAV2Y0xuTOZZDueAIEgVU4FtC7uJJDC/WYoZE7yTLytrI
	b0eu0rjxvDElv3UbBeuNQNweUaIKtu/I0/NrcpasNjpDDPfjUWhe0TMy2sTF6+RH2b56wI5gUctu9
	S9nX4OtgxU6qaUEvRq077N0cDRpDSkulSxaHR38UdJkS2101xQi9YGuteShfPC1Pg3EQVxKhaju5S
	RzrkIDVQPnEEGjWYY63T6Ro33XeJ4kBFj8WA9M4rwPtPv5hq6MBlkqhpJgDLiGF2j91Elf75PnCtb
	2GT2/9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvO-0000000G1vS-0Ghc;
	Wed, 14 May 2025 18:33:50 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFG99-0000000Ft0L-1DwG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 17:44:00 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5fc348a53f5so80702a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 10:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747244637; x=1747849437; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3HyzwFpqI96MKN6rPIIRpRYJw2Hi2fE7csbcA6ZBUg=;
        b=iSBGAC5NRWjXLZWSvMpqXFcxuAhjhUq/LfN2KtsDGYwHrLYNWtS/fzrFdACtXI9m0a
         cOw63Mo6iB+RFAz3v7t6979CbyanMKhIsMvHXf5PYoZR7jGsnSf2w31POnrNU5A74r+C
         85BLCrpgi4UkJM83rCT6LmCMSgL+5x93VmuOhnlcjYDA30UviTT2vzpqhZOfbl4Nj6ZN
         LOgwCuXjIbyflmV30R7B62B1GPr1kM4of2cgLdijAg8UXRHcUCo1Ez/biBOT88GeVJm6
         OyEt6UHT/qxuA3nH8vepZheEC8xchm4sziqDnjkhYmjCNWhwRCL4Ug+0d/W6lMLnDbUU
         bPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244637; x=1747849437;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3HyzwFpqI96MKN6rPIIRpRYJw2Hi2fE7csbcA6ZBUg=;
        b=wKLjnMaxxqk5FOVabfNE8bQ6RNvUMWYopsU7ES6sURk7pyr3bJCcOUWf40p0sUxJtH
         3dG7KQuYN/BbbetKK+roHwc4PhpESdsA6n8HDDvPVR6N4IuTiQxODW10fmhsSnMtLnme
         U6RWbDJHaSAddeLfOQAXc9SvErZbhe+UpxwoNhcVzf2+bmuAI7Lar479rNW2w5Fgm46q
         ZHMH/mSVVCXxnAITfmjXm00bVguvD6uW2F3LjyDqiKgRQODI7v3LxC124/BlS5HBjubX
         c0xcS0sntyJolyOZo2A7gw8L978uDX3xEE1YeZraQa85LQ9H7XUjPetAW2GHLavEqmkX
         dK+w==
X-Forwarded-Encrypted: i=1; AJvYcCVDCUSoP2fALG8F9pkWA0Dtk/U3S8WWvOLuEz3Zmk92b2ZZvgeCykApS4io6daOMr3BhSftuQ9tT7C9cGKulPAE@lists.infradead.org
X-Gm-Message-State: AOJu0YzpA/hc+95d12Kuv/2MujJr3RfV3Opd3oDdFt78CL4c84agstqr
	YouKKZuLhpu0Vo7/UW53c55pyxOpABqhim94FvHqu3l95nFkqieTVqMbQZEnb7Ev6Pv8iQ==
X-Google-Smtp-Source: AGHT+IFMiOIHcOTbuiXUZt5aRX5V8FD38VCujID8sYnl6g5WCQk844aGLumnl4jvPnBScsY9NLpomgSv
X-Received: from edr22.prod.google.com ([2002:a05:6402:44d6:b0:5fc:8eaa:6880])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1eca:b0:5fa:f7ed:f19c
 with SMTP id 4fb4d7f45d1cf-5ff9889159cmr3446782a12.4.1747244637109; Wed, 14
 May 2025 10:43:57 -0700 (PDT)
Date: Wed, 14 May 2025 19:43:41 +0200
In-Reply-To: <20250514174339.1834871-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250514174339.1834871-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=ardb@kernel.org;
 h=from:subject; bh=Uiag6eY4kkyJQ9LOjYS9SFHapP2JX/63rkWG9Swk9rg=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPlWsB25Y3CTRL3p7X+7vm8bf2FpxlxIpNnHp0k0Pe+9
 z1PjvKpjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARuWWMDB9TrRZWXE++3T1d
 bb8st+a0ub6btS/EH4x80K4aeOHV7UmMDAdPP5o2qVGqVFrj3exdWYfn329vd/XQllvXP/OacVb TT0YA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514174339.1834871-10-ardb+git@google.com>
Subject: [RFC PATCH 1/7] efi: Add missing static initializer for efi_mm::cpus_allowed_lock
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_104359_328001_5C3850CE 
X-CRM114-Status: GOOD (  10.60  )
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
index 7309394b8fc9..59a56661937c 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -73,6 +73,9 @@ struct mm_struct efi_mm = {
 	.page_table_lock	= __SPIN_LOCK_UNLOCKED(efi_mm.page_table_lock),
 	.mmlist			= LIST_HEAD_INIT(efi_mm.mmlist),
 	.cpu_bitmap		= { [BITS_TO_LONGS(NR_CPUS)] = 0},
+#ifdef CONFIG_SCHED_MM_CID
+	.cpus_allowed_lock	= __RAW_SPIN_LOCK_UNLOCKED(efi_mm.cpus_allowed_lock),
+#endif
 };
 
 struct workqueue_struct *efi_rts_wq;
-- 
2.49.0.1101.gccaa498523-goog



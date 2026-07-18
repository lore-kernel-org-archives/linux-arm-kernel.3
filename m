Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A559BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dQ/ZbJiG58lt3l1hFxbH4cjbHgCyL2NHVFk05rzoPBE=; b=QHpRbgouXIKFdL2qs9+lVXqf3H
	GGdagfeFsG1+L4y1NAzjMSBsnVuJwwoHzErdX4rdy9fSrXl5wfMJaZZD6n7kjIGbazODbFsOlSBvV
	a0S3I75DuW3exJXZLQgMslJSrrdkeYvfnzGElHlna8JQP64dhI+jgBGmUjKPjcHemAKMGvZ5KkOHb
	+Bkp7bAgCdRYmxKggoKqIsSPNHITkYeVx6f16BigEx22Ks/p8zVwfakhcgvNuB5uzyGPdiz8SO9hv
	JtNp4V74UsdFU27r3wbqRzWqj00r37Z0W9iFq8a9Cmpyy/Lt3abYc5RB7HAzsimTuBvCH0z9k/3At
	WixVq47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8rm-00000004Pfe-3Nrp;
	Sat, 18 Jul 2026 17:30:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8rg-00000004PfD-27n8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 17:30:20 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so6768221a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 10:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1784395814; x=1785000614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dQ/ZbJiG58lt3l1hFxbH4cjbHgCyL2NHVFk05rzoPBE=;
        b=jhipnRogdSFG2QhlVMv66oMSpW7RwQclO6XJ7dNm3rnWTmQuFA1ijGC7fveeo0xFl8
         UrrwwMUuwUuBgbTrE5DzkBU8AXkF0zhLRsAQqKSToTsAKlfvn/Ctsei+AVHHEyi1uI50
         mhFdJVoFY3BhAIqVi9MGwS17CwFedUh1cyVW9fEyGKkB843oAnS3d4EhRaAePWRvrgYi
         w/dD7Pu1cP0EpzbPVs9bPBxADQrxscf5BO+NcO+aCAe7eO0shiLQY2MAYGZjYzcbKkSg
         MP2yjbbEtX0wAcmoebuwBSQeJEyibJDXqx2chRI1rVyLCMHjDVDFe1BprKOZL+TJ4vl2
         vPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784395814; x=1785000614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQ/ZbJiG58lt3l1hFxbH4cjbHgCyL2NHVFk05rzoPBE=;
        b=p9fCSHbowdoGYkoV9qiEQmq3UrWu7Hp4zIBka6/QupWDi3gSUQUh3UuBRN3VuASaRU
         Z0m4+4yYptUmVhapkvvfRNRgBs//ZrXobSkM0M0wZQFQt2do4r+Ox8AMZm/l8T/lLXNa
         apseOM5ZioYaDUTktbc+uPZGdq1NVc+52fTFki0/sTeIq2mWYj8/pE/FYrdEGjm1LWpl
         1o9MiLz6w+YKpsUG97jF29l4ofa4r7/xLQdm2c9KMHXLjcu3JkDiGADBQApBzTUqgO/9
         XlzLSgw1XtyfcZCbDuNViFyooEn6CZFhbUt8Jvm0GbbZI4AXti8phvtqpC9IsXcgESMC
         /4Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rop6IOYm4gZ9QKNBmiQzB0kCrxAQ5kiQ6KD39k1JeFdPxPScmqQ6LVba5JBYUrLIb6tHMXCIV8dkptyr9di5bJi@lists.infradead.org
X-Gm-Message-State: AOJu0YyuKPag+aNyWd5TJdDWpVvXPQDJkQawY7p08a17BRTmI2nBzhG8
	csrlcYL1N3x8JWke3NHz0SQngbrp3KOnWR7GSmTxUNjdiEX6iC5D9Hpa0dW/C81fjQI=
X-Gm-Gg: AfdE7ckS0ZwvxEmM2aFTzRkwUdweMUGmiPaLBUkuzbWSRyOse2iwfiv4IovKsHdlz3X
	BsGInAc4qmKQx07iW0qYZvXDge5+klYoRC+uhcGY+RJesy3fMjDhnRXSlSICTJBQpqGa2LzIL/a
	yklvk97FXZCMrgxcHAV7gwp2jVjGD9ZVE3b23RU0ZKTQoJFxysdIvk4E3W5Pma2akywEZLiNDuU
	wkENUayCtGGh/DmSzCjcfuTJRlTi/BQTzwlRqdPFRSrnLbFPBEFvQoXKrWjIrSP3V1o1ezGCDkp
	B2tB7b0yrZMTnQQuQmVG7XxB+xIcJOprS3Ek9P0KRbTLhB3O2j5VBIqZk/bOoD9w/gAQYgmiF+3
	j0Eh0w0bwOyxcZO67FN6SYQFVsv3F2GNv/iB2c4F+q7JN0MNPyiPYqSzbfYj6cOFXUKCgG+hS
X-Received: by 2002:a17:90b:1b47:b0:38e:e9b:ffa7 with SMTP id 98e67ed59e1d1-38e4b57933amr8720348a91.28.1784395814201;
        Sat, 18 Jul 2026 10:30:14 -0700 (PDT)
Received: from localhost ([2601:647:4000:e427:98c1:f5b9:6902:3c66])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-31429fdcb09sm22720004eec.9.2026.07.18.10.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 10:30:13 -0700 (PDT)
From: Peter Collingbourne <peter@pcc.me.uk>
To: Will Deacon <will@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ian Rogers <irogers@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexander Sverdlin <alex@sverdlin.org>,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>,
	Chuck Lever <cel@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Grosjean?= <s.grosjean@peak-system.fr>,
	Eugen Hristev <ehristev@kernel.org>,
	Peter Collingbourne <peter@pcc.me.uk>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64, mailmap: update email address for Peter Collingbourne
Date: Sat, 18 Jul 2026 10:29:23 -0700
Message-ID: <20260718172923.8297-1-peter@pcc.me.uk>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_103016_724405_D247B191 
X-CRM114-Status: GOOD (  10.94  )
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

I am no longer at Google.

Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
---
 .mailmap                        | 1 +
 arch/arm64/kernel/pi/relocate.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 735470e21075..47127d6da636 100644
--- a/.mailmap
+++ b/.mailmap
@@ -691,6 +691,7 @@ Paulo Alcantara <pc@manguebit.org> <palcantara@suse.com>
 Paulo Alcantara <pc@manguebit.org> <pc@manguebit.com>
 Pavankumar Kondeti <quic_pkondeti@quicinc.com> <pkondeti@codeaurora.org>
 Peter A Jonsson <pj@ludd.ltu.se>
+Peter Collingbourne <peter@pcc.me.uk> <pcc@google.com>
 Peter Hilber <peter.hilber@oss.qualcomm.com> <quic_philber@quicinc.com>
 Peter Oruba <peter.oruba@amd.com>
 Peter Oruba <peter@oruba.de>
diff --git a/arch/arm64/kernel/pi/relocate.c b/arch/arm64/kernel/pi/relocate.c
index 2407d2696398..82592f3a5c1c 100644
--- a/arch/arm64/kernel/pi/relocate.c
+++ b/arch/arm64/kernel/pi/relocate.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright 2023 Google LLC
 // Authors: Ard Biesheuvel <ardb@google.com>
-//          Peter Collingbourne <pcc@google.com>
+//          Peter Collingbourne <peter@pcc.me.uk>
 
 #include <linux/elf.h>
 #include <linux/init.h>
-- 
2.54.0



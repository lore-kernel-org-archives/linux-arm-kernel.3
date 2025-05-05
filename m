Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4126DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TWzvhiiRA4L8aIs/fr3zNj0LxktuObjcNO5N+h/kMdw=; b=SFp4WfYeIl9kPQ77B8vLuITCyz
	mLGeKGUDmeVGMMIcrrR4qGx/8veB+HzD21elKhbjTRha35LvZnUCVNbQTCDHNG8LWN8tHxwFv+cF4
	BM7guEqWJk5TuE24RANqxFraiOVFxpYibHJLo7PD39OHzesgmpPRcXBU4zdiP5iNI3H6Z+njlMfAq
	ghNkn7NDfScqOtVWWsPu5X3WMdD6efgilcwmTPUt+pH8T4tSSX8lCGoHUZKf+GuFljDuMe0/Vry0l
	43EmAcptG58wLY3FjhXR7nGGITVq1I+YQASwSo9iqTs1H3vm1/7bHXh9wsTEEXcZEsAS5KUgd3L/R
	eFgHf44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC69j-00000009HZf-1CBN;
	Tue, 06 May 2025 00:27:31 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4OZ-00000008ncl-3Gyi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:34:45 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso2972491b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746484482; x=1747089282; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TWzvhiiRA4L8aIs/fr3zNj0LxktuObjcNO5N+h/kMdw=;
        b=VzHfZpT9NAP/7qAEaecPPl9qVQ8TEi0+E7Qo7ZlxF8D6sBnZCmnJEMUfQZIBwyHiEi
         Q6f/UXwUQG6Nqf2fwY2o4hGqa0KJ6n1vHasrzMVnAkgH6S13oDDhB8o2hYUxJhhslJ2F
         9PGdni8U/jAA6EeSztHE5b+0jZ04Gtvvm1//T2T9WJ4KHYaOY/4lafDIhD8fAAGAr0Fk
         GqrzGvXKmQR3cMZP0oZn4h951NJHvX3Jg1SSemnp9jZomZSCOftCg2driLc1E/2yjEHj
         uBQzTZdV/ZN21e/tQdOtX3Qdr7CB8RSFDKVOjSilGRQg3RFjrBUUbiviuluGghsZ6hpm
         8Qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746484482; x=1747089282;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TWzvhiiRA4L8aIs/fr3zNj0LxktuObjcNO5N+h/kMdw=;
        b=VIQY0sI/qA1UFqexSjFvWu9zBt30QiB2BqniUY9dlwXFckw2dPYRF6WhCwHTGwqsn6
         7OFvtrxq4rBO4GgYPyMqmHkqCdIe/Js8nEwc0joTugNKXkP6wGCDBZWaxiQHfuPvEx0p
         spwsqavon8rh8s97SBy2QEd0/Ay+8BY/0ypfxWhNwTk1dj8dNoNcFokXsqxMln977mu5
         g8Q/ZB00pnWG2/OSedF9aXX8jskThSbn8l/I2h+YlQFrkdR89yQ1Tze9rX8bWdp/cmaA
         sel8wwt8Rcg9qTBF58kfIef1dL9K8ByV42XvzFNU/HlJMek5uF9GZLYAyzmeRSGyp3yq
         qstg==
X-Forwarded-Encrypted: i=1; AJvYcCXEQQCo8LSCTc4P18Elj7AimY4ya+RP1oZf0x1CsIceS9KLT3s51g/1slg5VJXULriA+1PDeoYm3D04yMKJA0XT@lists.infradead.org
X-Gm-Message-State: AOJu0YyhmSpoKKAZ39x2pGBk522H25MgITwnkz9fy5BeeikGoSFCaGQ5
	cbcl6suM1KlJyuel8D31EpnmLMQtASSIFaWF158TEYEzeKmhncy6Ku4XgP1kX//8VV5sN4aneQp
	oWjpf1U1TMkmneBXt6ItY/6Rs5A==
X-Google-Smtp-Source: AGHT+IF642o9ekk45BRGQU/RuojIgo/uuLEnnJ/ZVuZMKZbhEi9jlrvemL1lZnmFTIKLhzOuR4KmlcPhROtNl3ltMho=
X-Received: from pfmu20.prod.google.com ([2002:aa7:8394:0:b0:739:4820:6f18])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2906:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-74091a47893mr1047655b3a.15.1746484482097;
 Mon, 05 May 2025 15:34:42 -0700 (PDT)
Date: Mon,  5 May 2025 22:34:38 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=samitolvanen@google.com;
 h=from:subject; bh=SH63EAa398WjH+FSvuZB2bNoYzHYsiDI+PFpR/dXC1c=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBmSNv8OMix4ciD98wGLeXOKxGQ35ixR7L/OY6TF5Hxxz
 /71mT4WHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAivY8ZGVZ5T0zpspOTr7DY
 PNdEoPa4zO1/oods3sisD7jfw9ZmuZvhn9mJ5Yd9L5w+eazwzY6GvyYyJfMPflvoFFxRv+z3vif STPwA
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505223437.3722164-4-samitolvanen@google.com>
Subject: [PATCH bpf-next v9 0/2] Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153443_826989_62443877 
X-CRM114-Status: GOOD (  11.89  )
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

Hi folks,

These patches add KCFI types to arm64 BPF JIT output. Puranjay and
Maxwell have been working on this for some time now, but I haven't
seen any progress since June 2024, so I decided to pick up the latest
version[1] posted by Maxwell and fix the few remaining issues I
noticed. I confirmed that with these patches applied, I no longer see
CFI failures when running BPF self-tests on arm64.

[1] https://lore.kernel.org/linux-arm-kernel/ptrugmna4xb5o5lo4xislf4rlz7avdmd4pfho5fjwtjj7v422u@iqrwfrbwuxrq/

Sami

---

v9:
- Rebased to bpf-next/master to fix x86 merge conflicts.
- Fixed checkpatch warnings about Co-developed-by tags and including
  <asm/cfi.h>.
- Picked up Tested-by tags.

v8: https://lore.kernel.org/bpf/20250310222942.1988975-4-samitolvanen@google.com/
- Changed DEFINE_CFI_TYPE to use .4byte to match __CFI_TYPE.
- Changed cfi_get_func_hash() to again use get_kernel_nofault().
- Fixed a panic in bpf_jit_free() by resetting prog->bpf_func before
  calling bpf_jit_binary_pack_hdr().

---

Mark Rutland (1):
  cfi: add C CFI type macro

Puranjay Mohan (1):
  arm64/cfi,bpf: Support kCFI + BPF on arm64

 arch/arm64/include/asm/cfi.h    | 23 ++++++++++++++++++++++
 arch/arm64/kernel/alternative.c | 25 +++++++++++++++++++++++
 arch/arm64/net/bpf_jit_comp.c   | 22 ++++++++++++++++++---
 arch/riscv/kernel/cfi.c         | 35 +++------------------------------
 arch/x86/kernel/alternative.c   | 31 +++--------------------------
 include/linux/cfi_types.h       | 23 ++++++++++++++++++++++
 6 files changed, 96 insertions(+), 63 deletions(-)
 create mode 100644 arch/arm64/include/asm/cfi.h


base-commit: f263336a41da287c5aebd35be8f1e0422e49bc5c
-- 
2.49.0.967.g6a0df3ecc3-goog



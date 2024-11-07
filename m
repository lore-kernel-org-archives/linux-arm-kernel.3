Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254DBD5D689
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYMFXTGWFxXGTBSXbf4RqlCV7Y4+WKb9i4kIMpLBOpY=; b=1+ERRoSMg2ptXnVj9lZbfmr8+v
	E5/bYXuQHYmCRdGjQ56ibMRFNpYzT/v8xw+4QcOQ0UGAr07jv5zf4LV7x7dSSnEc/AmgXSUERK3pN
	E2YdB1hCDUypXd/bYoSCy214SdRXf38+ASJabYJE6hDhoYS2o9wxgfQcLh4uhcjtzHLkTl3yHWx+t
	yh25/jMWrGrRlk4cUQohtpKp9+RKfw5KhCCDY8TLu7F8I6LAJC8/DQVeGROQz3IkJwCArr2u8tytU
	5767pjx58zcUxIwnpFjxCVfUtuuWvhQGDkLHAMbRrTYpfU1gi/wxfe1CsWGKM7e8P4rGDNEh8oXKF
	jXbfvAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t99Br-00000008FyA-2GCl;
	Thu, 07 Nov 2024 20:33:15 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98zt-00000008E7q-2p7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 20:20:55 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea95f530fdso25371137b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 12:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731010852; x=1731615652; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RYMFXTGWFxXGTBSXbf4RqlCV7Y4+WKb9i4kIMpLBOpY=;
        b=IyJ5speeZy5460vgI2KLzKtiwlGF7JgCFbH4tmsPvYEhYhbU2DNuqpDwBwCBx0cN7H
         zj5PhdkZ8b7R2KZOkx2kSnE2kFQPha203T5ILTUeyvh8LOSd+LUVR03vypr2TFBf/olv
         D2n75PCAluxgmE2UT/6MFoen0S4oFTaxIuP5woUgiWEZ3HGpLr/nv0GDS3hVkrOnpcm+
         bck2HvfAZSJNgxO8m9UIIjhzqKtUHhLgR+q5uqvex0mJF3fCWUArQvF/l3cMXpjtS9Un
         cQaqhgaa+VB+7KKFUmTBJeBirGbuYofIxKwyr6dSmB7MLHiCMHAaGbgPw4tcHQq6EZJZ
         Wzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731010852; x=1731615652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYMFXTGWFxXGTBSXbf4RqlCV7Y4+WKb9i4kIMpLBOpY=;
        b=WbltKAY8tdVUHCvPgULR3SpFohXopAgNc38b6raPWZKCr6wdXjOAagVrCzozKxhPAq
         oYSt5UDZVyxOOmvA3hpUg0OPjR+h+sdMgpbBb/ZJBvZ87A96gp+JKEA4BCDjJVjeYSl8
         o8RcyxO/dpjp8o06eEG9OTHOGh5hK5GZQ3hg/rE7+wPmvGOW0yzV6seFmn/KN8nm0IMZ
         4DMjbVZHG/paeVJt0wbQfrVmD12LbgGrMmZ8XbmewXVJTUrhVEENKOBs6L5pVpGdZTp9
         YuZr3eK+yS94rg1L59aOqClN8eJ2/ASg3Ii3CydOye1NxMxB9rBN18G0WfTUsAHx4Vgs
         6o6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFyYiVNPPEVI+4pqBatkZK4pgxcwlEYOhRjSt6kWRp4E/5pLcv/i1SHcoK3iYGrftTWzyIeAgSC5eY9kgRRgxm@lists.infradead.org
X-Gm-Message-State: AOJu0YweYoDT4a6UCfnWWLc/jFL3nqIyvHDDUJtlbjkUoplcmbIKFB99
	VCHtRdOzAELRQGuEsSnoHZHu/EWhUcIb8530H1O1MJyspDb5kzIgfAt9kSXoxehOp38UpMeNK3j
	g4A==
X-Google-Smtp-Source: AGHT+IHlhijSC9zoCXOj87mpdA8tF9p5aSLV/movLFpBkBVUAVMMT2gDU4exk7NlnuXq35RVmXnfaJPFwyA=
X-Received: from yuzhao2.bld.corp.google.com ([2a00:79e0:2e28:6:a4c0:c64f:6cdd:91f8])
 (user=yuzhao job=sendgmr) by 2002:a5b:809:0:b0:e2e:3401:ea0f with SMTP id
 3f1490d57ef6-e337f8f63a3mr313276.7.1731010852085; Thu, 07 Nov 2024 12:20:52
 -0800 (PST)
Date: Thu,  7 Nov 2024 13:20:33 -0700
In-Reply-To: <20241107202033.2721681-1-yuzhao@google.com>
Mime-Version: 1.0
References: <20241107202033.2721681-1-yuzhao@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107202033.2721681-7-yuzhao@google.com>
Subject: [PATCH v2 6/6] arm64: select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_122053_791474_C740826C 
X-CRM114-Status: GOOD (  12.22  )
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

To use HVO, make sure that the kernel is booted with pseudo-NMI
enabled by "irqchip.gicv3_pseudo_nmi=1", as well as
"hugetlb_free_vmemmap=on" unless HVO is enabled by default.

Note that HVO checks the pseudo-NMI capability and is disabled at
runtime if that turns out not supported. Successfully enabling HVO
should have the following:
  # dmesg | grep NMI
  GICv3: Pseudo-NMIs enabled using ...
  # sysctl vm.hugetlb_optimize_vmemmap
  vm.hugetlb_optimize_vmemmap = 1

For comparison purposes, the whole series was measured against this
patch only, to show the overhead from pausing remote CPUs:
  HugeTLB operations      This patch only   The whole series   Change
  Alloc 600 1GB                  0m3.526s           0m3.649s      +4%
  Free 600 1GB                   0m0.880s           0m0.917s      +4%
  Demote 600 1GB to 307200 2MB   0m1.575s           0m3.640s    +231%
  Free 307200 2MB                0m0.946s           0m2.921s    +309%

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..e93745f819d9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -109,6 +109,7 @@ config ARM64
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_EXECMEM_LATE if EXECMEM
 	select ARCH_WANTS_NO_INSTR
-- 
2.47.0.277.g8800431eea-goog



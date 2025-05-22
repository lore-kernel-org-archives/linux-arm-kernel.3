Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF40BC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 20:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lh/Utffd02T/FBnV2lu48AGTTpPeHOAZMAviTbyobKM=; b=M65TzQ1K9lD0Pm9bKqloi3ZQIF
	4Z8gWk3pV4ZN9mhnlownU6w1kgVBIcdMfH4SiPpRuce7QkWmHkTRnPAjyvWlr9a9baHPrfZcKm5e4
	Q35TfVRUbgEgvZp9x3Bvb4WTVs2pkYJqpY/JnccnAefOMmR7R0XQ/4aaEy4V/eg8o5O4JoxNhbPoM
	/GMNw8twbpQfpBsHN3b5Ybcyw77n5zIO5PIgBSHjRknnEEhYqClpb2TB7JdFh7b3t82SUS70F/TXH
	9WI9YaApENsDdyy17K3UvV9Ax1o3fsG5m64X9bpCVBx9HLv1Bm6DJ5mlKcoQBboWSSzDnD4OuDAHA
	hsvbMrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICvx-00000002AES-3Gl2;
	Thu, 22 May 2025 20:54:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICtw-000000029ns-2bOp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 20:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=lh/Utffd02T/FBnV2lu48AGTTpPeHOAZMAviTbyobKM=; b=DjsXopM8xv5R5mzQ93PiPB8Ju/
	vxeqq53/XQHKaLnWcTFs9zsgGJiD61wb+RJiWbzKN2oRtJS7c4UkbbtGqhVQwgsk+mN8xP5YPBxW+
	/jPRVTQCdm6HEnUutiPsCd25LkdASxGg8kNsxXFxKNtG29V+Y/fgmUYkqLuDqqCHRk3zEg7gfoU04
	/WR93bLrnocLziygCKQuLQ9aGEUXSVPdEBHNiwf1tFRNXJSgiVbt1GFoCQSnxxoE81WDwW+NxZMRt
	zAoKUUUZWfRGJF8nA4oV0rvtFPTh3PDVdjmgaZCfMAeDNJjp+NJBeqHvLvz8/AbbSupdHUzgnLIOC
	wP2cbpKg==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uICtt-0000000156G-02E6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 20:52:27 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7377139d8b1so7195509b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 13:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747947142; x=1748551942; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lh/Utffd02T/FBnV2lu48AGTTpPeHOAZMAviTbyobKM=;
        b=PdBZwpO01jnPd13B87VZJGyTrGa+0iIru+zzd/mOWuacAKL9G8pGWGiSYjy2T/okf3
         ZkLQxmT6LgAvZdYpa4L+TY5EaIbW5WWre2tf545oFcse966EO2PgmZLUl+r18XplAXhP
         RbU4WeMHx3eg8d3dBb+ahuBDOgyIpGaSAYWqGVDdbNJ7vBnw2gdJ0p5O7urSS6owJV/L
         zlkiiPUWq0qvfq6D6boCtSXJsA1Z0LW2pJGMbvBZOeThP6EfOw4ngCty3ohGILFU55Xi
         vr2DIx5FY7x9ZedBZCMGBaP9/Os79loCBoAGoBLD3Awfp/jjgg7l9p5ufRgD38/kg0sz
         VYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747947142; x=1748551942;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lh/Utffd02T/FBnV2lu48AGTTpPeHOAZMAviTbyobKM=;
        b=bDlvd8cdnu7GRvCsQJp9mioz0KueE6wXmXI1uh4lmWrGSQv+35QQyaX4F2J/XOTgjB
         RtrF9WtwXi6pQ7qiMYAweS3S+ixQRd0LhJb1a60/OejiYUzCFe/tC9OMmLYzdBwPZEYZ
         73NQuswv+1RzdC1HXvxm0xWZcqXuwIXoNGdXLXxR6WhNE9AfZyPo0NmLGCVuyuBxlmFP
         KAYg9VkkUR+8xnCZX4aQVTjQ8Df/5qjZh7LwumDevOuaD1AiYXVaZx7rKtEBa7J803Q7
         fqWGndtExkR7kS9PTsFnHrEJ9S+N7qx2ikfe9IVWq69x7gkvIBmMF2XCbkyeMh30aai0
         iqHA==
X-Forwarded-Encrypted: i=1; AJvYcCVqIzCZ1+mKaPs3S42sA7GDbGH3Ebh1kF6zGVDy/TBTpavKC9G0Rl7c7BKePFfothKu8TamoZ5Tn8kBWcWtUnuW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Zhg2zYeQu3PZX+5tgzykxCQNORDoEMR64cnVvoqGIarbDMZG
	Aw5eLc0ce3TK8bDtBUBlivhE/OY78LdtYvuVBo5Myfy2EnSkCCcwp3G8zZnFOrnj8Ls+S0HUUEd
	YR4HIlyWuoFm48OZKG7n8gkOODw==
X-Google-Smtp-Source: AGHT+IGaQtir2ZcxSVyI64xvDdmjTxVFWoE0lsudMVLTodH3E4q06fZUd41aCTAVUHFHXDY94DC0IVeURvd0KoYhEA==
X-Received: from pfbgm7.prod.google.com ([2002:a05:6a00:6407:b0:741:8e1a:2d09])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6a22:b0:216:1476:f71 with SMTP id adf61e73a8af0-2187a6f5113mr342227637.39.1747947141756;
 Thu, 22 May 2025 13:52:21 -0700 (PDT)
Date: Thu, 22 May 2025 20:52:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522205205.3408764-1-dylanbhatch@google.com>
Subject: [PATCH v4 0/2] livepatch, arm64/module: Enable late module relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_215225_316321_83741298 
X-CRM114-Status: UNSURE (   9.35  )
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

Late relocations (after the module is initially loaded) are needed when
livepatches change module code. This is supported by x86, ppc, and s390.
This series borrows the x86 methodology to reach the same level of
support on arm64, and moves the text-poke locking into the core livepatch
code to reduce redundancy.

Dylan Hatch (2):
  livepatch, x86/module: Generalize late module relocation locking.
  arm64/module: Use text-poke API for late relocations.

 arch/arm64/kernel/module.c | 113 ++++++++++++++++++++++---------------
 arch/x86/kernel/module.c   |   8 +--
 kernel/livepatch/core.c    |  18 ++++--
 3 files changed, 84 insertions(+), 55 deletions(-)

-- 
2.49.0.1151.ga128411c76-goog



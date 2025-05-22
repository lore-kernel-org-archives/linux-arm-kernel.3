Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350CFC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 18:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kJhW3AyBTwLj+5fICMaVOix+/q9TCuLWjAHHEUs+ZtM=; b=hgg8x07X+I82GVr5uX/EH0VTwz
	2my4l8TDi1/oCtCPwDtgAtktVVzRzQzi8zPyQVWctPZWbN3vjxJ7ihjgRyqQpSMnSyF3YhqEVaffj
	BaQDu0VGpUI0/SbqyiZduhPm9t8V99qOoTxS+d7Xj6PLvzpdhSuhy8MEWWPYrplss5mU/qYCzVelF
	JlmOixwrVOWZM0g+c4XAFn8yfa1Pk94cjpdOV58vDmmti07uWjZbfVdSu7XMnwKl27fFIXSDHpbQo
	R6wo+XReLiD8bs+ljA1L9oni7WwtHe6pv6qWqrWARCjX5He0bW6ePIdOYMBdSwHJOQl5x4OTNltG+
	oxaLDjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAwK-00000001uAZ-1kqj;
	Thu, 22 May 2025 18:46:48 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAt6-00000001tO2-1zx2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 18:43:29 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-742c03c0272so7181763b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747939407; x=1748544207; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kJhW3AyBTwLj+5fICMaVOix+/q9TCuLWjAHHEUs+ZtM=;
        b=Eem+MA0NeeUgmjLi8uVrT6eC5zRaz3yZysbbUjCJd83CEto+3OvAHyDfUbvV98kTO7
         msjUTUKLReQ8Qm6g1HRPnyN+mPNl8qPXb8QJOm9ucNjeh7HgoQGmg5SRX/xoR9yrQQzI
         U6wN9A0C5WK0R1xdtUNAO07NkEYc7KV/pUrJsGdwIaOsgfGcgfjcO0TyKXET4HqX+z16
         8Msejh0FrkRC+M7BT6SefpzdM9vKazP1DTI+V0V+oXezUjhPoxfsv2OSauOeh3i3TF+U
         1AsmRqY+BcGF+suyovGLTbtFpVQq7AWirkhYlp0K94UqfLkghuheMdxtRh49wQPJtLI9
         /Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747939407; x=1748544207;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJhW3AyBTwLj+5fICMaVOix+/q9TCuLWjAHHEUs+ZtM=;
        b=A/2GRYFxAdNHlI9JLEqTTuFIAyuELjKq/jpWrgnwWqWl4LmzN+2mz0iVvsni4iRvWE
         n7ifCAIhuNsbIqHPpfEcuZxkR9ZXzQWFVOej82/hjtCjY89vqnQ6SZqECSpPF5SLLCDg
         WNphtHAXFijEJFQT9xKkrS7Usw4W0X3nhEr6bFlBAnkE8mzm8DF5vbHjRhkj11qVi3UZ
         qh2qs91b7TmscGBF0McsENygTh4ox6Hr3ABgCUsaq6/BHNpIAw3r+0r6Y47zheUR7Jro
         axKR7PfQABUYUKZ/9Yc7GrQktLrTZIcbFsLTg/wo+CJOO+26AbvFlFXzAiQcu2c5cbTE
         rQmA==
X-Forwarded-Encrypted: i=1; AJvYcCX9GkHDu1Jy9mV4qa+164te9OvUjfnSeX0/4st9U0VWB4XC9jsXa0eksCR4jfXfBJzhDnDPqP/Aa3PIL3AI9B7F@lists.infradead.org
X-Gm-Message-State: AOJu0YxKzXZNIScsdAZXkmMIxOvKdZVh3bs+dl/QOLmZURDyye9PE5o8
	xrcoxKtZTyFbeYqbb1vWr4WBP3Q95YIjXp6Bpww5PZUI/N7jOWSYDENpbGvEUexfu2L4bm5h7/v
	MUCrtWcVhn5/BXe8teg4zM0oJtw==
X-Google-Smtp-Source: AGHT+IEoHYQeMI2gttjWN9nuJgkrLE6pE1VViQG8vIffgAD4ufQc//tDtGttUcf0KhgAxWPRJDyiNtZL1pXHRY8ptA==
X-Received: from pfbjw12.prod.google.com ([2002:a05:6a00:928c:b0:736:b2a2:5bfe])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10c6:b0:740:a52f:9652 with SMTP id d2e1a72fcca58-742a97aa35emr32848725b3a.6.1747939406599;
 Thu, 22 May 2025 11:43:26 -0700 (PDT)
Date: Thu, 22 May 2025 18:42:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522184249.3137187-1-dylanbhatch@google.com>
Subject: [PATCH v3 0/2] livepatch, arm64/module: Enable late module relocations.
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
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_114328_529741_3408628D 
X-CRM114-Status: UNSURE (   9.51  )
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

 arch/arm64/kernel/module.c | 114 ++++++++++++++++++++++---------------
 arch/x86/kernel/module.c   |   8 +--
 kernel/livepatch/core.c    |  18 ++++--
 3 files changed, 84 insertions(+), 56 deletions(-)

-- 
2.49.0.1151.ga128411c76-goog



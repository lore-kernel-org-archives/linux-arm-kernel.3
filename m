Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7556DCD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 19:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lppeZAOEOI7xcYziB7CENVtjkQmIVwIhwmDNLmjZI80=; b=QpOw33qBGVvV3G3xZ5Cr3E2V0L
	wXRMMnpkQmIZTYyQdxurRHmqz9w9BHjUSHEkoJiesfHJOIjJQG9kNw5MeEspDqdO+zqIxWOKE62Xs
	m7WMQnTu1oRdI0IZHhUCN/rboehqtHFIcfy4KsinOmTECqyRjd1GPNEW5PkEiQRmgm+bjduXljRZC
	P6aF8hVaW8qQHw2ym0e3L7LyabP0898fQYV4AJcX+TtqxH/WX4MRHJQU+Iahk8YRjRJSZ9+XzYS6x
	qMz5ljtC5mOz4dyBaW1q5OKfOuaLXuFi54Qcur40e0/BQAmRxN1jTwqVo6S3RQ7r7iz4DcA4Os53v
	44VPctww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEAs-0000000HEWB-3TjP;
	Thu, 04 Jun 2026 19:56:18 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEAq-0000000HEVF-1owt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 19:56:17 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-137f2083280so4407700c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780602974; x=1781207774; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lppeZAOEOI7xcYziB7CENVtjkQmIVwIhwmDNLmjZI80=;
        b=wgCeBflZpzq9L/9TLiED/QjdQI/gANkVRVGzD+ca5XJh+rEMCcYqPmJqNDlhFR9g87
         //5hazuhsCcI/tsDsQK0Fo1vAdBdaEQzfJDtMHePlKqfJQje3JOKRfgPZyRAkVKdn1Cc
         ZKfKZfBCBZGWpqeL+QZ8KyxJNvYwsAPLIAaJVbbGC/nRQAOZi+igs85R2OwZRMRdMeWm
         k4paBczK50CKEW8d5B7cB3U/zLsjTquVLfHe9wYhdsHT8ojTkqkE1ElocR8G5HGRVoL7
         T2XJES5COq5NsbZeI2ds0xelp7MjcbKDsbunpweIdDmcogT2NP4s3bxG+tXC423P52JF
         8iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780602974; x=1781207774;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lppeZAOEOI7xcYziB7CENVtjkQmIVwIhwmDNLmjZI80=;
        b=FMdNQNJL0rOkpZZnRyxawH4h+XZ67Bo2SH3bntHeY4Cxpg5B/gLZ5K/fx/DlChrJGd
         NiNdLwwYduo8HVHAnmeQiuOiBMNvYIQnwI9IvSOxnpGbPPaMudC+4NsnuUDoUeEDFKII
         xDIGDlQi3Lj/U9qGWCH/nIFJLCscYkwwG+voi6lNSKN2jVnGfGg+CUAdZn98y7lGLogR
         d/IlcWYkMx2h3edk4eR15uxMzvQmphdkAWH3kMLJn342B5NPwFIwP/2K1iDzzzH3w7rP
         cLJpJ5Q1F/h50X8uRb+KPw84Pg5Z6wbNZbR9+fLFUjzl0wtxTRkxK54+62xwjvgILBJP
         k/lA==
X-Forwarded-Encrypted: i=1; AFNElJ/xamXyJZxmdAZIDZhxxbWalUtOYuNpTSlEOgUqU2Tqq9ucVm3uL+bKEKYjCNiXIScUuWIWDs7cOHHjkg46Lh4N@lists.infradead.org
X-Gm-Message-State: AOJu0YyoDKUtWTPnaH7BgF92Np7Rb/U5yCPMbbrvArGRV7rUesEOhJus
	4gS+bZJMuKXHXGKKZgdM+/zvOy6QLidg55L90ds27BCdjXFQDOOJjKHrM69WGnPcNc0HLg==
X-Received: from dlbdt12.prod.google.com ([2002:a05:7022:258c:b0:138:d5:834e])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:503:b0:137:f0d8:4ffe
 with SMTP id a92af1059eb24-13806764206mr250557c88.36.1780602974141; Thu, 04
 Jun 2026 12:56:14 -0700 (PDT)
Date: Thu,  4 Jun 2026 12:56:06 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260604195612.3757860-1-xur@google.com>
Subject: [PATCH v4 0/2] kconfig: Remove the architecture specific config for
 AutoFDO and Propeller
From: xur@google.com
To: Yabin Cui <yabinc@google.com>, Will Deacon <will@kernel.org>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Rong Xu <xur@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_125616_479681_DB118453 
X-CRM114-Status: GOOD (  10.29  )
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

From: Rong Xu <xur@google.com>

ChangeLog:
  V4: (1) updated docs for AutoFDO and Propeller
      (2) moved .llvm_bb_addr_map sections grouping to the header file.
      (3) use $(cc-option,...) for supported archs.
  V3: (1) updated the base;
      (2) changed vmlinux.lds.S for arm64 to avoid the warnings
          from .llvm_bb_addr_map. 

Rong Xu (2):
  kconfig: Remove the architecture specific config for AutoFDO
  kconfig: Remove the architecture specific config for Propeller

 Documentation/dev-tools/autofdo.rst   | 41 ++++++++++++++++++++++
 Documentation/dev-tools/propeller.rst | 49 ++++++++++++++++++++-------
 arch/Kconfig                          |  9 +----
 arch/arm64/kernel/vmlinux.lds.S       |  1 +
 arch/x86/Kconfig                      |  2 --
 arch/x86/kernel/vmlinux.lds.S         |  5 +--
 include/asm-generic/vmlinux.lds.h     |  6 ++++
 7 files changed, 87 insertions(+), 26 deletions(-)


base-commit: f58316a441b4626324993db585fa4b7b7c780fac
-- 
2.54.0.1032.g2f8565e1d1-goog



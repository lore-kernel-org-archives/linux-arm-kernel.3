Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84EECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 21:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ab2hzOOXCyIXPSNyeDp9OO3k2d2oxbauwxi1JxymGkw=; b=sW0k7wpQjQ2VMKK2NEXDbN+SQz
	zWx3Maw6h4uvuhTZ7Vmw2XzfrbJHYntwQkOz4R2RHdaPZgiu81ofw+YQ8hRac7GYnrx+FRQ+3KL0H
	eQSADyUOZR3bdMYwVk8eMl/370vENvEpV7M8v5brTOjP76dMSvQW4H2Qmi+K4gSrUvWs2mWeEvZTE
	I3xGPU5W9FHZvQiceE0D6t/b0DbKboTAg0HtrgW/FNAseKKFFuRcPPoYVkl6f4vf5sMNTtWVbSHsV
	D7qXzxWk7guh4kWtlVTwCKczWMJAW02lWd3ibONa1a9W/wbrBXjIe/Sy+AOSLb8N86EAaJu5KgeWD
	HrQ3b85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSM3w-00000004leG-3wWX;
	Wed, 27 May 2026 21:45:16 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSM3t-00000004ld9-3LbQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 21:45:14 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so1666061eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 14:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779918312; x=1780523112; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ab2hzOOXCyIXPSNyeDp9OO3k2d2oxbauwxi1JxymGkw=;
        b=k0QtJUx0m1hng9XefVLuwfovNAnqELNr9s3kdr6FQCy535kW/sVegRRkkAfD4iO+wg
         Xli3Yr/0KggPDdPW6hwisEUDvltM+WGrC/Mq0jFOGE6gzkgIkf0F32+rIJjDTxSk+bqD
         8AlWwEEDXCJxLF7YZzMdY4h1XJxwsMPBlMyJb0n4riei16aqLTo997D1d5V9x63xoh7R
         2FESrGxuD26UmvE/QqHj1gmEYoOOy4Eu4zElsKItLp2yC1n/sU8iFbJJ6x9pOl87j142
         BQyHwSTQ2JLjNMNW9QDOvKmiEAD0XPFfbPiXAsJcwkV+S27L17zgcpdHapgQmyqHNDyD
         F+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779918312; x=1780523112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ab2hzOOXCyIXPSNyeDp9OO3k2d2oxbauwxi1JxymGkw=;
        b=fkV8CbFllcc8q3K5cJ4eI+rX83tDVIybiSA+CAO7j32IhD0Q0IGk6XUJY0Xu8cp5FE
         dBL3sA9XA4ITGAN4eEeRtG4IH9Rs8LGYXWqB2gjaKJS/ckbuNKIT85ZLlH64sRCzP6nx
         r21yNtsdiVN6mkwcna7t+yHEjOrwp7dnAipxXUUA20auB3eFgagUm1TGRf9NrSmd8g8v
         3RaD/AS55TehhDMPinIGaxJEYL0TFm+LBpPzMcYI2ohUxSM4WAoULLkvd+dtfJAbnJ3I
         KKgTk4rnvOKjl9S/V5jdcg+w+smd5UsUVlTIwxsE0lRnZ/YtyYaMlqVtON9duBVsX0Gz
         rBaA==
X-Forwarded-Encrypted: i=1; AFNElJ+uKbqny2X/utUUGRRIvA74lFrHkPnOT8Y3bm0aQLhpiy3AM+VKcnMZT6p3DJ04ymPCALwQteVi8KrK7p2UxZjZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ByjNcPYKMky1HiFHQbX9XXufsBNUp+wiWCMIvOyXcCkpwKsW
	R95/C2JMAvjFM2Q5jSraVpdqkvaiSOqEPuQQXtLOC8aLKy+H6uozR1F/rSgRWv7Z9NcRJA==
X-Received: from dyz12.prod.google.com ([2002:a05:693c:408c:b0:304:59b1:e122])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6096:b0:2ed:2942:34ab
 with SMTP id 5a478bee46e88-3044904df37mr10961903eec.3.1779918312233; Wed, 27
 May 2026 14:45:12 -0700 (PDT)
Date: Wed, 27 May 2026 14:45:06 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260527214510.3907973-1-xur@google.com>
Subject: [PATCH v3 0/2] kconfig: Remove the architecture specific config for
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
X-CRM114-CacheID: sfid-20260527_144513_844316_E8BCFE2B 
X-CRM114-Status: GOOD (  10.51  )
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

Resend this patch:

ChangeLog:
  V3: (1) updated the base;
      (2) changed vmlinux.lds.S for arm64 to avoid the warnings
          from .llvm_bb_addr_map. 

Rong Xu (2):
  kconfig: Remove the architecture specific config for AutoFDO
  kconfig: Remove the architecture specific config for Propeller

 arch/Kconfig                    | 8 --------
 arch/arm64/kernel/vmlinux.lds.S | 3 +++
 arch/x86/Kconfig                | 2 --
 3 files changed, 3 insertions(+), 10 deletions(-)


base-commit: 2c31897a17e55a6da529b4e797e98c6febc60fd2
-- 
2.54.0.794.g4f17f83d09-goog



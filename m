Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A758C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 23:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujMS9iWtpwLq4M2KQ3ZYriDJ1LnUAH7y3qXjsm8QUUk=; b=ksf0Z+Vq5bwqxMj4tDKgu8cYkC
	oUlX/ccpj8M8/hiOxIwsJwEdugk3V9dGPQ2uQGd3wrDll3KdAL0HHGiOc2wRsBh5iJIZpuWD2yuWK
	vpRKFdFyT2yhCJpYroaHfkWC9htpn+V7uqTG87hEVY9JnUFEd5DHjPj9MvsgU4ODoakfkXJlP9eVt
	kVgzpU7+vKJRKwhz5CxV50AVg6/ynw68XpsYe1g6xSLLlukP5AgHhbwOghQOrhdb4DvEobGGluSCL
	Qp0pCpWWbbJ5o3/U48mDIBMb9l4EoYu45hnR0eOFkRYwPGTukErHBkhPyJBhhbtMvN0HkcNmlAU+j
	OgP2KaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdCo-00000000FIn-0VLj;
	Thu, 01 May 2025 23:20:38 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcoe-000000007V1-0wJU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 22:55:41 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-736b431ee0dso1220024b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 15:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140139; x=1746744939; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujMS9iWtpwLq4M2KQ3ZYriDJ1LnUAH7y3qXjsm8QUUk=;
        b=IODcKh+j+S+97Va55YcgPSYohUPnHf1TmyKaXJ7HRh07cyDUMcaN28pHKWM/ZShpC/
         HQj0shQW1Zi22UJct8RUrST7q2iOhciVx34B8j3rbco+X2aVl9HiUPbEAPmNTFXOTFV/
         RjMpPKUnDObXLMVCjdJIXBYkkDKhCo1thsksyTUGE+kzvrLDFba6k+A9t97m0sugt8Et
         0yWzM7v8bo4UTFXlu+a1ed9KFWrrrTrqcARw/iUG1tIqyJXfmVVJXa2sYbv2SXKYbzMK
         vLs+rLP+bbZ9uKcjU/TUKEqpGCj/bY3RZ0O7kwvxtkns7o3dGESI/fQRFlYoIsE/kida
         UcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140139; x=1746744939;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujMS9iWtpwLq4M2KQ3ZYriDJ1LnUAH7y3qXjsm8QUUk=;
        b=KhJ2e05An80pqpgF/rcGokgsbFWyRjNIN3Feha3UBKXe+QFqLs+qwIS3Gufg7LPYXt
         aMsWp+gN1MyOIfoDTLm6MTaxN00oTeuwlQbS03bipt849691NRjvOrs52c9FHrhGCvlF
         ab6VtEZz88aJIug9qEGzHcADIJSM8QjXvladh35SmNm4zXNTQiboaKB0F7wSdfSczjX9
         f9n19q9aCNr2rLCBEmvXoxqSK1X7IwZnAiWxizYtqVrcw7M2z5UzVxQFrEeudsNAA752
         BTt2VVInlhjOeQN/vT4DR10/KEqtTz5aVkEwCFfa6s2kSylPKAWHBviOVhOIdurUtXEo
         xU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUxIOE4AoG6J5fr81cYFxkgCnRAxdppz8SyZsXZFlIeJYy2AwBDu3nfl9KqqIrTbY5Z43H7GrGa0oot2B3C4J5@lists.infradead.org
X-Gm-Message-State: AOJu0YxE2GpaMKrGWmqu7DBBHz1XF4JXtKzoDyw4cNRvCq7zXoO4KbDw
	VgNJvpeGhug8/n3Kwm3SklKm3/D0Q9iH3+eKJRRGTMv7OJyOPoE+77dVEtTFEiW+/8NiCZg7HIz
	SyfR6M46tjs+JfgiSJg==
X-Google-Smtp-Source: AGHT+IF0oG06110pxn+L6jvF8pwIbpphgmFF02eErozRfp92F0qjSunMQwPjNURzgPwihWmQXAZuVLeHG4Y3HL5X
X-Received: from pfay11.prod.google.com ([2002:a05:6a00:180b:b0:736:e626:2741])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ab05:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-74058a24c08mr880321b3a.6.1746140139284;
 Thu, 01 May 2025 15:55:39 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:22 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-16-changyuanl@google.com>
Subject: [PATCH v7 15/18] x86/Kconfig: enable kexec handover for 64 bits
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_155540_268161_7FE5368F 
X-CRM114-Status: UNSURE (   9.34  )
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

From: Alexander Graf <graf@amazon.com>

Add ARCH_SUPPORTS_KEXEC_HANDOVER for 64 bits to allow enabling of
KEXEC_HANDOVER configuration option.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6b..d1fb81ffdaafa 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2029,6 +2029,9 @@ config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
 config ARCH_SUPPORTS_KEXEC_JUMP
 	def_bool y
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool X86_64
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool X86_64 || (X86_32 && HIGHMEM)
 
-- 
2.49.0.906.g1f30a19c02-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302E1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 23:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGO8byd0TkM2xA40/EGnrAlxr2Ydy4LQeG9Cn/PTvGw=; b=FtS0rJ1GuvMIUyWKY1+qqsHD+5
	JPS50elq+Hh3MeKuen1m3peLj9VMG2tvpFZ8EzKcCOdxr8lzs+altCtN/IYRyMAlOKmPGGCws/rtf
	eYpmG3Q91v+2ZXCpJEa9sv36Ufbl6sOTi0qz4vIFxxk1C7nW8/86HT/GoNORWHebYEj6t7OfNPdKP
	r8/p/l1K3pFRFJCoePTe4ZHABTbImg96l3Tgp230wu7VUWCEkcjUkRRw1dU6Mf2uaPAFMncXexuGS
	LQojiVFIPJ5rLzjn5kcMBFEGyYzTibGv6Up/sGYzJHGTXfA5gtgF8f0sCbWl06wL+OsquU+gMovMD
	aFdb/hbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdMD-00000000HBr-40b3;
	Thu, 01 May 2025 23:30:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcpD-000000007qG-3NSP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 May 2025 22:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NGO8byd0TkM2xA40/EGnrAlxr2Ydy4LQeG9Cn/PTvGw=; b=jczv2xHGLiL5iD3ExR3cpmH5p2
	+utrLX1AtiaNnFxpBMjdHAMFkQzil0CY07eSK/u6bvE07Df/BW2lfh/jdxzpl+xZP2Z1pQ2LY10Gh
	aW51dTi56DNtZKkjAapYkHpgBTnvaushL0MSDpdOavykRQ3z5LwUDSNjFfGJRwLWE7nwyolddPPu2
	1yXQatIlzoMfCZfwzBbvkQDFrAzPSGp0LjUJUI+fxOixRb4XrIOrdEDRuy3TuZIQDaR9Tvjb7Rw5p
	siUWcdfMd/9ajfi54G79VMh6ITWazYOEIamabg1IznxInKfbFlL8uGtkgL8xLOqn97MWKnsMcUb4h
	MTNlZx+g==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAcoT-0000000EC82-0zZY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 22:56:14 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2241e7e3addso12843835ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 15:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140126; x=1746744926; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGO8byd0TkM2xA40/EGnrAlxr2Ydy4LQeG9Cn/PTvGw=;
        b=mye2ft2TE+Z+HN8gsdjXi1SxosJYO5CGhTfJmjyk5aBLUiDXDeIP2PUhTboGkSuoE/
         nzph2BRSHAESg8gEgmffIBoTzdz9DRYXFtDY9wWIMm1ZGq8XM3K43c/v7dapriPenD3O
         pEk32zqR0vUNkE3UKuDATV9rbPMK+8Y6k+ycTdjvFIqZ/shQoUXlZw4I91mq9k2ZrIa1
         6jczeEVcliJSqSPNPmx8mNcwyaTGS/lRhcgkv18RQ3/wQYh6ecklV+mUCPocm9saOQdQ
         4aqjrY+B1Tg2vHej+baIzmH4kJg9NMfE7y0WWkBeqGw87cpTibRz+hWBLknnMUGMv+Pm
         NYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140126; x=1746744926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGO8byd0TkM2xA40/EGnrAlxr2Ydy4LQeG9Cn/PTvGw=;
        b=cuuZEDVTU2J3iIPoZXTNBs0MGyQ1uxeyIwvkdeenmihmWrDidltuW3abDmusZEK1w5
         BjP3XCsqxrCR8b2/YI7UUAPKJz2SI4HRkl3V/kTuOIL2mqBpanmoJG52q1ENai92bJFK
         icoG3ZTftoCK/mPw8GakBx/ZPRTGgtIlMAmbpS3OECh4MxCL1+YvzC4g4hTG5PNlkxZD
         RI/1TZukky/KUg1MIGq2xuRz2RDeZc4LhTmonz6c9Q/H7t3iMrtOX+5h87CGMYM1YSMu
         JFy67VPbp07ise9h5Q5qubpVBuACSZKaPASALqk41Qop9I1pF43565xLRTxDipdcDFka
         h0fw==
X-Forwarded-Encrypted: i=1; AJvYcCVcvCGbD35eLWPOfsY4EiP8VytnYNeMV0670NvlQ5I6hlJocFA3jlmu1Wl+NK+7BLWZrTJB3V/0nm7NyY/ta4ot@lists.infradead.org
X-Gm-Message-State: AOJu0YyHzMWNzJcf3jGy6Wpw9rS85jh954K8Xd0HvXm8gsVGnFtutzQ9
	Ss/SxfhuvyNb1IuAhyWcPKuOK3mPppaN3sX8P9mu9aZ8kuegRZGmwgr+hTNm0oEuWhgy84ezx15
	G/2eckHQyE99wuTOXTw==
X-Google-Smtp-Source: AGHT+IHJUmwT4tOhxLskkrWxieqEKxrv6qbe/rS4uJuA/C3JPb20dm7HBzJjo4+K34ocPx0/uIvvUYW+1UT+7DwM
X-Received: from plac4.prod.google.com ([2002:a17:902:c2c4:b0:224:2ae9:b271])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3c25:b0:22c:3609:97ed with SMTP id d9443c01a7336-22e1031f6femr10317175ad.30.1746140126491;
 Thu, 01 May 2025 15:55:26 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:16 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-10-changyuanl@google.com>
Subject: [PATCH v7 09/18] kexec: add config option for KHO
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
X-CRM114-CacheID: sfid-20250501_235557_747455_68B9696A 
X-CRM114-Status: GOOD (  12.14  )
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

We have all generic code in place now to support Kexec with KHO. This
patch adds a config option that depends on architecture support to
enable KHO support.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 kernel/Kconfig.kexec | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 4d111f8719516..4fa212909d699 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -95,6 +95,20 @@ config KEXEC_JUMP
 	  Jump between original kernel and kexeced kernel and invoke
 	  code in physical address mode via KEXEC
 
+config KEXEC_HANDOVER
+	bool "kexec handover"
+	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
+	select MEMBLOCK_KHO_SCRATCH
+	select KEXEC_FILE
+	select DEBUG_FS
+	select LIBFDT
+	select CMA
+	help
+	  Allow kexec to hand over state across kernels by generating and
+	  passing additional metadata to the target kernel. This is useful
+	  to keep data or state alive across the kexec. For this to work,
+	  both source and target kernels need to have this option enabled.
+
 config CRASH_DUMP
 	bool "kernel crash dumps"
 	default ARCH_DEFAULT_CRASH_DUMP
-- 
2.49.0.906.g1f30a19c02-goog



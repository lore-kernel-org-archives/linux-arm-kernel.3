Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438F6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+m4Z3dP+tM6YZb4FwYg8AZfxdm/iv45+PxfK9MWhRlE=; b=MKoLEApwBDZEa0mGIswlt/Lx51
	N546/10zNl2I13BEoDHFA9IiePwB4yKrjt3xl7gBVWCgQwHNAMozS7wKnfleq7S3+liVa6JgbVPju
	npgPpKBL/dau2j+mvwFFVeK7Qjys92UrIcY7EKRjhEnk5a2omj3MZBayi0Au9T/HhehUkWpO7CtS2
	SaX/vb773XnDo2iOf8z85lXqJgxxeN/c2MOxH51ngvCBadSWmtQfk4jmI9AOOE2CH9+t4MAcBEIia
	7DDqHA2xzdVeUdES4MwVK6yDU2FDdCxvJ+ZcSj5m50/k/cQHI4UmNCEwImVwdORFXLThEDg0Y2ipH
	hHitVh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIjg-00000002rRW-0YhC;
	Fri, 09 May 2025 08:05:36 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIRy-00000002nkX-0oyh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:47:19 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-22e39ff4ad4so24835785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776837; x=1747381637; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+m4Z3dP+tM6YZb4FwYg8AZfxdm/iv45+PxfK9MWhRlE=;
        b=r4vNWlJ5V6OwCLukPxFX3FrYRUP4YGq3W/TDXsvMYRI/DZzLdZ0kcFq7GmqXsEX+17
         Du2S8r0RlNxFdmhCL4LMz8LwXmvkSfgzkFK8bBeh4VhZIQjeFKQyPNew9Nz7ON4oIMGB
         LWO61qeuWCvIxG1efL28cYCR12msgzxP1qyQsrz1wdDpAGqmgi7L1MOlNXxhWnyqRbAa
         lWjPjvl9UWv/aws+kZCACcz1WndX9vg8XxVL97Gy4GXT6hFiA/DkepvvqaWE7e5yNPCY
         a5P0Xe2TBwUFBiUcC7ioxW7ckc33DO3Av1cSZrXh12VRBIPttCLoYuaL6XiAp+h1XdHz
         QxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776837; x=1747381637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+m4Z3dP+tM6YZb4FwYg8AZfxdm/iv45+PxfK9MWhRlE=;
        b=CPutxZLveQQ03AYeZWGeiq6KyPiAGkIMoeRG+jDQwWUhMSc3UgijZhWCyYJM2U9plL
         ahCRhO58uQ4Ni9JKaNBdVnOEYNQ8gs2OKe+5yXzuXle1lm1OP77mfmp1rSVKACIFK7jn
         IsHo8V+QecZrdADT5Es/yyFQj+s8SY8evLX3+tpbk4/PDft3iALHh1mRNI7enErbBrs0
         odA/60tfpkQxJz+eZBocH83PiVLkpwnuuYmSSjCdKge6r8INjfl4jQs14ne0xRjvnVW7
         z+XCoCPaEL4CI1u8igqZosOE0y325Gm6NjfY6nwIoqQaGgrhtrsDIevHgXapmZ1DP1qO
         CmiA==
X-Forwarded-Encrypted: i=1; AJvYcCU505UTn8eHwkg9mWqNz3mTl2YUhfXpWZpT6GIHSp2xIhc5aFVs2cLVpCOJyj8EoD93tyVN+//OArc1LmL89iv7@lists.infradead.org
X-Gm-Message-State: AOJu0YxD0LUdkUg8f787F5yQb6mrECDfR0ivuAnW8UgYMwYOP+9FjCZx
	belq/odAZufXcZ7QHi34DxKalCgvqsmdUHBwYJR3/JSHi7AEI8C7xGBlcMLIs4D3jVsRnbC255H
	6CiPOaK+c/26lZOXQ/g==
X-Google-Smtp-Source: AGHT+IHfR2VcOxe89TQQkgMURCMNF7WAQ9A5nVl3ln2Y/iICrUYXCipTIhMpc5lhLO0v/RkcE3tO5H+jCjQrIWm3
X-Received: from pljs4.prod.google.com ([2002:a17:903:3ba4:b0:21f:40e5:a651])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:18c:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-22fc91a05e1mr34656295ad.37.1746776837245;
 Fri, 09 May 2025 00:47:17 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:30 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-13-changyuanl@google.com>
Subject: [PATCH v8 12/17] x86/e820: temporarily enable KHO scratch for memory
 below 1M
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_004718_242875_A4ABF8B2 
X-CRM114-Status: GOOD (  14.65  )
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

KHO kernels are special and use only scratch memory for memblock
allocations, but memory below 1M is ignored by kernel after early boot
and cannot be naturally marked as scratch.

To allow allocation of the real-mode trampoline and a few (if any) other
very early allocations from below 1M forcibly mark the memory below 1M
as scratch.

After real mode trampoline is allocated, clear that scratch marking.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/kernel/e820.c   | 18 ++++++++++++++++++
 arch/x86/realmode/init.c |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 9920122018a0b..c3acbd26408ba 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1299,6 +1299,24 @@ void __init e820__memblock_setup(void)
 		memblock_add(entry->addr, entry->size);
 	}
 
+	/*
+	 * At this point memblock is only allowed to allocate from memory
+	 * below 1M (aka ISA_END_ADDRESS) up until direct map is completely set
+	 * up in init_mem_mapping().
+	 *
+	 * KHO kernels are special and use only scratch memory for memblock
+	 * allocations, but memory below 1M is ignored by kernel after early
+	 * boot and cannot be naturally marked as scratch.
+	 *
+	 * To allow allocation of the real-mode trampoline and a few (if any)
+	 * other very early allocations from below 1M forcibly mark the memory
+	 * below 1M as scratch.
+	 *
+	 * After real mode trampoline is allocated, we clear that scratch
+	 * marking.
+	 */
+	memblock_mark_kho_scratch(0, SZ_1M);
+
 	/*
 	 * 32-bit systems are limited to 4BG of memory even with HIGHMEM and
 	 * to even less without it.
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index f9bc444a3064d..9b9f4534086d2 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -65,6 +65,8 @@ void __init reserve_real_mode(void)
 	 * setup_arch().
 	 */
 	memblock_reserve(0, SZ_1M);
+
+	memblock_clear_kho_scratch(0, SZ_1M);
 }
 
 static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
-- 
2.49.0.1015.ga840276032-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7064CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfJbN5pyiZqNm6v1VamUb2ZbseG+vyr/qmtYL/UOqAw=; b=rpIiaO7qlhecxX0G/GCIZXaOZ4
	paM6cFnrFw7RVz89rNImiFj99hw+WAm4IJpxEQsOg9j8jipC3eXjhvv+KHLF9MeXLTGqHvbJbLjMX
	aTXsmlTrlQOtx3XSnVQR4bJwawi5Psuqjgn3DzCtPxMX85y8HmB3lY026YB9ZmotRvP1iJy7Skpjv
	xI93nUvnxA5ciAUTMvY6NV2S/lDRG9M1UvgMXFYgcpqG1BX1Oaaapx7QuzNk3wJ58UEF768kdQbiK
	jePOrV5jDqa2q8WvTZU1woZUHVBQR1HeSPjxrq99dSBYAknCSG9MaYbbqBIQK3nCzMoYdJG9DSrqo
	KbkwizLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdAv-00000000Eu3-1Jih;
	Thu, 01 May 2025 23:18:41 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcoc-000000007Sh-15OM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 22:55:39 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-227a8cdd272so12786355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 15:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140137; x=1746744937; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QfJbN5pyiZqNm6v1VamUb2ZbseG+vyr/qmtYL/UOqAw=;
        b=w9HLtbfzjNhGSwh/y3rZNyJ+SysETBMIessb8KglUGrtpVxXJo3sGhRb0G+rHCDxqz
         gtmNzdn5ogPKX8lbVdb2DCTO3e1tzLheezn7si8sWx2mrjhxu93VH+RiJp9BzyqGRkRX
         hnfjjuOz2DTS3qb1wPXPZTMUdiAWtudS5W0vZPCXLo78uks3quhTit7ZZjR1SySUW48i
         2DCoygALHU0s61J0D2OEl8dQVC0m9UzWY8omKNI7fN0xB1YN7xZp/O11G4fKxKBYJPPr
         xf7b+a/oZBTLGCkzl6iyhA8As03uCLr/ijr26ue+0xvtFeXnR7EEA71nwv8mtpHiuHty
         M4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140137; x=1746744937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfJbN5pyiZqNm6v1VamUb2ZbseG+vyr/qmtYL/UOqAw=;
        b=QuAuheCkq0aQRvBv1plHpKVJJzpv/vCiou9eJZM5HcxUVJv54sdnaJOOajpjZa9UP2
         xZ0eZUmYocxN7F/SG+DoAv2ua6GrsOX16Ub/r4qoldaWss8MsTvcpX81HM2mH6npYVZh
         dve9+audmEeOXfRCeRA2B7BFZS8SuIs5Uxr+pQ9Z8XJ9tOxFIUuV4OmcMKgTYrk6fXjh
         0A6z94m+fTOhoUbmP8ot643urcOSSrNn0nkB0CpTLAUPlADiwGOWQtIht+/R1JZdHVQ4
         NZ3ctA1j/CgUxVxb+/bv8K6qIrn77iHUrshalUPjYc3UOzAy1LOdv+7c70CIBHot4RGW
         H3kw==
X-Forwarded-Encrypted: i=1; AJvYcCV95X4EcOP1AGTAzfdh2nemlKg3mDtHhQb3yC03tCfzDqJcvsFgFU4sP1ijmsK7+d9A2eVDzCIMMc4w0wV1I32U@lists.infradead.org
X-Gm-Message-State: AOJu0YzrkOtdsw4zX1ovE4B4sb15/bJQSS9H1pN7s/vS9xEcvJEjUCr1
	3aV6L0xW9AvmjQEGkcBCoXT1AM59TlmMhxMjDQFFXUqdYCPpdhRY7dkL45Xbdb2kiWNXd8+7RpL
	FKzKP+jp3SeptSp63Tg==
X-Google-Smtp-Source: AGHT+IEti7Jl7kPZOBgR2farF6AzrUQ71NZAgms5bozMIxOrugD7cn53XbT5cnCVAQHZeRCBz32iqnLauoNpF8Ul
X-Received: from plac4.prod.google.com ([2002:a17:902:c2c4:b0:224:2ae9:b271])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:22d0:b0:22d:e458:96a5 with SMTP id d9443c01a7336-22e103d0471mr10540035ad.38.1746140136868;
 Thu, 01 May 2025 15:55:36 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:21 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-15-changyuanl@google.com>
Subject: [PATCH v7 14/18] x86/boot: make sure KASLR does not step over KHO
 preserved memory
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
X-CRM114-CacheID: sfid-20250501_155538_290017_EF93B6B7 
X-CRM114-Status: GOOD (  17.58  )
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

KHO uses "scratch regions" to bootstrap a kexec'ed kernel. These regions are
guaranteed to not have any memory that KHO would preserve.

Teach KASLR in decompression code to only consider these scratch regions
when KHO is enabled to make sure preserved memory won't get overwritten.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/boot/compressed/kaslr.c | 52 +++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index f03d59ea6e40f..25de8c3e17cdb 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -760,6 +760,55 @@ static void process_e820_entries(unsigned long minimum,
 	}
 }
 
+/*
+ * If KHO is active, only process its scratch areas to ensure we are not
+ * stepping onto preserved memory.
+ */
+#ifdef CONFIG_KEXEC_HANDOVER
+static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
+{
+	struct kho_scratch *kho_scratch;
+	struct setup_data *ptr;
+	int i, nr_areas = 0;
+
+	ptr = (struct setup_data *)boot_params_ptr->hdr.setup_data;
+	while (ptr) {
+		if (ptr->type == SETUP_KEXEC_KHO) {
+			struct kho_data *kho = (struct kho_data *)ptr->data;
+
+			kho_scratch = (void *)kho->scratch_addr;
+			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
+
+			break;
+		}
+
+		ptr = (struct setup_data *)ptr->next;
+	}
+
+	if (!nr_areas)
+		return false;
+
+	for (i = 0; i < nr_areas; i++) {
+		struct kho_scratch *area = &kho_scratch[i];
+		struct mem_vector region = {
+			.start = area->addr,
+			.size = area->size,
+		};
+
+		if (process_mem_region(&region, minimum, image_size))
+			break;
+	}
+
+	return true;
+}
+#else
+static inline bool process_kho_entries(unsigned long minimum,
+				       unsigned long image_size)
+{
+	return false;
+}
+#endif
+
 static unsigned long find_random_phys_addr(unsigned long minimum,
 					   unsigned long image_size)
 {
@@ -775,7 +824,8 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
 		return 0;
 	}
 
-	if (!process_efi_entries(minimum, image_size))
+	if (!process_kho_entries(minimum, image_size) &&
+	    !process_efi_entries(minimum, image_size))
 		process_e820_entries(minimum, image_size);
 
 	phys_addr = slots_fetch_random();
-- 
2.49.0.906.g1f30a19c02-goog



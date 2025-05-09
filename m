Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D54C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uG6GiCi+k4QeVIeYPGdrcHOaMWapGzdHMs1nMnrsrc=; b=MkfkUExMFmI6698zBEFZnYOMCy
	G0dEu5vjGIV+zcHByKSTGV/k3G7xN7NT1uY4v3i6f/xP5g0IGUGdUIV0/LGRrjT9LJ/tVn0MJADnD
	HdnubIR/DEnhg1BtJtdbQG3lJn3lfCcgH/pBZsq5HaOqZ+YytMtRloNEf2vFN1/JKg7A45EHd/ux3
	YFI25dPpVwqW9QcV0NrBy2RsTtsjpgE3PIrPqdntjCIxU6aqhX4LVVz2iBGa2VyFNoMmJMBXVsPCG
	8qijUlJA6UAnWUZ5lYK0Wm5XztWIomgFIMguzIG7jw8iyqB0RFvyRIHDXfm62I8cmyfjflkY6M2kl
	a/n3ZvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJ1A-00000002v5g-37T3;
	Fri, 09 May 2025 08:23:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDISg-00000002oAv-2ixz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 May 2025 07:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/uG6GiCi+k4QeVIeYPGdrcHOaMWapGzdHMs1nMnrsrc=; b=EyycqWodYX+vOOdwVpdU7aigmZ
	OgosSzKdhRWC9Pq0SHvr4qJErEbx/NDg/Xo4syxnqmt2TRHxo/Ks+E9qQMbzTCrozMAMNbQL5leH6
	XwqPlmtT7sQxBy66r9aV9HyrROWiAiFlogegn8u516vVjq2WREj2hrtEZN5sEuvxF613TXJctV3/1
	ZcS1u4pndOLRDDyeK9eLxQqHD/6ZhYZcN7wWr0rffbKw7SfOVfzWgMjKrsLxG+iuhLeGQYA5+sjHR
	W9mQMHHhaZMuAAus1p2acPP6D395bthlHvHuEawHdrbyu5npoQx275x3jJK+Nj5qvSH9VpuVi6I+/
	COHnT1LQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDIS9-0000000GEg1-0Ixd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:48:01 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22e7f041997so29540635ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776839; x=1747381639; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/uG6GiCi+k4QeVIeYPGdrcHOaMWapGzdHMs1nMnrsrc=;
        b=0VxW7jO6oOdy90IZl/oN6P0RSLlulZxKlwhfvyDX6kqcxJ6KsMNLGPMjYvhUJ5xA33
         RCswHYZ8OwIJI5lZrviTjQLPzjzdEH66yQrWlKlO1daRs5erbbhnCMs3hLGNJd2V0VGm
         UDeMwzQ7VQMBFkxqFhOcqSSJdhhq4zXmGe8+TLrVZgr45ZzBPFrDDvlgiEcYtiqTn6tf
         6v86AFwWz3pOfNXeEZ1xe+0g0X9wVE5G0maMF0ANTQv5wid7o9ea22LPrL5h1blPth/S
         oT+JhXZn9btiUpbxzsgnJn5ibBOeYDV2lSYM5oDU8AuWMLrYxeTHWQskxPhw3XR0lVrr
         IF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776839; x=1747381639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uG6GiCi+k4QeVIeYPGdrcHOaMWapGzdHMs1nMnrsrc=;
        b=fJj7AsAQsXgv4xurVWD9K4M1MAIYtpOTexS76tjvPyPau3TtTeOSIPlgFeypz6UlwD
         IjrY4awoFqzwcxEtE2DdS518zbt5/6sB92AFmLNyCURd0novEKvgDBFXBsZYJmowW0Hz
         K1miNabzPLdOb8MW49+mZFczW3d39PVQ9F0Ue/FfGkQtQQm6QhikqfOMbSacX2EGB8lU
         drexSOiLYvKs1DLcyL0XMDP0lmlPjVhfpjlEeT/ziD7LtoOEVOkBksQAImzAJ8bkvkDO
         Ipg/nUYa89JkNA+cZz3sWpRF+6OCej1CM/KfDrHrR/4AvIxxwOc0qA6LFrw2sXIBayYq
         mf8g==
X-Forwarded-Encrypted: i=1; AJvYcCXxKt3q27ASU0SwFLCswbu0HY2jusSdvikFq8z6JGUk50yl5PBdA2WFU0p2CEDclaO+npTq9utnMFWnJ1RxVbH+@lists.infradead.org
X-Gm-Message-State: AOJu0YxDlBUgz5T+i1RfAY4+ZGMMNcKFhbVztmCQVSShjEbge/leRH5/
	f9Qka9mhdNiYSkAQwEVCJdWBqxJMt7yDz5SpnZQergBwvIgh8rxzxs5nrzN4IoV9S9mQ0JzYvE/
	YY3jhsj7xxH5WGXE1Vg==
X-Google-Smtp-Source: AGHT+IEtYvgMQD/fc6wFPgnt6KgYb8JeNInbNpZgGejD3McBZNxXkmne49Y8Hn9OW1r//Ao+vz75n4rLQVAMCRw5
X-Received: from plnr4.prod.google.com ([2002:a17:903:1904:b0:22e:4a61:5545])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3ba7:b0:224:c76:5e57 with SMTP id d9443c01a7336-22fc8e99d3fmr26734465ad.39.1746776839015;
 Fri, 09 May 2025 00:47:19 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:31 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-14-changyuanl@google.com>
Subject: [PATCH v8 13/17] x86/boot: make sure KASLR does not step over KHO
 preserved memory
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
X-CRM114-CacheID: sfid-20250509_084755_911417_13CC02FD 
X-CRM114-Status: GOOD (  21.98  )
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

During kexec handover (KHO) memory contains data that should be
preserved and this data would be consumed by kexec'ed kernel.

To make sure that the preserved memory is not overwritten, KHO uses
"scratch regions" to bootstrap kexec'ed kernel. These regions are
guaranteed to not have any memory that KHO would preserve and are used as
the only memory the kernel sees during the early boot.

The scratch regions are passed in the setup_data by the first kernel with
other KHO parameters. If the setup_data contains the KHO parameters, limit
randomization to scratch areas only to make sure preserved memory won't get
overwritten.

Since all the pointers in setup_data are represented by u64, they require
double casting (first to unsigned long and then to the actual pointer type)
to compile on 32-bits. This looks goofy out of context, but it is
unfortunately the way that this is handled across the tree. There are at
least a dozen instances of casting like this.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/boot/compressed/kaslr.c | 50 +++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index f03d59ea6e40f..3b0948ad449f9 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -760,6 +760,49 @@ static void process_e820_entries(unsigned long minimum,
 	}
 }
 
+/*
+ * If KHO is active, only process its scratch areas to ensure we are not
+ * stepping onto preserved memory.
+ */
+static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
+{
+	struct kho_scratch *kho_scratch;
+	struct setup_data *ptr;
+	struct kho_data *kho;
+	int i, nr_areas = 0;
+
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		return false;
+
+	ptr = (struct setup_data *)(unsigned long)boot_params_ptr->hdr.setup_data;
+	while (ptr) {
+		if (ptr->type == SETUP_KEXEC_KHO) {
+			kho = (struct kho_data *)(unsigned long)ptr->data;
+			kho_scratch = (void *)(unsigned long)kho->scratch_addr;
+			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
+			break;
+		}
+
+		ptr = (struct setup_data *)(unsigned long)ptr->next;
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
+
 static unsigned long find_random_phys_addr(unsigned long minimum,
 					   unsigned long image_size)
 {
@@ -775,7 +818,12 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
 		return 0;
 	}
 
-	if (!process_efi_entries(minimum, image_size))
+	/*
+	 * During kexec handover only process KHO scratch areas that are known
+	 * not to contain any data that must be preserved.
+	 */
+	if (!process_kho_entries(minimum, image_size) &&
+	    !process_efi_entries(minimum, image_size))
 		process_e820_entries(minimum, image_size);
 
 	phys_addr = slots_fetch_random();
-- 
2.49.0.1015.ga840276032-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37831C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lv1l1I9z2A9RMTDP3pEjoh98A/jPPW1Y8prl67P6/Ys=; b=Qd7Y3qOWSkr+DLtUR7VBcwd/f8
	xzSdIEHHEzfZWvx03PtBuxBqpyqE8MGVHagO8i8kfY1TNI1LK6SZf9oZBLgDft4Clac9HFE8D01tC
	wBSE7KTteMIqSMceAIT79iOd1u94DHD6hbIkpzqXbdZq7UWsj69aoawgMJUehEJ6OxoXDX8bD0qWj
	uhPC8Ai3qm0aQ223S3csJLyTt0meT7DfaccPlpBjYTfHAinS9GBTNTgJ4iyYzk+HT4X/hmp8fQqKX
	YGKG9rzVAN+a3bNT4cDiv9ZjpPnsctEu0L+A9dkg1TJTsb5frxFxW9fl5JfLYkAmDJuY2gT/MxPVG
	C4loeK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37Pb-0000000Ce13-3xiH;
	Fri, 11 Apr 2025 05:58:47 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3767-0000000CYbm-28Nq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 05:38:40 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-306b51e30ffso1446477a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 22:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349918; x=1744954718; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lv1l1I9z2A9RMTDP3pEjoh98A/jPPW1Y8prl67P6/Ys=;
        b=n/MJzTP1BLfxHw/uk9sxKKV3h9bVMHnrUBiZ0e9GYVoEhhYvJoB/aD1IJLH11G4m9D
         0G2tU2SsejArmbh/3MJRZyvBAAjHkb/c2o47DKvvdyq/GbI5f07DL8p9Df2YrRCw+AUX
         ysMrUEGeYfPULf8ThD0C/sC2HBbjb9PnG/gNqupUBuba0IS9rp6J+EaBuhPTWAR5rXGP
         y0aR25w/JtP/AZp84md4eJX2zxrhTtKyccBlS1p6nuSF/fECXAq0tDYRBPshw/jYPQbt
         lEZ6U15w3T8bFOuYMTnc2/ePhPCzPIxdnd6hn8v59QVvhEyG0vxB0G7DrPd8PznG/lwo
         lZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349918; x=1744954718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lv1l1I9z2A9RMTDP3pEjoh98A/jPPW1Y8prl67P6/Ys=;
        b=UPs52LtoMLfW/Dpx64H04BBYXg6L6RYcSSgUcrZHFi0tzbWfYDuurehLcsy3VHCZnP
         1OJHu2I2MAQnPrH0/yP06alYLzOEeXIYdxCXpToKfZTs6IdyJk7v0SCoduwAca4KIEFS
         +sDVDBdWIpRGF78zRcBkwgtoAP204UM5LMz7wP87I0UEZbZ9S6ozqV/ricDMbpgZOfWK
         8WqMVGSlLdmLRYoAH7P65mBp+2OOum8bVYZx/6A3CMq474S6ADRFEyzHbYiCynvg3B+J
         8QsuEgiccOi7hGlePRjUdtJnnVm4rCD6+9g9QF3lt7R8LOQPbpPIHzhBpvqKuIORojRa
         NgKg==
X-Forwarded-Encrypted: i=1; AJvYcCWnmqNU7yhYraN/BfgmeoHysmtYR/wQtBwCszihvpEAKUt6LuZ/3TtauT3hzNJg0yJ9jqG//1S5xgj5d6pMnGum@lists.infradead.org
X-Gm-Message-State: AOJu0YywfteqQpXTdBzl5pTsHTeBNC6xtbUjh+7dH7VEZpgeAgOyZYQG
	5wEuhRdfZWoqmdiE+ncfi3w/TrsVccqW8TnDIoE0S/wka/3DjWBvxl1sFQJagiTZt0hWX7UvFQO
	/hQaPugLInRVJNVQNdg==
X-Google-Smtp-Source: AGHT+IFDqnNrJ1yb2xJtOtea7MkZiHxum/paNcnypq1SzNi+wbhuEeT68KNiC92Vyv1O3vh0BoBg+A6LFRWhbKjQ
X-Received: from pjc12.prod.google.com ([2002:a17:90b:2f4c:b0:2f4:465d:5c61])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:274e:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-3082367024emr2450558a91.9.1744349918309;
 Thu, 10 Apr 2025 22:38:38 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:41 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-11-changyuanl@google.com>
Subject: [PATCH v6 10/14] x86/setup: use memblock_reserve_kern for memory used
 by kernel
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_223839_555193_0CC4BABF 
X-CRM114-Status: GOOD (  14.55  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

memblock_reserve() does not distinguish memory used by firmware from memory
used by kernel.

The distinction is nice to have for accounting of early memory allocations
and reservations, but it is essential for kexec handover (kho) to know how
much memory kernel consumes during boot.

Use memblock_reserve_kern() to reserve kernel memory, such as kernel image,
initrd and setup data.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/kernel/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9d2a13b37833c..766176c4f5ee8 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -286,8 +286,8 @@ static void __init cleanup_highmap(void)
 static void __init reserve_brk(void)
 {
 	if (_brk_end > _brk_start)
-		memblock_reserve(__pa_symbol(_brk_start),
-				 _brk_end - _brk_start);
+		memblock_reserve_kern(__pa_symbol(_brk_start),
+				      _brk_end - _brk_start);
 
 	/* Mark brk area as locked down and no longer taking any
 	   new allocations */
@@ -360,7 +360,7 @@ static void __init early_reserve_initrd(void)
 	    !ramdisk_image || !ramdisk_size)
 		return;		/* No initrd provided by bootloader */
 
-	memblock_reserve(ramdisk_image, ramdisk_end - ramdisk_image);
+	memblock_reserve_kern(ramdisk_image, ramdisk_end - ramdisk_image);
 }
 
 static void __init reserve_initrd(void)
@@ -413,7 +413,7 @@ static void __init add_early_ima_buffer(u64 phys_addr)
 	}
 
 	if (data->size) {
-		memblock_reserve(data->addr, data->size);
+		memblock_reserve_kern(data->addr, data->size);
 		ima_kexec_buffer_phys = data->addr;
 		ima_kexec_buffer_size = data->size;
 	}
@@ -553,7 +553,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 		len = sizeof(*data);
 		pa_next = data->next;
 
-		memblock_reserve(pa_data, sizeof(*data) + data->len);
+		memblock_reserve_kern(pa_data, sizeof(*data) + data->len);
 
 		if (data->type == SETUP_INDIRECT) {
 			len += data->len;
@@ -567,7 +567,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 			indirect = (struct setup_indirect *)data->data;
 
 			if (indirect->type != SETUP_INDIRECT)
-				memblock_reserve(indirect->addr, indirect->len);
+				memblock_reserve_kern(indirect->addr, indirect->len);
 		}
 
 		pa_data = pa_next;
@@ -770,8 +770,8 @@ static void __init early_reserve_memory(void)
 	 * __end_of_kernel_reserve symbol must be explicitly reserved with a
 	 * separate memblock_reserve() or they will be discarded.
 	 */
-	memblock_reserve(__pa_symbol(_text),
-			 (unsigned long)__end_of_kernel_reserve - (unsigned long)_text);
+	memblock_reserve_kern(__pa_symbol(_text),
+			      (unsigned long)__end_of_kernel_reserve - (unsigned long)_text);
 
 	/*
 	 * The first 4Kb of memory is a BIOS owned area, but generally it is
-- 
2.49.0.604.gff1f9ca942-goog



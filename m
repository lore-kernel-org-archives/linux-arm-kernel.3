Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCCBC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPB4CC6STDK5kdrBEcCYHTnvRNdt0f3J8K3gkRMCX5Y=; b=1oqr12JSqONSD4luvcuHApZV4T
	2KVS6O2a7yDnissyE42vaRdd7PqEH9lfivZrzKE267mnKqDcjd5RifJxmIDlMpXL/3f4ZbR5K23YV
	dj9J/rUo49iSaNakpmYiDXWE6fFVjueEOY+HasYaGCfXis2cDWPpE6vNj0XY/VOdqPMLLCMu0qjei
	n/mpVrLkG1uulJhJxPWmvydrR3KpMAo1EkGc+DHu6CIfEd6hrkB7P9oiDLMT7l/ZuK/RN9A+hoq2U
	Ol7MwWA+Pa1PLahZWmG4b0wql7iSBHprbrr5pT18OarT+Ip2e2lMmSX4LtQqIH/itJxJQhE81h+F5
	ZO7nQVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIfn-00000002qvY-1OW0;
	Fri, 09 May 2025 08:01:35 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIRu-00000002ngq-1dz5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:47:15 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22e6c82716dso13925935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776833; x=1747381633; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPB4CC6STDK5kdrBEcCYHTnvRNdt0f3J8K3gkRMCX5Y=;
        b=4BfUecd3V47hHzL7uJRpV2ukyU9FRA2e8hkddk5KhpUZlqAhU40YtFpUtveDhTD2Te
         mBXRYLk9ei26gmx+BC23z6alStbov7+wR2bNIIPZd98e2Kq3j05JYEujpMh9uH/0r/Kr
         L3UqlpONokULptSJrDO1sS9oHskZVBrJ68v6xbTCNx2JPNu3cbv8mH5SSt8KWbROKJwn
         h9JEPquOF28l8AX4hbGrizHYpZWCQ83Sg+HkMK40RU4ETgEDt0j5AtzI9Mge9mmWsgQ3
         Imx1hZ/y22lyCCAl8q6esuukD0/1vs1tHfdWaLYqwpZJrlCqiQ3R6DeIQBR4sLS6VuTv
         nYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776833; x=1747381633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPB4CC6STDK5kdrBEcCYHTnvRNdt0f3J8K3gkRMCX5Y=;
        b=VPvvulgcqu+eVg7RPcNqPMEP8plkn7j5vIQzQP/Fj0Swzh3tq5W1zOG+eZIaRg6vPg
         c/26jAj/L3Nprxu8Oo9lOgsHq3yLthpcBy3++HOjNhFPnQireSojw6NC/78nTqxR3dvY
         MHqn+rOMjirZ/pWz1IIqiCD0ukCkJwIUIuZGscKwefgV86lG3RB5sWzoDReoAe3y2rPw
         fOjfpsTE24tBP+1qoQIqXDWgcs+zkTiL2dh+ZCT+qcC6FS0kWopqMIa/cSS5V1LP97jy
         PlRvhm236c4w/rqZWcIK5XVJHQg37FWg97DEU2Nmk7vr/mtGay1y7Fz07dFWgNNfO8XM
         tTow==
X-Forwarded-Encrypted: i=1; AJvYcCVZbxDT+LmDx0lAII3xsYmPAsKgBFK1InCzDeYCKfCuOxmGrA8MF+6kgwHcD+/eCUnhmrtx4iZY6WCNb3x/8iQw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx83t08GF49rk9BBh9PRocjOvfWePT0+EVPj2mc8Qa1lDGtwtpc
	Di7diborofNEUjwaO4vL47F+xCIDaPmlZTwIvxpi0cLB3xrKLrqwKby8NBCgswV0aV128YwFAf7
	r2Spwl1lAmQLWSmx/nA==
X-Google-Smtp-Source: AGHT+IFCD03lD8lWtCnQk0Y+4Q0M0617vfZrCF/OF6DrxVEuOIUh/cKjmOGrlsTtuIki4lqztgFf3ollX+1yRnV1
X-Received: from plbp12.prod.google.com ([2002:a17:903:174c:b0:227:e538:4d17])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2311:b0:21a:7e04:7021 with SMTP id d9443c01a7336-22fc93ef210mr32126535ad.24.1746776833152;
 Fri, 09 May 2025 00:47:13 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:28 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-11-changyuanl@google.com>
Subject: [PATCH v8 10/17] x86/setup: use memblock_reserve_kern for memory used
 by kernel
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
X-CRM114-CacheID: sfid-20250509_004714_441703_84C3D497 
X-CRM114-Status: GOOD (  15.20  )
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
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
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
2.49.0.1015.ga840276032-goog



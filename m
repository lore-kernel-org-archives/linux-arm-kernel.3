Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC56E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oyUT95EuUpMVYWFHvLeSjYpdN5muc9dJ7KV23iCMuyE=; b=imnZS378NzQymVkvAAJFhGo6mZ
	3nYsl1dhA7ZwDJwGogsAuxJbzxqXgeSmG3lH2YP+4jw/j4AKLb3VBlYElHEEoH/7oJrW6uSNdUat1
	o9Q/FKVhtaSBt/6IiBEh4G9tj0rqSweoSxXe8ZSkIEVfenhBnlA4fBwUe6eSI722pY/iisCqO8XNY
	kU+GVNtppq/etnZ6vBdk2WhwYFL7aC5/BKbYxeN3m1KPgFsVQlfuF8swocWahnteOP9hrh6ELK45R
	7SZnLkcjip/mnMUwo3vjrVWQZRAYMHFc4iVszOQWVMJxltx+mOhMuX3Vf2m90HU0eplToAmYknnlB
	L8dSAfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uCu-00000007bzt-0iUv;
	Fri, 01 Nov 2024 16:09:04 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6u2K-00000007a4c-4BQZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:58:10 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e3705b2883so46508047b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730476687; x=1731081487; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oyUT95EuUpMVYWFHvLeSjYpdN5muc9dJ7KV23iCMuyE=;
        b=rwWSeJ71fw8kCyO0Oue5dOluonGQtrqP3wIptS0OGCiUvqulofZPvCHXRasQGoW2d5
         fVB6sNX6jwuSitoprko1ooqUOIcp4iMEav+WYLZEfoxDRHO5oOQzQVPGUkcP6dAv96jr
         rpf80SWGAVL7XW2XTyD9hZsDoIO35Qd9uTigQNQCNn+vq0W+S+z6Evz2Z0SITfYeOeiH
         DcOpx8mvDMbR4l1Wn69EzI7TuLzLBCNBby/pm3kq1aZ275I4mn7QvmkWKhbQOM/1KYhB
         h5fBMeo7IWWHNSt//s0kJccpRhxNqZ0DdjW2wBLnhfUr3Vv2qrA34bzNrV+0oj9eB6GM
         hoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730476687; x=1731081487;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oyUT95EuUpMVYWFHvLeSjYpdN5muc9dJ7KV23iCMuyE=;
        b=jUrTaudpD4LeBX7I8ybnsBuhkCiMqTt49LdxclVVR+GRRwLs3cQgEpog5y/GDZBd6x
         U/qjTq41lx8Oo6DINRiA0OOoaaDjzfrOiFy9P9iK9jAD6iZ/3+KWeR0FduLHrzzUvpb3
         sHmoVgNpRn7dFr/yFSzcBVl2BfnDmaiNQ6GGo9fwiQOjaZ6cm/7g1g1mvX8hUXctyuS1
         45Ru724UHXkBJc3qDj2TRe/rk3Y3vtFvJ/xeEpcdwQXZ6RSHSurTQt8Gu9wc8PWhYprh
         8/F/VDJS+jnqjnOTTA5eLlLlyaZzHwVpIzZhuYohNrRg6Rnze+RrYJ9DWA+eSvt1aqAH
         NLdg==
X-Gm-Message-State: AOJu0YwQmehhmX0rBrD8PEFcGUeUYqBExTVNcg/gyj+HGTsmWztBWiaj
	ioHGbTEEGXhUoqsVoL7M7HX32prEenYHtdtM+cP9nH0GBSCpOYJCXptw8L1aq4jWSlDIHYLwiqZ
	yW7z8Xs0A8dmp79SLq3psGZHnXY+JXFFyWUTv3jjFxiRE9MltXtnMVGvHC8O4DQ3Z62+4T2NA0B
	j4nawwfPNvsWLKvMaQVfcljOLnDKBJxNUnf+sRXC+p
X-Google-Smtp-Source: AGHT+IH4rH3/5E3wsb54eZRTd0xDtlcy7agYwSuCT6LbBqH5Kv6P5lpOtIp5b7K9df5PQjn/0PAiTt6X
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:4484:b0:6dd:fda3:6568 with SMTP id
 00721157ae682-6ea64b8c23cmr264247b3.3.1730476687224; Fri, 01 Nov 2024
 08:58:07 -0700 (PDT)
Date: Fri,  1 Nov 2024 16:58:01 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370; i=ardb@kernel.org;
 h=from:subject; bh=oqSyEdlEtA27lHga3c+FESW1uvG/ZR2Feioohxm2Vho=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV3lV6fBvh0fJHiMg3q37o8tYdLVDGi+f3IZ79Zv6U1Ri
 8rTfJo7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQikhn+h+q4XDxfxuvxY25e
 umzNQ57V7D8eFCt0LJj9R9/udWkAJ8MfXuH3ujdStRz++j94fnJzcJG3Wt0fsetvkk8odSj3y1s yAwA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241101155800.3917462-2-ardb+git@google.com>
Subject: [PATCH] arm64/mm: Sanity check PTE address before runtime P4D/PUD folding
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_085809_065378_7B38A90F 
X-CRM114-Status: GOOD (  14.63  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The runtime P4D/PUD folding logic assumes that the respective pgd_t* and
p4d_t* arguments are pointers into actual page tables that are part of
the hierarchy being operated on.

This may not always be the case, and we have been bitten once by this
already [0], where the argument was actually a stack variable, and in
this case, the logic does not work at all.

So let's add a VM_BUG_ON() for each case, to ensure that the address of
the provided page table entry is consistent with the address being
translated: for user space addresses, only index [0] is valid, given
that all other entries translate to addresses that are out of range. The
same applies to kernel address, but in reverse; only the entry at the
very top of the page table should be addressable when the level in
question is being folded at runtime.

So after subtracting the sign bit (-1 or 0) of the address from the
index, the resulting value should be 0x0 modulo PTRS_PER_P?D.

[0] https://lore.kernel.org/all/20240725090345.28461-1-will@kernel.org/T/#u

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index dd5dcf7ae056..0d729adf894c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -740,6 +740,11 @@ static inline bool pud_table(pud_t pud) { return true; }
 				 PUD_TYPE_TABLE)
 #endif
 
+static inline long sign_of(unsigned long addr)
+{
+	return (int)(addr >> 24) >> 31L; // bit 55 is the sign bit
+}
+
 extern pgd_t init_pg_dir[];
 extern pgd_t init_pg_end[];
 extern pgd_t swapper_pg_dir[];
@@ -932,6 +937,8 @@ static inline phys_addr_t p4d_page_paddr(p4d_t p4d)
 
 static inline pud_t *p4d_to_folded_pud(p4d_t *p4dp, unsigned long addr)
 {
+	VM_BUG_ON(((u64)p4dp / sizeof(p4d_t) - sign_of(addr)) % PTRS_PER_P4D);
+
 	return (pud_t *)PTR_ALIGN_DOWN(p4dp, PAGE_SIZE) + pud_index(addr);
 }
 
@@ -1056,6 +1063,8 @@ static inline phys_addr_t pgd_page_paddr(pgd_t pgd)
 
 static inline p4d_t *pgd_to_folded_p4d(pgd_t *pgdp, unsigned long addr)
 {
+	VM_BUG_ON(((u64)pgdp / sizeof(pgd_t) - sign_of(addr)) % PTRS_PER_PGD);
+
 	return (p4d_t *)PTR_ALIGN_DOWN(pgdp, PAGE_SIZE) + p4d_index(addr);
 }
 
-- 
2.47.0.163.g1226f6d8fa-goog



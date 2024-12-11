Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6E8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=; b=N05tkegK3I7Nav1IM1m3Y7uA5R
	k2LRPH0DIrJ4zpWcd9peQERvyCGDwOXiXlXNMTl484pYpc4E6wVs4On6Q0gDAW6veGyYwmbnx8e9n
	6afBT66xcg5+9QwkgieX5FCcoNuUpIXTGWsRZsieSXFg3C5Ts9bKelO68vISjbiLxYgeJtRRsPW9O
	YgDZhMNYiEMWnIIAMrQMDYjtJWBUYXsS0M/v67onp1ipeT3d+FWzDRv1lpy6QwSiCOXxdYQRnH0HX
	KoeUioHkDX8/22ESmjX/rqoZeQmoBeKNXQvC3p6qMOeRL++e+IuDjRDoqjEkn+n2NeQEcpK/WPzOO
	f+O9KVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWCo-0000000GTtf-48Ht;
	Wed, 11 Dec 2024 23:33:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7p-0000000GSXD-02ov
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=; b=p5OwmKIuN8VcijgOsSxQRKoX/B
	MZaZ9fxeCqZGEdQl+OajlodGNdRnErxAoaHZN4g59tjOBRA9nw5hcyY98pyTo+lzOs8nvYjMiI3km
	zDJMvW0Z4B+oOZsCbsc6crEO8os3cljlV34tEYsfcyd6YC9cMW377xdGDNd6fucvo1qe/fAZ7m/Ux
	+SGdzlmWYseTzkUtrM/pUqw9PZ0kerKA/BhfTv/eEJ43Nwz+Y65tyDE7MoVjbr6fuA6LAiKW2boDt
	us0VAn9F9zkoFkvGL8Y9DP7tC/jjZxwJPnS+9nyN8s5/YIxfFR86CEkPnTB8NZYWHWAAmC8XEszEv
	2qkcR9KQ==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7l-00000001eK2-3FeR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:11 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-728efcaf454so14860b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959686; x=1734564486; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=;
        b=xgDGUgyKboK7D0b3t4dgs6q99P65HPzaq0vFlrwRRovWD4Sl1lc1l4v7FctgCWukH8
         EnOkMSgDy2HNf4Yd6RffvvF4ihn4DfwTFE5OS6sFlwte1ZgskZeVPcBfdnqWFEkarXX8
         vWPZxbzljyvR3WUr0lWoHFh9iuSaSuZEOYDVo01hxcrYgVrJNkagPTik7Cc7QGP0ZgKA
         xhu3s/8icocq5R3Sk2GlwX1NOOiNT/QAc0ozhejIZ3LuXxz/+AgAO1MxJNnhSCCkcqdG
         /S0OhyoolpOpllPSWCAyTUhStyUuzghOFvnb4LDsZ1m+fzXOKLhiVTWXtpMpAUP4CKdz
         M8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959686; x=1734564486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=;
        b=kLFfGPYwGdqdwBbSjATM1h9hR3d/isMRWjEH27eOXxQ6ORtwlijwQHmuCnVn7CgjXl
         RAJJC1uew0YrAHRJu7Wm0TmJuSG9Eje6R2AmmPbM2byjkiz5ugJ0+B8pHc4iX0Rk9Kd8
         JehUiaVpcaV9o6q2GDDW8uIQXqKAWixBiUXRMhuJMGxULVf26kHu1mw2ORGCnsxX/dqP
         YLJhiUEv88xiLkUd5vpzY/1H3S5b0iOQO2O24g86sWM1yvNZs3MPynafdX9p4zUksk7E
         OYYeyPP3JRyUorO0bsf6BJkbD2q4doKZPRNGXRKQjOpNA4gfGRHA4kSvpPNLrhKwg2Ty
         KYug==
X-Forwarded-Encrypted: i=1; AJvYcCWh7SBBoCtUgihtI9UZuon1TrGEWN2G9UNGKNeHQzVpon8bDYPwVh/vmT98UZk4CHa3pd9rkXD7mWOhjpkuN3VU@lists.infradead.org
X-Gm-Message-State: AOJu0YyEh+Vdc0Wf0TBFxvcZFHThsJC3qkk6bLHojzwg3tFrGBxc+b2v
	ff6vEC7Uh4qEWlHqwJE4VQx3FjMcSGFvjI98k1959y/KhpWKY8WnlGSJxoaLjH1kF3q030oENar
	78OsiCX+W+NX9gpHPHZmlXg==
X-Google-Smtp-Source: AGHT+IGKKVpJDJ1y2ylGaA50Z43wv3+APAJV0fjiCw5ytHmnD6GxlKgAyJQZQRFGHnrCD199ncZRE2+HH1UPCzOgAg==
X-Received: from pgbfy22.prod.google.com ([2002:a05:6a02:2a96:b0:7fd:4739:79be])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:328c:b0:1e0:c56f:7db4 with SMTP id adf61e73a8af0-1e1cea71c6cmr1602899637.2.1733959685721;
 Wed, 11 Dec 2024 15:28:05 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:42 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-5-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 04/16] mm: alpha: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_232809_874178_C1F1F44D 
X-CRM114-Status: GOOD (  14.25  )
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

Introduce alpha arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - Consolidate error handling in arch_mmap_hint().

 arch/alpha/include/asm/pgtable.h |  1 +
 arch/alpha/kernel/osf_sys.c      | 31 ++++++++++++++++++++-----------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 635f0a5f5bbd..372885a01abd 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -362,5 +362,6 @@ extern void paging_init(void);
 
 /* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _ALPHA_PGTABLE_H */
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 86185021f75a..308f832732dc 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1225,10 +1225,9 @@ arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 	return vm_unmapped_area(&info);
 }
 
-unsigned long
-arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		       unsigned long len, unsigned long pgoff,
-		       unsigned long flags, vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
 	unsigned long limit;
 
@@ -1241,8 +1240,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > limit)
 		return -ENOMEM;
 
-	if (flags & MAP_FIXED)
-		return addr;
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long
+arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		       unsigned long len, unsigned long pgoff,
+		       unsigned long flags, vm_flags_t vm_flags)
+{
+	unsigned long limit;
 
 	/* First, see if the given suggestion fits.
 
@@ -1253,12 +1259,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	   That said, I can see the use in being able to suggest not
 	   merely specific addresses, but regions of memory -- perhaps
 	   this feature should be incorporated into all ports?  */
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
-	if (addr) {
-		addr = arch_get_unmapped_area_1 (PAGE_ALIGN(addr), len, limit);
-		if (addr != (unsigned long) -ENOMEM)
-			return addr;
-	}
+	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
+	if (current->personality & ADDR_LIMIT_32BIT)
+		limit = 0x80000000;
+	else
+		limit = TASK_SIZE;
 
 	/* Next, try allocating at TASK_UNMAPPED_BASE.  */
 	addr = arch_get_unmapped_area_1 (PAGE_ALIGN(TASK_UNMAPPED_BASE),
-- 
2.47.0.338.g60cca15819-goog



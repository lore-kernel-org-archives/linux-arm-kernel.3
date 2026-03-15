Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5714B10854AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 00:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XpbOikVku5YR5vNSA6pCrMtta1WFwEavqnarNyqEQ2k=; b=sAaWRshknxzBjGkZhusoiG412w
	6mOTbVfZZKsr2NKjV4bojbgi4kr3H8vQ4T7CRzVCJZShTmKp6fms3PfU2fopeDfRVddUr/nmuEx33
	T0D6XDfH/FSSPUESPTaJ2ag5EpLFnef+9S54+rd2ZPXgu/xiGuY8ocwEFIAA5GUwof6oDuFVSU27k
	4ZJfhkBXta4MA1cUVTWc+dG/y3+OCQcTzqUuUelY3wpwEasSt1fp5+Yu2qmZvSe9s1/rbiCej+w8Y
	UniLDXiDQU2QKqUoa879DrgJcii7V0uu0NQINCSZC+NYZN/cLrEp47hu6ha20DT2oY0GVfRR8cj+5
	+4zJXu9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ZgI-00000002HGK-32Mx;
	Sun, 15 Mar 2026 00:50:10 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ZgF-00000002HFw-1C6x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 00:50:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c738aa3cbbcso2538967a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 17:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773535806; x=1774140606; darn=lists.infradead.org;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:mail-followup-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpbOikVku5YR5vNSA6pCrMtta1WFwEavqnarNyqEQ2k=;
        b=U42fR+WMtZKO7F+mVWhUC/Rr+2MwjH/EK0lLa2tsmUqQITnYm239u5MjAKriAdp45k
         TcvTtdiQU78JGbatXC4Zd4A6OjJkBQddzRbiYt0i9TTHfSnbtSImXaAFp0lhsNvRDzvK
         vmMU6C1xO8/RiTjnORnyRCnqm92P+Q/KWi/lamYjTi6TppY/4NJFyIdltTyPnIiTPBFv
         XorFdYfObh70pdJSfzxltkfWsFwP0/d0RcZ4w0wx8/S+H+h8NU2vK+L3VWsiEK2nAYT+
         oKwGNzhqDQ9a46grHW71VtrFLaC5XUbl5f4ATJI2cISnNNm5rMJY5QGzykG+ReY5mQ3V
         AToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773535806; x=1774140606;
        h=user-agent:content-transfer-encoding:content-disposition
         :mime-version:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpbOikVku5YR5vNSA6pCrMtta1WFwEavqnarNyqEQ2k=;
        b=Ty4QtUKTHZYZ9rceSPx4rx1maJ/l5Ru4e07FBXmcgkDI+PLwpBZT08S/HPrRw3tQ2X
         pRy9fN1tTTMkhOUwUMWwE57BAypq3DjYirOOIvQ59GQbF3gEEuTWq19ZYdWyXOkx2tQ3
         n2efDlbTjwRgRUOpdfeC2JUFyIY5VHLaq85kuHlWv+c61kaiEoO3cADr3u0Vbbz4wDDI
         7xIN6XUysGt4wAVdd3+CvquAE+Jfj/Ed7UDOD6KeV2Ysbaq08b8Jt9ldd+SmITCMD3Xj
         xWyq/om5DQ0eVCTkTEg92qdOnPZt5P62lUlATCnY81piejDDn4POMOfcd1E+m/pJo1gV
         YBxw==
X-Forwarded-Encrypted: i=1; AJvYcCXuex69DHukAF/haFFKFMCzJ4Fhetqe3ro/h+vwdsUbfmyowztE1OcjABp1hNDcEsjBJPs2YMXorfXpH1YHYGtN@lists.infradead.org
X-Gm-Message-State: AOJu0YzoNoUl7/ILTauBxBhqMZYG+ytM0/G6oxqauyep/A3XjV72IUOQ
	4SH8Ww3H9UXUZfrTaA8tVW6DSd6N+4x3Ubqpzjuy4FtbhaATK1m49Zht
X-Gm-Gg: ATEYQzz+6jy6v1oJnm4X0vDbfRyQMaFirpE+aA7dYld/AtOvIgz3z4prtdt/g293VFP
	SyEB+IFOLk3NYo5xt3K4hgq0Bh6+0v6l9eaVuSYhiuOCczuw+hTzmGkXGBrm1NRJ//S0re/tZyi
	GB1k3shWkVWjJp1I3svp2p69pEg1ytqKMBjJnKL/UV/Vc7n1Zzad1laJDyC0VMdcjoBfrqVUe4y
	+gt+xAbLbkYqjokxy71wpKKAiJajVxiJ5Z21ya3+mzKEUuUe1kVnLdAbC5zh/ZETthyj0UALI7c
	pAAWGNTPPuSzGqlxO7bs1CDe2xiADSFaOdcb9kub7dvL+ZXWVc+b9vgaF0X2TWxlN1BqXFGU0PR
	KcjSBqBc/X8SEG8L/5Nipc/iJ5iql9GbI9aJTL6SePX6CsIxyzNMg0sqLvGPOto9gr8hngpCTBC
	zo+YQUaShRcKKeNv3vg0BhZEu0gza5a7uP6Jpe+JV1
X-Received: by 2002:a05:6a21:3212:b0:398:a6d4:dbf7 with SMTP id adf61e73a8af0-398ecd98afbmr7285057637.55.1773535805842;
        Sat, 14 Mar 2026 17:50:05 -0700 (PDT)
Received: from udknight.localhost ([120.36.202.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7402214e1csm66228a12.33.2026.03.14.17.50.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Mar 2026 17:50:05 -0700 (PDT)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 62F0lmet032279;
	Sun, 15 Mar 2026 08:47:48 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 62F0lkjo032278;
	Sun, 15 Mar 2026 08:47:46 +0800
Date: Sun, 15 Mar 2026 08:47:46 +0800
From: Wang YanQing <udknight@gmail.com>
To: linux@armlinux.org.uk
Cc: akpm@linux-foundation.org, willy@infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm: lpae: fix non-atomic page table entry update issue
Message-ID: <20260315004746.GA32062@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>, linux@armlinux.org.uk,
	akpm@linux-foundation.org, willy@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_175007_835191_CB774C27 
X-CRM114-Status: GOOD (  18.09  )
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

The ARM Architecture Reference Manual explicitly dictates that writes of 64-bit
translation table descriptors must be single-copy atomic:
ARM Architecture Reference Manual ARMv7-A and ARMv7-R edition (https://developer.arm.com/documentation/ddi0406/latest)
"
...
A3.5.3 Atomicity in the ARM architecture
...
In an implementation that includes the Large Physical Address Extension, LDRD, and STRD accesses to 64-bit aligned
locations are 64-bit single-copy atomic as seen by translation table walks and accesses to translation tables.
Note
The Large Physical Address Extension adds this requirement to avoid the need for complex measures to avoid
atomicity issues when changing translation table entries, without creating a requirement that all locations in the
memory system are 64-bit single-copy atomic. This addition means:
•The system designer must ensure that all writable memory locations that might be used to hold translations,
such as bulk SDRAM, can be accessed with 64-bit single-copy atomicity.
•Software must ensure that translation tables are not held in memory locations that cannot meet this atomicity
requirement, such as peripherals that are typically accessed using a narrow bus.
This requirement places no burden on read-only memory locations for which reads have no side effects, since it is
impossible to detect the size of memory accesses to such locations.
...
"

ARM Architecture Reference Manual for A-profile architecture (https://developer.arm.com/documentation/ddi0487/latest)
"
...
E2.2.1 Requirements for single-copy atomicity
In AArch32 state, the single-copy atomic PE accesses are:
•All byte accesses.
•All halfword accesses to halfword-aligned locations.
•All word accesses to word-aligned locations.
•Memory accesses caused by LDREXD and STREXD instructions to doubleword-aligned locations.
LDM, LDC, LDRD, STM, STC, STRD, PUSH, POP, RFE, SRS, VLDM, VLDR, VSTM, and VSTR instructions are executed as a
sequence of word-aligned word accesses. Each 32-bit word access is guaranteed to be single-copy atomic. The
architecture does not require subsequences of two or more word accesses from the sequence to be single-copy atomic.
LDRD and STRD accesses to 64-bit aligned locations are 64-bit single-copy atomic as seen by translation table walks and
accesses to translation tables.
...
"

To archieve this 64-bit atomicity on a 32-bit architecture, the linux kernel relies on the STRD (Store Register Dual)
instruction, but the copy_pmd() in pgtable-3level.h is C code, then compiler could do very crazy optimization for it
and generate code that break the atomicity, for example, we get below copy_pmd() assembly code with gcc 12.4.0
(Using CC_OPTIMIZE_FOR_PERFORMANCE, it is the default compile option):
"
gdb vmlinux
gdb disassemble do_translation_fault
gdb ...
gdb 0xc020e544 <+136>:    ldr.w    r4, [r0, r1, lsl #3] @load low 32-bit of pmdps
gdb 0xc020e548 <+140>:    ldr      r0, [r6, #4]         @load high 32-bit of pmdps
gdb 0xc020e54a <+142>:    orrs.w   r6, r4, r0           @ pmd_none(pmd_k[index])
gdb 0xc020e54e <+146>:    beq.n    0xc020e586 <do_translation_fault+202>
gdb ...
gdb 0xc020e562 <+166>:    str.w    r4, [r5, r1, lsl #3] @store low 32-bit to pmdpd
gdb 0xc020e566 <+170>:    str      r0, [r2, #4]         @store hight 32-bit to pmdpd

The code breaks the atomicity and valid bit is in the low 32-bit, page table walker
could see and cache the partial write entry, this will cause very strange
translation-related issues when next page table (level3 PTE table) physical address
is larger than 32-bits.

So let's use WRITE_ONCE() to protect the page table entry update functions from crazy
optimization.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 Changes v1-v2:
 1: Add documentation reference in changelog, suggested by Russell King

 arch/arm/include/asm/pgtable-3level.h | 28 +++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 7b71a3d414b7..b077174a4231 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -120,15 +120,15 @@
 						 PMD_TYPE_SECT)
 #define pmd_leaf(pmd)		pmd_sect(pmd)
 
-#define pud_clear(pudp)			\
-	do {				\
-		*pudp = __pud(0);	\
-		clean_pmd_entry(pudp);	\
+#define pud_clear(pudp)				\
+	do {					\
+		WRITE_ONCE(*pudp, __pud(0));	\
+		clean_pmd_entry(pudp);		\
 	} while (0)
 
 #define set_pud(pudp, pud)		\
 	do {				\
-		*pudp = pud;		\
+		WRITE_ONCE(*pudp, pud);	\
 		flush_pmd_entry(pudp);	\
 	} while (0)
 
@@ -139,16 +139,16 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 
 #define pmd_bad(pmd)		(!(pmd_val(pmd) & PMD_TABLE_BIT))
 
-#define copy_pmd(pmdpd,pmdps)		\
-	do {				\
-		*pmdpd = *pmdps;	\
-		flush_pmd_entry(pmdpd);	\
+#define copy_pmd(pmdpd, pmdps)				\
+	do {						\
+		WRITE_ONCE(*pmdpd, READ_ONCE(*pmdps));	\
+		flush_pmd_entry(pmdpd);			\
 	} while (0)
 
-#define pmd_clear(pmdp)			\
-	do {				\
-		*pmdp = __pmd(0);	\
-		clean_pmd_entry(pmdp);	\
+#define pmd_clear(pmdp)				\
+	do {					\
+		WRITE_ONCE(*pmdp, __pmd(0));	\
+		clean_pmd_entry(pmdp);		\
 	} while (0)
 
 /*
@@ -241,7 +241,7 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	else
 		pmd_val(pmd) |= PMD_SECT_AP2;
 
-	*pmdp = __pmd(pmd_val(pmd) | PMD_SECT_nG);
+	WRITE_ONCE(*pmdp,  __pmd(pmd_val(pmd) | PMD_SECT_nG));
 	flush_pmd_entry(pmdp);
 }
 
-- 
2.34.1


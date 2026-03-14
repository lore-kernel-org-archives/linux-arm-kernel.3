Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5430610706F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 19:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1Rwy1rCypsS5rvd/5BlfnntkzTDDi7zIl48jCy+BOQ=; b=rC+doZX7iZaO1LTHhTjoaw0Yp0
	ZIA/Ks/ZiED2IwapYbpoXu/RWbHEWjyuzcwtgZkUV2cZAzwWNMKjjs7Dh2bh8z1ObOtXvHYw42+/o
	cCpsY9RBUIS8UZnduiKSauztCFgu/UhlvE56MFPCDVs+eII8LQm6HcQN9FIbdwr5ygRzCDZgWuNr7
	MF4e++8NTCvLxRTRaqpCK21Y2QkFVxXYERJ/YZvq1LualSUxxkxgSEQ9Kcekf1B1yM5K7SSkwxEtC
	CykgG7VLEI1wSH0KKSx3aWZVWCYZYRXo/IAHHpJh4+1FzCmReqwZdxNIs++J7wm66fHK9HItYeISS
	G0jtafcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1UOl-000000026FI-2LT2;
	Sat, 14 Mar 2026 19:11:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1UOj-000000026EZ-0gPJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 19:11:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35691a231a7so1805473a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 12:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773515500; x=1774120300; darn=lists.infradead.org;
        h=user-agent:content-disposition:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1Rwy1rCypsS5rvd/5BlfnntkzTDDi7zIl48jCy+BOQ=;
        b=YL0xIC6Vf/cGf9c0ade1RO6Vw8shLuR9Fjyp4DgFYVj9SW0P9E7EhgyCUIo3UCZ8WJ
         LSDV/F3ifGZeHq2FLVNGEprZNq+bSla4SNxx4KdWJp3/mdQacdizG+TkUsOoLNe64R1o
         Bf2RP2m3AfqOMlKpFjWp7wU7p2nYg1jQbOtCTRWxMNSRZ2zUyhqKnibvs+X/Un2owV55
         pvp5FzLAsMf7KnXEACPgJEA4DvssbAJZGOrlvkgF+l+VAPTFk/Z2akFffH4TjbzQAclo
         ySU8nvvKitrg45uwt1ef+TCcQMLEi4Qv6t2+mZBSnGLBY68vphfnYjznbhoJn1m2kRVk
         AQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773515500; x=1774120300;
        h=user-agent:content-disposition:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1Rwy1rCypsS5rvd/5BlfnntkzTDDi7zIl48jCy+BOQ=;
        b=gtxK38TQchdu3blomX91G1EZJN1F/K/TXUBMmawwqBu7VkPfxhqMqZCvgHbxtdTwfN
         dpPhd0k7zI8+hbz2WV5SyRjLZM5UMa0lAXD25Jya37h4f9pD7vDtjpuhGxmRBHqzDHcC
         BunNCsNgSH0d5tjRgX4yiu33UqB1Ky/Csza6sgb/BtZaTdi8d9eX4hzv3wePwx6IS6wD
         M82a1D4QBsJncSGTXopJCBt5WQBoB+fNY2VtKLWVLgqeZNakzmqLSmrApN7L0g7BBwwn
         qdQOKrEoC1sTy2vD91hhumP/MV7ROmI9zsyn3yrcMpS5yUfGam3Nxt/AUaxC6RlzSXB7
         MfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXePkLFS5s7+pjwrOnOlslt62u7vPO97sQNbdquAGEJ6i0Db6ynk4mFasS0sG/nO4eUZmAISoS1MnOh0X2y3NFw@lists.infradead.org
X-Gm-Message-State: AOJu0YwXb5YbzPIOHbHGN4WdCDUZ0SnYYYBbkaJBwLRO4VEqdeYJZg7+
	wk9KGphmj4ToWvoeaNkkKDLH77h97rP7FFrQfbfs3273WaDmUUlaOo/u
X-Gm-Gg: ATEYQzz8u6FTZj2UcGmDwixHWj4C9iaDPZRB2F45gvhU1cqdm8Y5lODV+nTqrxOihH7
	0N5z4VqNLHN5jXWsI/DTAyO3esyZgl032QBuozvBiwv0aFXVy7AJYDKJHjQ7d3jc+5+ISDfiI0c
	HZhXrwZKwc1wK58fACX9Z3joKEspmz4eilrPLD+Wz6bUaEUn0SQUUtZ1s9oNdkxh90uS30jjctj
	XDWqpHU5rd0bsIfegBxZx1nvzDSoVP0cDLRchRLgXUQz8p3vU3SAulWBUZP5/mvjeTNU74X6i3u
	w1yUHIlTCn8OHmm7qYkWLbqcJ1c1R78d52W2fJ7wdE2SsqCajgWAuWmuwXonPWvocNVUqjnKAwi
	fE0GmdwpxdNnVhIs1ZVxEI0P8PyjeqPI6l16lru/eXLj2cdkOWSP+2Yd9m30Kb57XG0nNNOzIsV
	7g2LNAf3HvwmF9orM5prTQbDMS6vu61gCwzqG8RmEK
X-Received: by 2002:a17:90b:5345:b0:35b:93d8:6aaf with SMTP id 98e67ed59e1d1-35b93d86c76mr586837a91.19.1773515499736;
        Sat, 14 Mar 2026 12:11:39 -0700 (PDT)
Received: from udknight.localhost ([120.36.202.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a2450ffd9sm2593217a91.6.2026.03.14.12.11.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Mar 2026 12:11:38 -0700 (PDT)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 62EI04la008004;
	Sun, 15 Mar 2026 02:00:04 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 62EHxw2u008000;
	Sun, 15 Mar 2026 01:59:58 +0800
Date: Sun, 15 Mar 2026 01:59:58 +0800
From: Wang YanQing <udknight@gmail.com>
To: linux@armlinux.org.uk, akpm@linux-foundation.org
Cc: willy@infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm: lpae: fix non-atomic page table entry update issue
Message-ID: <20260314175958.GA7956@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>, linux@armlinux.org.uk,
	akpm@linux-foundation.org, willy@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_121141_238501_9F26A50B 
X-CRM114-Status: GOOD (  14.31  )
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
translation table descriptors must be single-copy atomic, to archieve this 64-bit
atomicity on a 32-bit architecture, the linux kernel relies on the STRD (Store
Register Dual) instruction, but the copy_pmd() in pgtable-3level.h is C code, then
compiler could do very crazy optimization for it and generate code that break the
atomicity, for example, we get below copy_pmd() assembly code with gcc 12.4.0
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


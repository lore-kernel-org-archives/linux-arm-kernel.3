Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B306BC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlgUGAmuTWGVKaOGr6DQU8bhY7gyR7CYcPHPJxmYPTE=; b=47ST2SLAKT6BLDPjzT/R5qTudJ
	/4xXjJ4FEagEb92B7Ev8EjYJ8S9EPLtNDxvcHzE2yD2WgMV13WGkVIFILB9Dy82NdvsS8UFqcvQ3p
	HcVrr8DhabuQwrbOItbYcyR1Oe19SufXgSUzqcfNNsvA0J0Aw6gc0DJY5SFAE5nSk3PWu3uxMnosu
	8oNuYA5bv5z5u8HC37PTwux8FoiuUGjIzHP7K2+YkMk3/4FscNp+5AgtN1F8pgg3bU6Rq5s3dHoX+
	Y1e2qFubAtcKPM1Ql4ngix0nzuenBtl0TPtsVQQLRI5mE/N2nyLkBLUuPAnaDSqcJ+4KqNQUTyl4i
	ZpgeCmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLZR-000000021eD-231J;
	Mon, 27 Jan 2025 09:38:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLXu-000000021It-0ofs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 09:36:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so43227115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 01:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737970601; x=1738575401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlgUGAmuTWGVKaOGr6DQU8bhY7gyR7CYcPHPJxmYPTE=;
        b=miwJcCjaGI49ihA7LbNxXDyRqi2KrkBbF968D7K4yD4KX3HMy7EGT0xzxh4ifANlS6
         tAuQyC9Gafoym96jMd81oxfxikjvksNOdvLJkDzPH3q98e2tmUYDNLRRAS+ncAyXuuI7
         B7Ew+vvYBJP7aH+Bomuqt4amu96PQmbjLhV1BhASNKjKtvOTXf4aXpPM/3cGKixA12Lx
         CLNBudYry9u3rY0oXPn1Ap84NQBz4DBQ/X+MT+Y6TH07ceYOttS57yfTzLbCW1JL3hAA
         NV5M8mfuQsOxuvTjcpyz1HH96ZqotHZ3Mt8pZs8SvCEUatA8Ov8+QFuEezIqnObUr3sF
         y9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970601; x=1738575401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlgUGAmuTWGVKaOGr6DQU8bhY7gyR7CYcPHPJxmYPTE=;
        b=sp782Ndm3awaoOUxqkcaVut7cApF+dERjP5Lx7uJPHq4VmHcj6fgXEq/LCYc+kLAyA
         kQzh8nhO+uHl/SNgg+g4c3TCtd4P7arM4dG7mReKe+ceVvoFTgMnTx2t3/3N0aPe9ILA
         m1r+fZ0LOLU85Vt0FITedXjFOTOi1q2AllcTNgeNFQc8Qke+pqTyXALGeN9dsifZbjQM
         ymdxPp1NEI221ydXbj5rZ22L0I3nq+UdW9/he6MJHbJ/pw3sEHoS3iiewL6f0A2Piu4P
         Ch2mUU8qCRrXn2HN9fYJgY14WDySt5NMxpxIygVghwHScPGrr2L0Bcaw2YD7a0SvUq3l
         Nc5g==
X-Forwarded-Encrypted: i=1; AJvYcCU8InJ+1VQlUs87XE7iJv7lJHBewzrMspYiANHPoIHo3D5LqQh5KM6lWJ2Kzg15hvzIGbEc6KRDwHnGimgJxnI8@lists.infradead.org
X-Gm-Message-State: AOJu0YyoA4gqsM+eAQJfL2cAr0FjT5VAM6CV1WST29oTy1EwcS/WnUsS
	WhoOS/oNcz/mZ4VzqpT+rZmDnlTz0dBSMMxILRO/+gYq0vugvkYnO8MgwvJwLEg=
X-Gm-Gg: ASbGncvf4/oA16vJbLMQPWKzzXAoqDtEJuHgaE6CZe1bXgyH+kN3Kh+qnxWhYIW0njf
	trRQLmiDkrxWKaeKdY2PQYfZK2DlLe+tRTk/mvEIQsptlU74PitD4UHPIG3BKPfob9Sr5l/j2q+
	sAouDNwwUTQdJTi9oL6Wz9sTdVnsWlA95M9ZsDJpPcoXgbBTEi2JFqbiB0w80krT+D+o9CntgeG
	w5tHldksgwaVjbn5l7S7NwP9lw0k5/pBl54bn7Zz94wqiu8zoQHRBlQpGWvXACh1AuCGObmhHpV
	PhPXLC9A3kcYUewtr4/fgn3JuyJ4V58=
X-Google-Smtp-Source: AGHT+IHUUXHJ5coMzJl68ATLI/2WB7Q+b+nPXfERL8/PDwCduzlj4e0CTpfsp9bAQ08qd/jskgeAvg==
X-Received: by 2002:a05:6000:1445:b0:386:37f5:99f6 with SMTP id ffacd0b85a97d-38bf59ed62fmr33321912f8f.53.1737970600263;
        Mon, 27 Jan 2025 01:36:40 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176490sm10314205f8f.1.2025.01.27.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:36:39 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 1/9] riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
Date: Mon, 27 Jan 2025 10:35:22 +0100
Message-Id: <20250127093530.19548-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250127093530.19548-1-alexghiti@rivosinc.com>
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_013642_231014_1140AE4A 
X-CRM114-Status: GOOD (  11.31  )
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

The pte_t pointer is expected to point to the first entry of the NAPOT
mapping so no need to use huge_pte_offset(), similarly to what is done
in arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/hugetlbpage.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 42314f093922..6b09cd1ef41c 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -276,7 +276,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
-	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	if (pte_dirty(orig_pte))
@@ -322,7 +321,6 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
-	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	orig_pte = pte_wrprotect(orig_pte);
-- 
2.39.2



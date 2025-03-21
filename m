Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95DCC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+81In4ilDZ/dsxug/tXtQcTDxsQusJyemdqH5+0jxZc=; b=Fmg8CiRX13NzwKGiGFtHuSf41c
	N7o8FEJkEr70ksjoR7hAHCbu8D/av6aWYqngG5btPxfOTtm49bDeabhQpxHOUeV8ezxpnKsAJQvzX
	NrB858JfDYeGNhmiM35rdbJvlUxcN1dbQ1zV9thevNuflODI7fcegQR0eZkLg9l/3IRf0VPE9Shw1
	XudIaTvX8xhpW58kakRx/oI50Qbep05vSrYJo1WAf/3OPk1LQO1+bWlgMFBR7dOQ1FeM/beCNz9Cr
	qOH8Zy1xAdXeAWGol6Xka0K1ztAMvqawCPwWJYeRqZlv88MRgHKePhuMXUqcwYLTWmRYRxu179kLX
	o/HSAohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc8e-0000000ErtD-0YW7;
	Fri, 21 Mar 2025 13:10:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc69-0000000ErIC-2WMM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:07:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-399737f4fa4so1205348f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 06:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562460; x=1743167260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+81In4ilDZ/dsxug/tXtQcTDxsQusJyemdqH5+0jxZc=;
        b=HgSJ4whBgtjsbkyb9VF0Ecqve6sdntG50GGllaB71WVRz7zei8i3G/Wx2O/ZduE9Gy
         cPtm73OyQUvbi0V4k+6VVPNH026CcKEDwsHIiCPaLYzWLY5CBANdBvTe62QWXZMdJeng
         /nJpWqvB7A31DqHEs9fvHT5WcDouqtZWkwzSvGifw7X10YXri5mx5ncq1g+p2D5jlq5B
         Y8+kokMnn3jkaCBIOGck4A7FfPAivqbM0PY6oVS/VqeQDrUQQ9x68LIqizI76iykg66h
         Lb6FLrd/K4+dojG+ceDCrFUTTyLICFzbKmLejoulVYyohVvrmM1oS2q+pOedt1v1RgcL
         n6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562460; x=1743167260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+81In4ilDZ/dsxug/tXtQcTDxsQusJyemdqH5+0jxZc=;
        b=R6aRBPUjGKjMLySBqNffK7goiU3TepsIT5xd4ZmL9ouvjWqeXrVM8Dxvzy4298ehum
         n3rltRW1mcbWKIBrzOp7cbfo8mZdClHxv3V1K/uzxMmjuzR1W+rH9AGLu8zW3CBzYVfo
         XqDSuy29siSoRftOF9hzdYvpLEfxSdrTG2YCRRDN7bpzrkm/PrazyOGceQYohzXuoFhn
         ERHuYC3hQWBS2QKVT/s84Y0V7zec4eRgUJoULk2lKmNBvXpjQCv1mN+2yWSL+AM8Rq1L
         WghOxNIt24jfQlexjR5GpsHiSevgFsSAAfB5A/nbXy8oQjLTq6NUgFvThijE8yfLbH+5
         Fn7A==
X-Forwarded-Encrypted: i=1; AJvYcCV7HDLM0+CSoQ2ULBiUcpCKLpDDHnmv/x28sWeupFvTlBr2ULXn0ArCuFsMV2SUxMJH7e88PErNt43G2tLwAzAD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3CJMe1Yrc+ead/ElgfxY3FCvQ6iHN5blA2vqh2/4ND1hfqJVv
	hRnnxMbdSI2M8tP4I7LPdOlLmPRi57zktYhfuANCYbFxv/7eVGlXGY8brrgShBQ=
X-Gm-Gg: ASbGncuY2ksmzGC6MfFyDP3vfe3QQ6G+uLhCclF+qnR9KrhHJWVRevHF3ggj/2vIdmV
	YnK1IVjV2zM6Q29mQykMFvhccs8CkUSqoEOY5ntu2BwA2ONxtY/2qi4Pz3XaFzpMvKO3RRpOcv6
	xzyCCT74M9gSor55TO+rto72EfMAU535qAp1zw0DpZj//MOIlIKeQv6xtoZ1ayUAAwa6x6we1Te
	4dM9cN3AZXRb7W+YPPArb6TjiMEK4ZaHfk1+jvU8pNZU4jHql8dVJHm0xU/zQhshNPiJuoYq378
	hP9g4fpTHd21Hd4lV46O4NYi9Grg9TAq/weFP5uQIubM9Rz4+8BnMSysaLnLOZL8gEU+cA==
X-Google-Smtp-Source: AGHT+IFGcNIQFtkSrVrMaEJyHkzdoC3QT/2GtmdRgmqzsJ6C1xedRKK8otT6Nr1+/A9BoBAqiRGLXw==
X-Received: by 2002:a05:6000:1f86:b0:391:4743:6de4 with SMTP id ffacd0b85a97d-3997f940e28mr2542677f8f.50.1742562459890;
        Fri, 21 Mar 2025 06:07:39 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efd6csm2364857f8f.90.2025.03.21.06.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:07:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 1/9] riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
Date: Fri, 21 Mar 2025 14:06:27 +0100
Message-Id: <20250321130635.227011-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250321130635.227011-1-alexghiti@rivosinc.com>
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_060741_643125_C70F8AC8 
X-CRM114-Status: GOOD (  11.16  )
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
index 375dd96bb4a0..3192ad804279 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -287,7 +287,6 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
-	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	if (pte_dirty(orig_pte))
@@ -334,7 +333,6 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
-	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
 	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
 
 	orig_pte = pte_wrprotect(orig_pte);
-- 
2.39.2



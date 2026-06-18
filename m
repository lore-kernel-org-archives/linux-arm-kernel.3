Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C64CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2WEu3pL2331FUekzYMzPgYnW/t+6wHKRR7Q73nVowU=; b=x8ueabSIGDpJJoAOGATpNDfJPB
	Qv1++U+RDH0uxxEBIPO0fOrpC7rhlPBZXQyWX8vMFJPau2sBtDRi9DXiB2+9VfZp+QkoUGoJaDQUf
	Hnndi1Kr0ITcN30Hg+AUmt5OW5Y6suiUTRrQFyMNAkzkUN09ZgpIhou9WOzsYzBk1hnwxMEYuhxYx
	qiU3DJ2Nr4wKvc8h66YnEKulUnKtazVeC4zKZ/i1Da6iZrnDNJOfPU6tjC8FqRXkxLTTHtqsDfab4
	ZN/E+7FBsQyQ2iGKXYJaXgELYPmTcjbnXRd3sjmxoZ458C5HokdbJ/eG8EBsAHtblG05IJw0USiY+
	wXZL9L1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8PW-00000000rvb-33u1;
	Thu, 18 Jun 2026 08:47:42 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8PU-00000000ruk-0Pdd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:47:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36b900f350fso770650a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 01:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781772459; x=1782377259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2WEu3pL2331FUekzYMzPgYnW/t+6wHKRR7Q73nVowU=;
        b=h0b/XDxKfAuEN+tjdrxIub98lmmxDJgdgvkd//rD/++h9fsJevlGumBIXu7xNRLhDO
         wcnSyMgHs54WywH73VnDgViIUZ8Qv+BWzOZVXiSNiMWalEEnCTgUVwgJO930WqNQRW9H
         59pflXTq4VrzsYWvKxAOSDZ5uJlrt4I/BxM1W9kgx/29lH0mp2JzJjPXtouPVPrLYg/t
         Z8ctWtM87Bfv8xni1kOIFiwozbeJqVfsd0p3uqb4BizpdWawDCPSgWJ8rajznu24HosO
         9vYZmSCsViebodNR9waqZIgaRztpqF2Fx7mqN7ODBo52ZuQ0CZpcgUYuteCusNfIeqXl
         snng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772459; x=1782377259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u2WEu3pL2331FUekzYMzPgYnW/t+6wHKRR7Q73nVowU=;
        b=AA7oGQuhrcNGv4d/D088Op8B+2H8u1YuPiJ8iy533pIzMRNqS38DOQ1v60zl/yZTvd
         /C5fvJlfMEydq5oVRQNGPM08yWRCe1ZdBZMEhmb2Jl82H5yuNXKPv52/atjYKgOfwKDN
         B+9YbWORTd/swRTwwMq9RIy3DkpNI67CAfmM5O+syl8yyahmpqxlvt5ayUN4LDFMyfuF
         S31ntKrCbNDG3CBZt5NgjVgm4vWUO8j6XqiulW/jgS7RGDom0SOVjSkyB104au5E0kH5
         XO3YAXUgESEKNxOTtGy4f4srOAP6thWWfd7ShKDkdqxEo82KjScY56jjwsgy0fiILtJz
         X49A==
X-Forwarded-Encrypted: i=1; AFNElJ+Yc5Ae4fcs7hiL8ml/lHn3y3NxAw7LqxNHU+hcfUBy2r7GiV8hKGuia/mK/HqB5NaaC3LN88exalaiHOXp79eg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz1fRrPTAYpcNLEfIUXFJdFZLOr+ONJZTl0DeClGLeYNH7qHrg
	RVOjwSHQ39sNQn0oVRVQRQwtkOtHxAdcN33CjuhtndvDtMYZNiA8Caim
X-Gm-Gg: AfdE7ckSqrpuNLU4fZWt05lL+IupoiEpoOtXeEx1DiE/vVbt1C9sEWk7t0WTHKvgwa8
	wsTPCJydvz/YRpdd35+CR+tnR9lZNniLSGU6jncY+uw0O8uIJ1lj04im7WpxEgDNlLN9suFJeSX
	r8Q65zO0RranzY3qJqiTBlPSTv1EarO+H8+64yvMO0v6YTgUfr4nrX35eni22ppM/4ML//lhFiw
	318lGZEZZDam8d3090+Z20uWRMzMz+ehXVyPjswakgYCRJIoKp2Cl4fuAECy/8STlw38WhClKr5
	agplzolwtd9GNR77aS9qdK+TkyWCksU/Oet9q7MtPUoXZsGh+reOhFqACYfI0Fi9myUlfH1/SRb
	XrCKW6x1S1eeqLuwKdpadjUT/klQEf8uKRKeAmsL3PJDhsky+y+aXZ5BkPEFMeYvC9nxyLW8y4x
	xa7nrHQ9ydc8ZXEtoNt1LRZ94VVPziV4pgWDM=
X-Received: by 2002:a17:90b:2812:b0:368:341a:a925 with SMTP id 98e67ed59e1d1-37ce46d8c8bmr2750204a91.23.1781772459491;
        Thu, 18 Jun 2026 01:47:39 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d8e7bsm8628856a91.5.2026.06.18.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:47:38 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com,
	shanghaoqiang@xiaomi.com
Subject: [PATCH v4 1/6] arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE setup
Date: Thu, 18 Jun 2026 16:47:21 +0800
Message-Id: <20260618084726.1070022-2-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_014740_144191_20EDFFAC 
X-CRM114-Status: GOOD (  10.36  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
we can handle CONT_PTE_SIZE groups together.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index a42c05cf56408..c4d8b226126cb 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
 		contig_ptes = CONT_PTES;
 		break;
 	default:
+		if (size > 0 && size < PMD_SIZE &&
+				IS_ALIGNED(size, CONT_PTE_SIZE)) {
+			contig_ptes = size >> PAGE_SHIFT;
+			*pgsize = PAGE_SIZE;
+			break;
+		}
 		WARN_ON(!__hugetlb_valid_size(size));
 	}
 
@@ -359,6 +365,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	case CONT_PTE_SIZE:
 		return pte_mkcont(entry);
 	default:
+		if (pagesize > 0 && pagesize < PMD_SIZE &&
+				IS_ALIGNED(pagesize, CONT_PTE_SIZE))
+			return pte_mkcont(entry);
+
 		break;
 	}
 	pr_warn("%s: unrecognized huge page size 0x%lx\n",
-- 
2.34.1



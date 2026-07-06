Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5253C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zqVWFIRUuTBbYnsOMemyEgk7HMcsRAnM3YRqML3I4s=; b=JOv2YCeYU8DepasZACleH39l89
	ylDjlPbLhKT/hboaj0LFbopQExZqgwlbpurMpo98G4f7imy0f5XypQrU2eUnbwRl3NQZ1pb1kny8C
	/pqLgQYgBG7RFcEA9y2UVvjx7RbhtBRVdzqUanukbAjYRQrSbPuewrDw6mM3by1exuTwG6GpjHp8T
	n4D3UMUDt3/N4FqmyzEZqjxgq7bmxN8Fofs0W8FU5hv0QbXYBG92lMEXERZjznrqloblEwB1/VVo+
	XMD+e9pBGatZHmfqM8/Mg5TV3q4TbH9XtpZZuTHRgT8sdvTGR6kCe1niB7ommS0lN1NGUZMrvvy0j
	isBy3ovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgevm-0000000Bryh-0HUa;
	Mon, 06 Jul 2026 08:43:58 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgevj-0000000BrxL-2jAi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:43:56 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-37defb2f231so1794928a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327435; x=1783932235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zqVWFIRUuTBbYnsOMemyEgk7HMcsRAnM3YRqML3I4s=;
        b=XUOX4x3T5SvnkVfevcOUgXNt9+5HLoFw4ycF/Ll6NS+XMzkfgXDmGIH/+fcuESbKYT
         b7RH8O0Jiv4N3cQ8c31wgkPtMSUuUUWgSysiH2Gwm37Le40iJtT0HOF3009cxVRl/piZ
         AdLiLC2+p8/4NSbQ+7/dTi+323zLELS9H9iUaxG9PjqcDWXvifjspxDoIGdOTzSkZ6S7
         xHhXiijCaPKXZkZCs6ePBbpdHwFO0UZHvmgzlbb8oQnLKAdY8By8AqIyuZh83Awckily
         FU/Xwue4WgfTrKAb391z7txmTbz4uVRiESIx++WgUgQyOwnMGBocryo+p8Zf03Us/AG+
         xkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327435; x=1783932235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7zqVWFIRUuTBbYnsOMemyEgk7HMcsRAnM3YRqML3I4s=;
        b=Gc6L6qgfzq8X31md4FEbtA5cw4xzpyCIpaAdTJ0t96OLZBPxy0gbT98l4xnRG2uQiI
         W5izPzbEWrWVZ2rfj9fBbYWAKErMXq9YTpVXseM+68rvJ8G14ta4kWYIkzNsK+HNh/ta
         6tO/ffZPMsCxlqt8ZfeQ6O+eIS2hl76aSdxWT9BdhZ14+iLMIHB13BG9HXu8qxmVNAOq
         s1oGGpkLyNe/Bdc2sEhXBTCQ5EcHk86L9LuxJo/5jiSkQgqOR+rUHF8n0Yh71v/tI5Dx
         7RvMswSbQ5JIZbA3Piwz11E0hZX/VmdzpCvY2Nzq5vpCWiGkYzfCFw8eaZs++wU0UL+T
         DOEw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6n+p86cjfEAinpYfIkZWKd8NspFtay/4ZC5JxLUftDVP1ScL/1ZBG/Sx4O4kTbIEVuKcLiTVovTQ97U1J708P@lists.infradead.org
X-Gm-Message-State: AOJu0YxEJNVODWAb2EQIFUjXeX11ThqXotXEglSI0Sq+Uq+rlO+r21kw
	Yhjt97bRhBK1lk/NdjCeE/ltGKuNdTrwrtJSeSG0TzOxE/O5N+7+zeys
X-Gm-Gg: AfdE7clHqt+lgRpxVtM4JqPRRSADyls3ZcLnMbiGjVuhKECC9QSF+Y9uszpo/bL3i/v
	gVnHE5SSPvcbWuCDd2PiBNN3HiNok0e7/KrCinjTJHWuAGgPQa7B+C0cfpOv32o4AKtnRK2vg9T
	LHxpYPRz54vlqjAxq39kXN/sWTxmz2T+2LpVSKeWFiYVH6xpM06L8gNHLKOUgFVPtxlFwGQin5C
	Js4OKX1fPet37ua/4q/uGY+QyZKjH2PFPL3rLno6LbMEaGojaxaxrfqDUnH8usBHbQwe3x9Rm3m
	Bumli3PeV2F5Dik9V8Tb2MBF+7nHx98kqH8bJBbRYXxtPgNyFLghwy5CQdB6mJmWqPQxSGdRGUk
	4f0bcBqa4RaEq+GmlxBPn+BkYCRKa0fL3ETpiZ3TDdWjoCeo1EQsGl8czTGbyvPhXEQnjmepvEW
	U/Sr1zxNmFN/RqH74xFmE2L1OmM5zWm9zOyk4=
X-Received: by 2002:a17:90b:3808:b0:37f:9ce0:af31 with SMTP id 98e67ed59e1d1-3829f4e6e58mr9178683a91.28.1783327434882;
        Mon, 06 Jul 2026 01:43:54 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815c10fsm4524635a91.13.2026.07.06.01.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:43:54 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	shanghaoqiang@xiaomi.com,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v5 1/6] arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE setup
Date: Mon,  6 Jul 2026 16:42:27 +0800
Message-Id: <20260706084232.177786-2-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706084232.177786-1-jiangwen6@xiaomi.com>
References: <20260706084232.177786-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014355_703024_864546A4 
X-CRM114-Status: GOOD (  10.26  )
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
index a42c05cf56408..0da746f729388 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
 		contig_ptes = CONT_PTES;
 		break;
 	default:
+		if (size > 0 && size < PMD_SIZE &&
+				IS_ALIGNED(size, CONT_PTE_SIZE)) {
+			*pgsize = PAGE_SIZE;
+			contig_ptes = size >> PAGE_SHIFT;
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



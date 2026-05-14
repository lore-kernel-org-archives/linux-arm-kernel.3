Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78586CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRd7Ld3GiaVdtiEOte4Ul5KoBjr/FrRH6YpNK5Is7Rw=; b=DPus9MEoAUObzj+UTHgYN//ifr
	0eZwtBPJFVyb14HAjshnm/ezvFsoBG9U4308KHyIiuYHera8cON9g4W6Rxt+lEnH766TqHBF0XRo9
	gh439xTWc9LOV2XikQLOHNtzP7A+bKzX3MJE687r/pZo1Xzs0LgR7CX7ajYT8+IVNyFuz1iGu3QCa
	do1/tTxZXynp/6MDpcA0UxA/lkISgNW0E6S5XHhNtX6zU5PmOkWv9Q8bsDyWGhUyGOreaw2dGZt0W
	uFJeKY7lVbwStQcE0bLqBMa9/0l6JeN5GrEXl2tKUpsk+kqNLP9WKbM5PXuqwZXzbluvezJTV9n3K
	mo9HC6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZd-000000055yV-1xC3;
	Thu, 14 May 2026 09:41:45 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSZb-000000055wv-1vKl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:41:44 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c70c112cb61so6019016a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778751702; x=1779356502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRd7Ld3GiaVdtiEOte4Ul5KoBjr/FrRH6YpNK5Is7Rw=;
        b=feWYMOgJOvlVMhSwjBqhC9OLGyJKQN3TAGMy5SbnkTgGRbF/BFdWt3ct5oRaWlMiXp
         h7SRSa8ZLqoGn4WaoZAG3MTbpzh/dH9R97XSMYhqexB7lOx1VNMRZY4N1r4U5WHK1VDO
         hDh4+XoXqPDILmr0ZAzELughW7u+kw1Gy4qrlAwxFGhNrnV15lrN4Hr7Wi5QKHtz8jGw
         qU0BcAWuFiZaU9fOk8HLQ6ZM+oHy44T7yLbH6Ytb4RbHbdYvYE+p2A9Xm4141FO4i8pC
         e19Eo1/78jMosrJafSbupzw1F1f6BeLCmvqoxLN67Ago3fdT/ztYgplmxFFtdsqaryud
         H9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751702; x=1779356502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRd7Ld3GiaVdtiEOte4Ul5KoBjr/FrRH6YpNK5Is7Rw=;
        b=PewO4htretzEHSlmY5su26QOIsjAFeC7tLLNZjR5+s2Aqw3ii7zseX8cjCV693e3Mw
         1JFWvba/uGhiMXZXNp1oT3lC0rnydljoWxp1vkRyrY2TNVwllbYFqV5ypIG8WCD7gp+A
         9GH76didPZJ8bh7wqIDulW7DoUQ6/BN12e83qEJyx/WESi0V8iMdUYkXoo5Th+Daq7sG
         kn/xrvwJ8YTNEjue1COxpiqvQtpYchiRnAyj9k+F51Oce6skSZ7vyFrLSCm5MH73q76E
         2GO5h+bQmreBgiq+dwRo3XT6ZahXpyRGrmbMvZWGbfZ+DgUvR54JIDcTGNPSv7FVzQpD
         UIcw==
X-Forwarded-Encrypted: i=1; AFNElJ9uyA9fh/k7Yo39RiG+Akpt1IEOjVN2eixNykX6EXbvVy3A6Eq9vkjPtCQHx5Du97TBw+KAlffxGxjEfbPQcEhO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3LmtpO87sLClDVpTQmgUBTmYiMlWfjzxUQMam2tKXYlBfe/MW
	80oNylGjcxIqsc2pUUG9QPu+smBRhQjWmDdKesGDBiGz+rQwy+xrf7z7
X-Gm-Gg: Acq92OGGt4Ps0Vv4mh+3TkIsjPq2LAxZSGICxzKGQSg0nqS/X7aVSrItJ7TEd7yqt/B
	tZIxt27wUHtZelpkSq8FKP2xk3kePGbM7QbPwAdu2iSRAC5wGbusto4HuFCJJrnIERRYnAr/oxm
	v1ARDk1voHiWalW5BuhcZrw5e1pSPUevscVG1j4MqPlNLJlGtEw/ig4H9/4AvOl1ZMJ1YiKORT+
	inn4nO1fGRIZxjNWnZYuiiGtQJveGmAZAqXAjKbkIikGyUXVoD+QKuWveKD2tVi74WQzJLB3FSX
	7V9PtybQnTZ8++ox2zloGwpriD+m74aTXyNzi4eFR/fVKPMmMtFeMx4ZmAINse0ozz6mWKN/DmY
	p+0l2BuWWPWIjdxmnr9pJqa7cTuuummQ7tkopyEH8vbID9sGJa68yjFXrMxTh93fYEKwSAqHKmU
	0TSlAy22jja4zI+eWHt6TJIZ+TkeGVCBZceN4yaQ50CacuX9Ki4krJoLmV
X-Received: by 2002:a05:6a20:9389:b0:398:a1ca:7a2a with SMTP id adf61e73a8af0-3afb052129cmr7620166637.48.1778751702487;
        Thu, 14 May 2026 02:41:42 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb114a70sm2351244a12.22.2026.05.14.02.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:41:42 -0700 (PDT)
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
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v2 1/7] arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE setup
Date: Thu, 14 May 2026 17:41:02 +0800
Message-Id: <20260514094108.2016201-2-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_024143_506287_71C3A21D 
X-CRM114-Status: GOOD (  10.56  )
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
we can batch CONT_PTE settings instead of handling them individually.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 30772a909..d477a9dd1 100644
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



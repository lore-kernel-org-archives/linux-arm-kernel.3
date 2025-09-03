Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194E4CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 22:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wz/bZSqqVx6pRJeL2TZzvIUdrr6/vXiyt+C/9X3zJM=; b=iHYx8B85nEHkEevFiBgG4CA6/h
	i7J4TyDJpKbNPpmWhflRuGg47aslvSk2F8FGi2aJmxxdE/MxDSPqZ7Ns04v90LokqXtq8w7zjjv43
	uA/9krisgx2QhzSrh7pJmiikf9DJ6llaUdH3UL2WD8S9uEloZ6J3+uQGxOC/2GRGkqtZxlZBhhOxB
	mpnLXl2U0qZzMqP3fAR4doEsOit2wngUWXistpgDs7PEAXKXXBeLGMwSTbiMS9R4XwPcsL7rg/SCY
	1m95kfHllnVqN+DFOcw2nt+rqO/baEQ9RrrCWYpKe562qNV5dEIyP0plomSoo17ma6BTdtY1XDDH9
	kAj5ZbLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwQc-00000007quj-3zCW;
	Wed, 03 Sep 2025 22:58:10 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsho-00000007NX0-0AXi;
	Wed, 03 Sep 2025 18:59:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-248cb0b37dfso2585765ad.3;
        Wed, 03 Sep 2025 11:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925979; x=1757530779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wz/bZSqqVx6pRJeL2TZzvIUdrr6/vXiyt+C/9X3zJM=;
        b=NKi40d08jVOHWrkUaCp7974n9rUIuYfh1PamFQq0eE+Fc3f/uNUBRFYKxC22KXflSJ
         VzweGcYGk4yFGacHv2cJN8EwUrbSQW75cjVFmg/Vq2Wdqhh76avWSNTyUsVnYE0kfSWS
         r12e3ztLGWOOCzY4dTz7+JBIVehdVyeTJTz0Bs+wbj+9hVJ+x2IvkGgAL4RPWtTJBJPq
         Ro/lDQhwp0PUGMRwmKKZW3s8kvl+ISo2/4kdhwvwVy4Ew+orB8e8mf646Ob7DyXoIlwm
         SmDx4XIASrNOYSSoxLHBN34r6GubkBZ1S2Qgxbdwc4bGPz8Iv6HPI2SyRhbW7RWCFyOs
         +B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925979; x=1757530779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wz/bZSqqVx6pRJeL2TZzvIUdrr6/vXiyt+C/9X3zJM=;
        b=ExafpqJ5oND4843uBmiwy9jBU7PxEvWFogB+wlnJt6jHD2twiAsjGfU5V/6VNs8NCS
         YSmLo6aLgRQbzrG0Dbv7C83t3kIs7FShb1lZ0G8aqaHDKqfbhRHpYWTx4WlJZ01nQRNK
         TOnlvdICemkaSwNrnkGHsT0LuESJmySM/1OuiS/Hy4zTyry5rgcA32T/fed8zvIgf+B7
         kecHTgfVialpUKiROF6MJloEmEqs2Uy7GMg3lDC2+/nET0+p0O11gGd6nhYDSSMmGwI/
         NDBDmLL7MhMUT7eisxcnWEd+0BXCiXLDENpP6u1/UIlqmoOh7Y37YrW6BHHqPkk/tm5R
         hDJA==
X-Forwarded-Encrypted: i=1; AJvYcCVqQDcRcqj1+BBKKFye/la1A6Ib6GIKMyjdP0ie5QovNKndpNpjrgUih8mr7u2GOa5wLczajtiokWUCo4M=@lists.infradead.org, AJvYcCWBtWOenwiTYKr5STxYJkC4aC0qD7sn8gvkd0dUO6FTodrMym3QcJ5lVQYB0nGozKjL6KEN+E/AFJOzaT55d0x1@lists.infradead.org
X-Gm-Message-State: AOJu0YwaNrGb/wC1VFCpqpKbcvIpcgMMPfYQ5COXvozdXNalm4vSZu5x
	qxtzXwl1jTvw2+vyMhTbvWHCInx9oVd2/72KzzZ6qKgafcEJXP4wGID2
X-Gm-Gg: ASbGnctWbnXlGc1bpy9/+M3a7p55N0xN7XMN+3WSqAZAogFp56GPWKbQbJfJbK/y+/a
	7TgxZ22Wtgu8mKzgmw3ATx/2BH+IvSA9ObXK+lYWvwAYV82TDymt6Bzo1nX2TjI2vGfPyrDEV4m
	chyRs201Z2y2dD3JaMzn7rgGQcif6r8GrC6hT6/0jyJeWJ/ln6fnyUtT3Nt5YuZdJywffHwHXfd
	o46UyPcyI5bLUz3R+P+qxS8/66MDwasO4eiiXmi84WgkXz3zFnHHheKnJfs+xJBquWbUnZ6rZFW
	u4yBvaCjsgp7TnPmBwFfXjCazht6TxcuLiqISWeDXxcUfYNPD+X3T9TZGUmDq2kaRrCoY7xlLYU
	re9w40s6AZ90FNg2LmfDRrQAf8v1aOvI6QPL/kzgmEGFCkQiV08ht0A==
X-Google-Smtp-Source: AGHT+IFLYxGq/uXWczWSmoJ4dYmB1R4jOWZAcKlvb1pf3KqvOH6hTCxx8eQlFrsP54M7TPt133nTbQ==
X-Received: by 2002:a17:902:f789:b0:246:d383:3964 with SMTP id d9443c01a7336-249448ac3c8mr239306545ad.18.1756925979423;
        Wed, 03 Sep 2025 11:59:39 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:38 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v3 3/7] x86: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:17 -0700
Message-ID: <20250903185921.1785167-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115940_078847_6F89208A 
X-CRM114-Status: GOOD (  13.69  )
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

free_pages() should be used when we only have a virtual address. We
should call __free_pages() directly on our page instead.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/mm/init_64.c          | 2 +-
 arch/x86/platform/efi/memmap.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index b9426fce5f3e..0e4270e20fad 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1031,7 +1031,7 @@ static void __meminit free_pagetable(struct page *page, int order)
 		free_reserved_pages(page, nr_pages);
 #endif
 	} else {
-		free_pages((unsigned long)page_address(page), order);
+		__free_pages(page, order);
 	}
 }
 
diff --git a/arch/x86/platform/efi/memmap.c b/arch/x86/platform/efi/memmap.c
index 061b8ecc71a1..023697c88910 100644
--- a/arch/x86/platform/efi/memmap.c
+++ b/arch/x86/platform/efi/memmap.c
@@ -42,7 +42,7 @@ void __init __efi_memmap_free(u64 phys, unsigned long size, unsigned long flags)
 		struct page *p = pfn_to_page(PHYS_PFN(phys));
 		unsigned int order = get_order(size);
 
-		free_pages((unsigned long) page_address(p), order);
+		__free_pages(p, order);
 	}
 }
 
-- 
2.51.0



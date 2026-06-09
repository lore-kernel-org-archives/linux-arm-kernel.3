Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CC4CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9YFjxCDbSbDN2uR6oPNBA7yFa0nwiCUOct4EeQonTo=; b=1u9L0p5DaVyY1nKKixXr7kwSJ0
	JteQfhpBoSQDQNoJ/PfSLOpzyJr4+6UCQOo4RUE31JOg6iNyLMhfqRaXCVqAMVKzMHZMPIJN6XJ5B
	JwaHOmwP+86SDIR5Coe6eAt7+GybNTJLQMoAAT2zWSr2tM86Jvrg10JQkhR1BqVmUuu/CSfYHWiqf
	8c+XCN1sdwLGKShzPnbvrvRpXg4RGNX6KS80rpvG1w6NOLlrBGoP4jipdZVMzxvzNvKK/vKLc4+ZN
	ie0xqZOn+Nki6VKmIwoFJXg1szufhryBx26f1hTiCBrSjFvtiuIKRrOPuk3jiNoOlTzQKyDJ7QsuE
	GyAfKr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxc1-00000005nlE-3xw1;
	Tue, 09 Jun 2026 14:39:29 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxbz-00000005nkF-3v9U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:39:29 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36bc065c298so525741a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015967; x=1781620767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9YFjxCDbSbDN2uR6oPNBA7yFa0nwiCUOct4EeQonTo=;
        b=SX83FxTmIF5K+twXgzJobDUiGma0CJS1nlab3FQcDGR/Slm8JzHD2TYNlZSj9pJqty
         ql5v/8TCpb4JmF+ZR4AWDOMVLh1RhKbLG8u706bTTnVxPEa+UO4/22cq0yF+sAIfZCGP
         K23LzORW7NOOI3NxlvGsYJAh+XqjHRfENzsPF81qTs6rYFRj49DM8+B9ooxnRGnHWZKO
         pQme/sEX3HJ2EWi7/AiMG33j8BUxKXMSaBrgVC5CYTHo3w7tDmURR17xOzdvY+rHEtzL
         jG5mXsMx/T58l+/oVEYP5nVB/KNsaEO43CPby9OpGmluEoVo3C1XQy29CfoJLC6Ila/T
         qHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015967; x=1781620767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f9YFjxCDbSbDN2uR6oPNBA7yFa0nwiCUOct4EeQonTo=;
        b=nrkEI6SaleXuyQtNeZ5FIFmWzI7QRIU/EjMP1igmXWaJzHkt6YbnMzjgBx3xHCmOLk
         r7ANlISHXzSjAG43LQRdczSjFOdp4wZTjoI5V3evlxkWrQToIoATo3qOU8QRuSGDqXLj
         U7L9DntEew63rfPcy1VsTVGmhyfubyiCm13prgwTJGPwwBi0Qr4xVBGqs1vAr9aUjH5a
         ZN6pndBoV/n8LDJ56+fO5aAedX4uG4Tk54SzMGJPwmgdkjDHpvqVwMJTli6Io6WNiPq1
         d4otsZSV8b5TKMtGa2xTas3goTMKHtnUkuU6NcT3/NL7/OJdKMczVG1+xAKkJiwWeNXV
         x9Hw==
X-Forwarded-Encrypted: i=1; AFNElJ9qH6XcrxQKno0muXo4X4b0k9zUdUJ5dSeCB2XheFpM/emv6G1fmlv4uSq8VZBWAzweMqQ8EBYZu+VHS0yKwTWA@lists.infradead.org
X-Gm-Message-State: AOJu0YxmuDkHw90BYtrSA+3+NVPwnu+rnoiRGxn+JX4SzHZD4WjoJaq5
	kv4m/o0SWKxbfT77UB2cM1kp8LBBQOXqWS1wFEkoavAG/uvmtKYk9RTH
X-Gm-Gg: Acq92OFSSu2tSFxX91ykK6dz6rWCrbetqzv9K4dYczZV7VhCWQ9mGcDNvLTDvXzPgZu
	wysm3GDhMQlzdaaKLwQmHhgZW3NzBsnM1LrEqtw6Gjp1kGSt2oZPxXvIljvLx+PvwYOPLpsOip5
	4r0GJaHQ7wlY4DNSzOX6OJrXzmYyf8GWU3SoHwCKvZl0zWFmcMnvnN3amDxm8Q6KlaRLO6RFq9g
	lNhA8pifezc99/SmnwdD+k9c5Vg12xXNGmD5udqfYVB6gyz63646lO02JGGFSFKPAewjP9uKtC4
	fbrsk4P43HziOksjw4RSk5v00NVQsoXPMxKhQAfmiQTdd/zP8LcRU565PFjQtzWtHGWK7l988rT
	izBWF7sf6Kvw9QSuVPSX9tF81cZ/1rxuHtb4/H8Ez8+RRAjjfp6jE4COeGl5R7ebfmtggF0wyeQ
	yDOU1IEZ2A82lUvxxSA+/Lf7C3FY3Cq55yMRf7Ts2mDVi567h/IJndrXGXfJI5x1X7pqwKpD9EF
	myOev+5dMntC/RKUqpTGLKk
X-Received: by 2002:a17:90a:4ca6:b0:375:c3da:c8bc with SMTP id 98e67ed59e1d1-375c3daca40mr361336a91.0.1781015966548;
        Tue, 09 Jun 2026 07:39:26 -0700 (PDT)
Received: from o6.lan ([188.253.112.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm17939677a12.26.2026.06.09.07.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:39:25 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH v2 2/3] arm64/mm: make pages read-only in the linear map
Date: Tue,  9 Jun 2026 22:38:00 +0800
Message-ID: <20260609143801.7917-3-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609143801.7917-1-xueyuan.chen21@gmail.com>
References: <20260609143801.7917-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073928_232520_B5B5D934 
X-CRM114-Status: GOOD (  12.21  )
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

Implement arch_make_pages_readonly() for arm64. Make the corresponding
linear-map range read-only so unexpected writes fault instead of
corrupting shared contents.

Respect can_set_direct_map() before touching the linear map. If arm64
cannot safely update the linear map at page granularity, leave the mapping
unchanged.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/mm/pageattr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index ce035e1b4eaf..da97ec7d5195 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2014, The Linux Foundation. All rights reserved.
  */
 #include <linux/kernel.h>
+#include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/mem_encrypt.h>
@@ -147,6 +148,18 @@ static int __change_memory_common(unsigned long start, unsigned long size,
 	return ret;
 }
 
+bool arch_make_pages_readonly(struct page *page, int nr_pages)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	if (!can_set_direct_map())
+		return false;
+
+	return !__change_memory_common(addr, PAGE_SIZE * nr_pages,
+				       __pgprot(PTE_RDONLY),
+				       __pgprot(PTE_WRITE));
+}
+
 static int change_memory_common(unsigned long addr, int numpages,
 				pgprot_t set_mask, pgprot_t clear_mask)
 {
-- 
2.47.3



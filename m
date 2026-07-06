Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EB5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZH7fYg3BL+IXLhasZWhU5qOs2NRzPPtU/E+Uj4YHFoU=; b=OlZwoCpBMX23F3ecjPXd0Aw3Ag
	ZYi711U+zLHYWRH/zXJQvVUs8OoUdpIT4D8y6zrxRrSfKoGLxkjaN1Z795CljMEkdvEP+w6bbPea1
	5H+VkViBboLbiw6Ep0nEzZYIZ/q+7J93LgBLmK5eVQFwlmSJy74IeTRNXOpDACOP5ccp2eGsHlWj6
	Eer57naDSAJmsPmRNdPVabnzpcZC8w1Z1/OAlgKL+SmMF9ZPYkSDetwdmj1Ta/hXE7v3P12/4HcPV
	yVkMQGXIOpimwGI/6g9guQUQP2SmO2DP5A9KKMXWplMH0vhpwzb0ZM+Rpb665SD3YxJM+ssWFTYvL
	31kAbisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgewC-0000000BsGW-406L;
	Mon, 06 Jul 2026 08:44:24 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgewA-0000000BsDv-24DO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:44:23 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so1918210a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327462; x=1783932262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZH7fYg3BL+IXLhasZWhU5qOs2NRzPPtU/E+Uj4YHFoU=;
        b=Iru4ucz8UkxIQuKAMujmXVqOwgLt0ns/O5Z4s3L6lUdmvXsbphf+SuLOkHBlhcbRTm
         J7xckeAu48cRlA5gVT2KhbyH0pAd3jgU7Ggkjd8HytexQL9qhaxdvRnJ9XRwlAK/905g
         n2OtllQNBozAA4W5zYdTi8kTut3JQE9iNQ4b54KDZ4omHuvLArX53MOvil5b3LqJUOGo
         zTHX189kpN0kyIo7K2kVp63rzZS9j5aNmVcIytySPWxr2NiPUCsn8LPJFwwwXI4354bb
         xm2dwPznBKxvyr27GC1v9rC69sg0fXP1i+4chQTU6xCmC/GwH2+7twS6VrbYEZEKvssu
         kXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327462; x=1783932262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZH7fYg3BL+IXLhasZWhU5qOs2NRzPPtU/E+Uj4YHFoU=;
        b=ch4hXh9SaeKE/nR8h2SJMZeZy6Q571+Qso/OMpsRM7XvQfn0CE+1IeJnDlpCdDReb8
         0bPJvcX8xveoFyNdMFjR4mdb/jCqeRit5ZBWKGom9CmMFdg2Fn6PqG66KiEJbir7ihTe
         erslInF21wmO1zE5a5fLgmjd/0oVEK+9l3wKDM1dzRUWwsbCejMZfQgNZboYFvXsYFOy
         hp3kYG+mBdBSGkmPs6IPtqEXZP28nEA/LwTbfiUIx0qgIv6reiy+YMnH1D3VSPIcncNk
         vBLCqN6A+W0+gSJlwRI9e5lkj6ez2FuMFZF6hPKwWN8RJ7W8kCijk/x5e+CsMiwpuv1B
         36pw==
X-Forwarded-Encrypted: i=1; AHgh+RqyOKtn+F1eg831E5C/JbZQeea2KyYFzckubyK7kvFAZr4zqXp6ig0kAymZx5FXw33SOZlPrIM/Kyv6Gip5zGYk@lists.infradead.org
X-Gm-Message-State: AOJu0YyPGMGYBf9zXgOEdeS7C0SEAmudXwRHOL5BPPAUpS+CKS3Inrq7
	MDo2ugT2/17yoDz+iHlvJqYVRpLjI5dE1yttc8XFuuXpxScAjd3mN9aa
X-Gm-Gg: AfdE7cnH1e8NOVW039Vfc+lQcDuROjwz9pxwDos7NoUzRgOIFOv7CS6m/tSqhEYFiVX
	piLg69fUMIW1KX0O5DoaYn14o9bJFomntTO/FcMX7mgqSMe425oZTNO+fIXDMVsLR3v2lW11ePR
	BYGNcKAa0NJ/DopcYIBzn4+hAnmrVnwqk2FufSr0oMtWfkqXf9PE17npGGQBotPbdXxHCXAijGT
	0FXyabvjWof7wapOdYsKQPZ/wdlUKoEjSSE0al/OlVSWlwxZjGQCy871mQosbLMlEWNW89JMLHf
	7lMAB4UaCX7INbPtw7W2OioDoQhLXHe/yfyeL13+2USdjd6YbXSTwvxpDGfx+3saosVYOUJjNiA
	D9irUO5nsJ/gOCNX1ZGWr96kWRyZXBSr0aDuWRNaXMBhhSrIjQCW9Iny0g+SFxCP7GuekNS7KPH
	6BuLDJvbFkcR/R7wKCQG0fImfJXkmQYTlEKX0=
X-Received: by 2002:a17:90b:5544:b0:37e:1c8f:3dff with SMTP id 98e67ed59e1d1-382808b3fd5mr9240351a91.11.1783327461600;
        Mon, 06 Jul 2026 01:44:21 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815c10fsm4524635a91.13.2026.07.06.01.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:44:21 -0700 (PDT)
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
Subject: [PATCH v5 6/6] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Mon,  6 Jul 2026 16:42:32 +0800
Message-Id: <20260706084232.177786-7-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706084232.177786-1-jiangwen6@xiaomi.com>
References: <20260706084232.177786-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014422_539386_7EDD38CB 
X-CRM114-Status: GOOD (  13.21  )
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

Try to align the vmap virtual address to PMD_SHIFT or a
larger PTE mapping size hinted by the architecture, so
contiguous pages can be batch-mapped when setting PMD or
PTE entries. We do not expect any significant overhead for
this.

Add __get_vm_area_node_aligned_caller() as a wrapper over
__get_vm_area_node() to simplify repeated calls with fixed
arguments.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmalloc.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index db0492151ad08..2ac805cdf18ad 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3314,6 +3314,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
+		unsigned long align, unsigned long flags, const void *caller)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  NUMA_NO_NODE, GFP_KERNEL, caller);
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
@@ -3626,6 +3634,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
+		unsigned long flags, pgprot_t prot, const void *caller)
+{
+	struct vm_struct *vm_area;
+	unsigned int shift;
+
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE) {
+		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	shift = arch_vmap_pte_supported_shift(size);
+	if (shift > PAGE_SHIFT) {
+		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3664,7 +3696,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, prot,
+				__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1



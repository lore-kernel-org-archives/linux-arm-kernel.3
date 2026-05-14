Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E0FCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6f7VCuNqJSNbGtIB9f0dkJuFICST/hbl5c+UwAGsc0=; b=oddVBQUmnAbDl5kts4VYyk5AhK
	cG2rfV5dPISqhEW5Buyyb4TovTs9jZT6HaMp7IZUIL/PeUWmZTqquXNe6fl+CTpjG/SpM2oNsp4Pm
	M4R1i6CsluuMJ7C+rWkhoT9MWht0pViq9u+Z2LsK90ZN4YEnCM2Ge23bIDxW8CMt6pFkicnP0/+mV
	WfmSHt8r9+3TVO3kxTfglMmIDDjw7O37Am560E/SitKC5SPm5ySXmu/vI56GWGNOpXKAqkvIfBfl2
	LJjkf/wD5gP6PS8fPbczZoQPhQBjImtfQrfU/s3tEPeE8iDWZOTSPnmAuzlfSOmWQNNo0ofbOhf2m
	hFIekg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSa8-000000056L2-40Ur;
	Thu, 14 May 2026 09:42:16 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSa6-000000056JE-49qm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:42:16 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c82a6278a4cso2037984a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778751734; x=1779356534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6f7VCuNqJSNbGtIB9f0dkJuFICST/hbl5c+UwAGsc0=;
        b=niOUtM6RqURrF9k9KV6iy/fBG2JQ1M8b4pGGCP2qW0iA1eOCbFvIPE6ueJdJ0A8NA/
         LRtSFjejKvTmE2oej5evZgNam7+kXg8bjjqlbg8jRn1xCbA5OJOhuKFBkfl4Cu6g2Q2y
         ak2/rIZTrKx7CVEXwQyJk8uRJiA+7GD3iyHZ399WiqGn0es5T5ZVwCRfWwCBqqeTbJ2Q
         gebh3eJzESOo+HCKPi6lQJX37H/1ZKO+BfCfWM3GbOghEjqNs1acQpLIyG7YwHUUCiIJ
         KsX9lGtug136ghg0MaroPWd1BY8ttNz2MBTJNUNM8b0VwY2SB9B2aFoc+AwywLQIGWFW
         aoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751734; x=1779356534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t6f7VCuNqJSNbGtIB9f0dkJuFICST/hbl5c+UwAGsc0=;
        b=l5sTJsCHr5bZ+fehYoI8xcMl2Ksv4wUJGg7ezSQxmP/wAYgTBf1XL1822IGDOXx0/5
         kLkswQ/JObEBp8idy3ebQVnPKFSTBLBozMU7UwhVN0SyTQ6VJeVNAyJ66zpwiAPdCAVk
         WXQhZ26DWUZso8roZC9qvc7vqo6J5OtWzQK+heLgHi+oe4KrIY/9SKJ0xAwxmQO96HWX
         xQorBlu3dU1q6Za560OCFq9ILlOiGc8T47dczmgXVRoBF5a5XnRbYyik/IqfpZcdnL1S
         z6kUQOsdxrP+Swhmt7Ro/GAAicsrr9WLk9LLKZQj2KYbF/yQWYyVRzYYIjw0qZN/yKGx
         yJmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xqvUukr8zEc1PNssmhTZsJoaDhiow7/e+Wnmt+vWboe3FzmQSKgk8NR+ZZ/EouS/VFHxt+KVsxFYtoP+8ArU4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx63Bqe6lXotpcqLq0410UVdnu13ZVYaEWcGkfDigsv4Oy5Dd1X
	KBIMdwCHrNUQQn7YMfLr10Km/8O8/9Gu5DTIwGYy1TB3wtKame8LKX9x
X-Gm-Gg: Acq92OFRP+5qePh4oTL4q1oeNUyBpY2dJQezn8gspcju4gv+RvHdxJusLja3dgL45Mc
	zY3O7qtDTW7HfhJg0evf7lZe0/vhAyh8oNzMDFR+m/tHTu1ZRRm/ixTZ9i4+R7oHhByS/lxaPbw
	/58cI95Y5CHYDHnfhrx3BL+gxWRWDmNIfTp3VmaVYri7wCi/dBVauXtLP/3KCYJb3GSgNUiTS4n
	C+gU8webIQd6XEtEW8s46mW1QTHxQFSNy35/F3gcVDh7mP0Py0PdA33ByTwh+ZPGHo1b5b+etVB
	mlzzpQVnuniyC9L5B+hbux87W7/g3pTyGPTG1Y/eymRdHSAQmQYkQ0RlSLdmV1//X5efJIXigLT
	wo1c4uUr4gER9mOqQ3YkhxlE9V0HhnupT98f+H03/4EtBAksr5hFUkAJWV/rUVCpB4RpzM5QbnG
	jKU2/MgUNdnEeXqK0FkNrqihA0JHhFz88+3rS7WVaBKTe2zor+WzKWMD9i
X-Received: by 2002:a05:6a20:7354:b0:39f:3ca8:a33b with SMTP id adf61e73a8af0-3afad844bf8mr7760924637.17.1778751733927;
        Thu, 14 May 2026 02:42:13 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb114a70sm2351244a12.22.2026.05.14.02.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:42:13 -0700 (PDT)
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
Subject: [PATCH v2 7/7] mm/vmalloc: Stop scanning for compound pages after encountering small pages in vmap
Date: Thu, 14 May 2026 17:41:08 +0800
Message-Id: <20260514094108.2016201-8-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_024215_033358_2B31E493 
X-CRM114-Status: GOOD (  10.00  )
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

Users typically allocate memory in descending orders, e.g.
8 → 4 → 0. Once an order-0 page is encountered, subsequent
pages are likely to also be order-0, so we stop scanning
for compound pages at that point.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmalloc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index b3389c8f1..60579bfbf 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3576,6 +3576,12 @@ static int __vmap_huge(unsigned long addr, unsigned long end,
 			map_addr = addr;
 			idx = i;
 		}
+		/*
+		 * Once small pages are encountered, the remaining pages
+		 * are likely small as well
+		 */
+		if (shift == PAGE_SHIFT)
+			break;
 
 		addr += 1UL << shift;
 		i += 1U << (shift - PAGE_SHIFT);
-- 
2.34.1



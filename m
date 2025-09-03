Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3082FCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 23:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXRq4apmEamZdvq2d1xSOZY75J3qH8SSfCfS4DJoIVY=; b=psuCMYh5qHYyPEXYc45brkQJx7
	H1iTqLXqGqzteTgl1ErCDzoREFL0P3rEZ1tIZSDXe+3BmLUscOAOZw+HSlKGMSbSOpwhALLxMnd9a
	t7b+ArHbrvxdKPhsABWz5uvWwF5vValOi+hpnGfAQ1WyYZfG9yovuCxqZslQakXexPIoPnWp4caL+
	U/9+wGWJMozahl3eChfSa0ifSsyYNfYH9nBpq3vn8+BLzSO4wrbz7YTMOj3m4usyAXOuSOjl5Smpj
	MuLQ6uyMm2mNiLKNgIX2rIdvrH8eBQTxSJjWLblRDlu0NKoyLszqlSukiwhAeSyVIptLwF99Z6j1V
	Ep/aP/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwVz-00000007rlE-36IV;
	Wed, 03 Sep 2025 23:03:43 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utshr-00000007NZv-3ixH;
	Wed, 03 Sep 2025 18:59:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-248ff68356aso8762795ad.1;
        Wed, 03 Sep 2025 11:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925983; x=1757530783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXRq4apmEamZdvq2d1xSOZY75J3qH8SSfCfS4DJoIVY=;
        b=jOl9G3Ixb4F5ZB9ag6aMqO6PC1RXl18a+7dAPm8EK7K4wzUSHBDRZ+zR5J1fqcToAJ
         MKej0b+4VwYjIv9m1pFcwaKca5vHFjlEWnQ5m+aQH3xzYPbjWuW6H83veQsd6RMI5kz5
         DcGANjkg2UJPqRhFsJbWBGzTP2kcvlOpDoVnzvAhCthszzc5dxHxMhWGBK9t3GEkvr1a
         IRe5viCA6lzJwu2aNVHvqDV9sT93PXhw48F5llWDY/q2MSYOyRm96Pf67I+HlmhkV1sa
         7+XCAsw0qo3vnwZ5J8EkaiMsisRYbFJbTPukOJqRDn+l9ClI2HOpWdbtpR0l/+5GgMnt
         w8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925983; x=1757530783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXRq4apmEamZdvq2d1xSOZY75J3qH8SSfCfS4DJoIVY=;
        b=ZAY+z3OExlvWv2hul48aLMULd82WLU9v1+kCpnCV5tQ2wqZpOrHiP3NNsiVA4URo9p
         usJOhlpPfTr+IDkBUW9EhGy44cLj4UQXj+um/QDw1xCkZnAai2Ewkku6nbhkM7noFMUG
         FhAQKiDeeUEMufm+rfch6YrvGUBJSFhBDW9obrlnL7Teg/FP8IFFo05uiRqjp5C6mWSL
         jXmvU/5uoBfXQprQFJcTAH88yj+QVKTBBVGwyJgB4aD+PR9BF0p0cCY4j5FOyap9Cgm2
         EG/3z6Xv1DrDYsHmm0Uk5IZ0CSe19A3qpgdtrlY/3YCC0ElmWnuwBR6Acp/Zt9fL/zej
         NkVw==
X-Forwarded-Encrypted: i=1; AJvYcCVWOUlxOapVsSZP0b6VtxnSf5LBti3ILJjDTurPk+K+tmeY8H5chwp8Z6qrxikadMPWl6xBqJK/MdxQzgmpmXdP@lists.infradead.org, AJvYcCWpCWIpj9Utpk2semJpsF2z6uuXZh46Z1vZnhValjtvhrVd7vWjvAvx+RIyAiE6Bp8ggJ4Gvx0IDpGXyKs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSFzJAHYaCqxERuY8NBuV8FYgiRvbfgU9QCrnsuouGJqbCsK5Z
	ELQL86Al06zIFaCYv76Uy5igtVZbOcnGUVs9Eww8/5/UKy6NXuqjYs3W
X-Gm-Gg: ASbGncsHzTOYulTAqaqkdjBG16n7nYaSiVz0Uijd/eJA9ipr5cvTAG+yenm4nOs/t79
	jek64PG5Ngsi+M7Z6UBrPOBqOpthyxyuF6KalxnQflbD32dsugTzkPj4BgzUAFQvnRefIjTM5rd
	zYC/yyjKKWj0wwP9rIEzDYneh8V+NrgFrqJg+6NQDYtSMvgAsEY1dulJjNzcyHj4ogsrNucN/cZ
	Y2Vq9Cpbnj+HraT7rrQe1/8Sbg8uKGkdvGAYK8cjhguX5GWfJi0+ya/xevm6qqGP8PG18yTsdKT
	N86I0y1N/864b3i2i2ft4iS+3kY5sfCuIWuuLHUeX1Rp075VoSa38nPnyro0So9MWOQcgh/YA0p
	12X3QrVMG/fF6a5RC40vLIuvDyuzHMjcBl9PJ2NfKfzIFzlvg/tJcnb+PjgWgrEMr+jRjwhMjOY
	Y=
X-Google-Smtp-Source: AGHT+IGnOdoMz4pWaL7qXoMT+R27TwnQ4+tCeRLJ9HFet8fs0efEGIfh6YbGSI9RHeToTjhpbJgt1A==
X-Received: by 2002:a17:902:f688:b0:248:aa0d:bb22 with SMTP id d9443c01a7336-249446d2aa2mr226131105ad.0.1756925983252;
        Wed, 03 Sep 2025 11:59:43 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:42 -0700 (PDT)
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
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3 5/7] powerpc: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:19 -0700
Message-ID: <20250903185921.1785167-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_115943_939419_DAFB3D48 
X-CRM114-Status: GOOD (  12.17  )
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
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index be523e5fe9c5..73977dbabcf2 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -780,7 +780,7 @@ static void __meminit free_vmemmap_pages(struct page *page,
 		while (nr_pages--)
 			free_reserved_page(page++);
 	} else
-		free_pages((unsigned long)page_address(page), order);
+		__free_pages(page, order);
 }
 
 static void __meminit remove_pte_table(pte_t *pte_start, unsigned long addr,
-- 
2.51.0



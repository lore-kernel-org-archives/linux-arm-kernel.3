Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C376CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 04:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCvnB/7xI7T/4p4mwWx/D4+W6s//h9G2+oSyfbDOFZs=; b=seahJIRZHhco/JoIrlA5uvfTSp
	Tf1HogDiJGgPx4JNtjqqkVL5YrC2G05ZGkmoiGoiV5dc4xnMyJy91Xaaw4zSPl3fpPUyCPWLwo06O
	yKj7kxUUI0gLpJ5kV4BCpmeKa4KDVqgnXuioBGxgtj2P6KLlqyt4dbDw2fd56d+JNawo4fsxIYERj
	1nz9vAvL4bZxxhmFaVe5ebbxGhjgcsXYJFYl8jRe1Ds6TGO6OyhBB5dHzPkhBMkSl0X17LI7u4wnd
	7XqY91+W0SZ3Dtvh0qaCdRYL+Jw9JXDT3qjnVW1M8I1KA3FsoUucGF/FXI5q/eosYmVoe6CpODto7
	BtPdVDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJJ3-00000001UsK-0fEp;
	Fri, 22 Aug 2025 04:23:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBbE-00000000OS2-26hP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCvnB/7xI7T/4p4mwWx/D4+W6s//h9G2+oSyfbDOFZs=;
	b=Z9/PRtaBMXa3oG43Z7l7QEAC/Vj27IPhW/dPzhTcTl9FRMNcy9RaGnyFG0ayVr4HLOI8yq
	FpvMOGGzZ4yqNm4caYeb3UmMQS0D4/RI1O90S/fEUqn/aK8mNbQhOTdeOEQhDM7Yb6wZix
	Ci8zs7vRVh2ro5K4pbEtc8oP3swwCTM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-e-eRGWNJO962h9Wv7ksNJg-1; Thu, 21 Aug 2025 16:07:52 -0400
X-MC-Unique: e-eRGWNJO962h9Wv7ksNJg-1
X-Mimecast-MFC-AGG-ID: e-eRGWNJO962h9Wv7ksNJg_1755806872
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45a1b0cb0aaso10738665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806872; x=1756411672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCvnB/7xI7T/4p4mwWx/D4+W6s//h9G2+oSyfbDOFZs=;
        b=BfjRaQ2othmVp4Ds/h9JQWNzzu/9ZvIAioWdrQRBddruV5ftuJ+mYd5iJl1IjmWSRZ
         xWeVcq1YE6XAIsegECPJGdcJ0sjcwmmSV0jIa+/uloF9U79leVZXwlMWvcpruaG+/gFe
         lwdxPHFymNcBa5iNPyZctjtHDuv2oBMi74Mqy0DS/yvxBPaI2TKJG85sfkQnCfBWRtMw
         PMqlHCpUB8DzCLhUCfDBQwBYdr/fFFKuThcfj+9Os9ips+UMk282TI+TAjSXggJ3l4Jj
         QH218UCoLM653vJInWR/8kyL0KR2GykBxVEHyQH6nbSianU8btl3ROScWL3Facya+z6a
         mpnA==
X-Forwarded-Encrypted: i=1; AJvYcCU6xN/uCnkpBUdZ7dlx95IYcU/iYb05rOGLDIRt65TePyjchcLcf/VXWVhVyCgBQtgAA0MFViYbtpe2pPEYMRzU@lists.infradead.org
X-Gm-Message-State: AOJu0YwpxadbIDHFVjH9plf2XpQW81rq2eKjkzUS40wF3eAxgtcEqR4J
	jdIGEz+liNtx9Jc/kUKstJSMBIDaa28R7IoWYozvUL9eeW25kJMUBns10SFNRP1j0tRuS/uVFpt
	3mzqKdooGDAJE82atuMvP+EZ/1LPBE85Sdx6gYF6GOaYaEfHxfD/OzwB2eRZ6MgYmCmgnD0qCU6
	YY
X-Gm-Gg: ASbGncuLkF6DUSO27wAjXuVEqk3NtaWAUgo/ysRBk/J7cELKX0QFemVwO5Ck9eDnPTv
	yugb+um1J3WI8wPObhBSaIrF1JRw5EDKJmkhOyQRdioPEb3UQg79wacPqj0eIL1DD5sZPCUqWEQ
	bdhfiXZR3lipcFJmPvcusWDbB44baLiWZpklZ43EyDhiDnjr9LZM1TxpgdRjTIuwdwiVUhTkfWf
	rceK94WN2oj1nxiIIRZfGRLXAmx3dgNt2oHrhn2xxk1HYRHU25IVnSpy4vhyDzaBA85JcOa5yAc
	cAq0SNQKKG8EwZa9re40ty7HBlNKY3zPTO3ffjU6YX8mOFX88ZpLCOVCF2iMseSacGipJemsOn+
	3OcS+QHxM6QDTimUYWdoYDg==
X-Received: by 2002:a05:600c:1d07:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-45b5179e897mr2278735e9.10.1755806871561;
        Thu, 21 Aug 2025 13:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQe1GSIQC6LfutgynQLrqB1o4Jo0GTrBjlhxRWjM7nqTD8l8oEo1HOcPxtIuVQVn3tsHm8QA==
X-Received: by 2002:a05:600c:1d07:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-45b5179e897mr2278575e9.10.1755806871147;
        Thu, 21 Aug 2025 13:07:51 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4e1d77e0sm22159155e9.0.2025.08.21.13.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:50 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 16/35] mm/pagewalk: drop nth_page() usage within folio in folio_walk_start()
Date: Thu, 21 Aug 2025 22:06:42 +0200
Message-ID: <20250821200701.1329277-17-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m0gAm2C07NqcfURWUJtGvvrXEODOrDfrMGJJ0sKDA7A_1755806872
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130928_607128_6D901EC2 
X-CRM114-Status: GOOD (  14.54  )
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

It's no longer required to use nth_page() within a folio, so let's just
drop the nth_page() in folio_walk_start().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/pagewalk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index c6753d370ff4e..9e4225e5fcf5c 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -1004,7 +1004,7 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 found:
 	if (expose_page)
 		/* Note: Offset from the mapped page, not the folio start. */
-		fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
+		fw->page = page + ((addr & (entry_size - 1)) >> PAGE_SHIFT);
 	else
 		fw->page = NULL;
 	fw->ptl = ptl;
-- 
2.50.1



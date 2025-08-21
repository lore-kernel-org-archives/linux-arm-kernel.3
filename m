Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3F1CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=; b=EfPU7uZHBmW4rBuFThTaLugJbD
	n59wAybZBtsSRjQ4Siqu0wk/MgtaDQGT72pHWcrfATK+ICC7r3WB76T95+rXcZ2iFS6///1MMR6Su
	UON9bHaLKhSIBb+fNsmNTDlZP6cCgvPyYRWdTrWg13q3llXOdRp5eopfCXWuw/el8U1388rD6BHPN
	4YI84f1ND55dpGVMQMuEQAwB1QQOdZhAklcDnsx5Y9zZzXMV005bH63S6bnQJXAZYP5lCjDczCF5M
	BSBHKsA5CUlCItZNTXtlYPcQzpry55N4JNuIIQQHNaeCpBsYtJKEO8800p3GwvAjqhXRFXc1UJjWF
	/ARsoM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKBA-00000001ZfG-2dVE;
	Fri, 22 Aug 2025 05:19:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBax-00000000ONJ-0LiI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
	b=F0rJ02Fy5sYdAzAIbmC3iZXjQcv2iB2rYRReDO6RkJ2QB4WZXKossWw3qqua5zDR5rxEDZ
	5D5PkzUYb9MZeHNBuJbCp/nQwthfcIkQ0hujA/CleQgbxuuoisYvpWU5+y0yne9tkyI6iO
	DhrZlsg07IslMxWBl8g+99lWRH/2Ptc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-vYIYomlfOZ2X-PngAKATww-1; Thu, 21 Aug 2025 16:07:39 -0400
X-MC-Unique: vYIYomlfOZ2X-PngAKATww-1
X-Mimecast-MFC-AGG-ID: vYIYomlfOZ2X-PngAKATww_1755806858
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45b51411839so821415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806858; x=1756411658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ4Uu4zoWyKmYQrq0i4l3HgKr6VpAHaNUVdQgPTsBAE=;
        b=BZWRfDBbVL+RLR+DCmhXqIeKhDV80o+kqudZzymhEP/SuwKGYrDHAb8EPBcTScYMxY
         cV93k5iYYHbsc1VouFhBxxXXOLRtHqIyILb2itNxk7EOARVueb+CJm1DkmC53zWQOQfM
         2PAP2mGAl26QSOzMR1+bFYAnLkJDKX30s9/NUJHjf+pizeGIYuzdM1h1CFAZZBA6fb63
         vi4/iPIS+KNgg2NXizvEcv7rElzIUiNDpwOq+ECu7TVQRCMtkwL518kuKUJAgZuGp1F6
         nWePZsS/QlK1f2nKXmF/1PCRuJT3IZ+4Os68D++RMnwUYGo8GEhNeMQ0JtMXer6ux0wX
         LeFw==
X-Forwarded-Encrypted: i=1; AJvYcCWgTqxdS3/GA03Kud8pXIU6HpMTbDbOlHkVac15iBcbjPEQBtJwUgsAh2nEx7GRCNw+Y6NnfK0WUtG6hi/7E7EX@lists.infradead.org
X-Gm-Message-State: AOJu0YwNPeT1RIvpd15c5UBVmpW7IbZ8881AFYGOiSOK0zhrFLT1aU8+
	mE8zhqeWoeOk/j9Ti/cS2MYFK3o6VG0fYrw75zx06/dFQV14YfUoM14w0453eeaCcVN/qp6zML3
	siRhzGItqUVAl5avDpXZg8Pfr/AD8kYgu1naPBP9yAG1S5NEqJSUPxGuzEaZmxMidmF+1o2pyoK
	xv
X-Gm-Gg: ASbGncttdEcxTcC9Fh5cbvsUYnjpVRouDzsg/Y4QNDzYBufmXQrnPoExMMGb4ZLBllv
	mIZMlvhxu7zIEDCG/jhsE9hTjoDbvZIzmscrADnlZL3xfrMngDlD+0npm1KwKTvbs17785wS+JF
	uphyuLe37yHfbaj9NAtaRaOQ60mUSjzWBcxNCN6mwguMoW1JmkcYyzWNYwkHq0dfuiJ4eRPcfRr
	hONnLJaHohn6RObXn+yf8zcUqLrEE5UdQXgh7UnfU1BveC+vMrasPdNsGXgLvDy12F9UxuwQIXw
	hwndFVgxSRhBXKO8qt2g5f9siNr2z/yHoYk1kQmRAW+8IG9o/TjryeNlMAPSkV7SG+uAeNMN/mm
	4PSUF+lYm+qUtauhujSg+5w==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-45b517ca54cmr2646745e9.18.1755806857904;
        Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlSU80KqPPviGOLp6CI40u/NjPujjG4FLCG6NoakJIlvY80lRDOTTm20w50mEKFuk0YjVSLQ==
X-Received: by 2002:a05:600c:5251:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-45b517ca54cmr2646245e9.18.1755806857378;
        Thu, 21 Aug 2025 13:07:37 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4e87858asm18672185e9.3.2025.08.21.13.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:36 -0700 (PDT)
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
Subject: [PATCH RFC 11/35] mm: sanity-check maximum folio size in folio_set_order()
Date: Thu, 21 Aug 2025 22:06:37 +0200
Message-ID: <20250821200701.1329277-12-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -ckiKNs34SYX4BsxzCMkKJaLltsx-a6xUSRaJSjquGM_1755806858
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130911_188989_771D49C6 
X-CRM114-Status: GOOD (  13.11  )
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

Let's sanity-check in folio_set_order() whether we would be trying to
create a folio with an order that would make it exceed MAX_FOLIO_ORDER.

This will enable the check whenever a folio/compound page is initialized
through prepare_compound_head() / prepare_compound_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/internal.h b/mm/internal.h
index 45b725c3dc030..946ce97036d67 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -755,6 +755,7 @@ static inline void folio_set_order(struct folio *folio, unsigned int order)
 {
 	if (WARN_ON_ONCE(!order || !folio_test_large(folio)))
 		return;
+	VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
 
 	folio->_flags_1 = (folio->_flags_1 & ~0xffUL) | order;
 #ifdef NR_PAGES_IN_LARGE_FOLIO
-- 
2.50.1



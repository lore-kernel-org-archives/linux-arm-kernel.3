Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BA0CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=; b=FNoVRPiXUzQb/oAQITdd/7Emfr
	d1q3scctWrKRtOA2hBvKqxyNOJ6EEq5K0jY9lDBABH7Bp4LLvWL/Tn9NxdR2LOjPc1iNPpYcO4SMe
	KGyuiSNDq+T5g54EijgvqgQgvGNOCgv+7OrBQoC5mYurO8y5/um+Qmrducf8ha6LOblTLqRfc80mS
	Gg6ZD0E0C8uCRHGjEJj/fuah7vahYdJh+UsshTmlL9NCnSP8aXtA7WScWRVQYooagGgmcc11W4/FM
	4SJEnFddV3+uHWFtnPbRWl0DdXrslZKvOQjEYo+5kQkUkjlsAz+HjXGSk/ZwQvNcKGZuYQDXQzFFb
	Fp2xH2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJwd-00000001YMd-33af;
	Fri, 22 Aug 2025 05:04:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZL-00000000NSL-1CnJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
	b=YjT7EvFrJT5scdeM5Zhxs1Qk/Cqch+J+8hIxWxlHb7nVNU02myxpnBeJveCAmU84L9yDad
	vtsRlwxqXN6zx8RcnWcVFKhynJbqTs2VIm3xSpDL2hddvTFVyKK/czblWXG8Igw2XVihhk
	Fb0YTZpxr5lzYg/3oduk7oOlhbYva1I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-Yx0HbF4PPKukWLvbOKq1bw-1; Thu, 21 Aug 2025 16:07:28 -0400
X-MC-Unique: Yx0HbF4PPKukWLvbOKq1bw-1
X-Mimecast-MFC-AGG-ID: Yx0HbF4PPKukWLvbOKq1bw_1755806847
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b0cb0aaso10735285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806847; x=1756411647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9Znt0atqEjtEUkbTSfKRsvBJ9rEcbnqI7Kn1XkJSrA=;
        b=W6fo+WC94wkOXvp7zYJNyXa8ccG1mvMvX89jIeuEYt/GwPmVb5Ghtfnk8C/CZuvGV+
         dtRtPxwb3nD8IozFi/vbVqzuAKS8FlKFfaJzjYSHqKcgb97nKDdHdOz1/yK+JG9upexD
         CAlwDOJWKmWn29ARYryWCcLNVQ/wl5kOIp8b/HGQuMISZpQrAh8ZdEcEmYqoTvdpMv4d
         uUfJ3qMIo+ut1iUO/ClNLe2kGNwHwQpUKdcmz5k/JAK/0mpem5Sr7dO3lGF4pkQy5K5W
         5cWsGVL2Nm2sF4nhu2zN2fcdybFblxf5XoT0eN3Zd5/7UWmBD8EHzEDHlwekrfUvmhJF
         ZrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbTYUMBIA7P7+LfangC13A9Khpr7XKA0h8WjAjUM/qB6bD7KfMB/c4Gc8d6iEzjOXjCFhx0pzJqyxLs/4YrkaN@lists.infradead.org
X-Gm-Message-State: AOJu0YzFryPxi+afCKcb7eYIxgaY/XECgxV3LNm3U05/WE5amrQYZeq/
	3zR/kLgDVMhbvPHJDL6hFXx6obqgfzymDBGR1TMSuR6uuVvU+Zy70dq3gm2rs+Elb00AVDbI7Ui
	oAtCQkA0l4F05oLrpxvrOXW5KOUJQLSFzmcxjg/civOPZJIzbB4tQHTH5nkOFt3CtxpfX6afMi5
	Kw
X-Gm-Gg: ASbGncsmycbo9xjk3dmc4D2bpe0j2G2A8eY8BYTKmyJKm2XXvTBtzA1lW3Lz/RQqB2z
	SkOvPCiDP0psgZeH00HVCV7K0xdUyS5j8FF99S5pgSL0AIJW0CxcLyqGSNwCecG+ypx1Cbx0Fga
	GdIq4V5Hhddpo0MicBu2837qBW3ApN4d9etjaVnNrXoBSKkuReFzGYyZCL7vBVIaKyGFEMI2IRN
	xUpCI9bUd7NokGrK05vCkURYjS+GYFA05dl0HWRl2cO7DABV+b1DUeC/45HRGKylnFlbm1pMS9B
	p1wEu6U4wHowaOt5zkCJh3Zc+Ch7T4Zz0KBvsedFyhGBtdRw6DnKoC7T7FoBorbvogU1xvbys9T
	xUzVi6EfSzDQ1wzMjDfVPxw==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45b517d26d4mr2922395e9.26.1755806847244;
        Thu, 21 Aug 2025 13:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUeapMM5JkcwJNJXC+LM6ICHu4lGUEF2ir46AAuHXhYXAFzTcPIdec/q/lplZD/isU7mGEgg==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45b517d26d4mr2921795e9.26.1755806846742;
        Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50d62991sm9535385e9.0.2025.08.21.13.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:26 -0700 (PDT)
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
Subject: [PATCH RFC 07/35] mm/memremap: reject unreasonable folio/compound page sizes in memremap_pages()
Date: Thu, 21 Aug 2025 22:06:33 +0200
Message-ID: <20250821200701.1329277-8-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kjn5xxAxMWKkJExT8RV8x6IHROX9n0k2aik216ayqME_1755806847
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130731_426035_A033BD21 
X-CRM114-Status: GOOD (  14.30  )
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

Let's reject unreasonable folio sizes early, where we can still fail.
We'll add sanity checks to prepare_compound_head/prepare_compound_page
next.

Is there a way to configure a system such that unreasonable folio sizes
would be possible? It would already be rather questionable.

If so, we'd probably want to bail out earlier, where we can avoid a
WARN and just report a proper error message that indicates where
something went wrong such that we messed up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memremap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/memremap.c b/mm/memremap.c
index b0ce0d8254bd8..a2d4bb88f64b6 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -275,6 +275,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	if (WARN_ONCE(!nr_range, "nr_range must be specified\n"))
 		return ERR_PTR(-EINVAL);
+	if (WARN_ONCE(pgmap->vmemmap_shift > MAX_FOLIO_ORDER,
+		      "requested folio size unsupported\n"))
+		return ERR_PTR(-EINVAL);
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
-- 
2.50.1



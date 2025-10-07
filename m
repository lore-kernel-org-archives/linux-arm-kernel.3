Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EF3CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dmbXUVSLKd9bSlEnT0VG6XHvP3bFxOE7VRW3AC7JgU=; b=vnrYRhdFokINmAFnskPHjM7zoF
	35lNcO8nhOv6GydoWvKFaNxn6VxbzDk0RIXjb8rZntpBkRnEAzfnLxjyTJiEfKrMpZrsMhzM7rjWC
	gYRcVaH5O5Irc37RM+9quhgO3n2ICrugjnIDJdRzPwpP60xu8MaokWEFI2Iq+/kdweNE5PrGFAtt6
	eVKZ9NJlV1lrOxrEsosg40iJTOMimTyilQWjF6lIPChxsckSrT4TVMt0XccYQpvOW2jEZDSoC5C/h
	hvyfDpMzaS8UZiUM/V7eMJX4O3MFw2fBXBt2m6uJEp5EZngh1Ncj7U2vRrFaTpMnKmsnsenGGKyqT
	M2iJn0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxD-00000002qT1-2u6P;
	Tue, 07 Oct 2025 22:14:43 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxC-00000002qRj-0mvh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:14:43 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so3461072a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875281; x=1760480081; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5dmbXUVSLKd9bSlEnT0VG6XHvP3bFxOE7VRW3AC7JgU=;
        b=AKFaDNU0Y8nRPaQmZCj2Kr1Ftp+cPjK8x5TG2KEmA8Te8eNK8NiGz7y0YUa0X+SFJ1
         iP2AAjC8RD78rYBNe46OkbuxM7DNAWmspCZsEyC29zEGG4vOIbO3AqV6O2vnt+yH6PxX
         FhZW775GDSrM6eMUqjBdMme4bUXP2C3Mqy4O5dcCUTy1sL2smctRN2F7GpW/Hcklu9BU
         YQU/r5G0sQ9cLdBhB/xwRjI9JrLNb1fAX7nEP1xDBMw7D09L3bjvd2pnly8JSg5/3q09
         Fi6jTgBDyeidOQlwLCSn6OZLlPwKiBkfteUDByEF4sbOUr+jfHwRarra2FSzrWVtTai6
         yHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875281; x=1760480081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dmbXUVSLKd9bSlEnT0VG6XHvP3bFxOE7VRW3AC7JgU=;
        b=iSF7du1tZkG1tIZDmGN5MFAL4PvxZA6LJSAScrTrQZVq6qWyOQbijLtUJ42qyeSXcL
         +I73kq+c1wVysxGlUUZIY3Y5LUM6bbDU6kD/eWRCEfhNrSBIaVFZfkeM5pbozQkyd8l7
         H5UqdUCIDkGnihSNapKpQgcO9T7garSWMNRNKDwG9K4v5fCeVE83yCBp1rjAqj2/+3Pe
         J1IlvXI1M+sGd9iGvWYQZC0O5q83Gb4ElOHbQGD5FJUFBOtpokwssfRJavJZ5fCyy2hc
         3xZI5MajyFd3Sp0gz63PZDF3zCmhxiad1+6+P1hJJefliFx8TkHlGcHa/uxj7PtBZ/ti
         t6bw==
X-Gm-Message-State: AOJu0YzdjKSH+SV2T6EgbrW8bC0vcMVw2lFWsrIZrLNpnUlIGk07Ha29
	xoqtVjefgBkEula2PWAnpvSm64WGITJkmxACs8lH+caOhkweg2LsgfYJ0cgALlH+izjPAcic7LD
	eej7zJA==
X-Google-Smtp-Source: AGHT+IFtELfPuC1E9Gi/gZ0IIwRTquQz/eR0bBtgh0yn3iXudV5xJa4KSH0/8AxoiBoCF/S9YIizGIBH2jI=
X-Received: from plow6.prod.google.com ([2002:a17:903:1b06:b0:290:28e2:ce51])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f602:b0:274:9dae:6a6d
 with SMTP id d9443c01a7336-290272c1a67mr16678315ad.34.1759875280674; Tue, 07
 Oct 2025 15:14:40 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:10 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-3-seanjc@google.com>
Subject: [PATCH v12 02/12] KVM: guest_memfd: Add macro to iterate over
 gmem_files for a mapping/inode
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_151442_229538_2B75FAEF 
X-CRM114-Status: GOOD (  11.94  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add a kvm_gmem_for_each_file() to make it more obvious that KVM is
iterating over guest_memfd _files_, not guest_memfd instances, as could
be assumed given the name "gmem_list".

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 3c57fb42f12c..9b9e239b3073 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -22,6 +22,9 @@ struct gmem_file {
 	struct list_head entry;
 };
 
+#define kvm_gmem_for_each_file(f, mapping) \
+	list_for_each_entry(f, &(mapping)->i_private_list, entry)
+
 /**
  * folio_file_pfn - like folio_file_page, but return a pfn.
  * @folio: The folio which contains this index.
@@ -159,13 +162,12 @@ static void __kvm_gmem_invalidate_begin(struct gmem_file *f, pgoff_t start,
 static void kvm_gmem_invalidate_begin(struct inode *inode, pgoff_t start,
 				      pgoff_t end)
 {
-	struct list_head *gmem_list = &inode->i_mapping->i_private_list;
 	enum kvm_gfn_range_filter attr_filter;
 	struct gmem_file *f;
 
 	attr_filter = kvm_gmem_get_invalidate_filter(inode);
 
-	list_for_each_entry(f, gmem_list, entry)
+	kvm_gmem_for_each_file(f, inode->i_mapping)
 		__kvm_gmem_invalidate_begin(f, start, end, attr_filter);
 }
 
@@ -184,10 +186,9 @@ static void __kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
 static void kvm_gmem_invalidate_end(struct inode *inode, pgoff_t start,
 				    pgoff_t end)
 {
-	struct list_head *gmem_list = &inode->i_mapping->i_private_list;
 	struct gmem_file *f;
 
-	list_for_each_entry(f, gmem_list, entry)
+	kvm_gmem_for_each_file(f, inode->i_mapping)
 		__kvm_gmem_invalidate_end(f, start, end);
 }
 
-- 
2.51.0.710.ga91ca5db03-goog



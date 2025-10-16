Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328F1CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tAVv6b9fRDhntp0ml3AD/e15cFGLUttzwV4nvdq0R8=; b=gs9VdJgiDjmXL/ZNi35yY52Zw7
	Av4VeyN7qJwIYtdfWL7KtWYJoCwLDyUyoBIX68iBd34TxLYaG9jKRkgpoWrgf1n20syD6p969rxZf
	HtCihY4bjL4f5E0e4yK1AYlKr6qEOBIcyeIAr5qQVe6ZEqCsRuT2AAnu1BGmBz0IgfgsIV/us/cLi
	EvBOPrNQtB0wGWdyJpd1+AuHz5Flc2FeOkXCB8TbIqFWvCjKsEs111BRttRM5eT3i3vA3TtGWgL8O
	AGwAHuB2jaXT2B2XZJ42Qdapx7ppmD/pAbuQH0++cDt+uSpjQ5hZ5gppD2DT2cWt0VNA7/3Z+vw8Z
	bKIDXh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rns-00000005Zb6-44WZ;
	Thu, 16 Oct 2025 17:30:16 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rnp-00000005ZZJ-1sFD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:14 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so893383a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635812; x=1761240612; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6tAVv6b9fRDhntp0ml3AD/e15cFGLUttzwV4nvdq0R8=;
        b=x4JWS66k/SIW05k+3C02gjLZxcsehjNbJvRVIeS3IEXQXjfQn2+YrhKd1jlEZtnaf9
         GfdSTv1twpMJvPPVff+WssH+1pm6zmGyVjWyJWNca+vDJtdTYdcIMosOaHBbK61hpik0
         Z9AoTR7mUuDGV1lPciaPCcOD9PTvd4cIeLnRNFmeb1CuQuUwL0AGrqanjWo7NQeeUw2I
         2w7UDzoONX9pszF5rZZfbVnN666/K7Qwn7sKrImeTWxS8Kn3oGkN9hLWFhY60e1JiL3n
         S4WTVRIytfM4OldLeqDzr3XCNjmCLY+rdZnPRsX6LsCWnQisP9wOvhYokUCjpCkai8Kh
         nAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635812; x=1761240612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tAVv6b9fRDhntp0ml3AD/e15cFGLUttzwV4nvdq0R8=;
        b=aU9FCBz3Opa5hXcsvO2Tx+6Q6cC3Ffv8y8n0gTQ6LZhZq81JCKSJ4yUcV1gkXNNl0j
         BPVJLosymwq5x16YeMHk80HEdUseDP+uuiS+0Ddl2oOgArfQs+XCgZUJ7NOLu/xaovwN
         N1gio0Ku79O8u1otBLPQrXMunxq+i+XGv0b+SWfwNUKDahUtuEzSkRLkLsYSD3D1bZHa
         DUseh40J5zVvS4LDEwgn1eHkv9154FaP8SY7L41tIlM8kvc4EM6BLTSeSDcR/xWny0y9
         J5lxJs8n2oAzssI8nbMQEuAUr6Pa8XdzG2nGrB3PVJ3m8vdS0c8hHEut8a0JKtMA4R5l
         WRpQ==
X-Gm-Message-State: AOJu0YyTPoR+SgXksIkEHqGy8iFrKANmfQ1y78RFf2yS7YpdtHMvTEKt
	sPEdna4iIm0wj29rSgrtdk8ELLqgeU4NKnte5tW8UG6ov8VQViDt4E0FlsFSkULUNFfTT9PCwyd
	F4bqwfw==
X-Google-Smtp-Source: AGHT+IFiziQxx4vN6XNlZpR7uI1Y1WkivFjq8+/qZ9wHBFeEPxqCLQgsLYXVUg11kld4O3lt/m0fng8h7Tw=
X-Received: from pji6.prod.google.com ([2002:a17:90b:3fc6:b0:33b:ca21:e3e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e43:b0:339:cece:a99
 with SMTP id 98e67ed59e1d1-33bcf86c699mr779489a91.13.1760635812664; Thu, 16
 Oct 2025 10:30:12 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:43 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-3-seanjc@google.com>
Subject: [PATCH v13 02/12] KVM: guest_memfd: Add macro to iterate over
 gmem_files for a mapping/inode
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_103013_504783_F4F8FE9A 
X-CRM114-Status: GOOD (  12.41  )
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

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .clang-format          | 1 +
 virt/kvm/guest_memfd.c | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/.clang-format b/.clang-format
index f371a13b4d19..220cda77a8f1 100644
--- a/.clang-format
+++ b/.clang-format
@@ -540,6 +540,7 @@ ForEachMacros:
   - 'kvm_for_each_memslot'
   - 'kvm_for_each_memslot_in_gfn_range'
   - 'kvm_for_each_vcpu'
+  - 'kvm_gmem_for_each_file'
   - 'libbpf_nla_for_each_attr'
   - 'list_for_each'
   - 'list_for_each_codec'
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 2989c5fe426f..5cce20ff418d 100644
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
@@ -164,13 +167,12 @@ static void __kvm_gmem_invalidate_begin(struct gmem_file *f, pgoff_t start,
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
 
@@ -189,10 +191,9 @@ static void __kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
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
2.51.0.858.gf9c4a03a3a-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED95C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1YWU7ablLeHyEQZv+XErUzYidgNy71lF3ZCKk+Y1ss=; b=Tucq63pQvfGiCH5dBNC/XIT9ZK
	lFH2xBmY2rgVIq9URXi2UdtornmnhhBvlq0VNddMDoV8Z20Nt5BVdhF7fc9HkK93adnw6JE2qeOH4
	TEBEC0bMjbAwhZ52AWFtW+qJcr7RsQxYevMGS4IcgwcG8MBBsakgxwO0ucmEUBWliiy829MIbeQmz
	P3UmgCU1B1FUaYj7arBuFvmNnM4X3EBk9WGz2wLvcu/8pfcdt/lrtWjjMti9v1CaUNRLQneEqjsEv
	KVoksI8U245md6pf6H6uwZizkmPTZC6ZzvSp36X+TbR4aB4to9w4qaLSQ9hhm5JEmHE+0Yb+btMIx
	jFRiWidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtc1-00000000HVZ-3pdn;
	Tue, 29 Jul 2025 23:20:01 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEW-00000000DnD-3VBG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:45 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b421b03d498so55740a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829743; x=1754434543; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M1YWU7ablLeHyEQZv+XErUzYidgNy71lF3ZCKk+Y1ss=;
        b=GdVeJmRZDTGGeWOUdvOlLqLXJE4Bo1yu8zptIzLKo7J+3YQUEuqdmG/sa+CqsOgU/K
         OlT336xERWLabxOAbyAlVcfoZGtj48XLJeO24UKO2ZbCwZhrHkEyOT2gPirqhacgRVPJ
         juhDcB7c5J4Hg1I3uupUUVusG8aCBfKoD3X4Me2qNKiEQwiNPoCBb/G/mHYyZT1tVlii
         mroGz+3n1OP0ods1p27/XS82btPgkRb/XQ/qiTJu0OJeC81Qo1+1Kh1qo3odYeMsVRSk
         0R1g/tErkedcXALgiuXEF5KepnWwWGIt1QEH2FVhK0FMu/MRvAF3eQA9WpAxpoZ27h9w
         MSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829743; x=1754434543;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1YWU7ablLeHyEQZv+XErUzYidgNy71lF3ZCKk+Y1ss=;
        b=RoFejkC0D/JDYLZoUVTOohyW9W7lr0UbfTEUphtxbqBLi7QwCXOL5UWasTime5uDS5
         S9Ss4IZISTBtIz4Z4UdrGoNZZy0BgvK6pAyBlddK3pwnmU62nLdz3lBnlJWay64ua2CL
         Y/AkmzOWo4kkIjOVGIjv6gWHij42DckQ32ZnCuL2eM8zBecn3eNi3IDe5Fm3NVQQr4MF
         kZrwgnFq+ThX7koGN46gwe4fTAbt4n55rOF0KYPogEm7piYA708xXWFsyoyLZgwh6roS
         ZxyZQWo0wmSRGJQCM2NiMOsvxqproxTv13BjKBBoWOfUwZcnVbuiMG9tTbgFskOG8gDY
         a+ew==
X-Forwarded-Encrypted: i=1; AJvYcCWb6cGzQBrjf60JqaaDJMtHVr3eZ1PmRfxLIWr5nX9NsJxkJuvx+Xc52fdo6gtcaPMLEoHH6+QgvPsl6No3QxRY@lists.infradead.org
X-Gm-Message-State: AOJu0YzSBt8D3HzjnlZO0KX/pbJJxL2AAogPWVLXFEjqPX4DWXyUYU+N
	fgxPjlLEZaoKdr/9YdgEailKx5GIEKh93aSsDDBdqLLHLS/zKRbrKaKQlwML9x0Riwcm4RxLp27
	opY06Tg==
X-Google-Smtp-Source: AGHT+IGVcslDz7bQMIRMZU+0Y4qmg1DflFiXRNbdJAEQP1alfIjp0PIHNIVeHhCtlJmnFtEV0iZyubohx5w=
X-Received: from pjbqo4.prod.google.com ([2002:a17:90b:3dc4:b0:31e:cbc7:c55d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5111:b0:31f:1744:e7fd
 with SMTP id 98e67ed59e1d1-31f5de569fdmr1627875a91.31.1753829743638; Tue, 29
 Jul 2025 15:55:43 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:39 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-9-seanjc@google.com>
Subject: [PATCH v17 08/24] KVM: Fix comment that refers to kvm uapi header path
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155544_871216_71EDD50E 
X-CRM114-Status: GOOD (  12.22  )
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

From: Fuad Tabba <tabba@google.com>

The comment that points to the path where the user-visible memslot flags
are refers to an outdated path and has a typo.

Update the comment to refer to the correct path.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5c25b03d3d50..56ea8c862cfd 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -52,7 +52,7 @@
 /*
  * The bit 16 ~ bit 31 of kvm_userspace_memory_region::flags are internally
  * used in kvm, other bits are visible for userspace which are defined in
- * include/linux/kvm_h.
+ * include/uapi/linux/kvm.h.
  */
 #define KVM_MEMSLOT_INVALID	(1UL << 16)
 
-- 
2.50.1.552.g942d659e1b-goog



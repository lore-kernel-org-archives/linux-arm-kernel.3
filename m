Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03FCE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5zlVcABwgcAqDrk/hYCqATZ71WnZcE4eWZqt1Al9mM=; b=ZCd3xqCpzd6t4xGO05uozfGBDp
	XcFChRefesZyGeORWXOS1AHz1DnIYB4wE51FaINcXphYuFUClLZbGIIOWn6i+QI/FioMLieUJhkBt
	+qlaHyNs+AaS8hoM5rLKUFT9MJBPklWI+6LTCpIEhsC+Xb7J4FpidLzvUPy30fHs+FcMilX3UQ4K5
	qJOaBC9zypLnmtyEWK9e4idldcpGVDp5UktjE2Qj+JqiFXh7ws4D0LdRvlbt1wC/lF4UA7dTWXZT8
	Un1iwBtk0EoMu6J4dWb8HtR3x3IUFhiSdqy2V6cen4JDTM1jnEE56xg9sqbzS/3ZUmEyC7hdR9JkQ
	atNzqPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIv1J-0000000Dg7l-2WVT;
	Wed, 04 Dec 2024 19:26:45 +0000
Received: from mail-vs1-xe4a.google.com ([2607:f8b0:4864:20::e4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupQ-0000000Ddn6-05VP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:29 +0000
Received: by mail-vs1-xe4a.google.com with SMTP id ada2fe7eead31-4afa80fda63so10659137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339666; x=1733944466; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s5zlVcABwgcAqDrk/hYCqATZ71WnZcE4eWZqt1Al9mM=;
        b=3fngGQe663BGMUt+iQpvjVg4RjeEfOiZrjEAtQWMY5CFemmb7MUOKKIfbGQH39iva+
         zrO2J2LdZ9mofwnRd5y3NUd2xOYlfeGOg7BDplCaMJ9I6tWPzkTwS5EVWS7/Q65QXKRg
         wvZaz2L2UDwEf+BtAn+3pNftjqHn6GCE+jdsA8cb8eUoV1vICivxTxaMA/w0KHKE03Lv
         qoSL10kmXYUvRTxwhdqb2PV++d+OsOQgpNt992y6gnvKlRp30CZO2c+wICwZF1sdzmVY
         RjEcB8ulCCxQ9k1htP/1hbHHru+huY6xQwlcFk6HwyCOWPUo74IvUyb3IjmdgICEo3Jl
         60CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339666; x=1733944466;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5zlVcABwgcAqDrk/hYCqATZ71WnZcE4eWZqt1Al9mM=;
        b=e85/PutlAbPkfAzZ2jxi+5ksbFUwMrsdlS7+5JnEEw2upM9HuzK9RYb6+q2WmDif0u
         STZnF8M28VlQZWup7wFv25utJQLv0wSCxrvMh39uQxRx9wEtvJ+DzNfkAP8coLFCmQFb
         xDr/e06OdxI8YEdoZAlDDS+nxrZu6OhanuSbx+N1I/NzPB2NdVDEnaEmn+kw2NYj+Dhb
         W7NFNrnt8HXL8YN1A+Eu6TiRwhr2GO32BMEf6n2biZGxXfFVDmyJsPgHvppqm2KnmHUO
         COj1AXYnSt57NmL1SsJpeBO3sKbbEfHiez6iJAvgA3l3XjnwKBwKZGJi1+WMSg7FqL7i
         iK9A==
X-Forwarded-Encrypted: i=1; AJvYcCU1iIy73JqA8PlDbJzKlMABk3X/x9TxTFs/stP25wugJP0UxVJ05Z3t8IcYaJgsRK86TJAiOdqyECXDXvI729wa@lists.infradead.org
X-Gm-Message-State: AOJu0YxhDiVIQsMTnwZvKZkADWyhNM2XDN/EArPAiu63pjXol/yMDwfc
	p/9ayc+8Wj2Rac0ElyJRmPvI4mx7AX7/3C1rYRYxvjv0Uo9S9j7Nz0ceIxALT0cAzfaeqoAd1hR
	hVgQW9ks7z5SX665qmQ==
X-Google-Smtp-Source: AGHT+IF2FEM1OG8guhI8P1BVhXWIFhfslfAcmBKz5oOAxjNRJSTj9A5XfYD8J6BgPkOCk8O5eB0FX2IaOdHwSH+I
X-Received: from vsvj20.prod.google.com ([2002:a05:6102:3e14:b0:4af:5a9b:90bd])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3ed0:b0:4a3:ab95:9637 with SMTP id ada2fe7eead31-4af97243dc7mr11657456137.12.1733339666111;
 Wed, 04 Dec 2024 11:14:26 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:46 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-12-jthoughton@google.com>
Subject: [PATCH v1 11/13] KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111428_054723_F8B218FA 
X-CRM114-Status: GOOD (  11.18  )
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

The KVM_MEM_USERFAULT flag is supported iff KVM_CAP_USERFAULT is
available.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index a8267628e9ed..d233cdfb0241 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -364,6 +364,9 @@ static void test_invalid_memory_region_flags(void)
 	if (kvm_check_cap(KVM_CAP_MEMORY_ATTRIBUTES) & KVM_MEMORY_ATTRIBUTE_PRIVATE)
 		supported_flags |= KVM_MEM_GUEST_MEMFD;
 
+	if (kvm_check_cap(KVM_CAP_USERFAULT))
+		supported_flags |= KVM_MEM_USERFAULT;
+
 	for (i = 0; i < 32; i++) {
 		if ((supported_flags & BIT(i)) && !(v2_only_flags & BIT(i)))
 			continue;
-- 
2.47.0.338.g60cca15819-goog



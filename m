Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B22FE77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X68RCfWU06ROg+bUYFUfNwQoohzZnJeYoYKE3JS2eGc=; b=j3pu6UzwAWvdba9yhTy4np9ngD
	2sBNWfoAf3Kyg4Z1fOCmw4yWQxIXGpskwsmW/SPMqVJNJmGHWETZkqzrDj7ekOIUORim8i6rSdGo5
	WBJkNqAmBcd++lrqeO7B9ulBlu0HQitfY4wsLvGDnn0W7bLuXm0fCmBUieBAMucZF6H3LLFxBxktY
	SWrkc+5we3GmcTyPV/FITBjGziS55G2ZJWXjMYa7oYTduIB5UtwXvatnNOMijetJQ1L9BdfnU9TpX
	wJGTLCnj4ZI3KpOroPyYEAcq0xHEGY8fMprDx9HYpOBi4RaJ5RDqKnIE4zjoJgAzjghUIA4yCZmUi
	ygtaFBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIv2I-0000000DgIL-15QW;
	Wed, 04 Dec 2024 19:27:46 +0000
Received: from mail-vk1-xa4a.google.com ([2607:f8b0:4864:20::a4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupQ-0000000Ddo8-1icA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:29 +0000
Received: by mail-vk1-xa4a.google.com with SMTP id 71dfb90a1353d-515d07b1251so54671e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339667; x=1733944467; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X68RCfWU06ROg+bUYFUfNwQoohzZnJeYoYKE3JS2eGc=;
        b=lphSWCurRDHFWBGoSHfp/jH3A6z6ENNhmGycxy05U/3liRozy9ASXsQya+an+bsxBT
         9aJnjrp73huiTou5EZDAg4HlTd2YH5fUM39o62F/7uvFjk1JwiJh32UrhDIRWJ3mSB08
         Nhqxg+31J37Grtr8c/7qMCvZyhVKtz27lyH1oitMV8lDiJvPECi/oUbaGMX7cXIgiTZW
         zhA9Z2Jt1JErg6M1IIB5D0gyZ4UOnKEh+IAcgTWFbR7Hipd+ZVdaEQ/EvQ5nJ/g/nb79
         ripRYo1pYuUav7Sm2n1gM/ILhq8qErrOGRa7au72jOuabxd5O04Bct+0enoOX/B9FZbj
         FN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339667; x=1733944467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X68RCfWU06ROg+bUYFUfNwQoohzZnJeYoYKE3JS2eGc=;
        b=DOo9I6zrkDxboptS6uFaaR6j8bTJDSDbGSGDJx89dBIZeqQyFq6Q3m4KtsJ2SaOtWP
         rFRjmjspp1Lv+mz26+8lyP8/Sm0w5HLUfuqFUxWNZFyJdy2Pd2RfmFRKV53LdNDZ/+pL
         3QbgEahpr1+CZaVyMr3b8AJqpklxoW7Zh6xt7cOzTFKK1SsyMdk81YxpxqLH8crjeA17
         l3WL4rs0VkpVzwMiYI3OZ/W10/hPd+8JALVJj2pd35znH3UCforlcxSKTLJwhy+9IzM3
         YdXfCoUO0szU0mbv+KOTSXn2CTYSkfZwqtmfQNUdBNCtSLHxjkdFegG3FspgwQVmMv4z
         fQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuQ43g/2We4AC5SwIcMoHgpDHzHAYRdGbo3ldoB/TuHOxqEKiFrFDRmmbOCjWYc/R067OLbbZfu6CJgTSbZTzQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwqcQjrs1VwkoC2+/9jm+rRYQI1bCgsfTcTo15AIVa863REbG8v
	X4F9QTk4oKBzUvTNrxBpqvK13AdzEXxtD3GMDcGqYkEuljgC782Ltv6eBKdx7TbC5o/eMgtNx4P
	/Vcu6XRpYT7pt8TO13w==
X-Google-Smtp-Source: AGHT+IGSL6/LfQGJ9Uj3DkWwK1IsrYPhpONzXFegfmhrDCtj+kw22erCa4lpakX9RjG5PxsHges9rOrFeGcBxOQ3
X-Received: from vkbr6.prod.google.com ([2002:a05:6122:6606:b0:515:3ac1:ec42])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:a25:b0:515:5008:118d with SMTP id 71dfb90a1353d-515bf2a393bmr10094302e0c.2.1733339666972;
 Wed, 04 Dec 2024 11:14:26 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:47 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-13-jthoughton@google.com>
Subject: [PATCH v1 12/13] KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd
 toggle tests
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
X-CRM114-CacheID: sfid-20241204_111428_449477_80AF4F11 
X-CRM114-Status: GOOD (  10.84  )
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

Make sure KVM_MEM_USERFAULT can be toggled on and off for
KVM_MEM_GUEST_MEMFD memslots.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../selftests/kvm/set_memory_region_test.c    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index d233cdfb0241..57b7032d7cc3 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -556,6 +556,35 @@ static void test_add_overlapping_private_memory_regions(void)
 	close(memfd);
 	kvm_vm_free(vm);
 }
+
+static void test_private_memory_region_userfault(void)
+{
+	struct kvm_vm *vm;
+	int memfd;
+
+	pr_info("Testing toggling KVM_MEM_USERFAULT on KVM_MEM_GUEST_MEMFD memory regions\n");
+
+	vm = vm_create_barebones_type(KVM_X86_SW_PROTECTED_VM);
+
+	test_invalid_guest_memfd(vm, vm->kvm_fd, 0, "KVM fd should fail");
+	test_invalid_guest_memfd(vm, vm->fd, 0, "VM's fd should fail");
+
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT,
+				   KVM_MEM_GUEST_MEMFD | KVM_MEM_USERFAULT,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+
+	close(memfd);
+
+	kvm_vm_free(vm);
+}
 #endif
 
 int main(int argc, char *argv[])
@@ -582,6 +611,7 @@ int main(int argc, char *argv[])
 	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
 		test_add_private_memory_region();
 		test_add_overlapping_private_memory_regions();
+		test_private_memory_region_userfault();
 	} else {
 		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
 	}
-- 
2.47.0.338.g60cca15819-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC1BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6d9SLIy3ba7m9amfCG873jUIu7Rw+T0rUlSTA7+tzA=; b=pbzGnLmIOW4tGdhkRXBqIYjJgD
	37F4fK2i0rEGo1JQHGBTdud7zTKHHLixycxZoZJa2eMfIIanEwUgbDNWT5oLn/Jc/Tt3hJ0f/wO9U
	C7AHD5Sh7rLMNTybi/+fTKFL9jPkzkLzsK/vEvjy9LrlgIj/eMVkYCrEyoIcsVyjD9hckNAsj4cLN
	dta8Cyv+cqhdC4+Q05LE1Mf17H7H/LtAoB9czShhyzZcrw3pDpzzc1oJuWiTM6sI7B2GwdhVG/8nn
	Zn1RoUo+qFySHKsUucmQeurPGmwtWOtVkOHXvvXFmNvP6y3usDfm7TQzJr18PbI6H/oAcqrpKW2UX
	BYqO/xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzjy-0000000DJif-2s25;
	Thu, 09 Jan 2025 21:06:54 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTi-0000000DGao-2fuR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:07 +0000
Received: by mail-qk1-x749.google.com with SMTP id af79cd13be357-7b6f1595887so246959085a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455805; x=1737060605; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A6d9SLIy3ba7m9amfCG873jUIu7Rw+T0rUlSTA7+tzA=;
        b=tiRULIGVAEC+k1uEIfuss84UVT8wjdRRTVjQsUed61daZjQLvb8+ELQlA2/fDQSGy+
         7VHSoyrv2S73qegTpCkCVCHBW7wmSqf5ZMttMUCE69p26tfxhrbADtZ/AiugYoUV0S0p
         Q48SBxnKgR5FVnHkDSs1MSIkz9L/rhCamuQcQ048F/oFlJPfG/HDSsmnbwWq2H7/fwPP
         zFWaST2L/YSXVnmRntnsGkrKKugdddn629zK+TjoZkCSbIoX/pQRl7Ia4TTKFdOtr+UW
         PCJcq3k8T9xw2Ntds0mzWYqJv4S3afiR83e2oqPzpSHwWClpiwOhOyaO8xskw2rD7I2e
         WP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455805; x=1737060605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6d9SLIy3ba7m9amfCG873jUIu7Rw+T0rUlSTA7+tzA=;
        b=qErU3rh2KYrFrLSeU8SgfxmnparmPJ+tl9Mea+UCIGD1c7waI9Bvqc+eZZctgRGsSg
         Q6UxF820dgBbczzJqa/ckMOasLvHi29plghByrF0biV8oamzXjVYaoRO4MlU/+XlLf7i
         LldDeUsphbr5SqxlGonZCCTTAsA9OH2eIZkXMlPmzd2pjQp3AtKvvdbWFMEf/h8vNJFT
         SCK2iAnq0qgsAnxJl7/cL7IbbqkI6MLDzWfzCZllwVGHuQA4zKRdaaFJvGdnzVmFA8WP
         ZOTQnxxylhSQbVDRjyZBr19uRahXMSgK1vuMSsTeQApTFxS4G9bfNJTrviboj8hD6VYt
         Nevg==
X-Forwarded-Encrypted: i=1; AJvYcCXZfVwxc5F2VMiZvHEQzg99wjHZzRiyyFyIyRBYufVEwFk6Fl3rrJLJNFWzvK5Hf+m6bpaHhH2SkyUGC6NXZuJK@lists.infradead.org
X-Gm-Message-State: AOJu0YzY9yiq55Erj1b65PHrCPDuyQqNCol4OZ8mv1JzIArK/IbaDt9d
	/2UbhzybhOgDwBdPHrmKIIli3XT0pmexUnpZz+tJqvGAzXTno8QY7WDHsEVxqRe5sMRbIBECcGJ
	aQ8jREI2+8CDA7TpqWg==
X-Google-Smtp-Source: AGHT+IGuiGH+ZZwCsi1PGFRN10vipIun+GV8y4B9awYjMBGGjqu8CtE272hh3gh4o7UZqaJM/jxBCOqhOtlKtS/V
X-Received: from qkpr8.prod.google.com ([2002:a05:620a:2988:b0:7b6:e6cf:180e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:240d:b0:7b1:e0f:bf9b with SMTP id af79cd13be357-7bcd97afd59mr1217697485a.45.1736455805434;
 Thu, 09 Jan 2025 12:50:05 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:28 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-13-jthoughton@google.com>
Subject: [PATCH v2 12/13] KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd
 toggle tests
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125006_680584_7E0F1DC9 
X-CRM114-Status: GOOD (  10.51  )
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
index adce75720cc1..1fea8ff0fe74 100644
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
2.47.1.613.gc27f4b7a9f-goog



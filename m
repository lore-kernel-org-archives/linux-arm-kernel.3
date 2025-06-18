Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E03C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPfdrb3qNj0vF7Vvj49qyj4bUirkHon/mzHMR4ThfgQ=; b=j94WdEgOAcMCwso5LYmb28Dpjo
	VnJaYYaSzm5h4jkACwgEvtyGz79jA5JxY7IY6zh0hc11bovrrDZJX/h1cl7+PwQhKXjEiHSgzWmFq
	5AR43EjfNcNNlHFcHZ1O1xAVMqaEBXI27t9ilz++w13hHYO1DwdqoAzMG8kTr5051teRuQwfE8ZMB
	tRM3wkS2WUlhsgtk6VkRiVusIWROApphGgnjD2SAhRVGT3r9p8u7vj1gChSht9S5J35HdqQBf+UuC
	ZyD+T0lIC6iIHKMnCULxKh2yU99VR5lMwyRhujTRJmBkma6MJKykd9iUiW8T7l2L86bTCwqU1s0BB
	pDj5ezOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkoj-000000093Lo-0yyg;
	Wed, 18 Jun 2025 04:54:33 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLv-00000008zwP-310s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:48 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7391d68617cso348852b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220687; x=1750825487; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IPfdrb3qNj0vF7Vvj49qyj4bUirkHon/mzHMR4ThfgQ=;
        b=dndatfEzlxPCVtJLDZ6N5LOgr/56o0zswonZ3Fb+djI2aL5fu8Bx7UU1nxBNx1pkmC
         Fucv1w3ImbilR7WAczNK3kl1/znrYvx+Z8ekP95avt/8mWNlBA32pnVc/rNNrKYynQNg
         uIaUFoPjb9wCbm4qCMDQeUlZ3/MPsrDfa5TvVgXFmjR2BR5PY4ozaiVo/NkKAGhAv07V
         YLNDhLpIaM4jy7aVFagRohrmXuLzgTFBvVKJm98oAs4dFXgme4oHl5wfssmgSEii2VY5
         GB1o53ES/3ZYOAG4odgRrtI42LlIrMltLzDi7nuOFVK/BGjk1trwlC4Jsa9glFCw0AzA
         eoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220687; x=1750825487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPfdrb3qNj0vF7Vvj49qyj4bUirkHon/mzHMR4ThfgQ=;
        b=gZM/+NIaDF4JltUD9BulmRASUCx8j1UH8QPOq1e6fbOvGcXiju6gwH0cHFbTY42LI/
         LI7Qt03fXtboVPPwYF0nIdcxFBdB1nS1ND4HV0yNLawxalqsI+DJeV9YkVw5ZXuEcHPL
         D01TYcgu4ZvZ7uso8SsdWArkL1ZueKC8yaoC4BJa8x5rqftCx3/s+Aa6RKVmD6AZxkTe
         pIY5Sdt8sCwWm1xG2Ps6Wxe0PspI5pWVlmhQHKduizKvGmKOm5TkKyhGR8crlzNIZh34
         u1PNIk07+ZkMjwVSKUnudWeDFuIXbVporwps2CpY2vVZYmdUK7LuWbKIddPoBlsjvyey
         B1qA==
X-Forwarded-Encrypted: i=1; AJvYcCVlDopiewUDDd4AcTQ3asRDmWLC1WFJ3TXauwWKwmM1dQVOlbCG3dyJH/pKuS7ylnxhnMSHtZSOJtQzvA9KPL/f@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7s+DtO+VKoVFDsALi3gHQEh6rCXGMsNaFp4UvsQxQ9JxMsVEB
	Banl7XY1nhTTVOxkINlkmwvV/G7BUxB5lf2YM+ZktQ8SqaU2nPbQDBT5ERptN3Dbt9GV4rNge5c
	Oo/GE6S6ca7WG0n062gnDpw==
X-Google-Smtp-Source: AGHT+IEwWie/mYOzWzkPEMzzYrHW7iM/BMlWT3ZNJE+z50G+eg48u4nBoLAfK8Q5b1sDwPdBgQjlTM5R7I81KayS
X-Received: from pfbgt12.prod.google.com ([2002:a05:6a00:4e0c:b0:746:2524:8aab])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7492:b0:215:d1dd:df4c with SMTP id adf61e73a8af0-22003686bacmr2081008637.6.1750220686708;
 Tue, 17 Jun 2025 21:24:46 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:22 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-14-jthoughton@google.com>
Subject: [PATCH v3 13/15] KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd
 toggle tests
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212447_768232_85044CD0 
X-CRM114-Status: GOOD (  10.34  )
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
index ba3fe8a53b33e..3f77abb257601 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -606,6 +606,35 @@ static void test_mmio_during_vectoring(void)
 
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
@@ -633,6 +662,7 @@ int main(int argc, char *argv[])
 	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
 		test_add_private_memory_region();
 		test_add_overlapping_private_memory_regions();
+		test_private_memory_region_userfault();
 	} else {
 		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
 	}
-- 
2.50.0.rc2.692.g299adb8693-goog



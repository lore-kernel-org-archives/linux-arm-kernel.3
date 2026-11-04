Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C199606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dDWWMUR/;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k8mGENjt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lHuHnqCqF6K6uaueK6Sr4c00lW3mD3+MLoiZXuZlni4=; b=dDWWMUR/Q6Fagy
	eaIBL1MY8KHzVRhRivhsJuwsuQ4U33F14m8yyBnNhDmOmUXdmR8QSjYE59TFwgEBNfdW83vKKcYTy
	H2xipj1Xb28SzwEAHp9UA3a4Pb7PCQW8D3pKzYW8PUalBly3yEa/nJyPA7CxckSwtMQUjzPj3wiPk
	EHjUvYO+uBl65Z4GzrXY21rq6gU3rsFxZNkUF1dk0XVchdoX/gk7TCkwen/WrUQ5121VaWkgdSLl4
	6xQ2ZtKXtOKHbokss9UvoRgxlW2NSOaFTVs3Qyuv0ZFHPFKhfZYlx/A79LCxOoag/8GuOKtgMafaa
	ktiPg114ykBP7jCsCrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWg1-00000004l48-1iY8;
	Wed, 04 Nov 2026 08:49:01 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWfz-00000004l2h-1nU6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:49:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cCLqiN/2yb0grwWK9kGanBFuqdVWEkSHBIBzeKIBjnY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782137; v=1; x=1794386937;
 b=k8mGENjt6dpqYvnBkvT/loF7Zxaf3ScEyYErTu3eE+QxXOcDNiFhEVco2fqWxrsACR0kKJa3
 1R7OoXPvewqN2DBVVdOmm2wYkdK6PgiIcDMQ7W9OkmOD3cmvt0/KvI1IV8/toDTmyv/vBhvEU5i
 9uav8D7+ZITB93Tnjtqs3nak=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id afd5417ac097421f;
	Wed, 04 Nov 2026 08:48:57 +0000
X-Mizu-Trace-ID: afd5417ac097421f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/16] KVM: selftests: Allow arm64 tests to create protected VMs
Date: Wed,  4 Nov 2026 08:48:28 +0000
Message-ID: <20261104084842.132944-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_004859_605621_1DC95D9D 
X-CRM114-Status: GOOD (  11.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On arm64, the VM type passed to KVM_CREATE_VM carries the IPA size,
which the selftest library fills in. The library rejects any type a test
provides in vm_shape.type. A protected VM is created by setting
KVM_VM_TYPE_ARM_PROTECTED in that type, so a test can't create one.

Accept KVM_VM_TYPE_ARM_PROTECTED from the test, and add the IPA size to
it as for any other VM.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index d42e201eba763..96c1e70dba3d3 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -400,9 +400,10 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	}
 
 #ifdef __aarch64__
-	TEST_ASSERT(!vm->type, "ARM doesn't support test-provided types");
+	TEST_ASSERT(!(vm->type & ~KVM_VM_TYPE_ARM_PROTECTED),
+		    "ARM supports only KVM_VM_TYPE_ARM_PROTECTED as a test-provided type");
 	if (vm->pa_bits != 40)
-		vm->type = KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
+		vm->type |= KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
 #endif
 
 	vm_open(vm);
-- 
2.47.3



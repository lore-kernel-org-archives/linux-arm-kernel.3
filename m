Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BE3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=; b=1y87rKvCPkpvox6zjf+x16bWtU
	7B5vRG3uHUuRH7aYr5JR+IbWN3VyWFXgb5//z7+yIpJzJVSNJB4KR6+0InjmNRtJP4WPPxcsP4roM
	KfVT737Gn2CS6ZjJTdqWw/hjeNDRIX4ilzmYbdbp1vY15gDc6qxHFnXtD5N2BkLjATye2lJd6Bv1G
	CrcvbRfd0p/DX1Lzm+3VS1x3+ItOAmOKYJAgvS8IYPyIU47Zkt5rwmMO9sVQEuA0rn66XY3v5Y+BO
	GwTuLpFEldc109Xt/68aXvCFV2um0yFIHDurQQFbi/o3v/mPUS7pkIoMuSkBo8NWSR2i8rQHnGjtY
	Cb4SAgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQuc-0000000HYGc-2JZo;
	Sat, 11 Jan 2025 02:07:42 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiK-0000000HQKx-1GrH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 00:50:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so6741436a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 16:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556655; x=1737161455; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=;
        b=qzXOF7oWXrrJDxdwh3iksBy8JnONgG8JG/gk3gC+BhT8lMVAB7HEK1gBjt7n7U9brM
         0ocjJYduFRzB8UHQQlEJ887YLWxO58E8cX2atPLaLIzjEIe1A7/GNPHi8nNIJYXOyxK3
         EEz6fWi7s9vsoXDj7HZZHnJRgVExygYMwrgTrrFB3JYTl6v7lbK+ZCQaabhwv1dS1g1g
         IJRCQBtt8qKRRXEIJ1Sy9g1IAGLPWS0qjdLdCHkZGu9R59p9c2eRAapkSX7oS8hcuBvt
         0PwTqWBU6YkbngpgHxZ2gFzdmmzdm2WnhPFWzKdxgdc+Lbu3amMMKin7xr4X8ktF8b3I
         IR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556655; x=1737161455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJst1sRt7o765YHKTsyCLHu+qBA9pewJkWtnndgMLN0=;
        b=PsA3eEsfqyx1TjuTYPtCKKJjri+yYu6uDmPoUOj/mkDjgtBZNPmhlc914fqa90t3QA
         8RPe/IS3hIn+hIITt0bj5j+Ba+jGRrq7gN7ezSOAiX3ABkYcIqXO4m6jwkc4xzJyxRWG
         4xrB0ST7+GRK0ePHQGLdpQNGYBxqSFhYHg6Z46h6NRZ+A6E9nCYv08ocBp+lcWmCkcGs
         6A4uliUl8TUzNb1wGeFsplFUlWnX2LX9OKFVZtRkhCv3Ey0cT12n6OSl6nLZDX4SlcNd
         wAXo2zq1AkPda8tCBbxZ3+VHIaMQi4EWJZdl9xTJwacDFW0t/L9a79bQX8mmRVq+7OrU
         wO+Q==
X-Gm-Message-State: AOJu0YwjOpVwxWV6PXc3RY6MjNlM3HJWmmJpvUnVb1td3ZSFW814Mkr6
	EKEMEZdOznmTV3Ke4aJBqj+r2Pi4Y5+OjWNHndWMy/gUi1pIBOEOIjSAWz49VT6v/GNdxJtRc9P
	qCA==
X-Google-Smtp-Source: AGHT+IFaIgnmyMwcv0JpFmACh/zvowyMAMYrlakJCH8pPaULUTBzt/qI/JqGqmGqNNZlkEWD/D5dHaJ9LLc=
X-Received: from pjbqd16.prod.google.com ([2002:a17:90b:3cd0:b0:2f4:47fc:7f17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c83:b0:2ee:fa0c:cebc
 with SMTP id 98e67ed59e1d1-2f548ececc3mr18761170a91.20.1736556655284; Fri, 10
 Jan 2025 16:50:55 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:42 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-3-seanjc@google.com>
Subject: [PATCH v2 2/9] KVM: selftests: Close VM's binary stats FD when
 releasing VM
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_165056_343788_B96B3E0F 
X-CRM114-Status: GOOD (  14.01  )
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

Close/free a VM's binary stats cache when the VM is released, not when the
VM is fully freed.  When a VM is re-created, e.g. for state save/restore
tests, the stats FD and descriptor points at the old, defunct VM.  The FD
is still valid, in that the underlying stats file won't be freed until the
FD is closed, but reading stats will always pull information from the old
VM.

Note, this is a benign bug in the current code base as none of the tests
that recreate VMs use binary stats.

Fixes: 83f6e109f562 ("KVM: selftests: Cache binary stats metadata for duration of test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 91d295ef5d02..9138801ecb60 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -709,6 +709,15 @@ void kvm_vm_release(struct kvm_vm *vmp)
 
 	ret = close(vmp->kvm_fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+
+	/* Free cached stats metadata and close FD */
+	if (vmp->stats_desc) {
+		free(vmp->stats_desc);
+		vmp->stats_desc = NULL;
+
+		ret = close(vmp->stats_fd);
+		TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+	}
 }
 
 static void __vm_mem_region_delete(struct kvm_vm *vm,
@@ -748,12 +757,6 @@ void kvm_vm_free(struct kvm_vm *vmp)
 	if (vmp == NULL)
 		return;
 
-	/* Free cached stats metadata and close FD */
-	if (vmp->stats_desc) {
-		free(vmp->stats_desc);
-		close(vmp->stats_fd);
-	}
-
 	/* Free userspace_mem_regions. */
 	hash_for_each_safe(vmp->regions.slot_hash, ctr, node, region, slot_node)
 		__vm_mem_region_delete(vmp, region);
-- 
2.47.1.613.gc27f4b7a9f-goog



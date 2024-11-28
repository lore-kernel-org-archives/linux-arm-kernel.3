Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B936CD6D253
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 02:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWRtxUB7qEaUtLrlQ1xtfEnMmWvmcI3LuUmySZ8Q/Js=; b=bI9/aH3+HrRYEytL2ga1dhrznq
	8t03uGL8mspj4tD4bpXab3zlewGtdhKzC459v9946X9y4A0jSalcEEr4qrS3sIA1u39v+z5FdWExm
	ru0YY8Hor7OfUOhH09C+RXLnTfBgyYNLaVGS+8lxl6SFJ8w9Kkk901LOu3Pq56dpUsSNVZGaB3fbo
	jSOwrXJnWuWesT7txslJLbIp0/zGQDzDZmDNvgPyKluvK8/1SdxO9lEQk6FSL/5XvCMPcwSXCpabv
	cpTyE/4GQHmroTK8LuURRMbtnGkS0oSXNVq0urLES59+aJarjC30pJ2Al5FMZ2ulmCCV3VEgCkCQn
	B2DwY3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGUAL-0000000EWjN-0FmQ;
	Thu, 28 Nov 2024 02:22:01 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSpH-0000000ELzM-3ufB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:13 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ea41a5bfe7so347792a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755371; x=1733360171; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=GWRtxUB7qEaUtLrlQ1xtfEnMmWvmcI3LuUmySZ8Q/Js=;
        b=CiafJ5eb9/1gebhgGvLs9dbskMfGzPl3SPpFE8oJ5m4aDZOSDO5QZWsVlawNloxy8K
         e8f8HsFEI394pCFiaMA7Q7I4LE6FMHVTmLW3RTUh2dIrThpf8VDNyIa/hclyRBT1q1My
         0UJOHegoBGQRP4q7BExeoiCAjTgRKA+tudIfFS/lBgXxGSe4Cd5PUsfNeX8rdyFFYNaJ
         eZzbpsTSw88twK+2J7U9/k0EW/DUkO4qG0sbUw7wOMgwPLCXk7b21/6Dj4LCxkDgJV9u
         7NFxOtuOVAU4M7IYMc2yQseTPTilTUfJuyPqrRurv4Sl7NJn59HUYDMtYe+Enms7+un0
         JhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755371; x=1733360171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWRtxUB7qEaUtLrlQ1xtfEnMmWvmcI3LuUmySZ8Q/Js=;
        b=aRV1DQCjSroqlP8a7WmhXgCxVtKIIRc3+Ak+wTjm/b98JODW3F3+Cpz3yu/h80IRUu
         nGN9qr/PwQ2vVT8zABXXlOOIDUrZbiWTqj1BSsxvTMMd5iAGI8BrqcPkbkTgrbAdrXaI
         IrniRpqoGirWPaY1MokfZ3BhiLfYCgRLw+jxlN7k5YjzNXUH4hmpT7tlyf18M6bwZOS4
         +ZzGCEy+iW9NJTk69XL6nSSpX0IuIpUrJfNUaGaZkDMElxXC5PUqt6Cgvd5OrUXIocMt
         fNTePO4dNtS3/LUqAHmtCL1S672okBvQvls8+7OENZT8rrKW42oFf7q/EYJvoYHbLogU
         cdLA==
X-Gm-Message-State: AOJu0YwBanVjUYgs0LAZYuZqWsYzVRoM6AjDKaiHk2PiHVHPujaEs2/Z
	J8GTJ2BSmdMVc2snFwrnVOgSLtsCRh1AkpLBg0hRxVTkHpMSSbpDXJkashUCYzri5SWqolARuII
	HZQ==
X-Google-Smtp-Source: AGHT+IFMaJnuqI9F/c4uFlh6+NRFxIyg9v4WX4blDwY4PB6trx1cbKx2cypM7Azi46JxvUwmbV0z2d3j/+0=
X-Received: from pjbqd8.prod.google.com ([2002:a17:90b:3cc8:b0:2ea:7fd8:9dca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d0d:b0:2eb:140d:f6df
 with SMTP id 98e67ed59e1d1-2ee08e9bd21mr6479606a91.1.1732755370916; Wed, 27
 Nov 2024 16:56:10 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:43 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-13-seanjc@google.com>
Subject: [PATCH v4 12/16] KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165611_978249_981CB2A7 
X-CRM114-Status: GOOD (  11.13  )
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

Add a third phase of mmu_stress_test to verify that mprotect()ing guest
memory to make it read-only doesn't cause explosions, e.g. to verify KVM
correctly handles the resulting mmu_notifier invalidations.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index c6bf18cb7c89..0918fade9267 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -28,6 +28,10 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 		GUEST_SYNC(i);
 	}
 
+	for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
+		*((volatile uint64_t *)gpa);
+	GUEST_SYNC(2);
+
 	GUEST_ASSERT(0);
 }
 
@@ -95,6 +99,10 @@ static void *vcpu_worker(void *data)
 	run_vcpu(vcpu, 1);
 	rendezvous_with_boss();
 
+	/* Stage 2, read all of guest memory, which is now read-only. */
+	run_vcpu(vcpu, 2);
+	rendezvous_with_boss();
+
 	return NULL;
 }
 
@@ -175,7 +183,7 @@ int main(int argc, char *argv[])
 	const uint64_t start_gpa = SZ_4G;
 	const int first_slot = 1;
 
-	struct timespec time_start, time_run1, time_reset, time_run2;
+	struct timespec time_start, time_run1, time_reset, time_run2, time_ro;
 	uint64_t max_gpa, gpa, slot_size, max_mem, i;
 	int max_slots, slot, opt, fd;
 	bool hugepages = false;
@@ -279,14 +287,20 @@ int main(int argc, char *argv[])
 	rendezvous_with_vcpus(&time_reset, "reset");
 	rendezvous_with_vcpus(&time_run2, "run 2");
 
+	mprotect(mem, slot_size, PROT_READ);
+	rendezvous_with_vcpus(&time_ro, "mprotect RO");
+
+	time_ro    = timespec_sub(time_ro,     time_run2);
 	time_run2  = timespec_sub(time_run2,   time_reset);
-	time_reset = timespec_sub(time_reset, time_run1);
+	time_reset = timespec_sub(time_reset,  time_run1);
 	time_run1  = timespec_sub(time_run1,   time_start);
 
-	pr_info("run1 = %ld.%.9lds, reset = %ld.%.9lds, run2 =  %ld.%.9lds\n",
+	pr_info("run1 = %ld.%.9lds, reset = %ld.%.9lds, run2 = %ld.%.9lds, "
+		"ro = %ld.%.9lds\n",
 		time_run1.tv_sec, time_run1.tv_nsec,
 		time_reset.tv_sec, time_reset.tv_nsec,
-		time_run2.tv_sec, time_run2.tv_nsec);
+		time_run2.tv_sec, time_run2.tv_nsec,
+		time_ro.tv_sec, time_ro.tv_nsec);
 
 	/*
 	 * Delete even numbered slots (arbitrary) and unmap the first half of
-- 
2.47.0.338.g60cca15819-goog



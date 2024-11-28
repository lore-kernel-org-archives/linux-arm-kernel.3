Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC590D6D250
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 01:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/2VfJdiek5/ConUN3oh8Dq9U963aWvO6yCMgPFkp+8=; b=gHDGDTTghckKFJrg/GyKyAjbFE
	zljmha3Xe/A43obzxw7UpmJ/WCXzEXksQksKpWBM+Hb61QeTLnfhh9vsc3xPI3mdLaCinCZUw5sQt
	ofVcqV/6rskE++xQOEGUvEPHb+vqAk8TmyU/COacusUtJJhKHBbfky+MrpRGEtjtWa64mG3oLWW4l
	rfatQp46FdI6la+L1GMocEnbTTkFQcVyXghpd5+A1DJMGuHMBY1aEWx6kcSDlEXEItezX+6SbpY67
	lCdJuKW5uAvfmTbM7BYtS9KTKFdGkao1lJPiCx045AqkXCvXdVhq4zejIXxnWDGM0s15Vx2LFcRMV
	tSRXtOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSwf-0000000EOUi-2u2H;
	Thu, 28 Nov 2024 01:03:49 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSp9-0000000ELtI-1osS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:04 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7250da8a2a5so325341b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755362; x=1733360162; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7/2VfJdiek5/ConUN3oh8Dq9U963aWvO6yCMgPFkp+8=;
        b=Y4qleVyGsoIbWOq+EjCtoe26IZRgfQ7VQCd2qUnqIJPSAmp6o6zmQKkP39AgbhPDiF
         w/syg4Xi/XYxNhzhpDk0dTGYyInn1AxhQgk3bt7H6Y+ZkfK/enPeOEnLC61n2RKejvb/
         RSjhuHQvgTUeHUPWUxDKoCef6ts0rR8rQJ4h5KHBZNO+JjYKJ8xeAwN9dQIxlRx42kG/
         1kAOLg98vUX8mC923EuF+ODJSn9FsQv9CriYmLa7/Kx6uqN3vHsjOky8gxrXH6z+sdy4
         M9fGNdx9/R46loEAyMIBWHzwu6NGAVuCIy1Y/eJLixQQc+UwDNJ1XxO3pf1abKNSMqyS
         Qrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755362; x=1733360162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/2VfJdiek5/ConUN3oh8Dq9U963aWvO6yCMgPFkp+8=;
        b=RRBsWFxjkRCXUYWRfKrhKdMRrKNTIOT6V1VRYovxMh0ZgyqhugHTqn7UIVKp6bXbTn
         eJuXD9arYaLI//AR2JmdAciTBL8XDPqmYV9qtoCaPviBfzQwBh82B5H2fLmffD4RN/EG
         I8wvjCmV/4pkVfb1KV7aYL4yB+pFR/A6+YtwSY09ysI8bvLVGJK8VPfa7kB7yApz5z1n
         Q678TxL7itRto+TXLLkaOXDhS8nFtIhoILx+Q2Au+hsnZpx+GZP1YjkwXXVjxsLpBnbo
         TF3DfHlvP0bVbVkXIzYSqZzp52YLlHqQRkISkn/mCe3D4YkJjdnbANsZ1sT3G/dEYjrz
         bDcw==
X-Gm-Message-State: AOJu0Yy5+V9YOMcJX8iUZMOSX0JkZeoz9qz3IZXU2a8dd0PfqQp/MC4P
	ZJinFvfQHnod+xsgKDrs2cjicD20Y5/N1kqbEjuq31G2f79Lmo9Z9bfGM7yzt9nrMdarMXucVa3
	GuA==
X-Google-Smtp-Source: AGHT+IH/oCUXOezhQ0A565EEmfthxQY0rCc4VbVmqRSwagA0iA03VskT3jIu5Z1zmAcsnP7ZOJe6QkUN4cI=
X-Received: from pfbeb15.prod.google.com ([2002:a05:6a00:4c8f:b0:724:e5a7:e33d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4654:b0:71e:6c3f:2fb6
 with SMTP id d2e1a72fcca58-7252ffd753emr8477585b3a.8.1732755362168; Wed, 27
 Nov 2024 16:56:02 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:38 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-8-seanjc@google.com>
Subject: [PATCH v4 07/16] KVM: selftests: Compute number of extra pages needed
 in mmu_stress_test
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
X-CRM114-CacheID: sfid-20241127_165603_469118_4240EC42 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Create mmu_stress_tests's VM with the correct number of extra pages needed
to map all of memory in the guest.  The bug hasn't been noticed before as
the test currently runs only on x86, which maps guest memory with 1GiB
pages, i.e. doesn't need much memory in the guest for page tables.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 847da23ec1b1..5467b12f5903 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -209,7 +209,13 @@ int main(int argc, char *argv[])
 	vcpus = malloc(nr_vcpus * sizeof(*vcpus));
 	TEST_ASSERT(vcpus, "Failed to allocate vCPU array");
 
-	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
+	vm = __vm_create_with_vcpus(VM_SHAPE_DEFAULT, nr_vcpus,
+#ifdef __x86_64__
+				    max_mem / SZ_1G,
+#else
+				    max_mem / vm_guest_mode_params[VM_MODE_DEFAULT].page_size,
+#endif
+				    guest_code, vcpus);
 
 	max_gpa = vm->max_gfn << vm->page_shift;
 	TEST_ASSERT(max_gpa > (4 * slot_size), "MAXPHYADDR <4gb ");
-- 
2.47.0.338.g60cca15819-goog



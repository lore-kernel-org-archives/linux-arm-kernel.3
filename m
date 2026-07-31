Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0CDC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3VSeeQ+TY0YcGO9FGsFVyU5sUODRimnbCxeJHurnMk=; b=0i0J1nsOCcHizWveUcd+ksmEXH
	AjSNrWz6TqW4IjFjDpPgjeb1XnpU7IW0qui1uqqmm1aYozIQwSPe1dpg/AnnBGi4eE3BkSqTwE6YT
	vNuJeZUWlcRec/LSIocPHEM/TSyLTTlaw+nHmIcNGyox/9N+MMaPx5agTs0igSSucIB59kJgx4ap3
	M3/4MaGpZZ2DbMo5kikvlgJbGBIrtqcDFfzaPkb1V0L2ydDwzR617ryZeX/W0Ean7ihkZA1atf+be
	H22phepUzkRB6kfZKAdB/kNBxdWdhmFqfF7MXXBkwymPgUBHmYTUN2CQdBNXfpdcg6g8RfDy3K9RG
	//inZSww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqh6-0000000DDi0-025j;
	Fri, 31 Jul 2026 17:06:48 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqgl-0000000DDYk-2wyG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:06:29 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-84885a4fcabso1525283b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785517586; x=1786122386; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i3VSeeQ+TY0YcGO9FGsFVyU5sUODRimnbCxeJHurnMk=;
        b=T9cq4RC8ykHniRa5XtKR1j9vmG0z1R6YiubeKBWENaA2vHaRtlKiZoiqdunJw8KC6Y
         XqjVKQrXtuFIi9sKS97XJKzD6nZK/qi9kan3Dky9Z/Ps8dgNSpsuUs4AS83u3A3RcS7H
         7h5UUG6XQIrKG9fC+w00MqXOWWuN0uHwhzhu8jHGC99HEdTnhNMgut341J8pJh8QpMvG
         dmfgJpevkrcHvSWisLQGC25gedcpiHZ7r7U/oi79HegqzVSOzZvfigLaSfcCMpanr9DW
         nf9kuGGztptydohD8g+ryYmANjTBbVhe4e0Nr5PHJPS1N3VFtAYzDpdpeG+gkBL/pQVm
         /dMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517586; x=1786122386;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i3VSeeQ+TY0YcGO9FGsFVyU5sUODRimnbCxeJHurnMk=;
        b=UpnCJRk5fiXT/K2kCCLc+YreS/cCG0Qdhwv0YaK3qs70Zmko3VS+USjrKk0LwHqN94
         4GkrcFJSIxWL8RoH4PEdodBvVB3W0lGCnrICQcCLU4GvIGDdIdulhm9w6mhNh9Q6Z2uE
         yN+LSYl9XEjUUGWGKj5QgYAibkJUU4VpbrDhzwUOn5vabEk7beuf7nQmldcdYIp4R/9+
         7wdqfEm3oiWL3ogYcSgVbXIweQY2b1E7WKCZKXklaGHudAMJA4J10rFp7Z4jTAoF4mRI
         cLQEuEgDk0e7xOScE3tQE+IqXj1OZskBNlNgNf16BdX0B7hUE1Y0I3KfJEJip47bZMD9
         hCzg==
X-Forwarded-Encrypted: i=1; AHgh+Rqb5epZZ3pP3eAGH6mzQbJs2i3FLkn9X/dl+NUQw9iVNsrq2oxpTKLe2qy/EbqHwaypjS2FZqI5m9KDodbXw/fw@lists.infradead.org
X-Gm-Message-State: AOJu0YxjsBHRSP4VAriAQKsOMY87OR5G3nudpuTJDbCE7Y8Xvegp8lSq
	g7Wcs8DqyW4CxP96tzOBqz0mIeS50vE/hzr0t2ctLepWm1bXkX0TQhMUAAJgW70zXBJ6phwc2DV
	wrJ1Ysw==
X-Received: from pfoc6.prod.google.com ([2002:aa7:8806:0:b0:847:9199:e06])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac07:b0:84e:d46f:492a
 with SMTP id d2e1a72fcca58-84ee496c951mr366009b3a.70.1785517586327; Fri, 31
 Jul 2026 10:06:26 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:06:10 -0700
In-Reply-To: <20260731170619.2620845-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731170619.2620845-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731170619.2620845-4-seanjc@google.com>
Subject: [PATCH v2 03/12] KVM: selftests: Pre-set threads affinity in hardware
 disable test when possible
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_100627_744264_29C4363A 
X-CRM114-Status: GOOD (  11.19  )
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

When building against a libc that provides pthread_attr_setaffinity_np(),
pre-set the grandchildren threads CPU affinity in the hardware disable test
to further reduce the perceived latency of pthread_create().  On large NUMA
systems, this reduces the average runtime from ~10s to ~3.5s.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/hardware_disable_test.c  | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index f088b4af3ccc..d8288147b0a6 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -36,7 +36,9 @@ static void *run_vcpu(void *arg)
 	struct kvm_vcpu *vcpu = arg;
 	struct kvm_run *run = vcpu->run;
 
+#ifndef __USE_GNU
 	kvm_sched_setaffinity(0, sizeof(cpu_set_t), &threads_cpu_set);
+#endif
 
 	vcpu_run(vcpu);
 
@@ -50,7 +52,9 @@ static void *sleeping_thread(void *arg)
 {
 	int fd;
 
+#ifndef __USE_GNU
 	kvm_sched_setaffinity(0, sizeof(cpu_set_t), &threads_cpu_set);
+#endif
 
 	while (true) {
 		fd = open("/dev/null", O_RDWR);
@@ -80,22 +84,28 @@ static inline void check_join(pthread_t thread, void **retval)
 static void run_test(u32 run)
 {
 	struct kvm_vcpu *vcpu;
+	pthread_attr_t attr;
 	struct kvm_vm *vm;
 	pthread_t threads[VCPU_NUM];
 	pthread_t throw_away;
 	void *b;
 	u32 i, j;
 
+	pthread_attr_init(&attr);
+#ifdef __USE_GNU
+	pthread_attr_setaffinity_np(&attr, sizeof(cpu_set_t), &threads_cpu_set);
+#endif
+
 	vm = vm_create(VCPU_NUM);
 
 	pr_debug("%s: [%d] start vcpus\n", __func__, run);
 	for (i = 0; i < VCPU_NUM; ++i) {
 		vcpu = vm_vcpu_add(vm, i, guest_code);
 
-		check_create_thread(&threads[i], NULL, run_vcpu, vcpu);
+		check_create_thread(&threads[i], &attr, run_vcpu, vcpu);
 
 		for (j = 0; j < SLEEPING_THREAD_NUM; ++j) {
-			check_create_thread(&throw_away, NULL, sleeping_thread,
+			check_create_thread(&throw_away, &attr, sleeping_thread,
 					    (void *)NULL);
 		}
 	}
-- 
2.55.0.508.g3f0d502094-goog



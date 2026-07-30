Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376A5C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kus6EqucfaH9HPf637yAVY0TPxuMIU/5NctVRnWGiLw=; b=LPzLX32yZDlDdChhneB8tvcNqg
	2whaXohAXaDoG7KVND9LZA0pbvDatrrzOLjvy9RD2k+IWnYG/1z3Fr5lhSxDrsULOCy9wJUThff8B
	7yyGhlCy5HR8yx43llEgckXy4hFhlG4YLlVi7tQfzgSVnYyh7ozUE+7WiA0+UvrBsul6lXQUYA0ly
	+UW9kFd/hYOLQoud2GVsYq73s4gvRRpgeEzJgLg0jpv2QEbvzGs1uw0wmePTduGKxC7lo2wGlpk9j
	o0PJivNGBPc/X/qdduTaTZYbd3pXYRCEnlr3AozC8j41RFzVaGZF0YIYZkJHN50ZdwQyg2BDM3UPX
	XSLPl+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHj-0000000BDcm-0jYK;
	Thu, 30 Jul 2026 19:19:15 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWHh-0000000BDbw-1nHt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:19:14 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-8485d853b08so361056b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785439152; x=1786043952; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kus6EqucfaH9HPf637yAVY0TPxuMIU/5NctVRnWGiLw=;
        b=VqogquUfLtwDev1FEaAuIYPBRequhCVXQmlrNrrPnEdfVNUrYAWOGTys0W/FGvB1gy
         gL5nU6ZjKpyh90IATRHJCx5khfxEsNI9I48+KjRVFBHsdbkwagVVwJvCpXPn1lpKPpOw
         h0syUc5imQ+rlGEWNn3dj9unuC59I4k8n4C0+UplBRwgNPTHLWbNVzRGdYBSHnRkhOWZ
         MyxgUHkH66JrUQUMCZ5mtdXBwHuu3dWZvMPJFVAftO7l0zoMZ1UiNUIPNODcu4VuiFWR
         Pnq7W8tkW+yAwqPKV5GYol/EYARKbne0sSR3hK2JIDQN+kAPeNAkVv08rCcXIoNDYB7d
         5pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439152; x=1786043952;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kus6EqucfaH9HPf637yAVY0TPxuMIU/5NctVRnWGiLw=;
        b=qeZEYiFHisRhqJGiB8M7DMj213tOXB3S3B7DUoApBZ/Y0lNgFkkMPWuRAMIHbWTB4y
         IUI3gxeiHmXBgODgg++qhfwmzT232E0aRfs+nUQVlI8rwdMtAW+J7V+QuUdPIORom2dV
         HDGzIxk9p/9HF4a300zK8bK+hB1O2yse9BP8wpE7l3PquvKW/sxgILuCeT0K+Qev89nx
         wAZ9yHUEXFoBp6mSPCUouCnjD1ZmxHBkInptB9079PT+dcLsObm1Wh5ODn+SAKZzCuxp
         pPatvI6KeEYYYdToRF4yoScscf3CXT9p+a8ypSi7rKng74+wv7juxhMYxA1vd8dP/hA+
         VG7Q==
X-Forwarded-Encrypted: i=1; AHgh+RojSHZSCgIEeHn1mWHQXF7JqREOQRk2NSpG7pLuaQJRsjZXvamCzYDR+9D0XfIZiSnwXE4crfjO+tdk9MS8cbix@lists.infradead.org
X-Gm-Message-State: AOJu0YyXUJEnljIY8wt182tdNvXikfR5FJo9qdq6HXMwV/ml7tZDQSpM
	xqe67QTt3HCOH1n2SAnnkr4n/5icAeajNM4JLkw8aGMRV/djHQb5xTlprqWj4XLm+8G33cmFZMv
	LUZwBjA==
X-Received: from pfjd18.prod.google.com ([2002:a05:6a00:2452:b0:847:7599:7277])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3020:b0:846:8b21:6304
 with SMTP id d2e1a72fcca58-84ebc1fd6bemr3617195b3a.14.1785439151792; Thu, 30
 Jul 2026 12:19:11 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:19:00 -0700
In-Reply-To: <20260730191908.2084803-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260730191908.2084803-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730191908.2084803-2-seanjc@google.com>
Subject: [PATCH 1/9] KVM: selftests: Return the target CPU from pin_task_to_random_cpu()
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
X-CRM114-CacheID: sfid-20260730_121913_476394_3EA44143 
X-CRM114-Status: GOOD (  11.02  )
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

When pinning a task to a random CPU, return which CPU the task was pinned
to so that the caller can do things like avoid running other tasks on the
target CPU.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c     | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index b39e713c30a4..61d72e1e7601 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1094,7 +1094,7 @@ static inline void pin_task_to_cpu(pthread_t task, int cpu)
 	TEST_ASSERT(!r, "Failed to set thread affinity to pCPU '%u'", cpu);
 }
 
-void pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus);
+int pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus);
 
 static inline int pin_task_to_any_cpu(pthread_t task)
 {
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 3794575d2ca0..af2bad0553f9 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -668,7 +668,7 @@ void kvm_print_vcpu_pinning_help(void)
 	       "     (default: no pinning)\n", name, name);
 }
 
-void pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
+int pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
 {
 	int target_idx;
 	int nr_cpus;
@@ -682,11 +682,12 @@ void pin_task_to_random_cpu(pthread_t task, cpu_set_t *possible_cpus)
 	for (cpu = 0; cpu < CPU_SETSIZE; cpu++) {
 		if (CPU_ISSET(cpu, possible_cpus) && target_idx-- == 0) {
 			pin_task_to_cpu(task, cpu);
-			return;
+			return cpu;
 		}
 	}
 
 	TEST_FAIL("Failed to find random CPU in possible_cpus");
+	return -1;
 }
 
 void kvm_parse_vcpu_pinning(const char *pcpus_string, u32 vcpu_to_pcpu[],
-- 
2.55.0.508.g3f0d502094-goog



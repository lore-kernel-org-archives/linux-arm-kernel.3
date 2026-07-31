Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5165C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 19:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1rfv+ZTByjOzukF+HUPO8Wjg2keXlPKVWZZNi7BXT8=; b=3Su8mDLoFD3Z6LY3ayX9joRcnB
	7yMzQi6++yvBq/rg6GGG67t9rlMX5R+ids8Xb9m4JpNG1vFEEFtP4IpWJdBDeSIhMs9AMsltSmdek
	OCjd4+9viFBX4yC/D5tQLLyNCBj6tbb6jOdweLybBwwi5wONwZVxiUZ5Hb2wPRZsVfiO/KHo7QLK6
	4SAFoFOU+rJjDOrognVvAPFRzyEsG2QIbs6n6kcl5yUZ46Ax6oJORIcDBqbrdYZtyStOXwaOEjkYM
	KycalkLnTCrz54st3mXzDB8g5TnMPrEOOHjqV6noXChuimLhBqbu/+xs3M/UXMqIhh0llwVMcW02X
	6k7+GS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLJ-0000000DUul-01Y5;
	Fri, 31 Jul 2026 19:56:29 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptLE-0000000DUrJ-1g7K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 19:56:25 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-8485d853b08so2462646b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785527783; x=1786132583; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x1rfv+ZTByjOzukF+HUPO8Wjg2keXlPKVWZZNi7BXT8=;
        b=kFsCTQn656Q51JIN/eFruJqSgaVH1Rahnq2z19MGZEe0kG1YCbOf6ho+uxrov8zs9E
         jhQC9irMW74Y8pmX2gMrFQZeWFFRsdFE06tbe58xc3mTH5Aj5d8dg2Y7Spb3DVOPeRg6
         Go8he1CSC+mkhNe+69xfWSbRYmhf6VBMtu0yV29Dh2GC36FF/FoG732bMYz5uVy8xGSn
         mVubXhFV/6rPzNkK5MPPLkpJKGeznbRC+I4ZpdTMWl74T/dKGfkPx9rq63q5KEl6QjEl
         0lTmxa+1z2rqWFnRgSkavFmEcWd0i282pgW9YL8GKQB+oBKTQ+u/wJYSW4bhQta+c58i
         8Ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527783; x=1786132583;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1rfv+ZTByjOzukF+HUPO8Wjg2keXlPKVWZZNi7BXT8=;
        b=AxdoIH2PydNkcxZ7DCw5prQVBzQvmfBSv8Y4BngiUK1h/YE/ZUwcnvy7y2dDHkSsoj
         hrLVMOYc8LazKGR0T0D5C8UQOiOUSdImYJYDrsDYLo5A5lff7m4NcDw8y0K7Yu81c5sq
         a8gwc2oXv8oxwFkH4aPhmDYmbwFgFr8Su7/yzQqaFcmbZISCozvvnbu0ZW9Zu8QTHf+F
         qXjpfOg3pT3aVRW9nmj2uK4lRnephyjnc10dXfSPsNhRyKDzeahYBjDaHdbx6dF8VS9v
         +KPoMARfSvEAtvb7yBHi+CYZEVdMciR79lbzsTcxD+1KW0Ngj1gUKE+lOHKEC0u8WZ8F
         85xQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1g4BOeOuKmzZzRkZzruzojVWNpxMXKSLd9hQcTnWMa1/wtzIzpMIKbfXg0lPzyx7sld3Fe4PjJzCuAre0yJsu@lists.infradead.org
X-Gm-Message-State: AOJu0YyOpmoyhB9E2CbW/LLhLG5YTYArkZ+X7+3wUhu3qlNrCeM6dJ16
	efBC9RvvPI4vkemKyH6GDt9JhNdxxQRrA/Twn7bP7yKmQhPqxdglBJC6dL7A4eLtg8ATXOu4qh1
	WV5L+JA==
X-Received: from pfjx14.prod.google.com ([2002:aa7:9a4e:0:b0:845:ebfa:4051])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:138d:b0:848:5010:ad39
 with SMTP id d2e1a72fcca58-84ee48d1617mr785061b3a.46.1785527783246; Fri, 31
 Jul 2026 12:56:23 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:56:06 -0700
In-Reply-To: <20260731195612.2697986-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731195612.2697986-7-seanjc@google.com>
Subject: [PATCH v3 06/12] KVM: selftests: Affine threads to random CPUs in
 hardware disable test
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
X-CRM114-CacheID: sfid-20260731_125624_440589_79CEAD87 
X-CRM114-Status: GOOD (  12.12  )
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

Affine the worker threads to random CPUs in the hardware disable test, and
honor the starting CPU set in the process.  Hardcoding to CPUs 0-3 is both
wrong and less interesting than running on random CPUs.

Opportunistically convert the local 'i' to an int, as the macros it tests
against are signed, and using 'i' as an iterator is conventionally declared
as an int.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/hardware_disable_test.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
index b4edeadfa3f4..fcc06c602fca 100644
--- a/tools/testing/selftests/kvm/hardware_disable_test.c
+++ b/tools/testing/selftests/kvm/hardware_disable_test.c
@@ -149,12 +149,17 @@ void wait_for_child_setup(pid_t pid)
 
 int main(int argc, char **argv)
 {
-	u32 i;
-	int s, r;
+	cpu_set_t allowed_cpu_set;
+	int s, r, cpu, i;
 	pid_t pid;
 
-	for (i = 0; i < VCPU_NUM; i++)
-		CPU_SET(i, &threads_cpu_set);
+	kvm_sched_getaffinity(0, sizeof(cpu_set_t), &allowed_cpu_set);
+
+	for (i = 0; i < VCPU_NUM && CPU_COUNT(&allowed_cpu_set); i++) {
+		cpu = kvm_pick_random_cpu(&allowed_cpu_set);
+		CPU_CLR(cpu, &allowed_cpu_set);
+		CPU_SET(cpu, &threads_cpu_set);
+	}
 
 	sem = sem_open("vm_sem", O_CREAT | O_EXCL, 0644, 0);
 	sem_unlink("vm_sem");
-- 
2.55.0.508.g3f0d502094-goog



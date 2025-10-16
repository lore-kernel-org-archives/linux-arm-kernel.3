Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9B4CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjfqQK1ImtipxRLIgz8KiAh5ZIfb00cJavU+9G1+jb0=; b=ZhXDT9s6AA/cOwZSo1I/DXSN9A
	H7Bk9+6r7puu2VxQmUehVexaOjSzvqpDU6YDPNzYEOhe+uqCpxUKb1R5owfNVL9kag0sktO2CHxXb
	XUXrevaTekorDPmZWnLBk/Etl20ZTenzVHZXdsOCGf/gtva/w5JGhcRTFCgHgxNChw3xV+US+1+R4
	1fN1dj42hamZASVQ+SX4jZGMKE130BvZNj8RUNY/WiVjftcaksSCygE/B8BQXG7lw1VpLIoz80ldC
	73FQUGicJqRHrBXqf+6MoKKC6oRJ5z6CTCx/jT2RJ80qzY/BhbdUxW4fNwWtnl3J++F2lnkgYs7kn
	LT0jC1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RoI-00000005Zu0-08Tq;
	Thu, 16 Oct 2025 17:30:42 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ro5-00000005Zgj-2dV5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:32 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so1063091a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635826; x=1761240626; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MjfqQK1ImtipxRLIgz8KiAh5ZIfb00cJavU+9G1+jb0=;
        b=I/MZvtFxGuJnXm2H+qPZgTBEDZfDcM4nii10zBThljCCYiRaAOdbn8VszLjVIX3fNG
         lb81ARKPhEuJTVntiDn9vrKiTTyD/WZcBHkkNOSG3yWCvwxXUpWdw+6gdkqt9unTQV4E
         3eGjjl84cjwFMH5ZbzaF+wN3kWQAkBTu9ayE9X0rh386uQwwLjnS40M79g0mtVRJwQhc
         DoNsXnpFmaxUnSdHWujPczXMEpkpdlFIE5VyELwMvvBBMXmrHWMHhfnc01CUu99tsoPU
         xekrjS8TrJu8Mi0zEWC7XCWAwPMgCeYx1mhDf9wsrBTtv1WwTj4VAlRYuAHRLX5abwtW
         Rmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635826; x=1761240626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjfqQK1ImtipxRLIgz8KiAh5ZIfb00cJavU+9G1+jb0=;
        b=E8StgbLB9r2VWgQrgAP3i1HzOBDokwn5/jST9o4GCxoP4z9/YD/yyYYpE4g1D2GLpe
         R6DOwwRXBV3V2Yuq74NJq7zFsgecJhxiGi5lciuY8Go8kfiaD5ECm1QqOq0QcoIEYh0n
         Wus5Ii3M6BuwjPSphlz8plNC001t+nrmrTm+90NsVYG2Gr1l4IuA3K7o/4MZj+Aqo5ZI
         diltCloLDOE6Kemz092CxtjAe8iCnFGD9lOnFqB6E+82GAqx1OTUccXH7XMvcXgWNdYr
         ExG6Kq8YxC2cJ2dMhXkmw26389cDno/8UA1jDjurZ2evSDjEuhW429a1lHHJZ1WTZ4JD
         m8iQ==
X-Gm-Message-State: AOJu0YxyZDX7JX+By2IgfWgdqmvMIHFLnZF21+GgEJ3GIVeYebQ8H+se
	p5ByjXZd+zQaId8j9qfXEwAuf7s6Ci19+SWhTLv+45DrLLMxzqC8APz4q+XfhEOQ7wFIPZlJIfK
	Of2xIpw==
X-Google-Smtp-Source: AGHT+IFL+8SBcvf3jgd/Fu0Ax5ddowRDHeGJ6uBAQjp5iYeeHHRFS26oOh+ndsfJVw9WwZQocpqdf8pR2R0=
X-Received: from pjbhh14.prod.google.com ([2002:a17:90b:418e:b0:32e:cc38:a694])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cce:b0:335:2b15:7f46
 with SMTP id 98e67ed59e1d1-33bcf8f75b2mr642670a91.21.1760635826197; Thu, 16
 Oct 2025 10:30:26 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:51 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-11-seanjc@google.com>
Subject: [PATCH v13 10/12] KVM: selftests: Add helpers to probe for NUMA
 support, and multi-node systems
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_103029_753133_A7A4D85C 
X-CRM114-Status: GOOD (  15.14  )
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

From: Shivank Garg <shivankg@amd.com>

Add NUMA helpers to probe for support/availability and to check if the
test is running on a multi-node system.  The APIs will be used to verify
guest_memfd NUMA support.

Signed-off-by: Shivank Garg <shivankg@amd.com>
[sean: land helpers in numaif.h, add comments, tweak names]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/numaif.h | 52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/numaif.h b/tools/testing/selftests/kvm/include/numaif.h
index 1554003c40a1..29572a6d789c 100644
--- a/tools/testing/selftests/kvm/include/numaif.h
+++ b/tools/testing/selftests/kvm/include/numaif.h
@@ -4,6 +4,8 @@
 #ifndef SELFTEST_KVM_NUMAIF_H
 #define SELFTEST_KVM_NUMAIF_H
 
+#include <dirent.h>
+
 #include <linux/mempolicy.h>
 
 #include "kvm_syscalls.h"
@@ -28,4 +30,54 @@ KVM_SYSCALL_DEFINE(mbind, 6, void *, addr, unsigned long, size, int, mode,
 		   const unsigned long *, nodemask, unsigned long, maxnode,
 		   unsigned int, flags);
 
+static inline int get_max_numa_node(void)
+{
+	struct dirent *de;
+	int max_node = 0;
+	DIR *d;
+
+	/*
+	 * Assume there's a single node if the kernel doesn't support NUMA,
+	 * or if no nodes are found.
+	 */
+	d = opendir("/sys/devices/system/node");
+	if (!d)
+		return 0;
+
+	while ((de = readdir(d)) != NULL) {
+		int node_id;
+		char *endptr;
+
+		if (strncmp(de->d_name, "node", 4) != 0)
+			continue;
+
+		node_id = strtol(de->d_name + 4, &endptr, 10);
+		if (*endptr != '\0')
+			continue;
+
+		if (node_id > max_node)
+			max_node = node_id;
+	}
+	closedir(d);
+
+	return max_node;
+}
+
+static bool is_numa_available(void)
+{
+	/*
+	 * Probe for NUMA by doing a dummy get_mempolicy().  If the syscall
+	 * fails with ENOSYS, then the kernel was built without NUMA support.
+	 * if the syscall fails with EPERM, then the process/user lacks the
+	 * necessary capabilities (CAP_SYS_NICE).
+	 */
+	return !get_mempolicy(NULL, NULL, 0, NULL, 0) ||
+		(errno != ENOSYS && errno != EPERM);
+}
+
+static inline bool is_multi_numa_node_system(void)
+{
+	return is_numa_available() && get_max_numa_node() >= 1;
+}
+
 #endif /* SELFTEST_KVM_NUMAIF_H */
-- 
2.51.0.858.gf9c4a03a3a-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D524CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTQs0EnNDco2mpUUW8A1kWTJ2V3fPeD2Oux5tvQu97s=; b=p8XYU5PCv2/5Pv44IhJTNP84YQ
	0U1CO5z2qkYeGBP7YxSYFctaK2b6sstoe+PwGQ9Yh8hhQTpkzcG4xA9u2JD+5hHJZlY1mtWce/25m
	BPf/CuB6vlJw1rcfZzUMDUakPGScyF49PlMp1BzHjHRSL15d1sd6SraGy+IC6Be/Bi5iBcqnI03hy
	mFGFQYKTesWtQ7/xtHwbq8hKMztl/FLNPFpnSrlgw4bHtl708EnQw5N7WBzmdRPZoUJbEo/UEy91z
	H6XZjc1j27jf2pjxQNXqOEWMMZJwtpJeMah9DiBeIWgk7fGvk3ImS46P/V1hN2/SYRR9yhdA/n8Ba
	rKtavXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxU-00000002qjD-35bh;
	Tue, 07 Oct 2025 22:15:00 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxP-00000002qdk-43OQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:14:57 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-28d1747f23bso64424095ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875295; x=1760480095; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zTQs0EnNDco2mpUUW8A1kWTJ2V3fPeD2Oux5tvQu97s=;
        b=FjBpzD7QFD4r3YwV+Z8PDWcImzXrYECyHA7uhvqzTZbGCe6toXKWOKt+fhMVaW2Zkx
         krjfQGIwKLNAeoBvs11ADCcF9ErXqaoOgdxcW24hOF2NB7NhNeaOcE37u7xYLWCwtk+w
         M7NQL+eB3RxHHXutlMqTjlskW5SeSQLyZbJ6SLC1InpM/pJtdcow2zUpsjh8W5rcJg6z
         sDu7aj1tHtmM44VfNVKNETEvVsBjIbU5qcMDP9Oj2pldX7tCzxXlZbrRWGE6FHT9FHVR
         bmFeC456xgQaBEqQxg0RuU5U8d+bfDF40UsHijSo42seyFveAyZkcx0Pku2Cg84opqqJ
         W1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875295; x=1760480095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTQs0EnNDco2mpUUW8A1kWTJ2V3fPeD2Oux5tvQu97s=;
        b=aBLIj/OAM9nh4Cdqvdpo12Ocb2y5fFD1Osa9QSNd/Kk65Qy+g7SxjB6JrBGklW3IHR
         6gkw3glZ3G/3XEw9/d+g4/03Z7/bwtNE7QyCsP11CbFrs5dePRxhq1klEIichFy+FyWj
         xiKQ7kdXK4P6IeoF+tqVTbTFJLI1/xGYHEeZDrc7qQzV4nkqjCLa3BryukYewzdJ2Hh5
         5UPrzXGVOENlk1FjqENVdv6pjmJGP/iCRAWpSf528nqh4ao7Woj2XDt8uhojjStpDZLQ
         UCO9NibjlFEkJ8tZEwRCn7F85RFfUjUY5cJkIQznzZ7Qu8XJxkB1ULsoJGR71Pwu5d9w
         3S/g==
X-Gm-Message-State: AOJu0YwSR/JRY+TqQ5arsejrvVKuT32dk16l/0cKmtVURGMNfq9fNAdc
	qRGQkijqY5Qcb4im3Kd3F4OEqSrdssciYw/1cYAKA0IO2Fq0CUP21NUd/GrxXClZDj/X1da2Qg5
	8HE6zvg==
X-Google-Smtp-Source: AGHT+IE4iOU9kwHgBlllnocBeU6IrHkDCIzq84NfugFiFee0pXpv+6bFVeJqE6gHwaZr6A6SdSFRTrYPG7c=
X-Received: from plhx16.prod.google.com ([2002:a17:903:2c10:b0:269:8ca7:6998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e943:b0:269:ba8b:8476
 with SMTP id d9443c01a7336-2902741f0c1mr13607885ad.56.1759875294643; Tue, 07
 Oct 2025 15:14:54 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:18 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-11-seanjc@google.com>
Subject: [PATCH v12 10/12] KVM: selftests: Add helpers to probe for NUMA
 support, and multi-node systems
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_151456_026166_5EF1661C 
X-CRM114-Status: GOOD (  15.68  )
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
2.51.0.710.ga91ca5db03-goog



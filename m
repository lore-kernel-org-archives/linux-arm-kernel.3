Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TMP39yH+;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=txsBw7YC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MjI+KkE/DHdEAtZ+VS0VPmyG2kVLIeN4msuyxagZt3w=; b=TMP39yH+SNCx4R
	FTTzRL0QK8IPNsqsAVYbOiOJ5x47dD3vqZkyAzMPah6Og26UsxxUb7Lsal36+4JyxgVz7YB2priJJ
	pWo8PoBqxGRw8fLk7iixT89OeoSJJyLi9DWDl2J5lfr0l3NscxtpBMioyaVe9a2ChqSzle9DeIIT5
	o3qB6Vyg4ASCC2/Srg4NjOXMsAjT83S8EHvc2EwUg3UquTzh7N4bf40QVlvqYGVh6PePki8dNxZUd
	NFjaW2My0N8SGYtjOJakui205yefFZmNUEv5KlkoVbzE6SlFrWe5dzC8Yp8uKB2e+BsTEpPZeL3sv
	FU3NXIIv5GvruIUr6TWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrg7-0000000GXxo-1wOS;
	Mon, 02 Nov 2026 13:02:23 +0000
Received: from out-115.mta1.migadu.com ([2001:41d0:203:375::73] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrg4-0000000GXuK-0GpP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:02:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=U4Ir26pDJYfRAMb+qjTuCOpUGkv3Z+5ql2B1l3nXv5c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624536; v=1; x=1794229336;
 b=txsBw7YCzmEEBr77+gazLgZrJJd/2VmPWroWP6PwdN4dISN15MzDnxssNn9qLmuN1+FBXrdd
 TEJAcTKbOr16YubP8l9TM1wNqvBz3zuNDxEAqAMAd+bs7WC2pNTP7CN4v/ogBhYK6jpEgBi18rb
 UopzYfQQW2tkAJGSoEfDykdM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a61fcc296cb9e8c4;
	Mon, 02 Nov 2026 13:02:15 +0000
X-Mizu-Trace-ID: a61fcc296cb9e8c4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/13] KVM: arm64: Deprivilege the host under stop_machine()
Date: Mon,  2 Nov 2026 13:01:27 +0000
Message-ID: <20261102130133.3684226-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_050220_241811_F9FCE103 
X-CRM114-Status: GOOD (  14.02  )
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

pkvm_drop_host_privileges() installs the host stage 2 on every CPU with
on_each_cpu(), and each CPU goes back to running the host as soon as its
own __pkvm_prot_finalize() returns. The ITS takeover a later patch adds
has to run while every other CPU is stopped and still privileged, and
let them finalise only after it. Stopping them means no CPU can post an
ITS command while the driver switches to its copies of the queue and
tables. Keeping them privileged means a takeover that fails leaves the
host as it was.

Finalise from a stop_machine() callback instead: no CPU leaves it until
every CPU's callback has returned. An error from any CPU still reaches
finalize_pkvm(), which runs once at boot.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 016997288fd23..16dfb249b4961 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -11,6 +11,7 @@
 #include <asm/kvm_mmu.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/stop_machine.h>
 
 #include <asm/kvm_pkvm.h>
 
@@ -312,25 +313,19 @@ int pkvm_init_host_vm(struct kvm *kvm)
 	return 0;
 }
 
-static void __init _kvm_host_prot_finalize(void *arg)
+static int __init __pkvm_drop_host_privileges(void *arg)
 {
-	int *err = arg;
-
-	if (WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)))
-		WRITE_ONCE(*err, -EINVAL);
+	return WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)) ? -EINVAL : 0;
 }
 
 static int __init pkvm_drop_host_privileges(void)
 {
-	int ret = 0;
-
 	/*
 	 * Flip the static key upfront as that may no longer be possible
 	 * once the host stage 2 is installed.
 	 */
 	static_branch_enable(&kvm_protected_mode_initialized);
-	on_each_cpu(_kvm_host_prot_finalize, &ret, 1);
-	return ret;
+	return stop_machine(__pkvm_drop_host_privileges, NULL, cpu_online_mask);
 }
 
 static void __init pkvm_selftests(void)
-- 
2.47.3



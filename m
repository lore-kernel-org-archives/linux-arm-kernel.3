Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC987CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKFP5T97jy8yjf41GH5LzccCs0J7O2bS4bviO89PHx8=; b=X+CeiHFmqJiezX/09IyR27gwfE
	4fiSG44zP+yMXo9eyORGfhfOn5WozF/QLP1emtS+qf7RjbHgKzSvPSTy/jNSEseF/+FeOkC8UCdB2
	XfmYIkjMOH94yJhJ50MwXVz4OAr5VhXVTrJya8hjb2QT1r0cFrVflcKDkkjbrxlld0Dv3diaiIk2K
	yCZ/+7A5v+Kl7b8+RHdFYwj0bB0vVlXiBoy+2OOFScfW4e8jljp1JUM6OAINLISa4yQU7f2sLr7sv
	0kK6aYV6BJBVrHh7PcfIYOaAJIQSB5geYY9PxEkoN0wgHQn9Jbtc3OiQdh9I+jW7oYHTI5LTAkidh
	HRoFtsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwMQ-0000000Cgij-3Sz2;
	Fri, 14 Nov 2025 16:09:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwMA-0000000CgKr-0qiL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AKFP5T97jy8yjf41GH5LzccCs0J7O2bS4bviO89PHx8=; b=jurpeqCca6EzowvO2iC0C2wi9e
	0laYLwWRpouPDb68X1wQ7UZ3/bAOWj7xUk4Cv19WTNvittxt1Lg0fEkaWQvwuXnmqJXuKlpSb2W/L
	nYLv4hmLlUB99K+IATMl8adP1hy4YPusQi703ISQyOexrjP7oFtqRR4y2cHBCJYa3DWtTtyt6cWC0
	UeFqdtP5pz7jy4LcxeSS+JX6J189oDUMjdGNmLL0w+max5Y+D6eTJP2BudV9stKL1O6ICg+q3vkP9
	yfXqqc918hnJQdA1QhZmWeh3MMP9icNWEf4sfhr6m5JBxzS8rUK/Ivi/RowqUcL4kxCZipLgT3BPT
	hYeNoXMg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvUP-00000002vik-2VcY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A09A1BF3;
	Fri, 14 Nov 2025 08:08:47 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E11C53F5A1;
	Fri, 14 Nov 2025 08:08:52 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 32/35] KVM: Add KVM_EXIT_RLIMIT exit_reason
Date: Fri, 14 Nov 2025 16:07:13 +0000
Message-ID: <20251114160717.163230-33-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151329_963191_7151DBCB 
X-CRM114-Status: GOOD (  20.06  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Arm CPUs can optionally implement a feature called Statistical Profiling
Extension (SPE). When this feature is in use, a record is created at
certain intervals, with information about the operation that the CPU was
executing when the record was created. This record is then written to a
buffer in memory.

The buffer where records are written is defined by virtual addresses (a
base and a limit). The translation from a buffer virtual address to a
physical address is performed using the CPU's translation tables. If the
Statistical Profiling Unit (SPU) encounters a fault on the CPU's stage 2
during the translation process, profiling stops and the fault is reported
to the CPU asynchronously, via an **interrupt**, not a (synchronous)
exception, like with CPU MMU faults.

The interrupt is delivered to the CPU asynchronously, and operations
executed by the CPU after the SPU asserts the interrupt and before the
CPU receives the interrupt are not sampled by the SPU. This leads to
different sampling profiles between baremetal and a virtual machine when
the same code is executed.

The solution is to pre-fault the memory representing the buffer and pin
it in the host so it doesn't get unmapped from stage 2. Furthermore, the
host memory representing the guest's translation tables for the buffer
virtual addresses must also be pinned, to avoid faults on translation
table walks. The stage 1 tables that map the buffer are programmed by
the guest, and this makes it impossible for KVM to know beforehand how
many levels and how many pages it needs to pin; KVM has this information
only after walking the guest's stage 1 tables, when the running guest
enables the buffer.

Memory pinned by KVM for the buffer must be subject to the RLIMIT_MEMLOCK
limit.  Add a new KVM_RUN exit code for KVM to let userspace know when the
limit has been exceeded, and by how much. Userspace can then decide if they
want to (or can) further increase the limit.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 Documentation/virt/kvm/api.rst | 13 +++++++++++++
 include/uapi/linux/kvm.h       |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 10e0733297ac..2276c4590948 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7318,6 +7318,19 @@ Please note that the kernel is allowed to use the kvm_run structure as the
 primary storage for certain register types. Therefore, the kernel may use the
 values in kvm_run even if the corresponding bit in kvm_dirty_regs is not set.
 
+::
+
+		/* KVM_EXIT_RLIMIT */
+		struct {
+			__u64 excess;
+			__u8 rlimit_id;
+		} rlimit;
+
+If the exit_reason is KVM_EXIT_RLIMIT, the VCPU has exceeded a system resource
+limit.  The 'rlimit_id' is set to the resource limit ID (see man 2 getrlimit),
+and the 'excess' field is set to the amount by which the limit was exceeded.
+The unit of measurement is the unit of measurement associated with the resource
+limit.
 
 .. _cap_enable:
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 11e5dbde331b..f27679266197 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -179,6 +179,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_LOONGARCH_IOCSR  38
 #define KVM_EXIT_MEMORY_FAULT     39
 #define KVM_EXIT_TDX              40
+#define KVM_EXIT_RLIMIT           41
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -473,6 +474,11 @@ struct kvm_run {
 				} setup_event_notify;
 			};
 		} tdx;
+		/* KVM_EXIT_RLIMIT */
+		struct {
+			__u64 excess;
+			__u8 rlimit_id;
+		} rlimit;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
-- 
2.51.2



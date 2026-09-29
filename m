Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C93CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOVL/ev52VgGnekwG/3m+mVjJWWVs31DVf2kAXdZSbk=; b=bWJvwx8aSWEeHXgCfGfzknD5YN
	EZrkesYpzkmu3+/9QzeaVyCsrTAryZsKXILH0k08xZOhPFCW3YWcpnvf+finnQ5CNMpWZUAQu532X
	dSrrOYWq4L1hdeCwrVhE60XI0TWOMzvEYVzSCkGSJgYTC6lDcAuzeE39C0smGAHEDL6XQe2gjQLjn
	tyYIJW65aUg1CK4hfM3FEqSGu/BvOZrMQiC72fbNAbkMwWOm8cj5Ez0rCHoCs4S48HRzA8Q3M0cnR
	Hk4ggKG9gZwgGY7cEJ72NiiSMBNMMvIHmV7ghjQ1DvrCdZzcAut9p2kKE2UUu5N8LiyoYZqaCR/eC
	hbhkcYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDj-00000003Gxv-3T7r;
	Tue, 29 Sep 2026 10:37:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVD9-00000003Gic-2bTg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=xOVL/ev52VgGnekwG/3m+mVjJWWVs31DVf2kAXdZSbk=; b=szHCubNDMUhQU86L+2FQd6Zkta
	JkIzLddE4NQyr9Mhy+8ccmRAq+yptLCM4UclvQ390m2bY92xDc9NoFPXh/EcvG1gECha3IMInWmMu
	NOUksMV2UZ6XVPHhmwvaeXxpdjz3lmL6nRlbMmMOQNLywPtQfJfcfvB2kG3vUk8575Z5UnM/Q0GKj
	eU5Yu/AWp+jhorTDeAX2Vc2MSAWPkeTFCWJr2tqgHOoWeFouYxO4voN5MMsjq8DP+qPqC4nsr2x01
	DogcxsIPy3ZN32jZ+DoDHGUlGPj11f0EP0zM9iR1mjjX8W5PRehWKeajVYcDDkdgh4mTyMepMZBZi
	GVUfhROQ==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVD3-0000000CL99-2liX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xOVL/ev52VgGnekwG/3m+mVjJWWVs31DVf2kAXdZSbk=;
	b=I8GkUGEYFz/IyJR89y3PpljGHROkV3uzvpo0o85CwNU0uwy8xop+8WpfuHAF56cropz3WZvs/
	w+Z9RJ9CHS9wdYpPEGDYsQbmtHhai4AziCPZ1s/ZPkiaNGqykONORyg1DtzLXixbCgt6AyPJX/J
	ukSnbe7QgnLI/KO8XM6rN1U=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hvDnr2Qwpz1T4Fq;
	Tue, 29 Sep 2026 18:25:04 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CAA34058E;
	Tue, 29 Sep 2026 18:37:04 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 18:37:03 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<zhengtian10@huawei.com>, <leo.bras@arm.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <tangchengchang@huawei.com>,
	<yezhenyu2@huawei.com>, <yubihong@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>,
	<mark.rutland@arm.com>, <seanjc@google.com>, <rdunlap@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<skhan@linuxfoundation.org>
Subject: [PATCH v5 10/15] KVM: Add kvm_arch_dirty_ring_size_updated() hook
Date: Tue, 29 Sep 2026 18:36:50 +0800
Message-ID: <20260929103655.85107-11-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260929103655.85107-1-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113718_209311_24E22C44 
X-CRM114-Status: UNSURE (   9.85  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Draining a CPU-side dirty log buffer into the dirty ring requires
sizing that buffer against the ring, which reserves room for a full
flush. Add a kvm_arch_dirty_ring_size_updated() hook called right
after kvm->dirty_ring_size is recorded, with a __weak no-op default.

arm64 will use it to pin its HDBSS buffer size in dirty-ring mode.

Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 include/linux/kvm_dirty_ring.h | 1 +
 virt/kvm/dirty_ring.c          | 4 ++++
 virt/kvm/kvm_main.c            | 1 +
 3 files changed, 6 insertions(+)

diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
index eb10d87adf7d..c2b922791530 100644
--- a/include/linux/kvm_dirty_ring.h
+++ b/include/linux/kvm_dirty_ring.h
@@ -73,6 +73,7 @@ static inline void kvm_dirty_ring_free(struct kvm_dirty_ring *ring)
 #else /* CONFIG_HAVE_KVM_DIRTY_RING */

 int kvm_cpu_dirty_log_size(struct kvm *kvm);
+void kvm_arch_dirty_ring_size_updated(struct kvm *kvm);
 bool kvm_use_dirty_bitmap(struct kvm *kvm);
 bool kvm_arch_allow_write_without_running_vcpu(struct kvm *kvm);
 u32 kvm_dirty_ring_get_rsvd_entries(struct kvm *kvm);
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 572b854edf74..784f53c95b54 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -16,6 +16,10 @@ int __weak kvm_cpu_dirty_log_size(struct kvm *kvm)
 	return 0;
 }

+void __weak kvm_arch_dirty_ring_size_updated(struct kvm *kvm)
+{
+}
+
 u32 kvm_dirty_ring_get_rsvd_entries(struct kvm *kvm)
 {
 	return KVM_DIRTY_RING_RSVD_ENTRIES + kvm_cpu_dirty_log_size(kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 85f42289748d..d109062f6a1c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5011,6 +5011,7 @@ static int kvm_vm_ioctl_enable_dirty_log_ring(struct kvm *kvm, u32 size)
 		r = -EINVAL;
 	} else {
 		kvm->dirty_ring_size = size;
+		kvm_arch_dirty_ring_size_updated(kvm);
 		r = 0;
 	}

--
2.43.0



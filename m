Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CE4C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BS8KXzrmvGXfGPLTK0QPoSu9Lo1T2ypTVK/CISvD5is=; b=CZUGZhRK5vBbwVVlrXzsuzY2ti
	MdLO7Fq/tjU7sNyhXneV5Ag60Yb63LMUk6V8gK8MEDZBq6CSsZWjud3Qdj4WEhADJBKbGHxv7gdEP
	laf03RlsyG4l7DVBxutSpiNkTQgNQ+YvP/X4ThoCR8fFygqywNElFRI7TYvAXzDj81lFioYJWeWB4
	ya2gaQlxcaov9yPjSi4Pg8DlPRsq/H9NLQMS2S8EQg34xheC4KfiiocIWOnfkdItgasvQH+EtEv/6
	jlBnYrVXL+VOEdc6izu7Zd5bN/8TojRuuMHi9AwltY3dZg49D4829pskZq/V2fCY/oX0bAbA43VlY
	btIMe80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAEJ7-0000000Dxx7-0kkn;
	Wed, 30 Apr 2025 20:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE5B-0000000DvMk-1UeJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 20:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BS8KXzrmvGXfGPLTK0QPoSu9Lo1T2ypTVK/CISvD5is=; b=Ytu2B78xKA3wll5w22QBuhSlnp
	7wBQF9XiHHs/GgKFx35zLineuD8rBGlmeS09s3YM4QO4YCSVYal/ZanrNHPZxRbCHZ+/hCaT/o48d
	qIvTr4BXyoSHBlUrqRLIphVo3Q8hPfHVqp65BeOga5kJ0rdnYAUjFkHY7F4DgWqm1I4Q2vWfVDIyw
	/iz+MI2HstMhWpAQF073ib8QqiQUB9AYIe/eDUdUqJ7DHnShtobXVd/MrecmqWsYNLWVGMz1QIwmg
	iIMIlCYM5xZaWCaPaVcaUJMETAgQV4tOOHB1/sWpAyJbLxDHjGNxK0mO5BgzF+4bu1D/jk9F8onjn
	WKzGhZ7A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAE54-0000000Dprq-1RRB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 20:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS8KXzrmvGXfGPLTK0QPoSu9Lo1T2ypTVK/CISvD5is=;
	b=ZSO6uDelc4Vr5SaBFPnUOlaO8ycRpLz3ZlLPHeCf9WQPing+kv7hLLzA7z4Q41MH80G47P
	1vT9h0FMsrcch3vYb85aPVZZevssVD3W5Ky9mYbzbnyc+HtNWd0e+w43fyXCHNAmtNVmDL
	TK991Mg/MYU3HfaSy2kjzn/8wA6qhbc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS8KXzrmvGXfGPLTK0QPoSu9Lo1T2ypTVK/CISvD5is=;
	b=ZSO6uDelc4Vr5SaBFPnUOlaO8ycRpLz3ZlLPHeCf9WQPing+kv7hLLzA7z4Q41MH80G47P
	1vT9h0FMsrcch3vYb85aPVZZevssVD3W5Ky9mYbzbnyc+HtNWd0e+w43fyXCHNAmtNVmDL
	TK991Mg/MYU3HfaSy2kjzn/8wA6qhbc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-uaF8ZElZOHusuDgZaCMQ3A-1; Wed,
 30 Apr 2025 16:30:52 -0400
X-MC-Unique: uaF8ZElZOHusuDgZaCMQ3A-1
X-Mimecast-MFC-AGG-ID: uaF8ZElZOHusuDgZaCMQ3A_1746045041
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7A6F119560A7;
	Wed, 30 Apr 2025 20:30:41 +0000 (UTC)
Received: from intellaptop.lan (unknown [10.22.80.5])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 95A291800365;
	Wed, 30 Apr 2025 20:30:35 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Potapenko <glider@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Andre Przywara <andre.przywara@arm.com>,
	x86@kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jing Zhang <jingzhangos@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	Sebastian Ott <sebott@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shusen Li <lishusen2@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v4 3/5] RISC-V: KVM: switch to kvm_trylock/unlock_all_vcpus
Date: Wed, 30 Apr 2025 16:30:11 -0400
Message-ID: <20250430203013.366479-4-mlevitsk@redhat.com>
In-Reply-To: <20250430203013.366479-1-mlevitsk@redhat.com>
References: <20250430203013.366479-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_213100_565467_7827967E 
X-CRM114-Status: GOOD (  13.61  )
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

Use the kvm_trylock_all_vcpus()/unlock_all_vcpus() instead of riscv's own
implementation, to avoid triggering a lockdep warning,
if the VM is configured to have more than MAX_LOCK_DEPTH vCPUs.

Compile tested only.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/riscv/kvm/aia_device.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 39cd26af5a69..6315821f0d69 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -12,36 +12,6 @@
 #include <linux/kvm_host.h>
 #include <linux/uaccess.h>
 
-static void unlock_vcpus(struct kvm *kvm, int vcpu_lock_idx)
-{
-	struct kvm_vcpu *tmp_vcpu;
-
-	for (; vcpu_lock_idx >= 0; vcpu_lock_idx--) {
-		tmp_vcpu = kvm_get_vcpu(kvm, vcpu_lock_idx);
-		mutex_unlock(&tmp_vcpu->mutex);
-	}
-}
-
-static void unlock_all_vcpus(struct kvm *kvm)
-{
-	unlock_vcpus(kvm, atomic_read(&kvm->online_vcpus) - 1);
-}
-
-static bool lock_all_vcpus(struct kvm *kvm)
-{
-	struct kvm_vcpu *tmp_vcpu;
-	unsigned long c;
-
-	kvm_for_each_vcpu(c, tmp_vcpu, kvm) {
-		if (!mutex_trylock(&tmp_vcpu->mutex)) {
-			unlock_vcpus(kvm, c - 1);
-			return false;
-		}
-	}
-
-	return true;
-}
-
 static int aia_create(struct kvm_device *dev, u32 type)
 {
 	int ret;
@@ -53,7 +23,7 @@ static int aia_create(struct kvm_device *dev, u32 type)
 		return -EEXIST;
 
 	ret = -EBUSY;
-	if (!lock_all_vcpus(kvm))
+	if (kvm_trylock_all_vcpus(kvm))
 		return ret;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
@@ -65,7 +35,7 @@ static int aia_create(struct kvm_device *dev, u32 type)
 	kvm->arch.aia.in_kernel = true;
 
 out_unlock:
-	unlock_all_vcpus(kvm);
+	kvm_unlock_all_vcpus(kvm);
 	return ret;
 }
 
-- 
2.46.0



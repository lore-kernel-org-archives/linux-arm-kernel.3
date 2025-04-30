Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47997C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 20:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7SnvbxN813odoTR96udwnhW9eUh5grZic2/nYbCNXE=; b=MRlAsODOCTOObiS2bk0i7irteF
	KlOVez4Tgu6UJrS7oNQaAvQ/Ri9DYB4GQTjuoK1aOr62ROSx564+yhVh5ajoVkIqgHNDAyFE/ib1j
	NanfBGw99DyRNnZ19rxQf3At5JoSMi9YWQMC3FfAIPwKWE1BxxHzpXw36al0sB0jxlkhov3p0IrJj
	q1sx2IwuD/VybTbCPNJ43IuZKm8nBsAZazRuQMfV54jZXQplxp7C6F2o5GWQgbtJjQ7E5aUFBHN3b
	YYRsmNRRPHjDSGoZ1v6rOh6916kbBei45Py3GMp/h278qHZA2TER4dwgwViVrBJFA/eGToRUJd25n
	DWtwUljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAEFI-0000000DwzZ-0Igq;
	Wed, 30 Apr 2025 20:41:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE5A-0000000DvMR-19rm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 20:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=I7SnvbxN813odoTR96udwnhW9eUh5grZic2/nYbCNXE=; b=PCwQVIE7f9/vhHwyaax3FhDnsy
	z3o76sgogvaV7CcYOU5RdJ2QsGnw5MAEJ82j1pwykSzLOv8dvoDsnEr9L3pGg3JGon5NYB4o1yCOA
	MgQBFwsKJCQmE12COIr3A8dQSzWYDaqMER8CyWdNuxQ2S9BqNE9Y9GJF/7KHOzk7OuAyHs+XtOCm6
	ESUix+qCnZhAYt8papO7sEQ9QiYQKmauuRvm4WkggKBwEadBvK4JtBdCzgJSe4K9nABmBnCIobPLT
	MobJI/B8lGl4o8LSVu8thKN82sTr2p2LfdO1IV/w1/Cd2VxHPw5hoN8XkSeaDqeUVJvpsTLW/I7wq
	2Vw0i4Rg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAE51-0000000Dprj-2T17
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 20:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I7SnvbxN813odoTR96udwnhW9eUh5grZic2/nYbCNXE=;
	b=gAQDWYkfE3lExaYM3eMUdy4x88BEL7yYrjcigzbnHP4/s7Ih5mQX27L2o6kZZyEhCpLkZT
	WCIR6PjMZLrQRsj7sVWCRXuslZEM4X9NTlpAYcndrVJ8epoPUb8bQ2pzupFmau/nZWg8Fx
	e5Thhz24iu6/v5yCbG4uIdOueTLbxJ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I7SnvbxN813odoTR96udwnhW9eUh5grZic2/nYbCNXE=;
	b=DDd0OfFglSVfoYMVjYbKfl7aMpYK2MK9KKGj/XpdkVgUaXP3kJzc8X326MAsJVp9VZA1ri
	ehsaQJfsqGV0BrJum7NsiIAT0dQzn/X2EKGEr2UaaNFHaMG5w+f4QTsEL1UR+grCzRg+9s
	IrnzZ2q3DVDBRlnXyQIALcPkq1OuFeY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-314-Qd5DEF1SOCGz2yLj7LCsqg-1; Wed,
 30 Apr 2025 16:30:52 -0400
X-MC-Unique: Qd5DEF1SOCGz2yLj7LCsqg-1
X-Mimecast-MFC-AGG-ID: Qd5DEF1SOCGz2yLj7LCsqg_1746045047
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 281B51800877;
	Wed, 30 Apr 2025 20:30:47 +0000 (UTC)
Received: from intellaptop.lan (unknown [10.22.80.5])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B40F81800365;
	Wed, 30 Apr 2025 20:30:41 +0000 (UTC)
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
Subject: [PATCH v4 4/5] locking/mutex: implement mutex_lock_killable_nest_lock
Date: Wed, 30 Apr 2025 16:30:12 -0400
Message-ID: <20250430203013.366479-5-mlevitsk@redhat.com>
In-Reply-To: <20250430203013.366479-1-mlevitsk@redhat.com>
References: <20250430203013.366479-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_213057_451684_A80EB12F 
X-CRM114-Status: GOOD (  15.80  )
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

KVM's SEV intra-host migration code needs to lock all vCPUs
of the source and the target VM, before it proceeds with the migration.

The number of vCPUs that belong to each VM is not bounded by anything
except a self-imposed KVM limit of CONFIG_KVM_MAX_NR_VCPUS vCPUs which is
significantly larger than the depth of lockdep's lock stack.

Luckily, the locks in both of the cases mentioned above, are held under
the 'kvm->lock' of each VM, which means that we can use the little
known lockdep feature called a "nest_lock" to support this use case in
a cleaner way, compared to the way it's currently done.

Implement and expose 'mutex_lock_killable_nest_lock' for this
purpose.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 include/linux/mutex.h  | 17 +++++++++++++----
 kernel/locking/mutex.c |  7 ++++---
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index da4518cfd59c..a039fa8c1780 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -156,16 +156,15 @@ static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 extern void mutex_lock_nested(struct mutex *lock, unsigned int subclass);
 extern void _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest_lock);
-
 extern int __must_check mutex_lock_interruptible_nested(struct mutex *lock,
 					unsigned int subclass);
-extern int __must_check mutex_lock_killable_nested(struct mutex *lock,
-					unsigned int subclass);
+extern int __must_check _mutex_lock_killable(struct mutex *lock,
+		unsigned int subclass, struct lockdep_map *nest_lock);
 extern void mutex_lock_io_nested(struct mutex *lock, unsigned int subclass);
 
 #define mutex_lock(lock) mutex_lock_nested(lock, 0)
 #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
-#define mutex_lock_killable(lock) mutex_lock_killable_nested(lock, 0)
+#define mutex_lock_killable(lock) _mutex_lock_killable(lock, 0, NULL)
 #define mutex_lock_io(lock) mutex_lock_io_nested(lock, 0)
 
 #define mutex_lock_nest_lock(lock, nest_lock)				\
@@ -174,6 +173,15 @@ do {									\
 	_mutex_lock_nest_lock(lock, &(nest_lock)->dep_map);		\
 } while (0)
 
+#define mutex_lock_killable_nest_lock(lock, nest_lock)			\
+(									\
+	typecheck(struct lockdep_map *, &(nest_lock)->dep_map),		\
+	_mutex_lock_killable(lock, 0, &(nest_lock)->dep_map)		\
+)
+
+#define mutex_lock_killable_nested(lock, subclass) \
+	_mutex_lock_killable(lock, subclass, NULL)
+
 #else
 extern void mutex_lock(struct mutex *lock);
 extern int __must_check mutex_lock_interruptible(struct mutex *lock);
@@ -183,6 +191,7 @@ extern void mutex_lock_io(struct mutex *lock);
 # define mutex_lock_nested(lock, subclass) mutex_lock(lock)
 # define mutex_lock_interruptible_nested(lock, subclass) mutex_lock_interruptible(lock)
 # define mutex_lock_killable_nested(lock, subclass) mutex_lock_killable(lock)
+# define mutex_lock_killable_nest_lock(lock, nest_lock) mutex_lock_killable(lock)
 # define mutex_lock_nest_lock(lock, nest_lock) mutex_lock(lock)
 # define mutex_lock_io_nested(lock, subclass) mutex_lock_io(lock)
 #endif
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index c75a838d3bae..234923121ff0 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -808,11 +808,12 @@ _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest)
 EXPORT_SYMBOL_GPL(_mutex_lock_nest_lock);
 
 int __sched
-mutex_lock_killable_nested(struct mutex *lock, unsigned int subclass)
+_mutex_lock_killable(struct mutex *lock, unsigned int subclass,
+				      struct lockdep_map *nest)
 {
-	return __mutex_lock(lock, TASK_KILLABLE, subclass, NULL, _RET_IP_);
+	return __mutex_lock(lock, TASK_KILLABLE, subclass, nest, _RET_IP_);
 }
-EXPORT_SYMBOL_GPL(mutex_lock_killable_nested);
+EXPORT_SYMBOL_GPL(_mutex_lock_killable);
 
 int __sched
 mutex_lock_interruptible_nested(struct mutex *lock, unsigned int subclass)
-- 
2.46.0



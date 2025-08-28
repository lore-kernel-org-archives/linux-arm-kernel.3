Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E70CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSVC6fdQR9eqT+fbI9SiddPzA0Fdy+SyBunguPpiFR4=; b=uRq+SE/u3xfYw8sbAK+EYucPHO
	+MjESuRYlAkfTZNTw5RHTK1Ywut89JGjbDXx3jPlIM3dN3ykFCLM0VEt0i5xfrySn+3l2YcsDokme
	sS/Dt63hFeDBMJGW/yr3JcERMjxtkX9fRufI0224emYvnJwfzKKKP5d4rjqImK+ASme+woHDNjQk/
	gwy6EYBwx7+t/I/TpWoGIUhTohynjSDc/Lkve6qKnYsy4g2jUzyYgyOFtGltLHULRMjrmZbrFn5Rt
	yuR62brek7S79MrB7fpcuTbvEP5K2pZqejrJbrsU30VwE92nQ5c8zeDAJ+jMMU4J7ouxcz9CCTAKb
	fZEIm+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbjD-00000001XtR-08x1;
	Thu, 28 Aug 2025 12:27:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6U-0000000103Z-20iz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Aug 2025 09:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dSVC6fdQR9eqT+fbI9SiddPzA0Fdy+SyBunguPpiFR4=; b=Rq2J0IUJLC2WhXs2QIUpisKIJc
	btUBbdlSnDaChonz5jtRoFZWGMLjE9AhHPS0aSCQXpu4iawZwJo1AKjByKVSNZvszJZVW1C0fyreS
	OeQjztPLr/Sevfo3upEePXrXB2zSy4qTS6AUcRag/eYPpWFc5pS7tW/suCI0KTY4tShLb+hxjT0jq
	VBSTgMoHm42TzwhmwTdDiJb4bwh4W5cqrPFjD6TR+3hpTyHB7bZ6bzhmF+o168vxuhn/idwqdGcwd
	JMJxYJSYl2RGj1LUm5f1EbIVWt8XpdgXNG7xl6xU58zXiB/sCYd3wCaFQJ36REUsD4N1HjWV0dWxz
	e1p/R/1w==;
Received: from fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.158.153.154])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ6R-00000002gOU-2krw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1756373971; x=1787909971;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dSVC6fdQR9eqT+fbI9SiddPzA0Fdy+SyBunguPpiFR4=;
  b=MTOt9kv8oyu6fqF9aFjAPjea4rgJl0sMrB/0cNI+0R8405aMVIoAaTFW
   DQ0E/BW3pbAFZWAn+Eo7nEA9B5w0tQZanWsRWW5nu3e/bxPoeZnZ664XG
   UAKv5Y0j5LjO5tPOzVHx2oayakFNBKd+bnAIPDXsQ/LTXjh9kGci97Ulq
   C0MuEzCgSKOuZ+j0eGe96TNO1g0bxBTWOsMYNA85/q9fK3sET2bea85KP
   KFXOxQ0DYY48j7NxfO3+IrTLuGg2MEmCgjEnrwa6TwdT1WukI0qR/pvPO
   bjRmkTcPCPzwWLGqLMROkm0oDbXLy/w9s9Dn+dEQWKyx/bRcGZkxuPyhv
   w==;
X-CSE-ConnectionGUID: /ZEJLhlZTpqtFAT2p6mDRw==
X-CSE-MsgGUID: VaNAiYu6QAKv7wksrHu1mg==
X-IronPort-AV: E=Sophos;i="6.17,290,1747699200"; 
   d="scan'208";a="1194908"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-015.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:39:22 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:30440]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.7.27:2525] with esmtp (Farcaster)
 id cf215590-6be6-4713-ae30-dde61b2fb1f1; Thu, 28 Aug 2025 09:39:21 +0000 (UTC)
X-Farcaster-Flow-ID: cf215590-6be6-4713-ae30-dde61b2fb1f1
Received: from EX19D015EUB002.ant.amazon.com (10.252.51.123) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:21 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB002.ant.amazon.com (10.252.51.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Thu, 28 Aug 2025 09:39:21 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.017; Thu, 28 Aug 2025 09:39:21 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "david@redhat.com" <david@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>
CC: "Roy, Patrick" <roypat@amazon.co.uk>, "tabba@google.com"
	<tabba@google.com>, "ackerleytng@google.com" <ackerleytng@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"rppt@kernel.org" <rppt@kernel.org>, "will@kernel.org" <will@kernel.org>,
	"vbabka@suse.cz" <vbabka@suse.cz>, "Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "Thomson, Jack"
	<jackabt@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>
Subject: [PATCH v5 04/12] KVM: guest_memfd: Add flag to remove from direct map
Thread-Topic: [PATCH v5 04/12] KVM: guest_memfd: Add flag to remove from
 direct map
Thread-Index: AQHcF/+hhJ0XPA7SO02ecZae/urJ3g==
Date: Thu, 28 Aug 2025 09:39:21 +0000
Message-ID: <20250828093902.2719-5-roypat@amazon.co.uk>
References: <20250828093902.2719-1-roypat@amazon.co.uk>
In-Reply-To: <20250828093902.2719-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_103931_846029_E4B5C047 
X-CRM114-Status: GOOD (  19.96  )
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

Add GUEST_MEMFD_FLAG_NO_DIRECT_MAP flag for KVM_CREATE_GUEST_MEMFD()=0A=
ioctl. When set, guest_memfd folios will be removed from the direct map=0A=
after preparation, with direct map entries only restored when the folios=0A=
are freed.=0A=
=0A=
To ensure these folios do not end up in places where the kernel cannot=0A=
deal with them, set AS_NO_DIRECT_MAP on the guest_memfd's struct=0A=
address_space if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is requested.=0A=
=0A=
Add KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP to let userspace discover whether=0A=
guest_memfd supports GUEST_MEMFD_FLAG_NO_DIRECT_MAP. Support depends on=0A=
guest_memfd itself being supported, but also on whether KVM can=0A=
manipulate the direct map at page granularity at all (possible most of=0A=
the time, just arm64 is a notable outlier where its impossible if the=0A=
direct map has been setup using hugepages, as arm64 cannot break these=0A=
apart due to break-before-make semantics).=0A=
=0A=
Note that this flag causes removal of direct map entries for all=0A=
guest_memfd folios independent of whether they are "shared" or "private"=0A=
(although current guest_memfd only supports either all folios in the=0A=
"shared" state, or all folios in the "private" state if=0A=
GUEST_MEMFD_FLAG_MMAP is not set). The usecase for removing direct map=0A=
entries of also the shared parts of guest_memfd are a special type of=0A=
non-CoCo VM where, host userspace is trusted to have access to all of=0A=
guest memory, but where Spectre-style transient execution attacks=0A=
through the host kernel's direct map should still be mitigated.  In this=0A=
setup, KVM retains access to guest memory via userspace mappings of=0A=
guest_memfd, which are reflected back into KVM's memslots via=0A=
userspace_addr. This is needed for things like MMIO emulation on x86_64=0A=
to work.=0A=
=0A=
Do not perform TLB flushes after direct map manipulations. This is=0A=
because TLB flushes resulted in a up to 40x elongation of page faults in=0A=
guest_memfd (scaling with the number of CPU cores), or a 5x elongation=0A=
of memory population. TLB flushes are not needed for functional=0A=
correctness (the virt->phys mapping technically stays "correct",  the=0A=
kernel should simply to not it for a while). On the other hand, it means=0A=
that the desired protection from Spectre-style attacks is not perfect,=0A=
as an attacker could try to prevent a stale TLB entry from getting=0A=
evicted, keeping it alive until the page it refers to is used by the=0A=
guest for some sensitive data, and then targeting it using a=0A=
spectre-gadget.=0A=
=0A=
Signed-off-by: Patrick Roy <roypat@amazon.co.uk>=0A=
---=0A=
 arch/arm64/include/asm/kvm_host.h | 12 ++++++++++++=0A=
 include/linux/kvm_host.h          |  7 +++++++=0A=
 include/uapi/linux/kvm.h          |  2 ++=0A=
 virt/kvm/guest_memfd.c            | 29 +++++++++++++++++++++++++----=0A=
 virt/kvm/kvm_main.c               |  5 +++++=0A=
 5 files changed, 51 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm=
_host.h=0A=
index 2f2394cce24e..0bfd8e5fd9de 100644=0A=
--- a/arch/arm64/include/asm/kvm_host.h=0A=
+++ b/arch/arm64/include/asm/kvm_host.h=0A=
@@ -19,6 +19,7 @@=0A=
 #include <linux/maple_tree.h>=0A=
 #include <linux/percpu.h>=0A=
 #include <linux/psci.h>=0A=
+#include <linux/set_memory.h>=0A=
 #include <asm/arch_gicv3.h>=0A=
 #include <asm/barrier.h>=0A=
 #include <asm/cpufeature.h>=0A=
@@ -1706,5 +1707,16 @@ void compute_fgu(struct kvm *kvm, enum fgt_group_id =
fgt);=0A=
 void get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg, u64 *res0, =
u64 *res1);=0A=
 void check_feature_map(void);=0A=
 =0A=
+#ifdef CONFIG_KVM_GUEST_MEMFD=0A=
+static inline bool kvm_arch_gmem_supports_no_direct_map(void)=0A=
+{=0A=
+	/*=0A=
+	 * Without FWB, direct map access is needed in kvm_pgtable_stage2_map(),=
=0A=
+	 * as it calls dcache_clean_inval_poc().=0A=
+	 */=0A=
+	return can_set_direct_map() && cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);=
=0A=
+}=0A=
+#define kvm_arch_gmem_supports_no_direct_map kvm_arch_gmem_supports_no_dir=
ect_map=0A=
+#endif /* CONFIG_KVM_GUEST_MEMFD */=0A=
 =0A=
 #endif /* __ARM64_KVM_HOST_H__ */=0A=
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h=0A=
index 8b47891adca1..37553848e078 100644=0A=
--- a/include/linux/kvm_host.h=0A=
+++ b/include/linux/kvm_host.h=0A=
@@ -36,6 +36,7 @@=0A=
 #include <linux/rbtree.h>=0A=
 #include <linux/xarray.h>=0A=
 #include <asm/signal.h>=0A=
+#include <linux/set_memory.h>=0A=
 =0A=
 #include <linux/kvm.h>=0A=
 #include <linux/kvm_para.h>=0A=
@@ -731,6 +732,12 @@ static inline bool kvm_arch_has_private_mem(struct kvm=
 *kvm)=0A=
 bool kvm_arch_supports_gmem_mmap(struct kvm *kvm);=0A=
 #endif=0A=
 =0A=
+#ifdef CONFIG_KVM_GUEST_MEMFD=0A=
+#ifndef kvm_arch_gmem_supports_no_direct_map=0A=
+#define kvm_arch_gmem_supports_no_direct_map can_set_direct_map=0A=
+#endif=0A=
+#endif /* CONFIG_KVM_GUEST_MEMFD */=0A=
+=0A=
 #ifndef kvm_arch_has_readonly_mem=0A=
 static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)=0A=
 {=0A=
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h=0A=
index 6efa98a57ec1..33c8e8946019 100644=0A=
--- a/include/uapi/linux/kvm.h=0A=
+++ b/include/uapi/linux/kvm.h=0A=
@@ -963,6 +963,7 @@ struct kvm_enable_cap {=0A=
 #define KVM_CAP_RISCV_MP_STATE_RESET 242=0A=
 #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243=0A=
 #define KVM_CAP_GUEST_MEMFD_MMAP 244=0A=
+#define KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP 245=0A=
 =0A=
 struct kvm_irq_routing_irqchip {=0A=
 	__u32 irqchip;=0A=
@@ -1600,6 +1601,7 @@ struct kvm_memory_attributes {=0A=
 =0A=
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest=
_memfd)=0A=
 #define GUEST_MEMFD_FLAG_MMAP	(1ULL << 0)=0A=
+#define GUEST_MEMFD_FLAG_NO_DIRECT_MAP (1ULL << 1)=0A=
 =0A=
 struct kvm_create_guest_memfd {=0A=
 	__u64 size;=0A=
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c=0A=
index 9ec4c45e3cf2..e3696880405c 100644=0A=
--- a/virt/kvm/guest_memfd.c=0A=
+++ b/virt/kvm/guest_memfd.c=0A=
@@ -4,6 +4,7 @@=0A=
 #include <linux/kvm_host.h>=0A=
 #include <linux/pagemap.h>=0A=
 #include <linux/anon_inodes.h>=0A=
+#include <linux/set_memory.h>=0A=
 =0A=
 #include "kvm_mm.h"=0A=
 =0A=
@@ -42,8 +43,18 @@ static int __kvm_gmem_prepare_folio(struct kvm *kvm, str=
uct kvm_memory_slot *slo=0A=
 	return 0;=0A=
 }=0A=
 =0A=
+static bool kvm_gmem_test_no_direct_map(struct inode *inode)=0A=
+{=0A=
+	return ((unsigned long) inode->i_private) & GUEST_MEMFD_FLAG_NO_DIRECT_MA=
P;=0A=
+}=0A=
+=0A=
 static inline void kvm_gmem_mark_prepared(struct folio *folio)=0A=
 {=0A=
+	struct inode *inode =3D folio_inode(folio);=0A=
+=0A=
+	if (kvm_gmem_test_no_direct_map(inode))=0A=
+		set_direct_map_valid_noflush(folio_page(folio, 0), folio_nr_pages(folio)=
, false);=0A=
+=0A=
 	folio_mark_uptodate(folio);=0A=
 }=0A=
 =0A=
@@ -429,25 +440,29 @@ static int kvm_gmem_error_folio(struct address_space =
*mapping, struct folio *fol=0A=
 	return MF_DELAYED;=0A=
 }=0A=
 =0A=
-#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE=0A=
 static void kvm_gmem_free_folio(struct address_space *mapping,=0A=
 				struct folio *folio)=0A=
 {=0A=
 	struct page *page =3D folio_page(folio, 0);=0A=
+=0A=
+#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE=0A=
 	kvm_pfn_t pfn =3D page_to_pfn(page);=0A=
 	int order =3D folio_order(folio);=0A=
+#endif=0A=
 =0A=
+	if (kvm_gmem_test_no_direct_map(mapping->host))=0A=
+		WARN_ON_ONCE(set_direct_map_valid_noflush(page, folio_nr_pages(folio), t=
rue));=0A=
+=0A=
+#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE=0A=
 	kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));=0A=
-}=0A=
 #endif=0A=
+}=0A=
 =0A=
 static const struct address_space_operations kvm_gmem_aops =3D {=0A=
 	.dirty_folio =3D noop_dirty_folio,=0A=
 	.migrate_folio	=3D kvm_gmem_migrate_folio,=0A=
 	.error_remove_folio =3D kvm_gmem_error_folio,=0A=
-#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE=0A=
 	.free_folio =3D kvm_gmem_free_folio,=0A=
-#endif=0A=
 };=0A=
 =0A=
 static int kvm_gmem_setattr(struct mnt_idmap *idmap, struct dentry *dentry=
,=0A=
@@ -504,6 +519,9 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t si=
ze, u64 flags)=0A=
 	/* Unmovable mappings are supposed to be marked unevictable as well. */=
=0A=
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));=0A=
 =0A=
+	if (flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)=0A=
+		mapping_set_no_direct_map(inode->i_mapping);=0A=
+=0A=
 	kvm_get_kvm(kvm);=0A=
 	gmem->kvm =3D kvm;=0A=
 	xa_init(&gmem->bindings);=0A=
@@ -528,6 +546,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_=
guest_memfd *args)=0A=
 	if (kvm_arch_supports_gmem_mmap(kvm))=0A=
 		valid_flags |=3D GUEST_MEMFD_FLAG_MMAP;=0A=
 =0A=
+	if (kvm_arch_gmem_supports_no_direct_map())=0A=
+		valid_flags |=3D GUEST_MEMFD_FLAG_NO_DIRECT_MAP;=0A=
+=0A=
 	if (flags & ~valid_flags)=0A=
 		return -EINVAL;=0A=
 =0A=
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c=0A=
index 18f29ef93543..0dbfd17e1191 100644=0A=
--- a/virt/kvm/kvm_main.c=0A=
+++ b/virt/kvm/kvm_main.c=0A=
@@ -65,6 +65,7 @@=0A=
 #include <trace/events/kvm.h>=0A=
 =0A=
 #include <linux/kvm_dirty_ring.h>=0A=
+#include <linux/set_memory.h>=0A=
 =0A=
 =0A=
 /* Worst case buffer size needed for holding an integer. */=0A=
@@ -4916,6 +4917,10 @@ static int kvm_vm_ioctl_check_extension_generic(stru=
ct kvm *kvm, long arg)=0A=
 		return kvm_supported_mem_attributes(kvm);=0A=
 #endif=0A=
 #ifdef CONFIG_KVM_GUEST_MEMFD=0A=
+	case KVM_CAP_GUEST_MEMFD_NO_DIRECT_MAP:=0A=
+		if (!can_set_direct_map())=0A=
+			return false;=0A=
+		fallthrough;=0A=
 	case KVM_CAP_GUEST_MEMFD:=0A=
 		return 1;=0A=
 	case KVM_CAP_GUEST_MEMFD_MMAP:=0A=
-- =0A=
2.50.1=0A=
=0A=


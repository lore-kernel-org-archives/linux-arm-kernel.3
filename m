Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F450C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjSHhLfzPpweAeruuV41TxV8cjx61KJKZIlFZE69SAQ=; b=VhYMLwT0/YMzJ0YhMym1QS6szI
	iIqop/U7fOsKixe9O+19D3uFPXKE8129sAsjSRx/A8cQsxkdaUKLC5ZTQ7lIIBIeiTFXZ/iTRUMJ2
	35Hubfsnb0BDx65SNKRm/41mKBf3FFyIDNUl465WobJXiARtTpJylo2LL9f9oGVkvSAtqfGIXtnbD
	+mFB6TmBebohofxP7c4NxFJ/8uAHGh5zkPJqNcTeJ68ymIAs5MVIHFqKfew8rX5olWTHw7YjG8PZt
	hg/vLpUXRwqm62GuBOVFu/YbHK2f1/e83wzsDs59W/S7jVTG6kwkNWorVc19RafNa5uVuf5w2UdSA
	ZY27PsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQDb-00000006PGu-2RV4;
	Mon, 13 Jan 2025 19:35:23 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ9w-00000006OIa-2CTk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:31:37 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ee5668e09bso8326836a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736796695; x=1737401495; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AjSHhLfzPpweAeruuV41TxV8cjx61KJKZIlFZE69SAQ=;
        b=A5Xb9BGt4bds53XoOwzdTPOkW/PzgdzwpeVdpFSohoPmlH7OJRA8/6k3t5+dzeXoDX
         1OSioYgwJ0zzbm5O+kk/e+kP3ObcR8M3GBLoU9LuXM+gjkFsOAIcbbbrz9wltAsKgKR1
         qZ3dUh/OoulqsCR9HeZMuc9x9ixZIHh9No8vwrTpW5SuIn+6IfUu2MX4/CWrQdqfb+lD
         GrYEUbVrsp8GDv+/qNcCC+WR6MM/HlMg9sBiay5vOY7fn3IWhMMrHhpOjvZgkHOIcQRW
         H/bt1WGJVZXEiXGmmiV94D3PB2ff64UC7XjNIEva25IAWVVtsjNl8TsCAChHz09bHvfl
         ZENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796695; x=1737401495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjSHhLfzPpweAeruuV41TxV8cjx61KJKZIlFZE69SAQ=;
        b=A+IkAr+v2xY3DA19wT/iXkAm9+RnxAIOiySgzhlYJA3m87/wUYtAD0N2O019aMN50Y
         SYN4VobNcEaew4OawpAcqvG7G1j3Ilt9T6MBiktXTLNWUeDZOAOWkvUY1LwQGWVW36GD
         RDlk/IOj2U3ty2dsyEwpligcN6Zv5D2f+tAZkn7yH0M/Q9qKZXPI+AYzzv9dIJ4eee0l
         938zeXh996yUmlCrRdKynXLNRIX7b6T5Fmx0d8nw5xolvtTxV0lKEXf84fBAbpXeaOIj
         GJ/uaSilPXvTlZlvmOZc7IfGOTrHdlASCZ8zEW9nNbMKX8wOeY0wkdI23SVuHwcw9Pd7
         cvbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTkaZZMkd4RzQn00ATFt4aRIasXEbfX+0AWJ3ZwcPj4c6I9rh93XOn1ArIt+qbMZsPsLVJ3/RuguqJBCPj+XME@lists.infradead.org
X-Gm-Message-State: AOJu0Yym5HKgexDqh5RoiHoOElp5Xk4fez/LNL0TfGxw8m6bLPlV5NL0
	nG5C2wcMXB99EUWur6caTa8Cu3BzUllLnw4WqF4qZiEvP94miDDQ5yYmMgLlhUjMOZ5qanm68i9
	JC8oyA6o1FGX/iFSntaNFZA==
X-Google-Smtp-Source: AGHT+IHgy/xhjs0ZlLXfoJvzHD/baMNuiYAMQ8oeX9ah+6G+BrGfVdNx/nIjUYcPrD4FhCjo+aJMyh+mafTgb4aApA==
X-Received: from pjbsw3.prod.google.com ([2002:a17:90b:2c83:b0:2f4:3ea1:9033])
 (user=jingzhangos job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f4e:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-2f548e98382mr28470262a91.1.1736796695319;
 Mon, 13 Jan 2025 11:31:35 -0800 (PST)
Date: Mon, 13 Jan 2025 11:31:28 -0800
In-Reply-To: <20250113193128.1533449-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20250113193128.1533449-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250113193128.1533449-3-jingzhangos@google.com>
Subject: [RFC PATCH 2/2] KVM: arm64: vgic-its: Add tracepoints for VGIC ITS commands
From: Jing Zhang <jingzhangos@google.com>
To: KVMARM <kvmarm@lists.linux.dev>, ARMLinux <linux-arm-kernel@lists.infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_113136_566655_CBD57764 
X-CRM114-Status: GOOD (  13.44  )
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

This commit adds tracepoints to the KVM VGIC ITS on ARM64 to improve
observability and debuggability. The following ITS commands now have
associated tracepoints: MAPI, DISCARD, CLEAR, INT, INV, MAPD, MAPC,
MOVI, MOVALL, and INVALL.

Each tracepoint captures essential information such as device ID, event
ID, and other relevant parameters, allowing for detailed monitoring of
ITS operations.

These tracepoints are useful for:

*   Debugging interrupt routing issues.
*   Performance analysis and optimization.
*   Understanding ITS behavior.
*   Root-causing interrupt handling errors.

This enhancement provides crucial insights into interrupt handling in
ARM64 virtualized environments, aiding in development, debugging, and
maintenance.

Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/trace.h    | 135 +++++++++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic-its.c |  19 +++++
 2 files changed, 154 insertions(+)

diff --git a/arch/arm64/kvm/vgic/trace.h b/arch/arm64/kvm/vgic/trace.h
index 83c64401a7fc..22953c0ef159 100644
--- a/arch/arm64/kvm/vgic/trace.h
+++ b/arch/arm64/kvm/vgic/trace.h
@@ -27,6 +27,141 @@ TRACE_EVENT(vgic_update_irq_pending,
 		  __entry->vcpu_id, __entry->irq, __entry->level)
 );
 
+DECLARE_EVENT_CLASS(vgic_its_cmd_class,
+	TP_PROTO(__u32 device_id, __u32 event_id),
+	TP_ARGS(device_id, event_id),
+
+	TP_STRUCT__entry(
+		__field(	__u32,		device_id		)
+		__field(	__u32,		event_id		)
+	),
+
+	TP_fast_assign(
+		__entry->device_id		= device_id;
+		__entry->event_id		= event_id;
+	),
+
+	TP_printk("Device ID: %u, Event ID: %u",
+		  __entry->device_id, __entry->event_id)
+);
+
+DEFINE_EVENT(vgic_its_cmd_class, vgic_its_cmd_mapi,
+	TP_PROTO(__u32 device_id, __u32 event_id),
+	TP_ARGS(device_id, event_id));
+
+DEFINE_EVENT(vgic_its_cmd_class, vgic_its_cmd_discard,
+	TP_PROTO(__u32 device_id, __u32 event_id),
+	TP_ARGS(device_id, event_id));
+
+DEFINE_EVENT(vgic_its_cmd_class, vgic_its_cmd_clear,
+	TP_PROTO(__u32 device_id, __u32 event_id),
+	TP_ARGS(device_id, event_id));
+
+DEFINE_EVENT(vgic_its_cmd_class, vgic_its_cmd_int,
+	TP_PROTO(__u32 device_id, __u32 event_id),
+	TP_ARGS(device_id, event_id));
+
+DEFINE_EVENT(vgic_its_cmd_class, vgic_its_cmd_inv,
+	TP_PROTO(__u32 device_id, __u32 event_id),
+	TP_ARGS(device_id, event_id));
+
+TRACE_EVENT(vgic_its_cmd_mapd,
+	TP_PROTO(__u32 device_id, bool valid, __u8 num_eventid_bits, __u64 itt_addr),
+	TP_ARGS(device_id, valid, num_eventid_bits, itt_addr),
+
+	TP_STRUCT__entry(
+		__field(	__u32,		device_id		)
+		__field(	bool,		valid			)
+		__field(	__u8,		num_eventid_bits	)
+		__field(	__u64,		itt_addr		)
+	),
+
+	TP_fast_assign(
+		__entry->device_id		= device_id;
+		__entry->valid			= valid;
+		__entry->num_eventid_bits	= num_eventid_bits;
+		__entry->itt_addr		= itt_addr;
+	),
+
+	TP_printk("Device ID: %u, valid: %d, num_eventid_bits: %u, itt_addr: %llx",
+		  __entry->device_id, __entry->valid,
+		  __entry->num_eventid_bits, __entry->itt_addr)
+);
+
+TRACE_EVENT(vgic_its_cmd_mapc,
+	TP_PROTO(__u32 collection_id, bool valid),
+	TP_ARGS(collection_id, valid),
+
+	TP_STRUCT__entry(
+		__field(	__u32,		collection_id		)
+		__field(	bool,		valid			)
+	),
+
+	TP_fast_assign(
+		__entry->collection_id		= collection_id;
+		__entry->valid			= valid;
+	),
+
+	TP_printk("Collection ID: %u, valid: %d",
+		  __entry->collection_id, __entry->valid)
+);
+
+TRACE_EVENT(vgic_its_cmd_movi,
+	TP_PROTO(__u32 device_id, __u32 event_id, __u32 collection_id),
+	TP_ARGS(device_id, event_id, collection_id),
+
+	TP_STRUCT__entry(
+		__field(	__u32,		device_id		)
+		__field(	__u32,		event_id		)
+		__field(	__u32,		collection_id		)
+	),
+
+	TP_fast_assign(
+		__entry->device_id		= device_id;
+		__entry->event_id		= event_id;
+		__entry->collection_id		= collection_id;
+	),
+
+	TP_printk("Device ID: %u, Event ID: %u, Collection ID: %u",
+		  __entry->device_id, __entry->event_id, __entry->collection_id)
+);
+
+TRACE_EVENT(vgic_its_cmd_movall,
+	TP_PROTO(int vcpu_source, int vcpu_target),
+	TP_ARGS(vcpu_source, vcpu_target),
+
+	TP_STRUCT__entry(
+		__field(	int,		vcpu_source		)
+		__field(	int,		vcpu_target		)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_source		= vcpu_source;
+		__entry->vcpu_target		= vcpu_target;
+	),
+
+	TP_printk("Source VCPU: %d, Target VCPU: %d",
+		  __entry->vcpu_source, __entry->vcpu_target)
+);
+
+TRACE_EVENT(vgic_its_cmd_invall,
+	TP_PROTO(__u32 collection_id, int vcpu_id),
+	TP_ARGS(collection_id, vcpu_id),
+
+	TP_STRUCT__entry(
+		__field(	__u32,		collection_id		)
+		__field(	int,		vcpu_id			)
+	),
+
+	TP_fast_assign(
+		__entry->collection_id		= collection_id;
+		__entry->vcpu_id		= vcpu_id;
+	),
+
+	TP_printk("Collection ID: %u, VCPU ID: %d",
+		  __entry->collection_id, __entry->vcpu_id)
+);
+
 #endif /* _TRACE_VGIC_H */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 569f9da9049f..d7524e3abad6 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -22,6 +22,7 @@
 
 #include "vgic.h"
 #include "vgic-mmio.h"
+#include "trace.h"
 
 static struct kvm_device_ops kvm_arm_vgic_its_ops;
 
@@ -795,6 +796,8 @@ static int vgic_its_cmd_handle_discard(struct kvm *kvm, struct vgic_its *its,
 	u32 event_id = its_cmd_get_id(its_cmd);
 	struct its_ite *ite;
 
+	trace_vgic_its_cmd_discard(device_id, event_id);
+
 	ite = find_ite(its, device_id, event_id);
 	if (ite && its_is_collection_mapped(ite->collection)) {
 		struct its_device *device = find_its_device(its, device_id);
@@ -829,6 +832,8 @@ static int vgic_its_cmd_handle_movi(struct kvm *kvm, struct vgic_its *its,
 	struct its_ite *ite;
 	struct its_collection *collection;
 
+	trace_vgic_its_cmd_movi(device_id, event_id, coll_id);
+
 	ite = find_ite(its, device_id, event_id);
 	if (!ite)
 		return E_ITS_MOVI_UNMAPPED_INTERRUPT;
@@ -1035,6 +1040,8 @@ static int vgic_its_cmd_handle_mapi(struct kvm *kvm, struct vgic_its *its,
 	struct vgic_irq *irq;
 	int lpi_nr;
 
+	trace_vgic_its_cmd_mapi(device_id, event_id);
+
 	device = find_its_device(its, device_id);
 	if (!device)
 		return E_ITS_MAPTI_UNMAPPED_DEVICE;
@@ -1161,6 +1168,8 @@ static int vgic_its_cmd_handle_mapd(struct kvm *kvm, struct vgic_its *its,
 	struct its_device *device;
 	gpa_t gpa;
 
+	trace_vgic_its_cmd_mapd(device_id, valid, num_eventid_bits, itt_addr);
+
 	if (!vgic_its_check_id(its, its->baser_device_table, device_id, &gpa))
 		return E_ITS_MAPD_DEVICE_OOR;
 
@@ -1204,6 +1213,8 @@ static int vgic_its_cmd_handle_mapc(struct kvm *kvm, struct vgic_its *its,
 	valid = its_cmd_get_validbit(its_cmd);
 	coll_id = its_cmd_get_collection(its_cmd);
 
+	trace_vgic_its_cmd_mapc(coll_id, valid);
+
 	if (!valid) {
 		vgic_its_free_collection(its, coll_id);
 		vgic_its_invalidate_cache(its);
@@ -1248,6 +1259,7 @@ static int vgic_its_cmd_handle_clear(struct kvm *kvm, struct vgic_its *its,
 	u32 event_id = its_cmd_get_id(its_cmd);
 	struct its_ite *ite;
 
+	trace_vgic_its_cmd_clear(device_id, event_id);
 
 	ite = find_ite(its, device_id, event_id);
 	if (!ite)
@@ -1278,6 +1290,7 @@ static int vgic_its_cmd_handle_inv(struct kvm *kvm, struct vgic_its *its,
 	u32 event_id = its_cmd_get_id(its_cmd);
 	struct its_ite *ite;
 
+	trace_vgic_its_cmd_inv(device_id, event_id);
 
 	ite = find_ite(its, device_id, event_id);
 	if (!ite)
@@ -1338,6 +1351,8 @@ static int vgic_its_cmd_handle_invall(struct kvm *kvm, struct vgic_its *its,
 	vcpu = collection_to_vcpu(kvm, collection);
 	vgic_its_invall(vcpu);
 
+	trace_vgic_its_cmd_invall(coll_id, vcpu->vcpu_id);
+
 	return 0;
 }
 
@@ -1364,6 +1379,8 @@ static int vgic_its_cmd_handle_movall(struct kvm *kvm, struct vgic_its *its,
 	if (!vcpu1 || !vcpu2)
 		return E_ITS_MOVALL_PROCNUM_OOR;
 
+	trace_vgic_its_cmd_movall(vcpu1->vcpu_id, vcpu2->vcpu_id);
+
 	if (vcpu1 == vcpu2)
 		return 0;
 
@@ -1392,6 +1409,8 @@ static int vgic_its_cmd_handle_int(struct kvm *kvm, struct vgic_its *its,
 	u32 msi_data = its_cmd_get_id(its_cmd);
 	u64 msi_devid = its_cmd_get_deviceid(its_cmd);
 
+	trace_vgic_its_cmd_int(msi_devid, msi_data);
+
 	return vgic_its_trigger_msi(kvm, its, msi_devid, msi_data);
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog



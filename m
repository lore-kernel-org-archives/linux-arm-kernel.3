Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B633D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 21:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfRTWtcIaathUA2mgL41QBVM+XL6VT6UBdp0QiNZHSY=; b=pOGDPQjOP5E6VtjDJgFE0OLeHQ
	eBUtE4/0m+Z7DGOBJZDVIeQpI8hbwwutgKeN3HmC30BzlWaaKftYrTxuf4dndSl493BATqm1Ktrer
	3EX89a4uJCcry3DKOdBNFtcmTNYpARjkkKcgkJrRKPrNE/ZthWWsLIpbdWwHRHC5P3lRXlNz4TnSp
	9WRdxkVzQG/Ege2TZDTjtck6FhIq6eM43qjS5MlASQipoAMa3W6hc+lhAuYlc3yZAm7JVn/fzKgHw
	x5f0wQsf9KNI3uY2eRGo4wex0XCjO1NRXdOkGbSzZBnbObfEMMlbHQE7sGSlkZiFBTCM72mSMd+QV
	e3FqCIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQBQD-00000004XUL-2oz4;
	Mon, 01 Dec 2025 21:27:01 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQBQB-00000004XTz-06CL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 21:27:00 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-640ace5f40dso5138378a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 13:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764624417; x=1765229217; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cfRTWtcIaathUA2mgL41QBVM+XL6VT6UBdp0QiNZHSY=;
        b=iwRVoUIANxapI/3T+9MYboeiR26spagYVWg9Q8RQF9wy/IoB0cUIB3Z8HHHHK0hw2N
         acfGnd8Smyqed7uW7E3VN2luUaoWBZPN48TI2UjxTfViMo+UQpSkMOD/QCDOAEx+lH9t
         TTrdM3yteu3YJ9eSQG+/xcdMRJnXBRfNkLzApa46iS4pzuwtYhb/+8Ulhx4Vzayb63d4
         VixcIzRKtfVRPeRvQtTHBVumUhBksnT8r2fxjgm4/ObApcJnk8s69YVzni3hiDMvC9Ko
         X00ASLjFXH1vy9G6lBHiRRYuuHR4eDeJSg9/5mxOdU5N5GTxoGUkzkcPgoVdgVf/B3Qz
         w4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764624417; x=1765229217;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfRTWtcIaathUA2mgL41QBVM+XL6VT6UBdp0QiNZHSY=;
        b=LOXrLHf7v1edEbImstekEKlyKThprGgh7VLDbCsbEphaoxfD5wmfhzd2pRrINcyOB3
         LRh4dTywAJQbO5vTNDRUN8E03NYVqd1C8lj4F45eU3yQxYU0g97LvB3PNJjCJaCR9DKv
         uOhUuBYaeGBvSi48z2nKaDHq1R7DqPez7h95nAnS2YO0ntU/X9hh9z8T+voZTL67P5md
         v/8MNQCf299mh84iq+BPyulaVnZ6m+TzadNevxz931Xh1SfoVrckykG6dnBwnmmkiHeH
         1c9R6x7SCqNQ4pny7PSpXqihjzM3rh6Qlsyu05MvDReSO0GE3Xkav2de6eRWcFRPUw9V
         d0ug==
X-Forwarded-Encrypted: i=1; AJvYcCVmK8feWshi60zAvVo+RFyApBWWAUeveH1uePOX/JiaAJ3OhdUJhX8uxvEnjyuV/CrxLXofWsxem3NIqXtDKl1b@lists.infradead.org
X-Gm-Message-State: AOJu0YxGnGtLXeo9AINLTzQ1VdovuKWzs4IIpWnuLiWq/79H/YUvZtq6
	tgJk/Rrm/d3vI3n11vAuor3MSiF4HRsfdwom+Gd0plIq4yagDHV03SmTcNGOVIbfTEtehOZG2j9
	uww==
X-Google-Smtp-Source: AGHT+IG6OTWqFbaWntwqBBvO6mL+v9FKNl0tgC0FGiL0/5Lod1u3ROGkbcUdu5tvSbLlEmMPZt/biMrlsA==
X-Received: from eda15.prod.google.com ([2002:a05:6402:a00f:b0:647:7a4d:7406])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:26c3:b0:643:6af2:2356
 with SMTP id 4fb4d7f45d1cf-645eb2aade8mr24700068a12.26.1764624416786; Mon, 01
 Dec 2025 13:26:56 -0800 (PST)
Date: Mon, 01 Dec 2025 21:26:42 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABEILmkC/3XMQQ6DIBCF4auYWZfGQWlIV71H40JhwElUGjCkj
 eHupe67/F/yvgMSRaYE9+aASJkTh62GvDRg5nHzJNjWBtlKhbJFkVZjjHC87BSF0tpah3LqlIJ 6eUVy/D6551B75rSH+Dn1jL/1D5RRoJh63WGPN6fH7uFD8AtdTVhhKKV8ATlMx72pAAAA
X-Change-Id: 20251201-smccc-filter-588ddf12b355
X-Mailer: b4 0.14.2
Message-ID: <20251201-smccc-filter-v2-1-03dab737a14d@google.com>
Subject: [PATCH v2] KVM: arm64: Prevent FWD_TO_USER of SMCCC to pKVM
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_132659_116477_7EA7C713 
X-CRM114-Status: GOOD (  14.98  )
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

With protected VMs, forwarding guest HVC/SMCs happens at two interfaces:

     pKVM [EL2] <--> KVM [EL1] <--> VMM [EL0]

so it might be possible for EL0 to successfully register with EL1 to
handle guest SMCCC calls but never see the KVM_EXIT_HYPERCALL, even if
the calls are properly issued by the guest, due to EL2 handling them so
that (host) EL1 never gets a chance to exit to EL0.

Instead, avoid that confusing situation and make userspace fail early by
disallowing KVM_ARM_VM_SMCCC_FILTER-ing calls from protected guests in
the pKVM FID range.

Similarly, reserve the "Call UID Query" to ensure that a malicious host
can't mislead a protected guest into misusing the pKVM ABI, under the
premise that it would be interacting with a different hypervisor ABI, as
hypervisors share the same FID space.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
Changes in v2:
- Restricted the range to pKVM HVCs & the "Call UID Query"
- Updated docs & removed mention of KVM_VM_TYPE_ARM_PROTECTED
- Link to v1: https://lore.kernel.org/r/20251201-smccc-filter-v1-1-b4831416=
f8a3@google.com
---
 Documentation/virt/kvm/devices/vm.rst | 10 ++++++++++
 arch/arm64/kvm/hypercalls.c           | 29 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/virt/kvm/devices/vm.rst b/Documentation/virt/kvm=
/devices/vm.rst
index a4d39fa1b0834b090318250db3b670b0b3174259..28ab2629e7e8f166def6f9efd18=
e8408ab4a8e63 100644
--- a/Documentation/virt/kvm/devices/vm.rst
+++ b/Documentation/virt/kvm/devices/vm.rst
@@ -400,3 +400,13 @@ will reject attempts to define a filter for any portio=
n of these ranges:
         0x8000_0000 0x8000_FFFF
         0xC000_0000 0xC000_FFFF
         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+Protected KVM (pKVM) handles some calls directly and will reject attempts =
to
+define a filter for a protected VM for any portion of these ranges:
+
+        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+        Start       End (inclusive)
+        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+        0x8600_FF01 0x8600_FF01
+        0xC600_0002 0xC600_003F
+        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index 58c5fe7d757274d9079606fcc378485980c6c0f8..5329772f228d356322863a7150f=
fa40c25ea1ee2 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -135,6 +135,12 @@ static bool kvm_smccc_test_fw_bmap(struct kvm_vcpu *vc=
pu, u32 func_id)
 						   ARM_SMCCC_SMC_64,		\
 						   0, ARM_SMCCC_FUNC_MASK)
=20
+#define SMC64_PKVM_RANGE_BEGIN	ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_I=
D
+#define SMC64_PKVM_RANGE_END	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
+						   ARM_SMCCC_SMC_64,		\
+						   ARM_SMCCC_OWNER_VENDOR_HYP,	\
+						   ARM_SMCCC_KVM_FUNC_PKVM_RESV_63)
+
 static int kvm_smccc_filter_insert_reserved(struct kvm *kvm)
 {
 	int r;
@@ -158,6 +164,29 @@ static int kvm_smccc_filter_insert_reserved(struct kvm=
 *kvm)
 	if (r)
 		goto out_destroy;
=20
+	/*
+	 * Prevent userspace from registering to handle any SMCCC call in the
+	 * vendor hypervisor range for pVMs, avoiding the confusion of guest
+	 * calls seemingly not resulting in KVM_RUN exits because pKVM handles
+	 * them without ever returning to the host. This is NOT for security.
+	 */
+	if (kvm_vm_is_protected(kvm)) {
+		r =3D mtree_insert(&kvm->arch.smccc_filter,
+				ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID,
+				xa_mk_value(KVM_SMCCC_FILTER_HANDLE),
+				GFP_KERNEL_ACCOUNT);
+		if (r)
+			goto out_destroy;
+
+		r =3D mtree_insert_range(&kvm->arch.smccc_filter,
+				       SMC64_PKVM_RANGE_BEGIN,
+				       SMC64_PKVM_RANGE_END,
+				       xa_mk_value(KVM_SMCCC_FILTER_HANDLE),
+				       GFP_KERNEL_ACCOUNT);
+		if (r)
+			goto out_destroy;
+	}
+
 	return 0;
 out_destroy:
 	mtree_destroy(&kvm->arch.smccc_filter);

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251201-smccc-filter-588ddf12b355

Best regards,
--=20
Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>



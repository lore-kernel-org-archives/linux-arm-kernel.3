Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE9FD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R2ky1g7vqxE0dSxSYlDayHPkG662KZ7f5gS2hZCCGuQ=; b=ynT2EbJ1Ct1ehLByPnnGzafCl/
	1ahPGOcWGzip9sEHUZtuwpJYmbGvahV7Do1CuqmmriQM27oX5WwkbHCgZTFq/7o9lp6e9sATTWtCP
	zAr7vPxIjinFS5yTTqUmlj+5mOH01Uixrrm/0xiIH7ybz8uQCSCM0BX+ycpLUn/myuRW7++E46A79
	P8PRVW9nXopyYwE29ivt3j4wyDAW9b/LfG8VGLAJzX/ga+eEZBah8NPxot/h8hMLZmBudDu5n0wXK
	9XujVbdoYHHF386ViW2p+gjSQlAiNqQCXA9a2S9KFkcLu2iQoWhd3gszeWNsCYS4npvi2CbY53v5h
	WfRpEFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ8VG-00000004P7P-0enc;
	Mon, 01 Dec 2025 18:20:02 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ8VD-00000004P6b-0GWu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 18:20:00 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b70caafad59so436695766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 10:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764613196; x=1765217996; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2ky1g7vqxE0dSxSYlDayHPkG662KZ7f5gS2hZCCGuQ=;
        b=qCR1hL2HCcgExhT0GrSCpUqhiA8r4gnDVziViGQaV5U99t0e9BIIbAPSYHJofEAZKS
         bkn0OliuNFP4FPHvR906U5q9+gIgsLlGqm9IODmgQiqBniaLBNQCATDVx2uFKfI33yN5
         0pe7kXEaoUaiBeEBMWEzKGFIxvKwHYk+z+SJbYzq3tdXuPE9J7rf5//JG0wlPVKLdLqd
         n2svyxGoFbPh3EMBnFVKbrbznG4foKH1Oucq+SMIp6bDDNrTORA6fwntdWsaO9EM+X45
         Gt8vtV859F550cDMqWpLuWss9Mw5Ne4fRKwzr/ONJUdMOUrylnDC/Z8dh4Unzqwg8hRX
         meOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764613196; x=1765217996;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2ky1g7vqxE0dSxSYlDayHPkG662KZ7f5gS2hZCCGuQ=;
        b=GbdwsT+qJgkO61GKmPATTBei3gfY1XjQLNysFk22qbTXsRCbg1cdEvH30o59YCRYJe
         euQFF0qqFrIJBBgvB/J4RX4uXF3qUY1i0pq9aCiVhZJI1upaxJIJb/IE0G+0BmdaZPou
         gg/nQFGMmeUgmK3DXwsmTieAokwtKfBy5+jZTAWCn2tg+lFTCfqRQav7O5Mc7mT34vdE
         9bJgV6mtiyZqV6AwHLadfOt/c/jclbi112kxAPTbh7e3WgbVkrBLMuIm4WQbq+jKy9gg
         eOCxV5XX4PgPD/87DUNJWqr5gf4oV42u0gTO18qwgIRQYnUj/LjNeOXxnUqH5gEmT7gl
         oBWA==
X-Forwarded-Encrypted: i=1; AJvYcCU4iSoaBBPuW8+2atbQHGMbtmvG1yqmJvjmGpvK7yYQIXBbBZgasDzM6riebEo1BnK/9zJ/GEUytkq6KkfURep+@lists.infradead.org
X-Gm-Message-State: AOJu0YxBz8rKLnFie0J9G/3jZKyCFUdMo/UagnfA5Ec8Nc0fp4fTbeKu
	VbbN7Qc/mmeVITC8MwRj+DQx57NRAnTRBiZOUZolRH4eGNV6cEC7Y7v9NYWzRNSr8H8F9cNRyPf
	OgA==
X-Google-Smtp-Source: AGHT+IG0rnfQOBcsGBc89nGQ7P5SqEhx394iLm0A9p+JH2UauaQ7PKGIBjoXKOQU6ONzPdt2vT+TuR01CA==
X-Received: from ejdcu3.prod.google.com ([2002:a17:906:ba83:b0:b73:2695:dbc5])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6d13:b0:b77:18a0:3c8b
 with SMTP id a640c23a62f3a-b7718a03cd2mr1308264966b.1.1764613196560; Mon, 01
 Dec 2025 10:19:56 -0800 (PST)
Date: Mon, 01 Dec 2025 18:19:52 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEjcLWkC/x3MQQqAIBBA0avIrBN0QpCuEi1KxxooC40IxLsnL
 d/i/wKZElOGQRRI9HDmMzboToDb5riSZN8MqNBoVFrmwzknA+83JWms9T5oXHpjoCVXosDvvxu nWj8ivT43XgAAAA==
X-Change-Id: 20251201-smccc-filter-588ddf12b355
X-Mailer: b4 0.14.2
Message-ID: <20251201-smccc-filter-v1-1-b4831416f8a3@google.com>
Subject: [PATCH] KVM: arm64: Prevent FWD_TO_USER of SMCCC to pKVM
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
X-CRM114-CacheID: sfid-20251201_101959_129777_427D1986 
X-CRM114-Status: GOOD (  15.35  )
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
the KVM FID range (which pKVM re-uses).

DEN0028 defines 65536 "Vendor Specific Hypervisor Service Calls":

- the first ARM_SMCCC_KVM_NUM_FUNCS (128) can be custom-defined
- the following 3 are currently standardized
- the rest is "reserved for future expansion"

so reserve them all, like commit 821d935c87bc ("KVM: arm64: Introduce
support for userspace SMCCC filtering") with the Arm Architecture Calls.

Alternatively, we could have only reserved the ARM_SMCCC_KVM_NUM_FUNCS
(or even a subset of it) and the "Call UID Query" but that would have
risked future conflicts between that uAPI and an extension of the SMCCC
or of the pKVM ABI.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 Documentation/virt/kvm/devices/vm.rst | 11 ++++++++++
 arch/arm64/kvm/hypercalls.c           | 39 +++++++++++++++++++++++++++++++=
++++
 2 files changed, 50 insertions(+)

diff --git a/Documentation/virt/kvm/devices/vm.rst b/Documentation/virt/kvm=
/devices/vm.rst
index a4d39fa1b0834b090318250db3b670b0b3174259..9ed4b7afe022023346d4835d33a=
901e557fc4765 100644
--- a/Documentation/virt/kvm/devices/vm.rst
+++ b/Documentation/virt/kvm/devices/vm.rst
@@ -400,3 +400,14 @@ will reject attempts to define a filter for any portio=
n of these ranges:
         0x8000_0000 0x8000_FFFF
         0xC000_0000 0xC000_FFFF
         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+Protected KVM (pKVM) reserves the 'Vendor Specific Hypervisor Service Call=
s'
+range of function IDs and will reject attempts to define a filter for any
+portion of these ranges for a protected VM (``KVM_VM_TYPE_ARM_PROTECTED``)=
:
+
+        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+        Start       End (inclusive)
+        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+        0x8600_0000 0x8600_FFFF
+        0xC600_0000 0xC600_FFFF
+        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index 58c5fe7d757274d9079606fcc378485980c6c0f8..5ddcdd70a6b280914048e7683da=
fb778d0f24658 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -135,6 +135,21 @@ static bool kvm_smccc_test_fw_bmap(struct kvm_vcpu *vc=
pu, u32 func_id)
 						   ARM_SMCCC_SMC_64,		\
 						   0, ARM_SMCCC_FUNC_MASK)
=20
+#define SMC32_VHYP_RANGE_BEGIN	ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID
+#define SMC32_VHYP_RANGE_END	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
+						   ARM_SMCCC_SMC_32,		\
+						   ARM_SMCCC_OWNER_VENDOR_HYP,	\
+						   ARM_SMCCC_FUNC_MASK)
+
+#define SMC64_VHYP_RANGE_BEGIN	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
+						   ARM_SMCCC_SMC_64,		\
+						   ARM_SMCCC_OWNER_VENDOR_HYP,	\
+						   0)
+#define SMC64_VHYP_RANGE_END	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
+						   ARM_SMCCC_SMC_64,		\
+						   ARM_SMCCC_OWNER_VENDOR_HYP,	\
+						   ARM_SMCCC_FUNC_MASK)
+
 static int kvm_smccc_filter_insert_reserved(struct kvm *kvm)
 {
 	int r;
@@ -158,6 +173,30 @@ static int kvm_smccc_filter_insert_reserved(struct kvm=
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
+		r =3D mtree_insert_range(&kvm->arch.smccc_filter,
+				       SMC32_VHYP_RANGE_BEGIN,
+				       SMC32_VHYP_RANGE_END,
+				       xa_mk_value(KVM_SMCCC_FILTER_HANDLE),
+				       GFP_KERNEL_ACCOUNT);
+		if (r)
+			goto out_destroy;
+
+		r =3D mtree_insert_range(&kvm->arch.smccc_filter,
+				       SMC64_VHYP_RANGE_BEGIN,
+				       SMC64_VHYP_RANGE_END,
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



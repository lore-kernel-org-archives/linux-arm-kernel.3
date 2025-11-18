Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A308DCED279
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1KpAk/X+mJeWWI/FqOB+Io4kN5HIqeKrqVApCd567Q=; b=z+VRMco+C400qq5wbEWhXrHbdj
	1cJkVss2LjE8QRJHItNjDK8UelPSBsf94f+p3ssu5o1wAso16cQlhU4Vp5lno4S3FCrLCweIe6Egc
	STt8IfjOlYwyCweWGnZHx8T+FFDvm+yh4ssdXto3mzcu/UPZXpR5LJMcDROvBXp2RE1yn0ib3JbJT
	LMCKStSo8ODm8i753dVebTu/8ogbkXaiU4XQvNik6jzZumwLOkKXz524kuOnBqX9Kb6v7u3UaNf3w
	1ANvub5CBMHsrAJd68ZjXFiWlFJ2wFfTSYWyOvWW7G2OnU9rhPhnn6nYGR1xCwIS5m68o0JiMW2TN
	EiAGXsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6L-00000000Fmq-2tYa;
	Tue, 18 Nov 2025 10:38:21 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6G-00000000Fis-2nB2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:17 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b352355a1so3034839f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462294; x=1764067094; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J1KpAk/X+mJeWWI/FqOB+Io4kN5HIqeKrqVApCd567Q=;
        b=0VGpNDAO5EOLtPkdoTwt67Y7D263jF5tRXb4Cehn9i35m7swqHPqSs6oQaGWeABuxX
         fBs6l7NXm8a7d8kE6Kx6He5m5tKQ0tG2YkmBJSG69mU167htzZZ6o05Ofg5l8qmcEI5u
         uzH8KG98a2mANwCrMPSo6ePrdMvbjfUydzugLJg6dkrzKJnkHhSnPZt2BMz3MSFkzX6Y
         6PwbSQJVC/DsJkZcDijLIq0E94Hagral9GhOxuOA/GuLZAyJ/rPtS1uCQkL8rHH8sA21
         fcDoKfkAhHykLIwLLANstGCDVDtdzKwHhnzSXJwRoqKgMQHaue2+kbqTRggRwmiuFUb2
         62Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462294; x=1764067094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1KpAk/X+mJeWWI/FqOB+Io4kN5HIqeKrqVApCd567Q=;
        b=tl7xNFXZBj6LkQGXEKJ2V5DBeZZ0NbNansuOTOMMdz6TbmVB+iBNTicqb0MPSIeFwc
         8YER7xCNcDRzRep6GnlPSfL9dVn/eIbmgd8B4GmuUBwxKw7LZfmc+w7YCfuaqo0Q6J89
         5c5I/RgvldP/wedp7OSXp1BKKWo66H1YpFW8ZTVYx8W4zJwo5W7qhnbGtQZG7B/W19Pt
         23Qed5yaHl7XDpQr4Kb/fb9TGvEcuWLnzJPzawafdfDiYmy3tlV3x/IbSLVW1EQ30fg7
         u2vWi2AGbVCJZyh2PNjTeaXr+hAF9z8XZwnevGypSoegASezraNgHzyiU1oECJrsmTfJ
         fLhA==
X-Forwarded-Encrypted: i=1; AJvYcCXtLGEcKSH1YvT75egsR9MuaXM9LsWjeJK0YKNvvq0jtFgoEcr70KmUM3n7+KwdmUePnDdtXaaNGrE4scs7iAPZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxrQl2BkL+4Pdt0LKs3kl+O+B68TVJG6hS4uo+19pdt3UavM3Gs
	7noj47sLu0LTnIm+O5BhkD3Ei3TyVDb48zt3D3yOz5+9OqrznTzEpzpa4OkaqT8Wf+QSyUU/jZS
	YCg==
X-Google-Smtp-Source: AGHT+IEAYj+W/utL/Dvs1aiYdmCy2z5+TKwIEDcEUnNtXsvha71Ab0BwsvmfljNEPRzfgpl8tCmySeuxRA==
X-Received: from wrbei2.prod.google.com ([2002:a05:6000:4182:b0:42b:b28a:673a])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:615:b0:42b:3dbe:3a37
 with SMTP id ffacd0b85a97d-42ca86971acmr2477705f8f.10.1763462294513; Tue, 18
 Nov 2025 02:38:14 -0800 (PST)
Date: Tue, 18 Nov 2025 10:38:04 +0000
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
Mime-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-8-tabba@google.com>
Subject: [PATCH v5 7/9] KVM: arm64: Track KVM IOCTLs and their associated KVM caps
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023816_721068_5D68F046 
X-CRM114-Status: GOOD (  16.78  )
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

Track KVM IOCTLs (VM IOCTLs for now), and the associated KVM capability
that enables that IOCTL. Add a function that performs the lookup.

This will be used by CoCo VM Hypervisors (e.g., pKVM) to determine
whether a particular KVM IOCTL is allowed for its VMs.

Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 42 +++++++++++++++++++++++++++++++
 include/uapi/linux/kvm.h          |  1 +
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 64302c438355..3ec2d4edd3b4 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1652,4 +1652,46 @@ static __always_inline enum fgt_group_id __fgt_reg_to_group_id(enum vcpu_sysreg
 		p;							\
 	})
 
+/*
+ * Tracks KVM IOCTLs and their associated KVM capabilities.
+ */
+struct kvm_ioctl_cap_map {
+	unsigned int ioctl;
+	long ext;
+};
+
+/*
+ * Sorted by ioctl to allow for potential binary search,
+ * though linear scan is sufficient for this size.
+ */
+static const struct kvm_ioctl_cap_map vm_ioctl_caps[] = {
+	{ KVM_CREATE_IRQCHIP, KVM_CAP_IRQCHIP },
+	{ KVM_ARM_SET_DEVICE_ADDR, KVM_CAP_ARM_SET_DEVICE_ADDR },
+	{ KVM_ARM_MTE_COPY_TAGS, KVM_CAP_ARM_MTE },
+	{ KVM_SET_DEVICE_ATTR, KVM_CAP_DEVICE_CTRL },
+	{ KVM_GET_DEVICE_ATTR, KVM_CAP_DEVICE_CTRL },
+	{ KVM_HAS_DEVICE_ATTR, KVM_CAP_DEVICE_CTRL },
+	{ KVM_ARM_SET_COUNTER_OFFSET, KVM_CAP_COUNTER_OFFSET },
+	{ KVM_ARM_GET_REG_WRITABLE_MASKS, KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES },
+	{ KVM_ARM_PREFERRED_TARGET, KVM_CAP_CORE },
+};
+
+/*
+ * Set *ext to the capability.
+ * Return 0 if found, or -EINVAL if no IOCTL matches.
+ */
+static inline long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vm_ioctl_caps); i++) {
+		if (vm_ioctl_caps[i].ioctl == ioctl) {
+			*ext = vm_ioctl_caps[i].ext;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 52f6000ab020..1f6e51234157 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -704,6 +704,7 @@ struct kvm_enable_cap {
 /*
  * Extension capability list.
  */
+#define KVM_CAP_CORE -1	/* represents core KVM capabilities */
 #define KVM_CAP_IRQCHIP	  0
 #define KVM_CAP_HLT	  1
 #define KVM_CAP_MMU_SHADOW_CACHE_CONTROL 2
-- 
2.52.0.rc1.455.g30608eb744-goog



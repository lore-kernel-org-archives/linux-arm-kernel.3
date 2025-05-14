Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBF0C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c8ePtC5HFZo+bckSClZmheBHRBfYWwooCNAcmQiJQhY=; b=lbwiIphoJaxJouKPZDx29YR5BU
	yaNaFZJ+I9cOx+BnaqUJW+8eJIhz544ZHYxQaZzclOzRUAY8baPy8xNrvk15Icy9Q2J1DEuptsjvG
	I3g3vaRjE6ZobPH09RAnFnMebDFuWrIk4m16C/YEgCTIl5uiliK8eUZsXxYayhusM9vP9aXjFjHur
	yhxBHB1DDLaotIAbt8eQxJ15eMLXHtkGSWbGFfU1aC6VBzTUyLRoOrSJg7WY1UmygErVjZ9CRhMw0
	uwHzbxuWE12tTyT00BQ311a8Ifdji3Thx2qujpT7eit8RMP6F2YfYmxHgv7E9k9eP/0Za6u4n4+6E
	4vlY0oVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHwv-0000000GC05-1cBT;
	Wed, 14 May 2025 19:39:29 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHg6-0000000GA07-3fBx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:22:08 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3da76423ba1so2936195ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747250525; x=1747855325; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c8ePtC5HFZo+bckSClZmheBHRBfYWwooCNAcmQiJQhY=;
        b=odV+eAmL92anToGFtIn/+sRFkf0iJhc1G0Q8VBrUYYIugn0L2fbjh/3l6mH/8x8AkP
         B9n6JHrg0PEk5SaK+UZxnFAvQ7iScYTo6FqwuWLgidKHa3TYof7zMigH8PEd/tITuV1z
         5S8wheIMmqsvTnQ9wdQQQZpg+lv5ZDhJFONxGsflnmjYW1VvKEs7ynQKCZWN1ud9O2HD
         mU9B4I/JNOqCxd9iTkht+JbraPrMFEdAHFyqbBXMZE5Yfo9/IfFgxobPmtesp9Z2WCS9
         9nXBT2+WJiZxBMjyBvILhjF9gCNcLxTfmKgso8UBOiUfRjWru9KZ3cPXRWZbNjmpGAto
         cx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250525; x=1747855325;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8ePtC5HFZo+bckSClZmheBHRBfYWwooCNAcmQiJQhY=;
        b=PoAUjTCS8tmBvI5KMQ7hGq/+yEL95VdKmFZVVCwOUj5VyHvhPid76dVLjl1ixsqGCT
         fz3Ft3yDGbIVu1Pd8YzFzZOReMIkSAflElWFoL0wESE92GWijVlKq6x3R4uSm/JeKbQU
         v6t67nYF3TElT0hqLs8/SNc7PNxX00/b5Qx+QOKL58VUj/hpl+vDKHgSPqk6x1muogOw
         n3NDQwphUv/etoSq7aB1qa/+AAEO9o99PfKVJyyIz5YhmpiftuCMiu4/cYLu2WC8DNos
         ByKkjktZJje//PMGIeykGD9YyK5e5DA2dyfjMsGkL2EnOgX/RSl/UNTiSol46uN1VF+8
         kwtA==
X-Forwarded-Encrypted: i=1; AJvYcCVphePz9v0UVo8EdYDqdm/WsxIiagCjGI9vjLRi13/jhEx/t5RGva/P+BsYTuC5xAk/pgOdPQlYLqp8gbh/jOo+@lists.infradead.org
X-Gm-Message-State: AOJu0YzMUfmWnQAC4fz6bmzwHMAlIQeRqVreu9MB9yRuTJ9VE1JDVQ3I
	dii4BS0bJDQ/WID8CiNs1BLKxtMqbW0BRQDuC7V0Q98pI48noytGxm1ElznapJYSRmZSXRk8Ab+
	t1kKw7A==
X-Google-Smtp-Source: AGHT+IF1ogsTmn2Q4LFsh6tOmFxWnhQ3nGtiA78U3XsyCpRhWXAptzz3zxmhkhTqbmqZ1kXN3wTOk6bikL9+
X-Received: from ilbbt9.prod.google.com ([2002:a05:6e02:2489:b0:3d9:37ff:afd7])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:178f:b0:3d6:cbad:235c
 with SMTP id e9e14a558f8ab-3db6f7ad141mr53575415ab.6.1747250525722; Wed, 14
 May 2025 12:22:05 -0700 (PDT)
Date: Wed, 14 May 2025 19:21:56 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514192159.1751538-1-rananta@google.com>
Subject: [PATCH 0/3] KVM: arm64: Allow vGICv4 configuration per VM
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_122206_909049_51CE4CD4 
X-CRM114-Status: GOOD (  14.85  )
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

Hello,

When kvm-arm.vgic_v4_enable=1, KVM adds support for direct interrupt
injection by default to all the VMs in the system, aka GICv4. A
shortcoming of the GIC architecture is that there's an absolute limit on
the number of vPEs that can be tracked by the ITS. It is possible that
an operator is running a mix of VMs on a system, only wanting to provide
a specific class of VMs with hardware interrupt injection support.

To support this, introduce a GIC attribute, KVM_DEV_ARM_VGIC_CONFIG_GICV4,
for the userspace to enable or disable vGICv4 for a given VM.

The attribute allows the configuration only when vGICv4 is enabled in KVM,
else it acts a read-only attribute returning
KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE as the value.

On the other hand, if KVM has the vGICv4 enabled via the cmdline, the
VM absorbs this configuration by default to maintain the backward
compatibility. Userspace can get the attribute's value to check if the VM
has vGICv4 support if it sees KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE as the
value. As required, it can disable vGICv4 by setting
KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE as the value.

The patches are distrubuted as:

Patch-1 contains the KVM code that introduces the
KVM_DEV_ARM_VGIC_CONFIG_GICV4 attr, and adds all the support around it.

Patch-2 adds the documentation for the said attribute.

Patch-3 extends the vgic_init kvm/arm64 selftest that tests the get and
set of this attribute in various configurations.

Thank you.
Raghavendra

Raghavendra Rao Ananta (3):
  kvm: arm64: Add support for KVM_DEV_ARM_VGIC_CONFIG_GICV4 attr
  docs: kvm: devices/arm-vgic-v3: Document KVM_DEV_ARM_VGIC_CONFIG_GICV4
    attr
  KVM: selftests: Extend vgic_init to test GICv4 config attr

 .../virt/kvm/devices/arm-vgic-v3.rst          | 24 ++++++--
 arch/arm64/include/uapi/asm/kvm.h             |  7 +++
 arch/arm64/kvm/vgic/vgic-init.c               |  3 +
 arch/arm64/kvm/vgic/vgic-its.c                |  2 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c         | 39 +++++++++++++
 arch/arm64/kvm/vgic/vgic-mmio-v3.c            | 12 ++--
 arch/arm64/kvm/vgic/vgic-v3.c                 | 16 ++++-
 arch/arm64/kvm/vgic/vgic-v4.c                 |  8 +--
 include/kvm/arm_vgic.h                        |  5 ++
 tools/testing/selftests/kvm/arm64/vgic_init.c | 58 +++++++++++++++++++
 10 files changed, 157 insertions(+), 17 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
--
2.49.0.1101.gccaa498523-goog



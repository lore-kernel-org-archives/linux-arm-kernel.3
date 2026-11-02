Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5310606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=snRjWR/7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZfS4XiVW;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TYPWR0dU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sBD/iLyH/Vf+hAp/qqDPHWO6xrlAc6aE/ExgXwrnyso=; b=snRjWR/7UagtWT
	KX/BJPTKzUpBzk5nnGW1sylBnO2l52d0Ae2PJAXzZJmUqKSW8oy/ToygcDazUZmqBEayDz9wwgHMn
	ugcrmBE4GlSNfIKjAXDVL+/XYSgwIomjNBJdGZgHvqnwPzXN17ElXOTtbcJ58+y9CutGg8yrp/xnV
	pFNUr0aX/4/4ZjiPonorkn3X9gi6X4FV2i9AX1EAfYjEgsseffrIUJKTmsSvOY6I7yr2wP2xzWpr8
	rjpXRZIzm9gngD3kFPSxkfMoYSZU2dfsc8Xv3CleZlGP03QgCKUQed50acAg8ETL8Ra+rXo/bcBm+
	wJCgiWji9kl1T97zyiHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxzS-00000000BK5-2KW3;
	Mon, 02 Nov 2026 19:46:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxz3-00000000ADP-02tI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 19:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sBD/iLyH/Vf+hAp/qqDPHWO6xrlAc6aE/ExgXwrnyso=; b=ZfS4XiVWgDjs9dWB5zFI6RZ+AB
	mI48i6agO3rLZcVuPTe3nUxMotjGMl0Gm2fibsBbDcW+QJza5RWIHBvkJIU9+a8FFRiLCizN7GCiB
	mjKSs7oVRtdz2GPN9TKtlJW16XzNjnueOYh/UkPFa9a4DwwLmOOBhaogqd90WBjUNMbp5gYPNlilt
	OWB19BzLNHrSCSHYEyEJW2YEqfIS6xxUr11RG2WAB+P7SHvPGdiPsKz3KzlGU5IYHlJ8aZ1agabUI
	2JbQ5mr26vA158lIE0JoiBMnLnu3e0SGIJCgjr8jrtHcLaAmSiVEtY+vL33SVBxYlgQf4a762AG4N
	up50QlLg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyz-000000031S1-2OnD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:46:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41FFA1C14;
	Mon,  2 Nov 2026 11:46:13 -0800 (PST)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D11923F673;
	Mon,  2 Nov 2026 11:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793648776; bh=d1FdxpNAuMkdc29Zi++sFjV6IK6Sfgi3YBf1WtM/ClI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TYPWR0dUjFbR2g3LgCwkMePasUsnFU8O0jQPh7ZgWtNu9lNB5BN4ZWm49JZar34kv
	 DkZ77pZZQoBJGbqjxVUhXT01xSzXwEsEKrWMVuRqDRYphNwV9LJV6mSysEeY8FjXHv
	 kKa+IjCea+Hfe72HzUEwnuVugZz6N31e9aMsbInY=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	peter.maydell@linaro.org,
	lpieralisi@kernel.org,
	timothy.hayes@arm.com,
	fuad.tabba@linux.dev
Subject: [PATCH v2 16/16] KVM: arm64: gic-v5: Document ITS userspace ABI
Date: Mon,  2 Nov 2026 19:44:54 +0000
Message-Id: <20261102194454.4086911-17-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102194454.4086911-1-sascha.bischoff@arm.com>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_194617_978049_52A69431 
X-CRM114-Status: GOOD (  21.83  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the GICv5 ITS device and its userspace ABI, including the
MMIO address, reset control, register attributes, and MSI requirements.
State that software should target ITS_TRANSLATER, while KVM uses the
MSI address to identify the virtual ITS.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 .../virt/kvm/devices/arm-vgic-v5-its.rst      | 111 ++++++++++++++++++
 Documentation/virt/kvm/devices/index.rst      |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/virt/kvm/devices/arm-vgic-v5-its.rst

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v5-its.rst b/Documentation/virt/kvm/devices/arm-vgic-v5-its.rst
new file mode 100644
index 0000000000000..ae1a84deef98b
--- /dev/null
+++ b/Documentation/virt/kvm/devices/arm-vgic-v5-its.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================================
+ARM Virtual Generic Interrupt Controller v5 ITS (VGICv5 ITS)
+============================================================
+
+Device types supported:
+  KVM_DEV_TYPE_ARM_VGIC_V5_ITS    ARM GICv5 Interrupt Translation Service
+
+The GICv5 ITS translates MSI(-X) interrupts into LPIs. It is optional and
+requires a GICv5 host and a KVM_DEV_TYPE_ARM_VGIC_V5 device for the VM. The
+ITS and VGIC devices may be created in either order, but their models must
+match. Userspace should assign each ITS a separate, non-overlapping MMIO
+region.
+
+MSIs injected through KVM_SIGNAL_MSI must provide a DeviceID using
+KVM_MSI_VALID_DEVID. The MSI address should target ITS_TRANSLATER in the
+ITS_TRANSLATE_FRAME. KVM uses the address to identify the virtual ITS, and
+the MSI data supplies the EventID. The virtual ITS supports 16-bit EventIDs;
+the upper 16 bits of the MSI data must be zero.
+
+
+Groups
+======
+
+KVM_DEV_ARM_VGIC_GRP_ADDR
+-------------------------
+
+  Attributes:
+    KVM_VGIC_V5_ADDR_TYPE_ITS (rw, 64-bit)
+      Base address of the ITS in the guest physical address space. The address
+      must be 64K aligned. The region covers 128K: a 64K control frame and a
+      64K translation frame. The address must be set before accessing ITS
+      registers through KVM_DEV_ARM_VGIC_GRP_ITS_REGS. It can only be set once.
+
+  Errors:
+
+    =======  =========================================================
+    -E2BIG   Address outside the guest's addressable IPA range
+    -EINVAL  Address is not 64K aligned, or the 128K range wraps
+    -EEXIST  Address has already been configured
+    -EFAULT  Invalid user pointer for kvm_device_attr.addr
+    -ENODEV  Unsupported address attribute for GET or SET
+    -ENXIO   Unsupported address attribute for HAS
+    -EBUSY   Concurrent address configuration has already set the base
+    -ENOMEM  Unable to allocate space for the MMIO bus entry
+    -ENOSPC  MMIO bus device limit reached
+    =======  =========================================================
+
+
+KVM_DEV_ARM_VGIC_GRP_CTRL
+-------------------------
+
+  Attributes:
+    KVM_DEV_ARM_VGIC_CTRL_INIT
+      Accepted for consistency with other VGIC devices; no additional ITS
+      initialization is required.
+
+    KVM_DEV_ARM_ITS_CTRL_RESET
+      Reset the emulated ITS registers and discard cached translations. The
+      configured MMIO base address is retained. Guest memory containing the
+      device and interrupt translation tables is not modified.
+
+  Errors:
+
+    =======  =========================================================
+    -EBUSY   A vCPU could not be locked for reset
+    -ENXIO   Unsupported control attribute for SET, or any GET
+    =======  =========================================================
+
+
+KVM_DEV_ARM_VGIC_GRP_ITS_REGS
+-----------------------------
+
+  Attributes:
+    The attr field of kvm_device_attr contains the ITS register offset from
+    the control frame base address. kvm_device_attr.addr points to a __u64,
+    regardless of whether the register is 32 or 64 bits wide. A 64-bit
+    register must be addressed at its base offset; userspace cannot access
+    its upper or lower half separately. Guest MMIO may use aligned 32-bit
+    accesses to DT_BASER, DIDR, READ_EVENT_DATAR, and GEN_EVENT_DIDR.
+
+    KVM_HAS_DEVICE_ATTR can probe supported offsets before the ITS base
+    address is configured. KVM_GET_DEVICE_ATTR and KVM_SET_DEVICE_ATTR require
+    the base address to be configured first.
+    Writes to read-only registers are ignored, except for IDR0-IDR2 and
+    READ_EVENT_DATAR, which can be restored through this interface. IDR0
+    requires the non-secure domain, a PA range supported by the host, and no
+    unsupported features. IDR1 cannot advertise more than 16 DeviceID bits.
+    IDR2 cannot advertise more than 16 EventID bits or cross-domain events.
+    Guest MMIO writes to these registers are ignored.
+
+    Writes to DT_CFGR and DT_BASER through this interface update their values
+    even when the ITS is enabled; guest MMIO writes to those registers are
+    ignored while it is enabled.
+
+    The registers with readable, writable state are CR0, CR1, DT_CFGR,
+    DT_BASER, DIDR, EIDR, GEN_EVENT_DIDR, and GEN_EVENT_EIDR.
+
+    Some registers initiate guest-visible operations when written, including
+    INV_EVENTR, INV_DEVICER, READ_EVENTR, and GEN_EVENTR.
+
+  Errors:
+
+    =======  =========================================================
+    -ENXIO   ITS base address is unset for GET or SET, or offset is unsupported
+    -EINVAL  Offset is not aligned to the register width, or an ID register
+             contains an unsupported value
+    -EFAULT  Invalid user pointer for kvm_device_attr.addr
+    -EBUSY   A vCPU could not be locked
+    =======  =========================================================
diff --git a/Documentation/virt/kvm/devices/index.rst b/Documentation/virt/kvm/devices/index.rst
index 70845aba38f45..d6d64b7266e83 100644
--- a/Documentation/virt/kvm/devices/index.rst
+++ b/Documentation/virt/kvm/devices/index.rst
@@ -11,6 +11,7 @@ Devices
    arm-vgic
    arm-vgic-v3
    arm-vgic-v5
+   arm-vgic-v5-its
    mpic
    s390_flic
    vcpu
-- 
2.34.1



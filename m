Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA865C369AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tk+7Y0dwQ0QvFjDNoLfD9uEdXiBfJROFOdP2bqC/SWs=; b=ZxcYAlL/4F/MuDDXRB/23nzQQ0
	KL6pRIxvUgh4oIlyUDmqrC8pfl3wPqjat/SOnoqk1r/T8F0L4r/YCNSZSB3g1HYAEgYCxHT7U0rZE
	7x4CXepafcbO25QArlCFs/PV96ltfbLGA9pSKWcMpPPCE7gk+eSroFOvG8ca5EerWBOevyfSr/1lZ
	GLmtWGzDSxi9ADw4gpyZMDlJ6wyhzeYJQ5Uj+I3VfVc++GZDijjL/trBjfU+PIqT1/FC6g7qXjpGm
	BOQf8ozRPYNSiF7iGXRJMqTR7mRXiPovNSx2Bb+i5t6mpsZ9zzFBRcmCx3uw+Y258ZlzqvxOQk3lK
	XPcRSZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28lx-000000046Ei-0KtO;
	Tue, 08 Apr 2025 13:13:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZT-00000003kb9-0zcb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 10:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Tk+7Y0dwQ0QvFjDNoLfD9uEdXiBfJROFOdP2bqC/SWs=; b=ePmAMU/RK1zuoOeKysKmW7eaQo
	Y+mcq1VkwWMVlkEkBQPCRpw5hDHRpfA4H06lxxJSlUYMpyFJkfiGHV2g3jtHwnoBsilsHO4kRGeTS
	oybLuaygHxEfhnXRBUBRe8uhafGCbLaHacTnZ6QxtErpxdgiBDO56khBhvzeo5VAHM2QxN9W1WdWb
	HP0a64jNGDfiwlIcf4+knwQtp4ggdJ/t4cBnp7UAc1EXiLHb6ppFP8zytifTb8KwM03sPvM3jx6kF
	d7jLSjQlj0A6iGvBaljtu9HWmRIr0MG0EvjjnT3kdR8mDhDNMXiascwqIV9O9t4q/nL1VGBZfk4mh
	og4NRGQg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZP-00000008GRg-2VWP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F3704A10C;
	Tue,  8 Apr 2025 10:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2723FC4CEEA;
	Tue,  8 Apr 2025 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109562;
	bh=dFpMDUwZJl4d3Cu1jwOtYwohos+qMJ2+5YSt5qvdaF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M/7QpGXjdRjjn4ws4kBlce3BKMiYS/TBzkHKk2+pSicZ3GpHSRn3zj59s4aLkrSpd
	 AOWz+5Wbll6+UshAb3oZ8pnI5fvrVX6i+pJXpPMaCYf+6GmBAhpTnDKE9U2Yg9PyBm
	 KeEWhME6lDT3Kpqt/8emrjqT4wgx4w/y5eWgGx13X/LGAN61ibaNyl1PVD8GuWRYJD
	 FJhuYfYiuriXEKkl5KDVZhmUHhRqpKMIlhS5tiYSN+pzWl5+EoInB6TOsxnwLFmPwA
	 efrWfKAVAhCB4UbdWW2jvreaU1kx9W6LVmjtKVzQVpcW0ahqMYiJo5x8xOvWqMgCy/
	 jCrDjRMkEf/SQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u26ZM-003QX2-B9;
	Tue, 08 Apr 2025 11:52:40 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 17/17] KVM: arm64: Document NV caps and vcpu flags
Date: Tue,  8 Apr 2025 11:52:25 +0100
Message-Id: <20250408105225.4002637-18-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250408105225.4002637-1-maz@kernel.org>
References: <20250408105225.4002637-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_115243_833928_67DDB5C6 
X-CRM114-Status: GOOD (  12.01  )
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

Describe the two new vcpu flags that control NV, together with
the capabilities that advertise them.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/virt/kvm/api.rst | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1f8625b7646a2..1258a1fca6678 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3460,7 +3460,8 @@ The initial values are defined as:
 	- FPSIMD/NEON registers: set to 0
 	- SVE registers: set to 0
 	- System registers: Reset to their architecturally defined
-	  values as for a warm reset to EL1 (resp. SVC)
+	  values as for a warm reset to EL1 (resp. SVC) or EL2 (in the
+	  case of EL2 being enabled).
 
 Note that because some registers reflect machine topology, all vcpus
 should be created before this ioctl is invoked.
@@ -3527,6 +3528,17 @@ Possible features:
 	      - the KVM_REG_ARM64_SVE_VLS pseudo-register is immutable, and can
 	        no longer be written using KVM_SET_ONE_REG.
 
+	- KVM_ARM_VCPU_HAS_EL2: Enable Nested Virtualisation support,
+	  booting the guest from EL2 instead of EL1.
+	  Depends on KVM_CAP_ARM_EL2.
+	  The VM is running with HCR_EL2.E2H being RES1 (VHE) unless
+	  KVM_ARM_VCPU_HAS_EL2_E2H0 is also set.
+
+	- KVM_ARM_VCPU_HAS_EL2_E2H0: Restrict Nested Virtualisation
+	  support to HCR_EL2.E2H being RES0 (non-VHE).
+	  Depends on KVM_CAP_ARM_EL2_E2H0.
+	  KVM_ARM_VCPU_HAS_EL2 must also be set.
+
 4.83 KVM_ARM_PREFERRED_TARGET
 -----------------------------
 
-- 
2.39.2



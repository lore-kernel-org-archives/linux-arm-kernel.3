Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD55AC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MrOwSA4/GJIUvAzvsP4XCDZ0q0nOQ90VCzJP9WJBDjI=; b=nwAE2HhzYTyHQ3Dsgyh15ABClQ
	kEFl4WwJFxz9G32pZ1259LcUmWZGOwUN2/ycwsSwtoZBpWoUEpcRzTIY0MPv+3w8l7AkoMqWl/IUi
	jCpmYPBPl303V3+h9TY5yL8QZa10UHjZUXWffJZkkThXEAu0hWAv1pAK4aAXx2pUMT6XkEMf5bNqV
	A4ORzU2yfkwCBF+Aiq8gw33WGX5szvMfVz9DLxEUy+zAkMIzMZxy5DJ+JrK8KvfIxH/i8cYJQyof/
	0r8s4xwvptocQMdxKYUzxFVvwaXOZK8LM+u29CVi/MdDn8P7aAqw5fO2RQCdU0X4UvOyWEotQfy4K
	7LxSgEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x639E-00000002yz3-00Fo;
	Mon, 14 Sep 2026 09:38:48 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x639B-00000002yy3-34Gu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:38:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Z56ci8XJpnyMsmeEYOX34hHR6NCwZFp+Ce7KKyuVDqc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789378723; v=1; x=1789983523;
 b=KOdd4U8IMyWR0QKicX+iGj3NfOlHq7yOTkIf4iOlmm01miaB6K3Sy5oTfnKT9FkMQLSrAir8
 NMtSZHGWDUWJ7Fc5FnjBi4S+8uiQ41UXlvKvWPycbYGXKS8fD8+e30Ix8kUGMCepySzRDhWiKax
 U97EDNNf/UXcJHIr/eC6W3rU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9986b6a69b475a7f;
	Mon, 14 Sep 2026 09:38:43 +0000
X-Mizu-Trace-ID: 9986b6a69b475a7f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: Don't WARN on an unknown VM ioctl in protected mode
Date: Mon, 14 Sep 2026 10:38:38 +0100
Message-Id: <20260914093838.1082637-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_023846_130921_D4B58998 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

kvm_pkvm_ioctl_allowed() WARNs when kvm_get_cap_for_kvm_ioctl() doesn't
find the ioctl number in vm_ioctl_caps[], and kvm_arch_vm_ioctl() calls
it for every number the generic code doesn't handle, so
ioctl(vm_fd, 0xdeadbeef) from userspace taints a pKVM host and panics it
under panic_on_warn. The lookup is fed userspace input: return false,
and userspace gets the -EINVAL kvm_arch_vm_ioctl() returns for that
number on a host without pKVM.

Fixes: b12b3b04f6ba0 ("KVM: arm64: Check whether a VM IOCTL is allowed in pKVM")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pkvm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index beea00e693a0a..cad60569f0619 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -65,8 +65,7 @@ static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
 	int r;
 
 	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
-
-	if (WARN_ON_ONCE(r < 0))
+	if (r < 0)
 		return false;
 
 	return kvm_pkvm_ext_allowed(kvm, ext);
-- 
2.39.5



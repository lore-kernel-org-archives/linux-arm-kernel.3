Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D53EC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIfmqWHzYLumRU2yPRknO7OjywHDHvBC66gkk+VWF+w=; b=QIZaSfWxTlFOXMlZ2SWkok1qVq
	ofGhdJ6sfsFfv8/Uq7bkfpwwRbmgc73j1JV6tmQ4I+EMOHGqQs54dWfNnM8XemzNuvT2Ey/M1FpPU
	yQk1Wqc+YElHc2UlYK1IU26JjgwwVbRoGkHOX7VT5CZ7ppSoOCksv5lx0D2Tw06rJAb8YEPxj+E37
	JZpxhe9ce4xA6y1cfeglMj3USyZJhqjq9Is6rmP6i35H1L8yRg1fYBxRGLlJobG/R1AO1KcNm4Pcw
	QH2bY40zkd9O9h7UZSO1Zn6jk9icigXrCJw6+kFeRsUcg9N6eY7jRlsKoazf17oyqmWgPKMowhhoy
	yVTGRlBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TMu-000000066tD-1L8E;
	Mon, 07 Sep 2026 07:02:16 +0000
Received: from out-41.mta1.migadu.com ([2001:41d0:203:375::29] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TMl-000000066nb-3Xz0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:02:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4rBBnTKsVt+UNDbaByl3o+wf1nAc8VgqLVJ0fBMEElU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764524; v=1; x=1789369324;
 b=xnzj2TFmQpMviOUUInBFglPIZm8ksJ9/NnnZWGs5YTj7AsZjbtZMSE4CzDz4pSyt9o6RTsmK
 9KyfuDeAta7Z8Copdju+cvySOCcQ6lYQUTVWEZovWNQgqcWXq2U0/5K6LN9FobOVTC5kq2zunSG
 X6aLg/wkQW2tD4XbvJWt4dK0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ef192164074fc80d;
	Mon, 07 Sep 2026 07:02:04 +0000
X-Mizu-Trace-ID: ef192164074fc80d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 16/17] KVM: arm64: Advertise the capabilities that protected VMs support
Date: Mon,  7 Sep 2026 08:00:01 +0100
Message-Id: <20260907070002.3333525-17-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000209_109633_E00F0AA3 
X-CRM114-Status: UNSURE (   7.59  )
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

kvm_pkvm_ext_allowed() denies every capability it doesn't name, so a
protected VM reports 0 for interfaces it implements: KVM_CHECK_EXTENSION
denies KVM_CAP_ONE_REG while KVM_{GET,SET}_ONE_REG stage the guest's
boot state.

Allow the capabilities that work for a protected guest under the
restrictions the preceding patches add, the vGIC and the I/O bus being
host-managed.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pkvm.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 5fec511eca733..ee3ab505b01f7 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -41,6 +41,15 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_VM_IPA_SIZE:
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
+	case KVM_CAP_ONE_REG:
+	case KVM_CAP_MP_STATE:
+	case KVM_CAP_VCPU_EVENTS:
+	case KVM_CAP_VCPU_ATTRIBUTES:
+	case KVM_CAP_IMMEDIATE_EXIT:
+	case KVM_CAP_IOEVENTFD:
+	case KVM_CAP_IRQFD_RESAMPLE:
+	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
+	case KVM_CAP_ARM_INJECT_SERROR_ESR:
 		return true;
 	case KVM_CAP_ARM_MTE:
 		return false;
-- 
2.39.5



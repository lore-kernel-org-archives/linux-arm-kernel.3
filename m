Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C4DC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfsO4mfTe6upfBYmzUM23X2u/c4rA6Qp/1NqYaLuvkc=; b=jZAg6V8hculR51slmxWlvvCEdL
	c3WAFhnxToqigx7BgL2pWvBgKuHD6lT50otf0Ib185/KOK9H9RnJa6ZBxbmQOQpT+RtQ0b7NyAZi9
	3ikk+RHkjNx8Y66bfXXYUv1gelQNbe+jwEDhMYjL8nGWnrXG1iXp1MBXZZSfbTjecofH8LbixRePE
	lo037jIvH9Y+vXGc7Lu+PzV8kl2Z++Zxd5rwSp0+TGCpmCW86CfIl4ZiNUGX2SJZOCLtcPMlBWQAg
	L6Wqk4xb9dEhH5nf4pNO5zEkPDp5WyRUAUyspVZqVBohs2U1zyUvVfKtxbxSmyXvLGulEvpk6nDoj
	7ZnRWL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14y5-0000000A3fD-1jBk;
	Mon, 31 Aug 2026 16:34:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14xs-0000000A3Wl-2X1w
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 31 Aug 2026 16:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CfsO4mfTe6upfBYmzUM23X2u/c4rA6Qp/1NqYaLuvkc=; b=IIJlMP562EeZzKXblib57lmP9C
	8ity45QzOf+iUUEB6yTYGmgYRqY9yQ9XVdHe4XqYky/LVp0lGq802Lwi8Y9iRVVk2ULZtRtJveNnm
	8qfsDKnooDw08C/szIVuDF3CWFwbn+yg+IuHTJr+qCJhCA1rDykQ2noeLF7Xg5rbav92vBWg7SYeh
	Ftr+GpDY37Ih4xFG2vwptXYvkU6NnqfW0EhYiSilJBvuBAomwjkojwb9nd25xdyO2XsFhH1yV+fLj
	9JivgvuAj/HE17LByP6cVwy/pxZ7yvvx35Q+xW4lrXLt7whpMuGxMi0gWh4A9e7qFohPKrCqDG9z0
	yliA4sqg==;
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x14xp-0000000A3cn-1ruI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:34:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xkq1pK+JQIT20fKqr7d//bEzBjwmUGbNVIrU7IeZkOU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194064; v=1; x=1788798864;
 b=RfKXUbufu2N5juLudrfplKRLh7fG3qGc+sJpyLEQOh+RvIV5P+UGjMmiHXV6s7pys0tXjHIH
 iITcCpYB3o9w8FyXiW/jtLCFTVgc4I762BOubKmVEnrHj7GBj6VSUo68CVgH5K/wH4YSKjaFhDd
 7kUAL8XAE5bYEDGVUlj+LoUQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 83b96d24d68e6398;
	Mon, 31 Aug 2026 16:34:24 +0000
X-Mizu-Trace-ID: 83b96d24d68e6398
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
Subject: [PATCH 03/17] KVM: arm64: Reject the PVTIME vCPU attribute for protected VMs
Date: Mon, 31 Aug 2026 17:34:07 +0100
Message-Id: <20260831163421.272420-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_173429_577344_A69B9152 
X-CRM114-Status: UNSURE (   9.76  )
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

pKVM currently does not support steal time for protected guests:
KVM_CAP_STEAL_TIME reports 0 for them. The host still accepts the
KVM_ARM_VCPU_PVTIME_CTRL attribute, whose IPA would point
kvm_update_stolen_time() at the guest's private memory on every vCPU
load. Return -EPERM for the attribute group instead.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/guest.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index b01d6622b8720..23f725e2cf745 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -916,6 +916,10 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_timer_set_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_PVTIME_CTRL:
+		/* Steal time is not offered to protected guests. */
+		if (kvm_vm_is_protected(vcpu->kvm))
+			return -EPERM;
+
 		ret = kvm_arm_pvtime_set_attr(vcpu, attr);
 		break;
 	default:
@@ -939,6 +943,9 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_timer_get_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_PVTIME_CTRL:
+		if (kvm_vm_is_protected(vcpu->kvm))
+			return -EPERM;
+
 		ret = kvm_arm_pvtime_get_attr(vcpu, attr);
 		break;
 	default:
@@ -962,6 +969,9 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
 		ret = kvm_arm_timer_has_attr(vcpu, attr);
 		break;
 	case KVM_ARM_VCPU_PVTIME_CTRL:
+		if (kvm_vm_is_protected(vcpu->kvm))
+			return -EPERM;
+
 		ret = kvm_arm_pvtime_has_attr(vcpu, attr);
 		break;
 	default:
-- 
2.39.5



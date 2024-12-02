Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7597D78339
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfDzgzrqb3PQdvUxGcRE8wORdNOndMEQsGh5EC4eWtk=; b=sLXn9dqvzFxCQX0vVS60NnzSCl
	m0CJMb+49yjELra1YkZ/IKLbJmHm+KsNueCr4gr27JsVKfaQX6TL2uCcb07Fl4N1Rg6V45V3xZsGN
	+ztNYOIu1tpt8Q4VZuVTtB3MXxpxHBexSOBZxbAGeH59TQyR7SRH/rnljxik+BCRgtji1qIiWjwLD
	tOmY1ANT6CYXmLMPOmwbVm32N/hEjTTldDCxFriU77dW29P77cU0EAsUS5TAA0sbI82xbGIzq8eM8
	vOr/58u3eT2QOkc1BPv4XXrov8SSuI9RF1XCwL2uZpANzt7DXFn2Am5OZSmxZWofEzItFtqh9y2U8
	+vDh6ggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIACd-000000070jt-0zoH;
	Mon, 02 Dec 2024 17:27:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7u-00000006zze-1qmm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RfDzgzrqb3PQdvUxGcRE8wORdNOndMEQsGh5EC4eWtk=; b=LDYQQ/+j1nrSvq4fMwM1+kXimk
	c9DTm5kNe1BNrmTbFIgcAr1N1hHOxZ9WIH450/ysGed6KfRDu9YKV5Vr79bCIpS9EaHiX2hCYDiTo
	kB3jBz6ZgHpKoxwwNomZtujrGAJLk64utZQ8b8rdG8TCMlllmGcTJNasVCNtIWum5vm2+YR9It3qB
	vtIzV2ldzycK1zyLtS36KbfVNqd1SA4JGucfn3vFYQArvofhH3k1BR/YulebWy8XHwCGCdUuP/DWO
	vUlCJseiWNYwHROL+mIUj6OhFjpDL4mASuMleLxKzevLE/ZbMuzc+Byx6F21a2iGBozSJUuHh414U
	/nGig0oQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7q-00000002D6u-0hNo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 130135C56F6;
	Mon,  2 Dec 2024 17:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6BBC4CEE0;
	Mon,  2 Dec 2024 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160138;
	bh=/6ehcPZl2b9FxW/6Rj24yU7DtKsnX/BkIYVDARjLPoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fud1a6XahjKVbzv4IRn7pjn63JctMk52BEySVB1cxZgVntjdth78Iw/Al9jVAEzXu
	 YcMz1hSS4iQ4x2AmPlv2yaE8BDZK/TfcXebynLw0TDevjzCRwYACMnT5DHg08SneAF
	 SMMTkW3CTkpKwKyBYOYsmENY1caJy5BS+ckmdZnlcQIDePJe4b70oy8crbBoW9yCdu
	 ZgGFVGNUSzQYFgWyoFuGi6rPG+aAfzEhDZN88bGiuYYDf/TZXHqz+UG9DzJYxw0CUF
	 zsO/cOp9AvDxoeD9kBKzR3Vxrf3iBZ4rnfGaA60HkWK/GaYW50xrlYdFOhngOI5Hx5
	 B8Y8J5QDDuDxA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIA7k-00HQcf-VF;
	Mon, 02 Dec 2024 17:22:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH 06/11] KVM: arm64: nv: Acceletate EL0 counter accesses from hypervisor context
Date: Mon,  2 Dec 2024 17:21:29 +0000
Message-Id: <20241202172134.384923-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172222_507017_3B688C05 
X-CRM114-Status: GOOD (  12.10  )
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

Similarly to handling the physical timer accesses early when FEAT_ECV
causes a trap, we try to handle the physical counter without returning
to the general sysreg handling.

More surprisingly, we introduce something similar for the virtual
counter. Although this isn't necessary yet, it will prove useful on
systems that have a broken CNTVOFF_EL2 implementation. Yes, they exist.

Special care is taken to offset reads of the counter with the host's
CNTPOFF_EL2, as we perform this with TGE clear.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h |  5 +++++
 arch/arm64/kvm/hyp/vhe/switch.c         | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 34f53707892df..30e572de28749 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -501,6 +501,11 @@ static inline bool handle_tx2_tvm(struct kvm_vcpu *vcpu)
 	return true;
 }
 
+static inline u64 compute_counter_value(struct arch_timer_context *ctxt)
+{
+	return arch_timer_read_cntpct_el0() - timer_get_offset(ctxt);
+}
+
 static bool kvm_hyp_handle_cntpct(struct kvm_vcpu *vcpu)
 {
 	struct arch_timer_context *ctxt;
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index b014b0b10bf5d..49815a8a4c9bc 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -296,6 +296,13 @@ static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
 			val = __vcpu_sys_reg(vcpu, CNTP_CVAL_EL0);
 		}
 		break;
+	case SYS_CNTPCT_EL0:
+	case SYS_CNTPCTSS_EL0:
+		/* If !ELIsInHost(EL0), the guest's CNTPOFF_EL2 applies */
+		val = compute_counter_value(!(vcpu_el2_e2h_is_set(vcpu) &&
+					      vcpu_el2_tge_is_set(vcpu)) ?
+					    vcpu_ptimer(vcpu) : vcpu_hptimer(vcpu));
+		break;
 	case SYS_CNTV_CTL_EL02:
 		val = __vcpu_sys_reg(vcpu, CNTV_CTL_EL0);
 		break;
@@ -314,6 +321,12 @@ static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
 		else
 			val = __vcpu_sys_reg(vcpu, CNTV_CVAL_EL0);
 		break;
+	case SYS_CNTVCT_EL0:
+	case SYS_CNTVCTSS_EL0:
+		/* If !ELIsInHost(EL2), the guest's CNTVOFF_EL2 applies */
+		val = compute_counter_value(!vcpu_el2_e2h_is_set(vcpu) ?
+					    vcpu_vtimer(vcpu) : vcpu_hvtimer(vcpu));
+		break;
 	default:
 		return false;
 	}
-- 
2.39.2



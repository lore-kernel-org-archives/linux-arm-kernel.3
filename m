Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAB1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1OwXDZ3KeRzGd2Vnnpaesl0H/NLxyj9uXGEasI6aSQ=; b=NMm8xECjTtj5pf4Imb/Fjzrxd2
	2FXmQq0AfXMPOZF+5u2z6x8A5G7Vox6iWjIbJLAUeqV/PZqxzPgVMUcuWxbxft/5YuZlrNAW2IMMi
	ipM0GvRyrg1c35OVnMaS/m2nkgipdCBvpvel6lnKq2rxvT/4AjerfGLQjV6/VgsKS06iHmzen7LBh
	NDo5lgC/Qp5oux35qgD9owziw0vsTOcrPXeZFsliOlTc86JakHg/N+XIavix0Yz+CBvxo9ko1EWP2
	uPEWnUsTzNeObO3i12sOQDyNbb2puXSZ2SZXNzoOR9nCETPqr0ikjm2mz+/FITia43liJjysiiX0m
	m9yWdJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYcP-0000000DlPN-0Dwl;
	Tue, 17 Dec 2024 14:32:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYU2-0000000DjZI-0QrT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 14:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=J1OwXDZ3KeRzGd2Vnnpaesl0H/NLxyj9uXGEasI6aSQ=; b=g1fuGUehC3D6NVk3RvDM+8WSyI
	bp8qWCpUUVn31aSEPLjlMi+Ty4WKvuG1jnCK1N50Rtlx9vtpCR7ic8y32Y/CFghS/l87EMeWyPyiI
	J4yitx0tQPzv7l3Oj68UFKdp2oXlmCZN06uVok6rmBIrlX3o2pwUdeMT3vx7117y3k0dyH+Ojv3HY
	n5Wa9SQqgBp+r2IMvL5tl3tH7UDc4EAtLAuGATj6wdBvJpez548SaUUgFQqF0D3ZeGP2BMnG5DXSA
	1dFTZR79ag2bBGEB1q1tL9FRdLmQfAsiY97Hcy9Hhtin0enyIK3dOeovgc8u1SoYeszYoTi17FbOD
	A2fldX9Q==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYTx-000000055Wu-42Fp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3137BA418D2;
	Tue, 17 Dec 2024 14:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DEFC4CEDF;
	Tue, 17 Dec 2024 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445407;
	bh=pdUNx1WcP9RZOx0BJJpcgIOG/jIzcvGHKlE8NGg16b4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lTyNMKwqoDSUGlXbFwtlDNiOjsx6vcHXEeWk1nuOFz2FzqdLFTUBSLotNEwrNL0Lv
	 z57MThzdsMnHppigUxDOe3tkGRPVFTwswtxjA5rjCHsiYFHM+qlv2H1lC02IKYfuNh
	 cw2EKsgtcN/tPA2rtzrMgLYPudwXCoTmhOY4J5BQ74zCvNjmSQ7hs3UHUnuJAPlEIP
	 JbAiw2frIyaoiMr1kltHNIlDDnyBPJOZf7UEwTG3IX/wJiiUI6X+QKaUlNa/YAQn/A
	 GHuA3LQ2cuQR2VA4NA030/G8Khca7EiZwNwq2BvY3AindO8Djbx9onaoqtszsAnVZE
	 XltAQ309VGUAA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNYTt-004aJx-ML;
	Tue, 17 Dec 2024 14:23:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: [PATCH v2 06/12] KVM: arm64: nv: Accelerate EL0 counter accesses from hypervisor context
Date: Tue, 17 Dec 2024 14:23:14 +0000
Message-Id: <20241217142321.763801-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217142321.763801-1-maz@kernel.org>
References: <20241217142321.763801-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com, gankulkarni@os.amperecomputing.com, chase.conklin@arm.com, eauger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_142330_195080_74A48746 
X-CRM114-Status: GOOD (  10.25  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 51119d58ecff8..ef344bcff09a1 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -324,6 +324,10 @@ static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
 			val = __vcpu_sys_reg(vcpu, CNTP_CVAL_EL0);
 		}
 		break;
+	case SYS_CNTPCT_EL0:
+	case SYS_CNTPCTSS_EL0:
+		val = compute_counter_value(vcpu_hptimer(vcpu));
+		break;
 	case SYS_CNTV_CTL_EL02:
 		val = compute_emulated_cntx_ctl_el0(vcpu, CNTV_CTL_EL0);
 		break;
@@ -342,6 +346,10 @@ static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
 		else
 			val = __vcpu_sys_reg(vcpu, CNTV_CVAL_EL0);
 		break;
+	case SYS_CNTVCT_EL0:
+	case SYS_CNTVCTSS_EL0:
+		val = compute_counter_value(vcpu_hvtimer(vcpu));
+		break;
 	default:
 		return false;
 	}
-- 
2.39.2



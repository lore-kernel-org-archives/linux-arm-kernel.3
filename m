Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E416CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoJ7swGtwRM0siHCm//wnPXlL53poRbNiCUMLyZD9ko=; b=VZIsTlBXsJAk/tpRnUIRmq0nRD
	lWAzy01qYBQWy5HuR2/DLNtEGEWFgE3fPxnvCmricvjAnWMqt3ASLgSstyc2pGMxkmYb1fLBzn84e
	06Fgwjov2Ew+0Cq0kB0IwNHwXxeZqCmfNMXbsr9VGdhNznf46yY+FfS+e4HmNmW4tHiwS3EbO0dBc
	MSVxSmmp9zOM1e0J1OHBSxGR9/5cRiixkyzleMtyWS5JPydZ7HKVgWGx8YuVIKk7fP722fiA2bGeP
	IqcGVd18RkxGpKLfbp3z3hXRtBA3fT/sxKB6euSc8BwcH9+Pl1fgzfTXtZjzi6vAILSkJvliKgRI6
	SI/n/oOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7e6-00000003y2h-4Bzb;
	Mon, 15 Sep 2025 11:45:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dj-00000003xew-1IyD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A61044954;
	Mon, 15 Sep 2025 11:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4395C4CEF7;
	Mon, 15 Sep 2025 11:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936698;
	bh=CHEV3kfdyE9wl1c6Ioc5A3Xa8u3LcRzauHlZkqmRQec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fqORv/OszNbkJa8rPhzpfQEN2avWdu6FOQLyCfA59ujY0NorbZ1/w4IxRDBCshbfF
	 1ZhTOD9VsHF6GPufnZb+tls3hHPEd5KjI6D/0ECazoXPzLgYB3Au2hdb7/+tJlOHKC
	 GoJO2sPyQLYaj3gSc7GBA4TJTqElZbdWKYgUaLk03gg0gIBvjE4HxGQ2WaIl+uqMPJ
	 I0phfSdpbT+7t+qMwsUqEaOyq0R/AiRNHOBSyQdq/e3domzQ+qXP7ZSQwGefisI0pT
	 ouP0uU6mDXoBsfm0qG9kXnUF/Y+iE1uh8qd1YrRYq8th84/d4T5+w0GlHHfhUDEkny
	 p+Y/7d9ci7RQQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7dh-00000006MDw-0OlV;
	Mon, 15 Sep 2025 11:44:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 11/16] KVM: arm64: Allow EL1 control registers to be accessed from the CPU state
Date: Mon, 15 Sep 2025 12:44:46 +0100
Message-Id: <20250915114451.660351-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_044459_367627_4B2B631B 
X-CRM114-Status: GOOD (  13.68  )
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

As we are about to plug the SW PTW into the EL1-only code, we can
no longer assume that the EL1 state is not resident on the CPU,
as we don't necessarily get there from EL2 traps.

Turn the __vcpu_sys_reg() access on the EL1 state into calls to
the vcpu_read_sys_reg() helper, which is guaranteed to do the
right thing.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 4f6686f59d1c4..c84a021067daf 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -110,7 +110,7 @@ static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
 	case TR_EL10:
 		return ((!vcpu_has_nv(vcpu) ||
 			 (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En)) &&
-			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE));
+			(vcpu_read_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE));
 	default:
 		BUG();
 	}
@@ -139,7 +139,7 @@ static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
 			return;
 		}
 
-		val = __vcpu_sys_reg(vcpu, TCR2_EL1);
+		val = vcpu_read_sys_reg(vcpu, TCR2_EL1);
 		wi->poe = val & TCR2_EL1_POE;
 		wi->e0poe = val & TCR2_EL1_E0POE;
 	}
@@ -965,7 +965,7 @@ static void compute_s1_direct_permissions(struct kvm_vcpu *vcpu,
 		wxn = (vcpu_read_sys_reg(vcpu, SCTLR_EL2) & SCTLR_ELx_WXN);
 		break;
 	case TR_EL10:
-		wxn = (__vcpu_sys_reg(vcpu, SCTLR_EL1) & SCTLR_ELx_WXN);
+		wxn = (vcpu_read_sys_reg(vcpu, SCTLR_EL1) & SCTLR_ELx_WXN);
 		break;
 	}
 
-- 
2.39.2



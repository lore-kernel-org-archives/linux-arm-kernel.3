Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF6DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QDnXlfYA3D/MAmQPMqMMqRQID9HANY5JMVEFQEs9wI=; b=ULxu/TP+gGF86+mEBscbLBNo7g
	A2sIWgvBKuaxUSD8w8xeL3iE/4yfa/koQ81X5dCrU4F3VpBG0KdygGpIYXijx2771KT7ZpV0Cf+Y8
	ulpUM/vYRpu50x3jrY+TAgHujmKGIoXyUf5C13MkM0cNjj9bPVn8KJKNh4k1RBbEnu/5kM+zMmNtc
	nl3nCAGcgLJQpgsZhsOq0AzCLTZDVoSNrFbmGDHIH85If4g1Yavk0R9O1GCkvR9qiyM1Y0nsfBf3s
	l1IV7Nk9u+35k5Y6IILnUVljFAFrxMKzBFZVXQLFlLk4o7vndh88Ug0ln0JCj/5fxGnNaRDrT8Pff
	UReQOqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZPH-0000000DwP0-45UG;
	Tue, 17 Dec 2024 15:22:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZGw-0000000DuSg-2qAY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2807EA41A13;
	Tue, 17 Dec 2024 15:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA35CC4CED4;
	Tue, 17 Dec 2024 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448445;
	bh=nAC/ZkuhKGWosTuXH8V3vBlUw/qX7PIayXIp2unPRDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=keTNWfmXU5FtOFoDqddSiv5RaJXt7OHHzduAZSX92XJiAmRjVQ/rGl36HDAi4b1t3
	 qJRjuGFRAzHK4SCFpeizVNp+diqg9SQgKxwXUbi91leC+qvCIlPZ7JolYdarrS6ddo
	 hik7MQSIQY6dviIwkk3hazEmmE6wvigjnjhm2+SiOjgXQ1Ui16NwDnTtl1O4s3OKrb
	 W7o+9DPCAIlQpC1gj+XGZNC31SoHG7GSMCfu954sbSFTImmxqkA+YiHf04JiTv/sKD
	 Y4r8yvl/u4Q6zLsCplGiMpsfNxUdXTRY+389yGDvaQBKo7cyd1LwwR6wTzx55r7Zqv
	 za74pDPkna5IQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZGt-004bWV-LV;
	Tue, 17 Dec 2024 15:14:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 06/16] KVM: arm64: nv: Add ICH_*_EL2 registers to vpcu_sysreg
Date: Tue, 17 Dec 2024 15:13:21 +0000
Message-Id: <20241217151331.934077-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217151331.934077-1-maz@kernel.org>
References: <20241217151331.934077-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eauger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071406_819175_2EB076FA 
X-CRM114-Status: UNSURE (   8.14  )
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

FEAT_NV2 comes with a bunch of register-to-memory redirection
involving the ICH_*_EL2 registers (LRs, APRs, VMCR, HCR).

Adds them to the vcpu_sysreg enumeration.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8cc25845b4be3..218047cd0296d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -554,7 +554,33 @@ enum vcpu_sysreg {
 	VNCR(CNTP_CVAL_EL0),
 	VNCR(CNTP_CTL_EL0),
 
+	VNCR(ICH_LR0_EL2),
+	VNCR(ICH_LR1_EL2),
+	VNCR(ICH_LR2_EL2),
+	VNCR(ICH_LR3_EL2),
+	VNCR(ICH_LR4_EL2),
+	VNCR(ICH_LR5_EL2),
+	VNCR(ICH_LR6_EL2),
+	VNCR(ICH_LR7_EL2),
+	VNCR(ICH_LR8_EL2),
+	VNCR(ICH_LR9_EL2),
+	VNCR(ICH_LR10_EL2),
+	VNCR(ICH_LR11_EL2),
+	VNCR(ICH_LR12_EL2),
+	VNCR(ICH_LR13_EL2),
+	VNCR(ICH_LR14_EL2),
+	VNCR(ICH_LR15_EL2),
+
+	VNCR(ICH_AP0R0_EL2),
+	VNCR(ICH_AP0R1_EL2),
+	VNCR(ICH_AP0R2_EL2),
+	VNCR(ICH_AP0R3_EL2),
+	VNCR(ICH_AP1R0_EL2),
+	VNCR(ICH_AP1R1_EL2),
+	VNCR(ICH_AP1R2_EL2),
+	VNCR(ICH_AP1R3_EL2),
 	VNCR(ICH_HCR_EL2),
+	VNCR(ICH_VMCR_EL2),
 
 	NR_SYS_REGS	/* Nothing after this line! */
 };
-- 
2.39.2



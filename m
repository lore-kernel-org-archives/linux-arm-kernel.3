Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64D2C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hr1wlHQ+lXaQ4+99lgKNPbOf0JmqJw/ZHSxqdqn5tUA=; b=cV6GHHLJVULDHnavUUKGp1xXsa
	QNKyUNb9FDmm9JOUyWdo7+jXK5Bo5kHwGp418lYOcspye9PskCLNnv8K9jctmPxTAUcDvYa1MzC/y
	LXv39Ly4MEAAhCNOMObCtHDlxPqOTbN3FMKbgpG1UnNvIaUOq2B4dqOx8vPD8qF20kF01y44v968P
	WPIEVVAqCfyd7o3GTmuHCt5zfn49Kg+rDVz8VxszDw0Oxoh5Mhf4OQc8CYm/kXsU2vT5NDnzQuSYj
	c79qDgXIhXEfHdVWm3pZWzqy1bWTgelayuUxfww8YTIx8DFUZE3CfwwhlG0ZjcS+wuQlfLeLy1Dtr
	nqobF+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIb5-00000002CYh-0vJt;
	Mon, 14 Jul 2025 12:47:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGb-000000029iz-10RI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A19B5C5E77;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3A2C4CEED;
	Mon, 14 Jul 2025 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496004;
	bh=ncwASAA1qi99xaHllmrz6NR9vRZXa0OXO/G8CF9AaoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SkjN7X8lo/gUYjopp59OGVBV5OTYpP6g/nojuQ/EmEgJOt5mwhl+qccDIrpWMqo4L
	 bobBG+h4fu7rVhecD+De3hwcF31M2VRVGoAlNNOwtiR3V/vGmXm/WjQ1IPpxyilevm
	 y5Z4dInppH7HI8yR/2nCMlv7+GzrC06E7+ufXeaHo52yNrzLPXAsKy+Mr1HIQ1sZB+
	 0kQkVtGVBzrPIuolUax1AlVbr5V4/uVRzMsqK+x7oxyxj+l+E5mYXuyh1dUwyFW4rx
	 R/GHkKM5ACGJ93H18ZP/lMHAv4jU/vJlPIeR7zlKyrILcp4ZFWrX0hLq7HMQMZ0BLb
	 JxO8kCVm8pJDg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGY-00FW7V-JG;
	Mon, 14 Jul 2025 13:26:42 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 05/11] KVM: arm64: Let GICv3 save/restore honor visibility attribute
Date: Mon, 14 Jul 2025 13:26:28 +0100
Message-Id: <20250714122634.3334816-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714122634.3334816-1-maz@kernel.org>
References: <20250714122634.3334816-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_052645_320858_2C3044D8 
X-CRM114-Status: GOOD (  11.26  )
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

The GICv3 save/restore code never needed any visibility attribute,
but that's about to change. Make vgic_v3_has_cpu_sysregs_attr()
check the visibility in case a register is hidden.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic-sys-reg-v3.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic-sys-reg-v3.c b/arch/arm64/kvm/vgic-sys-reg-v3.c
index 5eacb4b3250a1..6f40225c4a3ff 100644
--- a/arch/arm64/kvm/vgic-sys-reg-v3.c
+++ b/arch/arm64/kvm/vgic-sys-reg-v3.c
@@ -341,8 +341,12 @@ static u64 attr_to_id(u64 attr)
 
 int vgic_v3_has_cpu_sysregs_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 {
-	if (get_reg_by_id(attr_to_id(attr->attr), gic_v3_icc_reg_descs,
-			  ARRAY_SIZE(gic_v3_icc_reg_descs)))
+	const struct sys_reg_desc *r;
+
+	r = get_reg_by_id(attr_to_id(attr->attr), gic_v3_icc_reg_descs,
+			  ARRAY_SIZE(gic_v3_icc_reg_descs));
+
+	if (r && !sysreg_hidden(vcpu, r))
 		return 0;
 
 	return -ENXIO;
-- 
2.39.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E30CD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdQpPp2MoHg9tBaiDFbCeeRZQ0f811blbdA5CVHPU1Q=; b=0fl1TVG0rtQwPB1XNkWJQNakDw
	pyyAsZ2ryjp94wXAIAhYeCqmQowUm1cpKcrR4qH7LZG+SAs8lEa++FV64Ga3ZVsRmp0t18TWyRKu6
	+a1BLdgusLywRX5kbNiYTlVUwZ6str/GrSX+scp9dK9T6m9wweC/KuY5ROHiU77QxbrnW64HeUOeO
	JmW/42jGFaZGOeRV2Cw4A03UUHGLdSUXzqWHdM/qPLAYcWj6Jg0Hzo/h8kZ+M5OApVWL9TQlBh01k
	UyqREpgMvbyI73liBkUGH191QnemXGF+Dq5+gnrWa1ek2vTSyJAoUbYReqh67XPxuedy9e0YLlVIU
	3vjSb5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd7Q-000000048pa-20Hj;
	Wed, 20 May 2026 09:21:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6a-000000047lR-03t7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qdQpPp2MoHg9tBaiDFbCeeRZQ0f811blbdA5CVHPU1Q=; b=iaNUZTX3VolkN9V3RLlLkbW4XB
	61Q4M3ee9ZOAXNJ0d1lGHEQQLQLgOq2gqXdv6m+xNu9LeawX1nUByPTYMwHZQ5G0cjmG+LIJTMv/G
	Lyh0t7+k6aNzY2zHHYfNIzCH8yX6nbtAG97lRlQOueo9g2Q8ox7FsMHQVD34dy6MfHavkeaV1yOhk
	Dj5RDg4E2Dp1HP0SBt0A8CMKf7yWHZLVNM/L0DYwJYw1/DjdwqGsRnxabMMdPujZgjLhTO6CXs//o
	9fSF161yOjeGiZ1Pst+t3DROEkrTKD7qbhhnPmq5Jv+YodnoMp1faapKMHyJi+B9C3+COEX2nkHIk
	upXhqHKQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6E-0000000GKXh-3HqD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E558940619;
	Wed, 20 May 2026 09:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC8E1F0089D;
	Wed, 20 May 2026 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268814;
	bh=qdQpPp2MoHg9tBaiDFbCeeRZQ0f811blbdA5CVHPU1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M4Eydw2MHLQ6nnrbpkxYc0S/zlpd3CST5tGg8K0HwIEb2TErQyr6VChgzYagjBLiS
	 e8OgriXWXarVffWOi6mlyR/AxBjna4IPc6YnXmODegrxtzlfjwiTsbJpO0tomMn2zI
	 VIcnY1pSdljTD6xcRoJlIgb/NwRp0TKNshUISk2rIDs/pJpCIhbcpLJAbqMC2fV2kl
	 WbgFGNLNOKmEEAmeT+QGc1jp883/iq0JBeIWTODgZpwyFfqHccITUNp/wh+4DI+1Qz
	 REpj3o+BHe7v7Y3RueyUXo8RafMGE+iMStdQh63VRwJhUHonOY71Hrq2TnVQJFTyVK
	 RUKZXDTAAHBKQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd65-00000004IaV-0Xgc;
	Wed, 20 May 2026 09:20:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 14/18] KVM: arm64: selftests: Improve error handling for GICv5 PPI selftest
Date: Wed, 20 May 2026 10:19:45 +0100
Message-ID: <20260520091949.542365-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102036_619271_D6BD9C79 
X-CRM114-Status: GOOD (  12.62  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

Cases where the KVM_RUN ioctl returned an error were wrongly reported
as incorrect ucalls. Furthermore, potential failures when calling
KVM_IRQ_LINE were being hidden.

Improve the error handling to correctly propagate the error in both
cases.

Fixes: 0a9f38bf612b ("KVM: arm64: selftests: Introduce a minimal GICv5 PPI selftest")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_v5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_v5.c b/tools/testing/selftests/kvm/arm64/vgic_v5.c
index a8707120de0d8..96cfd6bb32f6f 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_v5.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_v5.c
@@ -129,6 +129,8 @@ static void test_vgic_v5_ppis(u32 gic_dev_type)
 
 	while (1) {
 		ret = run_vcpu(vcpus[0]);
+		if (ret)
+			break;
 
 		switch (get_ucall(vcpus[0], &uc)) {
 		case UCALL_SYNC:
@@ -144,7 +146,7 @@ static void test_vgic_v5_ppis(u32 gic_dev_type)
 				irq = FIELD_PREP(KVM_ARM_IRQ_NUM_MASK, 3);
 				irq |= KVM_ARM_IRQ_TYPE_PPI << KVM_ARM_IRQ_TYPE_SHIFT;
 
-				_kvm_irq_line(v.vm, irq, level);
+				kvm_irq_line(v.vm, irq, level);
 			} else if (uc.args[1] == GUEST_CMD_IS_AWAKE) {
 				pr_info("Guest skipping WFI due to pending IRQ\n");
 			} else if (uc.args[1] == GUEST_CMD_IRQ_CDIA) {
-- 
2.47.3



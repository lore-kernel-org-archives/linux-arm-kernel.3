Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4755FD5B14E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/zims3P8invqGHwLVGcnmHL1KJkD7t3F38qfP9tcw8=; b=JFm6vHBN27zMfzYS1GUzNrjLio
	BJ061h5z8mkUpOvA4h33mwV9Lrp+0Wpz9KOad4rPqR+hNxJjZcbAHYSLwZ8jwnMOazCPpdF0rPUdM
	W6OwoABR9OrdhVj90izRAa4WxmCpdTi4UDVOxRce/El8+I1G5k01PQoYwOUc4N+mg4CKiPCh09Crr
	21NlPZWOXzZPGhIIUMmEWaeTHu4pke4h1k8Sj47eQBy94o/58pcBzZ3oouN2upecKPTdvWqbQn2az
	/TBWeVBZFw1zcnSlWLIUqc61HN2SqPU4z4w3jdpsW+Mp//Ew32CMSLoS88nhb4pLZC6gb/hdDR4FN
	lMtqLv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Wz7-0000000CIEn-2nqe;
	Mon, 28 Oct 2024 21:09:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WK9-0000000C9dd-1EsL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:26:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B164E5C5752;
	Mon, 28 Oct 2024 20:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABB6C4CEC3;
	Mon, 28 Oct 2024 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147208;
	bh=2mKXsQoc2fyKgSSWiRx7xITP+IRuxdOT5z6VLLnJRWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uZW5JlPa7Jf2Wi3UPnwob95dwUa+Yymhul5OdBj6Jaozp7ACx+rU6qXevUuXntaja
	 0I5tOq9S65apVsPbmdkc3sJ1Qjg9EegHskEzAzCAMU/wbiqnD53G9DM+ef81rEhzJS
	 0XYUYQr6vfpCcjix9vwsrIKiXZTqYJTZGMli8RRGHxSm4x8hEZmX4M9iA+duNZGQ92
	 wZIBDC4RLI3n0nahstbxzXduQ04uFXui6z56bxpWoU7zzL3ZizuARfhggcS/h/r5h5
	 3EHndF1XZok9TYL9vUzwTXxx+ekrhsqa2njRfz1v7xab4gGcnIuxxtD5yttPD+mfGG
	 s00lWU7T6ngHw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 28 Oct 2024 20:24:17 +0000
Subject: [PATCH 8/9] KVM: arm64: Allow control of dpISA extensions in
 ID_AA64ISAR3_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-arm64-2024-dpisa-v1-8-a38d08b008a8@kernel.org>
References: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
In-Reply-To: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2mKXsQoc2fyKgSSWiRx7xITP+IRuxdOT5z6VLLnJRWs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnH/NrEBfq3hDnWISMfuy4nvcRlrxy6aWqNbzOnn1T
 Kfy2OBSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZx/zawAKCRAk1otyXVSH0PdhB/
 9hTgKJ81Iz+V9IlwBdnwA6n7okQi6Zkf3YceGZAfaWEzc7Y6xHwFw2JVNh/ABB/IoKkf/WaHxkJh+6
 SNGR63vWc7mN+r+9841M3YFAcusp3GEtRqvnqdtskMuRPRjBaqIOQvHT5xG/Pnn9RwwXWUf1DPttMf
 R1RvASwTi10oTmgEBV1NNxy9YKE437SbDmuK9Egwu0KhGlrEyy9gLrGP5TjjIG2SVT0NgozdP9Q5lL
 yEejpuvKl7L4GU8MCAYdLYpwyD1x/mJr8O+Mwks7lrVTO719nTMfyOseVCmdgtibLykpKbf3zVzcFZ
 Trs8CeDtjWaRe2pZn8DCmXmQy+98CV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132649_435056_BAF379DD 
X-CRM114-Status: GOOD (  10.12  )
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

ID_AA64ISAR3_EL1 is currently marked as unallocated in KVM but does have a
number of bitfields defined in it. Expose FPRCVT and FAMINMAX, two simple
instruction only extensions to guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index dad88e31f9537fe02e28b117d6a740f15572e0ba..ab348c314d7963437e1876d441169f3ef4eff095 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2409,7 +2409,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	ID_WRITABLE(ID_AA64ISAR2_EL1, ~(ID_AA64ISAR2_EL1_RES0 |
 					ID_AA64ISAR2_EL1_APA3 |
 					ID_AA64ISAR2_EL1_GPA3)),
-	ID_UNALLOCATED(6,3),
+	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
+				       ID_AA64ISAR3_EL1_FAMINMAX)),
 	ID_UNALLOCATED(6,4),
 	ID_UNALLOCATED(6,5),
 	ID_UNALLOCATED(6,6),

-- 
2.39.2



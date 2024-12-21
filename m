Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59187E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mbfWvIV/gNsyI4jXGAbrdS99lq+1T4mdZ96KkmFYBEY=; b=LAJvcQqbnA8YgaCJwOxJU/RqwQ
	yFiE563TJ9Bje34MmQiJE//CbPwnJoUr8ugc0iHqEB3YwjvXym5iiZaD5GlRJUQ0KUseWmQcKBHLe
	z6pt41QbnS8t/4bNk52rPriOanVkSyyFj9ciFsoouZhHcjG5/NwCV70vHG+nDnkesyiMnDUZgEqZn
	hE716v3Cf3Jmm+e3GWKiJn5/AT6+JMtIjYc95cwjeqjNET0cH+7tUgJ41seZoJ3g53hFxu7VmjEkX
	2MIjWE7YIUD6ehV2VGYWaBriFQJTIEiyKpqt6pw7R2U/M3xK9+7vFs/kRik2U8nW+LE4nK2zI0but
	jEP4kq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOwTg-00000006qfe-1XCw;
	Sat, 21 Dec 2024 10:12:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOwSV-00000006qdu-31qw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 10:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 939205C482B;
	Sat, 21 Dec 2024 10:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38644C4CECE;
	Sat, 21 Dec 2024 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734775902;
	bh=xzpT8hoPYLrSd2qWAi+MnXMlOGItQbvM/3WULduMWHo=;
	h=From:To:Cc:Subject:Date:From;
	b=rklfxOqJLniLvs7bV2uYS3s05Gt39wdZXU0u2bT1aR5YumutIjxvEnDa/PMUc1ppy
	 qO+9ZI6jog5UmiMvnRFCXQuqfSyvQwZbc9S6timb91xZ7meQ+tiM3bUKvNoYgZpm5o
	 PPn9Vs6o4i4j4XmGA8+o0PZspf5iP9gyReJuiZ1qUrmg2Iwz57jngbSAcOYFcV8cPB
	 OVfXboo5KSBGdqcImoBUymZpSWcccbFhPA7C+IRB4Os+6/kr739laz2P+WHcEhdYSB
	 I7OqbG0/ZxDEQdiD+esPmqKxabekiXfmCNZRYxsN6A347BhTKk9k+RfHSd06nuiX87
	 wzpEOhbe5fxiw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOwSR-005uEf-S6;
	Sat, 21 Dec 2024 10:11:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: nv: Advertise the lack of AArch32 EL0 support
Date: Sat, 21 Dec 2024 10:11:37 +0000
Message-Id: <20241221101137.1405271-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_021143_817065_85B38CC1 
X-CRM114-Status: UNSURE (   9.98  )
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

Although we never supported 32bit anywhere in NV, we fail to
advertise so for EL0, probably owing to the relative lack of
hardware supporting both NV2 and 32bit EL0.

Add some sanitising to ID_AA64PFR0_EL1.EL0, and reaffirm that
"in 64bit-only we trust".

Reported-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 9b36218b48def..9e74f7b38e056 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -830,8 +830,10 @@ static void limit_nv_id_regs(struct kvm *kvm)
 		 NV_FTR(PFR0, RAS)	|
 		 NV_FTR(PFR0, EL3)	|
 		 NV_FTR(PFR0, EL2)	|
-		 NV_FTR(PFR0, EL1));
-	/* 64bit EL1/EL2/EL3 only */
+		 NV_FTR(PFR0, EL1)	|
+		 NV_FTR(PFR0, EL0));
+	/* 64bit only at any EL */
+	val |= FIELD_PREP(NV_FTR(PFR0, EL0), 0b0001);
 	val |= FIELD_PREP(NV_FTR(PFR0, EL1), 0b0001);
 	val |= FIELD_PREP(NV_FTR(PFR0, EL2), 0b0001);
 	val |= FIELD_PREP(NV_FTR(PFR0, EL3), 0b0001);
-- 
2.39.2



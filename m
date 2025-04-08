Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264D7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPgGiBFAX70unZaYouOMrE/S/CJ8oTuGZe8qicAjMCE=; b=b7aWz+jjrJ+ANbeRQzfIu/88Xb
	szR0tkkOfqcJAjnC5zaWYY8z74yjtC+/PzgJpqYutpYCTxt1SQX9oCfL7o4vfdYJtyfz3DfBJrNrS
	NVzs402vKOVCeimIRHmQtg/ldK8rJoWxq+nrvC2hdVz7s/ydWPYdDZ/QC0/UC+poWGfbwXtuI8fiz
	7yRlsqDYNzXulmYIGVYxJoTQzblNMhl4dAYiR1H56bJ4BrSSmbrGlROL1hNGRqvD/mRJPKfXbHM5x
	2evMF8qoSO/XdyMVSJIhCC03DEWYTE3NwtbmWfj2l1ucB/PnIh+/qbQDtCVrryWV2xeByCBH7PZsp
	HDPy9uAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27DY-00000003rPd-0NZt;
	Tue, 08 Apr 2025 11:34:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26YB-00000003kFM-0rmp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0C9D614AB;
	Tue,  8 Apr 2025 10:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403E1C4CEE5;
	Tue,  8 Apr 2025 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109486;
	bh=IR60XZsATfdTuIxQzwSdrYf53KWRtcmnuEgRG5+wtmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XfGxKLEYSTFLNm/CA7KfzyvK/2GTBl7eTIjUsfsLnCTE7IRLm0uc1JLHyqW0111Ib
	 nDZ5aGuYRrlZ/tDFPObh11a2EBWSJnIgTnIN6oi+5XcqntkJDHRikD1pt8e9DCsUS7
	 XAyEhvjlVO9kNHHTg3eO5MTyXUfboQK3myXNF8adm1elJBtH/MvuEFEuhIwK/Elz4u
	 YWMpGLZ9GQLP8lSWArA7QVjYkrqaY2TO6xOJK6EGwtJDztjuKhuET3IipBUR+BE2uB
	 mMulOxb1+pnnu3k8Rwn8h4zXXibl35utBr+j8XEP6TkJnRocOWfZflvXMmWQkM15kM
	 w5G3F4w6l96MA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:09 +0200
Subject: [PATCH 10/24] arm64/sysreg: Add ICC_PCR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-10-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
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

Add ICC_PCR_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c96243505031ea680c04a693fee2c96ad19e30ea..9a2ddab8661c85586b0e91f7eaabd5a6b3409c67 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2806,6 +2806,11 @@ Res0	31:1
 Field	0	EN
 EndSysreg
 
+Sysreg	ICC_PCR_EL1	3	1	12	0	2
+Res0	63:5
+Field	4:0	PRIORITY
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0


